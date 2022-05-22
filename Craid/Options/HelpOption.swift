//
//  HelpOption.swift
//  Craid
//
//  Created by Julian Schumacher on 27.04.22.
//

import Foundation

/// The Option Help.
internal struct HelpOption : FullOptionsProtocol {
    
    /// What to enter to get to the Help
    static var optionsName: String = "--help"
    
    /// The Shorthand h for help
    static var optionsShortHand: String? = "-h"
    
    static var options: [Option] = [.help]
    
    /// What is shown when you type help -h or help --help
    static func showOnHelp() {
        CraidIO.communicate(message: "The Help Option gives you all the information what you can do")
    }
    
    /// Executes the Help Option.
    static func execute() {
        CraidIO.showHelp()
    }
    
    static func execute(option: Option) {
        if(options.contains(option)) {
            switch option {
            case .help:
                showOnHelp()
                break
            default:
                break
            }
        } else {
            CraidIO.showOnError()
        }
    }
    
    
}
