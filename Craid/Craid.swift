//
//  Craid.swift
//  Craid
//
//  Created by Julian Schumacher on 24.04.22.
//

import Foundation

/// Enum to define if the Option is passed
/// as a character or a Word
private enum OptionsType {
    /// The Option Type as a Char
    /// This is the shorthand and has to be entered
    /// with a single dash ( - )
    case char
    
    /// The Option Type as a complete Word
    /// This is the complete word and has to be entered
    /// with two dashes ( -- )
    case word
    
    /// No Option
    case noOption
}

/// The different Options you can pass to the Programm
private enum Option : String {
    /// The Option to show  the Help
    case help = "help"
    case helpShort = "h"
    
    /// get the Version
    case version = "version"
    case versionShort = "v"
    
    /// Everything else
    case unidentified
    
    init(option : String) {
        switch option {
        case "h" : self = .helpShort
        case "help": self = .help
        case "v": self = .versionShort
        case "version": self = .version
        default : self = .unidentified
        }
    }
}

/// All the Actions avaible with Craid
private enum Action : String {
    /// Action to delete the Moodle Downloads Folder
    case clearMoodle = "clear-moodle"
    /// The Passed Action isn't an Action
    case noAction
    
    init(action : String) {
        switch action {
        case ClearMoodleAction.actionName : self = .clearMoodle
        case ClearMoodleAction.actionShortHand: self = .clearMoodle
        default : self = .noAction
        }
    }
}

/// The main Struct which holds the actual Tool
internal struct Craid {
    
    /// The Version of this Program as a String
    static internal let version : String = "1.0.0"
    
    /// The Method called when the Programm starts
    internal func start() -> Void {
        
        // Get first Argument (Option)
        // The Index 1 is used, because the index
        // 0 is always the Name of the Executable
        /// First Option Argument after the Executable Name
        let optionArgument : String = CommandLine.arguments[1]
        
        /// Check Input and execute the Action / Option
        checkInput(option: optionArgument)
    }
    
    /// Checks the Input and executes the Action or Option
    private func checkInput(option : String) -> Void {
        
        // Convert Option to Array
        /// Option as Array to get the single Chars from the String
        let optionAsList : [Character] = Array(option)
        
        // Placeholder for OptionsType
        let optionsType : OptionsType
        
        if optionAsList[0] == "-" {
            if optionAsList[1] == "-" {
                // Long Version of the Option. Is shown trough 2 dashes
                optionsType = .word
            } else {
                // Short Version of the Option. Is shown trough 1 dash
                optionsType = .char
            }
        } else {
            // No Option
            optionsType = .noOption
        }
        
        var optionsToPass : String = option
        switch optionsType {
            // Short Version of Options
        case .char:
            // Remove the single dash
            optionsToPass.removeFirst()
            executeOption(option: getOption(option: optionsToPass, type: optionsType))
        
            // Long Version of Options
        case .word:
            // Remove the double dash
            for _ in 1...2 {
                optionsToPass.removeFirst()
            }
            executeOption(option: getOption(option: optionsToPass, type: optionsType))
            
            // No Option
        case .noOption:
            // No Option -> Action
            executeAction(action: getAction())
        }
    }
    
    /// Returnst the Option the User entered
    private func getOption(option : String, type : OptionsType) -> Option {
        if type == .word {
            switch Option(option: option) {
            case .help:
                return .help
            case .version:
                return .version
            default:
                return .unidentified
            }
        } else if type == .char {
            switch Option(option: option) {
            case .helpShort:
                return .help
            case .versionShort:
                return .version
            default:
                return .unidentified
            }
        
        } else {
            return .unidentified
        }
    }
    
    /// If no Option is passed, get the Action the User wanted to execute
    private func getAction() -> Action {
        return Action(action: CommandLine.arguments[1])
    }

    /// Checks the Option and executes the Action connected to it
    private func executeOption(option: Option) -> Void {
        switch option {
        case .help:
            HelpOption.execute()
        case .version:
            VersionOption.execute()
        default:
            HelpOption.execute()
        }
    }
        
    /// Checks the Action and executes it, if it is a valid Action
    private func executeAction(action : Action) -> Void {
        switch action {
            // User wants the Moodle Directory to be cleared
        case .clearMoodle:
            ClearMoodleAction.execute()
            // User has entered no Option. So the Error Indicator is shown
        case .noAction:
            CraidIO.showOnError()
        }
    }
}
