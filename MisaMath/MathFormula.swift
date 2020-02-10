import SwiftUI
import Combine

final class MathFormula: ObservableObject  {
    @Published var leftOperand = 23
    @Published var rightOperand = 10
    var expectedResult: Int {
        get {
            return leftOperand + rightOperand
        }
    }
    
    init() {
        generate()
    }
    
    func generate() {
        leftOperand = Int.random(in: 1..<50)
        rightOperand = Int.random(in: 1..<50)
    }
}
