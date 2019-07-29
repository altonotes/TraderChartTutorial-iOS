//
//  String+Utils.swift
//  TraderChartTutorial
//
//  Created by Keita Yamamoto on 2019/07/29.
//  Copyright © 2019 altonotes Inc. All rights reserved.
//

import Foundation

extension String {
    func remove(_ item: String) -> String {
        return replacingOccurrences(of: item, with: "")
    }

    // fromで指定されたindexからlength分の文字列を切り出す
    func substring(from: Int, length: Int) -> String? {
        if self.count < from || self.count < from + length || from < 0 || length < 0 {
            return nil
        }
        let start = index(startIndex, offsetBy: from)
        let end = index(startIndex, offsetBy: from + length)
        return String(self[start..<end])
    }
}
