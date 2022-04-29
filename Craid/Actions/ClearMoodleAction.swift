//
//  ClearMoodleAction.swift
//  Craid
//
//  Created by Julian Schumacher on 26.04.22.
//

import Foundation

/// Struct that executes the clear-moodle Action
internal struct ClearMoodleAction : ActionProtocol {
    
    /// The Name of the Action
    static var actionName: String = "clear-moodle"
    
    /// The Name of the short Hand
    static var actionShortHand: String? = "cm"
    
    /// The Options specified for the ClearMoodle Action
    static var options: [Option] = [.help]
    
    
    /// Deletes the Moodle Documents Directory
    static internal func execute() -> Void {
        // Create
        /// FIleManager Object to execute Actions
        let fileManager : FileManager = FileManager.default
        
        // Check if File exists
        if fileManager.fileExists(atPath: UserFileSystem.getMoodlePath().path) {
            // File Exists
            do {
                // Try to remove the Directory
                try fileManager.removeItem(at: UserFileSystem.getMoodlePath())
                // Error was thrown
            } catch let fileError {
                // Show the Error and some help
                CraidIO.communicate(message: "\(fileError)", whereTo: .error)
                CraidIO.showOnError()
            }
            CraidIO.communicate(message: "Cleared Moodle Directory successfullys")
        } else {
            // The Directory does not exist
            if fileManager.fileExists(atPath: UserFileSystem.getPreMoodlePath().path) {
                CraidIO.communicate(message: "You executed this Command and cleared the Directory already.")
                CraidIO.communicate(message: "Since the last Time you did it, moodle did not store any Data")
            } else {
                CraidIO.communicate(message: "Directory does not exist \(UserFileSystem.getMoodlePath())")
                CraidIO.showOnError()
            }
        }
    }
    
    /// The Function called when the User entered an Option behind the Action Name
    static internal func execute(option : Option) -> Void {
        if options.contains(option) {
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
    
    /// Shows the Help for the ClearMoodle Action
    static func showOnHelp() {
        CraidIO.communicate(message: "The clear-moodle Action lets you delete your moodle Data, so you safe a little space on your local drive")
    }
}
