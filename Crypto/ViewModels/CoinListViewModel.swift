//
//  CoinListViewModel.swift
//  Crypto
//
//  Created by Rajesh Triadi Noftarizal on 27/11/24.
//

import Foundation

class CoinListViewModel: ObservableObject {
    @Published var coins: [Coin] = []
    @Published var errorMessage: String? = nil
    
    private var coinService: CoinServiceProtocol
    
    init(coinService: CoinServiceProtocol = CoinGeckoService()) {
        self.coinService = coinService
    }
    
    func fetchCoins() {
        coinService.fetchCoins { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let coins):
                    self.coins = coins
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
