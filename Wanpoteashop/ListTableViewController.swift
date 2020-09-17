//
//  ListTableViewController.swift
//  Wanpoteashop
//
//  Created by Yuan-Che Chang on 2020/9/10.
//  Copyright © 2020 Yuan-Che Chang. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    var menu : Menu?
   
    @IBOutlet weak var drinkImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var sugarSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var iceButton: UIButton!
    
    @IBOutlet weak var sizeTextField: UITextField!
    
    @IBOutlet weak var bobaSwitch: UISwitch!
    
    @IBOutlet weak var iyuSwitch: UISwitch!
    
    @IBOutlet weak var taroballSwitch: UISwitch!
    
    @IBOutlet weak var grassjellySwitch: UISwitch!
    
    @IBOutlet weak var puddingSwitch: UISwitch!
    
    @IBOutlet weak var cupStepper: UIStepper!
    
    @IBOutlet weak var cupLabel: UILabel!
    
    @IBOutlet weak var amountTextField: UITextField!
    
    @IBOutlet weak var amountLabel: UILabel!
    
    @IBOutlet weak var confirmButton: UIButton!
    
    @IBOutlet weak var priceLabel: UILabel!
    
  
    
    let ices = ["正常冰","少冰","微冰","去冰","溫","熱飲"]
    let amount = ["中杯","大杯"]
    var cupSize = ""
    var price = 0
    var toppingPrice = 0
    var sugar : String = "正常甜"
    
    var cup = 0
    var toppingsArray = [Bool]()
    
    let pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 0...4 {
            toppingsArray.insert(false, at: index)
        }
        //設定最上層標題
        title = menu?.name
        //設定titleLabel
        titleLabel.text = menu?.name
        //設定
        infoLabel.text = menu?.info
        //設定圖片
        if let image = UIImage(named: menu!.name) {
            drinkImageView.image = image
        }else{
            drinkImageView.image = UIImage(named: "萬波")
        }
        
        //預設中杯價格
        sizeTextField.delegate = self
        
        //設定容量的picker view
        createDayPicker()
        toolBar()
        
    }
    
    
    
    @IBAction func sugarButton(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            sugar = "正常甜"
        case 1:
            sugar = "少糖"
        case 2:
            sugar = "半糖"
        case 3:
            sugar = "微糖"
        case 4:
            sugar = "無糖"
        default:
            sugar = "正常甜"
             
        }
        
        
    }
    
    
    
    
    @IBAction func iceButton(_ sender: Any) {
        let controller = UIAlertController(title: "冰塊", message: "請選擇想要的比例", preferredStyle: .actionSheet)
        
        for ice in ices{
            let action = UIAlertAction(title: ice, style: .default) { (action) in
                self.iceButton.setTitle(action.title, for: .normal)
                self.iceButton.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 89/255, alpha: 1), for: .normal)
                self.iceButton.backgroundColor = UIColor(red: 253/255, green: 138/255, blue: 37/255, alpha: 0.5)
            }
            controller.addAction(action)
        }
        
        present(controller, animated: true, completion: nil)
    }
    
    
    
    
    
    @IBAction func amount(_ sender: UIFontPickerViewController) {
        
        if menu?.priceL == 0{
            inputCheck(str: "無大杯")
        }
        
    }
    
    
    
    func addToppings() -> Void {
        var toppingPrice = 0
        var totalPrice = 0
        var cupSizePrice = 0
        
        
        for index in 0...toppingsArray.count-1{
            if toppingsArray[index] && index != 4 {
                
                toppingPrice += 10
            }else if toppingsArray[index] &&  index == 4{
                toppingPrice += 15
            }
            
        }
        
       
        
        if cupSize == "大杯"{
            priceLabel.text = "$" + menu!.priceL.description
            let str = priceLabel.text
            let pri = Int(str!.trimmingCharacters(in:CharacterSet(charactersIn: "$")))
            cupSizePrice = pri!
 
        }else if cupSize == "中杯"{
            priceLabel.text = "$" + menu!.priceM.description
            let str = priceLabel.text
            let pri = Int(str!.trimmingCharacters(in:CharacterSet(charactersIn: "$")))
            cupSizePrice = pri!
        }
        
        
        totalPrice = (cupSizePrice + toppingPrice) * cup
        amountLabel.text = String("$\(totalPrice)")
        if let str = amountLabel.text{
          let pri = Int(str.trimmingCharacters(in:CharacterSet(charactersIn: "$")))
          price = pri!
          
       }
        
        
    }
    
    //控制按下開關後要增加的金額
    @IBAction func bobaSwitch(_ sender: UISwitch) {
        
        self.toppingsArray[0] = sender.isOn
        addToppings()
        
        
    }
    
    
    @IBAction func iyuSwitch(_ sender: UISwitch) {
        
        self.toppingsArray[1] = sender.isOn
        addToppings()
        
    }
    
    
    @IBAction func taroballSwitch(_ sender: UISwitch) {
        self.toppingsArray[2] = sender.isOn
            addToppings()
           
    }
    
    @IBAction func grassjellySwitch(_ sender: UISwitch) {
        self.toppingsArray[3] = sender.isOn
        addToppings()
    }
    @IBAction func puddingSwitch(_ sender: UISwitch) {
        self.toppingsArray[4] = sender.isOn
        addToppings()
    }
    
    @IBAction func cupStepperPressed(_ sender:UIStepper) {
        //        sender.isEnabled
        cupLabel.text = Int(sender.value).description
        
        //設定總價
        
        cup = Int(sender.value)
//        let str = amountPriceLabel.text
//        let pri = str?.trimmingCharacters(in: CharacterSet(charactersIn: "$"))
//        let price2 = Int(pri!)
//        amountLabel.text = "$ \(cup * price2!)"
        
        addToppings()
    }
    
    
    
    
    
    
    
    @IBAction func confirmButton(_ sender: Any) {
        
        guard let userName = nameTextField.text, userName != "" else {
            inputCheck(str: "輸入 訂購人")
            return
        }
        guard sugarSegmentedControl.selectedSegmentIndex == 0 || sugarSegmentedControl.selectedSegmentIndex == 1 ||
            sugarSegmentedControl.selectedSegmentIndex == 2 ||
            sugarSegmentedControl.selectedSegmentIndex == 3 ||
            sugarSegmentedControl.selectedSegmentIndex == 4 else {
                inputCheck(str: "選擇甜度")
                return
        }
        guard let ice = iceButton.currentTitle, ice != "選擇" else {
            inputCheck(str: "選擇 冰塊")
            return
        }
        guard  amountTextField.text == "中杯" || amountTextField.text == "大杯" else {
            inputCheck(str: "選擇 容量")
            return
        }
        guard  cup != 0 else {
            inputCheck(str: "選擇 杯數")
            return
        }
    
        //連線api
                let url = URL(string: "https://sheetdb.io/api/v1/ottbe3d7hicnk")
                var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let id = UUID().uuidString
        let boba = bobaSwitch.isOn.description
        let iyu = iyuSwitch.isOn.description
        let taroball = taroballSwitch.isOn.description
        let grassjelly = grassjellySwitch.isOn.description
        let pudding = puddingSwitch.isOn.description
        let cups = String(cup)
        let newPrice = String(price)
//        let order :Order!
//        order.boba = boba
        let order = Order(id: id, orderName: userName, productName: title!, sugar: sugar, ice: ice, size: cupSize, boba: boba, iyu: iyu, taroball: taroball, grassjelly: grassjelly, pudding: pudding, quantity: cups , price: newPrice)
        let orderData = OrderData(data: order)
       
        let encoder = JSONEncoder()
       
        
        
            //送出
            do {
                let data = try encoder.encode(orderData)
                print(String(decoding: data, as: UTF8.self))
                URLSession.shared.uploadTask(with: request, from: data) { (resdata, response, error) in
                   
                    let decoder = JSONDecoder()
                    
//                    print(String(decoding: resdata!, as: UTF8.self))
                    if let resdata = resdata{
                       
                        //dic是回傳值
                        do{
                            let dic = try?decoder.decode([String:Int].self, from: resdata)
                            if dic!["created"] == 1{
                                print("上傳成功")
                                
                                self.submitSuccess(order: order)
                            }else{
                                print("上傳失敗", dic ?? "")
                                
                            }
                        
                        }
                    }
                }.resume()
            } catch  {
                print(error)
            }
    }
    
    
    //送出成功
    func submitSuccess(order: Order) {
        var boba = ""
        if order.boba == "true" {
            boba = "加珍珠,"
        }
        var iyu = ""
        if order.iyu == "true" {
            iyu = "加愛玉,"
        }
        var taroball = ""
        if order.taroball == "true" {
            taroball = "加芋圓,"
        }
        var grassjelly = ""
        if order.grassjelly == "true" {
            grassjelly = "加仙草,"
        }
        var pudding = ""
        if order.pudding == "true" {
            pudding = "加布丁,"
        }
        
        let controller = UIAlertController(title: "訂購成功", message: "\(order.productName), \(order.size),\(boba)\(iyu)\(taroball)\(grassjelly)\(pudding) \(order.sugar), \(order.ice)", preferredStyle: .alert)
        let okActon = UIAlertAction(title: "OK", style: .default) { (okAction) in
            //前往訂單
            self.navigationController?.popViewController(animated: true)

        }
        controller.addAction(okActon)
        
        DispatchQueue.main.async {
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    
    //欄位檢核
    func inputCheck(str: String){
        
        var title = "輸入不完全"
        var message = "請\(str)"
        if str == "大杯"{
            title = "大杯停售"
            message = "目前全品項不提供大杯，謝謝"
        }else if str == "無大杯"{
            title = "限中杯"
            message = "此品項無提供大杯"
        }
        
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            self.dismissKeyboard()
        }
        
        controller.addAction(okAction)
        
        
        present(controller, animated: true, completion: nil)
    }
    
}






