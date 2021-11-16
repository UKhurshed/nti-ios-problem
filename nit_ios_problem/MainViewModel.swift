//
//  MainViewModel.swift
//  nit_ios_problem
//
//  Created by Khurshed Umarov on 16.11.2021.
//

import Foundation

class MainViewModel{
    func fetchIP(completion: @escaping (Result<IPModel, Error>) -> Void){
        NetworkMananger.shared.fetchIP{ result in
            switch result{
            case .success(let json):
                print("Json: \(json)")
                completion(.success(json))
            case .failure(let error):
                print("Error proccessing: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
}
