//
//  Created by postnikov_pp on 15/03/2023.
//  Copyright (c) 2023 postnikovpp. All rights reserved.
//

import Foundation
import Alamofire

enum AuthType {
    case BVC
}

final class APIClient {
    
    func post<T: Decodable>(_ url: String, parameters: [String: Any]? = nil, model: T.Type, authType: AuthType? = nil, completion: @escaping (RequestResult<T>) -> Void) {
        request(url, method: .post, parameters: parameters, model: model, authType: authType, completion: completion)
    }
}

extension APIClient {
    
    private func request<T: Decodable>(
        _ url: String,
        method: HTTPMethod,
        parameters: [String: Any]? = nil,
        model: T.Type,
        authType: AuthType? = nil,
        completion: @escaping (RequestResult<T>) -> Void) {
        let sessionManager = getSessionManager(authType: authType)
        print("""
              URL: \(url)
              METHOD: \(method)
              """)
        sessionManager.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: model) { response in
                print(response)
                switch response.result {
                case .success:
                    if let jsonData = response.data {
                        let result = self.parseJSON(data: jsonData, model: model.self, url: url, response: response)
                        completion(result)
                    } else {
                        let networkError = self.handleNetworkError(response)
                        completion(.failure(networkError))
                    }
                case let .failure(error):
                    let networkError = self.handleErrorByAPI(url, response, error)
                    completion(.failure(networkError))
                }
            }
    }
    
    private func getSessionManager(authType: AuthType?, isUpload: Bool = false) -> Session {
        switch authType {
        case .BVC:
            return NetworkSession.manager
        case .none:
            return NetworkSession.manager
        }
    }
    
    private func parseJSON<T: Decodable>(data: Data, model: T.Type, url: String, response: DataResponse<T, AFError>) -> RequestResult<T> {
        let jsonDecoder = JSONDecoder()
        do {
            let result = try jsonDecoder.decode(model.self, from: data)
            return .success(result)
        } catch let error {
            let networkError = self.handleErrorByAPI(url, response, error)
            return .failure(networkError)
        }
    }
    
    private func handleNetworkError<T: Decodable>(_ response: DataResponse<T, AFError>?) -> NetworkError {
        NetworkError(response: response?.response)
    }
    
    private func handleErrorByAPI<T: Decodable>(_ url: String, _ response: DataResponse<T, AFError>, _ error: Error) -> NetworkError {
        print(error)
        let jsonDecoder = JSONDecoder()
        if let jsonData = response.data, !jsonData.isEmpty {
            if let BVCError = try? jsonDecoder.decode(BVCError.self, from: Data(jsonData)) {
                return NetworkError(errorMessage: BVCError.errorMessage, errorModel: BVCError, response: response.response)
            }
        }
        return handleNetworkError(response)
    }
}
