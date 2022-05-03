//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var strawberryStock: UILabel!
    @IBOutlet weak var bananaStock: UILabel!
    @IBOutlet weak var pineappleStock: UILabel!
    @IBOutlet weak var kiwiStock: UILabel!
    @IBOutlet weak var mangoStock: UILabel!
    
    private var juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitLabel()
    }
    
    @IBAction func orderJuice(_ sender: UIButton) {
        guard let juice = sender.currentTitle else { return }
        
        switch juice {
        case Menu.strawberryJuice.rawValue:
            condition(label: juice)
        case Menu.bananaJuice.rawValue:
            condition(label: juice)
        case Menu.pineappleJuice.rawValue:
            condition(label: juice)
        case Menu.kiwiJuice.rawValue:
            condition(label: juice)
        case Menu.mangoJuice.rawValue:
            condition(label: juice)
        case Menu.strawberryAndBananaJuice.rawValue:
            condition(label: juice)
        case Menu.mangoAndKiwiJuice.rawValue:
            condition(label: juice)
        default:
            break
        }
        updateFruitLabel()
    }
    
    @IBAction func tabfillStock(_ sender: Any) {
        changeView()
    }
    
    func updateFruitLabel() {
        strawberryStock.text = juiceMaker.store.stock[.strawberry]!.description
        bananaStock.text = juiceMaker.store.stock[.banana]!.description
        pineappleStock.text = juiceMaker.store.stock[.pineapple]!.description
        kiwiStock.text = juiceMaker.store.stock[.kiwi]!.description
        mangoStock.text = juiceMaker.store.stock[.mango]!.description
    }
    
    func condition(label: String) {
        do {
            try juiceMaker.make(menu: Menu(rawValue: label)!)
        } catch {
            showAlert()
        }
    }

    func showAlert() {
        let alarm = UIAlertController(title: "재고 부족", message: "수정하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "예", style: .default) { _ in
            self.changeView()
        }
        let noAction = UIAlertAction(title: "아니요", style: .destructive, handler: nil)
        
        alarm.addAction(noAction)
        alarm.addAction(okAction)
        
        present(alarm, animated: true)
    }
    
    func changeView() {
        guard let svc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else { return }
        svc.modalPresentationStyle = .fullScreen
        
        self.present(svc, animated: true)
    }
}

