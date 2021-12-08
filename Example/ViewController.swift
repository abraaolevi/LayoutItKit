//
//  ViewController.swift
//  Example
//
//  Created by Abraão Levi on 1 Nov 2020.
//  Copyright © 2020 LayoutItKit. All rights reserved.
//

import UIKit
import LayoutItKit

// MARK: - ViewController

/// The ViewController
class ViewController: UIViewController {
    
    // MARK: Properties

    // MARK: View-Lifecycle
    
    /// View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let myCustomView = MyCustomView()
        self.view.addSubviewAndFillSuperview(myCustomView)
        
//        // OR
//
//        let label = UILabel()
//            .withText("🚀\nLayoutItKit\nExample")
//            .withFont(.systemFont(ofSize: 25, weight: .semibold))
//            .withTextColor(.black)
//            .withTextAlignment(.center)
//            .withNumberOfLines(0)
//
//        self.view.scrollableStack(views: [
//            label,
//            UIView(backgroundColor: .blue).withSize(height: 100),
//            UIView(backgroundColor: .green).withSize(height: 100),
//            UIView(backgroundColor: .black).withSize(height: 100),
//            UIView(backgroundColor: .brown).withSize(height: 100),
//            UIView(backgroundColor: .purple).withSize(height: 100),
//            UIView(backgroundColor: .red).withSize(height: 100),
//            UIView()
//        ], spacing: 24)
    }
    
}

class MyCustomView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let label = UILabel()
            .withText("🚀\nLayoutItKit\nExample")
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
                    UIView(backgroundColor: .red).withSize(height: 100)
                ],
                spacing: 24
            )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


