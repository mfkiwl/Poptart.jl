using Jive
@useinside module test_poptart_desktop_application

using Test
using Poptart.Desktop # Application Windows put!
using Poptart.Controls # Mouse Button Slider didClick

window = haskey(ENV, "TRAVIS") ? Windows.TextWindow() : Windows.Window()
app = Application(window=window)

button = Button(title="Hello", frame=(x=1, y=2, width=80, height=30))
slider = Slider(range=1:10, value=2, frame=(x=1, y=100, width=20, height=20))

observered = []

didClick(button) do event
    push!(observered, (didClick, event))
    @info :didClick event
end

put!(app.window, button)
put!(app.window, slider)

@test app.window isa Windows.UIWindow

Mouse.click(button)
Mouse.double_click(button)

@test observered == [(didClick, (action=Mouse.click,))]

end # module test_poptart_desktop_application
