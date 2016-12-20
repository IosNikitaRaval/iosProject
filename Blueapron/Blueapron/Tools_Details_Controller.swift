//
//  Tools_Details_Controller.swift
//  Blueapron
//
//  Created by CS-23 on 09/12/16.
//  Copyright © 2016 CS-23. All rights reserved.
//

import UIKit


class tbl_ToolsDetailsCell : UITableViewCell{
    @IBOutlet  var mainView: UIView!
    @IBOutlet  var img_ToolsDetails: UIImageView!
    @IBOutlet  var lbl_ToolsName: UILabel!
    @IBOutlet  var lbl_ToolsPrice: UILabel!
    @IBOutlet  var lbl_ToolsDetail: UILabel!
   
    @IBAction func btn_AddToCartClick(_ sender: Any) {
        print("HI...")
    }
    
}
class Tools_Details_Controller: UIViewController,UITableViewDataSource,UITableViewDelegate {
    //MARK: - All IBoutlet's
    @IBOutlet var navigationView : UIView!
    @IBOutlet var lbl_Title : UILabel!
    @IBOutlet var mainView  : UIView!
    @IBOutlet var tbl_ToolsDetails : UITableView!
    
    let tbl_ToolsDetailsCellIdentifier = "toolsDetailCell"
    var textOfDetail : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tbl_ToolsDetails.register(UINib(nibName: "ToolsDetail", bundle: nil), forCellReuseIdentifier: tbl_ToolsDetailsCellIdentifier)

        self.textOfDetail = "1 Cook and drain pasta as directed on package.Meanwhile, in large skillet, cook sausage over medium heat, stirring frequently, until browned. Drain; return to skillet. Add tomatoes, cream and drained pasta to sausage; stir gently to mix.4. Add tomatoes, cream and drained pasta to sausage; stir gently to mix. 5. Add tomatoes, cream and drained pasta to sausage; stir gently to mix.1 Cook and drain pasta as directed on package.Meanwhile, in large skillet, cook sausage over medium heat, stirring frequently, until browned. Drain; return to skillet. Add tomatoes, cream and drained pasta to sausage; stir gently to mix.4. Add tomatoes, cream and drained pasta to sausage; stir gently to mix. 5. Add tomatoes, cream and drained pasta to sausage; stir gently to mix.1 Cook and drain pasta as directed on package.Meanwhile, in large skillet, cook sausage over medium heat, stirring frequently, until browned. Drain; return to skillet. Add tomatoes, cream and drained pasta to sausage; stir gently to mix.4. Add tomatoes, cream and drained pasta to sausage; stir gently to mix. 5. Add tomatoes, cream and drained pasta to sausage; stir gently to mix.1 Cook and drain pasta as directed on package.Meanwhile, in large skillet, cook sausage over medium heat, stirring frequently, until browned. Drain; return to skillet. Add tomatoes, cream and drained pasta to sausage; stir gently to mix.4. Add tomatoes, cream and drained pasta to sausage; stir gently to mix. 5. Add tomatoes, cream and drained pasta to sausage; stir gently to mix."
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return (self.textOfDetail.heightWithConstrainedWidth(width: self.tbl_ToolsDetails.frame.size.width, font: UIFont.systemFont(ofSize: 13.0)) + 290)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbl_ToolsDetails.dequeueReusableCell(withIdentifier: tbl_ToolsDetailsCellIdentifier, for: indexPath) as! tbl_ToolsDetailsCell
        
        cell.layer.cornerRadius = 5.0
        cell.lbl_ToolsDetail.text = self.textOfDetail
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    
    
    // MARK: - All IBaction's
    @IBAction func btn_BackClick(_ sender: Any) {
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
