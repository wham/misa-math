//
//  Results.swift
//  MisaMath
//
//  Created by Tomáš Veselý on 11/6/20.
//  Copyright © 2020 Tomáš Veselý. All rights reserved.
//

import Foundation

class Results: ObservableObject {
    @Published var easyCorrect: Int {
        didSet {
            UserDefaults.standard.set(easyCorrect, forKey: "easyCorrect");
        }
    }
    
    init() {
        self.easyCorrect = UserDefaults.standard.integer(forKey: "easyCorrect");
    }
}
