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
        secondViewController.index = 0
        
        show(secondViewController, sender: nil)
    }
    
    
    @IBAction func unwindToDetailViewController (segue: UIStoryboardSegue){
        
    }

}
