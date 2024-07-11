//
//  NewsDetailsViewController.swift
//  Conexa-Challenge
//
//  Created by Oscar A. Rafael Cabanillas on 09/07/2024.
//

import UIKit

// MARK: NewsDetailsViewController Class
final class NewsDetailsViewController: UIViewController {
    
    // MARK: - IBOulet
    @IBOutlet weak var categoryLabel: UILabel! {
        didSet {
            categoryLabel.text = viewModel?.news.category
            categoryLabel.font = UIFont.boldSystemFont(ofSize: 50)
            categoryLabel.adjustsFontSizeToFitWidth = true
        }
    }
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.text = viewModel?.news.title
            titleLabel.font = UIFont.boldSystemFont(ofSize: 28)
            titleLabel.numberOfLines = 0
            contentLabel.textAlignment = .justified
            titleLabel.adjustsFontSizeToFitWidth = true
        }
    }
    @IBOutlet weak var publishedAtLabel: UILabel! {
        didSet {
            publishedAtLabel.text = viewModel?.news.publishedAt
            publishedAtLabel.font = .systemFont(ofSize: 15)
            publishedAtLabel.adjustsFontSizeToFitWidth = true
        }
    }
    @IBOutlet weak var contentLabel: UILabel! {
        didSet {
            contentLabel.text = viewModel?.news.contentText
            contentLabel.adjustsFontSizeToFitWidth = true
        }
    }
    
    // MARK: - Variables
    var viewModel: NewsDetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
