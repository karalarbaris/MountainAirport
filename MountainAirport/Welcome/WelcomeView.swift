//
//  SwiftUIView.swift
//  MountainAirport
//
//  Created by Baris Karalar on 29.11.22.
//

import SwiftUI

struct WelcomeView: View {
  
  @StateObject var flightInfo = FlightData()
  @State var showNextFlight = false
  
  @StateObject var lastFlightInfo = FlightNavigationInfo()
  
  var body: some View {
    
    NavigationView {
      
      ZStack(alignment: .topLeading) {
        Image("welcome-background")
          .resizable()
          .frame(height: 250)
        
        VStack(alignment: .leading) {
          
          NavigationLink {
            FlightStatusBoard(flights: flightInfo.getDaysFlights(Date()))
          } label: {
            WelcomeButtonView(title: "Flight Status", subTitle: "Departure and Arrival Information")
          }
          
          
          if let id = lastFlightInfo.lastFlightId,
             let lastFlight = flightInfo.getFlightById(id) {
            NavigationLink(destination: FlightDetails(flight: lastFlight), isActive: $showNextFlight) {
            }
            
            Button {
              showNextFlight = true
            } label: {
              WelcomeButtonView(title: "Last Flight \(lastFlight.flightName)", subTitle: "Show Next Flight Departing or Arriving at Airport")
            }
          }
          
          Spacer()
        }
        .font(.title)
        .foregroundColor(.white)
        .padding()
        
      }
      .navigationBarTitle("Mountain Airport")
      
    }
    .navigationViewStyle(StackNavigationViewStyle())
    .environmentObject(lastFlightInfo)
    
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    WelcomeView()
  }
}
