//
//  Market_Controller.swift
//  Blueapron
//
//  Created by Admin on 10/12/16.
//  Copyright © 2016 CS-23. All rights reserved.
//

import UIKit
class MarketCell : UITableViewCell
{
    
}
class Market_Controller: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var navigationView: UIView?
    @IBOutlet weak var searchView: UIView?
    @IBOutlet weak var txt_Search: UITextField?
    @IBOutlet weak var tableView: UIView?
    @IBOutlet weak var tbl_Market: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //  Converted with Swiftify v1.0.6185 - https://objectivec2swift.com/
        self.tbl_Market?.layer.cornerRadius = 5.0
        self.searchView?.layer.cornerRadius = 5.0
        txt_Search?.setValue(UIColor.red, forKeyPath: "_placeholderLabel.textColor")
        
    }

    //  Converted with Swiftify v1.0.6185 - https://objectivec2swift.com/
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
     {
        let cell : MarketCell = self.tbl_Market?.dequeueReusableCell(withIdentifier: "MarketCell", for: indexPath) as! MarketCell
        cell.layer.cornerRadius = 5.0
        return cell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(Int(indexPath.row))")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController!.isNavigationBarHidden = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
