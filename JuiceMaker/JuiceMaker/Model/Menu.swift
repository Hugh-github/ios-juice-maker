//
//  Menu.swift
//  JuiceMaker
//
//  Created by hugh, yeton on 2022/04/27.
//

enum Menu: String {
    case strawberryJuice = "딸기쥬스 주문"
    case bananaJuice = "바나나쥬스 주문"
    case pineappleJuice = "파인애플쥬스 주문"
    case kiwiJuice = "키위쥬스 주문"
    case mangoJuice = "망고쥬스 주문"
    case strawberryAndBananaJuice = "딸바쥬스 주문"
    case mangoAndKiwiJuice = "망키쥬스 주문"
    
    private var recipe: [Fruit: Int] {
        switch self {
        case .strawberryJuice:
            return [.strawberry: 16]
        case .bananaJuice:
            return [.banana: 2]
        case .pineappleJuice:
            return [.pineapple: 2]
        case .kiwiJuice:
            return [.kiwi: 3]
        case .mangoJuice:
            return [.mango: 3]
        case .strawberryAndBananaJuice:
            return [.strawberry: 10, .banana: 1]
        case .mangoAndKiwiJuice:
            return [.mango: 2, .kiwi: 1]
        }
    }
    
    func count() -> [Fruit: Int] {
        var countList: [Fruit: Int] = [:]
        
        for (fruit, need) in self.recipe {
            countList.updateValue(need, forKey: fruit)
        }
        return countList
    }
}

