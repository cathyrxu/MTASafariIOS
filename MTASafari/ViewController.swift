//
//  ViewController.swift
//  MTASafari
//
//  Created by Cath Xu on 9/11/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Display StationListView when the app starts
        let stationListView = StationListView()
        stationListView.frame = self.view.bounds
        self.view.addSubview(stationListView)
    }

}

