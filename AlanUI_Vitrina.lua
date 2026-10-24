-- ══════════════════════════════════════════════════════════════
--  AlanUI_Vitrina.lua
--  Vitrina interactiva de TODAS las características de AlanUI.
--  Cada control aparece con un Tooltip explicando qué prueba.
-- ══════════════════════════════════════════════════════════════

-- Asegúrate de tener ambos archivos en la misma carpeta de tu ejecutor
local AlanUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/alanbeikers9/AlanUI-Library-Roblox/refs/heads/main/AlanUI.lua"))()

-- ── Tema custom de demo (aparece en el selector de temas) ──────
AlanUI.ThemeManager:AgregarTema("DemoNeon", {
    Background      = Color3.fromRGB(30, 15, 45),
    BackgroundDark  = Color3.fromRGB(18, 8, 30),
    BackgroundLight = Color3.fromRGB(45, 25, 65),
    Accent          = Color3.fromRGB(220, 60, 200),
    AccentLight     = Color3.fromRGB(240, 130, 230),
    Highlight       = Color3.fromRGB(255, 180, 250),
    Text            = Color3.fromRGB(240, 240, 240),
    TextDark        = Color3.fromRGB(220, 220, 220),
    Border          = Color3.fromRGB(10, 5, 18),
    Panel           = Color3.fromRGB(22, 12, 35),
    PanelClaro      = Color3.fromRGB(35, 20, 55),
    Fila            = Color3.fromRGB(28, 16, 42),
    Entrada         = Color3.fromRGB(18, 10, 30),
    Apagado         = Color3.fromRGB(60, 60, 60),
})

-- ── Ventana principal ───────────────────────────────────────────
-- Tamaño base de la vitrina. El "segundo script" simulado (pestaña APIs) lo
-- reutiliza para que, al reemplazar la ventana, la interfaz nueva se vea igual
-- que la primera vez.
local TAMANO_X, TAMANO_Y = 640, 480

local V = AlanUI:CrearVentana({
    Titulo       = "AlanUI Vitrina",
    Subtitulo    = "Panel de evaluación",
    TamanoX      = TAMANO_X,
    TamanoY      = TAMANO_Y,
    TeclaToggle  = Enum.KeyCode.RightControl,
    Buscador     = true,
    AutoGuardar  = false,
    -- Nombre propio: la posición de la ventana se recuerda en un archivo por
    -- NombreConfig (sin él, todos los scripts compartirían "autosave").
    NombreConfig = "vitrina",
})

V:AgregarSelectorTemas()

-- ══════════════════════════════════════════════════════════════
--  TAB 1 — CONTROLES
-- ══════════════════════════════════════════════════════════════
local TabCtrl = V:CrearTab("Controles", "🎛️")

-- ── Botones ─────────────────────────────────────────────────────
local SBot = TabCtrl:CrearSeccion("Botones")
SBot:Parrafo({
    Titulo = "Botón",
    Contenido = "Ejecuta un Callback al tocarlo. Variantes: normal, con icono, con texto a la derecha (Interact), Async (con spinner), RichText.",
})

SBot:Boton({ Texto = "Botón simple", Tooltip = "Botón básico sin extras",
    Callback = function() AlanUI:Notificar({ Titulo = "Click", Texto = "Botón simple pulsado", Duracion = 2 }) end })

SBot:Boton({ Texto = "Guardar cambios", Icono = "💾",
    Tooltip = "Botón con icono emoji antepuesto al texto",
    Callback = function() AlanUI:Notificar({ Titulo = "Guardar", Texto = "Icono 💾 probado", Duracion = 2 }) end })

SBot:Boton({ Texto = "Estado del sistema", Interact = "🟢 Activo",
    Tooltip = "Botón con texto dinámico a la derecha (Interact)",
    Callback = function() AlanUI:Notificar({ Titulo = "Estado", Texto = "Interact pulsado", Duracion = 2 }) end })

SBot:Boton({ Texto = "Sincronizar datos", Interact = "~1.5s", Async = true,
    Tooltip = "Botón Async: muestra un spinner mientras el Callback corre",
    Callback = function() task.wait(1.5) end })

SBot:Boton({ Texto = "Aviso importante", RichText = true, Icono = "⚠️",
    Tooltip = "RichText activo: acepta tags como <b> y <font color='#...'>",
    Callback = function() AlanUI:Notificar({ Titulo = "⚠️ Aviso", Texto = "RichText probado", Tipo = "Warning", Duracion = 3 }) end })

-- ── Interruptores ───────────────────────────────────────────────
local SInt = TabCtrl:CrearSeccion("Interruptores (Toggle y Casilla)")
SInt:Parrafo({ Titulo = "Toggle / Casilla", Contenido = "Mismo comportamiento (booleano), distinto estilo. Con 'Desactivar' se apaga otro al encenderse." })

SInt:Toggle({ Texto = "Toggle simple", Flag = "v_tog", Defecto = false,
    Tooltip = "Interruptor estándar" })

SInt:Casilla({ Texto = "Casilla simple", Flag = "v_cas", Defecto = false,
    Tooltip = "Estilo checkbox con dos barritas" })

SInt:Toggle({ Texto = "Modo A (apaga B)", Flag = "v_modoA", Defecto = true,
    Desactivar = { "v_modoB" },
    Tooltip = "Al activarlo, apaga 'Modo B' automáticamente" })

SInt:Casilla({ Texto = "Modo B (apaga A)", Flag = "v_modoB", Defecto = false,
    Desactivar = { "v_modoA" },
    Tooltip = "Al activarlo, apaga 'Modo A' automáticamente" })

SInt:Toggle({ Texto = "Toggle con atajo [F]", Flag = "v_togTecla", Defecto = false,
    Tecla = Enum.KeyCode.F,
    Tooltip = "También se alterna presionando F en el juego" })

-- ── Valores numéricos ──────────────────────────────────────────
local SNum = TabCtrl:CrearSeccion("Valores numéricos")
SNum:Parrafo({ Titulo = "Slider / RangeSlider / NumberStepper", Contenido = "Tres formas de elegir números: rango continuo, rango doble (min-max) y valor exacto con botones." })

SNum:Slider({ Texto = "Velocidad", Flag = "v_slider", Min = 0, Max = 100, Incremento = 5, Sufijo = "%", Defecto = 50,
    Tooltip = "Slider estándar con incrementos de 5" })

SNum:Slider({ Texto = "FOV con marcas", Flag = "v_sliderPasos", Min = 70, Max = 120, Incremento = 10, Defecto = 90, Pasos = true,
    Tooltip = "Pasos = true dibuja marcas visuales en cada múltiplo de Incremento" })

SNum:RangeSlider({ Texto = "Distancia (rango)", Flag = "v_range", Min = 0, Max = 200, Incremento = 10, Sufijo = "m", Defecto = { min = 40, max = 150 },
    Tooltip = "Dos manijas: elegís mínimo y máximo al mismo tiempo" })

SNum:NumberStepper({ Texto = "Cantidad exacta", Flag = "v_step", Min = 1, Max = 999, Incremento = 1, Defecto = 10, Sufijo = " pcs",
    Tooltip = "Botones − / + con campo editable. Flechas ↑↓ con el campo enfocado" })

