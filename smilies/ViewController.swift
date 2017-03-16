//
//  ViewController.swift
//  smilies
//
//  Created by Edison Lam on 3/15/17.
//  Copyright © 2017 Edison Lam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var trayView: UIView!
    var trayOriginalCenter = CGPoint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func panGesture(_ sender: UIPanGestureRecognizer) {
        // Absolute (x,y) coordinates in parentView
        let location = sender.location(in: self.view)
        
         //= trayView.center
        
        if (sender.state == UIGestureRecognizerState.began) {
            NSLog("Gesture began at: %@", NSStringFromCGPoint(location))
            
            trayOriginalCenter = trayView.center
            
        } else if (sender.state == UIGestureRecognizerState.changed) {
            //NSLog("Gesture changed at: %@", NSStringFromCGPoint(location))
            
            let translationY = sender.translation(in: trayView).y
            
            trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translationY)
            
        } else if (sender.state == UIGestureRecognizerState.ended) {
            NSLog("Gesture ended at: %@", NSStringFromCGPoint(location))

        }
    }


}

