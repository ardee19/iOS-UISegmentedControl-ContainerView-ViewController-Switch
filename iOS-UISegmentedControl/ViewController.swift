//
//  ViewController.swift
//  iOS-UISegmentedControl
//
//  Created by Roy Dimayuga on 8/22/16.
//  Copyright © 2016 Super Awesome. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

    }

    @IBAction func segmentControlValueChanged(sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            label.text = "selectedSegmentIndex: \(sender.selectedSegmentIndex)"
        case 1:
            label.text = "selectedSegmentIndex: \(sender.selectedSegmentIndex)"
        default:
            break
        }
        
        print(sender.selectedSegmentIndex)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

