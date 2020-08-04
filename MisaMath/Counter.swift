//
//  Counter.swift
//  MisaMath
//
//  Created by Tomáš Veselý on 8/3/20.
//  Copyright © 2020 Tomáš Veselý. All rights reserved.
//

import Foundation

final class Counter: ObservableObject  {
    @Published var numberOfCorrectFormulas = 0
    @Published var numberOfIncorrectFormulas = 0
}
