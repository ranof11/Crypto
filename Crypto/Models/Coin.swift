//
//  Coin.swift
//  Crypto
//
//  Created by Rajesh Triadi Noftarizal on 27/11/24.
//

import Foundation

struct Coin: Codable, Identifiable {
    var id: String
    var name: String
    var symbol: String
    var current_price: Double
}
