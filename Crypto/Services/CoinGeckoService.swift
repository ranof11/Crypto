//
//  CoinGeckoService.swift
//  Crypto
//
//  Created by Rajesh Triadi Noftarizal on 27/11/24.
//

import Foundation

class CoinGeckoService: CoinServiceProtocol {
    
    func fetchCoins(completion: @escaping (Result<[Coin], any Error>) -> Void) {
        let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: -1)))
                return
            }
            
            do {
                let coins = try JSONDecoder().decode([Coin].self, from: data)
                completion(.success(coins))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
