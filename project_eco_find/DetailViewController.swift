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
    @IBOutlet weak var buttonSearchOnMap: UIButton!
    
    var image = UIImage()
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelDetail.text = name
        imageDetail.image = image
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickSearchOnMap(_ sender: Any) {
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
