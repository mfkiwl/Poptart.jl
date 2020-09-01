module test_poptart_desktop_controls

using Test
using Poptart.Desktop # Application Window
using Colors: RGBA

window1 = Window(title="A", frame=(x=10,y=20,width=200,height=200))
app = Application(windows=[window1], title="App", frame=(width=630, height=400))
@test app isa Application

button = Button(title="Hello")
push!(window1.items, button)
observered = []
didClick(button) do event
    push!(observered, (didClick, button, event))
end
Mouse.leftClick(button)
@test observered == [(didClick, button, (action=Mouse.leftClick,))]

label1 = Label(text="Range:")
slider1 = Slider(label="Int", range=1:10, value=5)
slider2 = Slider(label="Float", range=1:10, value=2.0)
push!(window1.items, label1, slider1, slider2)

check1 = Checkbox(label="check1", value=true)
check2 = Checkbox(label="check2", value=false)
push!(window1.items, check1, check2)

popup1 = Popup(label="popup1", items = [Label("A popup")])
push!(window1.items, popup1)

pause(app)

end # module test_poptart_desktop_controls
