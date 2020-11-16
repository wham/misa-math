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
            UserDefaults.standard.set(easyCorrect, forKey: "easy.correct");
        }
    }
    
    @Published var easyIncorrect: Int {
        didSet {
            UserDefaults.standard.set(easyCorrect, forKey: "easy.incorrect");
        }
    }
    
    @Published var mediumCorrect: Int {
        didSet {
            UserDefaults.standard.set(easyCorrect, forKey: "medium.correct");
        }
    }
    
    @Published var mediumIncorrect: Int {
        didSet {
            UserDefaults.standard.set(easyCorrect, forKey: "medium.incorrect");
        }
    }
    
    @Published var hardCorrect: Int {
        didSet {
            UserDefaults.standard.set(easyCorrect, forKey: "hard.correct");
        }
    }
    
    @Published var hardIncorrect: Int {
        didSet {
            UserDefaults.standard.set(easyCorrect, forKey: "hard.incorrect");
        }
    }
    
    init() {
        self.easyCorrect = UserDefaults.standard.integer(forKey: "easy.correct");
        self.easyIncorrect = UserDefaults.standard.integer(forKey: "easy.incorrect");
        self.mediumCorrect = UserDefaults.standard.integer(forKey: "medium.correct");
        self.mediumIncorrect = UserDefaults.standard.integer(forKey: "medium.incorrect");
        self.hardCorrect = UserDefaults.standard.integer(forKey: "hard.correct");
        self.hardIncorrect = UserDefaults.standard.integer(forKey: "hard.incorrect");
    }
    
    func addCorrect(difficulty: Difficulty) {
        if (difficulty == .easy) {
            easyCorrect += 1
        }
        
        if (difficulty == .medium) {
            mediumCorrect += 1
        }
        
        if (difficulty == .hard) {
            hardCorrect += 1
        }
    }
    
    func addIncorrect(difficulty: Difficulty) {
        if (difficulty == .easy) {
            easyIncorrect += 1
        }
        
        if (difficulty == .medium) {
            mediumIncorrect += 1
        }
        
        if (difficulty == .hard) {
            hardIncorrect += 1
        }
    }
    
    func clear() {
        easyCorrect = 0
        easyIncorrect = 0
        mediumCorrect = 0
        mediumIncorrect = 0
        hardCorrect = 0
        hardIncorrect = 0
    }
}
