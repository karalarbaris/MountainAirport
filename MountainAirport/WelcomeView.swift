//
//  SwiftUIView.swift
//  MountainAirport
//
//  Created by Baris Karalar on 29.11.22.
//

import SwiftUI

struct WelcomeView: View {
  @StateObject var flightInfo = FlightData()

  var body: some View {
    VStack(alignment: .leading) {
      ZStack(alignment: .topLeading) {
        // Background
        Image("welcome-background")
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: 375, height: 250)
          .clipped()
        //Title
        VStack {
          Text("Mountain Airport")
            .font(.system(size: 28.0, weight: .bold))
          Text("Flight Status")
        }
        .foregroundColor(.white)
        .padding()
      }
      Spacer()
    }.font(.title)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    WelcomeView()
  }
}
