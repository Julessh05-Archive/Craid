//
//  TimeAction.swift
//  Craid
//
//  Created by Julian Schumacher on 05.05.22.
//

import Foundation

internal struct TimeAction : SmallActionProtocol {
    
    /// The Name of the Action Time.
    /// This is only the first Word, the so called "Trigger Word".
    /// This Word indicates the Action.
    static var actionName: String = "time"
    
    /// This shows, that the time Action needs 3 arguments.
    /// The first one is time, the second one in and the last one the
    /// capital.
    static let arguemntsCount: Int = 3
    
    /// The avaible options for this Action
    static var options: [Option] = [.help]
    
    static func showOnHelp() {
        
    }
    
    static func execute(args : [Any]?) {
        CraidIO.showOnNotEnoughArguments()
    }
    
    static func execute(option: Option) {
        
    }
    
    
}
