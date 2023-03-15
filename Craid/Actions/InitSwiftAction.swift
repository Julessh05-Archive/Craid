//
//  InitSwiftAction.swift
//  Craid
//
//  Created by Julian Schumacher on 12.03.23.
//

import Foundation

/// An Action to initialize a Swift Project with my structure and basic files
internal struct InitSwiftAction : FullActionProtocol {
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
