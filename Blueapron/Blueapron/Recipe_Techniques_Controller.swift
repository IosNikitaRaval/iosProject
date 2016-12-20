//
//  Recipe_Techniques_Controller.swift
//  Blueapron
//
//  Created by CS-23 on 09/12/16.
//  Copyright © 2016 CS-23. All rights reserved.
//

import UIKit

class tbl_RecipeCell : UITableViewCell{
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var img_Recipe: UIImageView!
    @IBOutlet weak var lbl_RecipeTitle: UILabel!
    @IBOutlet weak var lbl_RecipeDetail: UILabel!
    @IBOutlet weak var lbl_line: UILabel!
    
}

class Recipe_Techniques_Controller: UIViewController,UITableViewDelegate,UITableViewDataSource {

    //MARK: - All IBoutlet's
    @IBOutlet var navigationView : UIView!
    @IBOutlet var lbl_Title : UILabel!
    @IBOutlet var mainView  : UIView!
    @IBOutlet var tbl_Techniques : UITableView!
    
    let tbl_TechniquesCellIdentifier = "ingredientsCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tbl_Techniques.register(UINib(nibName: "Ingredients_Techniques_Cell", bundle: nil), forCellReuseIdentifier: tbl_TechniquesCellIdentifier)
        
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
        let cell = tbl_Techniques.dequeueReusableCell(withIdentifier: tbl_TechniquesCellIdentifier, for: indexPath) as! tbl_RecipeCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let deatilVC = self.storyboard?.instantiateViewController(withIdentifier: "Techniques_Details_Controller") as! Techniques_Details_Controller
        self.navigationController?.pushViewController(deatilVC, animated: true)
    }
    
  // MARK: - All IBAction's
    
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
