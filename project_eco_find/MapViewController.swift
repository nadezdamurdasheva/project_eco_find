//
//  MapViewController.swift
//  project_eco_find
//
//  Created by Надя Мурдашева on 22.08.2020.
//  Copyright © 2020 Надя Мурдашева. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var mapView: MKMapView!
    private var artworks: [Artwork] = []
    let locationManager = CLLocationManager()
    var index: Int?
    var index2: Int?
    
    @IBOutlet weak var rightBarItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let font = UIFont.systemFont(ofSize: 9)
        segmentControl.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        mapView.delegate = self
        mapView.register(
        ArtworkMarkerView.self,
        forAnnotationViewWithReuseIdentifier:
          MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        segmentControl.selectedSegmentIndex = ((index != nil) ? index : 0)!
        
        loadInitialData()
        mapView.addAnnotations(artworks)
        changeSegment(segmentControl)
        
        rightBarItem.isEnabled = ((index != nil && index2 != nil) ? true : false)
        rightBarItem.tintColor = ((index != nil && index2 != nil) ? UIColor(red: 85/255, green: 141/255, blue: 79/255, alpha: 1) : UIColor.clear)
    }
    

    @IBAction func changeSegment(_ sender: UISegmentedControl) {
        mapView.addAnnotations(artworks)
        switch sender.selectedSegmentIndex {
        case 1:
            let filteredAnnotations = mapView.annotations.filter { annotation in
                if annotation is MKUserLocation { return false }
                guard let title = annotation.title else { return false }
                return title != "Пункт приема пластика"
            }
            mapView.removeAnnotations(filteredAnnotations)
        case 2:
            let filteredAnnotations = mapView.annotations.filter { annotation in
                if annotation is MKUserLocation { return false }
                guard let title = annotation.title else { return false }
                return title != "Пункт приема бумаги"
            }
            mapView.removeAnnotations(filteredAnnotations)
        case 3:
            let filteredAnnotations = mapView.annotations.filter { annotation in
                if annotation is MKUserLocation { return false }
                guard let title = annotation.title else { return false }
                return title != "Пункт приема металла"
            }
            mapView.removeAnnotations(filteredAnnotations)
        case 4:
            let filteredAnnotations = mapView.annotations.filter { annotation in
                if annotation is MKUserLocation { return false }
                guard let title = annotation.title else { return false }
                return title != "Пункт приема органических материалов"
            }
            mapView.removeAnnotations(filteredAnnotations)
        case 5:
            let filteredAnnotations = mapView.annotations.filter { annotation in
                if annotation is MKUserLocation { return false }
                guard let title = annotation.title else { return false }
                return title != "Пункт приема стекла"
            }
            mapView.removeAnnotations(filteredAnnotations)
        case 6:
            let filteredAnnotations = mapView.annotations.filter { annotation in
                if annotation is MKUserLocation { return false }
                guard let title = annotation.title else { return false }
                return title != "Пункт приема композиционных материалов"
            }
            mapView.removeAnnotations(filteredAnnotations)
        default:
            mapView.addAnnotations(artworks)
        }
    }
    
    private func loadInitialData() {
      guard
        let fileName = Bundle.main.url(forResource: "PublicArt", withExtension: "geojson"),
        let artworkData = try? Data(contentsOf: fileName)
        else {
          return
      }

      do {
        let features = try MKGeoJSONDecoder()
          .decode(artworkData)
          .compactMap { $0 as? MKGeoJSONFeature }
        let validWorks = features.compactMap(Artwork.init)
        artworks.append(contentsOf: validWorks)
      } catch {
        print("Unexpected error: \(error).")
      }
    }
}
extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        manager.stopUpdatingLocation()
        manager.delegate = nil
        
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: locations[0].coordinate, span: span)
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true
    }
}

extension MapViewController: MKMapViewDelegate {
    func mapView(
      _ mapView: MKMapView,
      annotationView view: MKAnnotationView,
      calloutAccessoryControlTapped control: UIControl
    ) {
      guard let artwork = view.annotation as? Artwork else {
        return
      }
      let launchOptions = [
        MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving
      ]
      artwork.mapItem?.openInMaps(launchOptions: launchOptions)
    }
}
