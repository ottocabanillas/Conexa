//
//  HomeViewController.swift
//  Conexa-Challenge
//
//  Created by Oscar A. Rafael Cabanillas on 09/07/2024.
//

import UIKit

// MARK: HomeViewController Class
final class HomeViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.text = Constants.Home.title
            titleLabel.font = UIFont.boldSystemFont(ofSize: 70)
            titleLabel.adjustsFontSizeToFitWidth = true
        }
    }
    @IBOutlet weak var subTitleLabel: UILabel! {
        didSet {
            subTitleLabel.text = Constants.Home.subTitle
            subTitleLabel.font = UIFont.boldSystemFont(ofSize: 50)
            subTitleLabel.adjustsFontSizeToFitWidth = true
        }
    }
    @IBOutlet weak var contentLabel: UILabel! {
        didSet {
            contentLabel.text = Constants.Home.contentText
            contentLabel.textAlignment = .justified
            contentLabel.adjustsFontSizeToFitWidth = true
        }
    }
}
