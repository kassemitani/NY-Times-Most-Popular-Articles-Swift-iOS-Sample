//
//  ApiManager.swift
//  NY Times Most Popular Articles
//
//  Created by Kassem Itani on 3/30/19.
//  Copyright © 2019 kassem Itani. All rights reserved.
//

import Moya

struct ApiManager {
    static let mostPopularProvider =
        MoyaProvider<MostPopularArticlesApi>(plugins: [NetworkLoggerPlugin(verbose: true)])
    
    static let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    static func getArticles(
        period: ArticlesPeriod,
        success: @escaping ([Article]) -> (),
        failure: @escaping (String) -> ()
        ) {
        
        mostPopularProvider.request(.getPopularArticles(period: period)) { result in
            switch result {
            case .success(let response):
                guard response.statusCode == Constants.HTTP_OK else {
                    failure("Error \(response.statusCode)")
                    return
                }
                
                do {
                    let response = try jsonDecoder.decode(Articles.self, from: response.data)
                    success(response.results)
                } catch {
                    print("JSON decode error: \(error)")
                    failure(error.localizedDescription)
                }
                
            case .failure(let error):
                failure(error.localizedDescription)
            }
        }
    }
}
