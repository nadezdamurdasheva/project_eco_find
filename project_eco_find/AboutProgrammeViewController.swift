//
//  AboutProgrammeViewController.swift
//  project_eco_find
//
//  Created by Надя Мурдашева on 18.08.2020.
//  Copyright © 2020 Надя Мурдашева. All rights reserved.
//

import UIKit

class AboutProgrammeViewController: UIViewController {

    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        labelText.text = """
        Что такое EcoFind? \
        Это приложение, разработанное для того, чтобы помочь людям, которые заинтересованы в сохранении природных богатств и экологии. \
        В приложении можно найти много полезных советов и статей об экологичном образе жизни. \
        Также в этом приложении можно по отсканированной маркировке найти ближайшие пункты приема данной категории упаковки. \
        По всем интересующим вопросам по работе приложения и при возникновении проблем с функциональностью обращайтесь по адресу email:
        """
        labelEmail.text = "nadezdamurdasheva@yandex.ru"
        // Do any additional setup after loading the view.
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
