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
    
    /// Returns the Path of the Moodle Installation Container .
    /// Usually there the Data are stored
    static internal func getMoodlePath () -> URL {
        return  URL(fileURLWithPath:  "\(FileManager.default.homeDirectoryForCurrentUser.path)/Library/Containers/com.moodle.moodledesktop/Data/Documents/com.moodle.moodlemobile/sites/")
    }
    
    /// Returns the Directory above the Moodle Directory
    /// Used to check if the Directory does not exist or if you deleted it previously
    static internal func getPreMoodlePath() -> URL {
        return URL(fileURLWithPath: "\(FileManager.default.homeDirectoryForCurrentUser.path)/Library/Containers/com.moodle.moodledesktop/Data/Documents/com.moodle.moodlemobile/")
    }
}
