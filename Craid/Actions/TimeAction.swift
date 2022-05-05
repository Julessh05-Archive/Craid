//
//  TimeAction.swift
//  Craid
//
//  Created by Julian Schumacher on 05.05.22.
//

import Foundation

internal struct TimeAction : ActionProtocol {
    
    /// The Name of the Action Time.
    /// This is only the first Word, the so called "Trigger Word".
    /// This Word indicates the Action.
    static var actionName: String = "time"
    
    /// DO NOT USE THIS.
    /// Shorthand is always null.
    @available(*, unavailable)
    static var actionShortHand: String?
    
    static var arguemntsCount: Int = 3
    
    static var options: [Option] = [.help]
    
    static func showOnHelp() {
        
    }
    
    static func execute() {
        CraidIO.showOnNotEnoughArguments()
    }
    
    static func execute(option: Option) {
        
    }
    
    static func execute(where : String) -> Void {
        
    }
    
    
}
