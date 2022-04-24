//
//  Craid.swift
//  Craid
//
//  Created by Julian Schumacher on 24.04.22.
//

import Foundation

/// Enum to define if the Option is passed
/// as a character or a Word
enum OptionsType {
    case char
    case word
    case noOption
}

/// The different Options you can pass to the Programm
enum Options : String {
    /// The Option to show  the Help
    case help = "h"
    /// Everything else
    case unknown
    
    init(option : String) {
        switch option {
        case "h" : self = .help
        default : self = .unknown
        }
    }
}

/// The main Struct which holds the actual Tool
struct Craid {
    let craidIO : CraidIO = CraidIO();
    
    /// The Method called when the Programm starts
    func start() -> Void {
        // Show help
        craidIO.showHelp()
        
        // Get Arguments Count
        let argumentCount : Int32 = CommandLine.argc
        
        // Get first Argument (Option)
        // The Index 1 is used, because the index
        // 0 is always the Name of the Executable
        let optionArgument : String = CommandLine.arguments[1]
        
        let option : Options = getOption(option: optionArgument)
        
        craidIO.communicate(message: "The Option Count is: \(argumentCount)")
        craidIO.communicate(message: "The Option is \(option)")
    }
    
    /// Getter for the Options passed to the Program when an Input
    /// is entered
    func getOption(option : String) -> Options {
        
        let optionsType : OptionsType
        
        let dash : Character = "-"
        
        if option.first == "-" {
            if option.index(option.startIndex, offsetBy: 1) == dash {
                optionsType = .word
            } else {
                optionsType = .char
            }
        } else {
            optionsType = .noOption
        }
        let optionsToPass : String = String(option[])
        return Options(option: optionsToPass)
    }
}
