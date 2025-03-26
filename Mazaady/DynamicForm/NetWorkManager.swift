//
//  NetWorkManager.swift
//  Mazaady
//
//  Created by mio on 25/03/2025.
//

import Foundation
import Alamofire


class NetworkManager {

    static func setHeaders(request: inout URLRequest) {
        request.setValue("en", forHTTPHeaderField: "content-language")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("Tg$LXgp7uK!D@aAj^aT3TmWY9a9u#qh5g&xgEETJ", forHTTPHeaderField: "private-key")
        request.setValue("Postman", forHTTPHeaderField: "platform")
        request.setValue("AED", forHTTPHeaderField: "currency")
    }

   static func getMainCategory(urlString: String,complete: @escaping (ResponseData?)->()) {
//       let url = NSURL(string: urlString)
//       var request = URLRequest(url: url! as URL)
       // 2 - create request
       let headers: HTTPHeaders = [
           "content-language": "en",
           "Accept": "application/json",
           "private-key": "Tg$LXgp7uK!D@aAj^aT3TmWY9a9u#qh5g&xgEETJ",
           "platform": "Postman",
           "currency": "AED"
       ]

       Alamofire.request(urlString, method: .get, headers: headers).responseData { response in
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
        
        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)

            // Optional: Set the HTTP method (e.g., "GET", "POST", "PUT", "DELETE")
            request.httpMethod = "GET" // or "POST", etc.

            setHeaders(request: &request) // Pass the request as an inout parameter.

            // Example of a URLSession data task:

            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error: \(error)")
                    return
                }

                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    print("Invalid response")
                    return
                }

                // 7. Handle the data and decode it.
                if let data = data {
                    do {
                        // 8. Decode the JSON data into a ResponseData object.
                        let decoder = JSONDecoder()
                        let responseData = try decoder.decode(ResponseDataProperty.self, from: data)

                        // 9. Print the decoded data.
                        print("Message: \(responseData)")
                        complete(responseData)

                    } catch {
                        // Handle any errors that occur during JSON decoding.
                        print("Error decoding JSON: \(error.localizedDescription)")
                    }
                }
            }

            task.resume()
        } else {
            print("Invalid URL")
        }
        

    }


}
