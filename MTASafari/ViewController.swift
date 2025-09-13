//
//  ViewController.swift
//  MTASafari
//
//  Created by Cath Xu on 9/11/25.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    private var currentHostingController: UIHostingController<AnyView>?
    private var currentUser = User()

    override func viewDidLoad() {
        super.viewDidLoad()
        EventUtility.loadEventsFromCSV()
        showStationListView()
    }
    
    private func showStationListView() {
        var stationListView = StationListView()
        stationListView.delegate = self
        
        let hostingController = UIHostingController(rootView: AnyView(stationListView))
        switchToHostingController(hostingController)
    }
    
    private func showEventView(for event: Event) {
        let eventView = EventView(
            event: event,
            onAction: { actionConfig in
                self.showActionResultView(for: actionConfig, event: event)
            }
        )
        
        let hostingController = UIHostingController(rootView: AnyView(eventView))
        switchToHostingController(hostingController)
    }
    
    private func showActionResultView(for actionConfig: ActionConfig, event: Event) {
        // Apply the action configuration to the user
        actionConfig.apply(to: &currentUser)
        
        let actionResultView = ActionResultView(
            resultMessage: actionConfig.StoryResult,
            user: currentUser,
            actionConfig: actionConfig,
            onBack: { [weak self] in
                self?.showStationListView()
            }
        )
        
        let hostingController = UIHostingController(rootView: AnyView(actionResultView))
        switchToHostingController(hostingController)
    }
    
    private func switchToHostingController(_ hostingController: UIHostingController<AnyView>) {
        // Remove current hosting controller
        currentHostingController?.willMove(toParent: nil)
        currentHostingController?.view.removeFromSuperview()
        currentHostingController?.removeFromParent()
        
        // Add new hosting controller
        currentHostingController = hostingController
        addChild(hostingController)
        hostingController.view.frame = view.bounds
        hostingController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
    }
    
}

extension ViewController: StationListViewDelegate {
    func stationListView(_ stationListView: StationListView, didSelectEvent event: Event) {
        showEventView(for: event)
    }
}