SNum:NumberStepper({ Texto = "Decimal (paso 0.25)", Flag = "v_stepDec", Min = 0, Max = 10, Incremento = 0.25, Defecto = 1.5,
    Tooltip = "Incremento decimal: muestra automáticamente 2 decimales" })

-- ── Texto ───────────────────────────────────────────────────────
local STxt = TabCtrl:CrearSeccion("Campos de texto")
STxt:Parrafo({ Titulo = "Input / TagInput", Contenido = "Input libre, validado (número/patrón) o multilínea. TagInput genera chips con coma." })

STxt:Input({ Texto = "Nombre", Flag = "v_inNombre", Defecto = "", Placeholder = "Escribe tu nombre...",
    Tooltip = "Campo de texto libre, 1 línea" })

STxt:Input({ Texto = "Edad (1-99)", Flag = "v_inEdad", Tipo = "number", Min = 1, Max = 99, Defecto = "18",
    Tooltip = "Tipo='number': solo acepta números, los clampa a Min/Max" })

STxt:Input({ Texto = "Hex (patrón)", Flag = "v_inHex", Tipo = "pattern", Regex = "^%x+$",
    Placeholder = "solo 0-9 y A-F",
    Tooltip = "Tipo='pattern': valida contra el Regex al perder el foco" })

STxt:Input({ Texto = "Notas (multilínea)", Flag = "v_inNotas", Tipo = "textarea", Alto = 80, Defecto = "",
    Placeholder = "Escribe varias líneas...",
    Tooltip = "Tipo='textarea': caja multilínea con AutoScroll interno" })

STxt:TagInput({ Texto = "Ignorados", Flag = "v_tags", Defecto = { "Amigo1", "Amigo2" },
    Placeholder = "Nombre y Enter (o pegá a,b,c)...",
    MaxTags = 8,
    Tooltip = "Chips con ×: separador es la coma. Backspace con caja vacía borra el último" })

-- ── Selección ───────────────────────────────────────────────────
local SSel = TabCtrl:CrearSeccion("Selección")
SSel:Parrafo({ Titulo = "Dropdown / RadioGroup", Contenido = "Dropdown para listas largas (con buscador auto >8). RadioGroup para 2-4 opciones visibles en fila." })

SSel:Dropdown({ Texto = "Método", Flag = "v_ddSimple",
    Opciones = { "Tween", "CFrame", "Instant", "Safe Jump" }, Defecto = "Tween",
    Tooltip = "Dropdown simple: 4 opciones" })

SSel:Dropdown({ Texto = "Efectos (multi)", Flag = "v_ddMulti", Multi = true,
    Opciones = { "Fuego", "Hielo", "Veneno", "Rayo", "Tierra" }, Defecto = { "Fuego" },
    Tooltip = "Multi=true: cada opción es un checkbox. Get() devuelve una tabla" })

SSel:Dropdown({ Texto = "Arma (opciones ricas)", Flag = "v_ddRico",
    Opciones = {
        { Titulo = "Espada", Icono = "⚔️", Descripcion = "Rápida, poco daño" },
        { Titulo = "Hacha", Icono = "🪓", Descripcion = "Lenta, alto daño" },
        { Tipo = "Divider" },
        { Titulo = "Lanza", Icono = "🔱", Locked = true, LockedTitle = "Nivel 20" },
        "Arco",
    }, Defecto = "Espada",
    Tooltip = "Opciones con Icono, Descripcion, Locked y separadores" })

SSel:RadioGroup({ Texto = "Modo", Flag = "v_radio",
    Opciones = { "Farm", "PvP", "Raid" }, Defecto = "Farm",
    Tooltip = "RadioGroup: 3 opciones visibles, selección única" })

-- ── Especiales ──────────────────────────────────────────────────
local SEsp = TabCtrl:CrearSeccion("Controles especiales")
SEsp:Parrafo({ Titulo = "ColorPicker / Keybind", Contenido = "ColorPicker con sliders RGB + swatches + Hex. Keybind captura tecla del teclado (o gamepad/táctil adaptativo)." })

SEsp:ColorPicker({ Texto = "Color principal", Flag = "v_color",
    Defecto = Color3.fromRGB(90, 140, 210),
    Tooltip = "Click en la cabecera para desplegar los sliders RGB" })

SEsp:ColorPicker({ Texto = "Color (estilo 2D)", Flag = "v_color2d", Estilo = "2D",
    Defecto = Color3.fromRGB(220, 90, 90),
    Tooltip = "Cuadrado de saturación/valor + barra de matiz. También acepta hex y muestras" })

SEsp:Keybind({ Texto = "Tecla de activación", Flag = "v_kbSimple",
    Defecto = Enum.KeyCode.E,
    Tooltip = "Click para capturar una nueva tecla" })

SEsp:Keybind({ Texto = "Combo con modificadores", Flag = "v_kbMods",
    ConModificadores = true, Defecto = { KeyCode = Enum.KeyCode.G, Ctrl = true, Shift = true, Alt = false },
    Tooltip = "Captura también Ctrl/Shift/Alt al asignar" })

-- Modos de tecla: Press (por defecto), Hold y Toggle.
SEsp:Keybind({ Texto = "Mantener para agacharse", Flag = "v_kbHold", Modo = "Hold",
    Defecto = Enum.KeyCode.C,
    Tooltip = "Hold: el Callback recibe true al presionar y false al soltar",
    Callback = function(presionada)
        AlanUI:Notificar({ Titulo = "Hold", Texto = presionada and "Tecla presionada" or "Tecla soltada", Duracion = 1 })
    end })

SEsp:Keybind({ Texto = "Alternar modo vuelo", Flag = "v_kbToggle", Modo = "Toggle",
    Defecto = Enum.KeyCode.V,
    Tooltip = "Toggle: cada pulsación alterna el estado. La tecla se guarda como siempre; el estado vive en el flag 'v_kbToggle_estado'",
    Callback = function(encendido)
        AlanUI:Notificar({ Titulo = "Toggle", Texto = encendido and "Vuelo ENCENDIDO" or "Vuelo APAGADO", Duracion = 1.2 })
    end })

SEsp:Boton({ Texto = "Ver estado del Toggle", Tooltip = "Lee el flag 'v_kbToggle_estado' (no se guarda en perfiles)",
    Callback = function()
        local estado = AlanUI:ObtenerFlag("v_kbToggle_estado")
        AlanUI:Notificar({ Titulo = "Estado del Toggle", Texto = tostring(estado), Duracion = 2 })
    end })

-- ── Visualización ──────────────────────────────────────────────
local SVis = TabCtrl:CrearSeccion("Visualización")
SVis:Parrafo({ Titulo = "Label / Progreso / Imagen", Contenido = "Elementos de solo lectura: Label (texto dinámico), Progreso (barra), Imagen (con Aspecto)." })

local lblSimple = SVis:Label({ Texto = "Label simple", Flag = "v_lbl", Valor = "valor inicial",
    Tooltip = "Set() para cambiar el valor, SetColor() para colorearlo" })

local lblAuto = SVis:Label({ Texto = "Label con auto-update", Flag = "v_lblAuto", Valor = "–",
    Cada = 0.5, Actualizar = function() return string.format("%.1fs desde carga", os.clock()) end,
    Tooltip = "Actualiza su valor cada 0.5s automáticamente" })

SVis:Label({ Texto = "Label con descripción", Flag = "v_lblDesc", Valor = "ℹ️",
    Descripcion = "La flecha expande este texto. Útil para explicaciones largas sin ocupar espacio permanente.",
    Tooltip = "Click en la flecha de la izquierda para expandir" })

