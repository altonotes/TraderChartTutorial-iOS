//
//  SecondViewController.swift
//  TraderChartTutorial
//
//  Created by Keita Yamamoto on 2019/07/17.
//  Copyright © 2019 altonotes Inc. All rights reserved.
//

import UIKit

class VariationMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var items: [SampleVariation] {
        return SampleVariation.allCases
    }

    @IBOutlet weak var tableView: UITableView!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = items[indexPath.row].rawValue
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showVariationFrame", sender: nil)
    }
}

