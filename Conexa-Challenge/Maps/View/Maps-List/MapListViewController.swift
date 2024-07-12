//
//  MapListViewController.swift
//  Conexa-Challenge
//
//  Created by Oscar A. Rafael Cabanillas on 09/07/2024.
//

import UIKit

// MARK: MapsListViewController Class
final class MapListViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var tableViewUser: UITableView!{
        didSet{
            self.tableViewUser.register(UITableViewCell.self, forCellReuseIdentifier: "userData_cell")
        }
    }
    
    // MARK: - Variables
    private var viewModel = MapListsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        viewModel.requestData()
        
    }
    
    // MARK: - Methods
    private func bindViewModel() {
        viewModel.onViewModelsUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.tableViewUser.reloadData()
            }
        }
    }
}

extension MapListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailViewModel = MapDetailsViewModel(userInfo: viewModel.viewModels[indexPath.row])
        let vc = MapDetailsViewController()
        vc.detailViewModel = detailViewModel
        navigationController?.pushViewController(vc, animated: true)
    }

}

extension MapListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "userData_cell", for: indexPath)
        cell.textLabel?.text = viewModel.viewModels[indexPath.row].fullName
        cell.accessoryType = .disclosureIndicator
        return cell
    }

}
