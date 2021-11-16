//
//  ViewController.swift
//  nit_ios_problem
//
//  Created by Khurshed Umarov on 16.11.2021.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var IPLabel: UILabel!
    private let mainViewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My IP"
    }


    @IBAction func IPButton(_ sender: Any) {
        mainViewModel.fetchIP{ [weak self] result in
            switch result{
            case .success(let json):
                self?.IPLabel.text = json.ip
            case .failure(let error):
                print("error: \(error.localizedDescription)")
                let errorTxt = error.localizedDescription
                self?.IPLabel.text = errorTxt
            }
            
        }
    }
}

