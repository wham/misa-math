enum MathOperation: Character {
    case addition = "+"
    case subtraction = "-"
    case multiplication = "x"
    case division = "/"
    
    func toPrettyString() -> String {
        switch self {
        case .addition:
            return "+"
        case .subtraction:
            return "-"
        case .multiplication:
            return "×"
        case .division:
            return "÷"
        }
    }
}
