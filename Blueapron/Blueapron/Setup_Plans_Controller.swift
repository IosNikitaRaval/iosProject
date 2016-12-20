//
//  Setup_Plans_Controller.swift
//  Blueapron
//
//  Created by CS-23 on 09/12/16.
//  Copyright © 2016 CS-23. All rights reserved.
//

import UIKit
class tbl_SetupPlanCell : UITableViewCell{
    
    @IBOutlet var mainView : UIView!
    @IBOutlet var lbl_planName : UILabel!
    @IBOutlet var btn_CheckBox : UIButton!
    @IBOutlet var lbl_familyDetail : UILabel!
    @IBOutlet var lbl_week : UILabel!
    @IBOutlet var lbl_serving : UILabel!
    @IBOutlet var lbl_total : UILabel!
    @IBOutlet var lbl_weekValue : UILabel!
    @IBOutlet var lbl_servingValue : UILabel!
    @IBOutlet var lbl_totalValue : UILabel!
    //@IBOutlet var btn_CheckBox : UIButton!

    //var isSelect : Bool
    
    }
class Setup_Plans_Controller: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet var navigationView : UIView!
    @IBOutlet var lbl_Title : UILabel!
    @IBOutlet var mainView  : UIView!
    @IBOutlet var tbl_SetupPlan : UITableView!
    
    let tbl_SetupPlanCellIdentifier = "setupPlanCell"

    @IBOutlet weak var lbl_SelectPlanTitle: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - TableView Code
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbl_SetupPlan.dequeueReusableCell(withIdentifier: tbl_SetupPlanCellIdentifier, for: indexPath) as! tbl_SetupPlanCell
        
        cell.layer.cornerRadius = 5.0
        
        cell.btn_CheckBox.addTarget(self, action: #selector(Select_Preference_Controller.btn_CheckBoxClick(_:)), for: UIControlEvents.touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }

    
    
    
    // MARK: - All IBaction's
    @IBAction func btn_CancleClick(_ sender: UIButton) {
        print("hi....")
    }
    @IBAction func btn_RightClick(_ sender: UIButton) {
        print("hi....")
    }
     func btn_CheckBoxClick(_ sender: UIButton) {
        
        if sender.isSelected
        {
            sender.isSelected = false
            print("UnChecked")
        }
        else
        {
            sender.isSelected = true
            print("Checked")
        }
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
