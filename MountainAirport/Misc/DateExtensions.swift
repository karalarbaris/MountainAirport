//
//  SwiftUIView.swift
//  MountainAirport
//
//  Created by Baris Karalar on 01.12.22.
//

import Foundation

extension Date {
  var dateOnly: Date {
    let cdc = Calendar.current.dateComponents([.month, .day, .year], from: self)
    // swiftlint:disable:next force_unwrapping
    return Calendar.current.date(from: cdc)!
  }
}
