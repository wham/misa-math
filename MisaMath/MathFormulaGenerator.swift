import SwiftUI
import Combine

class MathFormulaGenerator {
    var operations: [MathOperation]
    var difficulty: Difficulty
    
    init(addition: Bool, subtraction: Bool, multiplication: Bool, division: Bool, difficulty: Difficulty) {
        
        operations = []
        if (addition) {
            operations.append(.addition)
        }
        
        if (subtraction) {
            operations.append(.subtraction)
        }
        
        if (multiplication) {
            operations.append(.multiplication)
        }
        
        if (division) {
            operations.append(.division)
        }
        
        if (operations.count < 1) {
            fatalError("No math operation specified")
        }
        
        self.difficulty = difficulty
    }
    
    func generate() -> MathFormula {
        var leftOperand = 0;
        let operation = operations.randomElement()!
        var rightOperand = 0;
        
        switch difficulty {
        case .easy:
            switch operation {
            case .addition:
                leftOperand = Int.random(in: 0...10)
                rightOperand = Int.random(in: 0...(10 - leftOperand))
            case .subtraction:
                leftOperand = Int.random(in: 0...10)
                rightOperand = Int.random(in: 0...leftOperand)
            case .multiplication:
                leftOperand = Int.random(in: 0...5)
                rightOperand = Int.random(in: 0...5)
            case .division:
                rightOperand = Int.random(in: 0...5)
                leftOperand = rightOperand * Int.random(in: 0...5)
            }
        case .medium:
            switch operation {
            case .addition:
                leftOperand = Int.random(in: 0...100)
                rightOperand = Int.random(in: 0...(100 - leftOperand))
            case .subtraction:
                leftOperand = Int.random(in: 0...100)
                rightOperand = Int.random(in: 0...leftOperand)
            case .multiplication:
                leftOperand = Int.random(in: 0...10)
                rightOperand = Int.random(in: 0...10)
            case .division:
                rightOperand = Int.random(in: 0...10)
                leftOperand = rightOperand * Int.random(in: 0...10)
            }
        case .hard:
            switch operation {
            case .addition:
                leftOperand = Int.random(in: 0...1000)
                rightOperand = Int.random(in: 0...(1000 - leftOperand))
            case .subtraction:
                leftOperand = Int.random(in: 0...1000)
                rightOperand = Int.random(in: 0...leftOperand)
            case .multiplication:
                leftOperand = Int.random(in: 0...20)
                rightOperand = Int.random(in: 0...20)
            case .division:
                rightOperand = Int.random(in: 0...20)
                leftOperand = rightOperand * Int.random(in: 0...20)
            }
        }
        
        let result = compute(leftOperand: leftOperand, operation: operation, rightOperand: rightOperand)
        
        return MathFormula(leftOperand: leftOperand, operation: operation, rightOperand: rightOperand, result: result)
    }
    
    private func compute(leftOperand: Int, operation: MathOperation, rightOperand: Int) -> Int {
        switch operation {
        case .addition:
            return leftOperand + rightOperand
        case .subtraction:
            return leftOperand - rightOperand
        case .multiplication:
            return leftOperand * rightOperand
        case .division:
            return leftOperand / rightOperand
        }
    }
}

