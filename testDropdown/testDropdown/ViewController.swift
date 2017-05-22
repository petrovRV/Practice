//
//  ViewController.swift
//  testDropdown
//
//  Created by Yulminator on 5/16/17.
//  Copyright © 2017 YuraPetrov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var inputLanguageView: [UIView]! {
        didSet {
            inputLanguageView.forEach{ $0.isHidden = true }
        }
    }
    
    @IBOutlet weak var inputFirstOutlet: UIButton!
    @IBOutlet weak var inputSecondOutlet: UIButton!
    @IBOutlet weak var inputThirdOutlet: UIButton!
    @IBOutlet weak var inputFourthOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func inputFirstAction(_ sender: Any) {
        hideButtons()
    }
    
    @IBAction func inputSecondAction(_ sender: Any) {
        swapTextButton(btn1: inputFirstOutlet, btn2: inputSecondOutlet)
        hideButtons()
    }
    
    @IBAction func inputThirdAction(_ sender: Any) {
        swapTextButton(btn1: inputFirstOutlet, btn2: inputThirdOutlet)
        hideButtons()
        
    }
    
    @IBAction func inputFourthAction(_ sender: Any) {
        swapTextButton(btn1: inputFirstOutlet, btn2: inputFourthOutlet)
        hideButtons()
    }
    
    func swapTextButton(btn1: UIButton, btn2: UIButton) {
        let tmp = btn1.titleLabel?.text
        btn1.titleLabel?.text = btn2.titleLabel?.text
        btn2.titleLabel?.text = tmp
    }
    
    func hideButtons() {
        UIView.animate(withDuration: 0.3) {
            self.inputLanguageView.forEach {
                $0.isHidden = !$0.isHidden
            }
        }
    }
}
