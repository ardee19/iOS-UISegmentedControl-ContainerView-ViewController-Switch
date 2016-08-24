//
//  ViewController.swift
//  iOS-UISegmentedControl
//
//  Created by Roy Dimayuga on 8/22/16.
//  Copyright © 2016 Super Awesome. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    weak var currentViewController: UIViewController?
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        
        currentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ComponentA")
        currentViewController?.view.translatesAutoresizingMaskIntoConstraints = false
        self.addChildViewController(self.currentViewController!)
        self.addSubview(self.currentViewController!.view, toView: self.containerView)
        
        super.viewDidLoad()

    }
    
    //  Helper method to add a sub view to another view and constrain it with auto layout
    func addSubview(subView:UIView, toView parentView:UIView) {
        parentView.addSubview(subView)
        
        var viewBindingsDict = [String:AnyObject]()
        viewBindingsDict["subView"] = subView
        parentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[subView]|", options: [], metrics: nil, views: viewBindingsDict))
        parentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[subView]|", options: [], metrics: nil, views: viewBindingsDict))
    }
    
    

    @IBAction func segmentControlValueChanged(sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            let newViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ComponentA")
            newViewController!.view.translatesAutoresizingMaskIntoConstraints = false
            self.cycleFromViewController(self.currentViewController!, toViewController: newViewController!)
            self.currentViewController = newViewController
            
            print("case 0")
        case 1:
            let newViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ComponentB")
            newViewController!.view.translatesAutoresizingMaskIntoConstraints = false
            self.cycleFromViewController(self.currentViewController!, toViewController: newViewController!)
            self.currentViewController = newViewController
            
            print("case 1")

        default:
            break
        }
        
        print(sender.selectedSegmentIndex)
        
    }
    
    func cycleFromViewController(oldViewController:UIViewController, toViewController newViewController:UIViewController) {
        
        oldViewController.willMoveToParentViewController(nil)
        self.addChildViewController(newViewController)
        self.addSubview(newViewController.view, toView: self.containerView)
        newViewController.view.alpha = 0
        newViewController.view.layoutIfNeeded()
        UIView.animateWithDuration(0.5, animations: {
            newViewController.view.alpha = 1
            oldViewController.view.alpha = 0
            }) { (finished) in
                oldViewController.view.removeFromSuperview()
                oldViewController.removeFromParentViewController()
                newViewController.didMoveToParentViewController(self)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        print ("\(self) - didReceiveMemoryWarning")
    }


}

