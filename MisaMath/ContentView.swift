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
                NavigationLink(destination: MathFormulaView(mathFormula: MathFormula(addition: addition, subtraction: subtraction, multiplication: multiplication, division: division))) {
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
