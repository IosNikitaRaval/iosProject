

//
//  AppUtilities.swift
//  Laundry
//
//  Created by cears infotech on 7/18/16.
//  Copyright © 2016 cears infotech. All rights reserved.
//

import UIKit

class AppUtilities {

    class var sharedInstance :AppUtilities {
        struct Singleton {
            static let instance = AppUtilities()
        }
        
        return Singleton.instance
    }
    
    /*=======================================================
     Function Name: isValidEmail
     Function Param : - String
     Function Return Type : - bool
     Function purpose :- check for valid Email ID
     ========================================================*/
    
    func isValidEmail(testStr:String) -> Bool
    {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testStr)
        return result
    }
    
    /*=======================================================
     Function Name: bottomBoredr
     Function Param : - AnyObject
     Function Return Type : -
     Function purpose :- give bottom border with white color
     ========================================================*/
    
    func bottomBoredr(textField :AnyObject)
    {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: textField.frame.height - 1, width: textField.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.white.cgColor
        textField.layer.addSublayer(bottomLine)
    }
    
    /*=======================================================
     Function Name: bottomBoredrColor
     Function Param : - AnyObject
     Function Return Type : -
     Function purpose :- give bottom border with color code
     ========================================================*/
    
    func bottomBoredrColor(textField :AnyObject)
    {
 
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x : 0, y : textField.frame.height - 1, width : textField.frame.width, height :1.0)
        bottomLine.backgroundColor = UIColor.red.cgColor
        textField.layer.addSublayer(bottomLine)
    }
    
    func drawRedBorderToTextfield(txtField:AnyObject, cornerRadius:CGFloat, borderRadius:CGFloat)
    {
        if #available(iOS 8.0, *) {
            txtField.layer.borderWidth=borderRadius
            txtField.layer.cornerRadius=cornerRadius
            txtField.layer.borderColor=UIColor.red.cgColor
            
        } else {
            // Fallback on earlier versions
        }
    }
    
    func drawClearBorderToTextfield(txtField:AnyObject,cornerRadius:CGFloat, borderRadius:CGFloat)
    {
        if #available(iOS 8.0, *) {
            txtField.layer.borderWidth=borderRadius
            txtField.layer.cornerRadius=cornerRadius
            txtField.layer.borderColor=UIColor.clear.cgColor
        }
    }
    
    /*=======================================================
     Function Name: setPlaceholder
     Function Param : - UITextField, String
     Function Return Type : -
     Function purpose :- set placeholder of white color
     ========================================================*/
    
    func setPlaceholder (textFiled : UITextField , str : String)
    {
        textFiled.attributedPlaceholder = NSAttributedString(string:str,
                                                                    attributes:[NSForegroundColorAttributeName: UIColor.white])
    }
    
    /*=======================================================
     Function Name: setPlaceholderGray
     Function Param : - UITextField,String
     Function Return Type : -
     Function purpose :- set placeholder of gray color
     ========================================================*/
    
    func setPlaceholderGray (textFiled : UITextField , str : String)
    {
        textFiled.attributedPlaceholder = NSAttributedString(string:str,
                                                             attributes:[NSForegroundColorAttributeName: UIColor.gray])
    }
    
    /*=======================================================
     Function Name: dataTask
     Function Param : - URL,Strig,String,Block
     Function Return Type : -
     Function purpose :- Global Class For API Calling.
     ========================================================*/
    
    func dataTask(request: NSMutableURLRequest, method: String,params:NSString, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        
        request.httpMethod = method
        request.httpBody = params.data(using: String.Encoding.utf8.rawValue)
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            if let data = data {
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                if let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode {
                    completion(true, json as AnyObject?)
                } else {
                    completion(false, json as AnyObject?)
                }
            }
            }.resume()
    }
    
    func post(request: NSMutableURLRequest,params:NSString, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        dataTask(request: request, method: "POST", params: params, completion: completion)
        
    }
    func put(request: NSMutableURLRequest,params:NSString, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        dataTask(request: request, method: "PUT", params: params, completion: completion)
        
    }
    func get(request: NSMutableURLRequest,params:NSString, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        dataTask(request: request, method: "GET", params: params, completion: completion)
        
    }
    
    
    /*=======================================================
     Function Name: showAlert
     Function Param : - String
     Function Return Type : -
     Function purpose :- Show Alert With specific Message
     ========================================================*/
    
   func showAlert(title : NSString, msg : NSString)
    {
        let alert = UIAlertView(title: title as String, message: msg as String, delegate: nil, cancelButtonTitle: "OK")
        DispatchQueue.main.async {
            alert.show()
        }
//        DispatchQueue.main.async(execute: { () -> Void in
//            
//            alert.show()
//            }
//        })
    }
}

//TextField Inset//

class MyTextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 45);
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
}
