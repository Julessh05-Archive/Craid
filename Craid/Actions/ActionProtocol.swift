//
//  ActionProtocol.swift
//  Craid
//
//  Created by Julian Schumacher on 26.04.22.
//

import Foundation

/// The Protocol all Actions need to match
internal protocol ActionProtocol{
    
    //static var actionName : String { get set }
    //static var actionShortHand : String { get set }
    
    /// Function to execute the Action
    static func execute() -> Void
}
