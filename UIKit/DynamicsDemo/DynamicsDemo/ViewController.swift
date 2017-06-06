//
//  ViewController.swift
//  DynamicsDemo
//
//  Created by Yulminator on 6/6/17.
//  Copyright © 2017 YuraPetrov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollisionBehaviorDelegate {

    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    var square: UIView!
    var snap: UISnapBehavior!
    var firstContact = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create square and add in view
        square = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        square.backgroundColor = UIColor.gray
        view.addSubview(square)
        
        //create animator and gravity for square
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [square])
        animator.addBehavior(gravity)
        
        //create barrier and add to view
        let barrier = UIView(frame: CGRect(x: 0, y: 300, width: 130, height: 20))
        barrier.backgroundColor = UIColor.red
        view.addSubview(barrier)
        
        //create collision for square
        collision = UICollisionBehavior(items: [square])
        //add a boundary that has the same frame as the barrier
        collision.addBoundary(withIdentifier: "barrier" as NSCopying, for: UIBezierPath(rect: barrier.frame))
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
        collision.collisionDelegate = self
        
        let itemBehaviour = UIDynamicItemBehavior(items: [square])
        itemBehaviour.elasticity = 0.6
        animator.addBehavior(itemBehaviour)
        
        /*var updateCount = 0
        collision.action = {
            if (updateCount % 3 == 0) {
                let outline = UIView(frame: square.bounds)
                outline.transform = square.transform
                outline.center = square.center
                
                outline.alpha = 0.5
                outline.backgroundColor = UIColor.clear
                outline.layer.borderColor = square.layer.presentation()?.backgroundColor
                outline.layer.borderWidth = 1.0
                self.view.addSubview(outline)
            }
            
            updateCount += 1
        }*/
    }
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        print("Boundary contact occurred - \(identifier ?? "0" as NSCopying)")
        let collidingView = item as! UIView
        collidingView.backgroundColor = UIColor.yellow
        UIView.animate(withDuration: 0.1) {
            collidingView.backgroundColor = UIColor.gray
        }
        
        if !firstContact {
            firstContact = true
            
            let square = UIView(frame: CGRect(x: 30, y: 0, width: 100, height: 100))
            square.backgroundColor = UIColor.gray
            view.addSubview(square)
            
            collision.addItem(square)
            gravity.addItem(square)
            
            let attach = UIAttachmentBehavior(item: collidingView, attachedTo: square)
            animator.addBehavior(attach)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if snap != nil {
            animator.removeBehavior(snap)
        }
        
        snap = UISnapBehavior(item: square, snapTo: (touches.first?.location(in: view))!)
        animator.addBehavior(snap)
    }
}

