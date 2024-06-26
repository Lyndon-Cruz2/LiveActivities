//
//  ContentView.swift
//  NextFlightApp
//
//  Created by Lyndon Cruz on 6/25/24.
//

import SwiftUI
import ActivityKit
import WidgetKit

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button("Start Delivery") {
                startNextFlightActivity()
                        }
        }
        .padding()
    }
}

func startNextFlightActivity() {
    let attributes = NextFlightAttributes(name: "Lyndon")

}
