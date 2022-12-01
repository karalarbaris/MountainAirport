//
//  FlightList.swift
//  MountainAirport
//
//  Created by Baris Karalar on 30.11.22.
//

import SwiftUI

struct FlightList: View {
    
    var flights: [FlightInformation]
    var nextFlightId: Int {
        guard let flight = flights.first(where: { $0.localTime >= Date() }) else {
            return flights.last!.id
        }
        return flight.id
    }
    
    
    var body: some View {
        ScrollViewReader { scrollProxy in
            List(flights) { flight in
                NavigationLink(
                    destination: FlightDetails(flight: flight)) {
                        FlightRow(flight: flight)
                    }
            }
            .navigationBarTitle("Flight Status")
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                    scrollProxy.scrollTo(nextFlightId, anchor: .center)
                }
            }
        }
        
        
        //        List(flights, id: \.id) { flight in
        //            NavigationLink {
        //                FlightDetails(flight: flight)
        //            } label: {
        //                Text(flight.statusBoardName)
        //            }
        //        }
        
        
    }
}

struct FlightList_Previews: PreviewProvider {
    static var previews: some View {
        FlightList(flights: FlightData.generateTestFlights(date: Date()))
        
    }
}
