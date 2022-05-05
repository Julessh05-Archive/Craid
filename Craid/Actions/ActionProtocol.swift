//
//  ActionProtocol.swift
//  Craid
//
//  Created by Julian Schumacher on 26.04.22.
//

import Foundation

/// The Protocol all Actions need to match
internal protocol ActionProtocol {

    /// The Name of the Action.
    static var actionName : String { get }
    
    /// The Shorthand of the Action
    /// This can be nil (null), because not every action has a shorthand
    static var actionShortHand : String? { get }
    
    /// This Number indicates, how many Arguments this Action
    /// takes. In some cases these are more than one.
    static var arguemntsCount : Int { get }
    
    /// The Options you can enter behind the Action Name
    /// Every Action has at least one Option ( -h )
    /// This Options calls the showOnHelp() Method
    static var options : [Option] { get }
    
    /// This Function is called when the User types -h or --help behind
    /// a specific Action
    static func showOnHelp() -> Void
    
    /// Function to execute the Action
    static func execute() -> Void
    
    /// The Execute Function called when an Option is passed
    static func execute(option : Option) -> Void
}
