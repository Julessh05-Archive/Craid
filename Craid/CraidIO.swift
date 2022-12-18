//
//  CraidIO.swift
//  Craid
//
//  Created by Julian Schumacher on 24.04.22.
//

import Foundation

/// The possible Output Types
internal enum OutputType {
    /// Standard Output for User Data
    case standard
    /// Error Output for Errors
    case error
    /// Output for Important Messages
    case important
    /// Output for silence Messages
    case silent
}

/// Holds everything that is done in IO
/// in this Command Line Tool
internal struct CraidIO {
    /// Method to communicate with the User
    static internal func communicate (message: String, whereTo: OutputType = .standard) -> Void {
        switch whereTo {
            /// Standard Output
        case .standard:
            print(message)
            break
            /// Error Output
        case .error:
            print("Error: \(message)")
            break
            // puts something somewhere to the Error output
            //fputs(message, stderr)
            /// Important Output
        case .important:
            print(message.uppercased())
            break
            /// Silent Outpu
        case .silent:
            print(message.lowercased())
            break
        }
    }
    
    
    /// Prints some Usage Information to the Console
    static internal func showHelp() -> Void {
        communicate(message: "Hello Sir, how can I help you?")
        communicate(message: "Options:")
        communicate(message: "craid -h or craid --help for help")
        communicate(message: "craid -v or craid --version for the version information")
        communicate(message: "")
        communicate(message: "Actions:")
        communicate(message: "craid clear-moodle or craid cm to clear your moodle documents directory")
        communicate(message: "")
        // TODO: show after implementing the Function
        //communicate(message: "craid time in {cityname} to get the current time in another city (currently only capitals)")
        communicate(message: "Aditional Information:")
        communicate(message: "Type -h or --help after an action to get more specific information about that action")
    }
    
    /// Function called if the Program run into an Error or the User
    /// entered something the Program can't resolve
    static internal func showOnError() -> Void {
        communicate(message: "Something went wrong")
        communicate(message: "Either this action is not avaible, you've got a typo, or something internal went wrong")
        communicate(message: "Please check the spelling for Typos")
        communicate(message: "Please excuse the Circumstances, we're working hard to find and remove all Bugs")
        communicate(message: "If you have concerns, contact the Administrator through a Github Issue")
    }
    
    /// This is called when an Action that needs one or more arguments is called with zero arguments
    static internal func showOnNotEnoughArguments() -> Void {
        communicate(message: "This Action needs more Arguments.")
        communicate(message: "Please provide these Arguments")
        communicate(message: "Type {action} -h or  --help for the Action Help")
    }
}
