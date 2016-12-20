//
//  SideMenu.swift
//  FoodLa
//
//  Created by Admin on 27/10/16.
//  Copyright © 2016 cearsinfotech. All rights reserved.
//

import UIKit

protocol DetailViewControllerDelegate: class {
    func didFinishTask(sender: SideMenu, index : Int)
}

class SideMenuCell: UITableViewCell {
    
    @IBOutlet var lblName : UILabel!
    @IBOutlet var imgIcon : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

class SideMenu: UIViewController , UITableViewDelegate,UITableViewDataSource{

    weak var delegate:DetailViewControllerDelegate?
    
    @IBOutlet var tblMenu : UITableView!
    var ArrMerchantMenu : NSArray = NSArray()
    var ArrMerchantMenuImage : NSArray = NSArray()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.ArrMerchantMenu = ["Recipes","Market", "My Menu","Profile","Cart","History", "Ingredients","About Us"]
       
        self.ArrMerchantMenuImage = ["bg_tab_recipes","bg_tab_market","bg_tab_my_menu","bg_tab_profile","bg_tab_market","bg_tab_recipes","bg_tab_recipes","bg_tab_recipes"]
    }

    override func viewWillAppear(_ animated: Bool)
    {
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.ArrMerchantMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "SideMenuCell"
        var cell: SideMenuCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? SideMenuCell
        if cell == nil {
            tableView.register(UINib(nibName: "SideMenuCell", bundle: nil), forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? SideMenuCell
        }
        cell.lblName.text = ArrMerchantMenu.object(at: indexPath.row) as? String
        cell.imgIcon.image = UIImage(named: ArrMerchantMenuImage.object(at: indexPath.row) as! String)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("You selected cell #\(indexPath.row)!")
        delegate?.didFinishTask(sender: self, index: indexPath.row)
    }
}
