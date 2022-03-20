//
//  CreditCardListViewController.swift
//  Example
//
//  Created by Abraao Levi on 20/03/22.
//  Copyright © 2022 LayoutItKit. All rights reserved.
//

import LayoutItKit
import UIKit

class CreditCardViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Credit Card Component"
        
        let creditCard = CreditCardView(
            card: CreditCard(
                number: "4412 9873 1234 9876",
                holder: "Jonh Doe",
                expiration: "10 / 29"
            )
        )

        view.addSubviewAndCenterToSuperview(creditCard)

        // Credit Card Size
        let width = UIScreen.main.bounds.width - 64
        let height = (width / 3) * 2
        creditCard.withSize(width: width, height: height)
    }
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI

@available(iOS 13.0.0, *)
struct CreditCardViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        return CreditCardViewController()
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}

@available(iOS 13.0.0, *)
struct CreditCardViewController_Previews: PreviewProvider {
    static var previews: some View {
        CreditCardViewControllerRepresentable()
    }
}
#endif
