//
//  HelpOption.swift
//  Craid
//
//  Created by Julian Schumacher on 27.04.22.
//

import Foundation

/// The Option Help.
internal struct HelpOption : OptionsProtocol {
    
    /// What to enter to get to the Help
    static var optionsName: String = "--help"
    
    /// The Shorthand h for help
    static var optionsShortHand: String? = "-h"
    
    /// What is shown when you type help -h or help --help
    static func showOnHelp() {
        CraidIO.communicate(message: "The Help Option gives you all the information what you can do")
    }
    
    /// Executes the Help Option.
    static func execute() {
        CraidIO.showHelp()
    }
    
    
}
