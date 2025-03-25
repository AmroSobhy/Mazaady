//
//  NetWorkManager.swift
//  Mazaady
//
//  Created by mio on 25/03/2025.
//

import Foundation
import Alamofire


class NetworkManager {

    
   static func getMainCategory(urlString: String,complete: @escaping (ResponseData?)->()) {
//       let url = NSURL(string: urlString)
//       var request = URLRequest(url: url! as URL)
       // 2 - create request
       
       Alamofire.request(urlString, method: .get, headers: [:]).responseData { response in
               // 3 - HTTP response handle

               print(" result",response)

           switch response.result {
           case .success(let data):
               if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                   print("Received JSON: \(json)")
               } else if let string = String(data: data, encoding: .utf8){
                   print("Received String: \(string)")
               } else {
                   print("Received Data: \(data)")
               }

           case .failure(let error):
               print("Error: \(error)")
           }


               // 7. Handle the data and decode it.
               if let data = response.data {
                   do {
                       // 8. Decode the JSON data into a ResponseData object.
                       let decoder = JSONDecoder()
                       let responseData = try decoder.decode(ResponseData.self, from: data)
                       
                       // 9. Print the decoded data.  Now you can access the properties of the ResponseData struct.
                       print("Message: \(responseData.message)")
                       print("Categories:")
                       complete(responseData)
                       
                   } catch {
                       // Handle any errors that occur during JSON decoding.
                       print("Error decoding JSON: \(error.localizedDescription)")
                   }
               }
       }
    }
    
    



    static func getsubCategory(urlString: String,complete: @escaping (ResponseDataProperty?)->()) {
        // 2. Create a URL object.
        guard let url = URL(string: urlString) else {
            print("Error: Invalid URL")
            return
        }

        // 3. Create a URLSession.
        let session = URLSession.shared

        // 4. Create the data task.
        let task = session.dataTask(with: url) { (data, response, error) in
            // This closure is called on a background thread.

            // 5. Handle errors.
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            // 6. Handle the HTTP response.
            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
                guard (200...299).contains(httpResponse.statusCode) else {
                    print("Error: Invalid status code")
                    return
                }
            }

            // 7. Handle the data and decode it.
            if let data = data {
                do {
                    // 8. Decode the JSON data into a ResponseData object.
                    let decoder = JSONDecoder()
                    let responseData = try decoder.decode(ResponseDataProperty.self, from: data)

                    // 9. Print the decoded data.
                    print("Message: \(responseData.message)")
                    print("Properties:")
                    complete(responseData)

                } catch {
                    // Handle any errors that occur during JSON decoding.
                    print("Error decoding JSON: \(error.localizedDescription)")
                }
            }
        }

        // 10. Start the task.
        task.resume()
    }


}
//import Foundation
//
//// 1. Define structs to match the JSON structure.
//struct MessageResponse: Decodable {
//    let txt: [String?]
//}
//
//struct Option: Decodable {
//    let id: Int
//    let name: String
//    let has_child: Bool
//}
//
//struct Property: Decodable {
//    let id: Int
//    let name: String
//    let type: String
//    let parent_id: Int?
//    let options: [Option]
//}
//
//struct ResponseData: Decodable {
//    let message: MessageResponse
//    let data: [Property]
//}
//
//func performGetRequestWithDecodable(urlString: String) {
//    // 2. Create a URL object.
//    guard let url = URL(string: urlString) else {
//        print("Error: Invalid URL")
//        return
//    }
//
//    // 3. Create a URLSession.
//    let session = URLSession.shared
//
//    // 4. Create the data task.
//    let task = session.dataTask(with: url) { (data, response, error) in
//        // This closure is called on a background thread.
//
//        // 5. Handle errors.
//        if let error = error {
//            print("Error: \(error.localizedDescription)")
//            return
//        }
//
//        // 6. Handle the HTTP response.
//        if let httpResponse = response as? HTTPURLResponse {
//            print("Status code: \(httpResponse.statusCode)")
//            guard (200...299).contains(httpResponse.statusCode) else {
//                print("Error: Invalid status code")
//                return
//            }
//        }
//
//        // 7. Handle the data and decode it.
//        if let data = data {
//            do {
//                // 8. Decode the JSON data into a ResponseData object.
//                let decoder = JSONDecoder()
//                let responseData = try decoder.decode(ResponseData.self, from: data)
//
//                // 9. Print the decoded data.
//                print("Message: \(responseData.message)")
//                print("Data:")
//                for dataItem in responseData.data {
//                    print("  ID: \(dataItem.id)")
//                    print("  Name: \(dataItem.name)")
//                    print("  Type: \(dataItem.type)")
//                    if let parentId = dataItem.parent_id {
//                        print("  Parent ID: \(parentId)")
//                    } else {
//                        print("  Parent ID: nil")
//                    }
//                    print("  Options:")
//                    for option in dataItem.options {
//                        print("    ID: \(option.id)")
//                        print("    Name: \(option.name)")
//                        print("    Has Child: \(option.has_child)")
//                    }
//                }
//
//            } catch {
//                // 10. Handle any errors that occur during JSON decoding.
//                print("Error decoding JSON: \(error.localizedDescription)")
//            }
//        }
//    }
//
//    // 11. Start the task.
//    task.resume()
//}
//
//// Example usage:
//let urlString = "https://your-api.com/data" // Replace with your actual URL
//performGetRequestWithDecodable(urlString: urlString)
