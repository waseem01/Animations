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
    var trayUp: CGPoint!
    var trayDown: CGPoint!
    var trayDownOffset: CGFloat!

    @IBOutlet weak var downArrow: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        trayDownOffset = 160
        trayUp = tray.center
        trayDown = CGPoint(x: tray.center.x ,y: tray.center.y + trayDownOffset)
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTap))
        downArrow.addGestureRecognizer(tap)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func didTap() {
        self.tray.center = CGPoint(x: tray.center.x, y: 65)
    }

    @IBAction func pan(_ sender: UIPanGestureRecognizer) {
        let pan = sender
        let translation = sender.translation(in: tray)
        let velocity = sender.velocity(in: view)
        let point = pan.location(in: self.view)

        if pan.state == .began {
            trayOriginalCenter = tray.center
            print("Gesture began at: \(point)")
        } else if pan.state == .changed {
            tray.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
            print("Gesture changed at: \(point)")
        } else if pan.state == .ended {
//            if velocity.y > 0 {
//                UIView.animate(withDuration: 0.5) {
//                    self.tray.center = self.trayDown
//                }
//            } else {
//                UIView.animate(withDuration: 0.5) {
//                    self.tray.center = self.trayUp
//                }
            tray.center = CGPoint(x: trayOriginalCenter.x, y: point.y)
                print("Gesture ended at: \(point)")
            }
        }
    }



