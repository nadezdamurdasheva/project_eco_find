//
//  ArtworkViews.swift
//  project_eco_find
//
//  Created by Надя Мурдашева on 22.11.2020.
//  Copyright © 2020 Надя Мурдашева. All rights reserved.
//

import Foundation
import MapKit

class ArtworkMarkerView: MKMarkerAnnotationView {
  override var annotation: MKAnnotation? {
    willSet {
      // 1
      guard let artwork = newValue as? Artwork else {
        return
      }
      canShowCallout = true
      calloutOffset = CGPoint(x: -5, y: 5)
      rightCalloutAccessoryView = UIButton(type: .detailDisclosure)

      // 2
      markerTintColor = artwork.markerTintColor
      if let letter = artwork.discipline?.first {
        glyphText = String(letter)
      }
    }
  }
}
