//
//  Techniques_Details_Controller.swift
//  Blueapron
//
//  Created by CS-23 on 09/12/16.
//  Copyright © 2016 CS-23. All rights reserved.
//

extension String
{
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        
        return boundingBox.height
    }
}

import UIKit
class tbl_TechniquesDetailsCell : UITableViewCell{
   
    @IBOutlet  var mainView: UIView!
    @IBOutlet  var img_Techniques: UIImageView!
    @IBOutlet  var lbl_TechniquesName: UILabel!
    @IBOutlet  var lbl_TechniquesDetail: UILabel!
}

class Techniques_Details_Controller: UIViewController,UITableViewDelegate,UITableViewDataSource {
    //MARK: - All IBoutlet's
    @IBOutlet var navigationView : UIView!
    @IBOutlet var lbl_Title : UILabel!
    @IBOutlet var mainView  : UIView!
    @IBOutlet var tbl_TechniquesDetails : UITableView!
    
    let tbl_TechniquesDetailsCellIdentifier = "techniquesDetailCell"
    var textOfDetail : String = ""
    var widthofCellDetail : Double = 0.0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.textOfDetail = "1 Cook and drain pasta as directed on package.Meanwhile, in large skillet,cook sausage over medium heat stirring frequently, until browned. Drain; return to skillet Add tomatoes, cream and drained pasta to sausage; stir gently to mix.1 Cook and drain pasta as directed on package.Meanwhile, in large skillet,cook sausage over medium heat stirring frequently, until browned. Drain; return to skillet Add tomatoes, cream and drained pasta to sausage; stir gently to mix."
        
        tbl_TechniquesDetails.register(UINib(nibName: "TechniquesDetail", bundle: nil), forCellReuseIdentifier: tbl_TechniquesDetailsCellIdentifier)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - TableView Code
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
      //  let cell :  tbl_TechniquesDetailsCell = self.tbl_TechniquesDetails.cellForRow(at: indexPath) as! tbl_TechniquesDetailsCell
         return (self.textOfDetail.heightWithConstrainedWidth(width: self.tbl_TechniquesDetails.frame.size.width, font: UIFont.systemFont(ofSize: 13.0)) + 240)
        
        //return 350
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbl_TechniquesDetails.dequeueReusableCell(withIdentifier: tbl_TechniquesDetailsCellIdentifier, for: indexPath) as! tbl_TechniquesDetailsCell
        cell.lbl_TechniquesDetail.text = self.textOfDetail
        cell.layer.cornerRadius = 5.0
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }

    
    // MARK: - All IBaction's
    @IBAction func btn_BackClick(_ sender: Any)
    {
        print("HI.....")
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
