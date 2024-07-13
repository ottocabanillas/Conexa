//
//  APIService.swift
//  Conexa-Challenge
//
//  Created by Oscar A. Rafael Cabanillas on 10/07/2024.
//

import Foundation

protocol APIServiceProtocol {
    func getUserData() async throws -> [UserData]
    func getNewsData() async throws -> [NewsData]
}

// MARK: APIService Class
final class APIService: APIServiceProtocol {
    
    // MARK: - Methods
    func getUserData() async throws -> [UserData] {
        let requestModel = RequestModel(endpoint: .users)
        return try await getFetchData(requestModel, [UserData].self)
    }
    
    func getNewsData() async throws -> [NewsData] {
        let requestModel = RequestModel(endpoint: .posts)
        return try await getFetchData(requestModel, [NewsData].self)
    }
    
    private func getFetchData<T: Decodable>(_ requestModel: RequestModel, _ modelType: T.Type) async throws -> T {
        let serviceUrl = URLComponents(string: requestModel.endpoint.baseURL)
        guard let componentURL = serviceUrl?.url else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: componentURL)
        request.httpMethod = requestModel.httpMethod.rawValue
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.httpResponseError
            }
            
            if (httpResponse.statusCode > 299){
                throw NetworkError.statusCodeError
            }
            
            let decoder = JSONDecoder()
            
            do {
                let decodeData = try decoder.decode(T.self, from: data)
                return decodeData
            } catch {
                throw NetworkError.couldNotDecodeData
            }
        } catch {
            throw NetworkError.generic
        }
    }
}
