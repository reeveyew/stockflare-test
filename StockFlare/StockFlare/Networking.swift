//
//  Networking.swift
//  StockFlare
//
//  Created by Reeve Yew on 08/02/2016.
//  Copyright © 2016 Reeve Yew. All rights reserved.
//

import Foundation
import Alamofire

class Networking {
    

    
    class func searchForTicker(searchTerm:String, completion:(detail:[StockDetail]) -> Void){
        
        var stockArray = [StockDetail]()
        var stock = StockDetail()
        
        
        //search for stock using 'term'
        Alamofire.request(.PUT, "https://dozlacmd51.execute-api.us-east-1.amazonaws.com/v1/search", parameters: [
            "term": searchTerm,
            "select": ["short_name", "price", "ticker"]
            ])
            .responseJSON { response in
                
                if let JSON = response.result.value {

                   for var i = 0; i < (JSON as! [AnyObject]).count; i++ {
                        print("stock count: \(stockArray.count)")

                        if let short_name = JSON[i]["short_name"] as? String {
                            
                            stock.name = short_name
                        }
                        
                        if let ticker = JSON[i]["ticker"] as? String{
                            stock.ticker = ticker
                        }
                        
                        if let price = JSON[i]["price"] as? Int {
                            stock.price = price
                        }
                        stockArray.append(stock)
                    }
                    completion(detail: stockArray)
                }
        }

    }

}
