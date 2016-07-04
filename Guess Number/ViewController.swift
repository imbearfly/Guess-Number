//
//  ViewController.swift
//  Guess Number
//
//  Created by Fly on 2016/7/4.
//  Copyright © 2016年 Fly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var randNum = Int(arc4random_uniform(100)+1)
    @IBOutlet weak var inputNum: UITextField!
    @IBOutlet weak var minNum: UILabel!
    @IBOutlet weak var maxNum: UILabel!
    @IBOutlet weak var guessBtn: UIButton!
    @IBOutlet weak var timesRemain: UILabel!
    
    
    @IBAction func guessBtnAction(_ sender: UIButton) {
        let input:Int? = Int(inputNum.text!)
        let min:Int? = Int(minNum.text!)
        let max:Int? = Int(maxNum.text!)
        let remainTimes:Int? = Int(timesRemain.text!)
        if remainTimes! > 0{
            if let input = input, let min = min, let max = max {
                if input < randNum {
                    if input > min && remainTimes != 1 {
                        minNum.text = String(input)
                        timesRemain.text = String(Int(timesRemain.text!)!-1)
                        inputNum.text = ""
                    }else if input > min && remainTimes == 1 {
                        alertRestartMessage(isWin: false)
                    }else if input < min{
                        alertMessage(message: "Guess Bigger!!")
                        inputNum.text = ""
                    }
                }else if input > randNum {
                    if input < max && remainTimes != 1 {
                        maxNum.text = String(input)
                        timesRemain.text = String(Int(timesRemain.text!)!-1)
                        inputNum.text = ""
                    }else if input < max && remainTimes == 1 {
                        alertRestartMessage(isWin: false)
                    }else if input > max{
                        alertMessage(message: "Guess Smaller!!")
                        inputNum.text = ""
                    }

                }else if input == randNum {
                    alertRestartMessage(isWin: true)
                }
            }
        }else{
            alertRestartMessage(isWin: false)
        }
        
    }
    
    func alertMessage(message:String){
        let alertController = UIAlertController(title: "Hey!", message: "\(message)", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "I see", style: UIAlertActionStyle.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func alertRestartMessage(isWin:Bool){
        if(!isWin){
            let alertController = UIAlertController(title: "oops..", message: "Game Over, the answer is \(randNum)", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Let's try it again!", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertController, animated: true, completion: resetGame)
        }else {
            let alertController = UIAlertController(title: "Congra!!", message: "You win the game! the answer is \(randNum)", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Let's play again!", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertController, animated: true, completion: resetGame)
        }
    }
    
    func resetGame(){
        minNum.text = "0"
        maxNum.text = "100"
        inputNum.text = ""
        timesRemain.text = "6"
        randNum = Int(arc4random_uniform(100)+1)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

