//
//  URL+Extension.swift
//  SentiaCodeChallenge
//
//  Created by Clayton on 5/5/21.
//

import Foundation

extension URL {
    
    private static var host = "https://f213b61d-6411-4018-a178-53863ed9f8ec.mock.pstmn.io/properties"
    
    static func getProperties() -> URL? {
        
        return URL(string: host )
    }
   

}

