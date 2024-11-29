//
//  CoinListView.swift
//  Crypto
//
//  Created by Rajesh Triadi Noftarizal on 27/11/24.
//

import SwiftUI

struct CoinListView: View {
    @StateObject var viewModel = CoinListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.coins) { coin in
                HStack {
                    Text(coin.symbol.uppercased())
                    
                    Spacer()
                    
                    Text("$\(coin.current_price, specifier: "%.2f")")
                        .foregroundStyle(.green)
                }
            }
            .navigationTitle("Crypto List")
            .onAppear {
                viewModel.fetchCoins()
            }
        }
    }
}

#Preview {
    CoinListView(viewModel: CoinListViewModel())
}
