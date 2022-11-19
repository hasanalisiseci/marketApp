//
//  ProductCell.swift
//  MarketApp-SwiftUI
//
//  Created by Hasan Ali Şişeci on 19.11.2022.
//

import Kingfisher
import SwiftUI

enum ProductType {
    case first
    case second
    case thirth
}

struct ProductCell: View {
    var product: Product
    var productType: ProductType

    var cellWidth: CGFloat {
        switch productType {
        case .first:
            return (UIScreen.screenWidth / 2) - 20
        case .second:
            return (UIScreen.screenWidth / 3) - 20
        case .thirth:
            return (UIScreen.screenWidth / 2) - 20
        }
    }

    var cellHeight: CGFloat {
        switch productType {
        case .first:
            return 248
        case .second:
            return 180
        case .thirth:
            return 328
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            KFImage(URL(string: product.imageURL))
                .resizable()
                .frame(width: cellWidth - 30, height: cellHeight * 0.5)
                .scaledToFit()
                .cornerRadius(3)
            Text(product.listDescription).lineLimit(2)
            VStack(alignment: .leading, spacing: 0) {
                if product.price != nil {
                    Text("\(product.price!.value.toString)\(product.price!.currency)")
                }
                HStack {
                    ZStack {
                        if product.oldPrice != nil {
                            Text("\(product.oldPrice!.value.toString)\(product.oldPrice!.currency)")
                                .font(.caption)
                                .overlay(Rectangle().frame(height: 1))
                        }
                    }
                    if productType != .second && !product.discount.isEmpty {
                        Circle().frame(width: 5)
                        Text(product.discount).foregroundColor(.pink).font(.caption)
                    }
                }
            }
            if productType == .thirth {
                RateStarView(ratePercentage: product.ratePercentage ?? 101)
            }
        }
        .padding(10)
        .frame(width: cellWidth, height: cellHeight, alignment: .center)
        .overlay(
            RoundedRectangle(cornerRadius: 3)
                .stroke(.black.opacity(0.1), lineWidth: 2)
                .shadow(radius: 5)
        )
    }
}

struct ProductCelll_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(product: Product.mockProduct, productType: .thirth)
    }
}
