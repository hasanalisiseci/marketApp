//
//  RateStarView.swift
//  MarketApp-SwiftUI
//
//  Created by Hasan Ali Şişeci on 19.11.2022.
//

import SwiftUI

struct RateStarView: View {
    var ratePercentage: Int
    var opacity: Double {
        if ratePercentage <= 100 && ratePercentage >= 0 {
            return 1
        } else {
            return 0
        }
    }

    var body: some View {
        HStack(spacing: 0) {
            Image(systemName: "star.fill").foregroundColor(ratePercentage >= 20 ? .green : .gray)
                Image(systemName: "star.fill").foregroundColor(ratePercentage >= 40 ? .green : .gray)
                Image(systemName: "star.fill").foregroundColor(ratePercentage >= 60 ? .green : .gray)
                Image(systemName: "star.fill").foregroundColor(ratePercentage >= 80 ? .green : .gray)
                Image(systemName: "star.fill").foregroundColor(ratePercentage >= 100 ? .green : .gray)
            
        }.font(.system(size: 15)).opacity(opacity)
    }
}

struct RateStarView_Previews: PreviewProvider {
    static var previews: some View {
        RateStarView(ratePercentage: 60)
    }
}
