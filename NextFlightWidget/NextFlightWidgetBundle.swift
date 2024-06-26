//
//  NextFlightWidgetBundle.swift
//  NextFlightWidget
//
//  Created by Lyndon Cruz on 6/25/24.
//

import WidgetKit
import SwiftUI
import ActivityKit

@main
struct NextFlightWidgetBundle: WidgetBundle {
    var body: some Widget {
       // NextFlightWidget()
        NextFlightWidgetLiveActivity()
    }
}

struct NextFlightLiveActivityView: View {
    let context: ActivityViewContext<NextFlightWidgetAttributes>

    var body: some View {
        VStack {
            Text("Flight Number: \(context.state.flightNumber)")
            Text("Departure: \(context.state.departureTime)")
            Text("Status: \(context.state.flightStatus)")
            Text("ETA: \(context.state.arrivalTime, formatter: dateFormatter)")
        }
        .padding()
    }

    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }
}
