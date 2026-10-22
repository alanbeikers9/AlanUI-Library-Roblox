# 🌟 AlanUI v2.12.5

**Roblox · PC & Mobile · MIT License**

<p align="center">
  <a href="README_en.md">🇬🇧 Read in English</a>
  &nbsp;·&nbsp;
  <a href="#-probar-la-vitrina-interactiva">🎮 Probar la vitrina</a>
</p>

Librería de interfaz para scripts de Roblox, optimizada y pensada para funcionar bien tanto en PC como en móvil. Se construyó siguiendo un orden de prioridades claro:

**Compatibilidad > Rendimiento > Simplicidad > Diseño**

AlanUI está hecha para no generar lag ni siquiera en PCs de gama baja o en celulares, que es donde la mayoría de las librerías pesadas empiezan a fallar.

---

## ⚡ Características principales

* 🚀 **Sin lag y sin memory leaks:** al re-ejecutar tu script, AlanUI detecta y destruye automáticamente cualquier interfaz anterior antes de crear una nueva.
* 📱 **Diseño responsive real:** la interfaz se adapta sola entre pantalla de PC y de celular.
* 💾 **Guardado automático de configuración, en dos sistemas separados:** los ajustes de la propia interfaz (tema, tamaño) y los perfiles de tu script (sliders, toggles, dropdowns) se guardan por separado, sin mezclarse nunca.
* 🔍 **Dropdowns inteligentes:** si un menú desplegable tiene más de 8 opciones, se le agrega automáticamente una barra de búsqueda.
* 🎨 **Sistema de temas nativo:** cambia entre Negro, Blanco, Verde, Morado y Rojo sin configuración extra.
* 🔧 **Pestaña de sistema incluida automáticamente:** cada ventana nace con una pestaña "Preinstalada" (rendimiento, diagnóstico del entorno, tema, tamaño, perfiles, historial de cambios), sin que el desarrollador tenga que llamar nada.
* 🧩 **17 tipos de control:** desde `Toggle`/`Slider`/`Dropdown` hasta `RangeSlider`, `NumberStepper`, `TagInput`, `Imagen` y `Grupo` de botones, más `Seccion:Construir` para armar una sección entera desde una tabla.
* ↩️ **Deshacer / Rehacer global:** todos los cambios de controles se registran solos en un historial (50 pasos), sin que el desarrollador configure nada.
* 🔒 **Bloqueo y resaltado de controles:** cualquier control interactivo se puede bloquear con un motivo visible (`Lock`) o resaltar con un pulso (`Highlight`).

---

## 🆕 Novedades v2.12.5

Ronda de nuevas capacidades de la API. El código de la librería ya las incluía, pero faltaban en este README — ahora están documentadas con sus campos reales (verificados contra el código):

