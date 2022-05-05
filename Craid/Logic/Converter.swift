//
//  Converter.swift
//  Craid
//
//  Created by Julian Schumacher on 05.05.22.
//

import Foundation


internal struct Converter {
    
    /// Checks if the input String is an Option or not.
    /// Options are marked with a dash as first char
    static internal func isOption(string : String) -> Bool {
        if string.first == "-" {
            return true
        } else {
            return false
        }
    }
}
