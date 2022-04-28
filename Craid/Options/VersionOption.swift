//
//  VersionOption.swift
//  Craid
//
//  Created by Julian Schumacher on 28.04.22.
//

import Foundation

/// The Option to check the Version of the Craid Command Line Tool
internal struct VersionOption : OptionsProtocol {
    
    /// Name of the Option
    static var optionsName: String = "version"
    
    /// Shorthand for this Option
    static var optionsShortHand: String? = "v"
    
    /// Shows the Help to the Version Option
    static func showOnHelp() {
        CraidIO.communicate(message: "The Version Options returns the Version Number of this Tool")
    }
    
    /// Executes the Option and shows the Version of the Tool
    static func execute() {
        CraidIO.communicate(message: "Craid Version \(Craid.version)")
    }
    
    
}
