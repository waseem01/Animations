//
//  ViewController.swift
//  Animations
//
//  Created by Waseem Mohd on 4/19/17.
//  Copyright © 2017 Mohammed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tray: UIView!
    
    
    var trayOriginalCenter: CGPoint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pan(_ sender: UIPanGestureRecognizer) {
        let pan = sender
        let translation = sender.translation(in: tray)
        let point = pan.location(in: tray)
        
        if pan.state == .began {
            trayOriginalCenter = tray.center
            print("Gesture began at: \(point)")
        } else if pan.state == .changed {
            tray.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
            print("Gesture changed at: \(point)")
        } else if pan.state == .ended {
            
            print("Gesture ended at: \(point)")
        }
    }

}

