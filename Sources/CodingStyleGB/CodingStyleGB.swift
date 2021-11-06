@propertyWrapper
public struct CodingStyleGB {
    
    public enum Style: String {
        case CamelCase  = " "
        case SnakeCase  = "_"
        case KebabCase  = "-"
    }
    
    private var value: String
    private var style: Style
    
    public var wrappedValue: String {
        get { сoncatenation(array: getSubSequence()) }
        set { value = newValue }
    }
    
    public var projectedValue: Style {
        get { style }
        set { style = newValue }
    }
    
    
    public init(wrappedValue: String, style: Style) {
        self.value = wrappedValue
        self.style = style
    }
    
    //  MARK:   - Сonverting string to a given style
    
    private func placesSpacesBeforeCapitalLetters() -> String {
        var newString: String = ""
        
        value.forEach { char in
            if char.isUppercase { newString.append(" ") }
            newString.append(char)
        }
        
        if newString.first == " " { newString.removeFirst() }
        
        return newString
    }
    
    private func getSubSequence() -> [String] {
        let substrings: [String] = placesSpacesBeforeCapitalLetters().split { separator in
            if separator == " " || separator == "-" || separator == "_" { return true }
            return false
        }.map { String($0).lowercased() }
        
        return substrings
    }
    
    private func сoncatenation(array: [String]) -> String {
        var output: String = ""
        
        switch style {
        case .CamelCase:
            array.forEach { output += $0.prefix(1).uppercased() + $0.dropFirst() }
            
        default:
            array.forEach { output += $0 + style.rawValue }
            if !output.isEmpty { output.removeLast() }
        }
        
        return output
    }
}
