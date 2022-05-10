//
//  EditStockViewController.swift
//  JuiceMaker
//
//  Created by hugh, yeton on 2022/05/03.
//

import UIKit

class EditStockViewController: UIViewController {
    var fruitStock = [Fruit: Int]()
    private var stepperValue: Double = 0.0
    
    var delegate: DeliveryStock?
    
    @IBOutlet var fruitStockLabel: [FruitStockLabel]!
    @IBOutlet var editStockStepper: [EditStockStepper]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateFruitStockLabel(stock: fruitStock)
        
        editStockStepper.forEach { stepper in
            stepper.addTarget(self, action: #selector(stepFruit(_:)), for: .valueChanged)
            
            guard let fruit = stepper.convertToFruit(),
                    let amount = fruitStock[fruit]
            else {
                return
            }
            stepper.minimumValue = Double(-amount)
        }
    }
    
    @IBAction func tapCloseButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func updateFruitStockLabel(stock: [Fruit: Int]) {
        fruitStockLabel.forEach { label in
            guard let fruit = label.convertToFruit() else { return }
            guard let fruitLabel = stock[fruit] else { return }
            
            label.text = "\(fruitLabel)"
        }
    }
    
    @objc func stepFruit(_ sender: EditStockStepper) {
        guard let fruit = sender.convertToFruit() else { return }
        guard let stock = fruitStock[fruit] else { return }
        
        if sender.value > stepperValue {
            delegate?.fill(fruit: fruit, amount: 1)
            stepperValue = sender.value
            fruitStock[fruit] = stock + 1
        } else {
            delegate?.fill(fruit: fruit, amount: -1)
            stepperValue = sender.value
            fruitStock[fruit] = stock - 1
        }
        updateFruitStockLabel(stock: fruitStock)
    }
}
