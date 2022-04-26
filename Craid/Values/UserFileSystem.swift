//
//  UserFileSystem.swift
//  Craid
//
//  Created by Julian Schumacher on 26.04.22.
//

import Foundation

/// This Struct holds all the Values like Paths and URLs that are
/// different from User to User
internal struct UserFileSystem {
    
    /// Method which try's to find the Moodle Path on the local Machine
    static internal func getMoodlePath () -> URL {
        return moodlePath
    }
    
    /// The URL / Path to the Moodle Directory
    static private var moodlePath : URL = URL(fileURLWithPath:  "\(FileManager.default.homeDirectoryForCurrentUser.path)/Library/Containers/com.moodle.moodledesktop/Data/Documents/com.moodle.moodlemobile/sites/")
}
