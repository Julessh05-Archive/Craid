//
//  main.swift
//  Craid
//
//  Created by Julian Schumacher on 07.04.22.
//

import Foundation

// Create
/// Craid Object
private let craid = Craid()

// Check if User entered something after craid
if CommandLine.argc < 2 {
    // User Entered Nothing -> Show Help
    CraidIO.showHelp()
} else {
    // User entered something -> The Action about the start
    craid.start()
}

