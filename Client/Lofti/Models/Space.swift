////
////  Space.swift
////  Lofti
////
////  Created by Medi Assumani on 11/1/18.
////  Copyright © 2018 Medi Assumani. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//enum SpaceKeys: String, CodingKey{
//    case total = "total"
//}
//
//struct Space: Decodable{
//
////    let name: String?
////    let image_url: String?
////    let id: String?
////    let is_closed: Int?
////    let phone: String?
//    //var location: Address?
//    let total: Int
//
//    enum SpaceKeys: String, CodingKey{
//        case total = "total"
//        case businesses = "businesses"
//    }
//
//    init(total: Int) {
//        self.total = total
//    }
//
//    init(from decoder: Decoder) throws{
//
//        let container = try decoder.container(keyedBy: SpaceKeys.self)
//        let total: Int = try container.decode(Int.self, forKey: .total)
//
//        self.init(total: total)
//    }
//}

//
//  Space.swift
//  Lofti
//
//  Created by Medi Assumani on 11/1/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import Foundation
import UIKit



struct Space: Decodable{

    let name: String?

    enum SpaceKeys: String, CodingKey{
        case name = "name"
    }

//    enum OuterContainer: String, CodingKey{
//        case businesses = "businesses"
//    }
//
//    init(name: String) {
//        self.name = name
//    }

//    init(from decoder: Decoder) throws{
//
//        // Gets to the correct JSON Container
//        let outerContainer = try decoder.container(keyedBy: OuterContainer.self)
//        var nestedOuterContainers = try outerContainer.nestedUnkeyedContainer(forKey: .businesses)
//        let businessContainer = try nestedOuterContainers.nestedContainer(keyedBy: SpaceKeys.self)
//
//        // Creates and stores data from json file to variables
//        let name = try businessContainer.decode(String.self, forKey: .name)
////        let id = try businessContainer.decode(String.self, forKey: .id)
////        let phone = try businessContainer.decode(String.self, forKey: .phone)
//
//        // Initializes the struct properties
//        self.init(name: name)
//    }
}

struct Result: Decodable{
    let businesses: [Space]
}
