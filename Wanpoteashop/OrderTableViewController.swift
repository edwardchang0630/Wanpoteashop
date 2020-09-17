//
//  OrderTableViewController.swift
//  Wanpoteashop
//
//  Created by Yuan-Che Chang on 2020/9/10.
//  Copyright © 2020 Yuan-Che Chang. All rights reserved.
//

import UIKit



class OrderTableViewController: UITableViewController {

    @IBOutlet weak var sumLabel: UILabel!
    
    @IBOutlet weak var sumPriceLabel: UILabel!
    var orders = [Order]()
    var totalPrice = 0
    var cups = 0
    
    func sum() -> Void {
        cups = 0
        totalPrice = 0
        
        for i in 0 ..< orders.count{
                   cups += Int(orders[i].quantity)!
               }
       
        sumLabel.text = String(cups)
        
        for i in 0 ..< orders.count {
                   totalPrice += Int(orders[i].price)!
               }
        
        sumPriceLabel.text = String(totalPrice)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
        sum()
    }
    
    
    // MARK: - GET
    func getData(){
        guard let url = URL(string: "https://sheetdb.io/api/v1/ottbe3d7hicnk") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { (retData, response, error) in
            if let retData = retData{
                do{
                    let dic = try JSONDecoder().decode([Order].self, from: retData)
                    
                    self.orders = dic
                    DispatchQueue.main.async {
                        self.sum()
                        self.tableView.reloadData()
                        
                    }
                    
                    
                    print("12345\(self.orders)")
                    
                }catch{
                    print(error)
                }
            }
        }.resume()

    }
   
    // MARK: - DELETE
    
    func deleteData(id:String){
        guard let url = URL(string: "https://sheetdb.io/api/v1/ottbe3d7hicnk/id/\(id)") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { (retData, response, error) in
            if let retData = retData{
                do{
                    let dic = try JSONDecoder().decode([String: Int].self, from: retData)
                    DispatchQueue.main.async {
                        self.sum()
                        self.tableView.reloadData()
                        
                    }
                    print("deleted = ",dic["deleted"] ?? "找不到“deleted“")
                }catch{
                    print(error)
                }
            }
        }.resume()

    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("457899098\(orders.count)")
        return orders.count
    }

    //得到要顯⽰的cell ,可從參數 indexPath 得到 section & row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(OrderTableViewCell.self)", for: indexPath) as? OrderTableViewCell else{
            return OrderTableViewCell()
        }
        let order = orders[indexPath.row]
        
        
        
        
        cell.orderNameLabel?.text = order.orderName
        cell.productNameLabel?.text = order.productName
        cell.sugarLabel?.text = order.sugar
        cell.iceLabel?.text = order.ice
        cell.sizeLabel?.text = order.size
        if order.boba == "TRUE"{
            cell.bobaLabel?.text = "加珍珠"
        }else{
            cell.bobaLabel?.text = ""
        }
        if order.iyu == "TRUE"{
            cell.iyuLabel?.text = "加愛玉"
        }else{
            cell.iyuLabel?.text = ""
        }
        if order.taroball == "TRUE"{
            cell.taroballLabel?.text = "加芋圓"
        }else{
            cell.taroballLabel?.text = ""
        }
        if order.grassjelly == "TRUE"{
            cell.grassjellyLabel?.text = "加仙草"
        }else{
            cell.grassjellyLabel?.text = ""
        }
        if order.pudding == "TRUE"{
            cell.puddingLabel?.text = "加布丁"
        }else{
            cell.puddingLabel?.text = ""
        }
        
        cell.quantityLabel?.text = order.quantity
        cell.priceLabel?.text = order.price
        
       
        
        
          
        
        
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            
            //刪掉網路的
            deleteData(id:orders[indexPath.row].id)
            //刪掉order裡的
            self.orders.remove(at: indexPath.row)
            //刪掉tableview裡的
            tableView.deleteRows(at: [indexPath], with: .fade)
            //重刷資料
            sum()
            tableView.reloadData()
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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
