//
//  FlightList.swift
//  MountainAirport
//
//  Created by Baris Karalar on 30.11.22.
//

import SwiftUI

struct FlightList: View {
    
    var flights: [FlightInformation]
    
    var body: some View {
        List(flights, id: \.id) { flight in
            NavigationLink {
                FlightDetails(flight: flight)
            } label: {
                Text(flight.statusBoardName)
            }
            
        }
        
        
    }
}

struct FlightList_Previews: PreviewProvider {
    static var previews: some View {
        FlightList(flights: FlightData.generateTestFlights(date: Date()))
        
    }
}
