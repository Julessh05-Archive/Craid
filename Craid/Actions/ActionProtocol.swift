//
//  ActionProtocol.swift
//  Craid
//
//  Created by Julian Schumacher on 26.04.22.
//

import Foundation

/// The Protocol all Actions need to match
internal protocol ActionProtocol{

    /// The Name of the Action.
    static var actionName : String { get }
    
    /// The Shorthand of the Action
    /// This can be nil (null), because not every action has a shorthand
    static var actionShortHand : String? { get }
    
    /// This Function is called when the User types -h or --help behind
    /// a specific Action
    static func showOnHelp() -> Void
    
    /// Function to execute the Action
    static func execute() -> Void
}
