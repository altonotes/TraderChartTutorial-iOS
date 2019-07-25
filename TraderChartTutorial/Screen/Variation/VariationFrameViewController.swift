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
        return contentsViewController(sampleVariation: sampleVariation)
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

    func contentsViewController(sampleVariation: SampleVariation) -> UIViewController {
        switch sampleVariation {
        case .minimum:
            return MinimumSampleViewController()
        case .dataUpdate:
            return DataUpdateSampleViewController()
        case .uiCustomize:
            return UICustomizeSampleViewController()
        case .callback:
            return CallbackSampleViewController()
        }
    }
}
