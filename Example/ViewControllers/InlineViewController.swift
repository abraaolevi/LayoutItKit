//
//  InlineViewController.swift
//  Example
//
//  Created by Abraao Levi on 20/03/22.
//  Copyright © 2022 LayoutItKit. All rights reserved.
//

import LayoutItKit
import UIKit

class InlineViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Inline Example"
        
        let label = UILabel()
            .withText("🚀\nInline UILabel\nLayoutItKit\nExample")
            .withFont(.systemFont(ofSize: 25, weight: .semibold))
            .withTextColor(.black)
            .withTextAlignment(.center)
            .withNumberOfLines(0)

        view.scrollableStack(views: [
            label,
            UIView(backgroundColor: .blue).withSize(height: 100),
            UIView(backgroundColor: .green).withSize(height: 100),
            UIView(backgroundColor: .black).withSize(height: 100),
            UIView(backgroundColor: .brown).withSize(height: 100),
            UIView(backgroundColor: .purple).withSize(height: 100),
            UIView(backgroundColor: .red).withSize(height: 100),
            UIView()
        ], spacing: 24)
    }
}
