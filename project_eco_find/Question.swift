//
//  Question.swift
//  project_eco_find
//
//  Created by Надя Мурдашева on 22.08.2020.
//  Copyright © 2020 Надя Мурдашева. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answer: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    var text: String
    var type: AnimalType
}

enum AnimalType: String {
    case ecoHero = "настоящий эко-герой", almostEcoHero = "часто задумываетесь о будущем планеты", almostEcoEnemy = "иногда задумываетесь о том, как сохранить природу", ecoEnemy = "редко задумываетесь об экологичном образе жизни"
    
    var definition: String {
        switch self {
        case .ecoHero:
            return "Вы ведёте экологичный образ жизни, сортируете мусор, заботитесь о ресурсах планеты. Продолжайте в том же духе!"
        case .almostEcoHero:
            return "Вы стараетесь вести экологичный образ жизни, но у вас не всё в этом плане получается идеально. Не беспокойтесь! Приложите еще немного усилий, и вы станете настоящим эко-героем!"
        case .almostEcoEnemy:
            return "Вы иногда совершаете действия по предотвращению дальнейшего загрязнения планеты и стараетесь уменьшить свой экологический след. Но вы только в начале пути. Приложите больше усилий, и тогда вы станете настоящим эко-героем! Будущее планеты в ваших руках! "
        case .ecoEnemy:
            return "Вы практически незнакомы с сортировкой мусора и ещё не предпринимали шагов к спасению планеты от загрязнения. Не беда, вы можете начать прямо сейчас! Изучите, как вести экологичный образ жизни, и тогда вы сможете принести этой планете огромную пользу!"
        }
    }
}
