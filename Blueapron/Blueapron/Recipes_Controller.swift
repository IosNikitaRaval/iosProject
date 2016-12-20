//
//  Recipes_Controller.swift
//  Blueapron
//
//  Created by Admin on 10/12/16.
//  Copyright © 2016 CS-23. All rights reserved.
//

import UIKit

class cellRecipe : UITableViewCell
{
    @IBOutlet var backView : UIView!
    @IBOutlet var img_food : UIImageView!
    @IBOutlet var lbl_rec_name : UILabel!
    @IBOutlet var lbl_rec_detail : UILabel!
    @IBOutlet var sub_view : UIView!
    @IBOutlet var lbl_del : UILabel!
    @IBOutlet var buttonDeliverView : UIView!
    @IBOutlet var btnCart : UIButton!
    
    
}

class Recipes_Controller: BaseViewController , UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var navigationView: UIView?
    
    @IBOutlet weak var searchView: UIView?
    @IBOutlet weak var txt_Search: UITextField?
    @IBOutlet weak var tableView: UIView?
    @IBOutlet weak var tbl_Recipes: UITableView?
    @IBOutlet weak var tempView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.tempView?.isHidden = true
        self.tbl_Recipes?.backgroundColor = UIColor.clear
    }

    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.isNavigationBarHidden = true
    }
   
  
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 226
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
     {
        
        let cell : cellRecipe = self.tbl_Recipes?.dequeueReusableCell(withIdentifier: "cellRecipe", for: indexPath) as! cellRecipe
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        //cell.contentView.backgroundColor = UIColor.clear
        cell.layer.cornerRadius = 8.0
        cell.backView.clipsToBounds = true
        cell.backView.layer.shadowOpacity=0.6
        cell.backView.layer.shadowOffset = CGSize(width: 0.3, height: 0.3)
        cell.backView.layer.shadowColor = UIColor.blue.cgColor
        cell.backView.layer.cornerRadius = 8.0
        
        cell.buttonDeliverView.layer.cornerRadius = 15.0
        cell.buttonDeliverView.clipsToBounds = true
        
        cell.btnCart.layer.cornerRadius = (cell.btnCart.frame.size.width/2)
        cell.btnCart.clipsToBounds = true
        
        return cell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(Int(indexPath.row))")
        let recDetail = self.storyboard?.instantiateViewController(withIdentifier:"Details_Controller" ) as! Details_Controller
        self.navigationController?.pushViewController(recDetail, animated: true)
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
