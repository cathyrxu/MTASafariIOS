//
//  ViewController.swift
//  MTASafari
//
//  Created by Cath Xu on 9/11/25.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let stationListView = StationListView()
        let hostingController = UIHostingController(rootView: stationListView)
        addChild(hostingController)
        hostingController.view.frame = view.bounds
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
    }

}

