//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    private var stock = [Fruit: Int]()
    
    init(defaultStock: Int) {
        Fruit.allCases.forEach {
            stock[$0] = defaultStock
        }
    }

    func notifyStock(fruit: Fruit) -> Int {
        guard let currentCount = stock[fruit] else {
            return 0
        }
        return currentCount
    }
    
    func hasFruit(menu: Menu) -> Bool {
        let necessaryFruit = menu.count()
        
        for (fruit, need) in necessaryFruit {
            guard let number = stock[fruit] else {
                continue
            }
            if number < need {
                return false
            }
        }
        return true
    }
    
    func decreaseStock(menu: Menu) {
        let necessaryFruit = menu.count()
        
        for (fruit, need) in necessaryFruit {
            guard let number = stock[fruit] else {
                return
            }
            stock[fruit] = number - need
        }
    }
    
    func fillStock(fruit: Fruit, total: Int) {
        guard let number = stock[fruit] else {
            return
        }
        stock[fruit] = number + total
    }
}
