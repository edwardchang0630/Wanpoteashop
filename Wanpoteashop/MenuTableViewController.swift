//
//  MenuTableViewController.swift
//  Wanpoteashop
//
//  Created by Yuan-Che Chang on 2020/9/9.
//  Copyright © 2020 Yuan-Che Chang. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    
    var menu = [Menu]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuList()
        
        }
        
       
    
    func menuList(){
        //取得plist 資料
        
        let url = Bundle.main.url(forResource: "Menu", withExtension: "plist")!
        print(url)
        if let data = try? Data(contentsOf: url),
           let menuItem = try? PropertyListDecoder().decode([Menu]?.self, from: data){
           menu = menuItem
           print(menu)
        }else {
            print("nil")
        }

    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menu.count    }
    
    
    
    //得到要顯⽰的cell ,可從參數 indexPath 得到 section & row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(MenuTableViewCell.self)", for: indexPath) as? MenuTableViewCell else { return MenuTableViewCell() }
        
        // Configure the cell...
        
        //去Menu.plist拿資料下來
        
        
        let menuCell = menu[indexPath.row]
        
        cell.nameLabel?.text = menuCell.name
        cell.infoLabel?.text = menuCell.info
        
        if let image = UIImage(named: menuCell.name) {
            cell.drinkImageView.image = image
        }else{
            cell.drinkImageView.image = UIImage(named: "萬波")
        }
        
        
        
        
        
        
        return cell
    }
    
    
    
    
     override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ListTableViewController = self.storyboard?.instantiateViewController(withIdentifier: "ListTableViewController") as! ListTableViewController
            let menuList = menu[indexPath.row]
            ListTableViewController.menu = menuList
            self.navigationController?.pushViewController(ListTableViewController, animated: true)
    }
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
