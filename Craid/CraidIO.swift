//
//  CraidIO.swift
//  Craid
//
//  Created by Julian Schumacher on 24.04.22.
//

import Foundation

/// The possible Output Types
enum OutputType {
    case standard
    case error
}

/// Holds everything that is done in IO
/// in this Command Line Tool
struct CraidIO {
    /// Method to communicate with the User
    func communicate (message: String, whereTo: OutputType = .standard) -> Void {
        switch whereTo {
        case .standard:
            print(message)
        case .error:
            print("Error: \(message)")
            // puts something somewhere to the Error output
            //fputs(message, stderr)
        }
    }
    
    
    /// Prints some Usage Information to the Console
    func showHelp() -> Void {
        communicate(message: "Hello Sir, how can I help you?")
        communicate(message: "Type craid -h for help")
    }
}
