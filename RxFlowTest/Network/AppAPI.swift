//
//  AppAPI.swift
//  RxFlowTest
//
//  Created by 박기석 on 2019/12/27.
//  Copyright © 2019 Peter. All rights reserved.
//

import Moya

enum AppAPI {
    case search(String)
}

enum AppAPIError: Error {
    case noCommunication
}

extension AppAPI: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://openapi.naver.com/v1") else { fatalError("Bad URL Acceptor")}
        return url
    }
    
    var path: String {
        switch self {
        case .search:
            return "/search/movie.json"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        guard let data = "Data".data(using: String.Encoding.utf8) else { return Data() }
        return data
    }
    
    var task: Task {
        guard let parameters = parameters else { return .requestPlain }
        return .requestParameters(parameters: parameters, encoding: parameterEncoding)
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .search(let query):
            return ["query": query]
//        default:
//            return [:]
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
//        case :
//            return JSONEncoding.default
//        case :
//            return QueryArrayEncoding()
        default:
            return URLEncoding.queryString
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json",
                "X-Naver-Client-Id": AppManager.shared.naverId,
                "X-Naver-Client-Secret": AppManager.shared.naverSecret]
    }
}
