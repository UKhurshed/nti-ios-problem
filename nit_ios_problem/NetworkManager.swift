//
//  NetworkManager.swift
//  nit_ios_problem
//
//  Created by Khurshed Umarov on 16.11.2021.
//

import Foundation

class NetworkMananger{
    
    static let shared = NetworkMananger()
        
    private init(){}
    
    private let baseUrl = "http://awstest-balancer-1233234915.us-east-2.elb.amazonaws.com/awstest-service/"
    
    func fetchIP(completion: @escaping (Result<IPModel, Error>) -> Void){
        guard let url = URL(string: baseUrl) else{
            return
        }
        
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("Empty response")
                return
            }
            print("Response statusCode: \(response.statusCode)")
            if let data = data {
                do {
                    let jsonData = try JSONDecoder().decode(IPModel.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(jsonData))
                    }
                }catch{
                    print("error: \(error)")
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
