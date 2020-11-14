//Создать иерархию классов и протокол, который будет реализовывать один из наследников.
//
//Например, можно создать класс "Фигура", наследником которого будут фигуры (треугольник, круг, прямоугольник). У этого класса будут read-only переменные name и cornerRadius, которые надо будет переопределить в наследниках. Также каждый наследник должен иметь метод расчета площади. Протокол будет создан для четырехугольных фигур, стороны которых попарно равны (прямоугольник, квадрат, параллелограм, параллелограмм). В нем будут переменные "ширина", "длина" и "Периметр" (переменная периметр должна иметь стандартную реализацию).

import Foundation

class Figure {
    let name: String
    let cornerCount: Int
    init(_ name: String = "Figure", _ cornerCount: Int = 0) {
        self.name = name
        self.cornerCount = cornerCount
    }
}

class Triangle : Figure {
    let aSide: Double
    let bSide: Double
    let cSide: Double
    var Perimeter: Double {
        return aSide + bSide + cSide
    }
    
    // Add validation test
    init(aSide: Double, bSide: Double, cSide: Double) {
        self.aSide = aSide
        self.bSide = bSide
        self.cSide = cSide
        if (cSide + bSide < aSide) || (aSide + cSide < bSide) || (aSide + bSide < cSide) {
            super.init("Invalid Triangle", 3)
        }
        else {
            super.init("Triangle", 3)
        }
    }

    func PlaneArea() -> Double {
        let P = self.Perimeter / 2
        sqrt
        return sqrt(P * (P - aSide) * (P - bSide) * (P - cSide))
    }
}

class Circle : Figure {
    let Pi: Double = 3.141592
    let Radius: Double
    var Perimeter: Double {
        return  2 * Pi * Radius
    }
    
    init(Radius: Double) {
        self.Radius = Radius
        super.init("Circle")
    }

    func PlaneArea() -> Double {
        return Pi * Radius * Radius
    }
}

protocol Quadrangles {
    var Width: Double { get }
    var Length: Double { get }
}

extension Quadrangles {
    var Perimeter: Double {
        return (Width + Length) * 2
    }
}

class Rectangle : Figure, Quadrangles {
    let Width: Double
    let Length: Double
    
    init(Width: Double, Length: Double) {
        self.Width = Width
        self.Length = Length
        super.init("Rectangle", 4)
    }
    
    func PlaneArea() -> Double {
        return Width * Length
    }
}

class Square : Figure, Quadrangles {
    let Width: Double
    let Length: Double
    
    init(Width: Double) {
        self.Width = Width
        self.Length = Width
        super.init("Square", 4)
    }
    
    func PlaneArea() -> Double {
        return Width * Length
    }
}

class Parallelogram : Figure, Quadrangles {
    let Width: Double
    let Length: Double
    let Diagonal: Double
    
    init(Width: Double, Length: Double, Diagonal: Double) {
        self.Width = Width
        self.Length = Length
        self.Diagonal = Diagonal
        super.init("Parallelogram", 4)
    }
    
    func PlaneArea() -> Double {
        let P = (Width + Length + Diagonal) / 2
        return 2 * sqrt(P * (P - Width) * (P - Length) * (P - Diagonal))
    }
}

func TestFigures() {
    let T = Triangle(aSide: 7, bSide: 6, cSide: 2)
    print("Figure name: ", T.name)
    print("Perimeter: ", T.Perimeter)
    print("Plane area: ", T.PlaneArea(), "\n\n")

    let C = Circle(Radius: 5)
    print("Figure name: ", C.name)
    print("Perimeter: ", C.Perimeter)
    print("Plane area: ", C.PlaneArea(), "\n\n")

    let R = Rectangle(Width: 5, Length: 3)
    print("Figure name: ", R.name)
    print("Perimeter: ", R.Perimeter)
    print("Plane area: ", R.PlaneArea(), "\n\n")

    let S = Square(Width: 5)
    print("Figure name: ", S.name)
    print("Perimeter: ", S.Perimeter)
    print("Plane area: ", S.PlaneArea(), "\n\n")

    let P = Parallelogram(Width: 4, Length: 4, Diagonal: 4)
    print("Figure name: ", P.name)
    print("Perimeter: ", P.Perimeter)
    print("Plane area: ", P.PlaneArea(), "\n\n")
}

TestFigures()
