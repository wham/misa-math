//
//  ContentView.swift
//  MisaMath
//
//  Created by Tomáš Veselý on 2/8/20.
//  Copyright © 2020 Tomáš Veselý. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftOperand = 23
    @State var rightOperand = 10
    @State var result = ""
    
    var body: some View {
        HStack() {
            Text(String(leftOperand))
            Text("+")
            Text(String(rightOperand))
            Text("=")
            TextField("??", text: $result)
                .keyboardType(/*@START_MENU_TOKEN@*/.numberPad/*@END_MENU_TOKEN@*/)
                .foregroundColor(leftOperand + rightOperand == Int(result) ? .green : .red)
            
        }
        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
