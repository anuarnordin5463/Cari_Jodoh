//
//  JodohAppAPI.swift
//  JodohApp
//
//  Created by Nazri Hussein on 5/12/16.
//  Copyright © 2016 intern. All rights reserved.
//

import Foundation
import Moya

let JodohAppProvider = MoyaProvider<JodohAppAPI>(endpointClosure: {
    (target: JodohAppAPI) -> Endpoint<JodohAppAPI> in
    
    return Endpoint(URL: url(target), sampleResponseClosure: {.NetworkResponse(200, target.sampleData)}, method: target.method, parameters: target.parameters, parameterEncoding: target.parameterEncoding)
})

// MARK: - Provider support

private extension String {
    var URLEscapedString: String {
        return self.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())!
    }
}

public enum JodohAppAPI {
    case Login(String, String)
    case Register(String, String, String)
}

extension JodohAppAPI : TargetType {
    
    
    public var parameterEncoding: Moya.ParameterEncoding {
        switch self {
        default:
            return .JSON
        }
    }
    
    var base: String {
        //return kStageURL
        return "http://192.168.0.156/fly/public/"
    }
    
    public var baseURL: NSURL { return NSURL(string: base)! }
    
    public var path: String {
        switch self {
        case Login:
            return "api/login"
        case Register:
            return "api/register"
            
        }
    }
    public var method: Moya.Method {
        switch self {
        case .Login, .Register:
            return .POST
        }
    }
    
    public var parameters: [String: AnyObject]? {
        switch self {
        case .Login(let username, let password):
            return ["email": username, "password" : password]
        case .Register(let username, let password, let confirm_password):
            return ["email": username, "password" : password, "password_confirmation" : confirm_password]
            
        default:
        return nil
        }
    }
    public var sampleData: NSData {
        return NSData.init()
    }
}

public func url(route: TargetType) -> String {
    return route.baseURL.URLByAppendingPathComponent(route.path).absoluteString
}


let endpointClosure = { (target: JodohAppAPI, method: Moya.Method, parameters: [String: AnyObject]) -> Endpoint<JodohAppAPI> in
    return Endpoint(URL: url(target), sampleResponseClosure: {.NetworkResponse(200, target.sampleData)}, method: target.method, parameters: target.parameters, parameterEncoding: target.parameterEncoding)
}
