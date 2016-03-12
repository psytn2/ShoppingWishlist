//
//  ProductDetailsViewController.swift
//  ShoppingWishlist
//
//  Created by Tai Nguyen Bui on 30/01/16.
//  Copyright © 2016 Tai Nguyen Bui. All rights reserved.
//

import UIKit

class ProductDetailsViewController: UIViewController {

    @IBOutlet weak var referenceLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var shopLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var product : Product? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.contentMode = UIViewContentMode.ScaleAspectFit
        
        // Do any additional setup after loading the view.
        self.referenceLabel.text = self.product!.reference
        self.nameLabel.text = self.product!.title
        self.shopLabel.text = self.product!.shop
        self.imageView.image = UIImage(data: self.product!.image!)
    }


}
