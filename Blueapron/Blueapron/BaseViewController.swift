//
//  BaseViewController.swift
//  FoodLa
//
//  Created by Admin on 27/10/16.
//  Copyright © 2016 cearsinfotech. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController, UIAlertViewDelegate {
    
    @IBOutlet var menuView : UIView!
    
    var view1: SideMenu!
    
    var isMenuView : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view1 = SideMenu(nibName: "SideMenu", bundle: nil)
        self.view1.view.backgroundColor = UIColor.clear
        view1.delegate = self
        view1.view.frame = CGRect(x : -self.view.frame.width, y : 64, width : self.view.frame.width, height : self.view.frame.height - 64)
        
        view1.view.layer.shadowColor = UIColor.black.cgColor
        view1.view.layer.shadowOpacity = 0.5
        view1.view.layer.shadowRadius = 10
        
        let path = UIBezierPath(rect : CGRect(x : view1.view.frame.width - 80.0,y:  0, width : 20, height : view1.view.frame.height))
        view1.view.layer.shadowPath = path.cgPath
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: Selector(
            ("respondToSwipeGesture1:")))
            //UISwipeGestureRecognizer(target: self, action: #selector(BaseViewController.respondToSwipeGesture1(_:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view1.view.addGestureRecognizer(swipeLeft)
    }
    
    func respondToSwipeGesture1(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                print("Swiped Right")
                self.SwipeShowView(sender: nil)
            case UISwipeGestureRecognizerDirection.down:
                print("Swiped down")
            case UISwipeGestureRecognizerDirection.left:
                print("Swiped left")
                self.SwipeHideView(sender: nil)
            case UISwipeGestureRecognizerDirection.up:
                print("Swiped up")
            default:
                break
            }
        }
    }

    
    @IBAction func loadView(sender : AnyObject!)
    {
        self.view.endEditing(true)
        if isMenuView {
            UIView.animate(withDuration: 0.3, animations: {
                
                self.isMenuView = false
                self.view1.view.frame = CGRect(x : -self.view.frame.width, y : 64,width : self.view.frame.width, height :self.view.frame.height - 64 )
            }) { (finished) in
                
                self.view1.view.removeFromSuperview()
            }
        }
        else
        {
            UIView.animate(withDuration: 0.3, animations: {
                
                self.isMenuView = true
                self.view1.view.frame = CGRect(x : 0, y : 64,width : self.view.frame.width, height : self.view.frame.height - 64 )
                self.view.addSubview(self.view1.view)
            }) { (finished) in
                
            }
        }
    }
    
    @IBAction func SwipeHideView(sender : AnyObject!)
    {
        if isMenuView {
            UIView.animate(withDuration: 0.3, animations: {
                
                self.isMenuView = false
                self.view1.view.frame = CGRect(x : self.view.frame.width, y : 64, width : self.view.frame.width, height : self.view.frame.height - 64 )
            }) { (finished) in
                
                self.view1.view.removeFromSuperview()
            }
        }
    }
    
    @IBAction func SwipeShowView(sender : AnyObject!)
    {
        if !isMenuView {
            UIView.animate(withDuration: 0.3, animations: {
                
                self.isMenuView = true
                self.view1.view.frame = CGRect( x : 0, y : 64, width : self.view.frame.width, height : self.view.frame.height - 64 )
                self.view.addSubview(self.view1.view)
            }) { (finished) in
                
            }
        }
    }
}

extension BaseViewController: DetailViewControllerDelegate {
    func didFinishTask(sender: SideMenu, index : Int) {
        if isMenuView {
            UIView.animate(withDuration: 0.3, animations: {
                
                self.isMenuView = false
                self.view1.view.frame = CGRect(x : self.view.frame.width, y : 64, width : self.view.frame.width,height : self.view.frame.height - 64)
            }) { (finished) in
                
                self.view1.view.removeFromSuperview()
                
//                if(UserDict["accounttype"] as! String == "2")
//                {
                    if index == 0 {
//                        let Obj = self.storyboard?.instantiateViewControllerWithIdentifier("HomeViewController") as! HomeViewController
//                        self.navigationController?.pushViewController(Obj, animated: false)
                    }
                    else if index == 1
                    {
//                        let Obj = self.storyboard?.instantiateViewControllerWithIdentifier("ComissionDetailViewController") as! ComissionDetailViewController
//                        self.navigationController?.pushViewController(Obj, animated: false)
                    }
                    else if index == 2
                    {
//                        let Obj = self.storyboard?.instantiateViewControllerWithIdentifier("ProductViewController") as! ProductViewController
//
//                        self.navigationController?.pushViewController(Obj, animated: false)
                    }
                }
        }
    }
    
    func alertView(View: UIAlertView, clickedButtonAtIndex buttonIndex: Int){
        switch buttonIndex{
        case 1:
            
            break;
        case 0:
            break;
        default:
            NSLog("Default");
            break;
        }
    }
}
