//
//  DetailViewController.swift
//  CandySearch
//
//  Created by Andrii Moisol on 8/9/17.
//  Copyright © 2017 Andrii Moisol. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var detailDescriptionLabel: UILabel!
  @IBOutlet weak var candyImageView: UIImageView!
  
  var detailCandy: Candy? {
    didSet {
      configureView()
    }
  }
  
  func configureView() {
    if let detailCandy = detailCandy {
      if let detailDescriptionLabel = detailDescriptionLabel, let candyImageView = candyImageView {
        detailDescriptionLabel.text = detailCandy.name
        candyImageView.image = UIImage(named: detailCandy.name)
        title = detailCandy.category
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureView()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
}

