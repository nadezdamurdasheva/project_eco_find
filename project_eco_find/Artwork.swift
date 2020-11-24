//
//  Artwork.swift
//  project_eco_find
//
//  Created by Надя Мурдашева on 21.11.2020.
//  Copyright © 2020 Надя Мурдашева. All rights reserved.
//

import Foundation
import MapKit
import Contacts

class Artwork: NSObject, MKAnnotation {
  let title: String?
  let locationName: String?
  let discipline: String?
  let coordinate: CLLocationCoordinate2D

  init(
    title: String?,
    locationName: String?,
    discipline: String?,
    coordinate: CLLocationCoordinate2D
  ) {
    self.title = title
    self.locationName = locationName
    self.discipline = discipline
    self.coordinate = coordinate

    super.init()
  }
    
    init?(feature: MKGeoJSONFeature) {
      // 1
      guard
        let point = feature.geometry.first as? MKPointAnnotation,
        let propertiesData = feature.properties,
        let json = try? JSONSerialization.jsonObject(with: propertiesData),
        let properties = json as? [String: Any]
        else {
          return nil
      }

      // 3
      title = properties["title"] as? String
      locationName = properties["location"] as? String
      discipline = properties["discipline"] as? String
      coordinate = point.coordinate
      super.init()
    }

  var subtitle: String? {
    return locationName
  }
    
    var mapItem: MKMapItem? {
      guard let location = locationName else {
        return nil
      }

      let addressDict = [CNPostalAddressStreetKey: location]
      let placemark = MKPlacemark(
        coordinate: coordinate,
        addressDictionary: addressDict)
      let mapItem = MKMapItem(placemark: placemark)
      mapItem.name = title
      return mapItem
    }
    
    var markerTintColor: UIColor  {
      switch discipline {
      case "Пластик":
        return UIColor(red:255.0/255.0, green:228.0/255.0, blue:181.0/255.0, alpha:1.0)
      case "Бумага":
        return UIColor(red:143.0/255.0, green:188.0/255.0, blue:143.0/255.0, alpha:1.0)
      case "Металл":
        return UIColor(red:192.0/255.0, green:192.0/255.0, blue:192.0/255.0, alpha:1.0)
      case "Органика":
        return UIColor(red:255.0/255.0, green:160.0/255.0, blue:122.0/255.0, alpha:1.0)
      case "Стекло":
        return UIColor(red:173.0/255.0, green:216.0/255.0, blue:230.0/255.0, alpha:1.0)
      case "Композитный":
        return UIColor(red:221.0/255.0, green:160.0/255.0, blue:221.0/255.0, alpha:1.0)
      default:
        return .green
    }
    }
}
