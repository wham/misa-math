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
    
    var body: some View {
        NavigationView {
            VStack {
                Image("Logo")
                    .frame(width: 200, height: 200)
                List {
                    Toggle(isOn: $addition) {
                        Text("+ Addition")
                    }
                    Toggle(isOn: $subtraction) {
                        Text("- Subtraction")
                    }
                    Toggle(isOn: $multiplication) {
                        Text("× Multiplication")
                    }
                    Toggle(isOn: $division) {
                        Text("÷ Division")
                    }
                }.listStyle(GroupedListStyle())
                NavigationLink(destination: MathFormulaView(mathFormula: MathFormula(addition: addition, subtraction: subtraction, multiplication: multiplication, division: division))) {
                    Text("Start")
                }.buttonStyle(DefaultButtonStyle())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
