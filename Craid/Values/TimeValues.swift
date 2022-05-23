//
//  TimeValues.swift
//  Craid
//
//  Created by Julian Schumacher on 23.05.22.
//

import Foundation

/// Values that are relevant to the Time Action
internal struct TimeValues {
    /// A Dictionary of Citys to their Time Zones
    static private let cityZones : [String : String] = [
        "London" : "",
        "Paris" : "",
        "Berlin" : "",
        "Rom" : "",
    ]
    
    /// Converts a City to a Time Zone
    static internal func cityToZone(city : String) -> String {
        for cityZone in cityZones {
            if cityZone.key == city {
                return cityZone.value
            } else {
                continue
            }
        }
        return "Unknown City"
    }
}
