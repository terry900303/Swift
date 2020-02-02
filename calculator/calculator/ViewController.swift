//
//  ViewController.swift
//  calculator
//
//  Created by 吳俊龍 on 2020/1/27.
//  Copyright © 2020 com.jyunLong. All rights reserved.
//小數點，單一個０重複不能按不能連續出現

import UIKit

enum op2 {//資料型態op2, 地位等同於int String
    case nothing
    case add
    case minus
    case multi
    case divide
}
class ViewController: UIViewController {
    //var op = 0
    //0：nothing
    //1: 加
    //2:減
    //3:乘
    //4:除
    
    let formatter = NumberFormatter()
    
    var signal:op2 = .nothing
    
    var firstNum:Double = 0
    var secondNum:Double = 0

    @IBOutlet weak var showLabel: UILabel!
    func checkNumber(labelText:String) -> String{

        var stringOfNumber : NSNumber
        stringOfNumber = formatter.number (from: labelText)!
        return String(describing: stringOfNumber)
        
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        formatter.numberStyle = .decimal
        
        showLabel.text = "0"
        //var str:String?//安全型別： 用問號這個箱子把資料包起來，這樣子的話，程式碼就算這邊給錯誤值，也不會當機
//        printSth()
//        let apple = 5, dog = 3
//        let ccc =  twoValueAdd(a: apple, b: dog)
//        print(ccc)
//
        
        
    }
//    func printSth()->(){
//        print("AAA", terminator:"B")
//    
//        print("AAA")
//    }
//    func functionName(代入的參數1的名字：資料型態,代入的參數2的名字：資料型態) ->(return出去的回傳值資料型態){
//        //do sth
//        return sth
//    }
//    func twoValueAdd(a:Int, b:Int)->(Int)
//    {
//        let c = a + b
//        return c
//    }
    
    @IBAction func dotAct(_ sender: UIButton) {
        // contains 是用來判斷字串是否含有小數點
        
        if (showLabel.text?.contains("."))!{
            //true：這個label裡面有小數點，就什麼事都不做
        }else{
            //false: 這個label裡面沒有小數點，目前按下小數點。需要補一個小數點進來。
            showLabel.text = (showLabel.text)! + "."

        }
    }
    @IBAction func zeroAct(_ sender: UIButton) {
        showLabel.text = (showLabel.text)! + "0"
        
        if (showLabel.text?.contains("."))!{
            
            //true：這個label裡面有小數點，所以不用處理數字很多零的問題
        }else
        {
            //false: 這個label裡面沒有小數點，要處理數字很多重複零的問題。

            showLabel.text! = checkNumber(labelText: showLabel.text!)

        }

    }
    
    @IBAction func oneAct(_ sender: UIButton)
    {
        showLabel.text = (showLabel.text)! + "1"//驚嘆號是一個鑰匙，可以強迫打開問號箱子，算是暴力破解法。
        showLabel.text! = checkNumber(labelText: showLabel.text!)

    }
    
    @IBAction func twoAct(_ sender: UIButton) {
        showLabel.text = (showLabel.text)! + "2"
        showLabel.text! = checkNumber(labelText: showLabel.text!)

        
    }
    
    @IBAction func threeAct(_ sender: UIButton) {
        showLabel.text = (showLabel.text)! + "3"
        showLabel.text! = checkNumber(labelText: showLabel.text!)

    }
    
    @IBAction func fourAct(_ sender: UIButton) {
        showLabel.text = (showLabel.text)! + "4"
        showLabel.text! = checkNumber(labelText: showLabel.text!)

    }  
    
    @IBAction func fiveAct(_ sender: UIButton) {
        showLabel.text = (showLabel.text)! + "5"
        showLabel.text! = checkNumber(labelText: showLabel.text!)

    }
    
    @IBAction func sixAct(_ sender: UIButton) {
        showLabel.text = (showLabel.text)! + "6"
        showLabel.text! = checkNumber(labelText: showLabel.text!)

    }
    
    
    @IBAction func sevenAct(_ sender: UIButton) {
        showLabel.text = (showLabel.text)! + "7"
        showLabel.text! = checkNumber(labelText: showLabel.text!)

    }
    
    @IBAction func eightAct(_ sender: UIButton) {
        showLabel.text = (showLabel.text)! + "8"
        showLabel.text! = checkNumber(labelText: showLabel.text!)

    }
    
    @IBAction func nineAct(_ sender: UIButton) {
        showLabel.text = (showLabel.text)! + "9"
        showLabel.text! = checkNumber(labelText: showLabel.text!)

    }
    
    @IBAction func plusAct(_ sender: UIButton) {
        firstNum = Double((showLabel.text)!)!
        showLabel.text = "0"
        //op = 1
        signal = .add
        
    }
    
    @IBAction func minusAct(_ sender: UIButton) {
        firstNum = Double((showLabel.text)!)!
        showLabel.text = "0"
        signal = .minus
    }
    
    @IBAction func multiAct(_ sender: UIButton) {
        firstNum = Double((showLabel.text)!)!
        showLabel.text = "0"
        signal = .multi
        
        
    }
    
    @IBAction func divAct(_ sender: UIButton) {
        firstNum = Double((showLabel.text)!)!
        showLabel.text = "0"
        signal = .divide
        
    }
           var finalNumber : Double = 0.0
    @IBAction func equal(_ sender: UIButton) {
        //1.先用一個secondNum變數把 int(string) 接起來
        secondNum = Double((showLabel.text)!)!
        //2.判斷剛剛是按下+-*/哪一個按鈕，才能處理firstNum  跟 secondNum
        switch signal {
        case .nothing:
            break
        case .add:
            finalNumber = firstNum + secondNum
            showLabel.text! = checkNumber(labelText:String(finalNumber))
            signal = .nothing
            
        case .minus:
            finalNumber = firstNum - secondNum
            showLabel.text! = checkNumber(labelText:String(finalNumber))
            signal = .nothing
            
        case .multi:
            finalNumber = firstNum * secondNum
            showLabel.text! = checkNumber(labelText:String(finalNumber))
            signal = .nothing
            
        case .divide:
            finalNumber = firstNum / secondNum
            showLabel.text! = checkNumber(labelText:String(finalNumber))
            signal = .nothing
            
        default:
            break
        }
    }
    
    @IBAction func restartAct(_ sender: UIButton)
    {
        showLabel.text = "0"
        firstNum = 0
        secondNum = 0
        signal = .nothing
    
    }
    
    }
    //swift的資料型態（type）
    //int表示整數
    //float, double 表示浮點數
    //charactor 表示字元，也就是單一顆英文字母
    //string表示字串，也就是給使用者看的文字數字都是字串型態
//ex: xxxLabel.text = "ssss"
    
    



