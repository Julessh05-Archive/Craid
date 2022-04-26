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
    case char
    case word
    case noOption
}

/// The different Options you can pass to the Programm
private enum Options : String {
    /// The Option to show  the Help
    case help = "h"
    /// Everything else
    case action
    
    init(option : String) {
        switch option {
        case "h" : self = .help
        default : self = .action
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
        case "clear-moodle" : self = .clearMoodle
        default : self = .noAction
        }
    }
}

/// The main Struct which holds the actual Tool
internal struct Craid {
    /// The Method called when the Programm starts
    internal func start() -> Void {
        // Show help
        CraidIO.showHelp()
        
        // Get Arguments Count
        let argumentCount : Int32 = CommandLine.argc
        
        // Get first Argument (Option)
        // The Index 1 is used, because the index
        // 0 is always the Name of the Executable
        /// First Option Argument after the Executable Name
        let optionArgument : String = CommandLine.arguments[1]
        
        //Create
        /// Option the User passed
        let option : Options = getOption(option: optionArgument)
        
        /// Some Debug Information
        // TODO: remove
        CraidIO.communicate(message: "The Option Count is: \(argumentCount)")
        CraidIO.communicate(message: "The Option is \(option)")
    }
    
    /// Getter for the Options passed to the Program when an Input
    /// is entered
    private func getOption(option : String) -> Options {
        
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
            // Long Version of Options
        case .word:
            // Remove the double dash
            for _ in 1...2 {
                optionsToPass.removeFirst()
            }
            // No Option
        case .noOption:
            // No Option -> Action
            executeAction(action: getAction())
        }
        return Options(option: optionsToPass)
    }
    
    /// If no Option is passed, get the Action the User wanted to execute
    private func getAction() -> Action {
        return Action(action: CommandLine.arguments[1])
    }
    
    
    /// Checks the Action and executes it, if it is a valid Action
    private func executeAction(action : Action) -> Void {
        switch action {
            // User wants the Moodle Directory to be cleared
        case .clearMoodle:
            ClearMoodle.execute()
            // User has entered no Option. So the Error Indicator is shown
        case .noAction:
            CraidIO.showOnError()
        }
    }
}
