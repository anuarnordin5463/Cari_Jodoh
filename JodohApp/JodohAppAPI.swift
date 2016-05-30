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
    
    return Endpoint(URL: url(target), sampleResponseClosure: {.NetworkResponse(200, target.sampleData)}, method: target.method, parameters: target.parameters, parameterEncoding: target.parameterEncoding, httpHeaderFields: target.httpHeaderFields)
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
    case Update(String, String, String, String, String, String, String, String, String,String)
    case GetUpdate(String)
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
        return "http://192.168.0.113:8012/fly/public/"
        //return "http://192.168.0.113/fly/public/"
    }
    
    public var baseURL: NSURL { return NSURL(string: base)! }
    
    public var path: String {
        switch self {
        case Login:
            return "api/login"
        case Register:
            return "api/register"
        case Update:
            return "api/update"
        case GetUpdate:
            return "api/getProfile"
            
        }
    }
    public var method: Moya.Method {
        switch self {
        case .Login, .Register, .Update, .GetUpdate:
            return .POST
        }
    }
    
    public var httpHeaderFields: [String:String]?{
        
        if let auth_token = defaults.objectForKey("auth_token"){
            return ["Authorization" : "Bearer \(auth_token as! String)"]
        }else{
            return ["Authorization" : "Bearer"]
        }
    }
    
    public var parameters: [String: AnyObject]? {
        switch self {
            
        case .Login(let username, let password):
        return ["email": username,
                "password" : password]
            
        case .Register(let username, let password, let confirm_password):
        return ["email": username,
                "password" : password,
                "password_confirmation" : confirm_password]
    
        case .Update(let userDOB,let userMobile,let userHeight,let userWeight,let userSmoke,let userState,let userTown,let userEducation,let userOccupation,let signature):
        return ["userDOB" : userDOB,
                "userMobile" : userMobile,
                "userHeight" : userHeight,
                "userWeight" : userWeight,
                "userSmoke" : userSmoke,
                "userState" : userState,
                "userTown" : userTown,
                "userEducation" : userEducation,
                "userOccupation" : userOccupation,
                "signature" : signature]
            
        case .GetUpdate(let signature):
        return ["signature" : signature]
            
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
    return Endpoint(URL: url(target), sampleResponseClosure: {.NetworkResponse(200, target.sampleData)}, method: target.method, parameters: target.parameters, parameterEncoding: target.parameterEncoding, httpHeaderFields: target.httpHeaderFields)
}
