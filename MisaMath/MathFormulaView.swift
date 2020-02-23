//
//  MathFormulaView.swift
//  MisaMath
//
//  Created by Tomáš Veselý on 2/17/20.
//  Copyright © 2020 Tomáš Veselý. All rights reserved.
//

import SwiftUI

struct MathFormulaView: View {
    var mathFormula: MathFormula
    @State var result = ""
    
    var body: some View {
        let binding = Binding<String>(get: {
            self.result
        }, set: {
            self.result = $0
            
            if (Int(self.result) == self.mathFormula.expectedResult) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    // Put your code which should be executed with a delay here
                    self.mathFormula.generate()
                    self.result = ""
                }
            }
        })
        
        return HStack() {
            Text(String(mathFormula.leftOperand))
            Text(String(mathFormula.operation))
            Text(String(mathFormula.rightOperand))
            Text("=")
            TextField("??", text: binding)
                .keyboardType(/*@START_MENU_TOKEN@*/.numberPad/*@END_MENU_TOKEN@*/)
                .frame(width: 60)
                .foregroundColor(mathFormula.expectedResult == Int(result) ? .green : .red)
            
        }
        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
    }
}

struct MathFormulaView_Previews: PreviewProvider {
    static var previews: some View {
        MathFormulaView(mathFormula: MathFormula(addition: true, subtraction: false, multiplication: false, division: false))
    }
}
