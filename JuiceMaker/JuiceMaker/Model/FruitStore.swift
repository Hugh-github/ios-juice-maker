//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    var stock: [Fruit: Int] = [.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10]
    
    func hasFruit(menu: Menu) -> Bool {
        let necessaryFruit = menu.count()
        
        for (fruit, need) in necessaryFruit {
            guard let number = stock[fruit] else { continue }
            if number < need {
                return false
            }
        }
        return true
    }
    
    func decreaseStock(menu: Menu) {
        let necessaryFruit = menu.count()
        
        for (fruit, need) in necessaryFruit {
            guard hasFruit(menu: menu) else {
                return
            }
            
            guard let number = stock[fruit] else {
                return
            }
            
            stock[fruit] = number - need
        }
    }
    
    func fillStock(fruit: Fruit, total: Int) {
        guard let number = stock[fruit] else { return }
        stock[fruit] = number + total
    }
}
