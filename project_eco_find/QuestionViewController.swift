//
//  QuestionViewController.swift
//  project_eco_find
//
//  Created by Надя Мурдашева on 21.08.2020.
//  Copyright © 2020 Надя Мурдашева. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var multiLabel1: UILabel!
    @IBOutlet weak var multiLabel2: UILabel!
    @IBOutlet weak var multiLabel3: UILabel!
    @IBOutlet weak var multiLabel4: UILabel!
    
    @IBOutlet weak var multiSwitch1: UISwitch!
    @IBOutlet weak var multiSwitch2: UISwitch!
    @IBOutlet weak var multiSwitch3: UISwitch!
    @IBOutlet weak var multiSwitch4: UISwitch!
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangeLabel1: UILabel!
    @IBOutlet weak var rangeLabel2: UILabel!
    
    
    @IBOutlet weak var rangedSlider: UISlider!
    
    @IBOutlet weak var questionProgressiveView: UIProgressView!
      var questions: [Question] = [
          Question(text: "Какой ваш основной способ передвижения?", type: .single,
          answer: [
              Answer(text: "Общественный транспорт", type: .almostEcoEnemy),
              Answer(text: "Велосипед", type: .ecoHero),
              Answer(text: "Обычный автомобиль на бензине", type: .ecoEnemy),
              Answer(text: "Электрокар или гибридный автомобиль", type: .almostEcoHero)
          ]),
          
          Question(text: "Во что вы упаковываете продукты?", type: .multiple,
          answer: [
              Answer(text: "В пластиковый пакет, который покупаю в магазине", type: .almostEcoEnemy),
              Answer(text: "В бумажный пакет, который покупаю в магазине", type: .ecoEnemy),
              Answer(text: "В тканевую сумку или рюкзак", type: .ecoHero),
              Answer(text: "В пластиковый пакет, который беру из дома", type: .almostEcoHero)
          ]),
          
          Question(text: "Используете ли вы пакеты из магазина повторно?", type: .multiple,
          answer: [
              Answer(text: "Сразу же их выкидываю после использования", type: .ecoEnemy),
              Answer(text: "Не покупаю пакеты в магазине", type: .ecoHero),
              Answer(text: "Использую повторно", type: .almostEcoHero),
              Answer(text: "Каждый раз покупаю новые", type: .almostEcoEnemy)
          ]),
          
          Question(text: "Сортируете ли вы мусор?", type: .ranged, answer: [
                       Answer(text: "Никогда не сортирую", type: .ecoEnemy),
                       Answer(text: "Практически не сортирую", type: .almostEcoEnemy),
                       Answer(text: "Иногда сортирую", type: .almostEcoHero),
                       Answer(text: "Сортирую всегда", type: .ecoHero)
          ]),
          
          Question(text: "Вы устраиваете вечеринку. Из чего будут есть ваши гости?", type: .single,
          answer: [
              Answer(text: "Из бумажных тарелок", type: .almostEcoEnemy),
              Answer(text: "Из пластиковых тарелок, которые я сразу же выкину", type: .ecoEnemy),
              Answer(text: "Из керамических тарелок", type: .ecoHero),
              Answer(text: "Из пластиковых тарелок, которые я помою и использую повторно", type: .almostEcoHero)
          ]),
          
          Question(text: "Оставляете ли вы мусор после отдыха на природе?", type: .ranged, answer: [
              Answer(text: "Всегда оставляю", type: .ecoEnemy),
              Answer(text: "Иногда оставляю", type: .almostEcoEnemy),
              Answer(text: "Часто собираю с собой, но могу что-то оставить", type: .almostEcoHero),
              Answer(text: "Всегда забираю", type: .ecoHero)
          ]),
          
          Question(text: "Часто ли вы сдаете вторсырье? (макулатуру, пластик, аккумуляторы)", type: .ranged, answer: [
              Answer(text: "Никогда", type: .ecoEnemy),
              Answer(text: "Практически никогда", type: .almostEcoEnemy),
              Answer(text: "Часто", type: .almostEcoHero),
              Answer(text: "Всегда", type: .ecoHero)
          ]),
          
          Question(text: "Что вы делаете с отработавшими батарейками?", type: .single,
          answer: [
              Answer(text: "Отношу их на пункт сбора опасных отходов", type: .almostEcoHero),
              Answer(text: "Я не использую одноразовые батарейки", type: .ecoHero),
              Answer(text: "Я собираю их, но не знаю, что с ними делать дальше", type: .almostEcoEnemy),
              Answer(text: "Выбрасываю их в мусорку", type: .ecoEnemy)
          ]),
          
          Question(text: "Что вы сделаете с ненужной одеждой?", type: .single,
          answer: [
              Answer(text: "Выброшу в мусорку", type: .ecoEnemy),
              Answer(text: "Отдам нуждающимся", type: .almostEcoHero),
              Answer(text: "Сдам на переработку", type: .ecoHero),
              Answer(text: "Ничего не сделаю", type: .almostEcoEnemy)
          ]),
          
          Question(text: "Сажали ли вы когда-нибудь дерево?", type: .single,
          answer: [
              Answer(text: "Да", type: .ecoHero),
              Answer(text: "Много чего было посажено, но дерево пока нет", type: .almostEcoHero),
              Answer(text: "Нет, не собираюсь сажать", type: .ecoEnemy),
              Answer(text: "Нет, но собираюсь посадить", type: .almostEcoEnemy)
          ]),
          
          
          
          Question(text: "Какие лампочки горят у вас дома?", type: .multiple,
          answer: [
              Answer(text: "Лампы накаливания", type: .almostEcoEnemy),
              Answer(text: "Галогенные", type: .ecoEnemy),
              Answer(text: "Люминесцентные", type: .almostEcoHero),
              Answer(text: "Светодиодные", type: .ecoHero)
          ]),
          
          Question(text: "Вы выключаете свет, когда выходите из комнаты?", type: .ranged, answer: [
                Answer(text: "Не выключаю", type: .ecoEnemy),
                Answer(text: "Выключаю редко", type: .almostEcoEnemy),
                Answer(text: "Часто выключаю", type: .almostEcoHero),
                Answer(text: "Всегда выключаю", type: .ecoHero)
          ]),
          Question(text: "Пьёте ли вы воду из пластиковых бутылок?", type: .multiple,
          answer: [
              Answer(text: "Когда у меня нет другого выбора", type: .almostEcoHero),
              Answer(text: "Часто пью", type: .ecoEnemy),
              Answer(text: "Нет, я ношу с собой многоразовую ёмкость для воды", type: .ecoHero),
              Answer(text: "Пью время от времени", type: .almostEcoEnemy)
          ]),
          
          Question(text: "Как часто вы пьёте что-либо из одноразовых стаканчиков?)", type: .ranged, answer: [
              Answer(text: "Каждый день", type: .ecoEnemy),
              Answer(text: "4-5 раз в неделю", type: .almostEcoEnemy),
              Answer(text: "Пару раз в неделю", type: .almostEcoHero),
              Answer(text: "Никогда", type: .ecoHero)
          ]),
          
          Question(text: "В руках у вас мусор, но рядом не оказалось мусорки. Вы...", type: .multiple,
          answer: [
              Answer(text: "Выкинете мусор прямо на дорогу", type: .ecoEnemy),
              Answer(text: "Будете искать мусорку, пока не найдете", type: .almostEcoHero),
              Answer(text: "Положите мусор в карман и забудете о нём", type: .almostEcoEnemy),
              Answer(text: "Остортируете мусор, а затем его выкинете", type: .ecoHero)
          ]),
      ]
    
    var questionIndex = 0
    var answersChosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answer
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        navigationItem.title = "Вопрос № \(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        questionProgressiveView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        }
    }
    
    func updateSingleStack(using answers: [Answer]) {
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
        singleButton1.titleLabel?.textAlignment = .center
        singleButton2.titleLabel?.textAlignment = .center
        singleButton3.titleLabel?.textAlignment = .center
        singleButton4.titleLabel?.textAlignment = .center
    }
    
    func updateMultipleStack(using answers: [Answer]) {
        multipleStackView.isHidden = false
        
        multiSwitch1.isOn = false
        multiSwitch3.isOn = false
        multiSwitch2.isOn = false
        multiSwitch4.isOn = false
        
        multiLabel1.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text
    }
    
    func updateRangedStack(using answers: [Answer]) {
        rangedStackView.isHidden = false
        
        rangedSlider.setValue(0.5, animated: false)
        
        rangeLabel1.text = answers.first?.text
        rangeLabel2.text = answers.last?.text
    }
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answer
        
        switch sender {
        case singleButton1:
            answersChosen.append(currentAnswers[0])
        case singleButton2:
            answersChosen.append(currentAnswers[1])
        case singleButton3:
            answersChosen.append(currentAnswers[2])
        case singleButton4:
            answersChosen.append(currentAnswers[3])
        default:
            break
        }
        nextQuestion()
    }
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answer
        
        if multiSwitch1.isOn {
            answersChosen.append(currentAnswers[0])
        }
        if multiSwitch2.isOn {
            answersChosen.append(currentAnswers[1])
        }
        if multiSwitch3.isOn {
            answersChosen.append(currentAnswers[2])
        }
        if multiSwitch4.isOn {
            answersChosen.append(currentAnswers[3])
        }
        
        nextQuestion()
    }
    @IBAction func rangedAnswersButtonPressed() {
        let currentAnswers = questions[questionIndex].answer
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        
        answersChosen.append(currentAnswers[index])
        
        nextQuestion()
    }
    
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else{
            performSegue(withIdentifier: "Results", sender: nil)
        }
    }
    
    @IBSegueAction func showResults(_ coder: NSCoder) -> ResultsViewController? {
        return ResultsViewController(coder: coder, responses: answersChosen)
    }
}