- **Tres controles nuevos:** [`RangeSlider`](#14-rangeslider-slider-de-rango) (rango mínimo-máximo con dos manijas), [`NumberStepper`](#16-numberstepper-contador-numérico) (botones − / + con campo editable) y [`TagInput`](#15-taginput-lista-de-etiquetas) (lista de etiquetas tipo "chips").
- **Dos elementos de layout nuevos:** `Seccion:Imagen` (imagen con relación de aspecto) y `Seccion:Grupo` (varios botones en una misma fila, que pasan a vertical solos si no hay ancho).
- **Construcción por tablas:** `Seccion:Construir(lista)` y `Ventana:ConstruirDesdeSchema(schema)` arman controles, secciones y pestañas enteras desde datos, sin escribir una llamada por control.
- **Historial de cambios (Deshacer / Rehacer):** `AlanUI:Deshacer()`, `AlanUI:Rehacer()` y funciones de consulta. Es automático — registra cualquier cambio de control (50 pasos máximo). La pestaña Preinstalada trae una sección con los botones listos.
- **Modal `AlanUI:Confirmar(cfg)`:** diálogo de confirmación con botones personalizables, del mismo estilo que el de la "✕".
- **Bloqueo y resaltado de controles:** todo control interactivo acepta `Locked`/`LockedTitle` y expone `Lock`, `Unlock`, `IsLocked`, `SetLockedTitle` y `Highlight`.
- **Tags en la barra de título:** `Ventana:AgregarTag(cfg)` agrega pastillas de color (ej. "BETA", "v1.2") al lado del título, con soporte de degradado y arcoíris animado.
- **Nuevas funciones de ventana:** `Minimizar`, `Mostrar`, `EstaVisible`, `Resetear`, `AgregarDivisorSidebar` y `Tab:CrearDivisor`.
- **`AlanUI:CrearVentanaConSeguridad(config)`:** como `CrearVentana`, pero pregunta antes de reemplazar una ventana de **otro** script que ya esté abierta.
- **Más control de perfiles en `SaveManager`:** `Duplicar`, `Renombrar`, `Exportar` (copia el perfil como texto al portapapeles) e `Importar` (desde texto). La sección "Perfiles de script" de la Preinstalada ya trae los botones.
- **Campos extra en controles existentes:** `Boton` (`Interact`), `Label` y `Parrafo` (`Descripcion`), `Parrafo` (imagen, miniatura y botones propios), `Dropdown` (opciones con descripción, ícono, bloqueo y separadores), `CrearTab` (ícono por asset y color de ícono) y `CrearVentana` (`Orientacion`).
- **Nuevos eventos:** `AlanUI.Eventos.TipoCambiado` y `AlanUI.Eventos.HistorialCambiado`.
- **`Keybind` con modos:** `Modo = "Press"` (default), `"Hold"` (`true` al presionar, `false` al soltar) o `"Toggle"` (alterna `true`/`false`). Ver [Keybind](#5-keybind-tecla-asignable).
- **`AlanUI:Dialogo` y `Confirmar` ampliado:** un modal que elige ícono, borde y botón según el `Tipo` (`info`, `question`, `success`, `warning`, `error`). `Confirmar` acepta ahora `Ancho`, `ColorBorde` y `Casilla`.
- **Mensaje "Nuevo script detectado" rediseñado:** usa el mismo modal que el resto, con borde amarillo y los botones y la casilla "No volver a preguntar" **visibles**. Antes se veían solo sus textos: estaban hechos con `Utils.BotonBase` sin indicar `Transparencia`, y `BotonBase` es transparente por defecto.
- **Posición de la ventana recordada:** `GuardarPosicion` (default `true`), `PosicionInicial` y `Ventana:ResetearPosicion` / `GuardarPosicion` / `CargarPosicion`. La Preinstalada trae un toggle y un botón.
- **`Seccion:Columnas`:** divide una sección en dos columnas que se apilan solas si no caben.
- **`ColorPicker` con `Estilo = "2D"`:** cuadrado de saturación/valor y barra de matiz. Es opcional; por defecto sigue el estilo `"RGB"`.
- **`AlanUI.Opciones`:** `ColorPickerEstiloPredeterminado`, `GuardarPosicionVentana`, `ConfirmarCierre`, `EscalaInterfazPredeterminada`, `EscalaTextoPredeterminada`, `BordeVentanaPredeterminado`, `BordeAdaptativo`, `MicroInteracciones` y `ClickDirectoEnBarras`.
- **Tamaño inicial real (más grande):** los sliders "Tamaño de la interfaz" y "Tamaño del texto" **mostraban** 125 % y 150 %, pero la interfaz arrancaba al 100 % (el `Slider` no ejecuta su `Callback` al crearse, así que nada aplicaba esos valores). Ahora se aplican de verdad al abrir: el texto arranca más grande. Se cambian con `AlanUI.Opciones.EscalaInterfazPredeterminada` y `EscalaTextoPredeterminada` (en %), y los ajustes guardados siguen mandando.
- **Una ventana nueva ya no hereda el tamaño de texto de la anterior:** ese factor es del módulo y no se reiniciaba, así que la segunda ventana de un script podía nacer con el texto que había dejado la primera.
- **Bordes con degradado y animación:** `CrearVentana({ Borde = ... })`, `Ventana:EstablecerBorde(...)` y `Borde` en los modales. Aceptan lo mismo que un tag y además los **colores del tema**. Ver [Bordes con degradado y animación](#-bordes-con-degradado-y-animación-v2125). La Preinstalada trae su selector.
- **Pestaña activa:** además de la barrita, lleva un tinte de acento muy suave. Y se corrigió un bug: al alternar la orientación, la pestaña activa se pintaba con el color de acento y quedaba así al cambiar de pestaña.
- **Slider con manija:** un círculo al final del relleno muestra dónde está el valor (`Manija = false` lo quita).
- **Anillo de foco:** los campos de texto (`Input`, `NumberStepper`, `TagInput`, hex del `ColorPicker`, buscadores y el valor del `Slider`) muestran un borde de acento mientras escribes.
- **Notificaciones:** la franja de acento se va consumiendo durante la duración de la notificación.
- **Íconos del header dibujados:** la ✕ y el "—" ya no son texto/emoji (cambiaban según la fuente del ejecutor) sino barras dibujadas.
- **Buscador con "Sin resultados":** si nada coincide, aparece un cartel en vez de una página en blanco.
- **Preinstalada más liviana:** FPS, frametime, memoria y salud solo se escriben cuando la pestaña y la ventana están visibles. El contador de frames y la referencia de salud (a los 5 s) siguen corriendo siempre.
- **Ajustes de pulido (sin cambios de API):**
  - **Anillo de foco:** sus conexiones (`Focused` / `FocusLost`) ahora pasan por `RegistrarConexion`, igual que el resto; la auto-limpieza las desconecta al destruir la ventana o re-ejecutar.
  - **Texto truncable:** el primer ajuste de tamaño es inmediato y, mientras la ventana se anima, los recálculos se limitan a unos 33 por segundo (con una pasada final), en vez de uno por frame por cada label.
  - **Buscador:** escribir deja un solo hilo de espera activo; el anterior se cancela antes de crear el siguiente.
  - **Botones minimizar y cerrar en táctil:** `—` se separa de la ✕ según el ancho real de su área de toque, para que no se solapen, y los tags se corren con él. En PC no cambia nada.
  - **Tooltip:** mantener presionada una fila ya no abre el tooltip mientras hay un arrastre activo (antes salía al dejar quieta la manija de un slider). Además se rediseñó: 224 px de ancho, más margen interno (12 px a los lados, 9 arriba y abajo), interlineado 1,15 y el texto ya no toca el borde derecho (el label heredaba 8 px de desplazamiento dentro de un panel que ya tenía margen).
  - **`Slider` y `RangeSlider`:** el área de toque con mouse mide 30 px de alto en el Slider y 22 en el RangeSlider (en táctil, 18), con 10 px extra a cada lado (solo con mouse). El `RangeSlider` no tenía área ampliada: solo respondía dentro de la barra de 10 px. La manija del Slider mide 22 px y la del RangeSlider 20 (antes 16).
  - **Click directo en barras (mouse):** un click sobre la barra de un `Slider` o `RangeSlider` mueve la manija a ese punto (la más cercana, en el RangeSlider) y sigue arrastrando. Antes había que mover el cursor unos píxeles. En táctil el gesto no cambia, para no pelear con el scroll. Se apaga con `AlanUI.Opciones.ClickDirectoEnBarras = false`.
  - **`NumberStepper`:** botones − / + de 36×28 px (antes 28×22) y símbolo de 20 pt (antes 14). La zona derecha pasa a ocupar 168 px.
  - **`Dropdown`:** opciones de 28 px de alto (antes 22), 4 px entre ellas (antes 2) y 12 px de margen izquierdo. El área de toque de cada opción pasa a +4 px para no solaparse con la vecina.
  - **Notificaciones:** cada tarjeta ahora vive en un contenedor propio; el `UIListLayout` ignoraba el movimiento de la tarjeta y por eso aparecía de golpe. Entra deslizándose desde la derecha y, al irse, el hueco se cierra suave en vez de hacer saltar a las demás. Se quitó el rebote de la entrada.
  - **Modales:** el contenido queda invisible unos 60 ms mientras se acomoda y recién entonces aparece, para que no se vea el reajuste del texto.
- **Nuevas opciones en `AlanUI.Opciones`:** `BordeAdaptativo` (`false`), `MicroInteracciones` (`false`) y `ClickDirectoEnBarras` (`true`). Ver la tabla de `AlanUI.Opciones` más abajo.
- **`BordeAdaptativo`:** al aplicar un tema ajusta la transparencia de los bordes `Border` según la luminancia del fondo: menos transparentes en temas claros, más sutiles en oscuros. No toca color ni grosor, respeta los bordes casi invisibles y, al apagarlo, el siguiente cambio de tema los devuelve a su valor original.
- **`MicroInteracciones`:** con la opción activa, la flecha del `Dropdown` se aclara y la muestra del `ColorPicker` gana borde de acento al pasar el cursor por la cabecera. Interno: `Utils.Hover` acepta un sexto parámetro opcional `alCambiarHover(entrando)`.

> ℹ️ Las secciones de referencia de cada una están más abajo, en "Referencia de la API". Para la lista completa de campos, mira esas secciones — esta lista es solo el resumen.

## 🎬 Animaciones: revisión de consistencia (v2.12.5)

- **Feedback directo sin tween:** lo que responde al dedo o cursor mientras se arrastra (relleno de los sliders, tamaño y escala de la ventana desde la pestaña Preinstalada, y el número del TextBox) ya no se anima: sigue el movimiento al instante. Lo que cambia por código (carga de perfil, `Set()`) sí se anima.
- **Las duraciones de las animaciones de la interfaz salen de `AlanUI.Motion`.** `Motion.Directo = 0` aplica el cambio sin tween. Quedan fijos a propósito algunos efectos decorativos o continuos (el pulso de `Highlight`, el giro del arcoíris de las tags, la sacudida del bloqueo) y los temporizadores de interacción (pulsación larga, autorepetición del `NumberStepper`).
- **Curvas con sentido:** `EaseEntrar` (Quart Out) para lo que entra, `EaseSalir` (Quad In) para lo que sale, `EasePop` para rebotes. Antes `EaseSalir` era igual a `EaseEntrar`.
- **Pestañas y botones de ventana con el mismo click que el resto:** ya no usan `MouseButton1Click` directo; se benefician del umbral anti-scroll y del pop al tocar.
- **Entradas y salidas visibles:** las pastillas de `AgregarTag` y los chips de `TagInput` entran con pop; los chips salen encogiéndose; la flecha de las secciones y paneles gira animada.
- **Arreglo:** la propiedad de la sombra de la ventana era incorrecta (`Transparencia` en vez de `BackgroundTransparency`), por eso su fade-in nunca se ejecutaba.
- **Arreglo:** el contador numérico de un `Slider` con decimales mostraba valores incorrectos al animar (ej. "0" en vez de "0.3"). Ahora usa los decimales del `Incremento`.
- **Ventana más rápida:** cierre 0.18s, restauración 0.25s, y la barra de carga del splash tiene un tope de 1.0s (antes podía llegar a 2.2s con muchos controles).
- **Bloqueo animado:** `Lock()` ahora desvanece el velo y desliza la insignia "🔒 motivo" con rebote; `Unlock()` lo desvanece. `IsLocked()` y `Visible` del velo siguen cambiando al instante. Un control que nace con `Locked = true` queda directo, sin animación.
- **Tocar un control bloqueado:** la insignia se sacude (±3px, 0.25s) y destella en rojo, para indicar que no se puede usar.
- **Notificación persistente:** al tocarla da feedback (pop + borde encendido) antes de cerrarse. Si se toca mientras entra, se cierra directo.
- **Splash:** el panel de fondo ahora también entra con fade (antes aparecía opaco de golpe y solo se animaban sus textos).
- **Pestañas y divisores de la barra lateral:** entran con fade, pero **solo si se crean cuando la ventana ya es visible**. Las que se crean durante el armado inicial quedan tapadas por el splash y no se animan.
- **Arreglo (Dropdown / ColorPicker):** el panel ya no se cierra al empezar un scroll con el dedo fuera de él. Ahora cierra solo con un tap real (mismo umbral anti-scroll que `ClickConfiable`: 18px en touch, 10px con mouse). Con mouse, cierra al soltar el click y no al presionarlo.
- **Arreglo (memoria):** las notificaciones, los chips de `TagInput` y los diálogos que se destruían en plena ejecución dejaban su entrada en los registros internos de tema y de escala de texto, y no se liberaba nunca. Ahora cada entrada se marca al destruirse la instancia y los registros se compactan en lote.
- **Cambio de orientación animado:** al alternar entre tabs laterales y barra superior, la barra que aparece entra deslizándose con un fade (antes el cambio era instantáneo).
- **Cambio de tema animado:** los colores hacen una transición suave en vez de saltar. Solo se animan los elementos visibles; lo que está en pestañas ocultas cambia directo, para no animar cientos de instancias que nadie ve. Durante el armado inicial y al restaurar el tema guardado bajo el splash se aplica directo.
- **Divisores animados:** `Ventana:AgregarDivisorSidebar` y `Tab:CrearDivisor` crecen desde cero con un fade cuando se crean con la ventana ya visible.
- **Arreglo (tooltip por mantener presionado):** reforzado en touch. Usa el mismo umbral que `ClickConfiable` (18px en touch; antes 10px, demasiado estricto para un dedo), vigila el toque cada 50 ms en vez de mirarlo una sola vez al final y agrega el evento `TouchLongPress` como segundo disparador. No pude reproducirlo sin Roblox: es un refuerzo basado en el código, no una causa confirmada.

## 🆕 Novedades v2.12.4 (patch)

Ronda de mejoras visuales y de feedback, pensada para que la interfaz avise mejor cuándo una acción se registró:

- **Secciones colapsables más claras y animadas:** el header entero ahora responde con un hover sutil al tocarlo/pasarle el cursor (antes solo la flecha sugería que era interactivo), y colapsar/expandir ahora anima la altura en vez de ocultarse de golpe. Las transiciones que dispara el buscador (expandir todo al buscar, restaurar al limpiar) siguen siendo instantáneas a propósito — animar muchas secciones a la vez con la búsqueda se sentiría lento.
- **Sliders con más brillo:** el degradado de la barra de relleno (ya existía, pero era muy sutil) ahora tiene más intensidad en `Slider` y en los canales R/G/B de `ColorPicker`.
- **Flash de validación (verde/rojo) en 3 controles:** `Slider` (TextBox de valor), `Input` con `Tipo = "number"` o `Tipo = "pattern"`, y el campo Hex de `ColorPicker`. Antes, escribir un valor inválido y presionar Enter revertía en silencio, sin ninguna señal de que pasó algo — ahora un flash rojo confirma que se rechazó, uno verde confirma que se aceptó.

## 🆕 Novedades v2.12.3 (patch)

- **El texto ya no se corta tan fácil:** los controles con texto de una sola línea en un espacio fijo (el nombre de cualquier control, valores de `Label`, etc.) ahora achican la letra automáticamente lo necesario para entrar completos, antes de recurrir al corte con "…" como último recurso. Se recalcula solo al redimensionar la ventana, mover el slider de escala de texto, o cambiar el texto de un control en vivo.
- **Avisos de la Preinstalada, legibles del todo:** los mensajes de "Advertencias del sistema" (ProtectGUI, Teclado, Gamepad) ya no se cortan a mitad de oración — ahora se muestran completos, en varias líneas si hace falta.
- **`RadioGroup` ya no se "quema" en blanco en mobile:** mantener el dedo presionado o tocar varias veces seguidas sobre un control ya no acumula el efecto de brillo de hover hasta blanco puro. Afecta a la mayoría de los controles de la librería, no solo `RadioGroup`.
- **Los sliders ya no roban el scroll en mobile:** antes, si el dedo pasaba sobre un `Slider` (o los canales de `ColorPicker`) mientras se intentaba scrollear la página, el slider se movía en vez de dejar scrollear. Ahora se espera a que el gesto se defina por su dirección dominante (horizontal = arrastre, vertical = scroll) antes de reaccionar. Cambio de comportamiento: un toque corto sin arrastre ya no mueve el valor del slider al punto tocado — antes sí lo hacía, y era justamente lo que causaba este bug.

## 🆕 Novedades v2.12.2 (patch)

`Seccion:Label` gana cuatro capacidades nuevas, pensadas para casos como mostrar FPS, la tecla detectada, o el estado de un script en vivo:

- **`RichText` en el valor dinámico:** hasta ahora `RichText` solo aplicaba al título del Label; ahora también se puede pasar para el valor que cambia con `Set()`, permitiendo tags como `<font color='#00FF00'>OK</font>` directamente en el texto.
- **`SetColor(color)`:** cambia el color del valor mostrado puntualmente (ej. verde para "OK", rojo para "Error"), sin tocar el color del título. El color elegido se mantiene aunque el usuario cambie de tema después — antes de este fix, un cambio de tema hubiera pisado silenciosamente cualquier color personalizado.
- **`SetTexto(texto)`:** alias de `Set()`, para cuando el nombre "Set" resulta ambiguo al lado de "SetColor".
- **Auto-actualización opcional con `Cada` + `Actualizar`:** pasando `Cada = 0.5` (segundos) y una función `Actualizar` que devuelve el nuevo valor, el Label se refresca solo — sin que el desarrollador tenga que armar su propio loop. Internamente, **todos** los Labels con auto-actualización de una ventana comparten un único loop global (no uno por Label), así que crear varios no cuesta hilos extra.
- **`AlanUI:ActualizarLabel(flag, texto)`:** atajo para actualizar un Label por su `Flag` sin tener que guardar la referencia devuelta por `Seccion:Label(...)`.

```lua
-- Con RichText
local lbl = Seccion:Label({ Texto = "Estado", Flag = "st", Valor = "–", RichText = true })
lbl:Set("<font color='#00FF00'>OK</font>")

-- Con color dinámico
local lbl = Seccion:Label({ Texto = "Ping", Flag = "ping", Valor = "–" })
lbl:Set("25ms")
lbl:SetColor(Color3.fromRGB(0, 255, 0)) -- verde = bien

-- Con auto-update (cada 0.5s)
Seccion:Label({
    Texto = "FPS", Flag = "fps", Valor = "–",
    Cada = 0.5,
    Actualizar = function() return tostring(math.floor(workspace:GetRealPhysicsFPS())) end,
})

-- Helper global, sin guardar la referencia del Label
AlanUI:ActualizarLabel("ping", "30ms")
```

## 🆕 Novedades v2.12.1 (patch)

Ronda de correcciones de fragilidad y accesibilidad táctil, encontrada en una auditoría de código + retest en dispositivo real (Android, ejecutor Delta):

- **Guards de tipo en los 11 controles con `Set` público** (`Slider, Input, Dropdown, ColorPicker, Keybind, RadioGroup, Toggle, Casilla, Progreso, Label, Parrafo`): si se les pasa un valor del tipo equivocado, ahora avisan por consola (`AlanUI:_RegistrarError`) y ese `Set` puntual se ignora, en vez de romper el script del desarrollador con un error críptico como `invalid argument #1 to 'clamp'`.
- **`:Set(v)` y `.Set(v)` ahora funcionan igual (cambio de comportamiento):** antes, llamar a un `Set` público con dos puntos (`control:Set(50)`, un error de sintaxis muy común en Lua) pasaba por accidente la propia tabla del control como valor, en vez del `50` real — normalmente terminaba en un crash. Ahora ambas formas de llamada se normalizan y funcionan igual. Esto es aditivo y no debería romper ningún script existente que ya llamara con `.Set(v)` correctamente.
- **Umbral de `ClickConfiable` dinámico según dispositivo:** 18px en touch, 10px en mouse (antes, 10px fijo para los dos). Un tap normal en celular se desvía 15-20px entre el toque y la soltada sin que el usuario lo perciba como un scroll; con el umbral viejo, ese movimiento normal se descartaba como "fue scroll" y el click no se registraba.
- **Hitboxes ampliados en 6 controles:** `Toggle`, `Casilla`, `RadioGroup`, opciones de `Dropdown`, swatches de `ColorPicker`, y los botones de tab (barra lateral y horizontal) ahora responden al toque en un área más grande que su tamaño visual, sin ningún cambio de aspecto — más generoso en controles aislados (`Toggle`/`Casilla`, +20px de diámetro) y más conservador en controles que viven pegados a un vecino en una lista (`RadioGroup`, swatches y tabs, +14px; `Dropdown`, +12px, el más ajustado porque sus opciones tienen apenas 2px de separación entre sí). En mobile, esto se siente como si los controles fueran más grandes de lo que en realidad son.
- **Corrección visual en `RadioGroup` en mobile:** la opción elegida podía perder su resaltado azul justo después de tocarla (un problema de `Utils.Hover` restaurando un color viejo al soltar el dedo, no algo relacionado al valor guardado). En PC no se notaba porque el mouse no dispara el mismo evento al hacer click.
- **Heurística Tablet vs. Móvil ajustada:** antes, un celular en horizontal con suficiente ancho (ej. 714×360) podía clasificarse como "Tablet" solo por el ancho. Ahora también se considera el alto: si es menor a 500px, se clasifica como "Móvil" sin importar el ancho. Si tu script dependía de la clasificación anterior en ese rango de viewport, `AlanUI:ForzarTipo("Tablet")` sigue disponible para forzarla manualmente.
- **`AlanUI:Profiler()` contaba mal la cantidad de Flags activos:** siempre devolvía `Flags: 0`, sin importar cuántos hubiera. `AlanUI.Flags` es una tabla proxy (los valores reales viven en otro lado por dentro), y `pairs()` no pasa por ese proxy — iteraba sobre una tabla que siempre está vacía por diseño. Ahora cuenta sobre el lugar correcto. Solo afectaba ese número del diagnóstico, nada funcional.

## 🆕 Novedades v2.12

Secciones colapsables: cada sección de la interfaz ahora se puede colapsar/expandir con un click, para que el usuario pueda ocultar temporalmente las partes de la UI que no está usando sin perder su lugar.

- **Secciones colapsables por defecto:** `Tab:CrearSeccion("Nombre")` crea una sección con header clickeable — flecha a la izquierda (▶ colapsada / ▼ expandida) + título. Clickear el header entero (no solo la flecha) expande/colapsa. El header es un botón transparente que ocupa todo el ancho, para que sea fácil de tocar en móvil.
- **Compatible con el código existente:** `Tab:CrearSeccion("Nombre")` sin segundo parámetro funciona igual que siempre, ahora con el comportamiento colapsable agregado. Para volver al header solo-texto de antes: `Tab:CrearSeccion("Nombre", { Colapsable = false })`.
- **Arrancar colapsada:** `Tab:CrearSeccion("Nombre", { ColapsadaPorDefecto = true })` — útil para secciones avanzadas que no todos los usuarios necesitan ver siempre. Solo tiene efecto si la sección es colapsable.
- **El estado colapsado NO persiste entre sesiones:** es un ajuste visual efímero, no se guarda en el `.json`. Cada vez que se abre la ventana, todas las secciones arrancan en su estado por defecto (expandidas, o colapsadas si se pasó `ColapsadaPorDefecto = true`).
- **Interacción con el buscador global:** mientras hay búsqueda activa, todas las secciones se expanden automáticamente — así el usuario ve los resultados sin tener que abrir cada sección a mano. Al limpiar la búsqueda, cada sección vuelve a su estado previo (las que estaban colapsadas vuelven a estar colapsadas).

```lua
-- Colapsable por defecto
local Seccion = Tab:CrearSeccion("General")

-- Sin colapso (comportamiento de siempre)
local SeccionFija = Tab:CrearSeccion("Otra", { Colapsable = false })

-- Colapsable, pero arranca colapsada
local SeccionAvanzada = Tab:CrearSeccion("Avanzado", { ColapsadaPorDefecto = true })
```

> 📝 **Actualización (v2.12.4):** en v2.12 colapsar/expandir era instantáneo (`Visible`, sin tween de tamaño). Desde v2.12.4 ahora **sí anima la altura** al hacerlo con un click; solo las transiciones que dispara el buscador siguen siendo instantáneas a propósito.

## 🆕 Novedades v2.11

Nuevo sistema de diagnóstico de entorno: AlanUI ahora sabe en qué tipo de dispositivo corre y comunica claramente qué funciones soporta, en vez de fallar en silencio.

- **`AlanUI.Capacidades` extendido** con `Tipo` (`PC`/`Movil`/`Tablet`/`Consola`/`Studio`/`Desconocido`), `Plataforma`, `ViewportSize`, `EsStudio`, `TieneTouch`, `TieneMouse`, y los derivados `EsTactil`/`EsEscritorio`/`EsTouchOnly`. Se recalcula en vivo si el viewport cambia (rotar el celular, redimensionar la ventana en Studio).
- **`AlanUI:VerificarSoporte(nombre)`** — verifica si una función puntual (`"Archivos"`, `"Drawing"`, `"SetClipboard"`, etc.) está disponible en el entorno actual, con nivel (`requerido`/`recomendado`/`opcional`) y mensaje explicando qué se pierde si no está.
- **`AlanUI:ForzarTipo(tipo)` / `LiberarForzado()`** — para corregir manualmente una clasificación equivocada (una tablet detectada como móvil, por ejemplo). Persiste entre re-ejecuciones del script en la misma sesión.
- **`AlanUI:DiagnosticoCompleto()`** — snapshot completo pensado para reportes de bug.
- **Nueva sección "🖥️ Diagnóstico del entorno"** en la pestaña Preinstalada, entre "Información" y "Apariencia": muestra el dispositivo detectado, cuántas funciones están soportadas, y advertencias específicas solo cuando falta algo.

```lua
if AlanUI:VerificarSoporte("Drawing").ok then
    miESP()
end

AlanUI.Eventos.TipoCambiado:Connect(function(tipo) print("Ahora:", tipo) end)
```

## 🆕 Novedades v2.11.2 (patch)

Correcciones y mejoras chicas sobre `Keybind`, `Input` y el sistema de guardado, de una tanda de revisión de código:

- **`Keybind` ahora sí escucha la tecla asignada después de asignarla:** antes, el `Callback` se disparaba una única vez, en el instante en que se terminaba de capturar la tecla — presionarla después en el juego no hacía absolutamente nada, había que armar un `UserInputService.InputBegan` propio aparte. Ahora queda un listener persistente escuchando mientras la ventana viva (teclado simple, con modificadores, y gamepad).
- **El `Callback` ya no se dispara al asignar o reasignar la tecla, solo al presionarla en el juego:** antes, el propio acto de capturar una tecla nueva ya disparaba el `Callback` una vez — para un `Callback` tipo alternar (toggle), esto hacía que asignar la tecla ya cambiara el estado antes de que el usuario la presionara ni una vez. Si tu script dependía de ese disparo al asignar, movelo a un listener propio sobre `AlanUI.Eventos.FlagCambiada` para ese flag.
- **Detección de conflictos entre `Keybind`:** si dos `Keybind` de la misma ventana terminan compartiendo la misma tecla (con los mismos modificadores, si usan `ConModificadores`), aparece una notificación avisando cuáles — sin bloquear la asignación ni modificar ninguno de los dos automáticamente, la decisión queda del lado de quien usa el script. Se revisa tanto al reasignar una tecla a mano como al cargar un perfil guardado que ya tenía el conflicto (una sola notificación agrupada por combinación, no una por Keybind involucrado).
- **`GetPlatform()` ya no puede tumbar la carga del módulo:** en Studio (y en ejecutores con sandbox restrictivo), ese método de `UserInputService` requiere una capability que un `LocalScript` no tiene — llamarlo sin protección hacía que la excepción cortara la carga completa de AlanUI. Ahora está protegido con `pcall`, cayendo a `nil` como valor seguro (el resto del código ya sabe manejar esto, recurriendo a la heurística normal de detección de entorno).
- **Contador de caracteres en `Input`:** aparece como aviso ("180/200") cuando el texto se acerca al límite de `MaxCaracteres` (80% o más) — antes el límite era invisible y solo se notaba cuando el texto ya se había cortado. Se puede desactivar por campo con `OcultarContador = true`.
- **Versionado del formato de guardado:** los `.json` guardados ahora incluyen un campo interno `__version`, pensado para poder migrar automáticamente archivos viejos si el formato cambia en el futuro. No afecta nada de lo que ya tenías guardado — los archivos anteriores a este cambio se siguen leyendo exactamente igual.

## 🆕 Novedades v2.10.2 (patch)

Correcciones de código y mejoras encontradas al auditar la documentación:

- La sombra de la ventana ahora cubre **toda la pantalla** (antes era un halo ajustado al borde), con un fade-in suave de 0.25s al abrir. (Antes su fade-in no se ejecutaba por un error de nombre de propiedad; ahora sí.)
- Headers de `Dropdown`/`ColorPicker` ahora usan el mismo sistema anti-"tap perdido" que el resto de controles.
- `AlanUI.Motion.HoverIntensidad` ahora sí se usa como default real de `Utils.Hover` (antes estaba declarado pero sin conectar).
- Los swatches del `ColorPicker` ahora cambian de color de borde al cambiar de tema.
- El hover de filas/toggles/sliders usaba una duración fija de 0.15s en vez de `AlanUI.Motion.Hover` (0.12s) — ahora es consistente, y `Utils.Hover` acepta un cuarto parámetro opcional `duracion` para casos que necesiten overridearlo.
- La barra lateral de tabs ahora tiene scroll: con 15+ tabs, antes se desbordaba sin forma de verlos todos.

## 🆕 Novedades v2.10.1 (patch)

Cuatro correcciones sobre las mejoras visuales de v2.10, encontradas en una revisión posterior. No agrega funcionalidad nueva.

- **Las sombras de la ventana quedaban visibles al minimizar:** al minimizar, la ventana pasa a tamaño (0,0) y se oculta, pero las 3 capas de sombra detrás nunca se ocultaban con ella — quedaban como cuadrados oscuros flotando en el centro de la pantalla, visibles sobre todo en fondos claros. Ahora las sombras siguen la visibilidad de la ventana además de su tamaño y posición.
- **Hover inconsistente en tabs y `RadioGroup`:** por un error de parámetro, los botones de pestaña (barra lateral y superior) y los botones de `RadioGroup` recibían una intensidad de hover de 12% en vez del 20% del resto de la interfaz — se sentían "más apagados" que el resto de los controles. Corregido en los tres puntos.
- **El fix de "primer tap perdido en scroll" (v2.10) solo cubría `Boton`:** se extendió a todos los controles que viven dentro de la página con scroll de cada tab — `Toggle`/`Casilla`, las opciones del `Dropdown`, `RadioGroup`, los swatches del `ColorPicker`, y las tres variantes del `Keybind`.
- **Pequeño solape entre el hitbox ampliado del `Slider` y su campo de valor:** el área de toque ampliada del Slider se solapaba 2px con el borde inferior del campo de texto de encima. Ajustado para que ambos queden exactamente pegados, sin solaparse ni dejar hueco.

---

## 🆕 Novedades v2.10

Doce mejoras visuales y de experiencia táctil, sin tocar lógica de negocio ni romper compatibilidad con nada existente.

### 🎨 Visual

- **Sombra suave detrás de la ventana:** tres capas de `Frame` semitransparente detrás de la ventana principal, dándole sensación de profundidad — antes flotaba "pegada" al juego, sin ningún efecto de elevación.
- **Esquinas más redondeadas:** el radio de la ventana principal pasó de 10 a 14px, un look más moderno.
- **Hover más marcado:** el aclarado al pasar el mouse sobre un control subió de 14% a 20% — la interfaz se siente más receptiva.
- **Más espacio entre secciones:** de 8 a 14px de separación vertical entre secciones dentro de un tab.

### 📱 Experiencia táctil / mobile

- **Hitbox más grande en los `Slider`:** el área de toque real ahora mide 20px (antes 10px, el mismo alto que la barra visual) — mucho más fácil de tocar con el dedo, sin cambiar cómo se ve la barra.
- **Botones más responsivos dentro de listas con scroll:** los botones usaban `MouseButton1Click`, que en un `ScrollingFrame` a veces "comía" el primer tap pensando que era el inicio de un scroll. Ahora usan un patrón de presionar/soltar con tolerancia de movimiento, igual de preciso pero sin ese problema.
- **Apertura más ágil en todos los dispositivos:** la animación de apertura de la ventana ahora dura 0.25s (antes 0.45s con teclado y 0.3s en mobile).
- **Tamaño mínimo de texto más alto en mobile:** el piso de la escala de texto subió de 6px a 9px en dispositivos táctiles — 6px es prácticamente ilegible en un celular a resolución alta.

### 🧩 Controles nuevos

- **`Seccion:Divider`:** separador visual liviano entre grupos de controles relacionados dentro de una sección — una línea delgada, con o sin texto, mucho más liviano que usar `Parrafo` para lo mismo.
- **`Icono` opcional en `Seccion:Boton`:** botones tipo "💾 Guardar" o "🗑️ Eliminar" con un simple `cfg.Icono = "💾"`, sin agregar ninguna instancia extra.
- **Paleta de colores comunes en `ColorPicker`:** una fila de 8 swatches (rojo, verde, azul, amarillo, magenta, cian, blanco, negro) arriba de los sliders RGB — un click para los colores más usados, en vez de escribir hex o mover 3 sliders.

```lua
Seccion:Divider({ Texto = "Ajustes avanzados" })

Seccion:Boton({
    Texto = "Guardar",
    Icono = "💾",
    Callback = function() end,
})
```

---

## 🆕 Novedades v2.9.1 (patch)

Seis correcciones sobre los controles nuevos de v2.9, encontradas en una revisión posterior. No agrega funcionalidad nueva.

- **Crash de `Keybind` con `Defecto = Enum.KeyCode.X` + `ConModificadores = true`:** si se pasaba un `Enum.KeyCode` suelto como `Defecto` junto con `ConModificadores = true`, el control fallaba al crearse (intentaba leer `.KeyCode` sobre un `EnumItem`). Ahora `Defecto` se normaliza automáticamente al formato de tabla que `ConModificadores` espera.
- **Inconsistencia de tipo en `Keybind` táctil con modificadores:** en móvil sin teclado, rotar entre teclas comunes con toque largo podía dejar `valor` a veces como tabla, a veces como `Enum.KeyCode` suelto, según el momento. Ahora se mantiene el tipo consistente con `ConModificadores`.
- **Carga de un `Keybind` con tecla inválida devolvía `nil`:** si el `.json` guardado tenía el nombre de una tecla que ya no existe, la reconstrucción devolvía `nil` en vez de caer al valor por defecto seguro (`Enum.KeyCode.Unknown`).
- **`Input` con `Tipo = "pattern"` y un `Regex` que ya trae `^`/`$` nunca validaba nada:** en un patrón Lua, `^` solo es ancla como primer carácter — pasar `Regex = "^%d+$"` terminaba anclando dos veces (`^^%d+$$`), que no matchea nunca. Ahora se aceptan patrones con o sin anclas explícitas indistintamente.
- **`ColorPicker.Set()` (público) no disparaba el `Callback`:** una caché interna pensada para el arrastre en vivo hacía que actualizar el color por código nunca llegara a ejecutar el `Callback`, a diferencia de escribir el hex a mano (que sí lo disparaba). Ambos caminos ahora se comportan igual.
- **`Seccion:Progreso` generaba un ciclo de autoguardado innecesario al crearse:** escribía su valor inicial a través del mismo mecanismo que dispara guardado automático, igual que ya se había corregido para `Label` en v2.8. Ahora escribe directo al almacenamiento interno, sin ese efecto secundario.

> ⚠️ **Si guardaste algún `Keybind` con v2.8 o anterior:** por el bug de serialización corregido en v2.9, esos guardados quedaron corruptos o vacíos — no se recuperan solos al actualizar. Reasigná esos Keybinds una vez después de actualizar y a partir de ahí se guardarán y cargarán correctamente.

> 📝 **Nota sobre `Input` con `Tipo = "number"`:** igual que el resto de `Input`, la validación y el `Callback` se disparan al perder el foco (`FocusLost`), típicamente presionando Enter o tocando fuera del campo — no en cada tecla mientras se escribe. Si el usuario cambia de campo sin presionar Enter, el valor igual queda guardado en el Flag, pero el `Callback` solo corre si `FocusLost` reporta que se cerró con Enter.

---

## 🆕 Novedades v2.9

Cinco controles nuevos, pensados para llenar huecos concretos de la API sin tocar el comportamiento de nada existente.

### 🎨 `ColorPicker` con campo Hex
Debajo de los tres sliders R/G/B ahora hay un campo de texto `#RRGGBB` (también acepta la forma corta `#RGB`). Escribir un hex válido mueve los tres sliders de una vez; mover los sliders actualiza el hex automáticamente. Un hex inválido simplemente se revierte al último color válido al perder el foco, sin marcar error.

### 🔢 `Input` con validación (`Tipo`)
`Seccion:Input` acepta ahora un `cfg.Tipo` opcional:
- `Tipo = "number"` — solo acepta números; con `Min`/`Max` opcionales, el valor se recorta a ese rango. El `Callback` recibe un número real, no un string.
- `Tipo = "pattern"` — valida contra un patrón Lua (`cfg.Regex`), anclado a la cadena completa.

Sin `Tipo`, el comportamiento es exactamente el de siempre (texto libre).

```lua
Seccion:Input({
    Texto = "Nivel objetivo",
    Flag = "nivelObjetivo",
    Tipo = "number", Min = 1, Max = 100,
    Callback = function(n) print("Nivel:", n) end, -- n es un numero
})
```

### 🔘 `Seccion:RadioGroup` (nuevo control)
Alternativa a `Dropdown` cuando hay pocas opciones (2-4 es el caso típico): todas quedan visibles en una fila horizontal, sin desplegar nada. Selección única.

```lua
Seccion:RadioGroup({
    Texto = "Modo",
    Flag = "modo",
    Opciones = {"Farm", "PvP", "Raid"},
    Defecto = "Farm",
    Callback = function(v) print("Modo:", v) end,
})
```

### 📊 `Seccion:Progreso` (nuevo control)
Barra de progreso de solo lectura (el usuario no puede arrastrarla), pensada para cooldowns, progreso de auto-farm, carga de datos, etc. Se actualiza con `Set(0-100)`.

```lua
local barra = Seccion:Progreso({ Texto = "Progreso del farm" })
barra.Set(45) -- 45%
```

### ⌨️ `Keybind` con modificadores (`ConModificadores`)
Con `cfg.ConModificadores = true`, el Keybind captura también si Ctrl/Shift/Alt estaban presionados junto con la tecla — el valor pasa de ser un `Enum.KeyCode` suelto a una tabla `{KeyCode, Ctrl, Shift, Alt}`. Sin esa opción, el comportamiento es idéntico al de siempre. El texto mostrado se arma solo, por ejemplo "Ctrl+Shift+F".

```lua
Seccion:Keybind({
    Texto = "Combo de ataque",
    Flag = "comboAtaque",
    ConModificadores = true,
    Callback = function(v)
        print(v.Ctrl, v.Shift, v.Alt, v.KeyCode)
    end,
})
```

### 🐛 Corrección de guardado

- **Los `Keybind` no se guardaban ni cargaban correctamente:** `Enum.KeyCode` (y ahora también la tabla de modificadores) nunca tuvo un tratamiento especial al guardar, a diferencia de `Color3` — `HttpService:JSONEncode` no sabe serializar un `EnumItem`, así que un Keybind guardado quedaba corrupto o vacío al recargar. Ahora se empaqueta a su nombre de texto y se reconstruye correctamente al cargar, igual que ya pasaba con los colores. **Los Keybinds guardados con v2.8 o anterior no se recuperan solos al actualizar — hay que reasignarlos una vez** (ver nota en "Novedades v2.9.1" más arriba).

---

## 🆕 Novedades v2.8

Esta ronda sale de varias auditorías propias enfocadas en rendimiento, limpieza de conexiones, y separación de responsabilidades dentro de la pestaña Preinstalada.

### 💾 Guardado rediseñado: dos sistemas independientes

- **Preinstalada ahora gestiona SOLO sus propios ajustes** (tema, orientación, escala, ancho/alto de ventana, tamaño de texto) con su propio Guardar/Cargar/Eliminar (`SM:GuardarUI`/`CargarUI`/`ListarUI`/`EliminarUI`), en una carpeta separada del resto.
- **Nueva sección "Perfiles de script" dentro de Preinstalada:** gestiona los Flags de tu propio script (todo lo que no sea ajuste de interfaz) con Dropdown + Guardar como nuevo perfil + Cargar + Eliminar. Aparece automáticamente en cualquier script que use AlanUI, sin escribir código extra.
- `AlanUI:MarcarComoUI(flag)` (nuevo): marca un Flag como exclusivo de la interfaz para que el sistema de perfiles nunca lo incluya ni lo sobreescriba.
- **Autoguardado rediseñado:** en vez de escribir a disco ~0.4s después de cada cambio, ahora revisa cada 10 segundos si hubo algún cambio real y solo entonces guarda una vez — mismo resultado, muchas menos escrituras a disco durante una sesión larga.
- **Verificación antes de sobreescribir:** el botón manual de "Guardar" ahora compara contra el archivo existente — si nada cambió, avisa "Ya estaba al día" en vez de reescribir el mismo contenido.
- Toda carga (perfil, ajustes de interfaz, o la carga automática al abrir el script) ahora muestra notificación siempre.

### 🐛 Corrección de botones de la barra de título

- **El botón "✕" no limpiaba los registros internos:** confirmar "Eliminar" llamaba directo a `sg:Destroy()`, sin pasar por la misma limpieza de registros (`registroTema`, `indiceBusqueda`, `registroEscalaTexto`, `AlanUI.Elementos`) que sí hace `Ventana:Destruir()`. Ahora ambos caminos limpian exactamente lo mismo.
- **Áreas táctiles de "cerrar" y "minimizar" superpuestas:** el área de toque real de cada botón es más grande que su ícono visible (para que sea más fácil tocarlos, sobre todo en móvil), pero la separación entre ambos botones no tenía en cuenta ese margen extra — un toque un poco impreciso en "minimizar" podía terminar disparando "cerrar" (que además pide confirmar para destruir la interfaz). Ahora la separación entre centros es suficiente para que las zonas de toque invisibles tampoco se pisen entre sí.

### 🐛 Corrección de tooltips

- **Cierre impredecible al mantener presionado en una fila entera:** desde que el tooltip por "mantener presionado" se extendió a la fila completa (no solo el ícono "?"), el cierre por click-afuera solo funcionaba si el toque siguiente caía fuera de esa fila entera y del panel — un área grande, así que la mayoría de los toques "siguientes" caían adentro y no cerraban nada. Ahora el siguiente click o toque, sin importar dónde caiga, cierra el tooltip abierto (sin contar el mismo toque que lo abrió).

### 🐛 Corrección de animaciones

- **Dropdown/ColorPicker que a veces no se abrían del todo:** el sistema que evita que dos animaciones compitan por la misma propiedad (cancelando la anterior antes de arrancar la nueva) cacheaba solo por objeto, sin distinguir qué propiedad se animaba. Un mismo `Frame` puede tener su color animado por el efecto hover Y su tamaño animado al abrirse (el caso de Dropdown/ColorPicker) — con la cache por-objeto-solamente, un simple paso del mouse cerca de un click cancelaba a mitad de camino la animación de apertura, dejando el panel visualmente cerrado (o "temblando" a medio camino) aunque el estado interno dijera que sí se había abierto. Ahora la cache distingue por objeto **y** por las propiedades animadas — dos animaciones sobre propiedades distintas del mismo objeto ya no se cancelan entre sí.

### 🐛 Corrección de guardado

- **`Label.Set()` escribía a disco en cada llamada:** un `Label` pasaba su valor por el proxy de `AlanUI.Flags`, que programa un guardado en disco cada vez que se le asigna algo. `Label` se usa típicamente para valores que cambian todo el tiempo (contador de FPS, HUD de combate, distancia al objetivo) — eso eran escrituras a disco sin parar de un valor que nunca debería persistirse, y de paso, al reabrir el script, se restauraba por un instante el último número guardado antes de que tu propio código lo actualizara. Ahora `Label` escribe directo al almacenamiento interno (sigue siendo legible con `ObtenerFlag`/`Get()` como siempre) sin pasar por el proxy que dispara guardado.
- **Colores (`ColorPicker`) que se perdían al guardar:** `SM:Guardar` codificaba `_flagsReales` como argumento de la llamada a `pcall`, así que si `HttpService:JSONEncode` fallaba, ese error no quedaba protegido por el `pcall` y se escapaba directo. Además, `JSONEncode` no sabe serializar un `Color3` (no es un tipo JSON válido) y lo convertía en `null` sin avisar — cualquier `ColorPicker` guardado se perdía en silencio. Ahora todo el trabajo (empaquetar `Color3` a `{R,G,B}`, codificar, escribir) corre dentro del mismo `pcall`.

### 🧹 Limpieza de conexiones

- `AlanUI:DesconectarYLimpiar(conexion)` (nuevo): desconecta una conexión y la saca del registro global de limpieza en un solo paso — para conexiones que ya se registraron con `RegistrarConexion` pero se desconectan manualmente antes de que la ventana se destruya (tooltips, paneles desplegables). Sin esto, la entrada quedaba "muerta" acumulándose en el registro.
- La cámara (`Workspace.CurrentCamera`) ahora se re-detecta si cambia en caliente, en vez de quedar atada para siempre a la que estaba activa al abrir la ventana.

### ⚡ Rendimiento

- El indicador de "Salud" de la pestaña Preinstalada ya no recorre toda la GUI (`GetDescendants()`) cada segundo para contar objetos — ahora lleva un contador en tiempo real que sube y baja solo al crear/destruir instancias.
- El contador de FPS pasó de un loop propio con `task.wait()` a una conexión estándar de `RunService.Heartbeat`, integrada al mismo sistema de limpieza que el resto de la librería.
- `Dropdown.ActualizarOpciones()` (usado para refrescar listas, como la de perfiles guardados) ya no destruye y recrea todos los botones de la lista — reutiliza los que siguen existiendo y solo toca los que cambiaron.
- El arrastre del `Slider` ya no pasa por la maquinaria genérica de animación en cada pixel de movimiento — usa un `Tween` dedicado y liviano, pensado específicamente para eventos de alta frecuencia.

### 🎨 Visual

- Los botones de pestaña de la barra lateral/superior ahora sí cambian de color al cambiar de tema (antes quedaban con el color del tema con el que se habían creado).
- El círculo "?" del tooltip ya no se superpone con el texto en filas angostas con valores largos pegados a la derecha (por ejemplo "Memoria (aprox...)" o "Tamaño de la interfaz" en la pestaña Preinstalada).

---

## 🆕 Novedades v2.7

Esta ronda sale de una auditoría técnica externa (13 propuestas concretas), evaluada una por una contra el código real antes de tocar nada — ninguna se aplicó a ciegas. Esto es lo que se implementó:

* 🔀 **Visibilidad condicional entre controles (`VisibleSi`, nuevo):** cualquier elemento puede ocultarse o mostrarse según el valor de OTRO flag, sin que tengas que llamar `.Set()` a mano. Pensado para el caso típico "si Auto Farm está activo, mostrar Distancia/Prioridad/Ignorar Amigos". Se re-evalúa solo cada vez que cambia cualquier flag.
  ```lua
  SeccionCombate:Slider({
      Texto = "Distancia",
      VisibleSi = function() return AlanUI.Flags.AutoFarm == true end,
  })
  ```
* 📡 **Eventos globales (`AlanUI.Eventos`, nuevo):** reacciona a cambios importantes sin envolver manualmente cada control. `FlagCambiada` (cualquier escritura en `AlanUI.Flags`), `TabCambiada` y `TemaCambiado` ya se disparan solos.
  ```lua
  AlanUI.Eventos.FlagCambiada:Connect(function(flag, valor)
      print("Cambió:", flag, "→", valor)
  end)
  ```
* 🔔 **Notificaciones con `Tipo`, `Prioridad` y `Persistente` (nuevo):** cuatro tipos semánticos (`Info` / `Success` / `Warning` / `Error`) con su propio color de acento, notificaciones que no se cierran solas (`Persistente = true`, se descartan con un click), y una cola que respeta prioridad en vez de ser siempre FIFO.
  ```lua
  AlanUI:Notificar({ Titulo = "Error", Texto = "Algo falló", Tipo = "Error", Prioridad = 2 })
  ```
* 💾 **Perfiles de configuración (`SM:CambiarPerfil`, nuevo):** cambia entre archivos de configuración completos ("Farm", "PvP", "Raid"...) con una sola llamada, sin recrear la ventana. La infraestructura de archivos con nombre ya existía (`Guardar`/`Cargar` siempre aceptaron un nombre); esto es el método de conveniencia que además redirige el autoguardado nativo.
  ```lua
  AlanUI.SaveManager:CambiarPerfil(Ventana, "Farm")
  ```
* 🩺 **Profiler bajo demanda (`AlanUI:Profiler()`, nuevo):** una foto instantánea (Flags, Elementos, conexiones, hilos, dibujos, objetos de GUI, memoria aproximada) sin depender de tener la pestaña Preinstalada abierta. Complementa al panel de Salud que ya corría en vivo ahí.
* 🐞 **`AlanUI.DebugMode` (nuevo):** en `true`, algunos `pcall` que hoy fallan en silencio a propósito (por ejemplo, sincronizar el color de un elemento de tema ya destruido) además avisan por consola — útil mientras estás desarrollando tu propio script.

### 🔧 Correcciones internas (sin cambios de API)

- **Fuga de memoria en `AlanUI.Elementos`:** los flags de una ventana ya destruida quedaban viviendo para siempre en esta tabla global. Ahora se limpia junto con el resto de los registros internos (tema, buscador, escala de texto) al crear o destruir una ventana.
- **Aliasing en Dropdown Multi:** la selección de un `Dropdown` con `Multi = true` se exponía por referencia directa — mutar la tabla obtenida de `AlanUI.Flags` o de `Get()` desde afuera podía corromper el estado visual del control sin que se notara. Ahora siempre se entrega una copia (`table.clone`, con fallback manual para ejecutores viejos).
- **Toggle y Casilla comparten su lógica interna** (Flag, registro, tecla asignada, disparo de Callback, Set/Get) en un único lugar en vez de estar duplicada palabra por palabra. Sin cambios visibles para quien usa la librería, pero un fix futuro en uno de los dos ahora aplica automáticamente al otro.

> 💡 La auditoría evaluó 13 propuestas en total; 5 quedaron afuera a propósito (dividir el registro de temas por categoría, indexar el buscador por palabra, un sistema de plugins externo, y dividir `CrearVentana` en módulos internos) porque agregaban complejidad sin un beneficio medible al tamaño real en que se usa esta librería, o porque conviene resolverlas después de otro cambio estructural primero.

---

## 🆕 Novedades v2.6

* 📏 **Cajas de valor del Slider, más grandes:** la fila completa de cada `Slider` creció (44px → 54px de alto) para poder darle a la caja de valor un tamaño real (110×32, antes 54×20) sin apretarse contra la barra ni el label. Afecta a todos los sliders de tu interfaz, incluida la pestaña Preinstalada.
* 🏷️ **Crédito de AlanUI, fijo:** el `Titulo`/`Subtitulo` de la ventana sigue siendo 100% personalizable (esa es la identidad de **tu** script), pero el subtítulo ahora termina siempre en "• AlanUI" — sin ninguna forma de sacarlo desde `CrearVentana(cfg)`. El crédito del creador (`@alanbeikersFFXD`) sigue fijo en la pestaña Preinstalada, como ya estaba.
* 👆 **Tooltip por mantener presionado (nuevo, además del "?"):** mantener presionado en cualquier parte de una fila (no solo en el ícono) también muestra su tooltip, pensado especialmente para móvil. Distingue automáticamente un "mantener quieto" real de un gesto de scroll (si te mueves más del umbral —18px en touch, 10px con mouse— mientras mantienes presionado, no se abre). Además de vigilar el toque, reacciona al evento `TouchLongPress` de la fila. El **siguiente** click o toque en cualquier lado cierra el tooltip abierto.
* ⚠️ **Confirmación antes de eliminar la ventana:** tocar la "✕" ahora pide confirmar ("Cancelar" / "Eliminar") antes de destruir la interfaz — evita perder la sesión por un toque de más, sobre todo en móvil. La API `Ventana:Destruir()` (para uso programático desde tu propio script) sigue siendo instantánea a propósito, sin diálogo.

### 🔧 Corrección de bugs (dos rondas de auditoría)

Se revisaron dos análisis externos completos de la librería (uno propio y otro de un modelo distinto) verificando cada punto contra el código real antes de tocar nada. De ahí salieron estas correcciones:

- **Fuga real en re-ejecuciones:** dos conexiones de `UserInputService` (`InputChanged`/`InputEnded`) vivían a nivel de módulo, fuera del sistema de auto-limpieza — se acumulaban para siempre en cada re-ejecución del script. Es la corrección más importante de esta ronda.
- El registro de escala de texto (`registroEscalaTexto`) tampoco se reiniciaba entre ejecuciones — mismo tipo de fuga, ya resuelto.
- Los bordes (`UIStroke`) de la ventana principal, el tooltip, la Casilla, el ColorPicker, las notificaciones, las tarjetas de sección y la píldora de minimizar no se actualizaban al cambiar de tema — quedaban pegados al color del tema inicial. `Utils.Frame` ahora acepta `ClaveTemaBorde` para registrar esto automáticamente.
- El tooltip abierto no se cerraba si la ventana se destruía mientras estaba visible (su overlay es un `ScreenGui` aparte que sobrevive por su cuenta).
- `Input.Set(v)` (el método público) no disparaba el `Callback`, a diferencia de Toggle/Slider/Dropdown/Keybind/ColorPicker, que sí lo hacen — ahora es consistente en todos los controles.
- Guardado automático bajo el archivo equivocado: si re-ejecutabas el script con `AutoGuardar = false` después de una sesión con `AutoGuardar = true`, los cambios podían guardarse silenciosamente bajo el `NombreConfig` de la ventana anterior (ya destruida).
- Conexiones de arrastre (`Utils.Arrastrable`) y de captura de tecla (`Keybind` en espera) ahora se registran en el sistema global de limpieza, en vez de depender únicamente de que el usuario termine el gesto/asignación por su cuenta.

---

## 🆕 Novedades v2.5

* 🔎 **Buscador del Dropdown más inteligente:** al escribir, la primera coincidencia visible se resalta automáticamente, y presionar **Enter** la selecciona al instante — sin tener que clickearla. Funciona en cualquier `Dropdown` con más de 8 opciones (donde ya se agrega la barra de búsqueda sola).
* 🧭 **Indicador de pestaña activa, rediseñado:** antes la pestaña seleccionada pintaba todo su fondo en el color de acento. Ahora usa una barrita delgada (lateral en modo vertical, inferior en modo horizontal) — el acento pasa a significar "esto está activo" en vez de ser un bloque de color grande. El fondo del tab se mantiene neutro siempre.
* 🎯 **Tooltips más precisos:** el círculo "?" ahora calcula su posición contra el ancho real del texto y contra dónde empieza de verdad el contenido de la derecha de cada fila (switch, badge, caja de texto, botón), en vez de un margen fijo — se ajusta distinto para cada tipo de control automáticamente. También se actualiza en vivo si cambias el tamaño de texto desde la pestaña Preinstalada.
* 🌗 **Más contraste en los temas Negro y Blanco:** el fondo de las secciones (`Panel`) ahora se distingue más claramente del fondo general (`Background`), para que la jerarquía visual de la ventana se note mejor de un vistazo.
* 🎬 **`AlanUI.Motion`:** tabla de duraciones de animación con nombre (`Directo`, `Hover`, `Press`, `Expand`, `Page`, `Modal`, `Spin`) en vez de números sueltos repartidos por el código — pensada como base para que futuras animaciones de la librería (y las tuyas, si quieres reusarla) sigan una misma personalidad de movimiento.

```lua
-- AlanUI.Motion sí es público — puedes usar sus duraciones en tus
-- propios Tweens para que se sientan consistentes con el resto de
-- la interfaz:
local info = TweenInfo.new(AlanUI.Motion.Hover, Enum.EasingStyle.Quad)
game:GetService("TweenService"):Create(miFrame, info, {BackgroundTransparency = 0}):Play()
```

---

## 🆕 Novedades v2.4

* 📊 **Monitor de rendimiento real:** la pestaña "Preinstalada" ahora muestra, además del FPS, el **Frame Time (ms)**, un **estado con semáforo** (🟢 Excelente / 🟡 Normal / 🔴 Degradado según el FPS) y la **memoria aproximada** del cliente (cuando el ejecutor la expone — si no, el dato simplemente no aparece en vez de mostrar un número falso).
* ✨ **Feedback visual al pasar el cursor (hover):** botones, filas de Toggle/Casilla/Slider, Dropdown, ColorPicker y pestañas ahora se iluminan sutilmente al pasar el mouse por encima. Es automático — no requiere ningún cambio en tu código.
* 🎨 **Degradado sutil en el color de acento:** el relleno del Slider, las barras del ColorPicker y la barra de carga inicial ahora tienen un leve degradado (en vez de color plano), y se recalcula solo al cambiar de tema. También automático, sin cambios de código necesarios.
* ⚠️ **Advertencias de desarrollo (nuevo):** AlanUI ahora detecta configuraciones incompletas o con errores de tipeo **antes** de crear el control, y avisa en la consola de Roblox (F9) sin romper tu script:
  - Un `Slider` sin `Defecto` → avisa y usa el `Min` automáticamente.
  - Un `Slider` con `Min` mayor o igual a `Max` → avisa y corrige `Max` para evitar que la barra se rompa.
  - Cualquier control con un `Callback` que no es una función (típico error de tipeo) → avisa y lo ignora en vez de crashear.
  - Un `Button` sin `Callback` → avisa, porque un botón así no tiene ninguna utilidad.

  > 💡 A propósito, un `Toggle` o `Casilla` **sin** `Callback` no genera ninguna advertencia — es un patrón válido en AlanUI (guardar el flag y leerlo después con `AlanUI:Try()`), no un error.

  Esto es distinto del sistema de captura de errores que ya existía (`AlanUI:ObtenerErrores()`), que sigue atrapando los errores que tira tu propio `Callback` **mientras corre** — ahora ambos trabajan juntos: uno revisa la configuración antes de crear el control, el otro protege la ejecución después.

---

## 📸 Capturas / Vista previa

> ✨ *Aquí puedes poner un GIF o captura de tu interfaz — ayuda mucho a que la gente se anime a probarla.*

---

## 🚀 Instalación y primer uso

Carga la librería con `loadstring`:

```lua
local AlanUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/alanbeikers9/AlanUI/main/AlanUI.lua"))()

-- ── CREAR LA VENTANA PRINCIPAL ──
local Ventana = AlanUI:CrearVentana({
    Titulo        = "AlanUI Premium",
    Subtitulo     = "by AlanbeikersFF",
    TamanoX       = 560,
    TamanoY       = 340,
    TeclaToggle   = Enum.KeyCode.RightControl, -- tecla para abrir/cerrar la interfaz
    Buscador      = true,                      -- activa la barra de búsqueda global
    AutoGuardar   = true,                      -- activa el guardado nativo de configuración
    NombreConfig  = "AlanUI_Settings",         -- nombre del archivo de configuración
})

-- ── CREAR TABS DE NAVEGACIÓN ──
local TabPrincipal = Ventana:CrearTab("Principal", "🏠")
local TabAjustes   = Ventana:CrearTab("Ajustes", "⚙️")

-- ── CREAR SECCIONES ──
local SeccionCombate = TabPrincipal:CrearSeccion("Combate / Automatización")
local SeccionTemas   = TabAjustes:CrearSeccion("Personalización de Interfaz")

-- ── AGREGAR TU PRIMER ELEMENTO ──
SeccionCombate:Toggle({
    Texto = "Modo Automático",
    Flag = "modoAutomatico",
    Defecto = false,
    Callback = function(estado)
        print("Modo Automático:", estado)
    end
})

-- ── ACTIVAR EL SELECTOR DE TEMAS NATIVO ──
Ventana:AgregarSelectorTemas()

-- ── AVISAR AL USUARIO QUE EL SCRIPT CARGÓ ──
AlanUI:Notificar({
    Titulo = "¡AlanUI Cargado!",
    Texto = "El script se ha ejecutado de forma exitosa.",
    Duracion = 5
})
```

### ⚙️ Parámetros de `CrearVentana`

Todos son opcionales: si no pasas nada, la ventana se crea con estos valores.

| Parámetro | Tipo | Por defecto | Qué hace |
|---|---|---|---|
| `Titulo` | texto | `"AlanUI"` | Título de la ventana. |
| `Subtitulo` | texto | `"by AlanbeikersFF"` | Texto bajo el título. La librería le agrega al final `•  AlanUI v<versión>` automáticamente. |
| `TamanoX` / `TamanoY` | número (px) | `560` / `340` | Tamaño base de la ventana. |
| `TeclaToggle` | `Enum.KeyCode` | `Enum.KeyCode.RightControl` | Tecla que abre y cierra la interfaz. |
| `Borde` | formato de borde | el de siempre | Borde de la ventana con color, degradado y animación. Ver [Bordes con degradado y animación](#-bordes-con-degradado-y-animación-v2125). |
| `PosicionInicial` | `UDim2` | centro de la pantalla | Dónde nace la ventana. Es también la posición a la que vuelve `Ventana:ResetearPosicion`. |
| `GuardarPosicion` | booleano | `true` | Recuerda dónde dejaste la ventana entre ejecuciones. Con `false` siempre abre en `PosicionInicial`. Ver [Posición de la ventana](#posición-de-la-ventana-v2125). |
| `Orientacion` | texto | barra lateral | Con `"horizontal"` las pestañas van en una barra superior. Cualquier otro valor deja la barra lateral. Se puede cambiar después con `Ventana:CambiarOrientacion`. |
| `Buscador` | booleano | `true` | Barra de búsqueda global. Con `false` no se crea. |
| `PestanaPreinstalada` | `false` o tabla | activa | `false` quita la pestaña del sistema; una tabla como `{ Nombre = "⚙️ Sistema" }` la personaliza. |
| `AutoGuardar` | booleano | `true` | Guarda los Flags solo, en segundo plano. Con `false` se desactiva. Necesita que el ejecutor soporte archivos. |
| `NombreConfig` | texto | `"autosave"` | Nombre del archivo de guardado: se escribe en `AlanUI/Config/<NombreConfig>.json`. |

> ⚠️ **Pon siempre tu propio `NombreConfig`.** Si dos scripts que usan AlanUI no lo definen, los dos guardan en `AlanUI/Config/autosave.json` y se pisan los valores entre sí.

> ℹ️ **Nota importante:** al llamar `CrearVentana`, la interfaz **ya viene con la pestaña "🔧 Preinstalada" agregada automáticamente** (FPS, info del ejecutor, selector de tema, orientación, tamaño de ventana). No necesitas crearla ni llamarla — ya está ahí cuando la ventana termina de abrirse. Solo si por alguna razón NO la quieres, debes desactivarla explícitamente (ver sección de abajo).

---

## 🎮 Probar la vitrina interactiva

¿Prefieres ver todo funcionando antes de leer la referencia? Ejecuta la **vitrina**: una ventana de AlanUI con **5 pestañas** (Controles, Ventana y layout, Alertas, Estados, APIs y diagnóstico) donde cada control y cada función aparece en vivo, con un tooltip que explica qué demuestra.

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/alanbeikers9/AlanUI/refs/heads/main/AlanUI_Vitrina.lua"))()
```

- No necesitas cargar AlanUI antes: la vitrina la carga sola.
- El código está en [`AlanUI_Vitrina.lua`](AlanUI_Vitrina.lua), así que también sirve como **ejemplo completo y comentado** para copiar.
- En la pestaña **Alertas** hay una sección **Configurar tag** para armar un tag a tu gusto (texto, ícono, color, degradado, animación, clickeable) y agregarlo al header.
- Hay demos de los controles nuevos: `Keybind` en modo Hold y Toggle y un `ColorPicker` 2D (pestaña Controles), `Columnas` y la posición de la ventana (pestaña Ventana), `Dialogo` por tipo (pestaña Alertas) y las opciones globales (pestaña APIs).
- "Simular segundo script" abre la ventana nueva con el **mismo tamaño** que la primera, para que se vea igual que la primera vez que se lanzó la interfaz.

---

## 📚 Referencia de la API

### Elementos (van dentro de una Sección)

> 🧠 **Antes de empezar — 4 palabras que vas a ver en TODOS los elementos:**
>
> - **`Flag`** — es el "nombre de identificación" único de ese control. Con ese nombre AlanUI guarda y recupera su valor (por ejemplo, si el usuario activó un Toggle, el Flag es lo que permite recordarlo y restaurarlo la próxima vez que se abra el script). Es como la etiqueta de una caja: sin etiqueta no sabes qué hay adentro ni puedes volver a encontrarla. Si no le pones uno, AlanUI le asigna uno automático, pero entonces no podrás acceder a ese valor fácilmente desde tu código — **siempre es buena práctica ponerle uno tú mismo**, en minúsculas y sin espacios (ej. `"auto_modo"`).
> - **`Defecto`** — es el valor inicial con el que aparece el control la primera vez que se abre la interfaz, antes de que el usuario lo toque. `Defecto = false` en un Toggle significa que empieza apagado; `Defecto = 16` en un Slider significa que arranca en el número 16.
> - **`Callback`** — es la función que se ejecuta automáticamente cada vez que el usuario interactúa con el control. Aquí es donde tú escribes qué debe pasar cuando el usuario lo activa, mueve el slider, escribe algo, etc. El valor que el usuario acaba de elegir llega como parámetro dentro de esa función (en los ejemplos se le suele llamar `estado`, `valor` o `v` — el nombre lo eliges tú).
> - **`Texto`** — es simplemente lo que se ve escrito en pantalla junto al control.

> 🔀 **Además, CUALQUIER elemento acepta `VisibleSi` (opcional, v2.7+):** una función que devuelve `true` o `false`. Si devuelve `false`, la fila entera se oculta — pensado para que un control dependa del estado de otro (ej. "Distancia" solo visible si "Auto Farm" está activo). Se re-evalúa automáticamente cada vez que cualquier flag cambia, sin que tengas que declarar de cuál depende. Ver el ejemplo completo en "Novedades v2.7" más arriba.

> 💬 **Y también `Tooltip` (opcional, universal):** cualquier control acepta `Tooltip = "texto de ayuda"` — un círculo "?" (o mantener presionado en mobile) que muestra ese texto. No es exclusivo de ningún control puntual, funciona en Toggle, Slider, Dropdown, Boton, Input, RadioGroup, Progreso, ColorPicker y Keybind.

> 🔒 **Y también `Locked` / `LockedTitle` (opcional, v2.12.5+):** los controles interactivos (`Boton`, `Toggle`, `Casilla`, `Slider`, `RangeSlider`, `NumberStepper`, `Input`, `TagInput`, `Dropdown`, `RadioGroup`, `ColorPicker`, `Keybind`) aceptan `Locked = true` para nacer bloqueados, con `LockedTitle = "Requiere VIP"` como motivo visible. Ver "Bloqueo y resaltado de controles" más abajo.

#### 0. CrearSección (contenedor de controles)

`Tab:CrearSeccion(nombre, cfg)` agrupa controles relacionados dentro de una pestaña. Por defecto la sección es colapsable (ver Novedades v2.12).

**Segundo parámetro opcional (`cfg`):**

| Campo | Efecto |
|---|---|
| `Colapsable` | `false` desactiva el colapso: el header vuelve a ser un texto simple, idéntico al comportamiento anterior a v2.12. Default: `true`. |
| `ColapsadaPorDefecto` | `true` hace que la sección arranque colapsada. Solo tiene efecto si la sección es colapsable. Default: `false`. |

```lua
local Seccion = Tab:CrearSeccion("Combate")                       -- colapsable (default)
local Fija    = Tab:CrearSeccion("Notas", { Colapsable = false }) -- header solo-texto
local Avanzada = Tab:CrearSeccion("Debug", { ColapsadaPorDefecto = true })
```

#### 1. Toggle (Interruptor)
Interruptor de dos estados (encendido/apagado), ideal para activar/desactivar funciones continuas — por ejemplo, un modo que corre todo el tiempo hasta que lo apagas.

```lua
SeccionCombate:Toggle({
    Texto = "Auto Modo",       -- Lo que ve el usuario junto al interruptor
    Flag = "auto_modo",        -- ID único para guardar/recuperar este valor
    Defecto = false,           -- Empieza apagado
    Callback = function(estado)
        -- "estado" llega como true o false, según si el usuario lo prendió o apagó
        print("Auto Modo:", estado)
    end
})
```

> 🆕 **Exclusión mutua con `Desactivar`:** tanto `Toggle` como `Casilla` aceptan `Desactivar = {"otroFlag1", "otroFlag2"}` — una lista de Flags de **otros** Toggle/Casilla que se apagan automáticamente cuando este se enciende. Es el patrón que la gente busca para hacer algo tipo "Farm / PvP / Raid" donde solo uno puede estar activo a la vez. Tres detalles importantes:
> - Solo funciona **entre** `Toggle` y `Casilla` — no aplica a `RadioGroup`, `Dropdown` ni ningún otro control (para eso, `RadioGroup` ya es selección única por diseño).
> - Solo dispara en la dirección de **encendido**: apagar este control no vuelve a encender nada.
> - El `Callback` del control que se apaga **sí se ejecuta** (recibe `false`) — no es un apagado silencioso.
>
> ```lua
> SeccionCombate:Toggle({
>     Texto = "Modo Farm", Flag = "modo_farm",
>     Desactivar = {"modo_pvp", "modo_raid"},
>     Callback = function(v) print("Farm:", v) end,
> })
> ```

> 🆕 **Atajo de teclado con `Tecla`:** tanto `Toggle` como `Casilla` aceptan `Tecla = Enum.KeyCode.X` para que el usuario pueda alternar el control con una tecla, además de tocarlo con el mouse/dedo.
>
> ```lua
> SeccionCombate:Toggle({ Texto = "Auto Modo", Flag = "auto_modo", Tecla = Enum.KeyCode.F })
> ```

#### 2. Slider (Barra de ajuste)
Ajuste numérico dentro de un rango, suave y con límites definidos.

```lua
SeccionCombate:Slider({
    Texto = "Velocidad de Caminado (WalkSpeed)",
    Min = 16,
    Max = 500,
    Incremento = 5,      -- El valor salta de 5 en 5 (ej: 16, 21, 26...). Por defecto es 1.
    Sufijo = " studs/s",  -- Texto que se agrega despues del numero mostrado (ej: "120 studs/s")
    Defecto = 16,
    Callback = function(valor)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = valor
    end
})
```

> 🆕 **Marcas de escalón con `Pasos`:** agregando `Pasos = true`, el Slider dibuja marcas divisorias visuales por cada valor que cae en un múltiplo de `Incremento` — útil para que el usuario vea de un vistazo dónde caen los "escalones" en rangos con pocos pasos posibles (ej. `Min=0, Max=100, Incremento=25` dibuja marcas en 0, 25, 50, 75, 100).

> 🆕 **Manija (v2.12.5+):** el `Slider` muestra un círculo al final del relleno para ver dónde está el valor. En el `Slider` mide 22 px (20 px en el `RangeSlider`). `Manija = false` lo quita.

#### 3. Dropdown (Menú desplegable)
Lista de opciones seleccionables. Si tiene más de 8 opciones, agrega buscador automáticamente (no es configurable manualmente — es siempre por ese umbral).

```lua
SeccionCombate:Dropdown({
    Texto = "Método de Movimiento",
    Opciones = {"Tween", "Set PrimaryPart CFrame", "Instant Teleport", "Safe Jump"},
    Defecto = "Tween",   -- Cuál opción viene seleccionada al abrir la interfaz
    Callback = function(opcionSeleccionada)
        print("Método activo:", opcionSeleccionada)
    end
})
```

> ⚠️ **Nota sobre `Defecto = "Tween"`:** "Tween" acá es solo uno de los textos de `Opciones`, no una animación que AlanUI ejecute — `Defecto` siempre debe ser un string que ya exista en `Opciones`. Es tu `Callback` el que decide qué hacer según la opción elegida.

> 🆕 **Selección múltiple con `Multi`:** agregando `Multi = true`, el usuario puede marcar varias opciones a la vez. Con `Multi`, `Defecto` deja de ser un string suelto y pasa a ser una **tabla** de las opciones que empiezan marcadas, y el `Callback` recibe una tabla (`{opcion = true, ...}`) en vez de un string.
>
> ```lua
> SeccionCombate:Dropdown({
>     Texto = "Efectos activos",
>     Opciones = {"Fuego", "Hielo", "Veneno"},
>     Multi = true,
>     Defecto = {"Fuego"}, -- tabla, no string
>     Callback = function(seleccionados)
>         for efecto, activo in pairs(seleccionados) do print(efecto, activo) end
>     end
> })
> ```

> 🆕 **Opciones enriquecidas (v2.12.5+):** cada entrada de `Opciones` puede ser, además de un string, una tabla `{ Titulo = "Espada", Descripcion = "Daño alto", Icono = "⚔️", Locked = true, LockedTitle = "Nivel 20" }`. Una entrada `{ Tipo = "Divider" }` dibuja una línea separadora entre grupos de opciones. Los títulos duplicados se ignoran con una advertencia. Las opciones bloqueadas se ven con 🔒 y su motivo, y no se pueden elegir.
>
> ```lua
> SeccionCombate:Dropdown({
>     Texto = "Arma",
>     Opciones = {
>         "Puños",
>         { Tipo = "Divider" },
>         { Titulo = "Espada", Descripcion = "Daño alto", Icono = "⚔️" },
>         { Titulo = "Hacha",  Descripcion = "Lenta", Locked = true, LockedTitle = "Nivel 20" },
>     },
>     Defecto = "Puños",
> })
> ```

#### Opciones dinámicas del Dropdown
Un `Dropdown` puede cambiar su lista de opciones **después** de creado — útil para listas que dependen del juego (jugadores, armas, perfiles guardados). El control devuelto expone cuatro funciones:

```lua
local dd = SeccionCombate:Dropdown({ Texto = "Objetivo", Opciones = { "Ninguno" }, Defecto = "Ninguno" })

dd.ActualizarOpciones({ "Ana", "Beto", "Carla" })  -- reemplaza TODA la lista
dd.AgregarOpcion("Dani")                            --> true  (false si es texto vacío o ya existe)
dd.EliminarOpcion("Beto")                           --> true  (false si no estaba)
dd.LimpiarOpciones()                                -- deja la lista vacía
```

- `AgregarOpcion` y `EliminarOpcion` aceptan llamada con `.` o con `:`. **`ActualizarOpciones` y `LimpiarOpciones` se llaman con punto** (`dd.ActualizarOpciones(lista)`), igual que en el resto de la librería.
- `AgregarOpcion` solo agrega **textos**. Para opciones con descripción, ícono o bloqueo (ver "Opciones enriquecidas"), usa `ActualizarOpciones` con la lista completa.
- Si la opción elegida **ya no está** en la nueva lista, la selección se vacía (el `Flag` queda en `nil`) y **no se ejecuta el `Callback`**. En modo `Multi` se conservan solo las opciones que siguen existiendo.
- Los botones que siguen existiendo se reutilizan: solo se crean o destruyen los que cambiaron.
- Si la lista supera cierto tamaño, aparece sola la caja de búsqueda.

#### 4. Boton (Botón)
Ejecuta una función inmediatamente al hacer clic.

```lua
SeccionCombate:Boton({
    Texto = "Ejecutar Acción",
    Callback = function()
        print("Acción ejecutada.")
    end
})
```

> 🆕 **Icono opcional (v2.10+):** agregando `Icono = "💾"` (un emoji o caracter unicode) obtienes un botón tipo "💾 Ejecutar Acción" — simplemente se antepone al texto, sin crear ninguna instancia extra.

> 🆕 **Texto a la derecha con `Interact` (v2.12.5+):** `Interact = "Ctrl+K"` muestra un texto corto a la derecha del botón (en color de acento). El control devuelto expone `SetInteract(texto)` y `GetInteract()` para cambiarlo en vivo.

> 🆕 **Ejecución asíncrona con `Async`:** agregando `Async = true`, mientras el `Callback` está corriendo se muestra un spinner de carga en el botón y se bloquea contra taps repetidos (si el usuario vuelve a tocar mientras ya está corriendo, no pasa nada) — útil para Callbacks que tardan (una petición HTTP, leer/escribir un archivo grande).
>
> ```lua
> SeccionCombate:Boton({
>     Texto = "Sincronizar datos",
>     Async = true,
>     Callback = function()
>         task.wait(2) -- algo que tarda
>     end
> })
> ```

#### 5. Keybind (Tecla asignable)
Permite que el usuario asigne (o reasigne) una tecla del teclado para disparar una acción, sin que tú tengas que programar esa lógica de captura — AlanUI ya la trae integrada.

```lua
SeccionCombate:Keybind({
    Texto = "Activar función",
    Defecto = Enum.KeyCode.E,   -- Tecla con la que empieza asignada (el usuario puede cambiarla)
    Callback = function(tecla)
        -- Se llama cada vez que se "presiona" la tecla asignada
        print("Tecla presionada.")
    end
})
```

> ⌨️ **¿Cómo funciona exactamente? (respondiendo tu pregunta):**
>
> Sí — si el script corre en **PC**, AlanUI **sí detecta automáticamente** las teclas del teclado físico. Así es el flujo:
>
> 1. El elemento aparece mostrando la tecla actual (por ejemplo, "E") en un botoncito.
> 2. El usuario le da clic a ese botón. Esto pone al Keybind en "modo escucha".
> 3. La **siguiente tecla** que el usuario presione en su teclado se captura automáticamente y se asigna como la nueva tecla — no hace falta que tú escribas ningún código para esto, ya viene resuelto dentro de la librería.
> 4. A partir de ahí, cada vez que el usuario presione esa tecla en el juego, se ejecuta tu `Callback`.
>
> **Caso especial — cuando NO hay teclado físico (celular sin control conectado):** el código de AlanUI detecta si el dispositivo tiene teclado o gamepad disponible. Si no hay ninguno de los dos (celular con solo pantalla táctil), el Keybind deja de esperar una tecla —que nunca llegaría— y el botón se convierte automáticamente en un botón de acción directa: cada toque en pantalla equivale a "presionar" la tecla asignada. Esto es completamente automático, no tienes que configurar nada distinto para móvil.

> 🆕 **Combinaciones con modificadores (v2.9+):** agregando `ConModificadores = true`, el valor pasa de ser un `Enum.KeyCode` suelto a una tabla `{KeyCode, Ctrl, Shift, Alt}` — útil para atajos como "Ctrl+Shift+F". Ver el ejemplo completo en "Novedades v2.9" más arriba.

> 🆕 **El `Callback` no se dispara al asignar (v2.11.2+):** asignar o reasignar la tecla **no** ejecuta el `Callback` — solo presionarla después en el juego lo hace. Si necesitas reaccionar también en el momento exacto de la asignación, escucha `AlanUI.Eventos.FlagCambiada` para ese flag en particular.

> ⚠️ **Detección de conflictos (v2.11.2+):** si asignas una tecla que ya está en uso por otro `Keybind` de la misma ventana, aparece una notificación avisando cuál — no se bloquea la asignación ni se toca el otro `Keybind` automáticamente, ambos quedan con la misma tecla. También se revisa al cargar un perfil guardado que ya tenía el conflicto.

> 🆕 **Modos de tecla — `Modo` (v2.12.5+):** el `Callback` puede recibir la tecla (como siempre), el estado de "mantener presionada" o un estado que alterna.
>
> ```lua
> SeccionCombate:Keybind({ Texto = "Agacharse", Flag = "agacharse", Defecto = Enum.KeyCode.C, Modo = "Hold",
>     Callback = function(presionada) print(presionada and "abajo" or "arriba") end })
>
> local kb = SeccionCombate:Keybind({ Texto = "Modo vuelo", Flag = "vuelo", Defecto = Enum.KeyCode.V, Modo = "Toggle",
>     Callback = function(encendido) print("Vuelo:", encendido) end })
> print(kb.GetEstado(), AlanUI:ObtenerFlag("vuelo_estado"))
> ```
>
> | `Modo` | El `Callback` recibe | Notas |
> |---|---|---|
> | `"Press"` (default) | la tecla asignada | Como siempre. |
> | `"Hold"` | `true` al presionar y `false` al soltar | En celular sin teclado, "mantener" es mantener el dedo sobre el botón (en este modo el toque largo ya no rota la tecla). |
> | `"Toggle"` | `true` / `false` alternando en cada pulsación | La tecla asignada sigue siendo el valor del Flag (se guarda como siempre). El estado vive en el flag `"<Flag>_estado"`, que **no** se guarda en perfiles. El control devuelto agrega `GetEstado()` y `SetEstado(bool)`. |
>
> En `"Hold"` y `"Toggle"` el `Callback` habla de **estado**, así que asignar o restaurar una tecla (por ejemplo al cargar un perfil) **no** lo ejecuta. El título de la fila muestra `[Hold]` o `[Toggle]`. Un modo desconocido avisa por consola y usa `"Press"`.

#### 6. ColorPicker (Selector de color)
Abre un sub-menú para elegir un color RGB personalizado.

```lua
SeccionCombate:ColorPicker({
    Texto = "Color Principal",
    Defecto = Color3.fromRGB(255, 0, 0),
    Callback = function(nuevoColor)
        print("Nuevo color seleccionado:", nuevoColor)
    end
})
```

> 🆕 **Campo Hex (v2.9+):** debajo de los sliders R/G/B hay un campo `#RRGGBB` (también acepta `#RGB`) que se sincroniza en ambas direcciones con los sliders — no requiere ninguna opción extra en el código, ya viene incluido.

> 🆕 **Paleta de colores comunes (v2.10+):** arriba de los sliders hay una fila de 8 swatches (rojo, verde, azul, amarillo, magenta, cian, blanco, negro) — un click aplica el color de una vez. Tampoco requiere ninguna opción extra.

> 🆕 **`Estilo = "2D"` (v2.12.5+):** además del estilo de siempre (`"RGB"`), el `ColorPicker` puede mostrar un **cuadrado de saturación/valor** y una **barra de matiz**, manteniendo el campo Hex y las muestras.
>
> ```lua
> SeccionCombate:ColorPicker({ Texto = "Color 2D", Flag = "color2d", Estilo = "2D", Defecto = Color3.fromRGB(220, 90, 90) })
> AlanUI.Opciones.ColorPickerEstiloPredeterminado = "2D" -- para los ColorPicker que se creen después sin 'Estilo'
> ```
>
> Es **opcional**: sin `Estilo` se usa `AlanUI.Opciones.ColorPickerEstiloPredeterminado`, que por defecto es `"RGB"`. El panel 2D es más alto (170 px en vez de 126). Mientras arrastras dentro del cuadrado la página no hace scroll, y el matiz se conserva al pasar por grises o negro.

#### 7. Casilla (Checkbox)
Alternativa visual al Toggle: una casilla clásica para marcar o desmarcar.

```lua
SeccionCombate:Casilla({
    Texto = "Activar Función Segura",
    Flag = "funcion_segura",
    Defecto = false,
    Callback = function(valor)
        print("Casilla marcada:", valor)
    end
})
```

#### 8. Párrafo informativo
Elemento puramente visual, para notas, advertencias o créditos.

```lua
SeccionCombate:Parrafo({
    Titulo = "⚠️ ADVERTENCIA",
    Contenido = "Usa este script bajo tu propio riesgo.",
    RichText = false -- soporta texto enriquecido si se activa
})
```

> 🆕 **Campos extra de `Parrafo` (v2.12.5+):** `ImagenUrl` (banner arriba del texto, con `ImagenAlto` entre 40 y 300, default 110, y `ImagenEscala = "Fit"` o recorte por defecto), `MiniaturaUrl` (miniatura a la derecha) y `Botones = { { Texto, Variante, Callback }, ... }` (fila de botones debajo del texto; `Variante` puede ser `"primary"` o `"danger"`). Las imágenes se pasan como `rbxassetid://...`. El control devuelto expone `Set(texto)`, `Instancia` y `Botones`.

#### 9. Label (Etiqueta de solo lectura)
Muestra un texto informativo con un valor a la derecha que puedes actualizar por código (por ejemplo, un contador de FPS o un estado). No es interactivo para el usuario — se actualiza con `Set()`.

```lua
local lblEstado = SeccionCombate:Label({
    Texto = "Estado del servidor",
    Flag = "estado_servidor",
    Valor = "Conectando..."
})

-- Más adelante, en tu script:
lblEstado.Set("Conectado ✅")
print(lblEstado.Get()) --> "Conectado ✅"
```

> 🆕 **`Descripcion` (v2.12.5+):** `Label` acepta `Descripcion = "texto largo"` — aparece una flecha a la izquierda de la fila que despliega/oculta ese texto explicativo debajo. `Parrafo` también acepta `Descripcion` (texto secundario dentro del bloque).

#### 10. Input (Campo de texto)
Caja de texto editable por el usuario.

```lua
SeccionCombate:Input({
    Texto = "Nombre",
    Flag = "nombre",
    Defecto = "",
    Placeholder = "Escribe aquí...",
    Callback = function(valor)
        print("Texto ingresado:", valor)
    end
})
```

> 🆕 **Validación con `Tipo` (v2.9+):** `Tipo = "number"` (con `Min`/`Max` opcionales) o `Tipo = "pattern"` (con `Regex`) validan lo que el usuario escribe antes de aceptarlo. La validación y el `Callback` corren al perder el foco (`FocusLost` — típicamente presionando Enter o tocando fuera del campo), no en cada tecla mientras se escribe. Ver el ejemplo completo en "Novedades v2.9" más arriba.

> 🆕 **Límite de caracteres con `MaxCaracteres`:** por defecto el campo acepta hasta 200 caracteres; se puede ajustar con `MaxCaracteres = 50`, por ejemplo.

> 🆕 **Contador visible (v2.11.2+):** aparece un pequeño "180/200" en la esquina inferior derecha del campo cuando el texto llega al 80% de `MaxCaracteres` — por debajo de ese umbral no se muestra nada, para no generar ruido visual en campos cortos. Desactivable por completo con `OcultarContador = true`.

#### 11. RadioGroup (Selector horizontal)
Alternativa a Dropdown cuando hay pocas opciones (2-4 es el caso típico): todas quedan visibles en una fila, sin desplegar nada.

```lua
SeccionCombate:RadioGroup({
    Texto = "Modo",
    Flag = "modo",
    Opciones = {"Farm", "PvP", "Raid"},
    Defecto = "Farm",
    Callback = function(v) print("Modo:", v) end,
})
```

#### 12. Progreso (Barra de progreso)
Barra de solo lectura (no interactiva), para mostrar cooldowns, progreso de auto-farm, carga de datos, etc. Se actualiza con `Set(0-100)`.

```lua
local barra = SeccionCombate:Progreso({ Texto = "Progreso del farm" })
barra.Set(45) -- 45%
```

> ℹ️ **`Progreso` (y `Label`) nunca se guardan en disco:** aunque les pongas un `Flag`, son controles pensados para mostrar un valor que cambia todo el tiempo (progreso en curso, un contador), así que quedan excluidos del sistema de guardado por diseño — no tiene sentido "restaurar" un progreso a medio camino al reabrir el script.

#### 13. Divider (Separador de sección)
Separador visual liviano entre grupos de controles relacionados dentro de una sección — una línea delgada, opcionalmente con un título chico. Mucho más liviano que `Parrafo` (sin caja de fondo, sin padding) para este propósito.

```lua
SeccionCombate:Divider() -- linea simple
SeccionCombate:Divider({ Texto = "Ajustes avanzados" }) -- linea con titulo arriba
```

#### 14. RangeSlider (Slider de rango)
Dos manijas en una misma barra, para elegir un **rango** (mínimo y máximo) en vez de un solo valor — ej. "distancia entre 20 y 80".

```lua
SeccionCombate:RangeSlider({
    Texto = "Distancia",
    Flag = "distancia",
    Min = 0, Max = 100, Incremento = 5, Sufijo = " studs",
    Defecto = { min = 20, max = 80 },
    Callback = function(rango)
        print(rango.min, rango.max)
    end,
})
```

- El valor (en el `Callback`, `Get()` y `AlanUI.Flags`) es una tabla `{ min = n, max = n }`. `Set` recibe esa misma forma.
- Sin `Defecto`, arranca con el rango completo (`Min`–`Max`) y avisa por consola. Si `Defecto.min > Defecto.max`, se intercambian solos.
- Mismas validaciones que `Slider`: `Min >= Max` ajusta `Max` a `Min + 1`; `Incremento <= 0` usa `1`; avisa si `Incremento` no divide el rango y el máximo no se puede alcanzar.

#### 15. TagInput (Lista de etiquetas)
Lista de textos libres mostrados como "chips" — ej. palabras clave, o nombres de jugadores a ignorar.

```lua
SeccionCombate:TagInput({
    Texto = "Jugadores ignorados",
    Flag = "ignorados",
    Placeholder = "Nombre y Enter...",
    MaxTags = 10,
    MaxCaracteres = 30,
    Defecto = { "Amigo1", "Amigo2" },
    Callback = function(lista)
        print(#lista, "etiquetas")
    end,
})
```

- El valor es un **array** ordenado (`{"Amigo1","Amigo2"}`), no un diccionario como el `Dropdown` con `Multi`.
- Se agregan escribiendo y presionando Enter (o tocando afuera). El separador es la **coma** — pegar `a,b,c` crea tres etiquetas; el espacio no separa.
- Los duplicados se descartan sin distinguir mayúsculas. `Backspace` con la caja vacía borra la última etiqueta.
- `MaxTags` limita la cantidad (sin límite si se omite); `MaxCaracteres` limita el largo del texto en la caja (default 200).

#### 16. NumberStepper (Contador numérico)
Campo numérico con botones **−** y **+**, para valores donde importa escribir o ajustar de a un paso (a diferencia del `Slider`, no es una barra).

```lua
SeccionCombate:NumberStepper({
    Texto = "Cantidad",
    Flag = "cantidad",
    Min = 1, Max = 99, Incremento = 1,
    Defecto = 10,
    Prefijo = "x", Sufijo = " uds",
    Callback = function(n) print("Cantidad:", n) end,
})
```

- Con el campo enfocado, las flechas ↑ / ↓ del teclado suben y bajan el valor.
- `Decimales` (opcional) fuerza la cantidad de decimales mostrados; si se omite se deduce de `Incremento` (`0.25` → 2 decimales).
- `Set(v)` ignora (con aviso en consola) cualquier valor que no sea `number`, y recorta/redondea al rango y al `Incremento`.

#### 17. Imagen
Muestra una imagen dentro de la sección. Roblox solo carga assets propios: usa `rbxassetid://...` — una URL web (`https://...`) no funciona y se avisa por consola.

```lua
local img = SeccionCombate:Imagen({
    Url = "rbxassetid://1234567890",
    Aspecto = "16:9",   -- o un número (1.78); si se omite, se usa Alto fijo
    Escala = "Crop",    -- "Fit", "Crop" o "Stretch"
    Radio = 8,
})
img.Set("rbxassetid://9876543210") -- cambia la imagen en vivo
```

Con `Aspecto` la altura se calcula sola según el ancho; sin él se usa `Alto` (entre 40 y 400, default 120). Por defecto, `Escala` es `"Crop"` si hay `Aspecto` y `"Fit"` si no.

#### 18. Grupo (botones en una misma fila)
Agrupa varios `Boton` lado a lado. Si el ancho disponible es menor a `AnchoMinimo` por botón, pasan a apilarse en vertical solos (útil en móvil).

```lua
local grupo = SeccionCombate:Grupo({ Alto = 32, AnchoMinimo = 120 })
grupo:Boton({ Texto = "Guardar",  Callback = function() end })
grupo:Boton({ Texto = "Cargar",   Callback = function() end })
grupo:Boton({ Texto = "Eliminar", Callback = function() end })
```

`Alto` se limita entre 26 y 60 (default 32); `AnchoMinimo` default 120. Cada `grupo:Boton(cfg)` acepta los mismos campos que `Seccion:Boton`.

#### 19. Construir (armar una sección desde una tabla)
`Seccion:Construir(lista)` crea varios controles de una sola vez a partir de una lista de tablas. Cada entrada lleva `Control = "NombreDelControl"` más los campos normales de ese control.

```lua
local elementos = SeccionCombate:Construir({
    { Control = "Toggle", Texto = "Auto Modo", Flag = "auto_modo", Defecto = false },
    { Control = "Slider", Texto = "Velocidad", Flag = "vel", Min = 0, Max = 100, Defecto = 50 },
    { Control = "Divider", Texto = "Avanzado" },
    { Control = "Boton",  Texto = "Aplicar", Callback = function() print("ok") end },
})
elementos.vel.Set(80)  -- por Flag
elementos[1].Set(true) -- o por posición
```

- Tipos válidos: `Boton, Toggle, Casilla, Slider, RangeSlider, NumberStepper, Input, TagInput, Dropdown, RadioGroup, ColorPicker, Keybind, Label, Progreso, Parrafo, Divider, Imagen`. Un tipo desconocido se omite con una advertencia.
- Devuelve una tabla indexada por **posición** y, si el control tiene `Flag`, también por **Flag**.
- Si la entrada no trae `Control` pero su campo `Tipo` es uno de los nombres de arriba, se usa `Tipo` como nombre del control.

#### 20. Columnas (dos columnas en una sección)
`Seccion:Columnas()` devuelve **dos sub-secciones**. Cada una acepta los mismos controles que una sección (`Boton`, `Toggle`, `Slider`, `Input`, `Dropdown`, `Grupo`, `Construir`...) y los pone en su columna.

```lua
local izq, der = SeccionCombate:Columnas({
    Proporcion  = 0.5,   -- ancho de la columna izquierda (0.15 a 0.85)
    Separacion  = 12,    -- píxeles entre columnas (0 a 40)
    MinimoAncho = 400,   -- por debajo de este ancho base, se apilan
})

izq:Toggle({ Texto = "A", Flag = "a" })
izq:Slider({ Texto = "Valor A", Flag = "va", Min = 0, Max = 100, Defecto = 40 })
der:Toggle({ Texto = "B", Flag = "b" })
der:Dropdown({ Texto = "Modo B", Flag = "mb", Opciones = { "Uno", "Dos" }, Defecto = "Uno" })
```

- `MinimoAncho` se mide en píxeles **base**, sin contar la escala de la interfaz. Con la ventana por defecto (560 px) las columnas suelen apilarse; con 640 px o más se ven lado a lado (aproximado: depende de los márgenes).
- Los controles se crean en la sección y se mueven a su columna, así que `Locked`, `VisibleSi`, `Tooltip` y la búsqueda funcionan igual.
- No se pueden anidar columnas dentro de una columna.

---

### Funciones de la Ventana

#### `Ventana:Buscar(texto)`
Filtra manualmente los controles visibles según el texto dado, igual que si el usuario escribiera en la barra de búsqueda. Útil si quieres disparar una búsqueda desde tu propio código (por ejemplo, un botón "buscar combos").

```lua
Ventana:Buscar("velocidad")
-- Deja visibles solo los controles cuyo Texto contenga "velocidad"

Ventana:Buscar("") -- Limpia el filtro y muestra todo de nuevo
```

#### `Ventana:CambiarOrientacion(modo)`
Cambia en caliente entre tabs laterales (`"vertical"`) y tabs en barra superior (`"horizontal"`), sin necesidad de recrear la ventana. Con la ventana ya visible, la barra que aparece entra deslizándose con un fade mientras el contenido se reacomoda.

```lua
Ventana:CambiarOrientacion("horizontal") -- tabs arriba
Ventana:CambiarOrientacion("vertical")   -- tabs al lado (default)
```

#### `Ventana:CambiarTema(nombre)`
Aplica uno de los temas nativos a toda la interfaz con una transición suave de colores, y muestra una notificación confirmando el cambio. Solo se animan los elementos visibles: lo que está en pestañas ocultas cambia directo.

```lua
Ventana:CambiarTema("Verde")
-- Cambia todos los colores de la interfaz al tema "Verde" y notifica al usuario
```

#### `Ventana:Minimizar()` / `Ventana:Mostrar()` / `Ventana:EstaVisible()`
Controlan la visibilidad de la ventana desde tu código, igual que la tecla `TeclaToggle`. `EstaVisible()` devuelve `true` si está abierta.

```lua
Ventana:Minimizar()
if not Ventana:EstaVisible() then Ventana:Mostrar() end
```

#### Posición de la ventana (v2.12.5+)
La ventana recuerda dónde la dejaste entre ejecuciones del mismo script.

| Función | Qué hace |
|---|---|
| `Ventana:ResetearPosicion()` | Vuelve al centro (o a `PosicionInicial`). |
| `Ventana:GuardarPosicion()` | Escribe la posición actual ya, sin esperar. Devuelve `true`/`false`. |
| `Ventana:CargarPosicion()` | Mueve la ventana a la última posición guardada. Devuelve `true`/`false`. |

- **Dónde se guarda:** en un archivo propio por script, `AlanUI/Config/_ui/posicion_<NombreConfig>.json`. No usa el archivo de ajustes de la Preinstalada (ese es global para todos los scripts y solo se escribe con su botón "Guardar"). Por eso conviene poner tu propio `NombreConfig`.
- **Cómo:** se guarda el desplazamiento respecto al centro como fracción de la pantalla, así que sobrevive a un cambio de resolución. Se escribe solo, un instante después de soltar la ventana.
- **Fuera de pantalla:** si la posición guardada deja la ventana (en parte) fuera de la pantalla, se corrige al abrir.
- **Reabrir con la tecla de toggle** (o el botón de minimizar) sigue devolviendo la ventana a su posición de inicio de la sesión, como siempre. La última posición se aplica al volver a ejecutar el script.
- **Sin soporte de archivos** no se recuerda nada. Se puede apagar con `GuardarPosicion = false` o, para todas las ventanas, con `AlanUI.Opciones.GuardarPosicionVentana = false`.
- **Preinstalada** (sección Apariencia): el toggle "📍 Recordar posición" y el botón "🎯 Resetear posición".

#### `Ventana:Resetear()`
Devuelve **todos** los controles de tu script a su valor `Defecto` (el que tenían al crearse), ejecutando sus `Callback`. No toca los ajustes de la pestaña Preinstalada ni controles de solo lectura (`Label`, `Progreso`).

#### `Ventana:AgregarTag(cfg)`
Agrega una pastilla de color en la barra de título, junto al título — útil para "BETA", la versión, o el estado. Acepta un string suelto (`Ventana:AgregarTag("BETA")`) o una tabla:

| Campo | Efecto |
|---|---|
| `Texto` | Texto de la pastilla. |
| `Icono` | Emoji/carácter opcional antepuesto al texto. |
| `Color` | `"info"` (default), `"success"`, `"warning"`, `"danger"`, `"neutral"`, un `Color3`, `"rainbow"` (arcoíris), o una tabla de 2+ `Color3` (degradado). |
| `Animar` | `true` hace girar el degradado; con `"rainbow"` anima por defecto salvo `Animar = false`. |
| `Callback` | Si se pasa una función, la pastilla se vuelve clickeable. |

Devuelve `{ Instancia, SetTexto(texto), SetColor(color, animar), Remover() }`. Si no hay espacio en la barra, las pastillas más antiguas se ocultan solas.

```lua
local tag = Ventana:AgregarTag({ Texto = "BETA", Color = "warning" })
tag.SetColor("success")
tag.SetTexto("v1.2")
```

#### `Ventana:AgregarDivisorSidebar(cfg)` / `Tab:CrearDivisor(cfg)`
- `Ventana:AgregarDivisorSidebar({ Texto = "Grupo" })` inserta una línea (con título opcional) **entre botones de pestaña** en la barra lateral/superior. Se coloca en el orden en que lo llamas respecto a `CrearTab`.
- `Tab:CrearDivisor({ Texto = "Título" })` inserta un divisor dentro de una pestaña, **al final** de lo que ya tiene (si la página es más larga que la pantalla, desplázate para verlo).

Si se crean con la ventana ya visible, el divisor crece desde cero con un fade y empuja suavemente a sus vecinos.

```lua
Ventana:AgregarDivisorSidebar({ Texto = "Avanzado" })
local TabX = Ventana:CrearTab("Debug", "🐞")
TabX:CrearDivisor({ Texto = "Herramientas" })
```

#### `Ventana:ConstruirDesdeSchema(schema)`
Arma pestañas, secciones y controles completos desde una sola tabla de datos. Usa `Seccion:Construir` internamente.

```lua
local elementos = Ventana:ConstruirDesdeSchema({
    Tabs = {
        {
            Nombre = "Principal", Icono = "🏠",
            Secciones = {
                {
                    Nombre = "Combate", ColapsadaPorDefecto = false,
                    Controles = {
                        { Control = "Toggle", Texto = "Auto Modo", Flag = "auto_modo" },
                        { Control = "Slider", Texto = "Velocidad", Flag = "vel", Min = 0, Max = 100, Defecto = 50 },
                    },
                },
            },
        },
    },
})
elementos.vel.Set(70)
```

Devuelve una tabla `Flag → control` con todos los controles creados que tengan `Flag`.

#### `Ventana:CrearTab(nombre, icono)` — formas del ícono
El segundo parámetro acepta: un emoji/carácter (`"🏠"`), un asset como string (`"rbxassetid://123"`), un número (se interpreta como ID de asset) o una tabla `{ Icono = ..., ColorIcono = Color3 }` para teñir un ícono de imagen. Si ya existe una pestaña con ese nombre, no se duplica: avisa con una notificación y devuelve la existente.

#### El objeto `Tab` que devuelve `CrearTab`
Además de `CrearSeccion` y `CrearDivisor`, el objeto tiene estos miembros, útiles para cambiar de pestaña por código o personalizarla:

| Miembro | Qué es |
|---|---|
| `Nombre` | El nombre con el que se creó la pestaña. |
| `Seleccionar()` | Muestra esta pestaña (como si el usuario la tocara). Se llama con **punto**: `Tab.Seleccionar()`. |
| `Pagina` | El `ScrollingFrame` con el contenido de la pestaña. |
| `Boton` / `BotonLat` | Botón de la barra lateral (`Boton` es un alias de `BotonLat`). |
| `BotonHoriz` | Botón de la barra superior (orientación horizontal). |
| `IndicadorLat` / `IndicadorHoriz` | La barra de color que marca la pestaña activa en cada orientación. |
| `Secciones` | Lista de las secciones creadas en esta pestaña. |

La ventana guarda todas sus pestañas, en orden de creación, en `Ventana.Tabs`.

```lua
local TabAjustes = Ventana:CrearTab("Ajustes", "⚙️")
TabAjustes.Seleccionar()                    -- abre esta pestaña por código
print(#Ventana.Tabs, TabAjustes.Nombre)
```

#### `Ventana:GuardarConfiguracion()` / `Ventana:CargarConfiguracion()`
Guarda o carga manualmente todos los Flags actuales en el archivo de configuración de esta ventana (el que definiste en `NombreConfig`). No es necesario llamarlas normalmente —el autoguardado ya lo hace solo— pero son útiles para un botón de "Guardar ahora" o "Restaurar" en tu propio script.

> ℹ️ **No confundir con el guardado de la pestaña Preinstalada (v2.8+):** estas dos funciones trabajan sobre el mismo archivo que usa el sistema de **perfiles de script** (los Flags de tu propio script). Los ajustes de la pestaña Preinstalada en sí (tema, tamaño de ventana, etc.) usan un sistema completamente aparte — `SM:GuardarUI()`/`CargarUI()` — que nunca se mezcla con este. Ver la sección "Pestaña Preinstalada" más abajo.

```lua
SeccionAjustes:Boton({
    Texto = "💾 Guardar ajustes ahora",
    Callback = function()
        Ventana:GuardarConfiguracion()
    end
})

SeccionAjustes:Boton({
    Texto = "📂 Restaurar última configuración",
    Callback = function()
        Ventana:CargarConfiguracion()
    end
})
```

---

#### 🔑 API pública de acceso rápido (`ObtenerFlag`, `Try`, `ObtenerElemento`)
Tres formas de leer el valor de un control desde cualquier parte de tu script, sin guardar la referencia del control tú mismo — solo necesitas el `Flag` que le pusiste.

```lua
-- ObtenerFlag: lee el valor crudo. Devuelve nil si el flag no existe.
local vel = AlanUI:ObtenerFlag("velocidad")

-- Try: como ObtenerFlag, pero con un valor de respaldo si no existe
-- (evita tener que chequear nil tú mismo).
local vel = AlanUI:Try("velocidad", 16)

-- ObtenerElemento: devuelve el objeto {Set, Get} completo del control,
-- no solo su valor -- útil si además quieres SETEARLO desde afuera.
local elemento = AlanUI:ObtenerElemento("velocidad")
if elemento then
    print(elemento.Get())
    elemento.Set(50, true) -- el segundo argumento dispara el Callback
end
```

---

### 📦 Funciones internas de arquitectura

#### 🔄 El proxy de `AlanUI.Flags`: escribir vs. `Elementos[flag].Set()`
`AlanUI.Flags` no es una tabla común — cada asignación (`AlanUI.Flags["algo"] = valor`) pasa por un proxy interno que:
1. Guarda el valor.
2. Marca "hay cambios sin guardar" (para el autoguardado, ver más abajo).
3. Dispara `AlanUI.Eventos.FlagCambiada`.

Lo que **no** hace es actualizar el control visual ni disparar su `Callback`. Para eso existe `AlanUI:ObtenerElemento(flag).Set(valor, dispararCallback)`, que sí mueve el control en pantalla y, si le pasas `true` como segundo argumento, también ejecuta el `Callback` como si el usuario lo hubiera tocado.

```lua
AlanUI.Flags["velocidad"] = 50                          -- guarda el valor, NO mueve el Slider en pantalla, NO llama al Callback
AlanUI:ObtenerElemento("velocidad").Set(50, true)        -- mueve el Slider Y llama al Callback
AlanUI:ObtenerElemento("velocidad").Set(50)              -- mueve el Slider, sin llamar al Callback
```

En la práctica, casi siempre vas a usar `Set(valor, true)` cuando quieras cambiar un control desde tu propio código — escribir `AlanUI.Flags` directo es más para lectura/depuración que para modificar algo en caliente.

#### 💾 Cómo funciona el guardado automático
Cualquier cambio en un control (mover un Slider, tocar un Toggle) marca internamente "hay cambios sin guardar". Un ciclo de fondo revisa esa marca cada **10 segundos**: si hubo algún cambio real desde la última vez, guarda una vez; si no hubo nada, no toca el disco. Como respaldo, también se guarda al cerrar la ventana (por si el ciclo de 10s no llegó a correr antes de que el juego se cierre de golpe). No hace falta llamar nada de esto manualmente — está activo por defecto (ver `AutoGuardar` en `CrearVentana` para desactivarlo).

#### 📄 Formato de los archivos `.json` guardados
Si necesitas inspeccionar o migrar manualmente un archivo de guardado, la mayoría de los valores se guardan tal cual (números, strings, booleanos, tablas). Tres tipos necesitan un empaquetado especial porque no son serializables directo a JSON:

```jsonc
// Un Color3 (de un ColorPicker) se guarda asi:
{ "__color3": true, "R": 255, "G": 0, "B": 0 }

// Un Enum.KeyCode suelto (Keybind sin ConModificadores) se guarda asi:
{ "__enum": true, "EnumType": "KeyCode", "Name": "F" }

// Un Keybind CON ConModificadores se guarda asi:
{ "__keybindMods": true, "KeyCode": "F", "Ctrl": true, "Shift": false, "Alt": false }
```

AlanUI reconstruye estos tres formatos automáticamente al cargar — no hace falta hacer nada especial al leerlos desde tu propio código con `SM:Cargar()`.

> 🆕 **Campo `__version` (v2.11.2+):** todo `.json` guardado a partir de esta versión incluye un campo interno `__version` al principio del archivo, reservado para el sistema de guardado — no lo uses como nombre de un `Flag` propio. Sirve para que AlanUI pueda migrar automáticamente archivos de un formato viejo si el esquema cambia en el futuro. Los archivos guardados con versiones anteriores (sin este campo) se siguen leyendo con total normalidad.

#### 📱 Qué se adapta automáticamente en mobile
Ninguno de estos puntos requiere configuración: AlanUI detecta el dispositivo (vía `AlanUI.Capacidades`) y ajusta esto por su cuenta.
- **Tooltip:** se muestra manteniendo presionado (long-press) en vez de necesitar hover con mouse.
- **`Keybind`:** si no hay teclado ni gamepad, se convierte en un botón de acción directa (cada toque "presiona" la tecla asignada) en vez de esperar una tecla que nunca va a llegar.
- **Áreas táctiles:** los botones pequeños (cerrar, minimizar) tienen una zona de toque invisible más grande que su ícono visible.
- **`Slider`:** el área de toque real es más alta que la barra visual, para no depender de la precisión de un cursor de mouse.
- **Tamaño de texto:** el piso mínimo de la escala de texto sube de 6px a 9px (6px es ilegible en la mayoría de los celulares).
- **Splash de apertura:** la animación de apertura de la ventana es más corta (0.25s, ver Novedades v2.12.5).
- **Escala general:** la ventana se auto-ajusta a un porcentaje distinto del viewport según sea PC o mobile, para que ni se vea diminuta en un celular ni gigante en un monitor.

#### 🗑️ `Ventana:Destruir()` vs. el botón "✕"
Son dos caminos distintos a propósito:
- **`Ventana:Destruir()`** es instantánea, pensada para uso **programático** — tu propio script decidiendo cerrar la interfaz (por ejemplo, al terminar una tarea). No pregunta nada.
- **El botón "✕"** que ve el usuario pide confirmación antes de destruir — evita perder la sesión por un toque de más, algo especialmente fácil en mobile.

Ambos caminos limpian exactamente los mismos registros internos (temas, buscador, escala de texto, elementos) — no hay diferencia de comportamiento salvo la confirmación.

#### ⚠️ Advertencias de desarrollo (automáticas)
AlanUI revisa la configuración de cada control **antes** de crearlo y avisa en la consola de Roblox (F9) si detecta un descuido común — sin usar `error()` nunca, para no romper tu script. Siempre corrige con un valor seguro y sigue funcionando.

No hace falta llamar nada: pasa solo con crear los controles normalmente.

```lua
-- Esto imprime un warn() en consola y usa Min (0) como valor inicial:
SeccionCombate:Slider({
    Texto = "Volumen",
    Min = 0, Max = 100,
    -- Defecto olvidado ⚠️
})

-- Esto imprime un warn() y ajusta Max automáticamente:
SeccionCombate:Slider({
    Texto = "Rango raro",
    Min = 50, Max = 10, -- Min >= Max ⚠️
    Defecto = 20,
})
```

Casos que se avisan actualmente:
- `Slider` sin `Defecto` → usa `Min`.
- `Slider` con `Min >= Max` → ajusta `Max` a `Min + 1`.
- Cualquier control con `Callback` presente pero que no es una función → se ignora.
- `Button` sin `Callback` → no tiene ninguna utilidad, se avisa siempre.

> Esto es distinto de `AlanUI:ObtenerErrores()` (ver más abajo): ese sistema atrapa errores que tira tu propio `Callback` **en tiempo de ejecución**. Este validador revisa la **configuración** antes de que el control exista.

#### 🛠️ Captura de errores en Callbacks (`ObtenerErrores`)
Cada vez que un `Callback` tuyo tira un error mientras corre, AlanUI lo atrapa (no se cae la interfaz), muestra una notificación en pantalla y lo guarda en un registro consultable (últimos 50 errores).

```lua
-- Si este Callback tira un error, AlanUI lo atrapa solo:
SeccionCombate:Boton({
    Texto = "Acción riesgosa",
    Callback = function()
        error("Algo salió mal aquí")
    end,
})

-- En cualquier momento puedes revisar el historial:
local errores = AlanUI:ObtenerErrores()
for _, e in ipairs(errores) do
    print(e.Contexto, e.Mensaje)
end
```

#### 🐞 Modo Debug (`AlanUI.DebugMode`)
Por defecto (`false`) el comportamiento es el de siempre. En `true`, además de todo lo que ya se avisa por consola normalmente, ciertos `pcall` puntuales que hoy fallan **a propósito** en silencio (porque fallar ahí es esperable y avisar de cada uno sería ruido para el usuario final — ej. sincronizar el color de tema de un elemento ya destruido) también hacen `warn()`. Pensado para cuando estás probando tu propio script y quieres ver esos fallos "esperables" mientras desarrollas.

```lua
AlanUI.DebugMode = true
```

#### 📡 Eventos globales (`AlanUI.Eventos`)
Reaccioná a cambios importantes desde cualquier parte de tu script, sin tener que envolver manualmente cada control.

```lua
AlanUI.Eventos.FlagCambiada:Connect(function(flag, valor)
    print("Cambió:", flag, "→", valor)
end)

AlanUI.Eventos.TabCambiada:Connect(function(nombreTab)
    print("Pestaña activa:", nombreTab)
end)

AlanUI.Eventos.TemaCambiado:Connect(function(nombreTema)
    print("Tema aplicado:", nombreTema)
end)
```

Además, desde v2.11 y v2.12.5 existen `AlanUI.Eventos.TipoCambiado` (`function(tipo)`, al reclasificarse el dispositivo — rotar la pantalla, `ForzarTipo`) y `AlanUI.Eventos.HistorialCambiado` (`function(nDeshacer, nRehacer)`). `AlanUI.Eventos.ControlRegistrado` existe pero está reservado: por ahora no se dispara.

`Connect` devuelve un objeto con `:Disconnect()` si en algún momento quieres dejar de escuchar:

```lua
local conexion = AlanUI.Eventos.FlagCambiada:Connect(function() end)
conexion.Disconnect()
```

#### 🔄 Sistema de auto-limpieza
Evita memory leaks: al volver a ejecutar tu script, AlanUI detecta si ya existe una interfaz activa y limpia todo antes de crear la nueva.

```lua
-- Registra un hilo propio (task.spawn) para que se cancele
-- automáticamente si el script se re-ejecuta -- sin esto, el loop
-- viejo seguiría corriendo en paralelo con el nuevo para siempre.
local miHilo = task.spawn(function()
    while true do
        task.wait(1)
        print("Mi loop sigue corriendo...")
    end
end)
AlanUI:RegistrarHilo(miHilo)

-- Lo mismo aplica a conexiones propias (RunService, UserInputService, etc.):
local miConexion = game:GetService("RunService").Heartbeat:Connect(function() end)
AlanUI:RegistrarConexion(miConexion)
```

Hay 4 funciones de registro en total, una por tipo de recurso — usa la que corresponda:

| Función | Para qué |
|---|---|
| `AlanUI:RegistrarConexion(conexion)` | Conexiones de eventos (`:Connect(...)`) |
| `AlanUI:RegistrarHilo(hilo)` | Hilos propios (`task.spawn`, `task.delay`) |
| `AlanUI:RegistrarDibujo(objetoDrawing)` | Objetos `Drawing.new(...)` (líneas, cajas, texto de ESP, etc.) |
| `AlanUI:RegistrarInstancia(instancia)` | Cualquier `Instance` suelta que crees tú mismo (BillboardGui, Highlight, etc.) y que no cuelgue ya de la ventana |

Las 4 funciones devuelven el mismo recurso que reciben, así que también puedes registrar "en línea":

```lua
local dibujo = AlanUI:RegistrarDibujo(Drawing.new("Line"))
```

#### 🔔 Notificaciones (Notificar)
Muestra un panel flotante en pantalla para avisos importantes (por ejemplo, cuando el script terminó de cargar).

```lua
AlanUI:Notificar({
    Titulo = "¡AlanUI Cargado!",
    Texto = "El script se ha ejecutado de forma exitosa.",
    Duracion = 5 -- segundos que dura en pantalla
})
```

**Parámetros opcionales (v2.7+):**

| Parámetro | Qué hace |
|---|---|
| `Tipo` | `"Info"` (por defecto), `"Success"`, `"Warning"` o `"Error"` — cada uno con su propio color de acento fijo (el de `Info` sigue el tema activo). |
| `Persistente` | `true` para que NO se cierre sola por tiempo — se descarta con un click/toque en cualquier parte de la tarjeta. |
| `Prioridad` | Número (por defecto `0`). Si ya hay 4 notificaciones en pantalla, una con `Prioridad` más alta salta adelante de las que están esperando con prioridad menor, en vez de irse siempre al final de la cola. |

```lua
AlanUI:Notificar({
    Titulo = "Error crítico",
    Texto = "No se pudo cargar la configuración",
    Tipo = "Error",
    Prioridad = 2,
    Persistente = true, -- el usuario la cierra tocándola
})
```

#### 🎨 Selector de temas (AgregarSelectorTemas)
Agrega un botón en la barra lateral (o en la barra superior, si estás en modo horizontal) para que el usuario cambie entre los temas disponibles (Negro, Blanco, Verde, Morado, Rojo) con un clic. No acepta parámetros — no se puede colocar dentro de una sección, siempre va en la barra de navegación.

```lua
Ventana:AgregarSelectorTemas()
```

#### 🔧 Pestaña Preinstalada (`AgregarPestanaPreinstalada`)
**Se agrega sola, automáticamente, dentro de `CrearVentana`.** No necesitas llamarla tú mismo. Incluye:

- Info del ejecutor y versión de AlanUI
- **Diagnóstico del entorno (v2.11+):** dispositivo detectado, funciones soportadas y advertencias específicas solo cuando falta algo
- **Monitor de rendimiento:** FPS, Frame Time (ms), estado con semáforo (🟢/🟡/🔴), memoria aproximada (si el ejecutor la expone), e indicador de "Salud" (crecimiento de objetos/conexiones desde que se abrió la ventana)
- Selector de tema
- Orientación de tabs (vertical/horizontal)
- Sliders de tamaño de la ventana (escala general, ancho, alto, tamaño de texto)
- **Sección "Configuración" (v2.8+):** Guardar / Cargar / Eliminar — pero SOLO para los ajustes de esta misma pestaña (tema, tamaño, orientación). No toca los Flags de tu script.
- **Sección "Perfiles de script" (v2.8+):** Dropdown con los perfiles guardados + Guardar como nuevo perfil + Cargar + Eliminar — para los Flags de TU script (todo lo que no sea un ajuste de interfaz). Completamente separado de la sección de arriba. Desde v2.12.5 también incluye **Duplicar, Renombrar, Exportar e Importar**.
- **Sección "Historial de cambios" (v2.12.5+):** botones ↩️ Deshacer / ↪️ Rehacer con un contador de pasos disponibles.
- **Posición de la ventana (v2.12.5+):** en la sección Apariencia hay un toggle "📍 Recordar posición" (se guarda con el botón "Guardar" de la Preinstalada, como el resto de ajustes de interfaz) y un botón "🎯 Resetear posición".
- **Borde de la ventana (v2.12.5+):** en Apariencia hay un selector de estilo (Normal, Tema, Acento, Arcoíris, Personalizado), un toggle para animarlo, el grosor y dos colores para el estilo Personalizado.
- **Sección "Atajos de teclado":** recordatorio de las teclas de la interfaz.

Si por alguna razón no la quieres (por ejemplo, tu script ya trae su propia pestaña de ajustes y no quieres duplicar), la desactivas así:

```lua
local Ventana = AlanUI:CrearVentana({
    Titulo = "Mi Script",
    PestanaPreinstalada = false, -- desactiva la pestaña automática
})
```

También puedes personalizar su nombre sin desactivarla, pasando una tabla en vez de `false`:

```lua
local Ventana = AlanUI:CrearVentana({
    Titulo = "Mi Script",
    PestanaPreinstalada = { Nombre = "⚙️ Sistema" }, -- cambia el nombre de la pestaña
})
```

#### 🏷️ `AlanUI:MarcarComoUI(flag)` (nuevo en v2.8)
Marca uno o más Flags como exclusivos de la interfaz — el sistema de perfiles de script (`SM:Guardar`/`Cargar`/`Listar`/`Eliminar`) jamás los incluirá ni los sobreescribirá. Es lo que usa internamente la pestaña Preinstalada para separar sus propios ajustes de los de tu script; rara vez necesitas llamarla tú mismo salvo que quieras agregar tus propios controles "de interfaz" (por ejemplo, un campo de texto para nombrar perfiles) que tampoco deban guardarse dentro de cada perfil.

```lua
SeccionTuya:Dropdown({
    Texto = "Selector interno (no es config de juego)",
    Flag = "mi_selector_ui",
    Opciones = {"A", "B", "C"},
})
AlanUI:MarcarComoUI("mi_selector_ui")
```

#### 💾 `SM:GuardarUI(nombre)` / `CargarUI(nombre)` / `ListarUI()` / `EliminarUI(nombre)` (nuevo en v2.8)
Las mismas cuatro operaciones que ya conocías del sistema de perfiles (`Guardar`/`Cargar`/`Listar`/`Eliminar`), pero operando exclusivamente sobre los Flags marcados con `MarcarComoUI` — en una carpeta separada, que nunca se mezcla con los perfiles de script. Es el sistema que usa internamente la sección "Configuración" de la pestaña Preinstalada.

```lua
AlanUI.SaveManager:GuardarUI("mis_ajustes_interfaz")
AlanUI.SaveManager:CargarUI("mis_ajustes_interfaz")
```

#### 🔎 `AlanUI.Capacidades` — qué soporta el ejecutor actual
Tabla de booleanos, calculada una sola vez al cargar la librería, para que tu script (o AlanUI internamente) pueda adaptarse al ejecutor sin asumir nada:

```lua
AlanUI.Capacidades.Archivos    -- true/false: soporte de writefile/readfile (necesario para guardado)
AlanUI.Capacidades.Drawing     -- true/false: soporte de Drawing.new()
AlanUI.Capacidades.ProtectGUI  -- true/false: soporte de proteger la GUI (syn.protect_gui o protectgui)
AlanUI.Capacidades.GetHUI      -- true/false: soporte de gethui() (para que la GUI sobreviva a un CoreGui bloqueado)
AlanUI.Capacidades.Teclado     -- true/false: si el dispositivo tiene teclado fisico/bluetooth
AlanUI.Capacidades.Gamepad     -- true/false: si hay un gamepad conectado
```

`Teclado` y `Gamepad` son los que usa la propia librería para decidir si un `Keybind` puede esperar una tecla de verdad o debe convertirse en botón de acción directa (ver "Adaptación automática a mobile" más abajo) — pero están disponibles para que tu propio script tome decisiones parecidas.

#### 🔑 API rápida de Flags (`ObtenerFlag`, `Try`, `ObtenerElemento`)
Tres formas de leer el valor actual de un control desde tu propio código, sin depender de que el `Callback` se haya disparado:

```lua
AlanUI:ObtenerFlag("velocidad")        -- valor actual, o nil si el flag no existe
AlanUI:Try("velocidad", 16)            -- igual, pero devuelve 16 (el fallback) si es nil
AlanUI:ObtenerElemento("velocidad")    -- el control completo: { Set(valor), Get() }
```

`Try` es útil especialmente para controles sin `Callback` (un patrón válido en AlanUI: crear el control solo para guardar el flag, y leerlo cuando haga falta en vez de reaccionar a cada cambio).

#### 🔌 `AlanUI:DesconectarYLimpiar(conexion)`
Desconecta una conexión de Roblox (`RBXScriptConnection`) y la saca del registro interno de limpieza en un solo paso. Solo hace falta si tu propio script registra conexiones manualmente con `AlanUI:RegistrarConexion()` y necesita desconectar alguna antes de que la ventana se destruya (por ejemplo, un listener temporal) — para el resto de los casos, la limpieza automática al destruir la ventana ya se encarga.

```lua
local conexion = AlanUI:RegistrarConexion(workspace.ChildAdded:Connect(function() end))
-- ... mas tarde, si ya no hace falta:
AlanUI:DesconectarYLimpiar(conexion)
```

#### 🩺 Profiler bajo demanda (`AlanUI:Profiler()`)
Devuelve una foto instantánea del estado interno de la librería — Flags, Elementos, conexiones, hilos, dibujos, objetos de GUI y memoria aproximada — y además la imprime en consola en una sola línea. Complementa al panel de Salud de la pestaña Preinstalada: ese corre en vivo mientras la pestaña está abierta, esto lo puedes pedir en cualquier momento desde tu propio código.

```lua
local datos = AlanUI:Profiler()
print(datos.Conexiones, datos.ObjetosGui)
```

#### 💾 SaveManager — `SM:Listar()`
Devuelve la lista de nombres de configuraciones guardadas (archivos `.json` dentro de la carpeta de AlanUI). Útil si quieres, por ejemplo, un Dropdown para que el usuario elija entre varios perfiles guardados.

> ⚠️ Depende de `AlanUI.Capacidades.Archivos`. En un ejecutor sin soporte de archivos, devuelve una tabla vacía (`{}`) en vez de dar error.

```lua
local perfiles = AlanUI.SaveManager:Listar()
-- perfiles --> { "AlanUI_Settings", "perfil_combate", "perfil_farmeo" }

SeccionAjustes:Dropdown({
    Texto = "Cargar perfil",
    Opciones = perfiles,
    Callback = function(nombre)
        AlanUI.SaveManager:Cargar(nombre)
    end
})
```

#### 💾 SaveManager — `SM:CambiarPerfil(ventana, nombre)`
Cambia el "perfil" activo de una ventana en una sola llamada: guarda el perfil actual, apunta el autoguardado nativo y `GuardarConfiguracion`/`CargarConfiguracion` al nombre nuevo, y carga ese archivo si ya existe. Útil para varios sets de ajustes completos ("Farm", "PvP", "Raid") que el usuario cambia con un botón o Dropdown.

> Esta función es de conveniencia — la infraestructura de archivos con nombre ya existía antes (`SM:Guardar("Farm")` / `SM:Cargar("PvP")` siempre funcionaron). Lo nuevo es que además redirige el autoguardado y las funciones de la ventana al nombre activo.

```lua
SeccionPerfiles:Dropdown({
    Texto = "Perfil activo",
    Opciones = {"Farm", "PvP", "Raid"},
    Callback = function(nombre)
        AlanUI.SaveManager:CambiarPerfil(Ventana, nombre)
    end
})
```

#### 🎨 ThemeManager — `TM:AgregarTema(nombre, tabla)`
Registra un tema propio (colores personalizados) para que aparezca junto a los temas nativos en el selector de temas.

Un tema completo tiene **14 claves**. Estas son las reales (ojo: la clave del color de fondo principal es `Background`, no `Fondo`):

```lua
AlanUI.ThemeManager:AgregarTema("MiTemaAzul", {
    Background      = Color3.fromRGB(45, 60, 90),   -- color de fondo general de la ventana
    BackgroundDark  = Color3.fromRGB(30, 42, 68),    -- variante mas oscura (bordes, sombreados)
    BackgroundLight = Color3.fromRGB(60, 78, 112),   -- variante mas clara (resaltados)
    Accent          = Color3.fromRGB(60, 120, 255),  -- color de acento (toggles activos, barra de tabs)
    AccentLight     = Color3.fromRGB(110, 160, 255), -- variante clara del acento (hover sobre acento)
    Highlight       = Color3.fromRGB(160, 195, 255), -- resaltado adicional (texto sobre acento, etc.)
    Text            = Color3.fromRGB(230, 230, 240), -- color de texto principal
    TextDark        = Color3.fromRGB(200, 200, 215), -- texto secundario/atenuado
    Border          = Color3.fromRGB(15, 20, 35),    -- bordes de ventana y controles
    Panel           = Color3.fromRGB(25, 30, 50),    -- fondo de la ventana principal
    PanelClaro      = Color3.fromRGB(35, 42, 68),    -- variante clara de Panel (paneles internos)
    Fila            = Color3.fromRGB(30, 36, 58),    -- fondo de cada fila de control (Toggle, Slider, etc.)
    Entrada         = Color3.fromRGB(20, 25, 42),    -- fondo de campos de entrada (Input, barra de Slider)
    Apagado         = Color3.fromRGB(60, 60, 60),    -- color de elementos deshabilitados
})

-- Ya lo puedes aplicar como cualquier otro:
Ventana:CambiarTema("MiTemaAzul")
```

> ⚠️ **Un tema parcial (con menos de las 14 claves) NO resetea las que faltan.** `AgregarTema`/`CambiarTema` solo sobreescriben las claves que efectivamente pasaste — las que no incluiste se quedan con el valor que tenía el **tema anterior**, no con ningún default. Si tu tema personalizado solo define `Background` y `Accent`, el resto de la interfaz (`Fila`, `Entrada`, `Border`, etc.) va a seguir mostrando los colores del tema que estuviera activo antes de cambiar — puede verse como una mezcla rara de dos temas si no se cubren las 14 claves.

#### 🎨 `TM:GuardarTemaActual()`
Guarda a disco los colores del tema activo en este momento (`tema.json`, en la carpeta de perfiles). Método de una línea, útil si quieres persistir un tema aplicado dinámicamente sin pasar por el flujo normal de `AgregarTema`.

```lua
AlanUI.ThemeManager:GuardarTemaActual()
```

#### 🔒 Bloqueo y resaltado de controles (v2.12.5+)
Cualquier control interactivo (ver la lista en el apartado `Locked` de arriba) puede bloquearse: se tapa con una capa semitransparente y una insignia "🔒 motivo", y deja de responder.

```lua
-- Nace bloqueado:
local t = SeccionCombate:Toggle({ Texto = "Modo VIP", Flag = "vip", Locked = true, LockedTitle = "Requiere VIP" })

-- O en cualquier momento:
t.Lock("Requiere nivel 20")   -- bloquea (el motivo es opcional)
t.SetLockedTitle("Nivel 30")  -- cambia el motivo en vivo
print(t.IsLocked())           --> true
t.Unlock()                    -- desbloquea

-- Resalta el control con un pulso de borde para llamar la atención:
t.Highlight(3)                -- 3 segundos (rango permitido: 0.5 a 10)
t.Highlight({ Duracion = 2 })
```

El control devuelto también expone `Fila` (el `Frame` de la fila, para tus propios ajustes). Los métodos aceptan llamada con `.` o con `:`.

#### ↩️ Historial de cambios: Deshacer / Rehacer (v2.12.5+)
Todo cambio en un control de tu script (mover un slider, tocar un toggle, elegir una opción) se registra solo en un historial de hasta **50 pasos**. No hay que configurar nada.

```lua
AlanUI:Deshacer()            -- true (y la entrada) si deshizo algo; false si no había nada
AlanUI:Rehacer()
AlanUI:PuedeDeshacer()       -- boolean
AlanUI:PuedeRehacer()        -- boolean
AlanUI:ObtenerHistorial()    -- { Deshacer = n, Rehacer = n }
AlanUI:LimpiarHistorial()    -- vacía ambas pilas

local ok, entrada = AlanUI:Deshacer()
if ok then print(AlanUI:DescribirCambio(entrada)) end --> "vel: 80 -> 50"

AlanUI.Eventos.HistorialCambiado:Connect(function(nDeshacer, nRehacer) end)
```

- Mover un mismo slider de forma continua (menos de 0.6 s entre cambios) se agrupa en **un solo paso**; varios flags que cambian a la vez (ej. cargar un perfil) también se agrupan.
- Hacer un cambio nuevo después de deshacer descarta la pila de "rehacer".
- Quedan fuera del historial: los flags de interfaz (`MarcarComoUI`) y los controles de solo lectura (`Label`, `Progreso`).
- Deshacer/Rehacer vuelven a aplicar el valor **ejecutando el `Callback`** del control, como si el usuario lo hubiera movido.
- Cargar un perfil o los ajustes de interfaz (`SM:CargarSilencioso`, `SM:CargarUI`) **limpia** el historial, para no mezclar pasos de un perfil con otro.

#### ❓ Modal de confirmación (`AlanUI:Confirmar`) (v2.12.5+)
Muestra un diálogo modal sobre la ventana, con el mismo estilo que el de la "✕". Requiere que haya una ventana de AlanUI activa (si no, avisa por consola y devuelve `nil`).

```lua
AlanUI:Confirmar({
    Icono = "⚠️",
    Titulo = "¿Resetear todo?",
    Contenido = "Se perderán los valores actuales.",
    BotonCancelar = { Texto = "Cancelar" },
    BotonAceptar  = { Texto = "Resetear", Variante = "danger", Callback = function() Ventana:Resetear() end },
})
```

- **Forma simple:** `BotonAceptar` (default "Aceptar", variante `primary`) y `BotonCancelar` (solo aparece si lo pasas).
- **Forma libre:** `Botones = { { Texto, Variante, Callback }, ... }` para tantos botones como quieras (con más de 3 se apilan en vertical).
- `Variante`: `"primary"` (acento), `"danger"` (rojo), `"tertiary"` (solo borde) o `"neutral"` (default).
- `Ancho` (240 a 480, por defecto 300) y `ColorBorde` (un `Color3`: el borde pasa a 2 px con ese color y deja de seguir al tema).
- `Casilla = { Texto = "No volver a preguntar", Defecto = false }` agrega una casilla. Su estado llega a los `Callback` de los botones: `Callback = function(marcada) ... end`.
- Cualquier botón cierra el modal antes de ejecutar su `Callback`. Devuelve `{ Cerrar(), Presionar(i), Fondo, ObtenerCasilla() }`.

#### 💬 `AlanUI:Dialogo(cfg)` (v2.12.5+)
Un modal que elige solo el ícono, el color del borde y el botón de aceptar según su `Tipo`. No es otra implementación: usa `AlanUI:Confirmar`.

```lua
AlanUI:Dialogo({
    Tipo = "warning",
    Titulo = "¿Borrar perfil?",
    Contenido = "Esta acción no se puede deshacer.",
    Botones = {
        { Texto = "Cancelar", Variante = "neutral", Callback = function() end },
        { Texto = "Borrar",   Variante = "danger",  Callback = function() end },
    },
})
```

| `Tipo` | Ícono | Borde | Botones por defecto |
|---|---|---|---|
| `"info"` (default) | ℹ️ | el del tema | Entendido |
| `"question"` | ❓ | el del tema | Sí + Cancelar |
| `"success"` | ✅ | verde | Genial |
| `"warning"` | ⚠️ | amarillo | Aceptar + Cancelar |
| `"error"` | ❌ | rojo | Cerrar (en rojo) |

Acepta los mismos campos que `Confirmar` (`Titulo`, `Contenido`, `Icono`, `Ancho`, `ColorBorde`, `Casilla`, `Botones`, `BotonAceptar`, `BotonCancelar`); lo que pases sobreescribe el preset. `MostrarCancelar = false` quita el "Cancelar" de `question` y `warning`. Un `Tipo` desconocido avisa por consola y usa `"info"`.

#### 🛡️ `AlanUI:CrearVentanaConSeguridad(config)` (v2.12.5+)
`CrearVentana` siempre limpia sin avisar todo lo de la ejecución anterior — ideal cuando el **mismo** script se re-ejecuta. Pero si en el mismo ejecutor cargas dos scripts **distintos** que usan AlanUI, el segundo pisaría al primero en silencio. `CrearVentanaConSeguridad` recibe la misma tabla que `CrearVentana` y, si detecta otra ventana viva, **pregunta** antes de reemplazarla.

```lua
local Ventana = AlanUI:CrearVentanaConSeguridad({ Titulo = "Mi Script", NombreConfig = "miscript" })
if not Ventana then return end -- el usuario eligió no reemplazar
```

Devuelve la ventana creada, o `nil` si el usuario eligió no reemplazar. La preferencia de "reemplazar siempre" se recuerda por script (según su `Titulo`), dentro de su propio `NombreConfig`.

El modal de detección ("Nuevo script detectado") es un `AlanUI:Dialogo` de tipo `warning`: borde amarillo, botones **No** / **Sí, reemplazar** y la casilla "No volver a preguntar por este script". Solo aparece con `CrearVentanaConSeguridad`: `CrearVentana` reemplaza siempre sin preguntar, así que volver a ejecutar el **mismo** script no muestra ningún mensaje. Si el modal se cierra por otra vía (por ejemplo, se destruye la ventana), cuenta como "No".

#### 🌈 Bordes con degradado y animación (v2.12.5+)
La ventana (y los modales) pueden llevar un borde de color liso, con degradado o animado. Acepta lo mismo que un tag y además **los colores de la interfaz**, que siguen al tema cuando lo cambias.

```lua
Ventana:EstablecerBorde("tema")                       -- degradado con los colores del tema
Ventana:EstablecerBorde({ Color = "tema", Animar = true, Grosor = 3 })
Ventana:EstablecerBorde({ Color = { "Accent", Color3.fromRGB(255, 90, 140), "AccentLight" }, Animar = true })
Ventana:EstablecerBorde(nil)                          -- vuelve al borde de siempre

AlanUI:CrearVentana({ Titulo = "Mi Script", Borde = "rainbow" })   -- o al crearla
AlanUI:Dialogo({ Tipo = "info", Titulo = "Hola", Borde = { Color = { "Accent", "AccentLight" }, Animar = true } })
```

| Valor | Resultado |
|---|---|
| `nil` / `false` / `"ninguno"` | El borde de siempre. |
| `"tema"` | Degradado `Accent` → `AccentLight`. Sigue al tema. |
| `"acento"` | Color liso `Accent`. Sigue al tema. |
| `"borde"` | El color de borde del tema. |
| `"rainbow"` | Arcoíris. Se anima solo (salvo `Animar = false`). |
| `"info"`, `"success"`, `"warning"`, `"danger"`, `"neutral"` | Los colores del tag. |
| `Color3` | Color liso. |
| `{ c1, c2, ... }` | Degradado de 2 o más. Cada `c` es un `Color3`, una clave del tema (`"Accent"`, `"AccentLight"`, `"Highlight"`...) o un color del tag. Las claves del tema siguen al tema. |
| `{ Color = ..., Grosor = 2, Animar = true, Velocidad = 4, Transparencia = 0 }` | Tabla de configuración: `Color` es cualquiera de las formas de arriba. |

- `Animar = true` hace girar el degradado (`Velocidad` = segundos por vuelta, por defecto 4). El degradado se cierra sobre sí mismo al animarse, para que la vuelta no tenga costura. Cada borde animado usa un solo tween en bucle, que se cancela al destruir la ventana.
- `Grosor` va de 1 a 8 px (por defecto 2).
- Reutiliza el borde que ya tenga el marco (no se pueden apilar dos bordes) y al quitarlo lo deja como estaba.
- **Preinstalada** (Apariencia): selector "🌈 Borde de la ventana" (Normal, Tema, Acento, Arcoíris, Personalizado), "✨ Animar el borde", "Grosor del borde" y dos colores para el estilo Personalizado. Se guardan con el botón "Guardar" de la Preinstalada.
- Un valor de color no reconocido avisa por consola y deja el borde normal.

#### ⚙️ `AlanUI.Opciones` (v2.12.5+)
Interruptores globales: cambian el comportamiento de toda la librería sin pasar lo mismo control por control. Todos conservan el comportamiento de siempre por defecto, salvo `ClickDirectoEnBarras`, que arranca en `true`.

| Opción | Por defecto | Qué hace |
|---|---|---|
| `ColorPickerEstiloPredeterminado` | `"RGB"` | Estilo de los `ColorPicker` sin `Estilo` propio: `"RGB"` o `"2D"`. Afecta a los que se creen después. |
| `GuardarPosicionVentana` | `true` | Recordar la posición de la ventana entre ejecuciones. Se puede sobreescribir por ventana con `GuardarPosicion`. |
| `ConfirmarCierre` | `true` | Mostrar el modal "¿Eliminar interfaz?" al presionar la ✕. Con `false`, la ✕ destruye la ventana directo. |
| `EscalaInterfazPredeterminada` | `125` | Tamaño inicial de la interfaz, en % (70 a 130). Es lo que se aplica al abrir si no hay ajustes guardados. |
| `EscalaTextoPredeterminada` | `150` | Tamaño inicial del texto, en % (80 a 150). |
| `BordeVentanaPredeterminado` | `nil` | Borde de las ventanas que no pasan `Borde` propio (mismo formato que `CrearVentana({ Borde = ... })`). |
| `BordeAdaptativo` | `false` | Al aplicar un tema, ajusta la transparencia de los bordes según la luminancia del fondo (más marcados en temas claros, más sutiles en oscuros). Se nota en el próximo cambio de tema. |
| `MicroInteracciones` | `false` | La flecha del `Dropdown` y la muestra del `ColorPicker` reaccionan al hover de su cabecera. |
| `ClickDirectoEnBarras` | `true` | Con mouse, un click sobre la barra de un `Slider` / `RangeSlider` mueve la manija ahí al instante. En `false` hay que mover el cursor unos píxeles. El toque táctil no cambia. |

```lua
AlanUI.Opciones.ConfirmarCierre = false
AlanUI.Opciones.ColorPickerEstiloPredeterminado = "2D"
```

#### 💾 SaveManager — `SM:Duplicar` / `SM:Renombrar` / `SM:Exportar` / `SM:Importar` (v2.12.5+)
Operaciones sobre los perfiles de script guardados. Todas devuelven `true`/`false` (o texto) más un mensaje de motivo si algo falla, y requieren `AlanUI.Capacidades.Archivos`.

```lua
local SM = AlanUI.SaveManager
SM:Duplicar("Farm", "Farm_copia")        --> true  | false, "Ya existe un perfil con ese nombre"
SM:Renombrar("Farm_copia", "Farm_v2")    --> true
local texto, copiado = SM:Exportar("Farm_v2") -- texto del perfil; 'copiado' = true si se pudo enviar al portapapeles
SM:Importar("Farm_importado", texto)     --> true | false, motivo   (3er parámetro: true para sobreescribir)
```

- Los nombres de perfil son válidos si tienen entre 1 y 60 caracteres y no incluyen `/ \ : * ? " < > |` ni caracteres de control.
- `Importar` valida que el texto sea un JSON válido y tenga como máximo 200000 caracteres; no sobreescribe un perfil existente salvo que pases `true`.
- La sección "Perfiles de script" de la pestaña Preinstalada ya incluye botones de Duplicar, Renombrar, Exportar e Importar.

#### 🧹 Destrucción completa (Destruir)
Cierra la interfaz y desconecta todas las conexiones en segundo plano, liberando la memoria por completo. También limpia los registros internos de la librería (tema, buscador, escala de texto), dejando todo listo por si tu script crea otra ventana después. Es instantánea — no muestra ningún diálogo de confirmación (esa confirmación solo aparece cuando el usuario final toca la "✕" de la ventana, no cuando tu código llama a esta función).

```lua
Ventana:Destruir()
```

---

## 📄 Licencia

Este proyecto está bajo la Licencia MIT — revisa el archivo [LICENSE](LICENSE) para más detalles.
