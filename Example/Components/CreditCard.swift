//
//  CreditCard.swift
//  Example
//
//  Created by Abraao Levi on 20/03/22.
//  Copyright © 2022 LayoutItKit. All rights reserved.
//

import LayoutItKit
import UIKit

struct CreditCard {
    let number: String
    let holder: String
    let expiration: String
}

class CreditCardView: UIView {

    let titleLabel = UILabel(text: "Credit Card", font: .boldSystemFont(ofSize: 32), textColor: .white)
    let monthYearTitleLabel = UILabel(text: "Month / Year", font: .systemFont(ofSize: 8), textColor: .white)
    let validThruTitleLabel = UILabel(text: "Valid Thru", font: .systemFont(ofSize: 10), textColor: .white, numberOfLines: 2)
    
    let cardNumberLabel = UILabel(font: .systemFont(ofSize: 24, weight: .semibold), textColor: .white)
    let expirationLabel = UILabel(font: .systemFont(ofSize: 18), textColor: .white)
    let holderLabel = UILabel(font: .systemFont(ofSize: 18), textColor: .white)

    convenience init(card: CreditCard) {
        self.init(frame: .zero)

        cardNumberLabel.text = card.number
        expirationLabel.text = card.expiration
        holderLabel.text = card.holder
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setCardBackground()
        setCardLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setCardBackground() {
        backgroundColor = .blue
        layer.cornerRadius = 12
        layer.masksToBounds = true
    }
    
    private func setCardLayout() {
        vstack(
            titleLabel,
            spacer(),
            
            cardNumberLabel,
            vspacer(8),
            
            hstack(
                hspacer(30),
                monthYearTitleLabel,
                spacer()
            ),
            hstack(
                validThruTitleLabel.withSize(width: 30),
                expirationLabel,
                spacer()
            ),
            vspacer(8),

            holderLabel
        )
        .withPadding()
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct CreditCardViewContainer: UIViewRepresentable {
    typealias UIViewType = CreditCardView
    
    func makeUIView(context: Context) -> UIViewType {
        let card = CreditCard(
            number: "1234 1234 1234 134",
            holder: "Credit Card Holder",
            expiration: "12 / 12")

        return CreditCardView(card: card)
    }

    func updateUIView(_ uiView: CreditCardView, context: Context) {}
}

struct BackgroundViewContainer_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CreditCardViewContainer().colorScheme(.light)
            CreditCardViewContainer().colorScheme(.dark)
        }.previewLayout(.fixed(width: 300, height: 200))
    }
}
#endif
