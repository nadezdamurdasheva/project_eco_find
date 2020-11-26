//
//  DetailViewController.swift
//  project_eco_find
//
//  Created by Надя Мурдашева on 19.08.2020.
//  Copyright © 2020 Надя Мурдашева. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var labelDetail: UILabel!
    
    var image = UIImage()
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelDetail.text = name
        imageDetail.image = image
    }
    @IBAction func onSearchMap(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondViewController = storyboard.instantiateViewController(identifier: "MapViewController") as? MapViewController else { return }
        
        switch image {
        case UIImage(named: "sign1"),UIImage(named: "sign2"),UIImage(named: "sign3"),UIImage(named: "sign4"),UIImage(named: "sign5"),UIImage(named: "sign6"),UIImage(named: "sign7"),UIImage(named: "sign9"):
            secondViewController.index = 1
            secondViewController.index2 = 0
        case UIImage(named: "sign20"),UIImage(named: "sign21"),UIImage(named: "sign22"),UIImage(named: "sign23"):
            secondViewController.index = 2
            secondViewController.index2 = 0
        case UIImage(named: "sign40"),UIImage(named: "sign41"):
            secondViewController.index = 3
            secondViewController.index2 = 0
        case UIImage(named: "sign50"),UIImage(named: "sign51"),UIImage(named: "sign60"),UIImage(named: "sign61"):
            secondViewController.index = 4
            secondViewController.index2 = 0
        case UIImage(named: "sign70"),UIImage(named: "sign71"),UIImage(named: "sign72"),UIImage(named: "sign73"),UIImage(named: "sign74"),UIImage(named: "sign75"),UIImage(named: "sign76"),UIImage(named: "sign77"),UIImage(named: "sign78"),UIImage(named: "sign79"):
            secondViewController.index = 5
            secondViewController.index2 = 0
        case UIImage(named: "sign80"),UIImage(named: "sign81"),UIImage(named: "sign82"),UIImage(named: "sign83"),UIImage(named: "sign84"),UIImage(named: "sign85"),UIImage(named: "sign87"),UIImage(named: "sign90"),UIImage(named: "sign91"),UIImage(named: "sign92"),UIImage(named: "sign95"),UIImage(named: "sign96"),UIImage(named: "sign97"),UIImage(named: "sign98"),UIImage(named: "signTetrapak"):
            secondViewController.index = 6
            secondViewController.index2 = 0
        default:
            secondViewController.index = 0
            secondViewController.index2 = 0
        }
        show(secondViewController, sender: nil)
    }
    
    @IBAction func unwindToDetailViewController (segue: UIStoryboardSegue){
        
    }
}
