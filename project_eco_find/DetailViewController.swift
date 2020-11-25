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
    //@IBOutlet weak var buttonSearchOnMap: UIButton!
    
    var image = UIImage()
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelDetail.text = name
        imageDetail.image = image
        //navigationController?.navigationBar.backItem?.title = "Назад"
        //navigationController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: self, action: #selector(BackButtonTapped))
        // Do any additional setup after loading the view.
    }
    @objc func BackButtonTapped() {
        //performSegue(withIdentifier: "unwindToMarksListTableViewController", sender: self)
        
        /*let vc = storyboard?.instantiateViewController(identifier: "MarksTableViewController") as? MarksListTableViewController
        self.navigationController?.pushViewController(vc!, animated: true)*/
    }
    
    /*@IBAction func onClickSearchOnMap(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }*/
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "toMapView" else { return }
        guard let destination = segue.destination as? MapViewController else { return }
        //destination.segmentControl.selectedSegmentIndex = 0
        // Pass the selected object to the new view controller.
    }*/
    
    @IBAction func onSearchMap(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondViewController = storyboard.instantiateViewController(identifier: "MapViewController") as? MapViewController else { return }
        
        
        switch image {
        case UIImage(named: "sign1"),UIImage(named: "sign2"),UIImage(named: "sign3"),UIImage(named: "sign4"),UIImage(named: "sign5"),UIImage(named: "sign6"),UIImage(named: "sign7"),UIImage(named: "sign9"):
            secondViewController.index = 1
        case UIImage(named: "sign20"),UIImage(named: "sign21"),UIImage(named: "sign22"),UIImage(named: "sign23"):
            secondViewController.index = 2
        case UIImage(named: "sign40"),UIImage(named: "sign41"):
            secondViewController.index = 3
        case UIImage(named: "sign50"),UIImage(named: "sign51"),UIImage(named: "sign60"),UIImage(named: "sign61"):
            secondViewController.index = 4
        case UIImage(named: "sign70"),UIImage(named: "sign71"),UIImage(named: "sign72"),UIImage(named: "sign73"),UIImage(named: "sign74"),UIImage(named: "sign75"),UIImage(named: "sign76"),UIImage(named: "sign77"),UIImage(named: "sign78"),UIImage(named: "sign79"):
            secondViewController.index = 5
        case UIImage(named: "sign80"),UIImage(named: "sign81"),UIImage(named: "sign82"),UIImage(named: "sign83"),UIImage(named: "sign84"),UIImage(named: "sign85"),UIImage(named: "sign87"),UIImage(named: "sign90"),UIImage(named: "sign91"),UIImage(named: "sign92"),UIImage(named: "sign95"),UIImage(named: "sign96"),UIImage(named: "sign97"),UIImage(named: "sign98"),UIImage(named: "signTetrapak"):
            secondViewController.index = 6
        default:
            secondViewController.index = 0
        }
        
        show(secondViewController, sender: nil)
    }
    
    
    @IBAction func unwindToDetailViewController (segue: UIStoryboardSegue){
        
    }

}
