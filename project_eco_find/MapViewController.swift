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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let font = UIFont.systemFont(ofSize: 9)
        segmentControl.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
        /*locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true*/
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        // Do any additional setup after loading the view.
        
        //show point on a map
        mapView.delegate = self
        
        /*let artwork = Artwork(
          title: "Пункт приема пластика",
          locationName: "Аллея Витте, 8",
          discipline: "Sculpture",
          coordinate: CLLocationCoordinate2D(latitude: 55.547261, longitude: 37.539836))
        mapView.addAnnotation(artwork)*/
        
        mapView.register(
        ArtworkMarkerView.self,
        forAnnotationViewWithReuseIdentifier:
          MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        loadInitialData()
        mapView.addAnnotations(artworks)
    }

    @IBAction func changeSegment(_ sender: UISegmentedControl) {
        mapView.addAnnotations(artworks)
        switch sender.selectedSegmentIndex {
        case 1:
            let filteredAnnotations = mapView.annotations.filter { annotation in
                if annotation is MKUserLocation { return false }          // don't remove MKUserLocation
                guard let title = annotation.title else { return false }  // don't remove annotations without any title
                return title != "Пункт приема пластика"                              // remove those whose title does not match search string
            }
            mapView.removeAnnotations(filteredAnnotations)
        case 2:
            let filteredAnnotations = mapView.annotations.filter { annotation in
                if annotation is MKUserLocation { return false }          // don't remove MKUserLocation
                guard let title = annotation.title else { return false }  // don't remove annotations without any title
                return title != "Пункт приема бумаги"                              // remove those whose title does not match search string
            }
            mapView.removeAnnotations(filteredAnnotations)
        case 3:
            let filteredAnnotations = mapView.annotations.filter { annotation in
                if annotation is MKUserLocation { return false }          // don't remove MKUserLocation
                guard let title = annotation.title else { return false }  // don't remove annotations without any title
                return title != "Пункт приема металла"                              // remove those whose title does not match search string
            }
            mapView.removeAnnotations(filteredAnnotations)
        case 4:
            let filteredAnnotations = mapView.annotations.filter { annotation in
                if annotation is MKUserLocation { return false }          // don't remove MKUserLocation
                guard let title = annotation.title else { return false }  // don't remove annotations without any title
                return title != "Пункт приема органических материалов"                              // remove those whose title does not match search string
            }
            mapView.removeAnnotations(filteredAnnotations)
        case 5:
            let filteredAnnotations = mapView.annotations.filter { annotation in
                if annotation is MKUserLocation { return false }          // don't remove MKUserLocation
                guard let title = annotation.title else { return false }  // don't remove annotations without any title
                return title != "Пункт приема стекла"                              // remove those whose title does not match search string
            }
            mapView.removeAnnotations(filteredAnnotations)
        case 6:
            let filteredAnnotations = mapView.annotations.filter { annotation in
                if annotation is MKUserLocation { return false }          // don't remove MKUserLocation
                guard let title = annotation.title else { return false }  // don't remove annotations without any title
                return title != "Пункт приема композиционных материалов"                              // remove those whose title does not match search string
            }
            mapView.removeAnnotations(filteredAnnotations)
        default:
            mapView.addAnnotations(artworks)
        }
        /*if sender.selectedSegmentIndex == 0{
            if artworks.discipline ==
        }
        if sender.selectedSegmentIndex == 1{
            
        }*/
    }
    /*@IBAction func changeMapType(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            
        }
        if sender.selectedSegmentIndex == 1{
            
        }
    }*/
    
    private func loadInitialData() {
      // 1
      guard
        let fileName = Bundle.main.url(forResource: "PublicArt", withExtension: "geojson"),
        let artworkData = try? Data(contentsOf: fileName)
        else {
          return
      }

      do {
        // 2
        let features = try MKGeoJSONDecoder()
          .decode(artworkData)
          .compactMap { $0 as? MKGeoJSONFeature }
        // 3
        let validWorks = features.compactMap(Artwork.init)
        // 4
        /*if (segmentControl.selectedSegmentIndex == 0) {
        
        }*/
        artworks.append(contentsOf: validWorks)
      } catch {
        // 5
        print("Unexpected error: \(error).")
      }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        manager.stopUpdatingLocation() //stop updating locations
        manager.delegate = nil
        
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: locations[0].coordinate, span: span)
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true
    }
}

extension MapViewController: MKMapViewDelegate {
    
  // 1
  /*func mapView(
    _ mapView: MKMapView,
    viewFor annotation: MKAnnotation
  ) -> MKAnnotationView? {
    // 2
    guard let annotation = annotation as? Artwork else {
      return nil
    }
    // 3
    let identifier = "artwork"
    var view: MKMarkerAnnotationView
    // 4
    if let dequeuedView = mapView.dequeueReusableAnnotationView(
      withIdentifier: identifier) as? MKMarkerAnnotationView {
      dequeuedView.annotation = annotation
      view = dequeuedView
    } else {
      // 5
      view = MKMarkerAnnotationView(
        annotation: annotation,
        reuseIdentifier: identifier)
      view.canShowCallout = true
      view.calloutOffset = CGPoint(x: -5, y: 5)
      view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
    }
    return view
  }*/
    
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
