//
//  Craid.swift
//  Craid
//
//  Created by Julian Schumacher on 24.04.22.
//

import Foundation

/// The different Options you can pass to the Programm
internal enum Option : String {
    /// The Option to show  the Help
    case help
    
    /// get the Version
    case version
    
    /// Everything else
    case unidentified
    
    init(option : String) {
        switch option {
        case "-h":
            self = .help
            break
        case "--help":
            self = .help
            break
        case "-v":
            self = .version
            break
        case "--version":
            self = .version
            break
        default:
            self = .unidentified
            break
        }
    }
}

/// All the Actions avaible with Craid
private enum Action : String {
    /// Action to delete the Moodle Downloads Folder
    case clearMoodle
    /// The Passed Action isn't an Action
    case noAction
    
    init(action : String) {
        switch action {
        case ClearMoodleAction.actionName:
            self = .clearMoodle
            break
        case ClearMoodleAction.actionShortHand:
            self = .clearMoodle
            break
        default:
            self = .noAction
            break
        }
    }
}

/// The main Struct which holds the actual Tool
internal struct Craid {
    
    /// The Version of this Program as a String
    static internal let version : String = "1.1.0"
    
    /// The Method called when the Programm starts
    internal func start() -> Void {
        
        // Get first Argument (Option)
        // The Index 1 is used, because the index
        // 0 is always the Name of the Executable
        /// First Option Argument after the Executable Name
        let optionArgument : String = CommandLine.arguments[1]
        
        if optionArgument.first == "-" {
            executeOption(option: getOption(option: optionArgument))
        } else {
            if CommandLine.arguments.count > 2 {
                let optionForAction : String = CommandLine.arguments[2]
                executeAction(action: getAction(), option: getOption(option: optionForAction))
            } else {
                executeAction(action: getAction())
            }
        }
    }
    
    /// Returns the Option the User entered
    private func getOption(option : String) -> Option {
        return Option(option: option)
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
    
    
    /// Checks the Action and executes it, if it is a valid Action.
    /// This Method is called when the Action has an Option
    private func executeAction(action : Action, option : Option) -> Void {
        switch action {
            // User wants the Moodle Directory to be cleared
        case .clearMoodle:
            ClearMoodleAction.execute(option: option)
            // User has entered no Option. So the Error Indicator is shown
        case .noAction:
            CraidIO.showOnError()
        }
    }
}
