using ObliczeniaNaukowe4
function mainPlota5()
    rysujNnfx(x->abs(x),-1.0,1.0,5)
end
mainPlota5()
function mainPlota10()
    rysujNnfx(x->abs(x),-1.0,1.0,10)
end
mainPlota10()
function mainPlota15()
    rysujNnfx(x->abs(x),-1.0,1.0,15)
end
mainPlota15()
function mainPlotb5()
    rysujNnfx(x->1/(1+x^2),-5.0,5.0,5)
end
mainPlotb5()
function mainPlotb10()
    rysujNnfx(x->1/(1+x^2),-5.0,5.0,10)
end
mainPlotb10()
function mainPlotb15()
    rysujNnfx(x->1/(1+x^2),-5.0,5.0,15)
end
mainPlotb15()
