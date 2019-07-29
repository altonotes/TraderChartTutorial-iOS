//
//  UICustomizeSampleViewController.swift
//  TraderChartTutorial
//
//  Created by Keita Yamamoto on 2019/07/25.
//  Copyright © 2019 altonotes Inc. All rights reserved.
//

import TraderChart

/// チャートのレイアウトや見た目のカスタマイズサンプル
class UICustomizeSampleViewController: UIViewController {

    let dataLoader = DataLoader()
    @IBOutlet weak var chartView: TraderChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 表示するメインチャートを指定します（複数指定可能）
        chartView.setVisibleMainChartTypes([.candle, .turningPoint])
        // 表示するサブチャートを指定します（複数指定可能）
        chartView.setVisibleSubChartTypes([.macd, .stochastics])

        // 文字のフォントを設定します
        chartView.fontContext = SampleFontContext()

        // 上下左右の余白を設定します（初期値は全て0）
        chartView.margin = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        // グラフ領域の上下左右の枠線の太さを設定します（初期値は全て0.5）
        chartView.border.setWidth(left: 15, right: 15, top: 15, bottom: 15)
        // グラフ領域の区切り線の太さを設定します（初期値は全て0.5）
        chartView.separator.lineWidth = 10
        // 左端のスクロールの余白を設定します（初期値は50）
        // 左端までスクロールした際グラフの左側にこのサイズ分余白が空きます
        chartView.leftScrollMargin = 0
        // 左側のスクロールの余白を設定します（初期値は50）
        chartView.rightScrollMargin = 0
        // 下部X軸（横軸）目盛りの領域の高さを指定します
        chartView.xAxis.height = 50
        // 下部X軸（横軸）の罫線の太さを設定します（初期値は 0.5）
        chartView.xAxis.lineWidth = 1
        // 下部X軸（横軸）の罫線の破線間隔を設定します。nilを指定した場合破線ではなく実線になります。
        chartView.xAxis.lineDashIntervals = nil
        // 下部X軸（横軸）のテキストのフォーマットを設定します
        chartView.xAxis.formatter = self.formatTime
        // 下部X軸（横軸）の文字サイズを設定します
        chartView.xAxis.fontSize = 16

        if let timeMarker = chartView.xAxis.touchMarker as? TimeMarker {
            // 下部X軸（横軸）のタッチマーカーの罫線の表示有無を設定します（初期値は true）
            timeMarker.showLine = true
            // 下部X軸（横軸）のタッチマーカーの罫線の太さを設定します（初期値は 0.5）
            timeMarker.lineWidth = 2.0
            // 下部X軸（横軸）のタッチマーカーの罫線の色を設定します
            timeMarker.lineColor = UIColor.red
            // 下部X軸（横軸）のタッチマーカーの罫線の破線間隔を設定します。nilを指定した場合破線ではなく実線になります。
            timeMarker.lineDashIntervals = [2, 4]
            // 下部X軸（横軸）のタッチマーカーのテキストの色を設定します
            timeMarker.fontColor = UIColor.lightGray
            // 下部X軸（横軸）のタッチマーカーのテキストの背景色を設定します
            timeMarker.markerColor = UIColor.yellow
            // 下部X軸（横軸）のタッチマーカーの左右余白を設定します（初期値は 5）
            timeMarker.markerPadding = 20
            // 下部X軸（横軸）のタッチマーカーの三角形の幅を設定します（初期値は 5）
            timeMarker.arrowWidth = 30
            // 下部X軸（横軸）のタッチマーカーの最小の高さを設定します（初期値は 14）
            timeMarker.minMarkerHeight = 30
            // 下部X軸（横軸）のタッチマーカーのドラッグ中に表示するテキストの背景色を設定します
            timeMarker.draggingTextBackgroundColor = UIColor(red: 1.0, green: 0, blue: 0, alpha: 0.5)
            // 下部X軸（横軸）のタッチマーカーのドラッグ中に表示するテキストの背景の角丸サイズを設定します（初期値は 4）
            timeMarker.draggingTextBackgroundCornerRadius = 10
            // 下部X軸（横軸）のタッチマーカーのドラッグ中に表示するテキストの色を設定します
            timeMarker.draggingTextColor = UIColor.yellow
            // 下部X軸（横軸）のタッチマーカーのドラッグ中に表示するテキストのサイズを設定します（初期値は 18）
            timeMarker.draggingFontSize = 34.0
        }

        // Y軸（縦軸）目盛りの左右位置を指定します（初期値は .right）
        chartView.yAxisSetting.alignment = .left
        // Y軸（縦軸）目盛りの幅を指定します
        chartView.yAxisSetting.width = 80
        // Y軸（縦軸）目盛りをグラフ領域と重ねるかを指定します（初期値は false）
        chartView.yAxisSetting.graphOverwrap = true
        // メイングラフ領域のY軸（縦軸）の罫線の表示・非表示を設定します（初期値はtrue）
        chartView.mainGraphArea.yAxis.isLineVisible = true
        // メイングラフ領域のY軸（縦軸）の罫線の太さを設定します（初期値は0.5）
        chartView.mainGraphArea.yAxis.lineWidth = 1
        // メイングラフ領域のY軸（縦軸）の罫線の破線間隔を設定します。nilを指定した場合破線ではなく実線になります。
        chartView.mainGraphArea.yAxis.lineDashIntervals = nil
        // メイングラフ領域のY軸（縦軸）目盛りテキストの罫線に対する位置（罫線の上・下・中心）を設定します。
        chartView.mainGraphArea.yAxis.graduationAlignment = .aboveLine
        // メイングラフ領域のY軸（縦軸）目盛りテキストのパディングを設定します。
        chartView.mainGraphArea.yAxis.textPadding = 6
        // メイングラフ領域のY軸（縦軸）目盛りテキストの文字サイズを設定します。
        chartView.mainGraphArea.yAxis.fontSize = 20

        // ※Y軸の設定はメイングラフ領域だけでなく、各グラフ領域に個別に設定することができます
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let chartData = dataLoader.loadChartData(file: "chart_data_day")
        chartView.addData(chartData)
    }

    func formatTime(index: Int, time: String?) -> String {
        guard var time = time, !time.isEmpty else { return "" }

        time = time.remove("-").remove(" ")
        let month = time.substring(from: 4, length: 2) ?? ""
        let day = time.substring(from: 6, length: 2) ?? ""
        return month + "/" + day
    }

    class SampleFontContext: FontContext {
        func numericFont(size: CGFloat) -> UIFont {
            return UIFont(name: "DIN Alternate", size: size) ?? UIFont.systemFont(ofSize: size)
        }

        func descriptionFont(size: CGFloat) -> UIFont {
            return UIFont(name: "DIN Alternate", size: size) ?? UIFont.systemFont(ofSize: size)
        }
    }
}
