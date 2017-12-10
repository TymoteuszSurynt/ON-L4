#Author: Tymoteusz Surynt
using ObliczeniaNaukowe4
#Funkcja wyświetlająca wykresy
function mainPlota5()
    rysujNnfx(x->exp(x),0.0,1.0,5)
end
mainPlota5()
#Funkcja wyświetlająca wykresy
function mainPlota10()
    rysujNnfx(x->exp(x),0.0,1.0,10)
end
mainPlota10()
#Funkcja wyświetlająca wykresy
function mainPlota15()
    rysujNnfx(x->exp(x),0.0,1.0,15)
end
mainPlota15()
#Funkcja wyświetlająca wykresy
function mainPlotb5()
    rysujNnfx(x->x^2*sin(x),-1.0,1.0,5)
end
mainPlotb5()
#Funkcja wyświetlająca wykresy
function mainPlotb10()
    rysujNnfx(x->x^2*sin(x),-1.0,1.0,10)
end
mainPlotb10()
#Funkcja wyświetlająca wykresy
function mainPlotb15()
    rysujNnfx(x->x^2*sin(x),-1.0,1.0,15)
end
mainPlotb15()
