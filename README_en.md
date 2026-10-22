# 🌟 AlanUI v2.12.5

**Roblox · PC & Mobile · MIT License**

<p align="center">
  <a href="README_es.md">🇪🇸 Leer en Español</a>
  &nbsp;·&nbsp;
  <a href="#-try-the-interactive-showcase">🎮 Try the showcase</a>
</p>

A UI library for Roblox scripts, optimized to run well on both PC and mobile. Built around a clear priority order:

**Compatibility > Performance > Simplicity > Design**

AlanUI is built to avoid lag even on low-end PCs and phones — exactly where most heavy libraries start to struggle.

---

## ⚡ Key Features

* 🚀 **Lag-free & no memory leaks:** re-running your script automatically detects and destroys any previous UI instance before creating a new one.
* 📱 **True responsive design:** the interface adapts on its own between PC and mobile screens.
* 💾 **Automatic config saving, split into two separate systems:** the interface's own settings (theme, size) and your script's profiles (sliders, toggles, dropdowns) save independently, never mixing.
* 🔍 **Smart dropdowns:** dropdown menus automatically get a search bar when they have more than 8 options.
* 🎨 **Native theme system:** switch between Dark, Light, Green, Purple, and Red with no extra setup.
* 🔧 **Built-in system tab, automatically included:** every window is created with a "Preinstalled" tab (performance, environment diagnostics, theme, size, profiles, change history) — the developer doesn't need to call anything for it to appear.
* 🧩 **17 control types:** from `Toggle`/`Slider`/`Dropdown` to `RangeSlider`, `NumberStepper`, `TagInput`, `Imagen` and button `Grupo`, plus `Seccion:Construir` to build a whole section from a table.
* ↩️ **Global Undo / Redo:** every control change is recorded automatically in a history (50 steps), with no setup from the developer.
* 🔒 **Control locking and highlighting:** any interactive control can be locked with a visible reason (`Lock`) or highlighted with a pulse (`Highlight`).

---

## 🆕 What's New in v2.12.5

A round of new API capabilities. The library code already included them, but they were missing from this README — they are now documented with their real fields (verified against the code):

