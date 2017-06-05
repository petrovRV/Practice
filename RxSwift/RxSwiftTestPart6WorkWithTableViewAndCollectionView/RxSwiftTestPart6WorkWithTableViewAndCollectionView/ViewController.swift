//
//  ViewController.swift
//  RxSwiftTestPart6WorkWithTableViewAndCollectionView
//
//  Created by Yulminator on 6/2/17.
//  Copyright © 2017 YuraPetrov. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    //Create Observable array elements
    
    let food = Observable.just([
        Food(name: "Kids Burger", flickrID: "kids-burger"),
        Food(name: "Lasanga", flickrID: "lasanga"),
        Food(name: "Sausage", flickrID: "sausage"),
        Food(name: "Vegetables", flickrID: "vegetables")
    ])
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //table
        food.bind(to: tableView.rx.items(cellIdentifier: "Cell")) { row, foods, cell in
            cell.textLabel?.text = foods.name
            cell.detailTextLabel?.text = foods.flickrID
            cell.imageView?.image = foods.image
        }.addDisposableTo(disposeBag)
        
        tableView.rx.modelSelected(Food.self).subscribe(onNext: {
            print("you selected \($0)")
        }).addDisposableTo(disposeBag)
    }
}
