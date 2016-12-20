//
//  Recipe_Tools_Controller.swift
//  Blueapron
//
//  Created by CS-23 on 09/12/16.
//  Copyright © 2016 CS-23. All rights reserved.
//

import UIKit
class tbl_ToolsCell : UITableViewCell{
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var img_Tools: UIImageView!
    @IBOutlet weak var lbl_ToolsName: UILabel!
    @IBOutlet weak var lbl_ToolsCompanyName: UILabel!
    @IBOutlet weak var lbl_Price: UILabel!
    @IBOutlet weak var lbl_Line: UILabel!
}
class Recipe_Tools_Controller: UIViewController,UITableViewDelegate,UITableViewDataSource {

    //MARK: - All IBoutlet's
    @IBOutlet var navigationView : UIView!
    @IBOutlet var lbl_Title : UILabel!
    @IBOutlet var mainView  : UIView!
    @IBOutlet var tbl_Tools : UITableView!

    let tbl_ToolsCellIdentifier = "toolsCell"

    
    override func viewDidLoad() {
        super.viewDidLoad()

        tbl_Tools.register(UINib(nibName: "Tools", bundle: nil), forCellReuseIdentifier: tbl_ToolsCellIdentifier)
        
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
        return 85
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbl_Tools.dequeueReusableCell(withIdentifier: tbl_ToolsCellIdentifier, for: indexPath) as! tbl_ToolsCell
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
        let deatilVC = self.storyboard?.instantiateViewController(withIdentifier: "Tools_Details_Controller") as! Tools_Details_Controller
        self.navigationController?.pushViewController(deatilVC, animated: true)
    }

    
    
    
    
  // MARK: - All IBaction's
    @IBAction func btn_BackClick(_ sender: Any) {
        print("HI.....")
        self.navigationController?.popViewController(animated: true)
    }

    
    
    /*
  

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
