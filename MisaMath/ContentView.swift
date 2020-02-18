//
//  ContentView.swift
//  MisaMath
//
//  Created by Tomáš Veselý on 2/8/20.
//  Copyright © 2020 Tomáš Veselý. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var plus = true;
    
    var body: some View {
        NavigationView {
            VStack {
                Image("Logo")
                    .frame(width: 200, height: 200)
                List {
                    Toggle(isOn: $plus) {
                        Text("+")
                    }
                    Toggle(isOn: $plus) {
                        Text("-")
                    }
                    Toggle(isOn: $plus) {
                        Text("*")
                    }
                    Toggle(isOn: $plus) {
                        Text("/")
                    }
                }
                
                NavigationLink(destination: MathFormulaView()) {
                    Text("Start")
                }.buttonStyle(DefaultButtonStyle())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MathFormula())
    }
}
