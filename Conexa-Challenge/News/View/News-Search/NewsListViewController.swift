//
//  NewsListViewController.swift
//  Conexa-Challenge
//
//  Created by Oscar A. Rafael Cabanillas on 09/07/2024.
//

import UIKit

// MARK: NewsListViewController Class
class NewsListViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var searchBarNews: UISearchBar!
    @IBOutlet weak var segmentedControlNews: UISegmentedControl!
    @IBOutlet weak var tableViewNews: UITableView!
    
    // MARK: - Variables
    private var selectedName: String?
    private var posts: [NewsData] = [
        NewsData(id: nil, slug: nil, url: nil, title: "Titulo 1", content: "Content 1", image: nil, thumbnail: nil, status: nil, category: "Category 1", publishedAt: "04/02/2023 13:25:21", updatedAt: nil, userID: nil),
        NewsData(id: nil, slug: nil, url: nil, title: "Titulo 2", content: "Content 2", image: nil, thumbnail: nil, status: nil, category: "Category 2", publishedAt: "25/12/2022 13:10:07", updatedAt: nil, userID: nil),
        NewsData(id: nil, slug: nil, url: nil, title: "Titulo 3", content: "Content 3", image: nil, thumbnail: nil, status: nil, category: "Category 3", publishedAt: "06/02/2023 10:19:53", updatedAt: nil, userID: nil)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableViewNews.register(UITableViewCell.self, forCellReuseIdentifier: "newsData_cell")
    }
}

extension NewsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.selectedName = "NewsData: \(indexPath.row + 1)"
        self.performSegue(withIdentifier: "NewsDetails", sender: nil)
    }
}

extension NewsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "newsData_cell", for: indexPath)
        let newsData: NewsData = self.posts[indexPath.row]
        cell.textLabel?.text = newsData.title
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}
