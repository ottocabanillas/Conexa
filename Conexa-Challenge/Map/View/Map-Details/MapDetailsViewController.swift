//
//  MapDetailsViewController.swift
//  Conexa-Challenge
//
//  Created by Oscar A. Rafael Cabanillas on 09/07/2024.
//

import UIKit
import GoogleMaps

// MARK: MapDetailsViewController Class
final class MapDetailsViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var mapView: UIView! {
        didSet{
            setupMap()
        }
    }
    @IBOutlet weak var fullNameLabel: UILabel! {
        didSet{
            fullNameLabel.text = detailViewModel?.userInfo.fullName
        }
    }
    @IBOutlet weak var streetLabel: UILabel! {
        didSet{
            streetLabel.text = detailViewModel?.userInfo.street
        }
    }
    @IBOutlet weak var latAndLngLabel: UILabel! {
        didSet{
            latAndLngLabel.text = detailViewModel?.userInfo.coordinates
        }
    }
    
    // MARK: - Variables
    var detailViewModel: MapDetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Methods
    func setupMap() {
        if let detailViewModel = detailViewModel {
            let street = detailViewModel.userInfo.street
            let latitude = detailViewModel.userInfo.latDouble
            let longitude = detailViewModel.userInfo.lngDouble
            
            let options = GMSMapViewOptions()
            options.camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 6.0)
            options.frame = self.mapView.bounds
            
            let mapViewGoogle = GMSMapView(options: options)
            self.mapView.addSubview(mapViewGoogle)
            
            // Creates a marker in the center of the map.
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            marker.title = street
            marker.map = mapViewGoogle
        }
    }
}
