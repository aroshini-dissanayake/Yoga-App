//
//  YogaViewController.swift
//  YogaApp
//
//  Created by Aroshini Dissanayake on 2023-04-21.
//

import UIKit

class YogaViewController: UIViewController {

    @IBOutlet var segmentOutlet: UISegmentedControl!
    @IBOutlet var pendingTaskSegment: UIView!
    @IBOutlet var closedTaskSegment: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.bringSubviewToFront(pendingTaskSegment)
    }
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.view.bringSubviewToFront(pendingTaskSegment)
        case 1:
            self.view.bringSubviewToFront(closedTaskSegment)
        default:
            break
        }
        
    }
}
