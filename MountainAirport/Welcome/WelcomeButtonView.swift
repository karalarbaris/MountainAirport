//
//  WelcomeButtonView.swift
//  MountainAirport
//
//  Created by Baris Karalar on 29.11.22.
//

import SwiftUI

struct WelcomeButtonView: View {
    
    var title: String
    var subTitle: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
                .foregroundColor(.white)
            Text(subTitle)
                .font(.subheadline)
                .foregroundColor(.white)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Image("link-pattern")
            .resizable()
            .clipped()
                    
        )
    }
}

struct WelcomeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeButtonView(title: "Flight Status", subTitle: "Departure and Arrival Information")
    }
}
