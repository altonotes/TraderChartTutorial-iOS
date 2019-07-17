//
//  SecondViewController.swift
//  TraderChartTutorial
//
//  Created by Keita Yamamoto on 2019/07/17.
//  Copyright © 2019 altonotes Inc. All rights reserved.
//

import UIKit

class VariationMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}

