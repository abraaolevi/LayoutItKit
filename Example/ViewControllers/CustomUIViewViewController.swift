//
//  CustomUIViewViewController.swift
//  Example
//
//  Created by Abraao Levi on 20/03/22.
//  Copyright © 2022 LayoutItKit. All rights reserved.
//

import LayoutItKit
import UIKit

class CustomUIViewViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Custom UIView Example"
        
        let myCustomView = MyCustomView()
        view.addSubviewAndFillSuperview(myCustomView)
    }
}

class MyCustomView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let label = UILabel()
            .withText("🚀\nCustom UIView\nLayoutItKit\nExample")
            .withFont(.systemFont(ofSize: 25, weight: .semibold))
            .withTextColor(.black)
            .withTextAlignment(.center)
            .withNumberOfLines(0)

        scrollableStack(
            views: [
                label,
                UIView(backgroundColor: .blue).withSize(height: 100),
                UIView(backgroundColor: .green).withSize(height: 100),
                UIView(backgroundColor: .black).withSize(height: 100),
                UIView(backgroundColor: .brown).withSize(height: 100),
                UIView(backgroundColor: .purple).withSize(height: 100),
                UIView(backgroundColor: .red).withSize(height: 100),
                UIView(backgroundColor: .blue).withSize(height: 100),
                UIView(backgroundColor: .green).withSize(height: 100),
                UIView(backgroundColor: .black).withSize(height: 100),
                UIView(backgroundColor: .brown).withSize(height: 100),
                UIView(backgroundColor: .purple).withSize(height: 100),
                UIView(backgroundColor: .red).withSize(height: 100)
            ],
            spacing: 24
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
