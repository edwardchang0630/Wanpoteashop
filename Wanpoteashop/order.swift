//
//  order.swift
//  Wanpoteashop
//
//  Created by Yuan-Che Chang on 2020/9/15.
//  Copyright © 2020 Yuan-Che Chang. All rights reserved.
//

import Foundation

struct OrderData: Codable {
    var data: Order
}


struct Order: Codable {
    var id: String
    var orderName: String
    var productName: String
    var sugar: String
    var ice: String
    var size: String
    var boba: String
    var iyu: String
    var taroball: String
    var grassjelly: String
    var pudding: String
    var quantity: String
    var price: String
}



//internal struct SheetDBController {
//    internal static let shared = SheetDBController()
//    
//    // MARK: - GET
//    func getData(completion: @escaping([Order]?) -> ()) {
//        let urlStr = "https://sheetdb.io/api/v1/ottbe3d7hicnk"
//        if let url = URL(string: urlStr) {
//            URLSession.shared.dataTask(with: url) { data, response, error in
//                
//                if let data = data, let sheetData = try? JSONDecoder().decode([Order].self, from: data) {
//                    completion(sheetData)
//                    //                    print(sheetData)
//                } else {
//                    completion(nil)
//                }
//            }.resume()
//        }
//        
//    }
//    
//    
//    //MARK: - POST
//    func postData(newOrder: Order, completion: @escaping() -> ()) {
//        let urlStr = "https://sheetdb.io/api/v1/ottbe3d7hicnk"
//        
//        if let url = URL(string: urlStr) {
//            var request = URLRequest(url: url)
//            request.httpMethod = "POST"
//            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//            
//            let postData = ["data":newOrder]
//            
//            if let data = try? JSONEncoder().encode(postData) {
//                
//                // Decode the return response from API to know if it is successful or failed
//                URLSession.shared.uploadTask(with: request, from: data) { returnData, response, error in
//                    //                    print("return data: \(returnData)")
//                    //                    print("response: \(response)")
//                    //                    print("errer: \(error)")
//                    if let returnData = returnData, let dic = try? JSONDecoder().decode([String: Int].self, from: returnData), dic["created"] == 1 {
//                        print("Post succeeded")
//                        completion()
//                    } else {
//                        print("Post failed")
//                    }
//                    
//                }.resume()
//                
//            }
//        }
//    }
//    
//    //MARK: - PUT
//    func putData(updatedOrder: Order, DBID: String, completion: @escaping () -> ()) {
//        let urlStr = "https://sheetdb.io/api/v1/ottbe3d7hicnk"
//        if let url = URL(string: urlStr) {
//            var request = URLRequest(url: url)
//            request.httpMethod = "PUT"
//            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//            
//            
//            let putData = ["data":updatedOrder]
//            if let data = try? JSONEncoder().encode(putData) {
//                URLSession.shared.uploadTask(with: request, from: data) { returnData, response, error in
//                    
//                    //                    print("return data: \(returnData)")
//                    //                    print("response: \(response)")
//                    //                    print("errer: \(error)")
//                    
//                    if let returnData = returnData, let dic = try? JSONDecoder().decode([String: Int].self, from: returnData), dic["updated"] == 1 {
//                        print("Put succeeded")
//                        completion()
//                    } else {
//                        print("Put failed")
//                    }
//                }.resume()
//            }
//        }
//        
//    }
//    
//    // MARK: - DELETE
//    func deleteData(DBno: String) {
//        let urlStr = "https://sheetdb.io/api/v1/ottbe3d7hicnk"
//        if let url = URL(string: urlStr) {
//            var request = URLRequest(url: url)
//            request.httpMethod = "DELETE"
//            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//            URLSession.shared.dataTask(with: request) { returnData, response, error in
//                if let returnData = returnData, let dic = try? JSONDecoder().decode([String: Int].self, from: returnData), dic["deleted"] == 1 {
//                    print("Delete succeeded")
//                } else {
//                    print("Delete failed")
//                }
//            }.resume()
//            
//        }
//        
//    }
//    
    
    
    // MARK: - Test API data
    //    func testGetData(completion: ([Order]?) -> ()) {
    //        guard let data = NSDataAsset(name: "sheetDB2")?.data else {
    //           print("data not exist")
    //           return
    //        }
    //        do {
    //           let decoder = JSONDecoder()
    //           let result = try decoder.decode([Order].self, from: data)
    //            completion(result)
    //           print(result)
    //        } catch  {
    //            completion(nil)
    //           print(error)
    //        }
    //    }
    
    
//}


