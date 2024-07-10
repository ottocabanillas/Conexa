//
//  HomeViewController.swift
//  Conexa-Challenge
//
//  Created by Oscar A. Rafael Cabanillas on 09/07/2024.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.text = Constants.Home.title.rawValue
        }
    }
    
    @IBOutlet weak var subTitleLabel: UILabel! {
        didSet {
            subTitleLabel.text = Constants.Home.subTitle.rawValue
        }
    }
    
    @IBOutlet weak var contentLabel: UILabel! {
        didSet {
            contentLabel.text = Constants.Home.contentText.rawValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
