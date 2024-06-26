//
//  NextFlightWidgetLiveActivity.swift
//  NextFlightWidget
//
//  Created by Lyndon Cruz on 6/25/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct NextFlightWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var departureTime: Date
        var flightStatus: String
        var arrivalTime: Date
        var flightNumber: String
    }
    var name: String

}

struct NextFlightWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: NextFlightWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Flight Number \(context.state.flightNumber)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.flightNumber)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.flightNumber)")
            } minimal: {
                Text(context.state.flightNumber)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension NextFlightWidgetAttributes {
    fileprivate static var preview: NextFlightWidgetAttributes {
        NextFlightWidgetAttributes(name: "World")
    }
}

extension NextFlightWidgetAttributes.ContentState {
    fileprivate static var smiley: NextFlightWidgetAttributes.ContentState {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM"
        let departureTime = dateFormatter.date(from: "25 Jun") ?? Date()
        let arrivalTime = dateFormatter.date(from: "26 Jun") ?? Date()
        return NextFlightWidgetAttributes.ContentState(departureTime: departureTime, flightStatus: "On Time", arrivalTime: arrivalTime, flightNumber: "AS12345")
    }
     
    fileprivate static var starEyes: NextFlightWidgetAttributes.ContentState {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM"
        let departureTime = dateFormatter.date(from: "26 Jun") ?? Date()
        let arrivalTime = dateFormatter.date(from: "27 Jun") ?? Date()
        return NextFlightWidgetAttributes.ContentState(departureTime: departureTime, flightStatus: "Delayed", arrivalTime: arrivalTime, flightNumber: "AS 123456")
    }
}

#Preview("Notification", as: .content, using: NextFlightWidgetAttributes.preview) {
   NextFlightWidgetLiveActivity()
} contentStates: {
    NextFlightWidgetAttributes.ContentState.smiley
    NextFlightWidgetAttributes.ContentState.starEyes
}
