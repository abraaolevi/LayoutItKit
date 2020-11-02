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
    
    /// The Label
    let label = UILabel()
        .withText("🚀\nLayoutItKit\nExample")
        .withFont(.systemFont(ofSize: 25, weight: .semibold))
        .withTextColor(.black)
        .withTextAlignment(.center)
        .withNumberOfLines(0)
    
    // MARK: View-Lifecycle
    
    /// View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
    /// LoadView
    override func loadView() {
        self.view = self.label
    }
    
}
