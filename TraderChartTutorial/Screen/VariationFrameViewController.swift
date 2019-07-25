//
//  VariationFrameViewController.swift
//  TraderChartTutorial
//
//  Created by Keita Yamamoto on 2019/07/17.
//  Copyright © 2019 altonotes Inc. All rights reserved.
//

import UIKit

class VariationFrameViewController: UIViewController {

    var sampleVariation: SampleVariation? {
        didSet {
            navigationItem.title = sampleVariation?.rawValue
        }
    }

    var contentsController: UIViewController? {
        guard let sampleVariation = sampleVariation else {
            return nil
        }

        switch sampleVariation {
        case .minimum:
            return MinimumSampleViewController()
        case .dataUpdate:
            return MinimumSampleViewController() // TODO 各ケースのViewController作成
        case .customizeUI:
            return MinimumSampleViewController() // TODO 各ケースのViewController作成
        case .callback:
            return MinimumSampleViewController() // TODO 各ケースのViewController作成
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let contentsController = contentsController,
            let contentsView = contentsController.view {

            addChild(contentsController)
            view.addSubview(contentsView)
            
            contentsView.translatesAutoresizingMaskIntoConstraints = false
            contentsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            contentsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            contentsView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
            contentsView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        }
    }
}
