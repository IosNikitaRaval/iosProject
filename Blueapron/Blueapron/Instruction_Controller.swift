//
//  Instruction_Controller.swift
//  Blueapron
//
//  Created by CS-23 on 09/12/16.
//  Copyright © 2016 CS-23. All rights reserved.
//

import UIKit
class mainCollectionViewCell : UICollectionViewCell{
    @IBOutlet var mainView : UIView!
    @IBOutlet var lbl_instructionTitle  :UILabel!
    @IBOutlet var img_instruction : UIImageView!
    @IBOutlet var txt_instructionDetail : UITextView!
    

}

class Instruction_Controller: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    //MARK: - All IBoutlet's
    
    @IBOutlet var naviagtionView : UIView!
    @IBOutlet var lbl_title : UILabel!
    @IBOutlet var lbl_SliderNo : UILabel!
    @IBOutlet var mainView : UIView!
    @IBOutlet var mainCollectionView : UICollectionView!
    @IBOutlet var pagerView : UIView!
    @IBOutlet var mainPager :UIPageControl!
    
    let mainCollectionViewCellIdentifier = "mainCell"
    var lastItemIndex : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        mainPager.numberOfPages = 6;
        mainView.layer.cornerRadius = 5;
        mainView.layer.masksToBounds = true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK : - CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : mainCollectionViewCell = (mainCollectionView.dequeueReusableCell(withReuseIdentifier: mainCollectionViewCellIdentifier, for: indexPath) as! mainCollectionViewCell)
     
        cell.layer.cornerRadius = 8.0
        
        lbl_SliderNo.text = NSString(format: "%ld / 6", indexPath.row + 1) as String
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        print("CGSize value",CGSize(width : self.view.frame.size.width , height : self.view.frame.size.height))
        
        return CGSize(width : self.mainCollectionView.frame.size.width , height : self.view.frame.size.height)
    }
    
//    @objc(collectionView:didEndDisplayingCell:forItemAtIndexPath:) func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath)
//    {
//        print("current page ",mainPager.currentPage)
//        
//        lastItemIndex = mainPager.currentPage
//        print("last index","\(lastItemIndex)")
//    }
    
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        for cell: UICollectionViewCell in mainCollectionView.visibleCells {
            var indexPath = mainCollectionView.indexPath(for: cell)!
            print("index path in scrollViewDidEndScrollingAnimation",indexPath.row)
            mainPager.currentPage = indexPath.row
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        for cell: UICollectionViewCell in mainCollectionView.visibleCells {
            
           
            var indexPath = mainCollectionView.indexPath(for: cell)!
              print("index path in scrollViewDidEndDecelerating",indexPath.row)
            mainPager.currentPage = indexPath.row
        }
    }
    
     // MARK: - All IBaction's

    @IBAction func btn_backClick(_ sender: Any)
    {
       self.navigationController?.popViewController(animated: true)
    }
   
    @IBAction func btn_RightClick(_ sender: Any)
    {
       
//        if lastItemIndex < 6 - 1 {
//            lastItemIndex += 1
//            let indexPath = IndexPath(item: lastItemIndex, section: 0)
//            mainCollectionView.scrollToItem(at: indexPath, at: .right, animated: true)
//        }

    }
    @IBAction func btn_LeftClick(_ sender: Any)
    {
//        print("hi...")
//        lastItemIndex -= 1
//        if lastItemIndex == -1 {
//            lastItemIndex = 0
//            let indexPath = IndexPath(item: lastItemIndex, section: 0)
//            mainCollectionView.scrollToItem(at: indexPath, at: .left, animated: true)
//        }
//        else {
//            let indexPath = IndexPath(item: lastItemIndex, section: 0)
//            mainCollectionView.scrollToItem(at: indexPath, at: .left, animated: true)
//            //selectItem(at: indexPath, animated: true, scrollPosition: .left)
//        }
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
