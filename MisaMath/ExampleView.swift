import SwiftUI

struct ExampleView: View {
    var mathFormula: MathFormula
    
    var body: some View {
        Text(String(mathFormula.leftOperand) + " " + mathFormula.operation.toPrettyString() + " " + String(mathFormula.rightOperand))
    }
}

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView(mathFormula: MathFormula(leftOperand: 23, operation: .addition, rightOperand: 10, result: 33))
    }
}
