//
//  CreditCardListViewController.swift
//  Example
//
//  Created by Abraao Levi on 20/03/22.
//  Copyright © 2022 LayoutItKit. All rights reserved.
//

import LayoutItKit
import UIKit

class CreditCardListViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Credit Card List"
        view.backgroundColor = .white

        view.scrollableStack(views: [
            configure(CreditCardView(card: .init(number: "1234 9876 1234 9876", holder: "Jonh Doe", expiration: "12 / 12"))) {
                $0.backgroundColor = .black
            },
            CreditCardView(card: .init(number: "9876 1234 9876 1234", holder: "Jonh Doe", expiration: "08 / 22")),
            CreditCardView(card: .init(number: "3456 0981 1234 8766", holder: "Jonh Doe", expiration: "05 / 29")),
            CreditCardView(card: .init(number: "8723 5467 1298 1278", holder: "Jonh Doe", expiration: "01 / 27")),
            CreditCardView(card: .init(number: "1212 3434 4545 6788", holder: "Jonh Doe", expiration: "12 / 22"))
        ], spacing: 24).withPadding()
    }
    
}