//extends those delegate methods related to pickerView


extension ListTableViewController: UIPickerViewDataSource,UIPickerViewDelegate{
    
    
    
    
    
    //to see how many list u have
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return amount.count
    }
    
    
    //title of row that u wanna the name of every single row to be
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return amount[row]
        
    }
    
    //store the selected size
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let  amounts = amount[row]
        self.cupSize = amount[row]
        amountTextField.text = amounts
        
        if menu!.priceL == 0{
            inputCheck(str: "無大杯")
            amountTextField.text = amount[0]
            
        }
        
    }
    //customize pickerView
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView{
        var label : UILabel
        //unwrapping optional to make sure UILabelnot null and assign uiLabel to that view
        if let view = view as? UILabel{
            label = view
        }else{
            label = UILabel()
        }
        
        label.textColor = .brown
        label.textAlignment = .center
        label.font = UIFont(name: "Menlo-Regular", size: 24)
        //for every row
        label.text = amount[row]
        return label
    }
    
    
    
    func createDayPicker(){
        //因為此行連接
        
        
        pickerView.delegate = self
        //setup the pickerView into size
        amountTextField.inputView = pickerView
        
        //customization
        amountTextField.backgroundColor = UIColor(red: 247/255, green: 196/255, blue: 89/255, alpha:0.5)
        
    }
    
    func toolBar() {
        let toolBar = UIToolbar()
        //fit to screen
        toolBar.sizeToFit()
        //customizations
        //        toolBar.barTintColor = .black
        //        toolBar.tintColor = .brown
        
        //add one button
        let doneButton = UIBarButtonItem(title: "完成", style: .plain, target: self, action:#selector(dismissKeyboard))
        //if u have many buttons,write like this[doneButton,secondBt,thirdBt...]
        toolBar.setItems([doneButton], animated: true)
        
        //that means u can actually press it, set false nothing will happen as u tap it
        toolBar.isUserInteractionEnabled = true
        
        amountTextField.inputAccessoryView = toolBar
        
        
        
        
        
    }
    
    
    @objc func dismissKeyboard(){
        
        
        
        if cupSize == "大杯"{
            priceLabel.text = "$" + menu!.priceL.description
            let str = priceLabel.text
            let pri = Int(str!.trimmingCharacters(in:CharacterSet(charactersIn: "$")))
            price = pri!
            
            
            
            
        }else if cupSize == "中杯"{
            priceLabel.text = "$" + menu!.priceM.description
            let str = priceLabel.text
            let pri = Int(str!.trimmingCharacters(in:CharacterSet(charactersIn: "$")))
            price = pri!
        }
        
        addToppings()
        
        
        
        
        
        //結束編輯
        view.endEditing(true)
    }
    
    
}


extension ListTableViewController: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        pickerView.delegate?.pickerView?(pickerView, didSelectRow: 0, inComponent: 0)
    }
}
