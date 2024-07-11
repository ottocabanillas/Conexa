//
//  NewsListViewController.swift
//  Conexa-Challenge
//
//  Created by Oscar A. Rafael Cabanillas on 09/07/2024.
//

import UIKit

// MARK: NewsListViewController Class
final class NewsListViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var searchBarNews: UISearchBar! {
        didSet{
            searchBarNews.placeholder = "Search News"
        }
    }
    @IBOutlet weak var segmentedControlNews: UISegmentedControl!
    @IBOutlet weak var tableViewNews: UITableView! {
        didSet {
            tableViewNews.register(UITableViewCell.self, forCellReuseIdentifier: "newsData_cell")
        }
    }
    
    // MARK: - Variables
    private var viewModel = NewsListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        viewModel.requestData()
        viewModel.filterNews()
    }
    
    // MARK: - Methods
    private func bindViewModel() {
        viewModel.onViewModelsUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.tableViewNews.reloadData()
            }
        }
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        if let filterType = FilterType(rawValue: sender.selectedSegmentIndex) {
            viewModel.filterType = filterType
            self.tableViewNews.reloadData()
        }
    }
    
}

// MARK: - NewsListViewController Extension
extension NewsListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchText = searchText
        self.tableViewNews.reloadData()
    }
}

extension NewsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailViewModel = NewsDetailsViewModel(news: viewModel.filteredNews[indexPath.row])
        let vc = NewsDetailsViewController()
        vc.viewModel = detailViewModel
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension NewsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.filteredNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "newsData_cell", for: indexPath)
        if viewModel.filterType == .title {
            cell.textLabel?.text = self.viewModel.filteredNews[indexPath.row].title
        } else {
            cell.textLabel?.text = self.viewModel.filteredNews[indexPath.row].contentText
        }
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}
