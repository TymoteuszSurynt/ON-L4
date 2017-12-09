#Author: Tymoteusz Surynt
module ObliczeniaNaukowe4
    using Plots
    plotly()
    export GlobalPrec, ilorazyRoznicowe, warNewton, naturalna, rysujNnfx, test
    GlobalPrec=100
    #Metoda licząca ilorazy różnicowe.
    #x: Vector{Float64} - tablica zawierająca wartości węzłów x_0, x_1, x_2, ...
    #f: Vector{Float64} - tablica zawierająca wartości funkcji f(x_0), f(x_1),...
    function ilorazyRoznicowe(x::Vector{Float64}, f::Vector{Float64})
        size=length(x)
        output=Array(Float64,size)
        for i in 1:size
            output[i]=f[i]
        end

        for i in 1:size
            j=size
            while j>i
                output[j]=(output[j]-output[j-1])/(x[j]-x[j-i])
                j=j-1
            end
        end
        return output
    end

    #Metoda licząca wartość wielomianu interpolacyjnego
    #x::Vector{Float64} - tablica zawierająca wartości węzłów x_0, x_1, x_2 ...
    #fx::Vector{Float64} - tablica zawierająca wartości ilorazów różnicowych f(x_0), f(x_0,x_1),...
    #t::Float64 - punkt dla którego liczymy wartość wielomianu
    function warNewton(x::Vector{Float64}, fx::Vector{Float64}, t::Float64)
        size=length(x)
        reszta=fx[size]
        i=size-1
        while i>0
            reszta=reszta * (t-x[i]) + fx[i]
            i=i-1;
        end
        return reszta
    end
    #Funkcja licząca współczyniki wielomianu w postaci Newtona
    #x::Vector{Float64} - tablica zawierająca wartości węzłów x_0, x_1, x_2 ...
    #fx::Vector{Float64} - tablica zawierająca wartości ilorazów różnicowych f(x_0), f(x_0,x_1),...
    function naturalna(x::Vector{Float64}, fx::Vector{Float64})
        size=length(x)
        a=Array(Float64,size);
        a[size]=fx[size]
        i=size-1
        while i >0
            a[i]=fx[i]
            for j in i:size-1
                a[j]=a[j]-x[i]*a[j+1]
            end
            i=i-1;
        end
        return a
    end
    #Funkcja odpowiedzialna za zinterpolowanie zadaniej funkcji w przedziale za pomocą wielomianu interpolacyjnego w postaci Newtona
    #f - funkcja
    #a::Float64 - początek przedziału
    #b::Float64 - koniec przedziału
    #n::Int - stopień wielomianu interpolacyjnego
    function rysujNnfx(f,a::Float64,b::Float64,n::Int)
        prec = (b-a)/n;
        x = Array(Float64, n + 1);
        fx = Array(Float64, n + 1);

        for i=0 : n
          x[i+1] = a+i*prec;
          fx[i+1] = f(x[i+1]);
        end

        fn = ilorazyRoznicowe(x, fx);
        outputFun = Array(Float64, GlobalPrec);
        outputInt = Array(Float64, GlobalPrec);
        prec=(b-a)/GlobalPrec;
        for i in 0:GlobalPrec-1
          t=a+i*prec;
          outputInt[i+1] = warNewton(x,fn,t);
          outputFun[i+1] = f(t);
        end

        plot([1:GlobalPrec],[outputFun , outputInt], label=["Wynik dla funkcji" "Wynik dla interpolacji"])
    end
    function test(x,y,i:: Int)
        if x==y
            @printf "Test %d zadny!\n" i;
            println("Otrzymana wartość:");
            println(x);
        else
            @printf "Test %d niezadny!\nWynik poprawny:\n" i;
            println(y);
            println("Wynik otrzymany:");
            println(x);
        end
    end
end
