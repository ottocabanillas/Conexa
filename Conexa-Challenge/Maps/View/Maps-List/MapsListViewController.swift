//
//  MapsListViewController.swift
//  Conexa-Challenge
//
//  Created by Oscar A. Rafael Cabanillas on 09/07/2024.
//

import UIKit
// MARK: MapsListViewController Class
final class MapsListViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var tableViewUser: UITableView!
    
    // MARK: - Variables
    private var selectedName: String?
    private var userData: [UserData] = [
        UserData(id: nil, firstname: "Otto", lastname: "Cabanillas", email: nil, birthDate: nil, address: Address(street: nil, suite: nil, city: nil, zipcode: nil, geo: Geo(lat: "", lng: "")), phone: nil, website: nil),
        UserData(id: nil, firstname: "Fernanda", lastname: "Leiva", email: nil, birthDate: nil, address: Address(street: nil, suite: nil, city: nil, zipcode: nil, geo: Geo(lat: "", lng: "")), phone: nil, website: nil),
        UserData(id: nil, firstname: "Lucy", lastname: "Cabanillas", email: nil, birthDate: nil, address: Address(street: nil, suite: nil, city: nil, zipcode: nil, geo: Geo(lat: "", lng: "")), phone: nil, website: nil)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableViewUser.register(UITableViewCell.self, forCellReuseIdentifier: "userData_cell")
    }
    
}

extension MapsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.selectedName = "UserData: \(indexPath.row + 1)"
        let vc = MapsDetailsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

}

extension MapsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "userData_cell", for: indexPath)
        let userData: UserData = self.userData[indexPath.row]
        cell.textLabel?.text = userData.firstname?.appending(" ").appending(userData.lastname!)
        cell.accessoryType = .disclosureIndicator
        return cell
    }

}
