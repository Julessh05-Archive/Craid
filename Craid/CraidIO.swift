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
            // Standard Output
        case .standard:
            print(message)
            // Error Output
        case .error:
            print("Error: \(message)")
            // puts something somewhere to the Error output
            //fputs(message, stderr)
            // important Output
        case .important:
            print(message.uppercased())
            // Silent Outpu
        case .silent:
            print(message.lowercased())
        }
    }
    
    
    /// Prints some Usage Information to the Console
    static internal func showHelp() -> Void {
        communicate(message: "Hello Sir, how can I help you?")
        communicate(message: "Type craid -h for help")
        communicate(message: "Type clear-moodle to clear the local moodle Documents Directory")
    }
    
    /// Function called if the Program run into an Error or the User
    /// entered something the Program can't resolve
    static internal func showOnError() -> Void {
        communicate(message: "Something went wrong")
        communicate(message: "Please excuse the Errow, we're working hard to find and remove all Bugs")
        showHelp()
    }
}
