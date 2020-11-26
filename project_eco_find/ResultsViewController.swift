//
//  ResultsViewController.swift
//  project_eco_find
//
//  Created by Надя Мурдашева on 22.08.2020.
//  Copyright © 2020 Надя Мурдашева. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var resultAnswerLabel: UILabel!
       
       @IBOutlet weak var resultDefinitionLabel: UILabel!
       
       var responses: [Answer]
       
       init?(coder: NSCoder, responses: [Answer]){
           self.responses = responses
           super.init(coder: coder)
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
               
        navigationItem.hidesBackButton = true
    }
    func calculatePersonalityResult() {
           let frequencyOfAnswers = responses.reduce(into: [:]) {
               (counts, answer) in counts[answer.type, default: 0] += 1
           }
           let mostCommonAnswer = frequencyOfAnswers.sorted{ $0.1 > $1.1}.first!.key
           
           resultAnswerLabel.text = "Вы \(mostCommonAnswer.rawValue)."
           resultDefinitionLabel.text = mostCommonAnswer.definition
       }
}
