//
//  Select_Preference_Controller.swift
//  Blueapron
//
//  Created by CS-23 on 09/12/16.
//  Copyright © 2016 CS-23. All rights reserved.
//

import UIKit
class tbl_SelectPreferenecCell : UITableViewCell
{
    @IBOutlet var lbl_PreferenecName : UILabel!
    @IBOutlet var img_Preferenec : UIImageView!
    @IBOutlet var btn_CheckBox : UIButton!
}


class Select_Preference_Controller: UIViewController,UITableViewDataSource,UITableViewDelegate {

    //MARK: - All IBoutlet's
    @IBOutlet var naviagtionView : UIView!
    @IBOutlet var lbl_Title : UILabel!
    @IBOutlet var mainView : UIView!
    @IBOutlet var tbl_SelectPreferenec : UITableView!
    
    var nameArray :NSArray = NSArray()
    var imgArray :NSArray = NSArray()
    let tbl_SelectPreferenecCellIdentifier = "selectPreferenceCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        nameArray = ["Beef","Poultry","Pork","Lamb","Fish","ShellFish","I'M A Vegiterian"]
        imgArray = ["Beef","Poultry","Pork","Lamb","Fish","ShellFish","Vegetarian Food"]

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
        
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 415
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbl_SelectPreferenec.dequeueReusableCell(withIdentifier: tbl_SelectPreferenecCellIdentifier, for: indexPath) as! tbl_SelectPreferenecCell
        
        cell.layer.cornerRadius = 5.0
        cell.lbl_PreferenecName.text = nameArray[indexPath.row]as? String
        cell.img_Preferenec.image = UIImage (named: imgArray[indexPath.row] as! String)
        
        cell.btn_CheckBox.addTarget(self, action: #selector(Select_Preference_Controller.btn_CheckBoxClick(_:)), for: UIControlEvents.touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }

    
    
    
    //MARK: - All IBaction's
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
