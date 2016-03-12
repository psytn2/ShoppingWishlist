//
//  AddProductViewController.swift
//  ShoppingWishlist
//
//  Created by Tai Nguyen Bui on 12/03/16.
//  Copyright © 2016 Tai Nguyen Bui. All rights reserved.
//

import UIKit

class AddProductViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func cancelTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion:  nil)
    }
    
    @IBAction func saveTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion:  nil)
    }
}
