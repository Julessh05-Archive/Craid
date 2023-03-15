//
//  InitFlutterAction.swift
//  Craid
//
//  Created by Julian Schumacher on 12.03.23.
//

import Foundation

/// The Action to init a Flutter Project
internal struct InitFlutterAction : FullActionProtocol {
    static var actionName: String
    
    static var actionShortHand: String
    
    static var argumentsCount: Int
    
    static var options: [Option]
    
    static func showOnHelp() {
        <#code#>
    }
    
    static func execute(args: [Any]?) {
        <#code#>
    }
    
    static func execute(option: Option) {
        <#code#>
    }
    
    
}
