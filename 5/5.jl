using ObliczeniaNaukowe4
function mainPlota5()
    rysujNnfx(x->exp(x),0.0,1.0,5)
end
mainPlota5()
function mainPlota10()
    rysujNnfx(x->exp(x),0.0,1.0,10)
end
mainPlota10()
function mainPlota15()
    rysujNnfx(x->exp(x),0.0,1.0,15)
end
mainPlota15()

function mainPlotb5()
    rysujNnfx(x->x^2*sin(x),-1.0,1.0,5)
end
mainPlotb5()
function mainPlotb10()
    rysujNnfx(x->x^2*sin(x),-1.0,1.0,10)
end
mainPlotb10()
function mainPlotb15()
    rysujNnfx(x->x^2*sin(x),-1.0,1.0,15)
end
mainPlotb15()
