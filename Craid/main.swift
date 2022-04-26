//
//  main.swift
//  Craid
//
//  Created by Julian Schumacher on 07.04.22.
//

import Foundation

/// The Code in the main File is executed right
/// when the Program starts.
/// No need of a main Method or something.
/// The Code in this File is executed in Order from Above to Below.
/// I'm trying to keep this File as clean as possible :)

// Create
/// Craid Object
private let craid = Craid()

/// Check if User entered something after craid
if CommandLine.argc < 2 {
    /// User Entered Nothing -> Show Help
    CraidIO.showHelp()
} else {
    /// User entered something -> The Action about the start
    craid.start()
}

