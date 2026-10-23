# AlanUI — Whitepaper técnico

**Versión documentada:** 2.12.5 · **Autor:** @alanbeikersFFXD · **Formato de distribución:** un solo archivo Lua

> **Cómo leer este documento.** Cada afirmación de las secciones 3 a 6 se comprobó contra el código de `AlanUI.lua` (v2.12.5, unas 12.000 líneas) o contra las mediciones de la sección 5. Lo que **no** está implementado figura en la sección 8 como idea, decisión de diseño o trabajo en curso, y no se presenta como característica. Los números de rendimiento salen de pruebas reales, con el dispositivo y las condiciones indicadas.

---

## Índice

1. [Qué es AlanUI](#1-qué-es-alanui)
2. [Filosofía y reglas de diseño](#2-filosofía-y-reglas-de-diseño)
3. [Características únicas](#3-características-únicas)
4. [Ventajas](#4-ventajas)
5. [Rendimiento medido](#5-rendimiento-medido)
6. [Arquitectura](#6-arquitectura)
7. [Experiencia de desarrollo](#7-experiencia-de-desarrollo)
8. [Hoja de ruta y decisiones de diseño](#8-hoja-de-ruta-y-decisiones-de-diseño)
9. [Preguntas frecuentes](#9-preguntas-frecuentes)
10. [Compatibilidad de ejecutores](#10-compatibilidad-de-ejecutores)
11. [Capturas](#11-capturas)
12. [Créditos](#12-créditos)
13. [Apéndices](#13-apéndices)

---

## 1. Qué es AlanUI

AlanUI es una librería de interfaces gráficas para scripts de Roblox. Se entrega como **un único archivo Lua sin dependencias externas** y ofrece:

| Elemento | Cantidad / detalle |
|---|---|
| Archivo | 1 (`AlanUI.lua`), unas 12.000 líneas |
| Controles | 18 tipos: `Boton`, `Toggle`, `Casilla`, `Slider`, `RangeSlider`, `NumberStepper`, `Input`, `TagInput`, `Dropdown`, `RadioGroup`, `ColorPicker`, `Keybind`, `Label`, `Progreso`, `Parrafo`, `Divider`, `Imagen`, `Grupo` |
| Organizadores | `Columnas`, `Construir` y `ConstruirDesdeSchema` (interfaz completa a partir de una tabla) |
| Temas | 5 incluidos (Negro, Blanco, Verde, Morado, Rojo) y `AgregarTema` para los propios |
| Persistencia | Dos sistemas independientes: perfiles del script y ajustes de la interfaz |
| Pestaña de sistema | "Preinstalada", con 7 secciones, agregada automáticamente |

Uso mínimo:

```lua
local AlanUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/alanbeikers9/AlanUI/main/AlanUI.lua"))()

local Ventana = AlanUI:CrearVentana({
    Titulo = "Mi Script",
    NombreConfig = "MiScript",
})

local Tab = Ventana:CrearTab("Principal", "🏠")
local Sec = Tab:CrearSeccion("General")

Sec:Toggle({ Texto = "Activar", Flag = "activo", Defecto = false,
    Callback = function(estado) print(estado) end })
```

---

## 2. Filosofía y reglas de diseño

### 2.1 El orden de prioridad

La cabecera del archivo declara este orden:

**Compatibilidad > Rendimiento > Simplicidad > Diseño**

No es un eslogan, es un filtro que se aplica a cada cambio, en ese orden:

- Si algo mejora el diseño pero empeora la compatibilidad, se rechaza o se rediseña.
- Si mejora el rendimiento pero complica el código sin necesidad, se rechaza o se factoriza.
- Si exige una función que no todos los ejecutores tienen, no entra.

### 2.2 Por qué existe

Muchas librerías de interfaz priorizan verse bien y fallan en dispositivos modestos, en celulares, o al re-ejecutar el script. AlanUI se diseñó al revés: primero que funcione en cualquier ejecutor, después que sea ligera, después que sea simple de usar y, por último, que se vea bien.

### 2.3 Reglas duras

Estas reglas se aplican a cada cambio de la librería:

1. **La API pública no se rompe.** Todo cambio es aditivo: campos opcionales nuevos, métodos nuevos, alias.
2. **Toda función nueva va detrás de `AlanUI.Opciones.*`**, con un valor por defecto que conserva el comportamiento anterior.
3. **Toda conexión pasa por `AlanUI:RegistrarConexion` y todo hilo por `AlanUI:RegistrarHilo`.** Así la auto-limpieza los encuentra.
4. **Toda animación pasa por `Utils.Tween` y `AlanUI.Motion.*`.** Sin números sueltos.
5. **Todo acceso a funciones del ejecutor va en `pcall`** (`gethui`, `writefile`, `Drawing`, etc.).
6. **Sin efectos que cuesten rendimiento.** No hay `Heartbeat` ni `RenderStepped` por control, no hay `CanvasGroup` (se usa `UIScale` por compatibilidad con Android) y no se escribe a disco fuera del ciclo de autoguardado o de un botón manual.
7. **Los controles existen desde que se crea la ventana.** No hay carga diferida de pestañas ni de controles: cambiaría el contrato observable y rompería buscador, autoguardado, `ObtenerElemento`, keybinds e historial.
8. **Los dos sistemas de guardado nunca se mezclan.**
9. **Los cambios se registran en el README, no como comentarios en el código.** El código describe lo que hace hoy.

---

## 3. Características únicas

### 3.1 Persistencia nativa con dos sistemas separados

| Sistema | Qué guarda | Carpeta | Métodos |
|---|---|---|---|
| **Perfiles del script** | Los flags de tus controles (toggles, sliders, etc.) | `AlanUI/Config` | `Guardar`, `Cargar`, `Listar`, `Eliminar`, `Duplicar`, `Renombrar`, `Exportar`, `Importar` (y variantes `Silencioso`) |
| **Ajustes de la interfaz** | Tema, tamaños y demás ajustes de la Preinstalada | `AlanUI/Config/_ui` | `GuardarUI`, `CargarUI`, `ListarUI`, `EliminarUI` |

Los flags de la interfaz nunca entran en los perfiles, ni los de los perfiles en la interfaz. La posición de la ventana se guarda aparte, en `AlanUI/Config/_ui/posicion_<NombreConfig>.json`.

**Autoguardado cuidadoso:**
- Escribe como máximo una vez cada 10 segundos, y solo si hubo cambios reales.
- Mientras se **carga** un archivo, restaurar los flags no cuenta como cambio. Sin esta protección, cargar 30 flags dispararía un guardado inmediato que reescribiría el mismo archivo.
- Si el ejecutor no soporta archivos, el guardado se desactiva y se avisa al usuario **una sola vez**, sin lanzar errores.

### 3.2 Auto-limpieza

Cada conexión y cada hilo de la librería se registra en un registro propio de la instancia. Al destruir la ventana, o al **re-ejecutar el script**, la librería desconecta todo, cancela los hilos y limpia lo que dejó la ejecución anterior.

En la prueba de estrés de la sección 5, con casi 9.000 conexiones registradas, todas seguían vivas durante el uso y su número era predecible (5 por control simple), sin crecimiento inesperado.

### 3.3 `AlanUI.Flags` como proxy

`AlanUI.Flags` se lee como una tabla normal, pero **toda escritura** pasa por un proxy: si el valor cambió, marca que hay cambios pendientes (para el autoguardado) y dispara `AlanUI.Eventos.FlagCambiada`. Si el valor es igual al que ya había, no hace nada. Esto cubre todos los controles con un único punto, sin tocar cada uno.

### 3.4 Lock y Highlight

Funciones nativas de los controles:
- **`Lock` / `Unlock`**: bloquean un control con una capa visual y un mensaje opcional (por ejemplo, "Requiere Premium").
- **`Highlight`**: hace que un control destaque temporalmente para llamar la atención del usuario.

### 3.5 Diseñada para celulares

- **Áreas de toque ampliadas** de forma invisible, para que los botones pequeños se puedan tocar bien sin agrandarlos.
- **Gestos de slider** que distinguen entre arrastrar el valor y desplazar la página (en táctil, el slider espera a ver el gesto antes de capturar).
- **Tooltips por mantener presionado** en las filas, además del botón "?".
- **Texto que se ajusta** al ancho disponible en vez de cortarse.
- **Escala de la interfaz y escala del texto independientes**, configurables desde la Preinstalada.
- **Detección del entorno** (`PC`, `Movil`, `Tablet`, `Consola`, `Studio`), con `ForzarTipo` para probar y el evento `TipoCambiado` cuando cambia (por ejemplo al rotar la pantalla).

### 3.6 Detección de capacidades

En vez de asumir, la librería mide lo que ofrece el ejecutor y expone el resultado en `AlanUI.Capacidades` y `AlanUI.Features`: archivos, `Drawing`, `ProtectGUI`, `gethui`, teclado físico, gamepad. Cada función que depende de algo opcional se degrada con elegancia si no está. Además, si `task.*` no existe en un ejecutor muy limitado, la librería lo rellena con las funciones clásicas para no caerse en la primera línea.

### 3.7 Construcción flexible

- `ConstruirDesdeSchema` genera una interfaz completa desde una tabla de Lua, útil para configuraciones dinámicas.
- `Columnas` y `Grupo` organizan controles en el espacio.
- Búsqueda global con retardo (debounce) integrada.
- Orientación vertical (barra lateral) u horizontal (barra superior), cambiable en ejecución con `Ventana:CambiarOrientacion`.

### 3.8 Temas dinámicos

Cinco temas incluidos y `AgregarTema(nombre, tabla)` para crear los propios. Al cambiar de tema, los colores de la página visible se animan. Los bordes admiten color, degradado y animación. El evento `TemaCambiado` permite reaccionar. Una opción (`BordeAdaptativo`, apagada por defecto) ajusta la transparencia de los bordes según la luminosidad del fondo.

### 3.9 Pestaña Preinstalada

Se agrega sola al crear la ventana (se puede quitar con `PestanaPreinstalada = false`) y trae 7 secciones: **Información** (ejecutor, versión, FPS, tiempo de frame, memoria aproximada y estado de salud), **Diagnóstico del entorno**, **Apariencia**, **Configuración**, **Perfiles**, **Historial** y **Atajos**.

### 3.10 Notificaciones y modales

- `AlanUI:Notificar` muestra tarjetas animadas en cola cuando llegan varias a la vez.
- `AlanUI:Confirmar` y `AlanUI:Dialogo` muestran ventanas modales con animación de entrada.

---

## 4. Ventajas

### 4.1 Resistencia a errores

- **Los callbacks no tumban la interfaz.** Cada callback que escribes corre dentro de un `pcall`. Si falla, la librería muestra una notificación con el error, lo guarda en un registro consultable con `AlanUI:ObtenerErrores()` y el script sigue funcionando.
- **Validación de lo que le pasas.** Si pasas un `Callback` que no es una función, lo ignora y avisa por consola. Si en un `Slider`, `RangeSlider` o `NumberStepper` el `Min` es mayor o igual al `Max`, ajusta el `Max` y avisa por consola, en lugar de fallar.
- **Cargar un perfil dañado no rompe nada.** El JSON se decodifica protegido, y cada valor se aplica por separado: un valor inválido no impide cargar los demás.

### 4.2 Rendimiento por diseño

- **Un solo `Heartbeat`** para todos los labels que se actualizan solos, no uno por label. En total la librería tiene dos conexiones a `Heartbeat`: ese y el contador de FPS de la Preinstalada.
- **Un solo `InputChanged` global**, administrado por el `EventManager`.
- **Animación centralizada.** Toda animación pasa por `Utils.Tween` y por `AlanUI.Motion`, así que el ritmo de toda la interfaz se ajusta en un solo lugar. Los tweens corren en el motor de Roblox, sin bucles manuales por control.
- **`UIScale` en lugar de `CanvasGroup`** para animar transparencia y escala, por compatibilidad con Android.

### 4.3 Animaciones coherentes

La interfaz usa curvas de aceleración definidas (por ejemplo `EasePop`, `EaseEntrar`) y una filosofía de más fases en lugar de más duración: las transiciones se sienten fluidas sin hacer esperar al usuario.

### 4.4 Modularidad

El mismo código sirve para un hub de diez pestañas o para un script con un solo toggle. La API se adapta sin reescribir nada, y la pestaña Preinstalada, la búsqueda y el autoguardado se pueden desactivar con una opción.

---

## 5. Rendimiento medido

Las pruebas se hicieron con el benchmark incluido en la vitrina de la librería, en un **Samsung Galaxy S23 (Android) con el ejecutor Delta**, a 60 FPS (el juego limita el frame a ~16,7 ms). Con ese límite, el reposo no puede mostrar cuánto margen queda: por eso se mide también el CPU de cada operación.

### 5.1 Creación de controles

| Medición | Resultado |
|---|---|
| 120 controles (mezcla de 6 tipos) | 151,9 ms de CPU, unos 1,3 ms por control |
| Tiempo hasta que la interfaz se estabiliza | ~250 ms (un tirón inicial de ~150 ms y luego frames normales) |
| 918 controles (18 tipos × 51) | Costo por control casi constante: ningún tipo superó los 2 ms |
| Tipos más caros al crear | `ColorPicker` (1,8 ms), `Grupo` (1,0 ms), `Dropdown` (0,9 ms) |

### 5.2 Uso

| Medición | Resultado |
|---|---|
| Frame en reposo con 120 controles | 16,7 ms, igual que la base sin controles |
| `Set` sobre 60 controles en cada frame | 2,7 ms de CPU por frame (≈ 45 µs por `Set`); el frame se mantiene en 16,7 ms |
| `TagInput:Set` | El más costoso: ≈ 0,45 ms cada uno |
| `Label:Set` | ≈ 0,12 ms (reajusta el texto), frente a ≈ 0,03 ms del `Slider` |

### 5.3 Conexiones y memoria

| Medición | Resultado |
|---|---|
| Conexiones por control simple | 5 (determinista) |
| `NumberStepper`, `Dropdown` | 12 |
| `RadioGroup`, `ColorPicker` | 22 y 24 |
| Con 918 controles | ≈ 8.900 conexiones, todas vivas, sin crecimiento inesperado |
| Memoria con 918 controles | ≈ +190 MB netos (cifra ruidosa: depende del recolector de basura y del motor) |

### 5.4 Límites conocidos

- **El cambio de tema escala con la cantidad de controles de la página visible.** El CPU de `AplicarTema` creció a ≈ 0,083 ms por control (10,7 ms con 51 controles, 76,4 ms con 918). En la prueba extrema —alternar el tema en cada frame con 918 controles en una sola página— el frame llegó a ~1 segundo. Es un uso artificial: un cambio de tema aislado con 100 a 200 controles cuesta menos de 20 ms de CPU.
- **Recomendación práctica:** reparte los controles entre pestañas. Las páginas ocultas se actualizan sin animar.

> **Nota de método.** `os.clock()` mide CPU, no render. Los tiempos de frame salen de `Heartbeat`. Los resultados dependen del ejecutor y del límite de FPS; sirven para comparar antes y después en un mismo equipo, no como valores absolutos.

---

## 6. Arquitectura

### 6.1 Capas

```
AlanUI.lua  (un solo archivo)
├─ 1) Utils          Funciones base: Frame, Texto, Tween, Corner, Hover, tooltips…
├─ 2) Themes         Paletas de color (Negro, Blanco, Verde, Morado, Rojo)
└─ 3) AlanUI         Núcleo
   ├─ Ventana · Tab · Sección · 18 controles
   ├─ EventManager       Entrada global unificada y arrastres
   ├─ AnimationManager   Animaciones y Motion
   ├─ SaveManager        Perfiles y ajustes de la interfaz
   ├─ ThemeManager       Temas y bordes
   └─ Auto-limpieza      RegistrarConexion / RegistrarHilo
```

### 6.2 Eventos públicos

`AlanUI.Eventos`: `FlagCambiada`, `TabCambiada`, `TemaCambiado`, `ControlRegistrado`, `TipoCambiado`, `HistorialCambiado`.

### 6.3 Árbol de archivos en disco

```
workspace/
└─ AlanUI/
   └─ Config/
      ├─ <NombreConfig>.json            ← perfil del script (autoguardado)
      ├─ <otros perfiles>.json
      └─ _ui/
         ├─ <ajustes de la interfaz>.json
         └─ posicion_<NombreConfig>.json
```

### 6.4 Opciones globales (`AlanUI.Opciones`)

Las funciones opcionales viven aquí, con valores por defecto que conservan el comportamiento de siempre:

| Opción | Por defecto | Qué hace |
|---|---|---|
| `BordeAdaptativo` | `false` | Ajusta la transparencia de los bordes según la luminosidad del fondo del tema. |
| `MicroInteracciones` | `false` | La flecha del `Dropdown` y la muestra del `ColorPicker` reaccionan al hover. |
| `ClickDirectoEnBarras` | `true` | Con mouse, un click en la barra de un `Slider` o `RangeSlider` mueve la manija ahí. |

(La lista completa está en el README.)

---

## 7. Experiencia de desarrollo

### 7.1 API directa

Crear un control es una sola llamada con una tabla de opciones:

```lua
Sec:Slider({ Texto = "Velocidad", Flag = "velocidad", Min = 0, Max = 100, Defecto = 50,
    Callback = function(v) print(v) end })
```

### 7.2 Todo acepta dos formas de llamada

Los métodos `Set` aceptan tanto `control.Set(v)` como `control:Set(v)`.

### 7.3 Diagnóstico integrado

- `AlanUI:ObtenerErrores()` devuelve el registro de errores de la librería.
- `AlanUI:DiagnosticoCompleto()` resume el estado del entorno y las capacidades.
- La Preinstalada muestra FPS, tiempo de frame, memoria y un indicador de salud de la interfaz.

### 7.4 Vitrina interactiva

El repositorio incluye una vitrina que ejercita cada control y cada cambio observable, más un benchmark por tipo de control que guarda sus resultados en un archivo de texto.

---

## 8. Hoja de ruta y decisiones de diseño

Esta sección existe para que nadie confunda una idea con una característica.

| Tema | Estado | Detalle |
|---|---|---|
| **Iconos propios** (en lugar de emojis) | En preparación | Los emojis cambian de forma según el ejecutor. Se preparan 26 iconos vectoriales propios, que se cargarán por `rbxassetid` con fallback al emoji. Dependen de que los assets estén subidos y aprobados en Roblox. |
| **Modo mini / acordeón** | Idea, sin implementar | Una interfaz compacta sin barra lateral para scripts simples. Hoy no existe. |
| **Pestaña de complementos** (herramientas externas) | Idea, sin implementar | Cargar herramientas de terceros exigiría un diseño de seguridad propio. No existe y no debe asumirse. |
| **Navegación por teclado / gamepad entre controles** | No existe | `Keybind` captura teclas y botones de gamepad, pero no hay foco ni navegación entre controles. |
| **Carga diferida de pestañas y controles** | Descartada | Cambiaría el momento en que los controles existen y rompería buscador, autoguardado, `ObtenerElemento`, keybinds e historial. |
| **Entrada manual en `RangeSlider`** | Descartada | Con dos manijas no queda claro a cuál se aplicaría el número escrito. |
| **Tokens de diseño centralizados** | Descartada | Reemplazar números sueltos por una tabla es un refactor masivo con riesgo de romper layouts, sin ganancia medible. |

---

## 9. Preguntas frecuentes

**¿Es seguro usarlo con anti-cheats?**
AlanUI no hace nada especial para evitar la detección y no puede garantizar nada al respecto. Lo único que hace es usar `gethui` o `protect_gui` para colocar su interfaz cuando el ejecutor los ofrece. El riesgo depende del ejecutor, del juego y de lo que haga tu script, y lo asume quien lo usa.

**¿Qué pasa si mi ejecutor no soporta archivos?**
La librería detecta si existen `writefile` y `readfile`. Si no, desactiva el guardado y avisa al usuario una sola vez, sin errores. Los ajustes se pierden al cerrar.

**¿Cómo se comporta en un dispositivo lento?**
Las animaciones usan `TweenService`, que corre en el motor de Roblox y no en bucles de Lua. En las pruebas de la sección 5 no hubo degradación del frame en uso normal. Las duraciones salen de `AlanUI.Motion`: puedes acortarlas, o poner `Motion.Directo = 0` para aplicar los cambios sin animación. Algunos efectos decorativos o continuos (el pulso de `Highlight`, la sacudida del bloqueo) se mantienen fijos a propósito.

**¿Cuántos controles soporta?**
Se probaron 918 controles en una sola página sin fallos. El límite práctico lo marcan las operaciones que tocan todos los controles a la vez, como cambiar de tema. Repartirlos en pestañas lo evita.

**¿Puedo cambiar el tamaño de la fuente?**
Sí. En la pestaña Preinstalada hay controles de escala de texto y de escala de interfaz, independientes entre sí.

**¿Qué pasa si dos scripts usan AlanUI al mismo tiempo?**
Cada uno debe definir su propio `NombreConfig`. Si no, ambos guardan en `autosave.json` y se pisan los valores.

**¿Qué pasa si un callback mío falla?**
Se atrapa con `pcall`, se muestra una notificación con el error, queda en `ObtenerErrores()` y la interfaz sigue funcionando.

**¿Cómo se actualiza la documentación?**
Cada cambio queda en la sección "Novedades" del README, en español e inglés, y no como comentarios dentro del código.

---

## 10. Compatibilidad de ejecutores

| Ejecutor | Estado |
|---|---|
| **Delta** (Android) | Probado por el autor (Samsung Galaxy S23) |
| Otros ejecutores | Sin verificar por el autor |

La librería no depende de un ejecutor concreto: detecta lo que ofrece (`AlanUI.Capacidades`) y se degrada si algo falta. Los reportes de compatibilidad de otros ejecutores son bienvenidos.

---

## 11. Capturas

> *Pendiente: agregar capturas de pantalla de:*
> - *La interfaz completa con la barra lateral y con la barra horizontal.*
> - *La pestaña Preinstalada.*
> - *Los temas (Negro, Blanco, Verde, Morado, Rojo).*
> - *Notificaciones y un modal de confirmación.*
> - *Un control bloqueado con `Lock` y uno resaltado con `Highlight`.*

---

## 12. Créditos

- **Autor y mantenedor:** @alanbeikersFFXD
- **Pruebas y reporte de errores:** *(completar)*
- **Revisiones de código y propuestas:** *(completar)*

---

## 13. Apéndices

### A. Referencia rápida de la API pública

- **Ventana:** `CrearTab`, `AgregarSelectorTemas`, `GuardarConfiguracion`, `CargarConfiguracion`, `Buscar`, `CambiarOrientacion`, `ResetearPosicion`, `Destruir`
- **Núcleo:** `CrearVentana`, `Notificar`, `Confirmar`, `Dialogo`, `ObtenerFlag`, `ObtenerElemento`, `ObtenerErrores`, `DiagnosticoCompleto`, `RegistrarConexion`, `RegistrarHilo`
- **Tab:** `CrearSeccion`
- **Controles:** los 18 tipos de la sección 1, además de `Columnas`, `Construir` y `ConstruirDesdeSchema`
- **Tablas públicas:** `AlanUI.Flags`, `AlanUI.Elementos`, `AlanUI.Capacidades`, `AlanUI.Features`, `AlanUI.Motion`, `AlanUI.Opciones`, `AlanUI.Eventos`, `AlanUI.SaveManager`, `AlanUI.ThemeManager`

El detalle completo de parámetros está en el README.

### B. Cómo reproducir las mediciones

1. Carga la vitrina de la librería.
2. Abre la pestaña **Benchmark** y toca **Correr estrés por tipo**.
3. Los resultados se guardan en `AlanUI_Benchmark_Tipos.txt` en la carpeta de trabajo del ejecutor.

### C. Historial de versiones

Cada versión (de la 2.4 a la 2.12.5) está documentada en la sección "Novedades" del README, con su lista de correcciones y funciones nuevas.
