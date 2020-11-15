import SwiftUI

struct NewTestView: View {
    var results: Results
    @State private var addition = true
    @State private var subtraction = true
    @State private var multiplication = true
    @State private var division = true
    @State private var difficulty = 0.0
    
    var body: some View {
        var difficultyEnum: Difficulty = .easy
        
        if (difficulty == 1) {
            difficultyEnum = .medium
        }
        
        if (difficulty == 2) {
            difficultyEnum = .hard
        }
        
        let mathFormulaGenerator = MathFormulaGenerator(addition: addition, subtraction: subtraction, multiplication: multiplication, division: division, difficulty: difficultyEnum)
        
        let mathFormulaExample1 = mathFormulaGenerator.generate()
        let mathFormulaExample2 = mathFormulaGenerator.generate()
        let mathFormulaExample3 = mathFormulaGenerator.generate()
        let mathFormulaExample4 = mathFormulaGenerator.generate()
        
        return
            VStack(spacing: 10.0) {
            HStack {
                Image("Addition").resizable().frame(width: 30, height: 30)
                Toggle(isOn: $addition) {
                    Text("Addition")
                }.disabled(!subtraction && !multiplication && !division)
            }
            HStack {
                Image("Subtraction").resizable().frame(width: 30, height: 30)
                Toggle(isOn: $subtraction) {
                    Text("Subtraction")
                }.disabled(!addition && !multiplication && !division)
            }
            HStack {
                Image("Multiplication").resizable().frame(width: 30, height: 30)
                Toggle(isOn: $multiplication) {
                    Text("Multiplication")
                }.disabled(!addition && !subtraction && !division)
            }
            HStack {
                Image("Division").resizable().frame(width: 30, height: 30)
                Toggle(isOn: $division) {
                    Text("Division")
                }.disabled(!addition && !subtraction && !multiplication)
            }
            HStack {
                Text("Easy")
                Slider(value: $difficulty, in: 0...2, step: 1)
                Text("Hard")
            }.padding(.top)
            HStack {
                Text("Examples:")
                ExampleView(mathFormula: mathFormulaExample1)
                ExampleView(mathFormula: mathFormulaExample2)
                ExampleView(mathFormula: mathFormulaExample3)
                ExampleView(mathFormula: mathFormulaExample4)
                Spacer()
            }.foregroundColor(.gray).font(.system(size: 10)).padding(.bottom)
            NavigationLink(destination: MathFormulaView(mathFormulaGenerator: mathFormulaGenerator, results: results, mathFormula: mathFormulaGenerator.generate())) {
                Text("Start")
                    .font(.title)
            }.buttonStyle(DefaultButtonStyle())
        }
            .padding(.all).background(RoundedRectangle(cornerRadius: 5)
                                    .fill(Color.cardBackground))
    }
}

struct NewTestView_Previews: PreviewProvider {
    static var previews: some View {
        NewTestView(results: Results())
    }
}
