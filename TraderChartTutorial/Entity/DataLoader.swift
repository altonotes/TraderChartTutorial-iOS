//
//  DataLoader.swift
//  TraderChartTutorial
//
//  Created by Keita Yamamoto on 2019/07/19.
//  Copyright © 2019 altonotes Inc. All rights reserved.
//

import TraderChart

class DataLoader {

    func loadChartData(file: String) -> ChartData {
        let chartData = ChartData()

        guard let records = loadRecordList(path: file) else {
            print("Failed to load `\(file)`")
            return chartData
        }

        chartData.volumeList = NumberArray(array: [])
        records.forEach { record in
            chartData.timeList.append(record.time)
            chartData.openList.append(record.open)
            chartData.closeList.append(record.close)
            chartData.highList.append(record.high)
            chartData.lowList.append(record.low)
            chartData.volumeList?.append(record.volume)
        }

        return chartData
    }

    private func loadRecordList(path: String) -> [ChartRecord]? {
        guard let data = loadFileData(path: path, ext: "json") else {
            return nil
        }

        do {
            return try JSONDecoder().decode([ChartRecord].self, from: data)
        } catch {
            return nil
        }
    }

    private func loadFileData(path: String, ext: String) -> Data? {
        guard let path = Bundle.main.url(forResource: path, withExtension: ext) else {
            return nil
        }
        return try? Data(contentsOf: path)
    }

    class ChartRecord: Decodable {
        var time: String
        var open: CGFloat?
        var high: CGFloat?
        var low: CGFloat?
        var close: CGFloat?
        var volume: CGFloat?

        required init(from decoder: Decoder) throws {
            var container = try decoder.unkeyedContainer()
            time = try container.decode(String.self)
            open = try container.decode(CGFloat?.self)
            high = try container.decode(CGFloat?.self)
            low = try container.decode(CGFloat?.self)
            close = try container.decode(CGFloat?.self)
            volume = try container.decode(CGFloat?.self)
        }
    }
}
