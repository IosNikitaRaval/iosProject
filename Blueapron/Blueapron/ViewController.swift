//
//  ViewController.swift
//  Blueapron
//
//  Created by CS-23 on 09/12/16.
//  Copyright © 2016 CS-23. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - All IBoutlet's
    @IBOutlet var mainView : UIView!
    @IBOutlet var subView : UIView!
    @IBOutlet var img_Logo : UIImageView!
    @IBOutlet var emailView : UIView!
    @IBOutlet var txt_Email : UITextField!
    @IBOutlet var img_Email : UIImageView!
    @IBOutlet var passwordView : UIView!
    @IBOutlet var txt_Password : UITextField!
    @IBOutlet var img_Password : UIImageView!
    @IBOutlet var buttonView : UIView!
    @IBOutlet var btn_Login : UIButton!
    @IBOutlet  var orView: UIView!
    @IBOutlet  var lbl_or: UILabel!
    @IBOutlet var btn_Facebook: UIButton!
    @IBOutlet weak var lbl_FooterString: UILabel!
    
    var dic_Data : NSDictionary = NSDictionary()
    var loginFb : Bool = Bool()
    var str : NSString = NSString()
    
    
    let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        lbl_or.layer.borderColor = UIColor.white.cgColor
        lbl_or.layer.borderWidth = 0.5
        lbl_or.layer.cornerRadius = lbl_or.frame.size.height / 2
        lbl_or.clipsToBounds = true
        
        btn_Login.layer.borderColor = UIColor.white.cgColor
        btn_Login.layer.borderWidth = 0.5
        btn_Login.layer.cornerRadius = 5.0
        btn_Login.clipsToBounds = true
     // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.isNavigationBarHidden = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - All IBAction's
    
    @IBAction func btn_ForgatePasswordClick(_ sender: UIButton)
    {
        print("Forgot pass click")
    }
    
    @IBAction func btn_SignupClick(_ sender: UIButton)
    {
        let signupVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUp_Controller") as! SignUp_Controller
        self.navigationController?.pushViewController(signupVC, animated: true)
    }
    
    @IBAction func btn_LoginClick(_ sender: UIButton)
    {
        if(self.validate())
        {
            self.loginAPI()
        }
        else
        {
            AppUtilities.sharedInstance.showAlert(title: "AppName", msg: NSLocalizedString("Please Enter Proper Information.", comment: "comm") as NSString)
        }
        
    }
    //MARK: Facebook Integration
    
    @IBAction func btn_FacebookClick(_ sender: Any)
    {
         print("facebook button click")
        fbLoginManager.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if (error == nil){
                let fbloginresult : FBSDKLoginManagerLoginResult = result!
                if fbloginresult.grantedPermissions != nil {
                    if(fbloginresult.grantedPermissions.contains("email"))
                    {
                        self.getFBUserData()
                        self.fbLoginManager.logOut()
                    }
                }
            }
        }
    }
    
    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    self.dic_Data = result as! NSDictionary
                    print(result!)
                    //print(self.dic_Data)
                    self.loginFb = true
                    self.loginAPI()
                }
            })
        }
    }

    //MARK: Login API
    
    func loginAPI()
    {
        let deviceID = "123"
        if (self.loginFb == true)
        {
            
            str = NSString(format: "firstname=%@&lastname=%@&email=%@&password=%@&plateform=ios&deviceid=%@&fbid=%@&profilepic=%@&method=login",dic_Data.value(forKey: "first_name") as! String,dic_Data.value(forKey: "last_name") as! String,dic_Data.value(forKey: "email") as! String,"",deviceID,dic_Data.value(forKey: "id") as! String,"")
            
            print("URL STRING ",str)
            
        }
        else
        {
            str = NSString(format: "firstname=%@&lastname=%@&email=%@&password=%@&plateform=ios&deviceid=%@&fbid=%@&profilepic=%@&method=login","","",self.txt_Email.text!,self.txt_Password.text!,deviceID,"","")
        }
        AppUtilities.sharedInstance.dataTask(request: request, method: "POST", params: str, completion: { (success, object) in
            DispatchQueue.main.async( execute: {
                
                if success
                {
                    print("object ",object!)
                    print("move it to home page")
                    
                    if(object?.value(forKeyPath: "error") as! String == "0")
                    {
                        let Obj = self.storyboard?.instantiateViewController(withIdentifier: "Recipes_Controller") as! Recipes_Controller
                        self.navigationController?.pushViewController(Obj, animated: true)
                    }
                }
                
            })
        })
    }

    //MARK: Validation Function
    func validate() -> Bool
    {
        if(self.txt_Email.text != "" && AppUtilities.sharedInstance.isValidEmail(testStr: self.txt_Email.text!) == true && self.txt_Password.text != "")
        {
            AppUtilities.sharedInstance.drawRedBorderToTextfield(txtField: self.emailView, cornerRadius: 1.0, borderRadius: 1.0)
            
            AppUtilities.sharedInstance.drawRedBorderToTextfield(txtField: self.passwordView, cornerRadius: 1.0, borderRadius: 1.0)
            return true
        }
        else
        {
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

}

