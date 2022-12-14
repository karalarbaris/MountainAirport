//
//  FlightList.swift
//  MountainAirport
//
//  Created by Baris Karalar on 30.11.22.
//

import SwiftUI

struct FlightRow: View {
    var flight: FlightInformation
    
    var timeFormatter: DateFormatter {
        let tdf = DateFormatter()
        tdf.timeStyle = .short
        tdf.dateStyle = .none
        return tdf
    }
    
    var body: some View {
        HStack {
            FlightStatusIcon(flight: flight)
                .padding(5)
                .clipShape(RoundedRectangle(cornerRadius: 7))
            VStack(alignment: .leading) {
                Text(flight.flightName)
                    .font(.title2)
                HStack {
                    Text(flight.flightStatus)
                    Text(flight.localTime, formatter: timeFormatter)
                }
                .foregroundColor(flight.statusColor)
                HStack {
                    Text(flight.otherAirport)
                    Text("·")
                    Text("Gate \(flight.gate)")
                }.foregroundColor(.gray)
            }
        }
    }
}

struct FlightRow_Previews: PreviewProvider {
    static var previews: some View {
        FlightRow(
            flight: FlightData.generateTestFlight(date: Date())
        )
    }
}
