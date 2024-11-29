//
//  CoinServiceProtocol.swift
//  Crypto
//
//  Created by Rajesh Triadi Noftarizal on 27/11/24.
//

import Foundation


protocol CoinServiceProtocol {
    func fetchCoins(completion: @escaping (Result<[Coin], Error>) -> Void)
}
