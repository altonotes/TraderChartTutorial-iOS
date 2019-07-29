//
//  CallbackSampleViewController.swift
//  TraderChartTutorial
//
//  Created by Keita Yamamoto on 2019/07/25.
//  Copyright © 2019 altonotes Inc. All rights reserved.
//

import TraderChart

/// チャートのコールバックのサンプル
class CallbackSampleViewController: UIViewController {

    let dataLoader = DataLoader()

    @IBOutlet weak var chartView: TraderChartView!

    @IBOutlet weak var xAxisIntervalLabel: UILabel!
    @IBOutlet weak var selectedIndexLabel: UILabel!
    @IBOutlet weak var scrollOffsetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clear()

        chartView.onXAxisIntervalChanged = {
            self.xAxisIntervalLabel.text = $0.description
        }
        chartView.onChangeSelectedRecord = { index, chartData in
            self.selectedIndexLabel.text = index?.description ?? "nil"
        }
        chartView.onScrollChanged = {
            self.scrollOffsetLabel.text = $0.description
        }

        chartView.xAxis.formatter = { index, time in
            guard let time = time, !time.isEmpty else {
                return ""
            }
            return time.substring(from: 5, length: 5) ?? ""
        }

        let data = dataLoader.loadChartData(file: "chart_data_day")
        chartView.addData(data)
    }

    func clear() {
        xAxisIntervalLabel.text = nil
        selectedIndexLabel.text = nil
        scrollOffsetLabel.text = nil
    }
}
