//
//  Artwork.swift
//  project_eco_find
//
//  Created by Надя Мурдашева on 21.11.2020.
//  Copyright © 2020 Надя Мурдашева. All rights reserved.
//

import Foundation
import MapKit

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

  var subtitle: String? {
    return locationName
  }
}
