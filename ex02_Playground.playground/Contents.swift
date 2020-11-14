//Задание: Придумать и реализовать полезные Extensions для уже существующих классов.

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

protocol QuadranglesProto {
    var Width: Double { get }
    var Length: Double { get }
}

extension QuadranglesProto {
    var Perimeter: Double {
        return (Width + Length) * 2
    }
}

// Для уменьшения дублирования кода введен новый класс Qadrangles, содержащий общие свойства четырехугольников
class Quadrangles : Figure, QuadranglesProto {
    let Width: Double
    let Length: Double
    init(Width: Double, Length: Double) {
        self.Width = Width
        self.Length = Length
        super.init("Quadrangle", 4)
    }

    init(Width: Double, Length: Double, name: String) {
        self.Width = Width
        self.Length = Length
        super.init(name, 4)
    }

    func PlaneArea() -> Double {
        return Width * Length
    }
    
    func Print() {
        print("Figure name:", name)
        print("With size: width = \(Width), length = \(Length)")
        print("Perimeter =", Perimeter)
        print("Plane area =", PlaneArea(), "\n")
    }
}

class Rectangle : Quadrangles {
    override init(Width: Double, Length: Double) {
        super.init(Width: Width, Length: Length, name: "Rectangle")
    }
}

class Square : Quadrangles {
    init(Width: Double) {
        super.init(Width: Width, Length: Width, name: "Square")
    }
}

class Parallelogram : Quadrangles {
    let Diagonal: Double
    
    init(Width: Double, Length: Double, Diagonal: Double) {
        self.Diagonal = Diagonal
        super.init(Width: Width, Length: Length, name: "Parallelogram")
    }
    
    override func PlaneArea() -> Double {
        let P = (Width + Length + Diagonal) / 2
        return 2 * sqrt(P * (P - Width) * (P - Length) * (P - Diagonal))
    }
    
    override func Print() {
        print("Figure name:", name)
        print("With size: width = \(Width), length = \(Length), diagonal = \(Diagonal)")
        print("Perimeter =", Perimeter)
        print("Plane area =", PlaneArea(), "\n")
    }
}

// Реализация Extensions для классов Triangle и Circle
extension Triangle {
    func MakeParallelogram() -> Parallelogram {
        var Diag = aSide
        if Diag < bSide {
            if bSide < cSide {
                Diag = cSide
                return Parallelogram(Width: bSide, Length: aSide, Diagonal: Diag)
            }
            else {
                Diag = bSide
                return Parallelogram(Width: cSide, Length: aSide, Diagonal: Diag)
            }
        }
        else if Diag < cSide {
            Diag = cSide
            return Parallelogram(Width: bSide, Length: aSide, Diagonal: Diag)
        }
        return Parallelogram(Width: bSide, Length: cSide, Diagonal: Diag)
    }
    
    func Print() {
        print("Figure name:", name)
        print("With sides: a = \(aSide), b = \(bSide), c = \(cSide)")
        print("Perimeter =", Perimeter)
        print("Plane area =", PlaneArea(), "\n")
    }
}

extension Circle {
    func MakeInscribedSquare() -> Square {
        return Square(Width: Radius * sqrt(2))
    }
    func MakeDescribedSquare() -> Square {
        return Square(Width: 2 * Radius)
    }
    func Print() {
        print("Figure name:", name)
        print("Radius =", Radius)
        print("Perimeter =", Perimeter)
        print("Plane area =", PlaneArea(), "\n")
    }
}

func TestFigures() {
    let T = Triangle(aSide: 7, bSide: 6, cSide: 2)
    T.Print()

    let C = Circle(Radius: 5)
    C.Print()

    let R = Rectangle(Width: 5, Length: 3)
    R.Print()

    let S = Square(Width: 5)
    S.Print()

    let P = Parallelogram(Width: 4, Length: 4, Diagonal: 3)
    P.Print()
}

func TestExtensions() {
    let T = Triangle(aSide: 7, bSide: 6, cSide: 2)
    let C = Circle(Radius: 5)
    let P = T.MakeParallelogram()
    let InscribedSquare = C.MakeInscribedSquare()
    let DescribedSquare = C.MakeDescribedSquare()
    
    P.Print()
    InscribedSquare.Print()
    DescribedSquare.Print()
}

//TestFigures()
TestExtensions()