- **Three new controls:** [`RangeSlider`](#14-rangeslider-range-slider) (min–max range with two handles), [`NumberStepper`](#16-numberstepper) (− / + buttons with an editable field) and [`TagInput`](#15-taginput-tag-list) (a "chips" tag list).
- **Two new layout elements:** `Seccion:Imagen` (an image with an aspect ratio) and `Seccion:Grupo` (several buttons in one row, which stack vertically on their own when there isn't enough width).
- **Table-driven building:** `Seccion:Construir(lista)` and `Ventana:ConstruirDesdeSchema(schema)` build whole controls, sections and tabs from data, without one call per control.
- **Change history (Undo / Redo):** `AlanUI:Deshacer()`, `AlanUI:Rehacer()` and query functions. It's automatic — it records any control change (50 steps max). The Preinstalled tab includes a ready-made section with the buttons.
- **`AlanUI:Confirmar(cfg)` modal:** a confirmation dialog with customizable buttons, in the same style as the "✕" one.
- **Control locking and highlighting:** every interactive control accepts `Locked`/`LockedTitle` and exposes `Lock`, `Unlock`, `IsLocked`, `SetLockedTitle` and `Highlight`.
- **Title-bar tags:** `Ventana:AgregarTag(cfg)` adds color pills (e.g. "BETA", "v1.2") next to the title, with gradient and animated rainbow support.
- **New window functions:** `Minimizar`, `Mostrar`, `EstaVisible`, `Resetear`, `AgregarDivisorSidebar` and `Tab:CrearDivisor`.
- **`AlanUI:CrearVentanaConSeguridad(config)`:** like `CrearVentana`, but asks before replacing a window that belongs to **another** script and is already open.
- **More profile control in `SaveManager`:** `Duplicar`, `Renombrar`, `Exportar` (copies the profile as text to the clipboard) and `Importar` (from text). The Preinstalled tab's "Script Profiles" section already has the buttons.
- **Extra fields on existing controls:** `Boton` (`Interact`), `Label` and `Parrafo` (`Descripcion`), `Parrafo` (image, thumbnail and its own buttons), `Dropdown` (options with description, icon, lock and separators), `CrearTab` (asset icon and icon color) and `CrearVentana` (`Orientacion`).
- **New events:** `AlanUI.Eventos.TipoCambiado` and `AlanUI.Eventos.HistorialCambiado`.
- **`Keybind` modes:** `Modo = "Press"` (default), `"Hold"` (`true` on press, `false` on release) or `"Toggle"` (alternates `true`/`false`). See [Keybind](#5-keybind).
- **`AlanUI:Dialogo` and extended `Confirmar`:** a modal that picks its icon, border and button from a `Tipo` (`info`, `question`, `success`, `warning`, `error`). `Confirmar` now accepts `Ancho`, `ColorBorde` and `Casilla`.
- **"New script detected" message redesigned:** it uses the same modal as the rest, with a yellow border and **visible** buttons and "Don't ask again" checkbox. Before, only their texts showed: they were built with `Utils.BotonBase` without a `Transparencia`, and `BotonBase` is transparent by default.
- **Remembered window position:** `GuardarPosicion` (default `true`), `PosicionInicial` and `Ventana:ResetearPosicion` / `GuardarPosicion` / `CargarPosicion`. The Preinstalled tab has a toggle and a button.
- **`Seccion:Columnas`:** splits a section into two columns that stack by themselves when they don't fit.
- **`ColorPicker` with `Estilo = "2D"`:** saturation/value square and hue bar. It's optional; the default is still the `"RGB"` style.
- **`AlanUI.Opciones`:** `ColorPickerEstiloPredeterminado`, `GuardarPosicionVentana`, `ConfirmarCierre`, `EscalaInterfazPredeterminada`, `EscalaTextoPredeterminada`, `BordeVentanaPredeterminado`, `BordeAdaptativo`, `MicroInteracciones` and `ClickDirectoEnBarras`.
- **Real initial size (bigger):** the "Interface size" and "Text size" sliders **showed** 125 % and 150 %, but the interface started at 100 % (the `Slider` doesn't run its `Callback` when created, so nothing applied those values). They are now really applied on open: the text starts bigger. Change them with `AlanUI.Opciones.EscalaInterfazPredeterminada` and `EscalaTextoPredeterminada` (in %); saved settings still win.
- **A new window no longer inherits the previous one's text size:** that factor belongs to the module and was never reset, so a script's second window could be born with the text the first one left behind.
- **Gradient and animated borders:** `CrearVentana({ Borde = ... })`, `Ventana:EstablecerBorde(...)` and `Borde` on modals. They accept the same as a tag plus the **theme colors**. See [Gradient and animated borders](#-gradient-and-animated-borders-v2125). The Preinstalled tab has its selector.
- **Active tab:** besides the bar, it gets a very soft accent tint. And a bug was fixed: when toggling the orientation, the active tab was painted with the accent color and stayed that way after switching tabs.
- **Slider with a handle:** a circle at the end of the fill shows where the value is (`Manija = false` removes it).
- **Focus ring:** text fields (`Input`, `NumberStepper`, `TagInput`, the `ColorPicker` hex, search boxes and the `Slider` value) show an accent border while you type.
- **Notifications:** the accent strip is consumed over the notification's duration.
- **Drawn header icons:** the ✕ and the "—" are no longer text/emoji (they changed with each executor's font) but drawn bars.
- **Search "No results":** if nothing matches, a message appears instead of a blank page.
- **Lighter Preinstalled tab:** FPS, frametime, memory and health are only written when the tab and the window are visible. The frame counter and the health reference (at 5 s) keep running.
- **Polish adjustments (no API changes):**
  - **Focus ring:** its connections (`Focused` / `FocusLost`) now go through `RegistrarConexion`, like the rest; the auto-cleanup disconnects them when the window is destroyed or the script is re-executed.
  - **Truncatable text:** the first size adjustment is immediate and, while the window animates, recalculations are limited to about 33 per second (with a final pass), instead of one per frame for every label.
  - **Search box:** typing leaves a single wait thread active; the previous one is cancelled before creating the next.
  - **Minimize and close buttons on touch:** `—` is separated from the ✕ according to the real width of its touch area, so they don't overlap, and the tags move along with it. Nothing changes on PC.
  - **Tooltip:** pressing and holding a row no longer opens the tooltip while a drag is active (before, it appeared when you held a slider's handle still). It was also redesigned: 224 px wide, more inner margin (12 px on the sides, 9 top and bottom), 1.15 line height, and the text no longer touches the right edge (the label inherited an 8 px offset inside a panel that already had padding).
  - **`Slider` and `RangeSlider`:** the mouse touch area is 30 px tall on the Slider and 22 on the RangeSlider (18 on touch), with 10 px extra on each side (mouse only). The `RangeSlider` had no enlarged area: it only responded inside the 10 px bar. The Slider handle is 22 px and the RangeSlider's is 20 (up from 16).
  - **Direct click on bars (mouse):** a click on a `Slider` or `RangeSlider` bar moves the handle to that point (the nearest one, on the RangeSlider) and keeps dragging. Before, you had to move the cursor a few pixels. On touch the gesture doesn't change, so it doesn't fight with scrolling. Turn it off with `AlanUI.Opciones.ClickDirectoEnBarras = false`.
  - **`NumberStepper`:** − / + buttons are 36×28 px (up from 28×22) and the symbol is 20 pt (up from 14). The right-hand area now takes 168 px.
  - **`Dropdown`:** options are 28 px tall (up from 22), 4 px apart (up from 2) and have a 12 px left margin. Each option's touch area is now +4 px so it doesn't overlap its neighbor.
  - **Notifications:** each card now lives in its own container; the `UIListLayout` ignored the card's movement, which is why it appeared abruptly. It slides in from the right and, when it leaves, the gap closes smoothly instead of making the others jump. The bounce on entry was removed.
  - **Modals:** the content stays invisible for about 60 ms while it settles and only then appears, so the text re-adjustment isn't visible.
- **New options in `AlanUI.Opciones`:** `BordeAdaptativo` (`false`), `MicroInteracciones` (`false`) and `ClickDirectoEnBarras` (`true`). See the `AlanUI.Opciones` table further down.
- **`BordeAdaptativo`:** when a theme is applied, it adjusts the transparency of the `Border` strokes according to the background's luminance: less transparent on light themes, subtler on dark ones. It doesn't touch color or thickness, it respects nearly invisible borders, and when turned off the next theme change restores them to their original value.
- **`MicroInteracciones`:** with the option on, the `Dropdown` arrow lightens and the `ColorPicker` swatch gains an accent border when the cursor is over the header. Internal: `Utils.Hover` accepts an optional sixth parameter `alCambiarHover(entrando)`.

> ℹ️ Each one has its own reference section further down, under "API Reference". For the full field list, see those sections — this list is just the summary.

## 🎬 Animation consistency review (v2.12.5)

- **Direct feedback without tween:** what responds to the finger or cursor while dragging (slider fill, window size and scale from the Preinstalled tab, and the TextBox number) no longer animates: it follows the movement instantly. Changes made by code (loading a profile, `Set()`) still animate.
- **Interface animation durations come from `AlanUI.Motion`.** `Motion.Directo = 0` applies a change without a tween. A few decorative or continuous effects are fixed on purpose (the `Highlight` pulse, the tags' rainbow spin, the lock shake) as are interaction timers (long-press, `NumberStepper` auto-repeat).
- **Curves with purpose:** `EaseEntrar` (Quart Out) for things that enter, `EaseSalir` (Quad In) for things that leave, `EasePop` for bounces. Before, `EaseSalir` was identical to `EaseEntrar`.
- **Tabs and window buttons use the same click as everything else:** they no longer use a plain `MouseButton1Click`; they get the anti-scroll threshold and the touch pop.
- **Visible entrances and exits:** `AgregarTag` pills and `TagInput` chips pop in; chips shrink out when removed; the arrow of collapsible sections and panels rotates with animation.
- **Fix:** the window shadow used the wrong property (`Transparencia` instead of `BackgroundTransparency`), so its fade-in never ran.
- **Fix:** the numeric counter of a `Slider` with decimals showed wrong values while animating (e.g. "0" instead of "0.3"). It now uses the decimals of `Incremento`.
- **Faster window:** close 0.18s, restore 0.25s, and the splash loading bar is capped at 1.0s (it could reach 2.2s with many controls).
- **Animated locking:** `Lock()` now fades in the veil and slides in the "🔒 reason" badge with a bounce; `Unlock()` fades it out. `IsLocked()` and the veil's `Visible` still change instantly. A control born with `Locked = true` appears directly, without animation.
- **Tapping a locked control:** the badge shakes (±3px, 0.25s) and flashes red, to signal it can't be used.
- **Persistent notification:** tapping it gives feedback (pop + lit border) before it closes. If tapped while still entering, it closes directly.
- **Splash:** the background panel now also fades in (before, it appeared fully opaque at once and only its texts animated).
- **Tabs and sidebar dividers:** they fade in, but **only if created once the window is already visible**. Ones created during the initial build are covered by the splash and are not animated.
- **Fix (Dropdown / ColorPicker):** the panel no longer closes when a finger starts a scroll outside it. It now closes only on a real tap (same anti-scroll threshold as `ClickConfiable`: 18px on touch, 10px with a mouse). With a mouse, it closes on release instead of on press.
- **Fix (memory):** notifications, `TagInput` chips and dialogs destroyed at runtime used to leave their entry in the internal theme and text-scale registries, never freed. Each entry is now marked when its instance is destroyed and the registries are compacted in batches.
- **Animated orientation change:** when switching between side tabs and the top bar, the bar that appears slides in with a fade (before, the change was instant).
- **Animated theme change:** colors transition smoothly instead of jumping. Only visible elements are animated; what is in hidden tabs changes directly, to avoid animating hundreds of instances nobody sees. During the initial build and when restoring the saved theme under the splash, it is applied directly.
- **Animated dividers:** `Ventana:AgregarDivisorSidebar` and `Tab:CrearDivisor` grow from zero with a fade when created with the window already visible.
- **Fix (hold-to-show tooltip):** reinforced on touch. It uses the same threshold as `ClickConfiable` (18px on touch; it was 10px, too strict for a finger), watches the touch every 50 ms instead of checking once at the end, and adds the `TouchLongPress` event as a second trigger. I couldn't reproduce it without Roblox: this is a reinforcement based on the code, not a confirmed cause.

## 🆕 What's New in v2.12.4 (patch)

A round of visual and feedback improvements, aimed at making the interface confirm more clearly when an action registered:

- **Clearer, animated collapsible sections:** the whole header now responds with a subtle hover on touch/cursor (before, only the arrow hinted it was interactive), and collapsing/expanding now animates the height instead of snapping instantly. Transitions triggered by the search bar (expand all while searching, restore on clear) stay instant on purpose — animating many sections at once while typing a search would feel slow.
- **Shinier sliders:** the fill bar's gradient (it already existed, but was very subtle) now has more intensity on `Slider` and on `ColorPicker`'s R/G/B channels.
- **Validation flash (green/red) on 3 controls:** `Slider` (value TextBox), `Input` with `Tipo = "number"` or `Tipo = "pattern"`, and `ColorPicker`'s Hex field. Before, typing an invalid value and pressing Enter reverted silently, with no sign anything happened — now a red flash confirms it was rejected, a green one confirms it was accepted.

## 🆕 What's New in v2.12.3 (patch)

- **Text no longer gets cut off as easily:** controls with single-line text in a fixed space (any control's name, `Label` values, etc.) now automatically shrink the font just enough to fit fully, before falling back to a "…" cut as a last resort. Recalculates on its own when the window is resized, the text-scale slider moves, or a control's text changes live.
- **Preinstalled tab warnings, fully readable:** the "System warnings" messages (ProtectGUI, Teclado, Gamepad) no longer cut off mid-sentence — now shown in full, wrapping to multiple lines if needed.
- **`RadioGroup` no longer "burns out" white on mobile:** holding a finger down or tapping a control repeatedly no longer stacks the hover-brightening effect up to pure white. Affects most of the library's controls, not just `RadioGroup`.
- **Sliders no longer steal scroll on mobile:** before, if a finger passed over a `Slider` (or `ColorPicker`'s channels) while trying to scroll the page, the slider would move instead of letting the page scroll. Now the gesture waits to be resolved by its dominant direction (horizontal = drag, vertical = scroll) before reacting. Behavior change: a short tap with no drag no longer jumps the slider's value to the touched point — it used to, and that was exactly what caused this bug.

## 🆕 What's New in v2.12.2 (patch)

`Seccion:Label` gets four new capabilities, aimed at cases like showing FPS, a detected key, or a script's live status:

- **`RichText` on the dynamic value:** until now `RichText` only applied to the Label's title; it can now also be passed for the value that changes via `Set()`, allowing tags like `<font color='#00FF00'>OK</font>` directly in the text.
- **`SetColor(color)`:** changes the displayed value's color on the spot (e.g. green for "OK", red for "Error"), without touching the title's color. The chosen color persists even if the user switches themes afterward — before this fix, a theme change would have silently overwritten any custom color.
- **`SetTexto(texto)`:** alias for `Set()`, for when "Set" reads ambiguous next to "SetColor".
- **Optional auto-update with `Cada` + `Actualizar`:** passing `Cada = 0.5` (seconds) and an `Actualizar` function that returns the new value makes the Label refresh itself — no need to build your own loop. Internally, **all** auto-updating Labels in a window share a single global loop (not one per Label), so creating several doesn't cost extra threads.
- **`AlanUI:ActualizarLabel(flag, texto)`:** shortcut to update a Label by its `Flag` without having to keep the reference returned by `Seccion:Label(...)`.

```lua
-- With RichText
local lbl = Seccion:Label({ Texto = "Status", Flag = "st", Valor = "–", RichText = true })
lbl:Set("<font color='#00FF00'>OK</font>")

-- With dynamic color
local lbl = Seccion:Label({ Texto = "Ping", Flag = "ping", Valor = "–" })
lbl:Set("25ms")
lbl:SetColor(Color3.fromRGB(0, 255, 0)) -- green = good

-- With auto-update (every 0.5s)
Seccion:Label({
    Texto = "FPS", Flag = "fps", Valor = "–",
    Cada = 0.5,
    Actualizar = function() return tostring(math.floor(workspace:GetRealPhysicsFPS())) end,
})

-- Global helper, no need to keep the Label's reference
AlanUI:ActualizarLabel("ping", "30ms")
```

## 🆕 What's New in v2.12.1 (patch)

A round of fragility and touch-accessibility fixes, found during a code audit + retest on a real device (Android, Delta executor):

- **Type guards on all 11 controls with a public `Set`** (`Slider, Input, Dropdown, ColorPicker, Keybind, RadioGroup, Toggle, Casilla, Progreso, Label, Parrafo`): passing the wrong type now logs a warning (`AlanUI:_RegistrarError`) and that particular `Set` call is ignored, instead of crashing the developer's script with a cryptic error like `invalid argument #1 to 'clamp'`.
- **`:Set(v)` and `.Set(v)` now behave the same (observable behavior change):** before, calling a public `Set` with a colon (`control:Set(50)`, a very common Lua syntax mistake) accidentally passed the control's own table as the value instead of the real `50` — this usually ended in a crash. Both call styles are now normalized and work identically. This is additive and shouldn't break any existing script that was already calling `.Set(v)` correctly.
- **Dynamic `ClickConfiable` threshold based on device:** 18px on touch, 10px on mouse (previously a fixed 10px for both). A normal tap on mobile drifts 15-20px between touch-down and lift-off without the user perceiving it as a scroll; with the old threshold, that normal movement got discarded as "was a scroll" and the click never registered.
- **Enlarged hitboxes on 6 controls:** `Toggle`, `Casilla`, `RadioGroup`, `Dropdown` options, `ColorPicker` swatches, and tab buttons (both sidebar and horizontal bar) now respond to touch in a larger area than their visual size, with zero change in appearance — more generous on isolated controls (`Toggle`/`Casilla`, +20px in diameter) and more conservative on controls that sit right next to a neighbor in a list (`RadioGroup`, swatches and tabs, +14px; `Dropdown`, +12px, the tightest one because its options are only 2px apart). On mobile, this feels like the controls are bigger than they actually are.
- **Visual fix in `RadioGroup` on mobile:** the chosen option could lose its blue highlight right after being tapped (a `Utils.Hover` issue restoring a stale color on release, unrelated to the stored value itself). Not noticeable on PC because the mouse doesn't fire the same event on click.
- **Adjusted Tablet vs. Mobile heuristic:** before, a phone in landscape with enough width (e.g. 714×360) could be classified as "Tablet" based on width alone. Height is now also considered: under 500px, it's classified as "Mobile" regardless of width. If your script relied on the previous classification in that viewport range, `AlanUI:ForzarTipo("Tablet")` is still available to force it manually.
- **`AlanUI:Profiler()` miscounted active Flags:** it always returned `Flags: 0`, no matter how many existed. `AlanUI.Flags` is a proxy table (the real values live elsewhere internally), and `pairs()` doesn't go through that proxy — it was iterating over a table that's always empty by design. Now it counts from the right place. Only affected that one diagnostic number, nothing functional.

## 🆕 What's New in v2.12

Collapsible sections: every section can now be collapsed/expanded with a click, so users can temporarily hide parts of the UI they aren't using without losing their place.

- **Collapsible by default:** `Tab:CrearSeccion("Name")` creates a section with a clickable header — arrow on the left (▶ collapsed / ▼ expanded) plus title. Clicking the entire header (not just the arrow) expands/collapses. The header is a full-width transparent button, easy to tap on mobile.
- **Backwards compatible:** `Tab:CrearSeccion("Name")` with no second argument still works as always, now with the collapsible behavior added. To revert to the old text-only header: `Tab:CrearSeccion("Name", { Colapsable = false })`.
- **Start collapsed:** `Tab:CrearSeccion("Name", { ColapsadaPorDefecto = true })` — useful for advanced sections not every user needs to see. Only takes effect if the section is collapsible.
- **Collapsed state does NOT persist between sessions:** it's an ephemeral visual setting, not saved in the `.json`. Every time the window opens, all sections start in their default state (expanded, or collapsed if `ColapsadaPorDefecto = true` was passed).
- **Interaction with the global search bar:** while a search is active, all sections auto-expand so the user sees the results without having to open each section by hand. When the search is cleared, each section returns to its previous state (collapsed ones stay collapsed).

```lua
-- Collapsible by default
local Section = Tab:CrearSeccion("General")

-- No collapse (old behavior)
local FixedSection = Tab:CrearSeccion("Other", { Colapsable = false })

-- Collapsible, but starts collapsed
local AdvancedSection = Tab:CrearSeccion("Advanced", { ColapsadaPorDefecto = true })
```

> 📝 **Update (v2.12.4):** in v2.12, collapsing/expanding was instant (`Visible`, no size tween). Since v2.12.4 it **does animate the height** when you click; only the transitions triggered by the search bar remain instant on purpose.

## 🆕 What's New in v2.11

New environment diagnostics system: AlanUI now knows what kind of device it's running on and clearly reports what it supports, instead of failing silently.

- **Extended `AlanUI.Capacidades`** with `Tipo` (`PC`/`Movil`/`Tablet`/`Consola`/`Studio`/`Desconocido`), `Plataforma`, `ViewportSize`, `EsStudio`, `TieneTouch`, `TieneMouse`, and derived `EsTactil`/`EsEscritorio`/`EsTouchOnly`. Recalculates live if the viewport changes (rotating a phone, resizing the Studio window).
- **`AlanUI:VerificarSoporte(nombre)`** — checks if a specific feature (`"Archivos"`, `"Drawing"`, `"SetClipboard"`, etc.) is available, with a level (`requerido`/`recomendado`/`opcional`) and a message explaining what's lost if it's not.
- **`AlanUI:ForzarTipo(tipo)` / `LiberarForzado()`** — manually fix a wrong classification (a tablet detected as mobile, for example). Persists across script re-runs within the same session.
- **`AlanUI:DiagnosticoCompleto()`** — full snapshot meant for bug reports.
- **New "🖥️ Environment Diagnostics" section** in the Preinstalled tab, between "Information" and "Appearance": shows the detected device, how many features are supported, and specific warnings only when something's missing.

```lua
if AlanUI:VerificarSoporte("Drawing").ok then
    myESP()
end

AlanUI.Eventos.TipoCambiado:Connect(function(tipo) print("Now:", tipo) end)
```

## 🆕 What's New in v2.11.2 (patch)

Small fixes and improvements to `Keybind`, `Input`, and the save system, from a code-review pass:

- **`Keybind` now actually keeps listening for the assigned key after it's assigned:** before, the `Callback` fired exactly once, at the moment the key capture closed — pressing it afterward in-game did nothing at all, and you had to wire up your own `UserInputService.InputBegan` on the side. There's now a persistent listener running for as long as the window is alive (plain keyboard, with modifiers, and gamepad).
- **The `Callback` no longer fires when assigning or reassigning the key, only when pressing it in-game:** before, the act of capturing a new key already fired the `Callback` once — for a toggle-style `Callback`, this meant assigning the key already flipped the state before the user ever pressed it. If your script relied on that fire-on-assign behavior, move that logic to your own listener on `AlanUI.Eventos.FlagCambiada` for that flag.
- **Conflict detection between `Keybind`s:** if two `Keybind`s in the same window end up sharing the same key (and the same modifiers, if using `ConModificadores`), a notification warns which ones — without blocking the assignment or changing either one automatically; the decision stays with whoever's using the script. Checked both when reassigning a key by hand and when loading a saved profile that already had the conflict (one grouped notification per combination, not one per involved Keybind).
- **`GetPlatform()` can no longer take the whole module down:** in Studio (and in executors with a restrictive sandbox), that `UserInputService` method requires a capability a `LocalScript` doesn't have — calling it unprotected meant the exception cut off AlanUI's entire load. Now wrapped in `pcall`, falling back to `nil` as a safe value (the rest of the code already knows how to handle that, falling back to the normal environment-detection heuristic).
- **Character counter on `Input`:** shows up as a warning ("180/200") once the text gets close to the `MaxCaracteres` limit (80% or more) — before, the limit was invisible and only noticeable once the text had already been cut. Can be turned off per field with `OcultarContador = true`.
- **Versioned save format:** saved `.json` files now carry an internal `__version` field, meant to let old files be migrated automatically if the format changes down the line. Doesn't affect anything you already have saved — files from before this change still load exactly the same way.

## 🆕 What's New in v2.10.2 (patch)

Code fixes and improvements found while auditing the docs:

- The window shadow now covers the **whole screen** (was an edge-hugging halo before), with a smooth 0.25s fade-in on open. (Before, its fade-in never ran because of a wrong property name; it does now.)
- `Dropdown`/`ColorPicker` headers now use the same anti-"lost tap" system as every other control.
- `AlanUI.Motion.HoverIntensidad` is now actually wired into `Utils.Hover`'s default (was declared but unused).
- `ColorPicker` swatches now update their border color on theme change.
- Row/toggle/slider hover used a fixed 0.15s duration instead of `AlanUI.Motion.Hover` (0.12s) — now consistent, and `Utils.Hover` accepts an optional fourth `duracion` parameter for cases that need to override it.
- The tab sidebar now scrolls: with 15+ tabs, it used to overflow with no way to see them all.

## 🆕 What's New in v2.10.1 (patch)

Four fixes on top of the v2.10 visual improvements, found in a follow-up review. No new functionality.

- **Window shadows stayed visible after minimizing:** minimizing the window shrinks it to (0,0) and hides it, but the 3 shadow layers behind it never hid along with it — they stayed as dark squares floating in the center of the screen, especially visible on light backgrounds. Shadows now follow the window's visibility in addition to its size and position.
- **Inconsistent hover on tabs and `RadioGroup`:** due to a parameter mix-up, tab buttons (sidebar and top bar) and `RadioGroup` buttons got a 12% hover intensity instead of the 20% used everywhere else — they felt "duller" than the rest of the controls. Fixed in all three spots.
- **The "lost first tap in scroll" fix (v2.10) only covered `Boton`:** extended to every control living inside a tab's scrollable page — `Toggle`/`Casilla`, `Dropdown` options, `RadioGroup`, `ColorPicker` swatches, and all three `Keybind` variants.
- **Small overlap between the `Slider`'s expanded hitbox and its value field:** the Slider's enlarged touch area overlapped 2px with the bottom edge of the text field above it. Adjusted so both sit exactly flush, with no overlap or gap.

---

## 🆕 What's New in v2.10

Twelve visual and touch-experience improvements, no business logic touched and nothing existing broken.

### 🎨 Visual

- **Soft shadow behind the window:** three layers of semi-transparent `Frame` behind the main window, giving it a sense of depth — it used to float "stuck" to the game with no elevation effect at all.
- **Rounder corners:** the main window's corner radius went from 10 to 14px, a more modern look.
- **More noticeable hover:** the brightening on mouse-over went from 14% to 20% — the interface feels more responsive.
- **More breathing room between sections:** vertical spacing between sections within a tab went from 8 to 14px.

### 📱 Touch / mobile experience

- **Bigger hitbox on `Slider`:** the real touch area is now 20px (up from 10px, the same height as the visual bar) — much easier to tap with a finger, without changing how the bar looks.
- **More responsive buttons inside scrollable lists:** buttons used `MouseButton1Click`, which inside a `ScrollingFrame` sometimes "ate" the first tap thinking it might be the start of a scroll. They now use a press/release pattern with a movement tolerance — just as precise, without that issue.
- **Faster opening on all devices:** the window's opening animation now lasts 0.25s (was 0.45s with a keyboard and 0.3s on mobile).
- **Higher minimum text size on mobile:** the text scale floor went from 6px to 9px on touch devices — 6px is practically unreadable on a high-res phone.

### 🧩 New controls

- **`Seccion:Divider`:** a lightweight visual separator between groups of related controls within a section — a thin line, with or without text, much lighter than using `Parrafo` for the same purpose.
- **Optional `Icono` on `Seccion:Boton`:** buttons like "💾 Save" or "🗑️ Delete" with a simple `cfg.Icono = "💾"`, no extra instance added.
- **Common color palette in `ColorPicker`:** a row of 8 swatches (red, green, blue, yellow, magenta, cyan, white, black) above the R/G/B sliders — one click for the most-used colors, instead of typing hex or dragging 3 sliders.

```lua
Seccion:Divider({ Texto = "Advanced settings" })

Seccion:Boton({
    Texto = "Save",
    Icono = "💾",
    Callback = function() end,
})
```

---

## 🆕 What's New in v2.9.1 (patch)

Six fixes on top of the v2.9 new controls, found in a follow-up review. No new functionality.

- **Crash in `Keybind` with `Defecto = Enum.KeyCode.X` + `ConModificadores = true`:** passing a plain `Enum.KeyCode` as `Defecto` together with `ConModificadores = true` made the control fail on creation (it tried to read `.KeyCode` off an `EnumItem`). `Defecto` now gets normalized automatically to the table format `ConModificadores` expects.
- **Type inconsistency in touch `Keybind` with modifiers:** on mobile without a keyboard, cycling through common keys via long-press could leave `valor` sometimes as a table, sometimes as a plain `Enum.KeyCode`, depending on timing. Type now stays consistent with `ConModificadores`.
- **Loading a `Keybind` with an invalid key returned `nil`:** if the saved `.json` had the name of a key that no longer exists, reconstruction returned `nil` instead of falling back to the safe default (`Enum.KeyCode.Unknown`).
- **`Input` with `Tipo = "pattern"` and a `Regex` that already had `^`/`$` never validated anything:** in a Lua pattern, `^` is only an anchor as the first character — passing `Regex = "^%d+$"` ended up anchoring twice (`^^%d+$$`), which never matches. Patterns with or without explicit anchors are now accepted the same way.
- **`ColorPicker.Set()` (public) wasn't firing the `Callback`:** an internal cache meant for live dragging made updating the color from code never actually run the `Callback`, unlike typing the hex by hand (which did fire it). Both paths now behave the same.
- **`Seccion:Progreso` triggered an unnecessary auto-save cycle on creation:** it wrote its initial value through the same mechanism that schedules an auto-save, same issue already fixed for `Label` in v2.8. It now writes straight to internal storage, without that side effect.

> ⚠️ **If you saved any `Keybind` with v2.8 or earlier:** due to the serialization bug fixed in v2.9, those saves ended up corrupted or empty — they don't recover on their own after updating. Reassign those Keybinds once after updating and they'll save/load correctly from then on.

> 📝 **Note on `Input` with `Tipo = "number"`:** like the rest of `Input`, validation and the `Callback` fire on focus loss (`FocusLost`), typically by pressing Enter or tapping outside the field — not on every keystroke while typing. If the user switches fields without pressing Enter, the value is still saved to the Flag, but the `Callback` only runs if `FocusLost` reports it closed via Enter.

---

## 🆕 What's New in v2.9

Five new controls, filling concrete gaps in the API without touching the behavior of anything that already existed.

### 🎨 `ColorPicker` with a Hex field
Below the three R/G/B sliders there's now a `#RRGGBB` text field (also accepts the short form `#RGB`). Typing a valid hex moves all three sliders at once; moving the sliders updates the hex automatically. An invalid hex simply reverts to the last valid color on focus loss, without flagging an error.

### 🔢 `Input` with validation (`Tipo`)
`Seccion:Input` now accepts an optional `cfg.Tipo`:
- `Tipo = "number"` — only accepts numbers; with optional `Min`/`Max`, the value gets clamped to that range. The `Callback` receives an actual number, not a string.
- `Tipo = "pattern"` — validates against a Lua pattern (`cfg.Regex`), anchored to the full string.

Without `Tipo`, behavior is exactly as before (free text).

```lua
Seccion:Input({
    Texto = "Target level",
    Flag = "targetLevel",
    Tipo = "number", Min = 1, Max = 100,
    Callback = function(n) print("Level:", n) end, -- n is a number
})
```

### 🔘 `Seccion:RadioGroup` (new control)
An alternative to `Dropdown` when there are only a few options (2-4 is the typical case): all of them stay visible in a horizontal row, no dropdown needed. Single selection.

```lua
Seccion:RadioGroup({
    Texto = "Mode",
    Flag = "mode",
    Opciones = {"Farm", "PvP", "Raid"},
    Defecto = "Farm",
    Callback = function(v) print("Mode:", v) end,
})
```

### 📊 `Seccion:Progreso` (new control)
A read-only progress bar (the user can't drag it), meant for cooldowns, auto-farm progress, data loading, etc. Updated with `Set(0-100)`.

```lua
local bar = Seccion:Progreso({ Texto = "Farm progress" })
bar.Set(45) -- 45%
```

### ⌨️ `Keybind` with modifiers (`ConModificadores`)
With `cfg.ConModificadores = true`, the Keybind also captures whether Ctrl/Shift/Alt were held down along with the key — the value goes from a plain `Enum.KeyCode` to a table `{KeyCode, Ctrl, Shift, Alt}`. Without that option, behavior is identical to before. The displayed text builds itself, e.g. "Ctrl+Shift+F".

```lua
Seccion:Keybind({
    Texto = "Attack combo",
    Flag = "attackCombo",
    ConModificadores = true,
    Callback = function(v)
        print(v.Ctrl, v.Shift, v.Alt, v.KeyCode)
    end,
})
```

### 🐛 Save fix

- **`Keybind` values weren't saving or loading correctly:** `Enum.KeyCode` (and now the modifiers table too) never had special handling on save, unlike `Color3` — `HttpService:JSONEncode` doesn't know how to serialize an `EnumItem`, so a saved Keybind ended up corrupted or empty on reload. It now gets packed into its text name and correctly rebuilt on load, same as colors already were. **Keybinds saved with v2.8 or earlier don't recover on their own after updating — they need to be reassigned once** (see the note under "What's New in v2.9.1" above).

---

## 🆕 What's New in v2.8

This round comes from several internal audits focused on performance, connection cleanup, and separating responsibilities inside the Preinstalled tab.

### 💾 Redesigned saving: two independent systems

- **Preinstalled now manages ONLY its own settings** (theme, orientation, scale, window width/height, text size) with its own Save/Load/Delete (`SM:GuardarUI`/`CargarUI`/`ListarUI`/`EliminarUI`), in a folder separate from everything else.
- **New "Script Profiles" section inside Preinstalled:** manages your own script's Flags (everything that isn't an interface setting) with a Dropdown + Save as new profile + Load + Delete. Shows up automatically in any script using AlanUI, no extra code required.
- `AlanUI:MarcarComoUI(flag)` (new): marks a Flag as interface-only so the profile system never includes or overwrites it.
- **Redesigned auto-save:** instead of writing to disk ~0.4s after each change, it now checks every 10 seconds whether anything actually changed and only then saves once — same result, far fewer disk writes over a long session.
- **Check before overwriting:** the manual "Save" button now compares against the existing file — if nothing changed, it reports "Already up to date" instead of rewriting the same content.
- Every load (profile, interface settings, or the automatic load on script start) now always shows a notification.

### 🐛 Title bar button fix

- **The "✕" button wasn't clearing internal registries:** confirming "Delete" called `sg:Destroy()` directly, without going through the same registry cleanup (`registroTema`, `indiceBusqueda`, `registroEscalaTexto`, `AlanUI.Elementos`) that `Ventana:Destruir()` does. Both paths now clean up exactly the same things.
- **Overlapping "close" and "minimize" touch areas:** each button's real touch area is bigger than its visible icon (to make them easier to tap, especially on mobile), but the spacing between the two buttons didn't account for that extra margin — a slightly imprecise tap on "minimize" could end up triggering "close" instead (which also asks you to confirm destroying the interface). The spacing between centers is now enough that the invisible touch zones don't overlap either.

### 🐛 Tooltip fix

- **Unpredictable closing when holding down on a full row:** since the "hold to show" tooltip extended to the whole row (not just the "?" icon), closing on an outside click only worked if the next tap landed outside that entire row and the panel — a large area, so most "next" taps landed inside and closed nothing. The next click or tap anywhere now closes an open tooltip (not counting the same tap that opened it).

### 🐛 Animation fix

- **Dropdown/ColorPicker sometimes not opening all the way:** the system that prevents two animations from fighting over the same property (canceling the previous one before starting the new one) used to cache by object only, without checking which property was being animated. The same `Frame` can have its color animated by the hover effect AND its size animated when opening (the Dropdown/ColorPicker case) — with the object-only cache, a simple mouse pass near a click would cancel the opening animation halfway through, leaving the panel visually closed (or "shaking" mid-way) even though internal state said it had opened. The cache now distinguishes by object **and** by the animated properties — two animations on different properties of the same object no longer cancel each other out.

### 🐛 Save fix

- **`Label.Set()` was writing to disk on every call:** a `Label` passed its value through the `AlanUI.Flags` proxy, which schedules a disk save every time something is assigned to it. `Label` is typically used for values that change constantly (FPS counter, combat HUD, distance to target) — that meant nonstop disk writes for a value that should never persist, and on top of that, reopening the script would briefly restore the last saved number before your own code updated it. `Label` now writes straight to internal storage (still readable via `ObtenerFlag`/`Get()` as always) without going through the proxy that triggers a save.
- **Colors (`ColorPicker`) getting lost on save:** `SM:Guardar` encoded `_flagsReales` as an argument to the `pcall` call itself, so if `HttpService:JSONEncode` failed, that error wasn't actually protected by the `pcall` and escaped directly. On top of that, `JSONEncode` doesn't know how to serialize a `Color3` (it's not a valid JSON type) and silently turned it into `null` — any saved `ColorPicker` was lost without warning. All the work (packing `Color3` into `{R,G,B}`, encoding, writing) now runs inside the same `pcall`.

### 🧹 Connection cleanup

- `AlanUI:DesconectarYLimpiar(conexion)` (new): disconnects a connection and removes it from the global cleanup registry in a single step — for connections that were already registered with `RegistrarConexion` but get disconnected manually before the window is destroyed (tooltips, expandable panels). Without this, the entry stayed "dead" but kept piling up in the registry.
- The camera (`Workspace.CurrentCamera`) now re-detects itself if it changes at runtime, instead of staying locked forever to whichever one was active when the window opened.

### ⚡ Performance

- The "Health" indicator on the Preinstalled tab no longer walks the entire GUI tree (`GetDescendants()`) every second just to count objects — it now keeps a live counter that goes up and down on its own as instances are created/destroyed.
- The FPS counter moved from its own loop with `task.wait()` to a standard `RunService.Heartbeat` connection, plugged into the same cleanup system as the rest of the library.
- `Dropdown.ActualizarOpciones()` (used to refresh lists, like the saved-profiles one) no longer destroys and rebuilds every button in the list — it reuses whatever still exists and only touches what actually changed.
- Dragging a `Slider` no longer goes through the generic animation machinery on every single pixel of movement — it uses a dedicated, lightweight `Tween` built specifically for high-frequency events.

### 🎨 Visual

- Sidebar/top-bar tab buttons now actually change color when the theme changes (they used to stay stuck with whatever theme was active when they were created).
- The tooltip "?" circle no longer overlaps the text on narrow rows with long right-aligned values (for example "Memory (approx...)" or "Interface size" on the Preinstalled tab).

---

## 🆕 What's New in v2.7

This round comes from an external technical audit (13 concrete proposals), evaluated one by one against the actual code before touching anything — none were applied blindly. Here's what got implemented:

* 🔀 **Conditional visibility between controls (`VisibleSi`, new):** any element can hide or show based on the value of ANOTHER flag, without you having to call `.Set()` by hand. Built for the typical case "if Auto Farm is on, show Distance/Priority/Ignore Friends". Re-evaluates automatically whenever any flag changes.
  ```lua
  SeccionCombate:Slider({
      Texto = "Distance",
      VisibleSi = function() return AlanUI.Flags.AutoFarm == true end,
  })
  ```
* 📡 **Global events (`AlanUI.Eventos`, new):** react to important changes without manually wrapping every control. `FlagCambiada` (any write to `AlanUI.Flags`), `TabCambiada`, and `TemaCambiado` already fire on their own.
  ```lua
  AlanUI.Eventos.FlagCambiada:Connect(function(flag, valor)
      print("Changed:", flag, "→", valor)
  end)
  ```
* 🔔 **Notifications with `Tipo`, `Prioridad`, and `Persistente` (new):** four semantic types (`Info` / `Success` / `Warning` / `Error`) each with their own fixed accent color, notifications that don't auto-close (`Persistente = true`, dismissed with a click), and a queue that respects priority instead of always being FIFO.
  ```lua
  AlanUI:Notificar({ Titulo = "Error", Texto = "Something failed", Tipo = "Error", Prioridad = 2 })
  ```
* 💾 **Config profiles (`SM:CambiarPerfil`, new):** switch between complete config files ("Farm", "PvP", "Raid"...) with a single call, no need to recreate the window. The named-file infrastructure already existed (`Guardar`/`Cargar` always accepted a name); this is the convenience method that also redirects native auto-save.
  ```lua
  AlanUI.SaveManager:CambiarPerfil(Ventana, "Farm")
  ```
* 🩺 **On-demand profiler (`AlanUI:Profiler()`, new):** an instant snapshot (Flags, Elements, connections, threads, drawings, GUI objects, approximate memory) without needing the Preinstalled tab open. Complements the Health panel that already ran live there.
* 🐞 **`AlanUI.DebugMode` (new):** when `true`, some `pcall`s that today fail silently on purpose (e.g. syncing the color of an already-destroyed theme element) also warn to the console — useful while you're developing your own script.

### 🔧 Internal fixes (no API changes)

- **Memory leak in `AlanUI.Elementos`:** flags from an already-destroyed window used to live forever in this global table. It now gets cleared along with the other internal registries (theme, search, text scale) when a window is created or destroyed.
- **Aliasing in Multi Dropdown:** the selection of a `Dropdown` with `Multi = true` was exposed by direct reference — mutating the table you got from `AlanUI.Flags` or `Get()` from the outside could silently corrupt the control's visual state. It now always hands out a copy (`table.clone`, with a manual fallback for older executors).
- **Toggle and Casilla now share their internal logic** (Flag, registration, assigned key, Callback firing, Set/Get) in a single place instead of being duplicated word-for-word. No visible change for library users, but a future fix in either one now automatically applies to the other.

> 💡 The audit evaluated 13 proposals in total; 5 were left out on purpose (splitting the theme registry by category, indexing the search bar by word, an external plugin system, and splitting `CrearVentana` into internal modules) because they'd add complexity without a measurable benefit at the actual scale this library is used at, or because they're better tackled after another structural change first.

---

## 🆕 What's New in v2.6

* 📏 **Bigger Slider value boxes:** the entire row height for each `Slider` grew (44px → 54px) so the value box could get a real size (110×32, up from 54×20) without cramping against the bar or the label. Affects every slider in your interface, including the Preinstalled tab.
* 🏷️ **Fixed AlanUI credit:** the window's `Titulo`/`Subtitulo` are still 100% customizable (that's **your** script's own identity), but the subtitle now always ends in "• AlanUI" — with no way to strip it out from `CrearVentana(cfg)`. The creator credit (`@alanbeikersFFXD`) stays fixed in the Preinstalled tab, as it already was.
* 👆 **Hold-to-show tooltip (new, in addition to the "?"):** holding down anywhere on a row (not just the icon) also reveals its tooltip — built especially for mobile. It automatically tells apart a genuine "hold still" from a scroll gesture (moving more than the threshold —18px on touch, 10px with a mouse— while holding cancels it). Besides watching the touch, it also reacts to the row's `TouchLongPress` event. The **next** click or tap anywhere closes an open tooltip.
* ⚠️ **Confirmation before deleting the window:** tapping "✕" now asks you to confirm ("Cancel" / "Delete") before destroying the interface — protects against losing your session from one extra tap, especially on mobile. The `Ventana:Destruir()` API (for programmatic use from your own script) stays instant on purpose, with no dialog.

### 🔧 Bug fixes (two audit rounds)

Two full external reviews of the library were checked line-by-line against the actual code before touching anything. These fixes came out of that:

- **Real leak on re-executions:** two `UserInputService` connections (`InputChanged`/`InputEnded`) lived at the module level, outside the auto-cleanup system — they piled up forever on every script re-execution. The most important fix in this round.
- The text-scale registry (`registroEscalaTexto`) also never reset between executions — same kind of leak, now fixed.
- `UIStroke` borders on the main window, the tooltip, the Casilla, the ColorPicker, notifications, section cards, and the minimize pill weren't updating on theme change — they stayed stuck on the initial theme's color. `Utils.Frame` now accepts `ClaveTemaBorde` to register this automatically.
- An open tooltip wasn't closing if the window got destroyed while it was visible (its overlay is a separate `ScreenGui` that survives on its own).
- `Input.Set(v)` (the public method) wasn't firing the `Callback`, unlike Toggle/Slider/Dropdown/Keybind/ColorPicker, which do — now consistent across every control.
- Auto-save writing to the wrong file: re-executing the script with `AutoGuardar = false` after a session with `AutoGuardar = true` could silently keep saving under the previous (already-destroyed) window's `NombreConfig`.
- Drag connections (`Utils.Arrastrable`) and keybind-capture connections (Keybind waiting for a key) are now registered with the global cleanup system, instead of relying solely on the user finishing the gesture/assignment on their own.

---

## 🆕 What's New in v2.5

* 🔎 **Smarter Dropdown search:** as you type, the first visible match is automatically highlighted, and pressing **Enter** selects it instantly — no need to click it. Works on any `Dropdown` with more than 8 options (where the search box already gets added automatically).
* 🧭 **Redesigned active-tab indicator:** the selected tab used to fill its entire background with the accent color. Now it uses a thin bar instead (side bar in vertical mode, bottom line in horizontal mode) — accent now means "this is active" instead of being one big block of color. The tab's background stays neutral at all times.
* 🎯 **More accurate tooltips:** the "?" circle now calculates its position against the real width of the text AND against where the row's right-side content actually starts (switch, badge, textbox, button), instead of a fixed margin — it adapts differently per control type automatically. It also updates live if you change the text size from the Preinstalled tab.
* 🌗 **More contrast in the Black and White themes:** section backgrounds (`Panel`) are now more clearly distinguishable from the general background (`Background`), so the window's visual hierarchy reads better at a glance.
* 🎬 **`AlanUI.Motion`:** a table of named animation durations (`Directo`, `Hover`, `Press`, `Expand`, `Page`, `Modal`, `Spin`) instead of loose numbers scattered across the code — a foundation so future library animations (and yours, if you want to reuse it) follow the same movement personality.

```lua
-- AlanUI.Motion IS public — you can use its durations in your own
-- Tweens so they feel consistent with the rest of the interface:
local info = TweenInfo.new(AlanUI.Motion.Hover, Enum.EasingStyle.Quad)
game:GetService("TweenService"):Create(myFrame, info, {BackgroundTransparency = 0}):Play()
```

---

## 🆕 What's New in v2.4

* 📊 **Real performance monitor:** the "Preinstalled" tab now shows, besides FPS, **Frame Time (ms)**, a **traffic-light status** (🟢 Excellent / 🟡 Normal / 🔴 Degraded based on FPS), and **approximate memory usage** for the client (when the executor exposes it — if not, the field is simply omitted instead of showing a fake number).
* ✨ **Hover feedback:** buttons, Toggle/Casilla/Slider rows, Dropdown, ColorPicker, and tabs now subtly brighten on mouse-over. Fully automatic — no code changes needed on your end.
* 🎨 **Subtle accent gradient:** the Slider fill, ColorPicker bars, and the initial loading bar now use a light gradient instead of a flat color, and it recalculates automatically on theme change. Also automatic, no code changes required.
* ⚠️ **Development warnings (new):** AlanUI now catches incomplete or mistyped configuration **before** creating the control, and warns in the Roblox console (F9) without ever breaking your script:
  - A `Slider` with no `Defecto` → warns and falls back to `Min`.
  - A `Slider` where `Min` is greater than or equal to `Max` → warns and auto-fixes `Max` so the bar doesn't break.
  - Any control whose `Callback` isn't actually a function (a common typo) → warns and ignores it instead of crashing.
  - A `Button` with no `Callback` → warns, since a button like that does nothing at all.

  > 💡 By design, a `Toggle` or `Casilla` **without** a `Callback` does NOT trigger a warning — that's a valid pattern in AlanUI (saving the flag and reading it later with `AlanUI:Try()`), not a mistake.

  This is separate from the error-catching system that already existed (`AlanUI:ObtenerErrores()`), which still catches errors thrown by your own `Callback` **while it runs** — now both work together: one checks the configuration before the control is created, the other protects execution afterward.

---

## 📸 Screenshots / Preview

> ✨ *Add a GIF or screenshot of your UI here — it goes a long way in getting people to try it.*

---

## 🚀 Installation & Quick Start

Load the library with `loadstring`:

```lua
local AlanUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/alanbeikers9/AlanUI/main/AlanUI.lua"))()

-- ── CREATE MAIN WINDOW ──
local Ventana = AlanUI:CrearVentana({
    Titulo        = "AlanUI Premium",
    Subtitulo     = "by AlanbeikersFF",
    TamanoX       = 560,
    TamanoY       = 340,
    TeclaToggle   = Enum.KeyCode.RightControl, -- key to open/close the UI
    Buscador      = true,                      -- enables the global search bar
    AutoGuardar   = true,                      -- enables native config saving
    NombreConfig  = "AlanUI_Settings",         -- config file name
})

-- ── CREATE NAVIGATION TABS ──
local TabPrincipal = Ventana:CrearTab("Principal", "🏠")
local TabAjustes   = Ventana:CrearTab("Settings", "⚙️")

-- ── CREATE SECTIONS ──
local SeccionCombate = TabPrincipal:CrearSeccion("Combat / Automation")
local SeccionTemas   = TabAjustes:CrearSeccion("Interface Customization")

-- ── ADD YOUR FIRST ELEMENT ──
SeccionCombate:Toggle({
    Texto = "Auto Mode",
    Flag = "autoMode",
    Defecto = false,
    Callback = function(estado)
        print("Auto Mode:", estado)
    end
})

-- ── ENABLE THE NATIVE THEME SELECTOR ──
Ventana:AgregarSelectorTemas()

-- ── NOTIFY THE USER THE SCRIPT LOADED ──
AlanUI:Notificar({
    Titulo = "AlanUI Loaded!",
    Texto = "The script ran successfully.",
    Duracion = 5
})
```

### ⚙️ `CrearVentana` parameters

All of them are optional: if you pass nothing, the window is created with these values.

| Parameter | Type | Default | What it does |
|---|---|---|---|
| `Titulo` | text | `"AlanUI"` | Window title. |
| `Subtitulo` | text | `"by AlanbeikersFF"` | Text under the title. The library automatically appends `•  AlanUI v<version>` to it. |
| `TamanoX` / `TamanoY` | number (px) | `560` / `340` | Base size of the window. |
| `TeclaToggle` | `Enum.KeyCode` | `Enum.KeyCode.RightControl` | Key that opens and closes the interface. |
| `Borde` | border format | the usual one | Window border with color, gradient and animation. See [Gradient and animated borders](#-gradient-and-animated-borders-v2125). |
| `PosicionInicial` | `UDim2` | screen center | Where the window is born. It's also where `Ventana:ResetearPosicion` returns it. |
| `GuardarPosicion` | boolean | `true` | Remembers where you left the window between runs. With `false` it always opens at `PosicionInicial`. See [Window position](#window-position-v2125). |
| `Orientacion` | text | side bar | With `"horizontal"` the tabs go in a top bar. Any other value keeps the side bar. It can be changed later with `Ventana:CambiarOrientacion`. |
| `Buscador` | boolean | `true` | Global search bar. With `false` it isn't created. |
| `PestanaPreinstalada` | `false` or table | enabled | `false` removes the system tab; a table like `{ Nombre = "⚙️ System" }` customizes it. |
| `AutoGuardar` | boolean | `true` | Saves Flags by itself, in the background. `false` turns it off. Needs the executor to support files. |
| `NombreConfig` | text | `"autosave"` | Save file name: written to `AlanUI/Config/<NombreConfig>.json`. |

> ⚠️ **Always set your own `NombreConfig`.** If two scripts that use AlanUI don't define it, both save to `AlanUI/Config/autosave.json` and overwrite each other's values.

> ℹ️ **Important note:** when you call `CrearVentana`, the interface **already comes with the "🔧 Preinstalled" tab added automatically** (FPS, executor info, theme selector, orientation, window size). You don't need to create or call it — it's already there once the window finishes opening. Only if you don't want it do you need to explicitly disable it (see below).

> Note: function and parameter names (`CrearVentana`, `Texto`, `Defecto`, etc.) stay in Spanish across languages — that's the library's actual API.

---

## 🎮 Try the interactive showcase

Would you rather see everything working before reading the reference? Run the **showcase**: an AlanUI window with **5 tabs** (Controls, Window & layout, Alerts, States, APIs & diagnostics) where every control and function appears live, with a tooltip explaining what it demonstrates.

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/alanbeikers9/AlanUI/refs/heads/main/AlanUI_Vitrina.lua"))()
```

- You don't need to load AlanUI first: the showcase loads it by itself.
- The code lives in [`AlanUI_Vitrina.lua`](AlanUI_Vitrina.lua), so it also works as a **complete, commented example** to copy from.
- On the **Alerts** tab there is a **Configurar tag** section to build a tag your way (text, icon, color, gradient, animation, clickable) and add it to the header.
- There are demos of the new controls: `Keybind` in Hold and Toggle modes and a 2D `ColorPicker` (Controls tab), `Columnas` and the window position (Window tab), `Dialogo` by type (Alerts tab) and the global options (APIs tab).
- "Simular segundo script" opens the new window with the **same size** as the first one, so it looks like the first time the interface was launched.

---

## 📚 API Reference

### Elements (go inside a Section)

> 🧠 **Before you start — 4 words you'll see in EVERY element:**
>
> - **`Flag`** — the unique "ID tag" for that control. AlanUI uses this name to save and recover its value (e.g. if the user turned a Toggle on, the Flag is what lets AlanUI remember that and restore it next time the script opens). Think of it like a label on a box: without a label you can't find it or know what's inside. If you don't set one, AlanUI auto-generates one, but then you won't be able to easily access that value from your own code — **it's always good practice to set your own**, lowercase and without spaces (e.g. `"auto_mode"`).
> - **`Defecto`** — the starting value the control shows the first time the interface opens, before the user touches it. `Defecto = false` on a Toggle means it starts off; `Defecto = 16` on a Slider means it starts at 16.
> - **`Callback`** — the function that runs automatically every time the user interacts with the control. This is where you write what should happen when the user toggles it, moves the slider, types something, etc. The value the user just picked arrives as a parameter inside that function (in the examples it's usually called `estado`, `valor`, or `v` — you choose the name).
> - **`Texto`** — simply what's displayed on screen next to the control.

> 🔀 **Also, ANY element accepts `VisibleSi` (optional, v2.7+):** a function that returns `true` or `false`. If it returns `false`, the whole row hides — built so a control can depend on another one's state (e.g. "Distance" only visible while "Auto Farm" is on). It re-evaluates automatically whenever any flag changes, no need to declare which one it depends on. See the full example under "What's New in v2.7" above.

> 💬 **And also `Tooltip` (optional, universal):** any control accepts `Tooltip = "help text"` — a "?" circle (or long-press on mobile). Not exclusive to any one control; works on Toggle, Slider, Dropdown, Boton, Input, RadioGroup, Progreso, ColorPicker and Keybind.

> 🔒 **Also `Locked` / `LockedTitle` (optional, v2.12.5+):** interactive controls (`Boton`, `Toggle`, `Casilla`, `Slider`, `RangeSlider`, `NumberStepper`, `Input`, `TagInput`, `Dropdown`, `RadioGroup`, `ColorPicker`, `Keybind`) accept `Locked = true` to be created locked, with `LockedTitle = "VIP only"` as the visible reason. See "Control locking and highlighting" below.

#### 0. CrearSección (container for controls)

`Tab:CrearSeccion(nombre, cfg)` groups related controls inside a tab. By default the section is collapsible (see What's New in v2.12).

**Optional second parameter (`cfg`):**

| Field | Effect |
|---|---|
| `Colapsable` | `false` disables the collapse: the header goes back to a plain text label, identical to the pre-v2.12 behavior. Default: `true`. |
| `ColapsadaPorDefecto` | `true` starts the section collapsed. Only takes effect if the section is collapsible. Default: `false`. |

```lua
local Section = Tab:CrearSeccion("Combat")                        -- collapsible (default)
local Fixed   = Tab:CrearSeccion("Notes", { Colapsable = false }) -- text-only header
local Advanced = Tab:CrearSeccion("Debug", { ColapsadaPorDefecto = true })
```

#### 1. Toggle
A binary switch (on/off), perfect for enabling/disabling continuous features — for example, a mode that keeps running until you turn it off.

```lua
SeccionCombate:Toggle({
    Texto = "Auto Mode",       -- What the user sees next to the switch
    Flag = "auto_mode",        -- Unique ID to save/recover this value
    Defecto = false,           -- Starts off
    Callback = function(estado)
        -- "estado" arrives as true or false, depending on whether the user turned it on or off
        print("Auto Mode:", estado)
    end
})
```

> 🆕 **Mutual exclusion with `Desactivar`:** `Toggle`/`Casilla` accept `Desactivar = {"otherFlag1", ...}` — turns off other Toggle/Casilla when this one turns on. Common pattern for "Farm/PvP/Raid"-style exclusivity. Only works between Toggle/Casilla, only fires on turn-ON, and the turned-off control's `Callback` still runs (with `false`).

> 🆕 **Keybind shortcut with `Tecla`:** `Tecla = Enum.KeyCode.X` lets the user also toggle it with a key, not just click/tap.

#### 2. Slider
Smooth numerical range adjustment with defined bounds.

```lua
SeccionCombate:Slider({
    Texto = "WalkSpeed",
    Min = 16,
    Max = 500,
    Incremento = 5,       -- Value steps by 5 (default 1)
    Sufijo = " studs/s",  -- Appended to the shown number
    Defecto = 16,
    Callback = function(valor)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = valor
    end
})
```

> 🆕 **Step marks with `Pasos = true`:** draws visual tick marks at each `Incremento` step.

> 🆕 **Handle (v2.12.5+):** the `Slider` shows a circle at the end of the fill to see where the value is. On the `Slider` it is 22 px (20 px on the `RangeSlider`). `Manija = false` removes it.

#### 3. Dropdown
A selectable list. Automatically adds a search bar if there are more than 8 options (not configurable — always that threshold).

```lua
SeccionCombate:Dropdown({
    Texto = "Movement Method",
    Opciones = {"Tween", "Set PrimaryPart CFrame", "Instant Teleport", "Safe Jump"},
    Defecto = "Tween",   -- Which option is selected when the interface opens
    Callback = function(opcionSeleccionada)
        print("Active method:", opcionSeleccionada)
    end
})
```

> ⚠️ **Note on `Defecto = "Tween"`:** "Tween" here is just one of the strings in `Opciones`, not an animation AlanUI runs — `Defecto` must always be a string that already exists in `Opciones`. Your own `Callback` is what decides what to do based on the chosen option.

> 🆕 **Multi-select with `Multi = true`:** `Defecto` becomes a table of pre-checked options instead of a string, and `Callback` receives a table (`{option = true, ...}`) instead of a string.

> 🆕 **Rich options (v2.12.5+):** each entry in `Opciones` can be, besides a string, a table `{ Titulo = "Sword", Descripcion = "High damage", Icono = "⚔️", Locked = true, LockedTitle = "Level 20" }`. An entry `{ Tipo = "Divider" }` draws a separator line between groups of options. Duplicate titles are ignored with a warning. Locked options show 🔒 and their reason, and cannot be selected.
>
> ```lua
> SeccionCombate:Dropdown({
>     Texto = "Weapon",
>     Opciones = {
>         "Fists",
>         { Tipo = "Divider" },
>         { Titulo = "Sword", Descripcion = "High damage", Icono = "⚔️" },
>         { Titulo = "Axe",   Descripcion = "Slow", Locked = true, LockedTitle = "Level 20" },
>     },
>     Defecto = "Fists",
> })
> ```

#### Dynamic Dropdown options
A `Dropdown` can change its option list **after** it was created — useful for lists that depend on the game (players, weapons, saved profiles). The returned control exposes four functions:

```lua
local dd = SeccionCombate:Dropdown({ Texto = "Target", Opciones = { "None" }, Defecto = "None" })

dd.ActualizarOpciones({ "Ana", "Beto", "Carla" })  -- replaces the WHOLE list
dd.AgregarOpcion("Dani")                            --> true  (false if empty text or already there)
dd.EliminarOpcion("Beto")                           --> true  (false if it wasn't there)
dd.LimpiarOpciones()                                -- empties the list
```

- `AgregarOpcion` and `EliminarOpcion` accept being called with `.` or `:`. **`ActualizarOpciones` and `LimpiarOpciones` are called with a dot** (`dd.ActualizarOpciones(list)`), like the rest of the library.
- `AgregarOpcion` only adds **plain texts**. For options with a description, icon or lock (see "Rich options"), use `ActualizarOpciones` with the full list.
- If the selected option is **no longer** in the new list, the selection is cleared (the `Flag` becomes `nil`) and the `Callback` is **not** run. In `Multi` mode only the options that still exist are kept.
- Buttons that still exist are reused: only the ones that changed are created or destroyed.
- If the list grows past a certain size, the search box appears by itself.

#### 4. Button (`:Boton()` in code)
Triggers a function immediately on click. Note the method itself is named `Boton` (Spanish) — like the rest of the library's method names.

```lua
SeccionCombate:Boton({
    Texto = "Run Action",
    Callback = function()
        print("Action executed.")
    end
})
```

> 🆕 **Optional icon (v2.10+):** add `Icono = "💾"` (an emoji or unicode character) to get a button like "💾 Run Action" — it's just prepended to the text, no extra instance created.

> 🆕 **Right-aligned text with `Interact` (v2.12.5+):** `Interact = "Ctrl+K"` shows a short text on the right side of the button (in the accent color). The returned control exposes `SetInteract(text)` and `GetInteract()` to change it live.

> 🆕 **Async with `Async = true`:** shows a loading spinner and blocks repeated taps while `Callback` is running — useful for slow callbacks (HTTP, big file I/O).

#### 5. Keybind
Lets the user assign (or reassign) a keyboard key to trigger an action, without you having to write any key-capture logic yourself — AlanUI already handles that internally.

```lua
SeccionCombate:Keybind({
    Texto = "Activate feature",
    Defecto = Enum.KeyCode.E,   -- Key it starts assigned to (the user can change it)
    Callback = function(tecla)
        -- Called every time the assigned key is "pressed"
        print("Key pressed.")
    end
})
```

> ⌨️ **How this actually works:**
>
> Yes — if the script is running on **PC**, AlanUI **does automatically detect** physical keyboard keys. Here's the flow:
>
> 1. The element shows the currently assigned key (e.g. "E") in a small button.
> 2. The user clicks that button. This puts the Keybind into "listening mode."
> 3. The **next key** the user presses on their keyboard is automatically captured and assigned as the new key — you don't need to write any code for this, it's already built into the library.
> 4. From then on, every time the user presses that key in-game, your `Callback` runs.
>
> **Special case — no physical keyboard available (phone with no controller connected):** AlanUI's code checks whether the device has a keyboard or gamepad available. If neither is present (touch-only mobile), the Keybind stops waiting for a key press — since one would never arrive — and the button automatically turns into a direct-action button instead: each tap on screen is equivalent to "pressing" the assigned key. This is fully automatic; you don't need to configure anything differently for mobile.

> 🆕 **Modifier combinations (v2.9+):** adding `ConModificadores = true` changes the value from a plain `Enum.KeyCode` to a table `{KeyCode, Ctrl, Shift, Alt}` — useful for shortcuts like "Ctrl+Shift+F". See the full example under "What's New in v2.9" above.

> 🆕 **The `Callback` doesn't fire on assign (v2.11.2+):** assigning or reassigning the key does **not** run the `Callback` — only pressing it afterward in-game does. If you need to react at the exact moment of assignment too, listen to `AlanUI.Eventos.FlagCambiada` for that specific flag.

> ⚠️ **Conflict detection (v2.11.2+):** if you assign a key that's already used by another `Keybind` in the same window, a notification warns you which one — the assignment isn't blocked and the other `Keybind` isn't touched automatically, both keep the same key. Also checked when loading a saved profile that already had the conflict.

> 🆕 **Key modes — `Modo` (v2.12.5+):** the `Callback` can receive the key (as always), the "held down" state, or a state that alternates.
>
> ```lua
> SeccionCombate:Keybind({ Texto = "Crouch", Flag = "crouch", Defecto = Enum.KeyCode.C, Modo = "Hold",
>     Callback = function(pressed) print(pressed and "down" or "up") end })
>
> local kb = SeccionCombate:Keybind({ Texto = "Fly mode", Flag = "fly", Defecto = Enum.KeyCode.V, Modo = "Toggle",
>     Callback = function(on) print("Fly:", on) end })
> print(kb.GetEstado(), AlanUI:ObtenerFlag("fly_estado"))
> ```
>
> | `Modo` | The `Callback` receives | Notes |
> |---|---|---|
> | `"Press"` (default) | the assigned key | As always. |
> | `"Hold"` | `true` on press and `false` on release | On a phone without a keyboard, "hold" means keeping your finger on the button (in this mode a long press no longer rotates the key). |
> | `"Toggle"` | `true` / `false`, alternating on every press | The assigned key is still the Flag's value (saved as always). The state lives in the `"<Flag>_estado"` flag, which is **not** saved in profiles. The returned control adds `GetEstado()` and `SetEstado(bool)`. |
>
> In `"Hold"` and `"Toggle"` the `Callback` talks about **state**, so assigning or restoring a key (for example when loading a profile) does **not** run it. The row title shows `[Hold]` or `[Toggle]`. An unknown mode warns in the console and uses `"Press"`.

#### 6. ColorPicker
Opens a sub-menu to pick a custom RGB color.

```lua
SeccionCombate:ColorPicker({
    Texto = "Main Color",
    Defecto = Color3.fromRGB(255, 0, 0),
    Callback = function(nuevoColor)
        print("New color selected:", nuevoColor)
    end
})
```

> 🆕 **Hex field (v2.9+):** below the R/G/B sliders there's a `#RRGGBB` field (also accepts `#RGB`) that syncs both ways with the sliders — no extra config needed, it's included by default.

> 🆕 **Common color palette (v2.10+):** above the sliders there's a row of 8 swatches (red, green, blue, yellow, magenta, cyan, white, black) — one click applies the color instantly. No extra config needed either.

> 🆕 **`Estilo = "2D"` (v2.12.5+):** besides the usual style (`"RGB"`), the `ColorPicker` can show a **saturation/value square** and a **hue bar**, keeping the Hex field and the swatches.
>
> ```lua
> SeccionCombate:ColorPicker({ Texto = "2D color", Flag = "color2d", Estilo = "2D", Defecto = Color3.fromRGB(220, 90, 90) })
> AlanUI.Opciones.ColorPickerEstiloPredeterminado = "2D" -- for ColorPickers created later without 'Estilo'
> ```
>
> It's **optional**: without `Estilo`, `AlanUI.Opciones.ColorPickerEstiloPredeterminado` is used, which defaults to `"RGB"`. The 2D panel is taller (170 px instead of 126). While you drag inside the square the page doesn't scroll, and the hue is kept when passing through grays or black.

#### 7. Checkbox
A visual alternative to Toggle: a classic checkbox to check/uncheck.

```lua
SeccionCombate:Casilla({
    Texto = "Enable Safe Feature",
    Flag = "safe_feature",
    Defecto = false,
    Callback = function(valor)
        print("Checkbox checked:", valor)
    end
})
```

#### 8. Info Paragraph
A purely visual element for notes, warnings, or credits.

```lua
SeccionCombate:Parrafo({
    Titulo = "⚠️ WARNING",
    Contenido = "Use this script at your own risk.",
    RichText = false -- supports rich text if enabled
})
```

> 🆕 **Extra `Parrafo` fields (v2.12.5+):** `ImagenUrl` (a banner above the text, with `ImagenAlto` between 40 and 300, default 110, and `ImagenEscala = "Fit"` or crop by default), `MiniaturaUrl` (a thumbnail on the right) and `Botones = { { Texto, Variante, Callback }, ... }` (a row of buttons under the text; `Variante` can be `"primary"` or `"danger"`). Images are passed as `rbxassetid://...`. The returned control exposes `Set(text)`, `Instancia` and `Botones`.

#### 9. Label (Read-only)
Shows informational text with a value on the right that you can update from code (e.g. an FPS counter or a status). Not interactive for the user — it's updated with `Set()`.

```lua
local lblEstado = SeccionCombate:Label({
    Texto = "Server Status",
    Flag = "server_status",
    Valor = "Connecting..."
})

-- Later in your script:
lblEstado.Set("Connected ✅")
print(lblEstado.Get()) --> "Connected ✅"
```

> 🆕 **`Descripcion` (v2.12.5+):** `Label` accepts `Descripcion = "long text"` — an arrow appears on the left of the row that expands/collapses that explanatory text below it. `Parrafo` also accepts `Descripcion` (secondary text inside the block).

#### 10. Input (Text field)
An editable text box.

```lua
SeccionCombate:Input({
    Texto = "Name",
    Flag = "name",
    Defecto = "",
    Placeholder = "Type here...",
    Callback = function(valor)
        print("Text entered:", valor)
    end
})
```

> 🆕 **Validation with `Tipo` (v2.9+):** `Tipo = "number"` (with optional `Min`/`Max`) or `Tipo = "pattern"` (with `Regex`) validate what the user types before accepting it. Fires on focus loss (Enter/tap outside), not per keystroke. See the full example under "What's New in v2.9" above.

> 🆕 **Character limit with `MaxCaracteres`:** defaults to 200; set `MaxCaracteres = 50` to change it.

> 🆕 **Visible counter (v2.11.2+):** a small "180/200" shows up in the field's bottom-right corner once the text reaches 80% of `MaxCaracteres` — below that threshold nothing is shown, to avoid visual noise on short fields. Fully disableable with `OcultarContador = true`.

#### 11. RadioGroup (Horizontal picker)
An alternative to Dropdown when there are only a few options (2-4 is the typical case): all of them stay visible in a row, no dropdown needed.

```lua
SeccionCombate:RadioGroup({
    Texto = "Mode",
    Flag = "mode",
    Opciones = {"Farm", "PvP", "Raid"},
    Defecto = "Farm",
    Callback = function(v) print("Mode:", v) end,
})
```

#### 12. Progreso (Progress bar)
A read-only bar (not interactive), for cooldowns, auto-farm progress, data loading, etc. Updated with `Set(0-100)`.

```lua
local bar = SeccionCombate:Progreso({ Texto = "Farm progress" })
bar.Set(45) -- 45%
```

> ℹ️ **`Progreso` (and `Label`) never persist to disk** — even with a `Flag`, by design, since restoring an in-progress value on reload doesn't make sense.

#### 13. Divider (Section separator)
A lightweight visual separator between groups of related controls within a section — a thin line, optionally with a small label. Much lighter than `Parrafo` (no background box, no padding) for this purpose.

```lua
SeccionCombate:Divider() -- plain line
SeccionCombate:Divider({ Texto = "Advanced settings" }) -- line with a label above it
```

#### 14. RangeSlider (Range slider)
Two handles on one bar, to pick a **range** (minimum and maximum) instead of a single value — e.g. "distance between 20 and 80".

```lua
SeccionCombate:RangeSlider({
    Texto = "Distance",
    Flag = "distance",
    Min = 0, Max = 100, Incremento = 5, Sufijo = " studs",
    Defecto = { min = 20, max = 80 },
    Callback = function(rango)
        print(rango.min, rango.max)
    end,
})
```

- The value (in `Callback`, `Get()` and `AlanUI.Flags`) is a table `{ min = n, max = n }`. `Set` takes that same shape.
- Without `Defecto`, it starts with the full range (`Min`–`Max`) and warns in the console. If `Defecto.min > Defecto.max`, they're swapped automatically.
- Same validations as `Slider`: `Min >= Max` adjusts `Max` to `Min + 1`; `Incremento <= 0` uses `1`; it warns if `Incremento` doesn't divide the range and the maximum can't be reached.

#### 15. TagInput (Tag list)
A list of free-form texts shown as "chips" — e.g. keywords, or player names to ignore.

```lua
SeccionCombate:TagInput({
    Texto = "Ignored players",
    Flag = "ignored",
    Placeholder = "Name and Enter...",
    MaxTags = 10,
    MaxCaracteres = 30,
    Defecto = { "Friend1", "Friend2" },
    Callback = function(lista)
        print(#lista, "tags")
    end,
})
```

- The value is an ordered **array** (`{"Friend1","Friend2"}`), not a dictionary like a `Multi` `Dropdown`.
- Tags are added by typing and pressing Enter (or tapping outside). The separator is the **comma** — pasting `a,b,c` creates three tags; a space does not separate.
- Duplicates are discarded, case-insensitively. `Backspace` on an empty box removes the last tag.
- `MaxTags` limits the count (unlimited if omitted); `MaxCaracteres` limits the text length in the box (default 200).

#### 16. NumberStepper
A numeric field with **−** and **+** buttons, for values where typing or adjusting one step at a time matters (unlike `Slider`, it isn't a bar).

```lua
SeccionCombate:NumberStepper({
    Texto = "Amount",
    Flag = "amount",
    Min = 1, Max = 99, Incremento = 1,
    Defecto = 10,
    Prefijo = "x", Sufijo = " pcs",
    Callback = function(n) print("Amount:", n) end,
})
```

- With the field focused, the keyboard ↑ / ↓ arrows raise and lower the value.
- `Decimales` (optional) forces the number of displayed decimals; if omitted it's inferred from `Incremento` (`0.25` → 2 decimals).
- `Set(v)` ignores (with a console warning) any value that isn't a `number`, and clamps/rounds to the range and to `Incremento`.

#### 17. Imagen (Image)
Shows an image inside the section. Roblox only loads its own assets: use `rbxassetid://...` — a web URL (`https://...`) doesn't work and a console warning is shown.

```lua
local img = SeccionCombate:Imagen({
    Url = "rbxassetid://1234567890",
    Aspecto = "16:9",   -- or a number (1.78); if omitted, a fixed Alto is used
    Escala = "Crop",    -- "Fit", "Crop" or "Stretch"
    Radio = 8,
})
img.Set("rbxassetid://9876543210") -- changes the image live
```

With `Aspecto` the height is computed from the width; without it `Alto` is used (between 40 and 400, default 120). By default `Escala` is `"Crop"` when there's an `Aspecto` and `"Fit"` otherwise.

#### 18. Grupo (buttons in one row)
Groups several `Boton`s side by side. If the available width is less than `AnchoMinimo` per button, they stack vertically on their own (useful on mobile).

```lua
local grupo = SeccionCombate:Grupo({ Alto = 32, AnchoMinimo = 120 })
grupo:Boton({ Texto = "Save",   Callback = function() end })
grupo:Boton({ Texto = "Load",   Callback = function() end })
grupo:Boton({ Texto = "Delete", Callback = function() end })
```

`Alto` is clamped between 26 and 60 (default 32); `AnchoMinimo` defaults to 120. Each `grupo:Boton(cfg)` accepts the same fields as `Seccion:Boton`.

#### 19. Construir (build a section from a table)
`Seccion:Construir(lista)` creates several controls at once from a list of tables. Each entry carries `Control = "ControlName"` plus that control's normal fields.

```lua
local elementos = SeccionCombate:Construir({
    { Control = "Toggle", Texto = "Auto Mode", Flag = "auto_mode", Defecto = false },
    { Control = "Slider", Texto = "Speed", Flag = "speed", Min = 0, Max = 100, Defecto = 50 },
    { Control = "Divider", Texto = "Advanced" },
    { Control = "Boton",  Texto = "Apply", Callback = function() print("ok") end },
})
elementos.speed.Set(80) -- by Flag
elementos[1].Set(true)  -- or by position
```

- Valid types: `Boton, Toggle, Casilla, Slider, RangeSlider, NumberStepper, Input, TagInput, Dropdown, RadioGroup, ColorPicker, Keybind, Label, Progreso, Parrafo, Divider, Imagen`. An unknown type is skipped with a warning.
- Returns a table indexed by **position** and, if the control has a `Flag`, also by **Flag**.
- If an entry has no `Control` but its `Tipo` field is one of the names above, `Tipo` is used as the control name.

#### 20. Columnas (two columns in a section)
`Seccion:Columnas()` returns **two sub-sections**. Each one accepts the same controls as a section (`Boton`, `Toggle`, `Slider`, `Input`, `Dropdown`, `Grupo`, `Construir`...) and puts them in its column.

```lua
local left, right = SeccionCombate:Columnas({
    Proporcion  = 0.5,   -- width of the left column (0.15 to 0.85)
    Separacion  = 12,    -- pixels between columns (0 to 40)
    MinimoAncho = 400,   -- below this base width, they stack
})

left:Toggle({ Texto = "A", Flag = "a" })
left:Slider({ Texto = "Value A", Flag = "va", Min = 0, Max = 100, Defecto = 40 })
right:Toggle({ Texto = "B", Flag = "b" })
right:Dropdown({ Texto = "Mode B", Flag = "mb", Opciones = { "One", "Two" }, Defecto = "One" })
```

- `MinimoAncho` is measured in **base** pixels, without counting the interface scale. With the default window (560 px) the columns usually stack; at 640 px or more they sit side by side (approximate: it depends on the margins).
- Controls are created in the section and moved to their column, so `Locked`, `VisibleSi`, `Tooltip` and search work the same.
- Columns can't be nested inside a column.

---

### Window Functions

#### `Ventana:Buscar(texto)`
Manually filters visible controls by the given text, same as if the user typed into the search bar. Useful for triggering a search from your own code (e.g. a "search combos" button).

```lua
Ventana:Buscar("speed")
-- Leaves visible only controls whose Texto contains "speed"

Ventana:Buscar("") -- Clears the filter and shows everything again
```

#### `Ventana:CambiarOrientacion(modo)`
Switches on the fly between side tabs (`"vertical"`) and top-bar tabs (`"horizontal"`), without recreating the window. With the window already visible, the bar that appears slides in with a fade while the content rearranges.

```lua
Ventana:CambiarOrientacion("horizontal") -- tabs on top
Ventana:CambiarOrientacion("vertical")   -- tabs on the side (default)
```

#### `Ventana:CambiarTema(nombre)`
Applies one of the native themes to the whole interface with a smooth color transition, and shows a notification confirming the change. Only visible elements are animated: what sits in hidden tabs changes directly.

```lua
Ventana:CambiarTema("Verde")
-- Switches all interface colors to the "Verde" (Green) theme and notifies the user
```

#### `Ventana:Minimizar()` / `Ventana:Mostrar()` / `Ventana:EstaVisible()`
Control the window's visibility from your code, just like the `TeclaToggle` key. `EstaVisible()` returns `true` if it's open.

```lua
Ventana:Minimizar()
if not Ventana:EstaVisible() then Ventana:Mostrar() end
```

#### Window position (v2.12.5+)
The window remembers where you left it between runs of the same script.

| Function | What it does |
|---|---|
| `Ventana:ResetearPosicion()` | Goes back to the center (or to `PosicionInicial`). |
| `Ventana:GuardarPosicion()` | Writes the current position now, without waiting. Returns `true`/`false`. |
| `Ventana:CargarPosicion()` | Moves the window to the last saved position. Returns `true`/`false`. |

- **Where it's saved:** in its own file per script, `AlanUI/Config/_ui/posicion_<NombreConfig>.json`. It doesn't use the Preinstalled tab's settings file (that one is global to all scripts and only written by its "Save" button). That's why you should set your own `NombreConfig`.
- **How:** it saves the offset from the center as a fraction of the screen, so it survives a resolution change. It writes by itself, a moment after you let go of the window.
- **Off-screen:** if the saved position leaves the window (partly) off the screen, it's corrected when it opens.
- **Reopening with the toggle key** (or the minimize button) still returns the window to its session start position, as always. The last position is applied when the script runs again.
- **Without file support** nothing is remembered. It can be turned off with `GuardarPosicion = false` or, for all windows, with `AlanUI.Opciones.GuardarPosicionVentana = false`.
- **Preinstalled** (Appearance section): the "📍 Recordar posición" toggle and the "🎯 Resetear posición" button.

#### `Ventana:Resetear()`
Returns **all** of your script's controls to their `Defecto` value (the one they had when created), running their `Callback`s. It doesn't touch the Preinstalled tab's settings or read-only controls (`Label`, `Progreso`).

#### `Ventana:AgregarTag(cfg)`
Adds a color pill in the title bar, next to the title — useful for "BETA", the version, or a status. Accepts a bare string (`Ventana:AgregarTag("BETA")`) or a table:

| Field | Effect |
|---|---|
| `Texto` | The pill's text. |
| `Icono` | Optional emoji/character prepended to the text. |
| `Color` | `"info"` (default), `"success"`, `"warning"`, `"danger"`, `"neutral"`, a `Color3`, `"rainbow"`, or a table of 2+ `Color3` (gradient). |
| `Animar` | `true` spins the gradient; with `"rainbow"` it animates by default unless `Animar = false`. |
| `Callback` | If a function is passed, the pill becomes clickable. |

Returns `{ Instancia, SetTexto(text), SetColor(color, animate), Remover() }`. If there isn't room in the bar, the oldest pills hide themselves.

```lua
local tag = Ventana:AgregarTag({ Texto = "BETA", Color = "warning" })
tag.SetColor("success")
tag.SetTexto("v1.2")
```

#### `Ventana:AgregarDivisorSidebar(cfg)` / `Tab:CrearDivisor(cfg)`
- `Ventana:AgregarDivisorSidebar({ Texto = "Group" })` inserts a line (with an optional title) **between tab buttons** in the side/top bar. It's placed in the order you call it relative to `CrearTab`.
- `Tab:CrearDivisor({ Texto = "Title" })` inserts a divider inside a tab, **at the end** of what it already has (if the page is taller than the screen, scroll to see it).

If created with the window already visible, the divider grows from zero with a fade and gently pushes its neighbors.

```lua
Ventana:AgregarDivisorSidebar({ Texto = "Advanced" })
local TabX = Ventana:CrearTab("Debug", "🐞")
TabX:CrearDivisor({ Texto = "Tools" })
```

#### `Ventana:ConstruirDesdeSchema(schema)`
Builds complete tabs, sections and controls from a single data table. It uses `Seccion:Construir` internally.

```lua
local elementos = Ventana:ConstruirDesdeSchema({
    Tabs = {
        {
            Nombre = "Main", Icono = "🏠",
            Secciones = {
                {
                    Nombre = "Combat", ColapsadaPorDefecto = false,
                    Controles = {
                        { Control = "Toggle", Texto = "Auto Mode", Flag = "auto_mode" },
                        { Control = "Slider", Texto = "Speed", Flag = "speed", Min = 0, Max = 100, Defecto = 50 },
                    },
                },
            },
        },
    },
})
elementos.speed.Set(70)
```

Returns a `Flag → control` table with every created control that has a `Flag`.

#### `Ventana:CrearTab(nombre, icono)` — icon forms
The second parameter accepts: an emoji/character (`"🏠"`), an asset as a string (`"rbxassetid://123"`), a number (treated as an asset ID), or a table `{ Icono = ..., ColorIcono = Color3 }` to tint an image icon. If a tab with that name already exists it isn't duplicated: a notification is shown and the existing one is returned.

#### The `Tab` object returned by `CrearTab`
Besides `CrearSeccion` and `CrearDivisor`, the object has these members, useful to switch tabs from code or customize one:

| Member | What it is |
|---|---|
| `Nombre` | The name the tab was created with. |
| `Seleccionar()` | Shows this tab (as if the user tapped it). Called with a **dot**: `Tab.Seleccionar()`. |
| `Pagina` | The `ScrollingFrame` holding the tab's content. |
| `Boton` / `BotonLat` | Side-bar button (`Boton` is an alias of `BotonLat`). |
| `BotonHoriz` | Top-bar button (horizontal orientation). |
| `IndicadorLat` / `IndicadorHoriz` | The color bar marking the active tab in each orientation. |
| `Secciones` | List of the sections created in this tab. |

The window keeps all its tabs, in creation order, in `Ventana.Tabs`.

```lua
local TabAjustes = Ventana:CrearTab("Settings", "⚙️")
TabAjustes.Seleccionar()                    -- opens this tab from code
print(#Ventana.Tabs, TabAjustes.Nombre)
```

#### `Ventana:GuardarConfiguracion()` / `Ventana:CargarConfiguracion()`
Manually saves or loads all current Flags to this window's config file (the one set in `NombreConfig`). You don't normally need to call these — autosave already handles it — but they're useful for a "Save now" or "Restore" button in your own script.

> ℹ️ **Not to be confused with the Preinstalled tab's own saving (v2.8+):** these two functions work on the same file used by the **script profiles** system (your own script's Flags). The Preinstalled tab's own settings (theme, window size, etc.) use a completely separate system — `SM:GuardarUI()`/`CargarUI()` — that never mixes with this one. See the "Preinstalled Tab" section further down.

```lua
SeccionAjustes:Boton({
    Texto = "💾 Save settings now",
    Callback = function()
        Ventana:GuardarConfiguracion()
    end
})

SeccionAjustes:Boton({
    Texto = "📂 Restore last configuration",
    Callback = function()
        Ventana:CargarConfiguracion()
    end
})
```

---

#### 🔑 Quick-access public API (`ObtenerFlag`, `Try`, `ObtenerElemento`)
Three ways to read a control's value from anywhere in your script, without holding onto the control's own reference — you just need the `Flag` you gave it.

```lua
-- ObtenerFlag: reads the raw value. Returns nil if the flag doesn't exist.
local speed = AlanUI:ObtenerFlag("speed")

-- Try: like ObtenerFlag, but with a fallback value if it doesn't exist
-- (saves you from having to check for nil yourself).
local speed = AlanUI:Try("speed", 16)

-- ObtenerElemento: returns the control's full {Set, Get} object, not
-- just its value -- useful if you also want to SET it from outside.
local element = AlanUI:ObtenerElemento("speed")
if element then
    print(element.Get())
    element.Set(50, true) -- the second argument fires the Callback
end
```

---

### 📦 Core Architecture Features (Under the Hood)

#### 🔄 The `AlanUI.Flags` proxy vs. `Elementos[flag].Set()`
Writing `AlanUI.Flags["x"] = v` saves the value, marks it for auto-save, and fires `FlagCambiada` — but does **not** move the control on screen or fire its `Callback`. Use `AlanUI:ObtenerElemento("x").Set(v, true)` for that (second arg fires the `Callback` too).

```lua
AlanUI.Flags["speed"] = 50                       -- saves only
AlanUI:ObtenerElemento("speed").Set(50, true)     -- moves control + fires Callback
```

#### 💾 How auto-save works
Any control change marks "unsaved changes". A background cycle checks every **10 seconds**: saves once if something changed, does nothing otherwise. Also saves as backup when the window closes. Nothing to call manually — on by default.

#### 📄 Saved `.json` format
Three types get special packing (not plain JSON):
```jsonc
{ "__color3": true, "R": 255, "G": 0, "B": 0 }                                    // Color3
{ "__enum": true, "EnumType": "KeyCode", "Name": "F" }                            // plain Enum.KeyCode
{ "__keybindMods": true, "KeyCode": "F", "Ctrl": true, "Shift": false, "Alt": false } // Keybind w/ modifiers
```
Reconstructed automatically on load.

> 🆕 **`__version` field (v2.11.2+):** every `.json` saved from this version on carries an internal `__version` field at the start of the file, reserved for the save system — don't use it as the name of your own `Flag`. It lets AlanUI automatically migrate old-format files if the schema changes down the line. Files saved with earlier versions (without this field) still load completely normally.

#### 📱 What auto-adapts on mobile
No config needed — detected via `AlanUI.Capacidades`: tooltip via long-press, `Keybind` becomes a direct-action button with no keyboard/gamepad, bigger touch areas on small buttons, taller `Slider` hitbox, text floor 6→9px, faster opening splash (0.3s), and overall scale tuned per device.

#### 🗑️ `Ventana:Destruir()` vs. the "✕" button
`Destruir()` is instant, for programmatic use. The "✕" button asks the user to confirm first. Both clean up the exact same internal registries.

#### ⚠️ Development Warnings (automatic)
AlanUI checks each control's configuration **before** creating it, and warns in the Roblox console (F9) if it spots a common mistake — never using `error()`, so your script never breaks. It always falls back to a safe value and keeps working.

Nothing to call — this just happens when you create controls normally.

```lua
-- This prints a warn() and uses Min (0) as the starting value:
SeccionCombate:Slider({
    Texto = "Volume",
    Min = 0, Max = 100,
    -- Defecto forgotten ⚠️
})

-- This prints a warn() and auto-fixes Max:
SeccionCombate:Slider({
    Texto = "Weird range",
    Min = 50, Max = 10, -- Min >= Max ⚠️
    Defecto = 20,
})
```

Currently checked cases:
- `Slider` with no `Defecto` → falls back to `Min`.
- `Slider` with `Min >= Max` → auto-fixes `Max` to `Min + 1`.
- Any control with a `Callback` present but not actually a function → ignored.
- `Button` with no `Callback` → always warned, since it does nothing at all.

> This is different from `AlanUI:ObtenerErrores()` (see below): that system catches errors thrown by your own `Callback` **at runtime**. This validator checks the **configuration** before the control even exists.

#### 🛠️ Callback Error Capture (`ObtenerErrores`)
Whenever one of your `Callback` functions throws an error while running, AlanUI catches it (the UI doesn't crash), shows an on-screen notification, and logs it to a queryable history (last 50 errors).

```lua
-- If this Callback throws, AlanUI catches it automatically:
SeccionCombate:Boton({
    Texto = "Risky action",
    Callback = function()
        error("Something went wrong here")
    end,
})

-- Check the history at any time:
local errores = AlanUI:ObtenerErrores()
for _, e in ipairs(errores) do
    print(e.Contexto, e.Mensaje)
end
```

#### 🐞 Debug Mode (`AlanUI.DebugMode`)
By default (`false`) behavior stays exactly as before. When `true`, on top of everything already logged to the console normally, certain `pcall`s that today fail silently **on purpose** (because failing there is expected and warning on every single one would be noise for the end user — e.g. syncing a theme color on an already-destroyed element) also `warn()`. Built for when you're testing your own script and want to see those "expected" failures while developing.

```lua
AlanUI.DebugMode = true
```

#### 📡 Global Events (`AlanUI.Eventos`)
React to important changes from anywhere in your script, without manually wrapping every control.

```lua
AlanUI.Eventos.FlagCambiada:Connect(function(flag, valor)
    print("Changed:", flag, "→", valor)
end)

AlanUI.Eventos.TabCambiada:Connect(function(nombreTab)
    print("Active tab:", nombreTab)
end)

AlanUI.Eventos.TemaCambiado:Connect(function(nombreTema)
    print("Theme applied:", nombreTema)
end)
```

There are also `AlanUI.Eventos.TipoCambiado` (`function(tipo)`, fired when the device is reclassified — screen rotation, `ForzarTipo`; since v2.11) and `AlanUI.Eventos.HistorialCambiado` (`function(nDeshacer, nRehacer)`; since v2.12.5). `AlanUI.Eventos.ControlRegistrado` exists but is reserved: it isn't fired for now.

`Connect` returns an object with `:Disconnect()` in case you ever want to stop listening:

```lua
local conexion = AlanUI.Eventos.FlagCambiada:Connect(function() end)
conexion.Disconnect()
```

#### 🔄 Auto-Cleanup Engine
Prevents memory leaks: re-running your script detects any active UI and cleans it up before creating a new one.

```lua
-- Register your own thread (task.spawn) so it gets cancelled
-- automatically if the script re-runs -- without this, the old loop
-- would keep running in parallel with the new one forever.
local myThread = task.spawn(function()
    while true do
        task.wait(1)
        print("My loop keeps running...")
    end
end)
AlanUI:RegistrarHilo(myThread)

-- Same applies to your own connections (RunService, UserInputService, etc.):
local myConnection = game:GetService("RunService").Heartbeat:Connect(function() end)
AlanUI:RegistrarConexion(myConnection)
```

There are 4 registration functions total, one per resource type — use whichever fits:

| Function | For |
|---|---|
| `AlanUI:RegistrarConexion(connection)` | Event connections (`:Connect(...)`) |
| `AlanUI:RegistrarHilo(thread)` | Your own threads (`task.spawn`, `task.delay`) |
| `AlanUI:RegistrarDibujo(drawingObject)` | `Drawing.new(...)` objects (lines, boxes, ESP text, etc.) |
| `AlanUI:RegistrarInstancia(instance)` | Any loose `Instance` you create yourself (BillboardGui, Highlight, etc.) that isn't already parented under the window |

All 4 functions return the same resource they receive, so you can also register inline:

```lua
local drawing = AlanUI:RegistrarDibujo(Drawing.new("Line"))
```

#### 🔔 Notifications (Notificar)
Shows a floating panel on screen for important alerts (e.g. when the script finishes loading).

```lua
AlanUI:Notificar({
    Titulo = "AlanUI Loaded!",
    Texto = "The script ran successfully.",
    Duracion = 5 -- seconds on screen
})
```

**Optional parameters (v2.7+):**

| Parameter | What it does |
|---|---|
| `Tipo` | `"Info"` (default), `"Success"`, `"Warning"`, or `"Error"` — each with its own fixed accent color (`Info` follows the active theme). |
| `Persistente` | `true` so it does NOT auto-close on a timer — dismissed with a click/tap anywhere on the card. |
| `Prioridad` | Number (default `0`). If 4 notifications are already on screen, one with a higher `Prioridad` jumps ahead of ones waiting with lower priority, instead of always going to the back of the queue. |

```lua
AlanUI:Notificar({
    Titulo = "Critical error",
    Texto = "Couldn't load the configuration",
    Tipo = "Error",
    Prioridad = 2,
    Persistente = true, -- the user closes it by tapping it
})
```

#### 🎨 Theme Selector (AgregarSelectorTemas)
Adds a button to the sidebar (or to the top bar, if you're in horizontal mode) letting the user cycle between available themes (Dark, Light, Green, Purple, Red) with a click. Takes no parameters — it can't be placed inside a section, it always goes in the navigation bar.

```lua
Ventana:AgregarSelectorTemas()
```

#### 🔧 Preinstalled Tab (`AgregarPestanaPreinstalada`)
**Added automatically inside `CrearVentana` — you don't call this yourself.** It includes:

- Executor info and AlanUI version
- **Environment diagnostics (v2.11+):** detected device, supported features, and specific warnings only when something is missing
- **Performance monitor:** FPS, Frame Time (ms), traffic-light status (🟢/🟡/🔴), approximate memory (if the executor exposes it), and a "Health" indicator (object/connection growth since the window opened)
- Theme selector
- Tab orientation (vertical/horizontal)
- Window size sliders (overall scale, width, height, text size)
- **"Configuration" section (v2.8+):** Save / Load / Delete — but ONLY for this tab's own settings (theme, size, orientation). Doesn't touch your script's Flags.
- **"Script Profiles" section (v2.8+):** a Dropdown of saved profiles + Save as new profile + Load + Delete — for YOUR script's Flags (everything that isn't an interface setting). Completely separate from the section above. Since v2.12.5 it also includes **Duplicate, Rename, Export and Import**.
- **"Change history" section (v2.12.5+):** ↩️ Undo / ↪️ Redo buttons with a counter of available steps.
- **Window position (v2.12.5+):** the Appearance section has a "📍 Recordar posición" toggle (saved with the Preinstalled tab's "Save" button, like the rest of the interface settings) and a "🎯 Resetear posición" button.
- **Window border (v2.12.5+):** Appearance has a style selector (Normal, Tema, Acento, Arcoíris, Personalizado), a toggle to animate it, the thickness and two colors for the Personalizado style.
- **"Keyboard shortcuts" section:** a reminder of the interface's keys.

If for some reason you don't want it (e.g. your script already has its own settings tab and you don't want duplication), disable it like this:

```lua
local Ventana = AlanUI:CrearVentana({
    Titulo = "My Script",
    PestanaPreinstalada = false, -- disables the automatic tab
})
```

You can also customize its name without disabling it, by passing a table instead of `false`:

```lua
local Ventana = AlanUI:CrearVentana({
    Titulo = "My Script",
    PestanaPreinstalada = { Nombre = "⚙️ System" }, -- renames the tab
})
```

#### 🏷️ `AlanUI:MarcarComoUI(flag)` (new in v2.8)
Marks one or more Flags as interface-only — the script profile system (`SM:Guardar`/`Cargar`/`Listar`/`Eliminar`) will never include or overwrite them. This is what the Preinstalled tab uses internally to keep its own settings separate from your script's; you rarely need to call it yourself unless you're adding your own "interface" controls (e.g. a text field for naming profiles) that also shouldn't be saved inside every profile.

```lua
SeccionTuya:Dropdown({
    Texto = "Internal picker (not game config)",
    Flag = "mi_selector_ui",
    Opciones = {"A", "B", "C"},
})
AlanUI:MarcarComoUI("mi_selector_ui")
```

#### 💾 `SM:GuardarUI(nombre)` / `CargarUI(nombre)` / `ListarUI()` / `EliminarUI(nombre)` (new in v2.8)
The same four operations you already know from the profile system (`Guardar`/`Cargar`/`Listar`/`Eliminar`), but operating exclusively on Flags marked with `MarcarComoUI` — in a separate folder that never mixes with script profiles. This is the system the Preinstalled tab's "Configuration" section uses internally.

```lua
AlanUI.SaveManager:GuardarUI("my_interface_settings")
AlanUI.SaveManager:CargarUI("my_interface_settings")
```

#### 🔎 `AlanUI.Capacidades` — what the current executor supports
```lua
AlanUI.Capacidades.Archivos   -- writefile/readfile support
AlanUI.Capacidades.Drawing    -- Drawing.new() support
AlanUI.Capacidades.ProtectGUI -- GUI protection support
AlanUI.Capacidades.GetHUI     -- gethui() support
AlanUI.Capacidades.Teclado    -- physical/bluetooth keyboard present
AlanUI.Capacidades.Gamepad    -- gamepad connected
```
`Teclado`/`Gamepad` are what the library itself uses to decide whether `Keybind` can wait for a real key or should become a direct-action button — also available for your own script's logic.

#### 🔑 Quick Flags API (`ObtenerFlag`, `Try`, `ObtenerElemento`)
```lua
AlanUI:ObtenerFlag("speed")        -- current value, or nil
AlanUI:Try("speed", 16)            -- same, falls back to 16 if nil
AlanUI:ObtenerElemento("speed")    -- full control: { Set(v), Get() }
```
`Try` is handy for controls with no `Callback` (a valid pattern: just save the flag, read it when needed).

#### 🔌 `AlanUI:DesconectarYLimpiar(conexion)`
Disconnects a Roblox connection and removes it from the internal cleanup registry in one step. Only needed if your own script manually registers connections via `AlanUI:RegistrarConexion()` and needs to disconnect one early.

```lua
local conexion = AlanUI:RegistrarConexion(workspace.ChildAdded:Connect(function() end))
-- ... later, if it's no longer needed:
AlanUI:DesconectarYLimpiar(conexion)
```

#### 🩺 On-Demand Profiler (`AlanUI:Profiler()`)
Returns an instant snapshot of the library's internal state — Flags, Elements, connections, threads, drawings, GUI objects, and approximate memory — and also prints it to the console in a single line. Complements the Health panel in the Preinstalled tab: that one runs live while the tab is open, this one you can request at any time from your own code.

```lua
local datos = AlanUI:Profiler()
print(datos.Conexiones, datos.ObjetosGui)
```

#### 💾 SaveManager — `SM:Listar()`
Returns the list of saved configuration names (`.json` files inside AlanUI's folder). Useful if you want, for example, a Dropdown so the user can pick between several saved profiles.

> ⚠️ Depends on `AlanUI.Capacidades.Archivos`. On an executor without file support, it returns an empty table (`{}`) instead of erroring.

```lua
local perfiles = AlanUI.SaveManager:Listar()
-- perfiles --> { "AlanUI_Settings", "combat_profile", "farming_profile" }

SeccionAjustes:Dropdown({
    Texto = "Load profile",
    Opciones = perfiles,
    Callback = function(nombre)
        AlanUI.SaveManager:Cargar(nombre)
    end
})
```

#### 💾 SaveManager — `SM:CambiarPerfil(ventana, nombre)`
Switches a window's active "profile" in a single call: saves the current profile, points native auto-save plus `GuardarConfiguracion`/`CargarConfiguracion` at the new name, and loads that file if it already exists. Useful for several complete sets of settings ("Farm", "PvP", "Raid") the user switches between with a button or Dropdown.

> This is a convenience function — the named-file infrastructure already existed before (`SM:Guardar("Farm")` / `SM:Cargar("PvP")` always worked). What's new is that it also redirects auto-save and the window's own functions to the active name.

```lua
SeccionPerfiles:Dropdown({
    Texto = "Active profile",
    Opciones = {"Farm", "PvP", "Raid"},
    Callback = function(nombre)
        AlanUI.SaveManager:CambiarPerfil(Ventana, nombre)
    end
})
```

#### 🎨 ThemeManager — `TM:AgregarTema(nombre, tabla)`
Registers your own custom theme (custom colors) so it shows up alongside the native themes in the theme selector.

A full theme has **14 keys**. Here are the real ones (note: the main background color key is `Background`, not `Fondo`):

```lua
AlanUI.ThemeManager:AgregarTema("MyBlueTheme", {
    Background = Color3.fromRGB(45, 60, 90), BackgroundDark = Color3.fromRGB(30, 42, 68), BackgroundLight = Color3.fromRGB(60, 78, 112),
    Accent = Color3.fromRGB(60, 120, 255), AccentLight = Color3.fromRGB(110, 160, 255), Highlight = Color3.fromRGB(160, 195, 255),
    Text = Color3.fromRGB(230, 230, 240), TextDark = Color3.fromRGB(200, 200, 215),
    Border = Color3.fromRGB(15, 20, 35), Panel = Color3.fromRGB(25, 30, 50), PanelClaro = Color3.fromRGB(35, 42, 68),
    Fila = Color3.fromRGB(30, 36, 58), Entrada = Color3.fromRGB(20, 25, 42), Apagado = Color3.fromRGB(60, 60, 60),
})

-- You can now apply it like any other:
Ventana:CambiarTema("MyBlueTheme")
```

> ⚠️ **A partial theme (fewer than 14 keys) does NOT reset the missing ones.** Only the keys you pass get overwritten — the rest keep whatever the previous theme had, not any default. Missing keys can look like a mismatched mix of two themes.

#### 🎨 `TM:GuardarTemaActual()`
Saves the currently active theme's colors to disk (`tema.json`, in the profiles folder). One-liner, useful for persisting a dynamically applied theme outside the normal `AgregarTema` flow.

```lua
AlanUI.ThemeManager:GuardarTemaActual()
```


#### 🔒 Control locking and highlighting (v2.12.5+)
Any interactive control (see the list in the `Locked` note above) can be locked: it's covered with a semi-transparent layer and a "🔒 reason" badge, and stops responding.

```lua
-- Born locked:
local t = SeccionCombate:Toggle({ Texto = "VIP Mode", Flag = "vip", Locked = true, LockedTitle = "VIP only" })

-- Or at any time:
t.Lock("Requires level 20")   -- locks (the reason is optional)
t.SetLockedTitle("Level 30")  -- changes the reason live
print(t.IsLocked())           --> true
t.Unlock()                    -- unlocks

-- Highlights the control with a border pulse to draw attention:
t.Highlight(3)                -- 3 seconds (allowed range: 0.5 to 10)
t.Highlight({ Duracion = 2 })
```

The returned control also exposes `Fila` (the row's `Frame`, for your own tweaks). The methods accept being called with `.` or with `:`.

#### ↩️ Change history: Undo / Redo (v2.12.5+)
Every change to one of your script's controls (moving a slider, tapping a toggle, picking an option) is recorded automatically in a history of up to **50 steps**. No setup needed.

```lua
AlanUI:Deshacer()            -- true (and the entry) if it undid something; false if there was nothing
AlanUI:Rehacer()
AlanUI:PuedeDeshacer()       -- boolean
AlanUI:PuedeRehacer()        -- boolean
AlanUI:ObtenerHistorial()    -- { Deshacer = n, Rehacer = n }
AlanUI:LimpiarHistorial()    -- empties both stacks

local ok, entrada = AlanUI:Deshacer()
if ok then print(AlanUI:DescribirCambio(entrada)) end --> "speed: 80 -> 50"

AlanUI.Eventos.HistorialCambiado:Connect(function(nDeshacer, nRehacer) end)
```

- Continuously moving the same slider (less than 0.6 s between changes) is merged into **a single step**; several flags changing at once (e.g. loading a profile) are also grouped.
- Making a new change after undoing discards the "redo" stack.
- Left out of the history: interface flags (`MarcarComoUI`) and read-only controls (`Label`, `Progreso`).
- Undo/Redo re-apply the value **running the control's `Callback`**, as if the user had moved it.
- Loading a profile or the interface settings (`SM:CargarSilencioso`, `SM:CargarUI`) **clears** the history, so steps from one profile don't mix with another's.

#### ❓ Confirmation modal (`AlanUI:Confirmar`) (v2.12.5+)
Shows a modal dialog over the window, in the same style as the "✕" one. Requires an active AlanUI window (otherwise it warns in the console and returns `nil`).

```lua
AlanUI:Confirmar({
    Icono = "⚠️",
    Titulo = "Reset everything?",
    Contenido = "Current values will be lost.",
    BotonCancelar = { Texto = "Cancel" },
    BotonAceptar  = { Texto = "Reset", Variante = "danger", Callback = function() Ventana:Resetear() end },
})
```

- **Simple form:** `BotonAceptar` (default "Aceptar", `primary` variant) and `BotonCancelar` (only appears if you pass it).
- **Free form:** `Botones = { { Texto, Variante, Callback }, ... }` for as many buttons as you like (more than 3 stack vertically).
- `Variante`: `"primary"` (accent), `"danger"` (red), `"tertiary"` (border only) or `"neutral"` (default).
- `Ancho` (240 to 480, default 300) and `ColorBorde` (a `Color3`: the border becomes 2 px with that color and stops following the theme).
- `Casilla = { Texto = "Don't ask again", Defecto = false }` adds a checkbox. Its state reaches the buttons' `Callback`s: `Callback = function(marcada) ... end`.
- Any button closes the modal before running its `Callback`. Returns `{ Cerrar(), Presionar(i), Fondo, ObtenerCasilla() }`.

#### 💬 `AlanUI:Dialogo(cfg)` (v2.12.5+)
A modal that picks its icon, border color and accept button from its `Tipo`. It isn't another implementation: it uses `AlanUI:Confirmar`.

```lua
AlanUI:Dialogo({
    Tipo = "warning",
    Titulo = "Delete profile?",
    Contenido = "This can't be undone.",
    Botones = {
        { Texto = "Cancel", Variante = "neutral", Callback = function() end },
        { Texto = "Delete", Variante = "danger",  Callback = function() end },
    },
})
```

| `Tipo` | Icon | Border | Default buttons |
|---|---|---|---|
| `"info"` (default) | ℹ️ | the theme's | Entendido |
| `"question"` | ❓ | the theme's | Sí + Cancelar |
| `"success"` | ✅ | green | Genial |
| `"warning"` | ⚠️ | yellow | Aceptar + Cancelar |
| `"error"` | ❌ | red | Cerrar (red) |

It accepts the same fields as `Confirmar` (`Titulo`, `Contenido`, `Icono`, `Ancho`, `ColorBorde`, `Casilla`, `Botones`, `BotonAceptar`, `BotonCancelar`); whatever you pass overrides the preset. `MostrarCancelar = false` removes the "Cancelar" from `question` and `warning`. An unknown `Tipo` warns in the console and uses `"info"`.

#### 🛡️ `AlanUI:CrearVentanaConSeguridad(config)` (v2.12.5+)
`CrearVentana` always cleans up everything from the previous run without asking — ideal when the **same** script is re-executed. But if you load two **different** scripts that use AlanUI in the same executor, the second would silently overwrite the first. `CrearVentanaConSeguridad` takes the same table as `CrearVentana` and, if it detects another live window, **asks** before replacing it.

```lua
local Ventana = AlanUI:CrearVentanaConSeguridad({ Titulo = "My Script", NombreConfig = "myscript" })
if not Ventana then return end -- the user chose not to replace
```

Returns the created window, or `nil` if the user chose not to replace. The "always replace" preference is remembered per script (by its `Titulo`), inside its own `NombreConfig`.

The detection modal ("Nuevo script detectado") is an `AlanUI:Dialogo` of type `warning`: yellow border, **No** / **Sí, reemplazar** buttons and the "Don't ask again for this script" checkbox. It only appears with `CrearVentanaConSeguridad`: `CrearVentana` always replaces without asking, so re-running the **same** script shows no message. If the modal is closed some other way (for example, the window is destroyed), it counts as "No".

#### 🌈 Gradient and animated borders (v2.12.5+)
The window (and modals) can carry a solid, gradient or animated border. It accepts the same as a tag plus **the interface colors**, which follow the theme when you change it.

```lua
Ventana:EstablecerBorde("tema")                       -- gradient with the theme colors
Ventana:EstablecerBorde({ Color = "tema", Animar = true, Grosor = 3 })
Ventana:EstablecerBorde({ Color = { "Accent", Color3.fromRGB(255, 90, 140), "AccentLight" }, Animar = true })
Ventana:EstablecerBorde(nil)                          -- back to the usual border

AlanUI:CrearVentana({ Titulo = "My Script", Borde = "rainbow" })   -- or when creating it
AlanUI:Dialogo({ Tipo = "info", Titulo = "Hi", Borde = { Color = { "Accent", "AccentLight" }, Animar = true } })
```

| Value | Result |
|---|---|
| `nil` / `false` / `"ninguno"` | The usual border. |
| `"tema"` | `Accent` → `AccentLight` gradient. Follows the theme. |
| `"acento"` | Solid `Accent` color. Follows the theme. |
| `"borde"` | The theme's border color. |
| `"rainbow"` | Rainbow. Animates by itself (unless `Animar = false`). |
| `"info"`, `"success"`, `"warning"`, `"danger"`, `"neutral"` | The tag colors. |
| `Color3` | Solid color. |
| `{ c1, c2, ... }` | Gradient of 2 or more. Each `c` is a `Color3`, a theme key (`"Accent"`, `"AccentLight"`, `"Highlight"`...) or a tag color. Theme keys follow the theme. |
| `{ Color = ..., Grosor = 2, Animar = true, Velocidad = 4, Transparencia = 0 }` | Configuration table: `Color` is any of the forms above. |

- `Animar = true` spins the gradient (`Velocidad` = seconds per turn, default 4). The gradient closes on itself when animated, so the turn has no seam. Each animated border uses a single looping tween, cancelled when the window is destroyed.
- `Grosor` goes from 1 to 8 px (default 2).
- It reuses the border the frame already has (two borders can't be stacked) and leaves it as it was when removed.
- **Preinstalled** (Appearance): "🌈 Borde de la ventana" selector (Normal, Tema, Acento, Arcoíris, Personalizado), "✨ Animar el borde", "Grosor del borde" and two colors for the Personalizado style. They're saved with the Preinstalled tab's "Save" button.
- An unrecognized color value warns in the console and keeps the normal border.

#### ⚙️ `AlanUI.Opciones` (v2.12.5+)
Global switches: they change the behavior of the whole library without passing the same thing control by control. All of them keep the usual behavior by default, except `ClickDirectoEnBarras`, which starts as `true`.

| Option | Default | What it does |
|---|---|---|
| `ColorPickerEstiloPredeterminado` | `"RGB"` | Style of `ColorPicker`s without their own `Estilo`: `"RGB"` or `"2D"`. Affects the ones created afterwards. |
| `GuardarPosicionVentana` | `true` | Remember the window position between runs. It can be overridden per window with `GuardarPosicion`. |
| `ConfirmarCierre` | `true` | Show the "Delete interface?" modal when pressing the ✕. With `false`, the ✕ destroys the window directly. |
| `EscalaInterfazPredeterminada` | `125` | Initial interface size, in % (70 to 130). It's what is applied on open when there are no saved settings. |
| `EscalaTextoPredeterminada` | `150` | Initial text size, in % (80 to 150). |
| `BordeVentanaPredeterminado` | `nil` | Border of the windows that don't pass their own `Borde` (same format as `CrearVentana({ Borde = ... })`). |
| `BordeAdaptativo` | `false` | When a theme is applied, adjusts border transparency according to the background luminance (stronger on light themes, subtler on dark ones). Takes effect on the next theme change. |
| `MicroInteracciones` | `false` | The `Dropdown` arrow and the `ColorPicker` swatch react to the hover of their header. |
| `ClickDirectoEnBarras` | `true` | With a mouse, a click on a `Slider` / `RangeSlider` bar moves the handle there instantly. With `false` you have to move the cursor a few pixels. Touch is unchanged. |

```lua
AlanUI.Opciones.ConfirmarCierre = false
AlanUI.Opciones.ColorPickerEstiloPredeterminado = "2D"
```

#### 💾 SaveManager — `SM:Duplicar` / `SM:Renombrar` / `SM:Exportar` / `SM:Importar` (v2.12.5+)
Operations on saved script profiles. They all return `true`/`false` (or text) plus a reason message if something fails, and require `AlanUI.Capacidades.Archivos`.

```lua
local SM = AlanUI.SaveManager
SM:Duplicar("Farm", "Farm_copy")         --> true  | false, "Ya existe un perfil con ese nombre"
SM:Renombrar("Farm_copy", "Farm_v2")     --> true
local texto, copiado = SM:Exportar("Farm_v2") -- the profile text; 'copiado' = true if it could be sent to the clipboard
SM:Importar("Farm_imported", texto)      --> true | false, reason   (3rd parameter: true to overwrite)
```

- Profile names are valid if they're 1 to 60 characters long and don't include `/ \ : * ? " < > |` or control characters.
- `Importar` checks that the text is valid JSON and at most 200000 characters; it doesn't overwrite an existing profile unless you pass `true`.
- The Preinstalled tab's "Script Profiles" section already includes Duplicate, Rename, Export and Import buttons.

#### 🧹 Full Teardown (Destruir)
Closes the UI and disconnects every background connection to fully free up memory. It also clears the library's internal registries (theme, search index, text scale), leaving everything ready in case your script creates another window afterward. It's instant — it shows no confirmation dialog (that confirmation only appears when the end user taps the window's "✕", not when your own code calls this function).

```lua
Ventana:Destruir()
```

---

## 📄 License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.
