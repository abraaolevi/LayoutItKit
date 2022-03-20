//
//  ExemplesViewController.swift
//  Example
//
//  Created by Abraao Levi on 20/03/22.
//  Copyright © 2022 LayoutItKit. All rights reserved.
//

import LayoutItKit
import UIKit

struct ListItem {
    let title: String
    let buildViewController: () -> UIViewController
}

class ExamplesViewController: UIViewController {
    let tableView = UITableView()
    
    let cellIndentifier = "cell"
    
    let exampleList = [
        ListItem(title: "Simple \"inline\" usage") { InlineViewController() },
        ListItem(title: "Custom UIView") { CustomUIViewViewController() },
        ListItem(title: "Credit Card sample") { CreditCardViewController() },
        ListItem(title: "Scrollable Credit Card List") { CreditCardListViewController() },
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "LayoutItKit Examples"
        
        view.addSubview(tableView)
        tableView.fillSuperview()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIndentifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ExamplesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        exampleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIndentifier, for: indexPath)
        
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = exampleList[indexPath.row].title
        
        return cell
    }
}

extension ExamplesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let viewController = exampleList[indexPath.row].buildViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}


