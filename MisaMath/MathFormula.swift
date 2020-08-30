import SwiftUI
import Combine

final class MathFormula: ObservableObject  {
    var addition: Bool
    var subtraction: Bool
    var multiplication: Bool
    var division: Bool
    var difficulty: Double
    
    @Published var leftOperand = 23
    @Published var operation = "+"
    @Published var rightOperand = 10
    var expectedResult: Int {
        get {
            switch operation {
            case "-":
                return leftOperand - rightOperand
            case "×":
                return leftOperand * rightOperand
            case "÷":
                return leftOperand / rightOperand
            default:
                return leftOperand + rightOperand
            }
        }
    }
    
    init(addition: Bool, subtraction: Bool, multiplication: Bool, division: Bool, difficulty: Double) {
        self.addition = addition
        self.subtraction = subtraction
        self.multiplication = multiplication
        self.division = division
        self.difficulty = difficulty
        generate()
    }
    
    func generate() {
        var operations: [String] = []
        
        if (addition) {
            operations.append("+")
        }
        
        if (subtraction) {
            operations.append("-")
        }
        
        if (multiplication) {
            operations.append("×")
        }
        
        if (division) {
            operations.append("÷")
        }
        
        operation = operations.count > 0 ? operations.randomElement()! : "+"
        
        switch difficulty {
        case 0:
            switch operation {
            case "-":
                leftOperand = Int.random(in: 0...10)
                rightOperand = Int.random(in: 0...leftOperand)
            case "×":
                leftOperand = Int.random(in: 0...5)
                rightOperand = Int.random(in: 0...5)
            case "÷":
                rightOperand = Int.random(in: 0...5)
                leftOperand = rightOperand * Int.random(in: 0...5)
            default:
                leftOperand = Int.random(in: 0...10)
                rightOperand = Int.random(in: 0...(10 - leftOperand))
            }
        case 1:
            switch operation {
            case "-":
                leftOperand = Int.random(in: 0...100)
                rightOperand = Int.random(in: 0...leftOperand)
            case "×":
                leftOperand = Int.random(in: 0...10)
                rightOperand = Int.random(in: 0...10)
            case "÷":
                rightOperand = Int.random(in: 0...10)
                leftOperand = rightOperand * Int.random(in: 0...10)
            default:
                leftOperand = Int.random(in: 0...100)
                rightOperand = Int.random(in: 0...(100 - leftOperand))
            }
        default:
            switch operation {
            case "-":
                leftOperand = Int.random(in: 0...1000)
                rightOperand = Int.random(in: 0...leftOperand)
            case "×":
                leftOperand = Int.random(in: 0...20)
                rightOperand = Int.random(in: 0...20)
            case "÷":
                rightOperand = Int.random(in: 0...20)
                leftOperand = rightOperand * Int.random(in: 0...20)
            default:
                leftOperand = Int.random(in: 0...1000)
                rightOperand = Int.random(in: 0...(1000 - leftOperand))
            }
        }
    }
}
