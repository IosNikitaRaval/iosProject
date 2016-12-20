//
//  SignUp_Controller.swift
//  Blueapron
//
//  Created by CS-23 on 09/12/16.
//  Copyright © 2016 CS-23. All rights reserved.
//

import UIKit

class SignUp_Controller: UIViewController {

    //MARK: - All IBOutlet's
    @IBOutlet var mainView : UIView!
    @IBOutlet var subView : UIView!
    @IBOutlet var centerView : UIView!
    @IBOutlet var img_Logo :UIImageView!
    @IBOutlet var firstnameView  :UIView!
    @IBOutlet var txt_FirstName : UITextField!
    @IBOutlet var img_firstname : UIImageView!
    @IBOutlet var lastnameView  :UIView!
    @IBOutlet var txt_LastName : UITextField!
    @IBOutlet var img_lastname : UIImageView!
    @IBOutlet var emailView  :UIView!
    @IBOutlet var txt_Email : UITextField!
    @IBOutlet var img_email : UIImageView!
    @IBOutlet var passwordView  :UIView!
    @IBOutlet var txt_Password : UITextField!
    @IBOutlet var img_password : UIImageView!
    @IBOutlet weak var btn_sign: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn_sign.layer.borderColor = UIColor.white.cgColor
        btn_sign.layer.borderWidth = 0.5
        btn_sign.layer.cornerRadius = 5.0
        btn_sign.clipsToBounds = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - All IBAction's
     
    @IBAction func btn_SignupClick(_ sender: Any)
    {
        if(vaildationSignup())
        {
            self.signupAPI()
        }
        else
        {
            print("display alert")
            AppUtilities.sharedInstance.showAlert(title: "Title", msg: NSLocalizedString("Please Enter Valid Information.", comment: "comm") as NSString)
        }
    }
 
    @IBAction func btn_CancleClick(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
 
    //MARK: Validation Function
    
    func vaildationSignup() -> Bool
    {
        
        if( self.txt_FirstName.text != "" && self.txt_LastName.text != "" && self.txt_Email.text != "" && AppUtilities.sharedInstance.isValidEmail(testStr: self.txt_Email.text!) == true && self.txt_Password.text != "")
        {
            AppUtilities.sharedInstance.drawRedBorderToTextfield(txtField: self.firstnameView, cornerRadius: 1.0, borderRadius: 1.0)
            AppUtilities.sharedInstance.drawRedBorderToTextfield(txtField: self.lastnameView, cornerRadius: 1.0, borderRadius: 1.0)
            AppUtilities.sharedInstance.drawRedBorderToTextfield(txtField: self.emailView, cornerRadius: 1.0, borderRadius: 1.0)
            AppUtilities.sharedInstance.drawRedBorderToTextfield(txtField: self.passwordView, cornerRadius: 1.0, borderRadius: 1.0)
            
            return true
        }
        else
        {
            if(self.txt_FirstName.text == "")
            {
                AppUtilities.sharedInstance.drawRedBorderToTextfield(txtField: self.firstnameView, cornerRadius: 1.0, borderRadius: 1.0)
                
            }
            else
            {
                AppUtilities.sharedInstance.drawClearBorderToTextfield(txtField: self.firstnameView, cornerRadius: 1.0, borderRadius: 1.0)
                
            }
            if(self.txt_LastName.text == "")
            {
                 AppUtilities.sharedInstance.drawRedBorderToTextfield(txtField: self.lastnameView, cornerRadius: 1.0, borderRadius: 1.0)
            }
            else
            {
                 AppUtilities.sharedInstance.drawClearBorderToTextfield(txtField: self.lastnameView, cornerRadius: 1.0, borderRadius: 1.0)
            }
            
            if(self.txt_Email.text == "")
            {
               AppUtilities.sharedInstance.drawRedBorderToTextfield(txtField: self.emailView, cornerRadius: 1.0, borderRadius: 1.0)
            }
            else if(AppUtilities.sharedInstance.isValidEmail(testStr: self.txt_Email.text!) == false)
            {
                AppUtilities.sharedInstance.drawRedBorderToTextfield(txtField: self.emailView, cornerRadius: 1.0, borderRadius: 1.0)
            }
            else
            {
                AppUtilities.sharedInstance.drawClearBorderToTextfield(txtField: self.emailView, cornerRadius: 1.0, borderRadius: 1.0)
            }
            
            if(self.txt_Password.text == "")
            {
               AppUtilities.sharedInstance.drawRedBorderToTextfield(txtField: self.passwordView, cornerRadius: 1.0, borderRadius: 1.0)
            }
            else
            {
                 AppUtilities.sharedInstance.drawClearBorderToTextfield(txtField: self.passwordView, cornerRadius: 1.0, borderRadius: 1.0)
            }
            
        }
        return false
    }
    
    //MARK: Signup API
    
    func signupAPI()
    {
        let deviceID = "123"
        let str = NSString(format: "firstname=%@&lastname=%@&email=%@&password=%@&plateform=%@&deviceid=%@&profilepic=%@&method=signup", self.txt_FirstName.text!,self.txt_LastName.text!,self.txt_Email.text!,self.txt_Password.text!,"ios",deviceID,"")
        
        AppUtilities.sharedInstance.dataTask(request: request, method: "POST", params: str, completion: { (success, object) in
            DispatchQueue.main.async(execute: { () -> Void in
                if success
                {
                    print("object of signup",object)
                    
                    if let object = object
                    {
                        print("resonse of signup",object)
                        
                        if(object.value(forKeyPath: "error") as! String == "0")
                        {
                            AppUtilities.sharedInstance.showAlert(title: "Title", msg: NSLocalizedString("Signup Succesfully", comment: "comm") as NSString)
                        }
                    }
                }
                else
                {
                    
                }
            })
        })
    }
    

    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