local prog = SVis:Progreso({ Texto = "Progreso", Flag = "v_prog", Defecto = 35,
    Tooltip = "Solo lectura. Set() con 0-100" })

SVis:Imagen({ Url = "rbxassetid://6031094678", Aspecto = "16:9", Radio = 8,
    Tooltip = "Imagen con Aspecto 16:9: la altura se calcula según el ancho" })

-- Botones para mover el Label simple y el Progreso
local SBotVar = TabCtrl:CrearSeccion("Variar valores")
SBotVar:Boton({ Texto = "Cambiar Label simple", Callback = function()
    local valores = { "estado óptimo", "cargando...", "error de red", "listo ✅" }
    local v = valores[math.random(1, #valores)]
    lblSimple:Set(v)
    lblSimple:SetColor(v:find("error") and Color3.fromRGB(231,76,60) or Color3.fromRGB(46,204,113))
end })

SBotVar:Boton({ Texto = "Avanzar Progreso +10%", Callback = function()
    local actual = AlanUI:ObtenerFlag("v_prog") or 0
    local nuevo = (actual + 10) % 110
    prog:Set(nuevo > 100 and 0 or nuevo)
end })

-- ══════════════════════════════════════════════════════════════
--  TAB 2 — VENTANA Y LAYOUT
-- ══════════════════════════════════════════════════════════════
local TabVent = V:CrearTab("Ventana", "🪟")

-- ── Contenedores ───────────────────────────────────────────────
local SCont = TabVent:CrearSeccion("Contenedores de layout")
SCont:Parrafo({ Titulo = "Parrafo / Divider / Grupo", Contenido = "Elementos que agrupan o separan sin ser controles: texto informativo, líneas divisorias, botones en fila." })

SCont:Divider({ Texto = "Divider con texto" })
SCont:Parrafo({
    Titulo = "Parrafo simple",
    Contenido = "Solo título y contenido, sin extras.",
})

SCont:Parrafo({
    Titulo = "Parrafo avanzado",
    Contenido = "Con imagen, miniatura y botones abajo.",
    ImagenUrl = "rbxassetid://6031094678", ImagenAlto = 90,
    MiniaturaUrl = "rbxassetid://6031094678",
    Botones = {
        { Texto = "Copiar", Variante = "primary", Callback = function() AlanUI:Notificar({ Titulo = "Copiar", Texto = "Pulsado", Duracion = 1.5 }) end },
        { Texto = "Cerrar", Callback = function() AlanUI:Notificar({ Titulo = "Cerrar", Texto = "Pulsado", Duracion = 1.5 }) end },
    },
})

SCont:Divider({ Texto = "Grupo de botones (fila horizontal)" })
local grupo = SCont:Grupo()
grupo:Boton({ Texto = "Guardar", Callback = function() AlanUI:Notificar({ Titulo = "Guardar", Texto = "Pulsado", Duracion = 1.5 }) end })
grupo:Boton({ Texto = "Cargar", Callback = function() AlanUI:Notificar({ Titulo = "Cargar", Texto = "Pulsado", Duracion = 1.5 }) end })
grupo:Boton({ Texto = "Eliminar", Callback = function() AlanUI:Notificar({ Titulo = "Eliminar", Texto = "Pulsado", Tipo = "Warning", Duracion = 1.5 }) end })

SCont:Divider({ Texto = "Columnas (se apilan si no caben)" })
local colA, colB = SCont:Columnas({ MinimoAncho = 380 })
colA:Toggle({ Texto = "Opción A", Flag = "v_colA", Defecto = true,
    Tooltip = "Cada columna acepta los mismos controles que una sección" })
colA:Slider({ Texto = "Valor A", Flag = "v_colA2", Min = 0, Max = 100, Defecto = 40 })
colB:Toggle({ Texto = "Opción B", Flag = "v_colB" })
colB:Dropdown({ Texto = "Modo B", Flag = "v_colB2", Opciones = { "Uno", "Dos", "Tres" }, Defecto = "Uno" })

SCont:Divider()

-- ── Funciones de la ventana ────────────────────────────────────
local SFunc = TabVent:CrearSeccion("Funciones en vivo")
SFunc:Parrafo({ Titulo = "Control de la ventana", Contenido = "Cada botón ejecuta una función pública de la ventana." })

SFunc:Boton({ Texto = "🔍 Buscar 'color'", Tooltip = "Filtra por ese texto y cambia a la primera tab con match",
    Callback = function() V:Buscar("color") end })

SFunc:Boton({ Texto = "🔍 Limpiar búsqueda", Callback = function() V:Buscar("") end })

SFunc:Boton({ Texto = "📐 Alternar orientación (vertical ↔ horizontal)",
    Tooltip = "Cambia entre tabs laterales y barra superior",
    Callback = function()
        local horizontal = (V._buscadorBoxHoriz and V._buscadorBoxHoriz.Visible)
        V:CambiarOrientacion(horizontal and "vertical" or "horizontal")
    end })

SFunc:Boton({ Texto = "🎨 Aplicar tema DemoNeon", Callback = function() V:CambiarTema("DemoNeon") end })
SFunc:Boton({ Texto = "🎨 Aplicar tema Negro (default)", Callback = function() V:CambiarTema("Negro") end })

SFunc:Boton({ Texto = "➖ Minimizar (3s)", Callback = function()
    V:Minimizar()
    task.delay(3, function() V:Mostrar() end)
end })

SFunc:Boton({ Texto = "🔄 Resetear todos los controles a Defecto",
    Tooltip = "Vuelve los controles a su valor inicial (no toca la Preinstalada)",
    Callback = function() V:Resetear() end })

SFunc:Boton({ Texto = "🏷️ Agregar tag al header", Callback = function()
    local colores = { "info", "success", "warning", "danger", "neutral" }
    V:AgregarTag({ Texto = "TAG " .. math.random(1, 99), Color = colores[math.random(1, #colores)] })
end })

SFunc:Boton({ Texto = "🌈 Agregar tag rainbow", Callback = function()
    local t = V:AgregarTag({ Texto = "RAINBOW", Color = "rainbow", Icono = "🌈" })
    task.delay(5, function() t.Remover() end)
end })

-- ── Posición de la ventana ─────────────────────────────────────
local SPos = TabVent:CrearSeccion("Posición de la ventana")
SPos:Parrafo({
    Titulo = "Se recuerda entre ejecuciones",
    Contenido = "Arrastra la ventana por la barra de título y vuelve a ejecutar la vitrina: aparece donde la dejaste. Se guarda en un archivo propio por script (AlanUI/Config/_ui). Al abrir y cerrar con la tecla de toggle vuelve a su posición de inicio, como siempre.",
})
SPos:Boton({ Texto = "🎯 Resetear posición",
    Tooltip = "Vuelve al centro de la pantalla (Ventana:ResetearPosicion)",
    Callback = function() V:ResetearPosicion() end })
SPos:Boton({ Texto = "💾 Guardar posición ahora",
    Tooltip = "Escribe la posición actual sin esperar (Ventana:GuardarPosicion). Devuelve false si el ejecutor no soporta archivos",
    Callback = function()
        local ok = V:GuardarPosicion()
        AlanUI:Notificar({ Titulo = "Posición", Texto = ok and "Guardada" or "No se pudo guardar (¿sin soporte de archivos?)",
            Tipo = ok and "Success" or "Warning", Duracion = 2 })
    end })
SPos:Boton({ Texto = "📂 Cargar posición guardada",
    Tooltip = "Mueve la ventana a la última posición guardada (Ventana:CargarPosicion)",
    Callback = function()
        local ok = V:CargarPosicion()
        AlanUI:Notificar({ Titulo = "Posición", Texto = ok and "Cargada" or "No hay una posición guardada",
            Tipo = ok and "Success" or "Info", Duracion = 2 })
    end })

-- ── Bordes de la ventana ───────────────────────────────────────
local SBorde = TabVent:CrearSeccion("Bordes de la ventana")
SBorde:Parrafo({
    Titulo = "Ventana:EstablecerBorde",
    Contenido = "Acepta lo mismo que un tag (colores, degradados, arcoíris, animación) y además los colores del tema, que siguen al tema si lo cambias. También se puede cambiar desde la Preinstalada, en Apariencia.",
})
local ESTILOS_BORDE = {
    { "🎨 Tema (degradado)", "tema",
      "Degradado Accent → AccentLight. Sigue al tema: pruébalo y cambia de tema" },
    { "🎞️ Tema animado", { Color = "tema", Animar = true, Grosor = 3 },
      "El mismo degradado, girando. El degradado se cierra sobre sí mismo para que la vuelta no tenga costura" },
    { "🌈 Arcoíris animado", "rainbow",
      "Como el tag rainbow: se anima solo" },
    { "💜 Degradado personalizado", { Color = { Color3.fromRGB(150, 90, 230), Color3.fromRGB(60, 190, 220) }, Animar = true, Grosor = 3 },
      "Dos colores tuyos, animado" },
    { "🔀 Mezcla tema + color", { Color = { "Accent", Color3.fromRGB(255, 90, 140), "AccentLight" }, Animar = true, Grosor = 3 },
      "Una lista puede mezclar Color3 con claves del tema ('Accent', 'AccentLight'...)" },
    { "🟡 Color liso", Color3.fromRGB(241, 196, 15),
      "Un Color3 suelto" },
    { "🧹 Quitar borde", nil,
      "Vuelve al borde de siempre (EstablecerBorde(nil))" },
}
for _, estilo in ipairs(ESTILOS_BORDE) do
    SBorde:Boton({ Texto = estilo[1], Tooltip = estilo[3], Callback = function()
        V:EstablecerBorde(estilo[2])
    end })
end

-- ── Construir desde schema ─────────────────────────────────────
local SSchema = TabVent:CrearSeccion("Construir desde schema")
SSchema:Parrafo({ Titulo = "ConstruirDesdeSchema", Contenido = "Crea una pestaña entera con secciones y controles desde una sola tabla." })

SSchema:Boton({ Texto = "🧬 Crear pestaña entera desde schema",
    Tooltip = "Crea una tab nueva con 2 secciones y varios controles preconfigurados",
    Callback = function()
        local creados = V:ConstruirDesdeSchema({
            Tabs = {{
                Nombre = "Generada", Icono = "🧬",
                Secciones = {
                    {
                        Nombre = "Creada dinámicamente",
                        Controles = {
                            { Control = "Toggle", Texto = "Auto Mode", Flag = "sch_auto", Defecto = false },
                            { Control = "Slider", Texto = "Velocidad", Flag = "sch_vel", Min = 0, Max = 100, Defecto = 30 },
                            { Control = "Boton", Texto = "Aplicar", Callback = function()
                                AlanUI:Notificar({ Titulo = "Schema", Texto = "Botón de schema pulsado", Duracion = 2 })
                            end },
                        },
                    },
                    {
                        Nombre = "Colapsada por defecto",
                        ColapsadaPorDefecto = true,
                        Controles = {
                            { Control = "Input", Texto = "API Key", Flag = "sch_api", Defecto = "" },
                        },
                    },
                },
            }},
        })
        AlanUI:Notificar({
            Titulo = "🧬 Schema construido",
            Texto = "Pestaña 'Generada' agregada. Slider guardado en sch_vel",
            Duracion = 4,
        })
    end })

-- ── Divisores dinámicos ────────────────────────────────────────
local SDiv = TabVent:CrearSeccion("Divisores")
SDiv:Parrafo({ Titulo = "Divisores", Contenido = "Divisor dentro de la página (entre secciones) y divisor en la barra lateral (entre tabs)." })

SDiv:Boton({ Texto = "📏 Crear Divisor de tab aquí", Tooltip = "Añade un separador al FINAL de esta pestaña y te lleva hasta él",
    Callback = function()
        TabVent:CrearDivisor({ Texto = "Fin de funciones en vivo" })
        -- El divisor entra al final de la página: se desplaza hasta ahí
        -- para que se vea aparecer (si no, queda fuera de pantalla).
        task.delay(0.15, function()
            local pagina = TabVent.Pagina
            game:GetService("TweenService"):Create(
                pagina,
                TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
                { CanvasPosition = Vector2.new(0, pagina.AbsoluteCanvasSize.Y) }
            ):Play()
        end)
    end })

SDiv:Boton({ Texto = "📐 Crear Divisor de sidebar", Tooltip = "Añade una línea entre las tabs laterales",
    Callback = function() V:AgregarDivisorSidebar({ Texto = "Extras" }) end })

-- ── Destruir ───────────────────────────────────────────────────
local SDest = TabVent:CrearSeccion("Destruir")
SDest:Parrafo({ Titulo = "Ventana:Destruir()", Contenido = "Cierra la interfaz y limpia todas las conexiones. Pide confirmación antes de ejecutar." })

SDest:Boton({ Texto = "💀 Destruir la ventana",
    Tooltip = "Equivalente al botón ✕ de la barra superior",
    Callback = function()
        AlanUI:Confirmar({
            Titulo = "¿Cerrar la vitrina?",
            Contenido = "Todos los controles se perderán.",
            Icono = "⚠️",
            BotonAceptar = { Texto = "Cerrar", Variante = "danger", Callback = function() V:Destruir() end },
            BotonCancelar = { Texto = "Cancelar" },
        })
    end })

-- ══════════════════════════════════════════════════════════════
--  TAB 3 — ALERTAS
-- ══════════════════════════════════════════════════════════════
local TabAlert = V:CrearTab("Alertas", "🔔")

-- ── Notificaciones ─────────────────────────────────────────────
local SNot = TabAlert:CrearSeccion("Notificaciones")
SNot:Parrafo({ Titulo = "Notificar", Contenido = "Tipos: Info (acento del tema), Success, Warning, Error. Persistente no se autocierra. Prioridad salta la cola." })

SNot:Boton({ Texto = "ℹ️ Notificación Info", Callback = function()
    AlanUI:Notificar({ Titulo = "Info", Texto = "Mensaje informativo genérico", Tipo = "Info", Duracion = 3 })
end })

SNot:Boton({ Texto = "✅ Notificación Success", Callback = function()
    AlanUI:Notificar({ Titulo = "Éxito", Texto = "Operación completada", Tipo = "Success", Duracion = 3 })
end })

SNot:Boton({ Texto = "⚠️ Notificación Warning", Callback = function()
    AlanUI:Notificar({ Titulo = "Atención", Texto = "Esto puede ser lento", Tipo = "Warning", Duracion = 3 })
end })

SNot:Boton({ Texto = "❌ Notificación Error", Callback = function()
    AlanUI:Notificar({ Titulo = "Error", Texto = "Algo salió mal en la operación", Tipo = "Error", Duracion = 3 })
end })

SNot:Boton({ Texto = "📌 Notificación Persistente", Tooltip = "No se autocierra. Click para descartarla",
    Callback = function()
        AlanUI:Notificar({ Titulo = "Requiere acción", Texto = "Click en la tarjeta para descartar", Tipo = "Warning", Persistente = true })
    end })

SNot:Boton({ Texto = "🔴 8 notificaciones (prueba de cola)", Tooltip = "Las últimas 4 se encolan",
    Callback = function()
        for i = 1, 8 do
            AlanUI:Notificar({ Titulo = "Notif " .. i, Texto = "Mensaje " .. i, Duracion = 1.5 })
        end
    end })

SNot:Boton({ Texto = "🚨 Prioridad alta (salta la cola)", Tooltip = "Con la cola llena, salta adelante",
    Callback = function()
        for i = 1, 6 do AlanUI:Notificar({ Titulo = "Baja " .. i, Texto = "prioridad 0", Duracion = 2 }) end
        AlanUI:Notificar({ Titulo = "⚡ CRÍTICA", Texto = "Prioridad 5 — salta adelante", Tipo = "Error", Prioridad = 5, Duracion = 4 })
    end })

-- ── Modal Confirmar ────────────────────────────────────────────
local SMod = TabAlert:CrearSeccion("Modal Confirmar")
SMod:Parrafo({ Titulo = "Confirmar", Contenido = "Modal con botones personalizables. Variantes: primary (acento), danger (rojo), tertiary (borde), neutral (por defecto)." })

SMod:Boton({ Texto = "Modal simple (Aceptar / Cancelar)",
    Callback = function()
        AlanUI:Confirmar({
            Titulo = "¿Continuar?",
            Contenido = "Esta es la forma simple con dos botones por defecto.",
            BotonAceptar = { Texto = "Continuar", Callback = function()
                AlanUI:Notificar({ Titulo = "Confirmado", Texto = "Se pulsó Continuar", Tipo = "Success", Duracion = 2 })
            end },
            BotonCancelar = { Texto = "Cancelar" },
        })
    end })

SMod:Boton({ Texto = "Modal con icono y 3 botones (variantes)",
    Callback = function()
        AlanUI:Confirmar({
            Icono = "⚠️",
            Titulo = "¿Eliminar el perfil?",
            Contenido = "Cada botón usa una variante distinta para comparar estilos.",
            Botones = {
                { Texto = "Eliminar", Variante = "danger",  Callback = function() AlanUI:Notificar({ Titulo = "danger", Texto = "Botón rojo pulsado", Tipo = "Error", Duracion = 2 }) end },
                { Texto = "Guardar",  Variante = "primary", Callback = function() AlanUI:Notificar({ Titulo = "primary", Texto = "Botón acento pulsado", Duracion = 2 }) end },
                { Texto = "Cancelar", Variante = "tertiary", Callback = function() AlanUI:Notificar({ Titulo = "tertiary", Texto = "Botón con borde pulsado", Duracion = 2 }) end },
            },
        })
    end })

SMod:Boton({ Texto = "Modal apilado (dos encima)",
    Callback = function()
        AlanUI:Confirmar({
            Titulo = "Primer modal",
            Contenido = "Pulsa Siguiente para abrir otro encima.",
            BotonAceptar = { Texto = "Siguiente", Callback = function()
                AlanUI:Confirmar({ Titulo = "Segundo modal", Contenido = "Este quedó encima del primero." })
            end },
            BotonCancelar = { Texto = "Cerrar" },
        })
    end })

-- ── Dialogo por tipo ───────────────────────────────────────────
local SDlg = TabAlert:CrearSeccion("Dialogo (por tipo)")
SDlg:Parrafo({ Titulo = "AlanUI:Dialogo",
    Contenido = "Un modal que elige solo el ícono, el color del borde y el botón de aceptar según el Tipo: info, question, success, warning o error." })

local DIALOGOS_DEMO = {
    { Texto = "ℹ️ info",     Tipo = "info",     Titulo = "Información",       Contenido = "Un mensaje informativo con un solo botón." },
    { Texto = "❓ question", Tipo = "question", Titulo = "¿Guardar cambios?", Contenido = "Las preguntas traen Sí y Cancelar." },
    { Texto = "✅ success",  Tipo = "success",  Titulo = "Listo",             Contenido = "La operación terminó bien. Borde verde." },
    { Texto = "⚠️ warning",  Tipo = "warning",  Titulo = "Cuidado",           Contenido = "Las advertencias traen borde amarillo y Cancelar." },
    { Texto = "❌ error",    Tipo = "error",    Titulo = "Falló",             Contenido = "Los errores usan borde rojo y el botón de aceptar en rojo." },
}
for _, demo in ipairs(DIALOGOS_DEMO) do
    SDlg:Boton({ Texto = demo.Texto, Callback = function()
        AlanUI:Dialogo({ Tipo = demo.Tipo, Titulo = demo.Titulo, Contenido = demo.Contenido })
    end })
end

SDlg:Boton({ Texto = "☑️ Con casilla (\"No volver a preguntar\")",
    Tooltip = "El estado de la casilla llega a los Callback de los botones",
    Callback = function()
        AlanUI:Dialogo({
            Tipo = "question", Titulo = "¿Aplicar ahora?",
            Contenido = "Marca la casilla y elige un botón: su estado llega al Callback.",
            Casilla = { Texto = "No volver a preguntar" },
            Botones = {
                { Texto = "Después", Variante = "neutral", Callback = function(marcada)
                    AlanUI:Notificar({ Titulo = "Después", Texto = "Casilla: " .. tostring(marcada), Duracion = 2 })
                end },
                { Texto = "Aplicar", Variante = "primary", Callback = function(marcada)
                    AlanUI:Notificar({ Titulo = "Aplicar", Texto = "Casilla: " .. tostring(marcada), Tipo = "Success", Duracion = 2 })
                end },
            },
        })
    end })

SDlg:Boton({ Texto = "🎨 Ancho y borde propios",
    Tooltip = "Ancho (240-480) y ColorBorde también funcionan en AlanUI:Confirmar",
    Callback = function()
        AlanUI:Dialogo({
            Tipo = "info", Titulo = "Modal ancho", Ancho = 400,
            ColorBorde = Color3.fromRGB(150, 90, 230),
            Contenido = "Este modal mide 400 px de ancho y tiene un borde violeta.",
        })
    end })

SDlg:Boton({ Texto = "🌈 Borde degradado animado",
    Tooltip = "Los modales también aceptan 'Borde', con el mismo formato que EstablecerBorde",
    Callback = function()
        AlanUI:Dialogo({
            Tipo = "info", Titulo = "Borde con tema",
            Contenido = "Este modal usa Borde = { Color = { \"Accent\", \"AccentLight\" }, Animar = true } y sigue los colores de la interfaz.",
            Borde = { Color = { "Accent", "AccentLight" }, Animar = true, Grosor = 3 },
        })
    end })

-- ── Tags ───────────────────────────────────────────────────────
local STag = TabAlert:CrearSeccion("Tags del header")
STag:Parrafo({ Titulo = "AgregarTag", Contenido = "Pastillas junto al título. Colores predefinidos: info, success, warning, danger, neutral. También acepta Color3 o tabla de Color3." })

local tagsGuardados = {}
STag:Boton({ Texto = "➕ Agregar tag de cada color", Callback = function()
    for _, c in ipairs({ "info", "success", "warning", "danger", "neutral" }) do
        table.insert(tagsGuardados, V:AgregarTag({ Texto = c:upper(), Color = c }))
    end
end })

STag:Boton({ Texto = "🎨 Tag con Color3 custom", Callback = function()
    table.insert(tagsGuardados, V:AgregarTag({ Texto = "CUSTOM", Color = Color3.fromRGB(120, 80, 200) }))
end })

STag:Boton({ Texto = "🌈 Tag rainbow animado", Callback = function()
    table.insert(tagsGuardados, V:AgregarTag({ Texto = "RAINBOW", Color = "rainbow", Icono = "🌈" }))
end })

STag:Boton({ Texto = "🗑️ Quitar el último tag", Callback = function()
    local t = table.remove(tagsGuardados)
    if t then t.Remover() end
end })

-- ── Configurar un tag ──────────────────────────────────────────
local STagCfg = TabAlert:CrearSeccion("Configurar tag")
STagCfg:Parrafo({ Titulo = "Tag a tu medida",
    Contenido = "Elige el texto, el ícono, el color y si se anima. Luego agrégalo al header con el botón. Cada tag se quita con '🗑️ Quitar el último tag' de la sección de arriba." })

STagCfg:Input({ Texto = "Texto", Flag = "tagcfg_texto", Defecto = "MI TAG", Placeholder = "Texto del tag...",
    Tooltip = "Lo que dice la pastilla. Si lo dejas vacío se usa 'TAG'" })
STagCfg:Input({ Texto = "Ícono (opcional)", Flag = "tagcfg_icono", Defecto = "", Placeholder = "Un emoji, por ejemplo 🔥",
    Tooltip = "Emoji o carácter que va antes del texto" })
STagCfg:Dropdown({ Texto = "Color", Flag = "tagcfg_color",
    Opciones = { "info", "success", "warning", "danger", "neutral", "rainbow", "Color3 personalizado", "Degradado (2 colores)" },
    Defecto = "info",
    Tooltip = "Los 5 primeros son colores predefinidos. 'Color3 personalizado' usa el Color 1; 'Degradado' mezcla el Color 1 con el Color 2" })
STagCfg:ColorPicker({ Texto = "Color 1", Flag = "tagcfg_c1", Defecto = Color3.fromRGB(120, 80, 200),
    Tooltip = "Se usa con 'Color3 personalizado' y con 'Degradado'" })
STagCfg:ColorPicker({ Texto = "Color 2 (degradado)", Flag = "tagcfg_c2", Defecto = Color3.fromRGB(60, 190, 220),
    Tooltip = "Segundo color del degradado" })
STagCfg:Toggle({ Texto = "Animar", Flag = "tagcfg_animar", Defecto = true,
    Tooltip = "Hace girar el degradado (rainbow y degradado de 2 colores). En un color liso no se nota" })
STagCfg:Toggle({ Texto = "Clickeable", Flag = "tagcfg_click", Defecto = false,
    Tooltip = "Si está activo, al tocar el tag aparece una notificación" })

STagCfg:Boton({ Texto = "➕ Agregar tag con esta configuración",
    Tooltip = "Crea el tag en el header con los valores de arriba",
    Callback = function()
        local texto = AlanUI:ObtenerFlag("tagcfg_texto")
        if type(texto) ~= "string" or texto:gsub("%s", "") == "" then texto = "TAG" end

        local color = AlanUI:ObtenerFlag("tagcfg_color")
        if color == "Color3 personalizado" then
            color = AlanUI:ObtenerFlag("tagcfg_c1")
        elseif color == "Degradado (2 colores)" then
            color = { AlanUI:ObtenerFlag("tagcfg_c1"), AlanUI:ObtenerFlag("tagcfg_c2") }
        end

        local cfgTag = { Texto = texto, Color = color, Animar = AlanUI:ObtenerFlag("tagcfg_animar") == true }
        local icono = AlanUI:ObtenerFlag("tagcfg_icono")
        if type(icono) == "string" and icono ~= "" then cfgTag.Icono = icono end
        if AlanUI:ObtenerFlag("tagcfg_click") == true then
            cfgTag.Callback = function()
                AlanUI:Notificar({ Titulo = "🏷️ Tag tocado", Texto = texto, Duracion = 2 })
            end
        end
        table.insert(tagsGuardados, V:AgregarTag(cfgTag))
    end })

STagCfg:Boton({ Texto = "🧹 Quitar todos los tags", Callback = function()
    for i = #tagsGuardados, 1, -1 do
        local t = table.remove(tagsGuardados, i)
        if t then t.Remover() end
    end
end })

-- ══════════════════════════════════════════════════════════════
--  TAB 4 — ESTADOS
-- ══════════════════════════════════════════════════════════════
local TabEst = V:CrearTab("Estados", "🔒")

-- ── Lock / Unlock ──────────────────────────────────────────────
local SLock = TabEst:CrearSeccion("Lock (bloqueo)")
SLock:Parrafo({ Titulo = "Lock / Unlock", Contenido = "El control queda cubierto por una capa con motivo visible. Set() sigue funcionando desde código." })

local controlesLockeables = {}
for _, par in ipairs({
    { "Boton",  { Texto = "Botón bloqueado", Callback = function() end } },
    { "Toggle", { Texto = "Toggle bloqueado", Flag = "lk_tog" } },
    { "Slider", { Texto = "Slider bloqueado", Flag = "lk_sl", Min = 0, Max = 100, Defecto = 50 } },
    { "Input",  { Texto = "Input bloqueado", Flag = "lk_in" } },
    { "Dropdown", { Texto = "Dropdown bloqueado", Flag = "lk_dd", Opciones = { "A", "B", "C" }, Defecto = "A" } },
}) do
    local nombre, cfg = par[1], par[2]
    cfg.Locked = true
    cfg.LockedTitle = "Requiere AutoFarm"
    controlesLockeables[nombre] = SLock[nombre](SLock, cfg)
end

SLock:Boton({ Texto = "🔓 Desbloquear todos", Callback = function()
    for _, c in pairs(controlesLockeables) do c:Unlock() end
end })

SLock:Boton({ Texto = "🔒 Volver a bloquear con otro motivo", Callback = function()
    for _, c in pairs(controlesLockeables) do c:Lock("Solo para premium") end
end })

-- ── Highlight ──────────────────────────────────────────────────
local SHL = TabEst:CrearSeccion("Highlight (resaltado)")
SHL:Parrafo({ Titulo = "Highlight", Contenido = "Borde pulsante temporal alrededor del control para llamar la atención." })

local sliderResaltable = SHL:Slider({ Texto = "Slider resaltable", Flag = "hl_sl", Min = 0, Max = 100, Defecto = 40 })

SHL:Boton({ Texto = "✨ Resaltar 2 segundos", Callback = function() sliderResaltable:Highlight(2) end })
SHL:Boton({ Texto = "✨ Resaltar 5 segundos", Callback = function() sliderResaltable:Highlight({ Duracion = 5 }) end })

-- ── VisibleSi ──────────────────────────────────────────────────
local SVis2 = TabEst:CrearSeccion("VisibleSi (visibilidad condicional)")
SVis2:Parrafo({ Titulo = "VisibleSi", Contenido = "El control se muestra/oculta según el valor de otro flag. Acá: los 3 siguientes se ocultan si 'Modo avanzado' está apagado." })

SVis2:Toggle({ Texto = "Modo avanzado", Flag = "vis_master", Defecto = true,
    Tooltip = "Prendé/apagá para ver los controles de abajo aparecer/desaparecer" })

SVis2:Slider({ Texto = "Precisión (avanzado)", Flag = "vis_prec", Min = 1, Max = 10, Defecto = 5,
    VisibleSi = function() return AlanUI.Flags["vis_master"] == true end })

SVis2:Dropdown({ Texto = "Prioridad (avanzado)", Flag = "vis_prio",
    Opciones = { "Baja", "Media", "Alta" }, Defecto = "Media",
    VisibleSi = function() return AlanUI.Flags["vis_master"] == true end })

SVis2:Input({ Texto = "Filtro (avanzado)", Flag = "vis_filtro", Placeholder = "…",
    VisibleSi = function() return AlanUI.Flags["vis_master"] == true end })

-- ══════════════════════════════════════════════════════════════
--  TAB 5 — APIs Y DIAGNÓSTICO
-- ══════════════════════════════════════════════════════════════
local TabAPI = V:CrearTab("APIs", "⚙️")

-- ── Historial ──────────────────────────────────────────────────
local SHist = TabAPI:CrearSeccion("Historial (Deshacer / Rehacer)")
SHist:Parrafo({ Titulo = "Historial", Contenido = "Registra los cambios de controles (no de la Preinstalada). Slider contiguos = 1 sola entrada." })

local lblHist = SHist:Label({ Texto = "Estado", Flag = "api_histEstado", Valor = "—" })
local grupoHist = SHist:Grupo()
grupoHist:Boton({ Texto = "↩️ Deshacer", Callback = function()
    local ok, entrada = AlanUI:Deshacer()
    AlanUI:Notificar({
        Titulo = ok and "↩️ Deshecho" or "Nada",
        Texto = ok and AlanUI:DescribirCambio(entrada) or "Nada que deshacer",
        Duracion = 2,
    })
end })
grupoHist:Boton({ Texto = "↪️ Rehacer", Callback = function()
    local ok, entrada = AlanUI:Rehacer()
    AlanUI:Notificar({
        Titulo = ok and "↪️ Rehecho" or "Nada",
        Texto = ok and AlanUI:DescribirCambio(entrada) or "Nada que rehacer",
        Duracion = 2,
    })
end })
SHist:Boton({ Texto = "🧹 Limpiar historial", Callback = function() AlanUI:LimpiarHistorial() end })

AlanUI.Eventos.HistorialCambiado:Connect(function(nD, nR)
    pcall(function() lblHist:Set(nD .. " deshacer · " .. nR .. " rehacer") end)
end)

-- ── Perfiles ───────────────────────────────────────────────────
local SPerf = TabAPI:CrearSeccion("Perfiles de script")
SPerf:Parrafo({ Titulo = "SaveManager", Contenido = "Guarda/carga el estado de los controles (excepto la Preinstalada). Usa el prefijo 'v_' en los nombres de perfil demo." })

local perfilActual = "v_demo_1"

SPerf:Boton({ Texto = "💾 Guardar perfil actual (v_demo_1)", Callback = function()
    local ok = AlanUI.SaveManager:Guardar(perfilActual)
    AlanUI:Notificar({ Titulo = "Guardar", Texto = ok and ("Perfil " .. perfilActual .. " guardado") or "Falló", Duracion = 2 })
end })

SPerf:Boton({ Texto = "📂 Cargar perfil (v_demo_1)", Callback = function()
    AlanUI.SaveManager:Cargar(perfilActual)
end })

SPerf:Boton({ Texto = "🔀 Cambiar perfil activo (v_demo_2)", Tooltip = "Guarda el actual y carga/crea otro",
    Callback = function()
        AlanUI.SaveManager:CambiarPerfil(V, "v_demo_2")
        perfilActual = "v_demo_2"
    end })

SPerf:Boton({ Texto = "📋 Listar perfiles guardados", Callback = function()
    local lista = AlanUI.SaveManager:Listar()
    print("[VITRINA] Perfiles: " .. table.concat(lista, ", "))
    AlanUI:Notificar({ Titulo = "Listar", Texto = #lista .. " perfiles (ver consola)", Duracion = 3 })
end })

SPerf:Boton({ Texto = "📑 Duplicar v_demo_1 → v_demo_copia", Callback = function()
    local ok, err = AlanUI.SaveManager:Duplicar("v_demo_1", "v_demo_copia")
    AlanUI:Notificar({ Titulo = ok and "📑 Duplicado" or "Falló", Texto = ok and "v_demo_copia" or tostring(err), Duracion = 2 })
end })

SPerf:Boton({ Texto = "✏️ Renombrar v_demo_copia → v_demo_renombrado", Callback = function()
    local ok, err = AlanUI.SaveManager:Renombrar("v_demo_copia", "v_demo_renombrado")
    AlanUI:Notificar({ Titulo = ok and "✏️ Renombrado" or "Falló", Texto = ok and "v_demo_renombrado" or tostring(err), Duracion = 2 })
end })

SPerf:Boton({ Texto = "📤 Exportar v_demo_1 (copia al portapapeles)", Callback = function()
    local texto, copiado = AlanUI.SaveManager:Exportar("v_demo_1")
    if texto then
        AlanUI:Notificar({ Titulo = "📤 Exportado", Texto = copiado and "Copiado al portapapeles" or "Texto disponible", Duracion = 2 })
    else
        AlanUI:Notificar({ Titulo = "Falló", Texto = tostring(copiado), Tipo = "Error", Duracion = 3 })
    end
end })

SPerf:Boton({ Texto = "📥 Importar v_demo_1 → v_demo_importado", Callback = function()
    local texto = AlanUI.SaveManager:Exportar("v_demo_1")
    if not texto then AlanUI:Notificar({ Titulo = "Sin origen", Duracion = 2 }) return end
    local ok, err = AlanUI.SaveManager:Importar("v_demo_importado", texto)
    AlanUI:Notificar({ Titulo = ok and "📥 Importado" or "Falló", Texto = ok and "v_demo_importado" or tostring(err), Duracion = 2 })
end })

SPerf:Boton({ Texto = "🗑️ Limpiar todos los perfiles demo", Tooltip = "Borra v_demo_* del disco",
    Callback = function()
        local nombres = { "v_demo_1", "v_demo_2", "v_demo_copia", "v_demo_renombrado", "v_demo_importado" }
        for _, n in ipairs(nombres) do pcall(function() AlanUI.SaveManager:Eliminar(n) end) end
        AlanUI:Notificar({ Titulo = "Limpieza", Texto = "Perfiles demo eliminados", Duracion = 2 })
    end })

-- ── Lectura de flags ───────────────────────────────────────────
local SRead = TabAPI:CrearSeccion("Lectura de flags")
SRead:Parrafo({ Titulo = "ObtenerFlag / Try / ObtenerElemento", Contenido = "Tres formas de leer el valor de un control desde código." })

local lblLectura = SRead:Label({ Texto = "Resultado", Flag = "api_lecturaResultado", Valor = "—" })

SRead:Boton({ Texto = "📖 ObtenerFlag('v_slider')", Callback = function()
    local v = AlanUI:ObtenerFlag("v_slider")
    lblLectura:Set("ObtenerFlag v_slider = " .. tostring(v))
end })

SRead:Boton({ Texto = "📖 Try('no_existe', 999)", Callback = function()
    local v = AlanUI:Try("no_existe", 999)
    lblLectura:Set("Try no_existe = " .. tostring(v) .. " (fallback)")
end })

SRead:Boton({ Texto = "🔍 ObtenerElemento('v_slider').Get()", Callback = function()
    local elem = AlanUI:ObtenerElemento("v_slider")
    if elem then
        lblLectura:Set("Elemento.Get() = " .. tostring(elem.Get()))
    else
        lblLectura:Set("Elemento no encontrado")
    end
end })

SRead:Boton({ Texto = "✏️ AlanUI:ActualizarLabel('v_lbl', texto)", Callback = function()
    local nuevo = "actualizado " .. os.date("%H:%M:%S")
    AlanUI:ActualizarLabel("v_lbl", nuevo)
    lblLectura:Set("Label v_lbl → " .. nuevo)
end })

-- ── Diagnóstico ────────────────────────────────────────────────
local SDiag = TabAPI:CrearSeccion("Diagnóstico")
SDiag:Parrafo({ Titulo = "Diagnóstico", Contenido = "Herramientas para reportar bugs: Profiler, DiagnosticoCompleto, VerificarSoporte, ForzarTipo." })

SDiag:Boton({ Texto = "🩺 Profiler (una línea en consola)", Callback = function()
    AlanUI:Profiler()
end })

SDiag:Boton({ Texto = "🩺 DiagnosticoCompleto (dump a consola)", Callback = function()
    local d = AlanUI:DiagnosticoCompleto()
    print(string.format("[VITRINA] Entorno: %s · %s · Ejecutor: %s",
        d.Tipo, d.Plataforma, d.Ejecutor))
    print(string.format("[VITRINA] Features: %d/%d soportadas",
        d.FeaturesOk, d.FeaturesTotal))
    for _, adv in ipairs(d.Advertencias) do
        print(string.format("[VITRINA]   [%s] %s: %s", adv.nivel, adv.nombre, adv.mensaje))
    end
end })

SDiag:Boton({ Texto = "✅ Verificar soporte de 'Drawing'", Callback = function()
    local r = AlanUI:VerificarSoporte("Drawing")
    AlanUI:Notificar({
        Titulo = r.ok and "Drawing: soportado" or "Drawing: no soportado",
        Texto = r.ok and "Puedes usar Drawing.new()" or tostring(r.mensaje),
        Tipo = r.ok and "Success" or "Warning",
        Duracion = 3,
    })
end })

SDiag:Boton({ Texto = "🖥️ Forzar tipo = Tablet", Callback = function()
    AlanUI:ForzarTipo("Tablet")
    AlanUI:Notificar({ Titulo = "🖥️ Tipo forzado", Texto = "Ahora se comporta como Tablet", Duracion = 2 })
end })

SDiag:Boton({ Texto = "🖥️ Liberar tipo forzado (auto)", Callback = function()
    AlanUI:LiberarForzado()
    AlanUI:Notificar({ Titulo = "🖥️ Tipo auto", Texto = "Vuelve a detectar solo", Duracion = 2 })
end })

-- ── Opciones globales ──────────────────────────────────────────
local SOpc = TabAPI:CrearSeccion("Opciones globales (AlanUI.Opciones)")
SOpc:Parrafo({ Titulo = "Opciones", Contenido = "Valores que cambian el comportamiento de toda la librería sin pasarlos control por control." })
SOpc:Toggle({ Texto = "Confirmar al cerrar con la ✕", Flag = "v_opcConfirmarCierre", Defecto = AlanUI.Opciones.ConfirmarCierre ~= false,
    Tooltip = "AlanUI.Opciones.ConfirmarCierre. Apagado, la ✕ destruye la ventana sin preguntar. ¡Cuidado al probarlo!",
    Callback = function(v) AlanUI.Opciones.ConfirmarCierre = v end })
SOpc:Dropdown({ Texto = "Estilo de ColorPicker por defecto", Flag = "v_opcColorEstilo", Opciones = { "RGB", "2D" },
    Defecto = AlanUI.Opciones.ColorPickerEstiloPredeterminado or "RGB",
    Tooltip = "AlanUI.Opciones.ColorPickerEstiloPredeterminado. Afecta a los ColorPicker que se creen DESPUÉS (usa 'Estilo' para fijarlo en uno concreto)",
    Callback = function(v) AlanUI.Opciones.ColorPickerEstiloPredeterminado = v end })

-- ── CrearVentanaConSeguridad ───────────────────────────────────
local SSeg = TabAPI:CrearSeccion("CrearVentanaConSeguridad")
SSeg:Parrafo({
    Titulo = "Detección de otro script",
    Contenido = "Simula que otro script que usa AlanUI se ejecuta mientras esta ventana está abierta. Aparece un modal preguntando si quieres reemplazarla.",
})

SSeg:Boton({ Texto = "🛡️ Simular segundo script",
    Tooltip = "Aparece el modal de detección. Si dices 'Sí', esta ventana se cierra y se abre la nueva",
    Callback = function()
        task.spawn(function()
            local ok, resultado = pcall(function()
                return AlanUI:CrearVentanaConSeguridad({
                    Titulo = "Segundo Script",
                    Subtitulo = "Prueba de detección",
                    -- Mismo tamaño que la vitrina: la ventana nueva nace como la
                    -- primera vez que se lanzó la interfaz (mismo tamaño base y,
                    -- por lo tanto, misma escala automática en pantalla).
                    TamanoX = TAMANO_X,
                    TamanoY = TAMANO_Y,
                    AutoGuardar = false,
                    NombreConfig = "vitrina_segundo",
                })
            end)

            if not ok then
                AlanUI:Notificar({ Titulo = "Error", Texto = tostring(resultado), Tipo = "Error", Duracion = 4 })
                return
            end

            if resultado == nil then
                -- El usuario eligió "No": la vitrina sigue viva.
                print("[VITRINA] Usuario eligió NO reemplazar. Ventana original preservada.")
                return
            end

            -- El usuario eligió "Sí": la vitrina fue destruida.
            -- Poblamos la nueva ventana con info.
            local tab = resultado:CrearTab("Info", "ℹ️")
            local sec = tab:CrearSeccion("Segundo script activo")
            sec:Parrafo({
                Titulo = "Ventana reemplazada",
                Contenido = "Este es el segundo script corriendo.\nLa vitrina original fue destruida.",
            })
            sec:Boton({ Texto = "Cerrar segundo script", Callback = function()
                resultado:Destruir()
            end })
        end)
    end })

-- ══════════════════════════════════════════════════════════════
--  Estado inicial
-- ══════════════════════════════════════════════════════════════
task.delay(1.2, function()
    AlanUI:Notificar({
        Titulo = "🎛️ Vitrina cargada",
        Texto = "5 pestañas: Controles, Ventana, Alertas, Estados, APIs",
        Tipo = "Success",
        Duracion = 6,
    })
end)
