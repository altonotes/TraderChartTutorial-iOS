//
//  FirstViewController.swift
//  TraderChartTutorial
//
//  Created by Keita Yamamoto on 2019/07/17.
//  Copyright © 2019 altonotes Inc. All rights reserved.
//

import TraderChart

class MainViewController: UIViewController {

    let dataLoader = DataLoader()

    @IBOutlet weak var chartView: TraderChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let chartData = dataLoader.loadChartData(file: "chart_data_day")
        chartView.addData(chartData)
    }
}

