//
//  MinimumSampleViewController.swift
//  TraderChartTutorial
//
//  Created by Keita Yamamoto on 2019/07/19.
//  Copyright © 2019 altonotes Inc. All rights reserved.
//

import TraderChart

/// 最小構成のチャートサンプル
class MinimumSampleViewController: UIViewController {

    @IBOutlet weak var topChartView: TraderChartView!
    @IBOutlet weak var bottomChartView: TraderChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let data = ChartData(timeList: ["1", "2", "3"],
                             openList: [100, 103,  97],
                             highList: [110, 105, 100],
                             lowList:  [ 95,  95,  87],
                             closeList:[105,  98,  92])

        topChartView.addData(data)

        bottomChartView.xAxis.fixedCount = 3
        bottomChartView.addData(data)
    }
}
