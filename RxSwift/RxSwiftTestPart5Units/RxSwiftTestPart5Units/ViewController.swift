//
//  ViewController.swift
//  RxSwiftTestPart5Units
//
//  Created by Yulminator on 6/2/17.
//  Copyright © 2017 YuraPetrov. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var slide: UISlider!
    
    let disposeBag = DisposeBag()
    let txtFieldText = Variable("")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }
}

