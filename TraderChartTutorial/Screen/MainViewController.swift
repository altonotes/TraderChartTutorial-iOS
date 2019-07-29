//
//  FirstViewController.swift
//  TraderChartTutorial
//
//  Created by Keita Yamamoto on 2019/07/17.
//  Copyright © 2019 altonotes Inc. All rights reserved.
//

import TraderChart

/// メインのチャートサンプル
class MainViewController: UIViewController {

    let dataLoader = DataLoader()

    @IBOutlet weak var chartView: TraderChartView!

    @IBOutlet weak var smaButton: UIButton!
    @IBOutlet weak var bollingerBandButton: UIButton!
    @IBOutlet weak var emaButton: UIButton!
    @IBOutlet weak var ichimokuButton: UIButton!
    @IBOutlet weak var stochasticsButton: UIButton!
    @IBOutlet weak var macdButton: UIButton!
    @IBOutlet weak var rciButton: UIButton!
    @IBOutlet weak var rsiButton: UIButton!
    @IBOutlet weak var dmiAdxButton: UIButton!

    var mainChartItems: [MainChartItem] = [.candle, .turningPoint]
    var subChartItems: [SubChartItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        let chartData = dataLoader.loadChartData(file: "chart_data_day")
        chartView.addData(chartData)
    }

    func reflectTechnicalCharts() {
        chartView.setVisibleMainChartTypes(mainChartItems)
        chartView.setVisibleSubChartTypes(subChartItems)
    }

    @IBAction func tapTechnicalChartButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected

        guard let item = technicalChartForButton(button: sender) else {
            return
        }

        if let mainChartItem = item as? MainChartItem {
            if sender.isSelected {
                mainChartItems.include(mainChartItem)
            } else {
                mainChartItems.remove(equatable: mainChartItem)
            }
        } else if let subChartItem = item as? SubChartItem {
            if sender.isSelected {
                subChartItems.include(subChartItem)
            } else {
                subChartItems.remove(equatable: subChartItem)
            }
        }

        reflectTechnicalCharts()
    }

    func technicalChartForButton(button: UIButton) -> ChartItem? {
        if button == smaButton {
            return MainChartItem.sma
        } else if button == bollingerBandButton {
            return MainChartItem.bollingerBand
        } else if button == emaButton {
            return MainChartItem.ema
        } else if button == ichimokuButton {
            return MainChartItem.ichimoku
        } else if button == stochasticsButton {
            return SubChartItem.stochastics
        } else if button == macdButton {
            return SubChartItem.macd
        } else if button == stochasticsButton {
            return SubChartItem.stochastics
        } else if button == macdButton {
            return SubChartItem.macd
        } else if button == rciButton {
            return SubChartItem.rci
        } else if button == rsiButton {
            return SubChartItem.rsi
        } else if button == dmiAdxButton {
            return SubChartItem.dmiAdx
        }
        return nil
    }
}

extension Array where Element: Equatable {

    /// 指定した要素を削除する
    mutating func remove(equatable: Element?) {
        guard let element = equatable, let index: Int = firstIndex(of: element) else { return }
        remove(at: index)
    }

    mutating func include(_ element: Element) {
        if !contains(element) {
            append(element)
        }
    }
}

