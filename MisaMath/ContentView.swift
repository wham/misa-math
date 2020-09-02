//
//  ContentView.swift
//  MisaMath
//
//  Created by Tomáš Veselý on 2/8/20.
//  Copyright © 2020 Tomáš Veselý. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var addition = true;
    @State private var subtraction = true;
    @State private var multiplication = true;
    @State private var division = true;
    @State private var difficulty = 0.0;
    
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
        
        return NavigationView {
            VStack(spacing: 10.0) {
                HStack {
                    Image("Addition").resizable().frame(width: 30, height: 30)
                    Toggle(isOn: $addition) {
                        Text("Addition")
                    }
                }
                HStack {
                    Image("Subtraction").resizable().frame(width: 30, height: 30)
                    Toggle(isOn: $subtraction) {
                        Text("Subtraction")
                    }
                }
                HStack {
                    Image("Multiplication").resizable().frame(width: 30, height: 30)
                    Toggle(isOn: $multiplication) {
                        Text("Multiplication")
                    }
                }
                HStack {
                    Image("Division").resizable().frame(width: 30, height: 30)
                    Toggle(isOn: $division) {
                        Text("Division")
                    }
                }
                HStack {
                    Text("Easy")
                    Slider(value: $difficulty, in: 0...2, step: 1)
                    Text("Hard")
                }.padding(.top)
                HStack {
                    Text("Example:")
                    Text(String(mathFormulaExample1.leftOperand) + " ? " + String(mathFormulaExample1.rightOperand))
                    Spacer()
                }.foregroundColor(.gray).font(.system(size: 10)).padding(.bottom)
                NavigationLink(destination: MathFormulaView(mathFormulaGenerator: mathFormulaGenerator, mathFormula: mathFormulaGenerator.generate())) {
                    Text("Start")
                        .font(.title)
                }.buttonStyle(DefaultButtonStyle())
                Spacer()
                
            }
            .padding(.all)
            .navigationBarTitle("Operations")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
