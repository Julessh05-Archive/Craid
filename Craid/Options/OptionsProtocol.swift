//
//  OptionsProtocol.swift
//  Craid
//
//  Created by Julian Schumacher on 27.04.22.
//

import Foundation

/// The Protocol all Options have to match.
internal protocol OptionsProtocol {
    
    /// The Name of the Option.
    /// This is the full Length Option and has to be entered
    /// with two dashes ( -- )
    static var optionsName : String { get }
    
    /// The Shorthand of the Option.
    /// Mostly this is only one Letter.
    /// Has to be entered with one dash ( - )
    static var optionsShortHand : String? { get }
    
    /// This Function is shown when the User types
    /// -h or --help behind the Option
    static func showOnHelp() -> Void
    
    /// This Fuction executes whatever is done
    /// with this Option
    static func execute() -> Void
}
