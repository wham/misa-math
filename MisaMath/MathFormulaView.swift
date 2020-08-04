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
    @State var numberOfCorrectFormulas = 0
    @State var numberOfIncorrectFormulas = 0
    @State var isCounted = false
    
    var body: some View {
        let binding = Binding<String>(get: {
            self.result
        }, set: {
            self.result = $0
            
            if (Int(self.result) == self.mathFormula.expectedResult) {
                if (!self.isCounted) {
                    self.numberOfCorrectFormulas = self.numberOfCorrectFormulas + 1
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    // Put your code which should be executed with a delay here
                    self.mathFormula.generate()
                    self.result = ""
                    self.isCounted = false
                }
            } else if (!self.isCounted && String(self.result).count >= String(self.mathFormula.expectedResult).count) {
                self.numberOfIncorrectFormulas = self.numberOfIncorrectFormulas + 1
                self.isCounted = true
            }
        })
        
        return VStack() {
            HStack() {
                Text(String(mathFormula.leftOperand))
                Text(String(mathFormula.operation))
                Text(String(mathFormula.rightOperand))
                Text("=")
                TextField("??", text: binding)
                    .keyboardType(/*@START_MENU_TOKEN@*/.numberPad/*@END_MENU_TOKEN@*/)
                    .frame(width: 80)
                    .foregroundColor(mathFormula.expectedResult == Int(result) ? .green : (String(self.result).count >= String(self.mathFormula.expectedResult).count ? .red : .primary))
            
            }
            .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
            Spacer()
        }
        .padding(.all)
        .navigationBarItems(trailing: HStack() {
            Text(String(numberOfCorrectFormulas)).foregroundColor(.green)
            Text("/")
            Text(String(numberOfIncorrectFormulas)).foregroundColor(.red)
            }.padding(5))
    }
}

struct MathFormulaView_Previews: PreviewProvider {
    static var previews: some View {
        MathFormulaView(mathFormula: MathFormula(addition: true, subtraction: false, multiplication: false, division: false))
    }
}
