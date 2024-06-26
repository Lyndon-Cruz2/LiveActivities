//
//  NextFlightAttributes.swift
//  NextFlightApp
//
//  Created by Lyndon Cruz on 6/25/24.
//

import Foundation
import ActivityKit

struct NextFlightAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var departureTime: String
        var flightStatus: String
        var arrivalTime: Date
        var flightNumber: String
    }
    var name: String

}
