//
//  MyMenu_Controller.swift
//  Blueapron
//
//  Created by Admin on 10/12/16.
//  Copyright © 2016 CS-23. All rights reserved.
//

import UIKit

class MyMenu_Cell : UITableViewCell
{
    @IBOutlet var mainView : UIView!
    @IBOutlet var img_Food : UIImageView!
    @IBOutlet var lbl_FoodName : UILabel!
    @IBOutlet var lbl_subFoodName : UILabel!

}
class MyMenu_Controller: UIViewController , UITableViewDataSource,UITableViewDelegate{

    @IBOutlet weak var lbl_Title: UILabel?
    @IBOutlet weak var lbl_DeliveryDate: UILabel?
    @IBOutlet weak var btn_ChangeMyMenu: UIButton?
    @IBOutlet weak var btn_SkipDelivery: UIButton?
    @IBOutlet weak var tbl_Menu: UITableView?
    @IBOutlet weak var img_tabIcon: UITabBarItem?
    @IBOutlet weak var btn_check: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
            super.viewDidLoad()
            self.tbl_Menu?.layer.cornerRadius = 5.0
        
            let string = NSMutableAttributedString(string: "skip this delivery")
            string.addAttribute(NSForegroundColorAttributeName, value: UIColor.red, range: NSRange(location: 0, length: 18))
            //TextColor
            string.addAttribute(NSUnderlineStyleAttributeName, value: 1, range: NSRange(location: 0, length: 18))
            //Underline color
            string.addAttribute(NSUnderlineColorAttributeName, value: UIColor.red, range: NSRange(location: 0, length: 18))
        
            //TextColor
            btn_SkipDelivery?.setAttributedTitle(string, for: .normal)
            let string1 = NSMutableAttributedString(string: "change my menu")
            string1.addAttribute(NSForegroundColorAttributeName, value: UIColor.red, range: NSRange(location: 0, length: 14))
            //TextColor
            string1.addAttribute(NSUnderlineStyleAttributeName, value: 1, range: NSRange(location: 0, length: 14))
    }

    //  MARK: UITableview Data source & delegate
    
    override func viewWillAppear(_ animated: Bool)
    {
        self.navigationController!.isNavigationBarHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
     {
        return 5
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
     {
        return 200
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : MyMenu_Cell = self.tbl_Menu?.dequeueReusableCell(withIdentifier: "MyMenu_Cell", for: indexPath) as! MyMenu_Cell
        cell.layer.cornerRadius = 5.0
        return cell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("\(Int(indexPath.row))")
    }
    
    @IBAction func btn_MenuClick(_ sender: UIButton) {
    }
    
    @IBAction func btn_ChangeMyMenuClick(_ sender: UIButton) {
    }
    
    @IBAction func btn_SkipDeliveryClick(_ sender: UIButton) {
    }
    
    @IBAction func btn_DeliveryCheck(_ sender: UIButton) {
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
