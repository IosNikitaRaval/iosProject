//
//  Details_Controller.swift
//  Blueapron
//
//  Created by Admin on 10/12/16.
//  Copyright © 2016 CS-23. All rights reserved.
//

import UIKit

class Details_Controller: UIViewController {

    @IBOutlet weak var navigationView: UIView?
    @IBOutlet weak var lbl_title: UILabel?
    @IBOutlet weak var btn_menuClick: UIButton?
    @IBOutlet weak var mainView: UIView?
    @IBOutlet weak var subMainView: UIView?
    @IBOutlet weak var img_Recipes: UIImageView?
    @IBOutlet weak var nameView: UIView?
    @IBOutlet weak var lbl_RecipesName: UILabel?
    @IBOutlet weak var lbl_RecipesDetail: UILabel?
    @IBOutlet weak var lbl_line: UILabel?
    @IBOutlet weak var drView: UIView?
    @IBOutlet weak var cooktimView: UIView?
    @IBOutlet weak var lbl_Cook: UILabel?
    @IBOutlet weak var lbl_FcookTimes: UILabel?
    @IBOutlet weak var makesView: UIView?
    @IBOutlet weak var lbl_makes: UILabel?
    @IBOutlet weak var lbl_Fmakes: UILabel?
    @IBOutlet weak var nutritionView: UIView?
    @IBOutlet weak var lbl_nutrition: UILabel?
    @IBOutlet weak var lbl_Fnutrition: UILabel?
    @IBOutlet weak var lbl_line2: UILabel?
    @IBOutlet weak var detailView: UIView?
    @IBOutlet weak var lbl_Detail: UILabel?
    @IBOutlet weak var buttonView: UIView?
    @IBOutlet weak var buttonView1: UIView?
    @IBOutlet weak var buttonView1_1: UIView?
    @IBOutlet weak var img_tips: UIImageView?
    @IBOutlet weak var buttonView1_2: UIView?
    @IBOutlet weak var img_tools: UIImageView?
    @IBOutlet weak var buttonView2: UIView?
    @IBOutlet weak var buttonview2_1: UIView?
    @IBOutlet weak var img_ingredients: UIImageView?
    @IBOutlet weak var btn_ingredientsClick: UIButton?
    @IBOutlet weak var buttonView2_2: UIView?
    @IBOutlet weak var img_instruction: UIImageView?
    @IBOutlet weak var btn_instructionClick: UIButton?
    @IBOutlet weak var deliverView: UIView?
    
    @IBOutlet var btnDeliver : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //  Converted with Swiftify v1.0.6185 - https://objectivec2swift.com/
        self.subMainView?.layer.cornerRadius = 5.0
        self.subMainView?.layer.masksToBounds = true
        self.buttonView1_1?.layer.borderColor = UIColor(red: 254/255, green: 99/255, blue: 1/255, alpha: 1.0).cgColor
        self.buttonView1_1?.layer.borderWidth = 1
        self.buttonView1_1?.layer.cornerRadius = 5.0
        self.buttonView1_1?.clipsToBounds = true
        self.buttonView1_2?.layer.borderColor = UIColor(red: 254/255, green: 99/255, blue: 1/255, alpha: 1.0).cgColor

        self.buttonView1_2?.layer.borderWidth = 1
        self.buttonView1_2?.layer.cornerRadius = 5.0
        self.buttonView1_2?.clipsToBounds = true
        self.buttonview2_1?.layer.borderColor = UIColor(red: 254/255, green: 99/255, blue: 1/255, alpha: 1.0).cgColor

        self.buttonview2_1?.layer.borderWidth = 1
        self.buttonview2_1?.layer.cornerRadius = 5.0
        self.buttonview2_1?.clipsToBounds = true
        self.buttonView2_2?.layer.borderColor = UIColor(red: 254/255, green: 99/255, blue: 1/255, alpha: 1.0).cgColor

        self.buttonView2_2?.layer.borderWidth = 1
        self.buttonView2_2?.layer.cornerRadius = 5.0
        self.buttonView2_2?.clipsToBounds = true
        self.deliverView?.layer.cornerRadius = (deliverView?.frame.size.height)! / 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnTechnich_click(sender : UIButton)
    {
        let techVC = self.storyboard?.instantiateViewController(withIdentifier: "Recipe_Techniques_Controller") as! Recipe_Techniques_Controller
        self.navigationController?.pushViewController(techVC, animated: true)
    }
    
    @IBAction func btnIngredient_click(sender : UIButton)
    {
        let techVC = self.storyboard?.instantiateViewController(withIdentifier: "Recipe_Ingredients_Controller") as! Recipe_Ingredients_Controller
        self.navigationController?.pushViewController(techVC, animated: true)
    }
    
    @IBAction func btnTools_click(sender : UIButton)
    {
        let techVC = self.storyboard?.instantiateViewController(withIdentifier: "Recipe_Tools_Controller") as! Recipe_Tools_Controller
        self.navigationController?.pushViewController(techVC, animated: true)
    }
    
    @IBAction func btnInst_click(sender : UIButton)
    {
        let techVC = self.storyboard?.instantiateViewController(withIdentifier: "Instruction_Controller") as! Instruction_Controller
        self.navigationController?.pushViewController(techVC, animated: true)
    }
    
    @IBAction func btnBackClick(sender : UIButton)
    {
        self.navigationController?.popViewController(animated: true)
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
