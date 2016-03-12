//
//  ViewController.swift
//  ShoppingWishlist
//
//  Created by Tai Nguyen Bui on 30/01/16.
//  Copyright © 2016 Tai Nguyen Bui. All rights reserved.
//

import UIKit
import CoreData

class WishlistViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var products : [Product] = []
    
    var selectedProduct : Product? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        addProduct()
        
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        updateProductsData(context)
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateProductsData(context : NSManagedObjectContext){
        let request =  NSFetchRequest(entityName: "Product")
        var results : [AnyObject]?
        
        do {
            results = try context.executeFetchRequest(request)
        } catch _ {
            results = nil
        }
        
        if(results != nil)
        {
            self.products = results as! [Product]
        }
    }
    
    func addProduct(){
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        let product = NSEntityDescription.insertNewObjectForEntityForName("Product", inManagedObjectContext: context) as! Product
        
        product.title = "Nike Roshe"
        product.shop = "Footlocker"
        product.image = UIImageJPEGRepresentation(UIImage(named: "nike-roshe.jpg")!, 1)
        product.reference = "NR001"
        
        // not found
        do {
            try context.save()
        } catch _ {
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let product = self.products[indexPath.row]
        cell.textLabel!.text = product.title
        cell.imageView!.image = UIImage(data: product.image!)
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.selectedProduct = self.products[indexPath.row]
        self.performSegueWithIdentifier("tableViewToDetailsSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "tableViewToDetailsSegue")
        {
            let productDetailsVC = segue.destinationViewController as! ProductDetailsViewController
            productDetailsVC.product = self.selectedProduct
        }
    }

}

