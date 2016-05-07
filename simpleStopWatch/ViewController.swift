//
//  ViewController.swift
//  simpleStopWatch
//
//  Created by morita on 2016/05/06.
//  Copyright © 2016年 morita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var time: UILabel!
    
    
    var timer: NSTimer!
    
    var count = 0.0
    
    var countMinitues = 0
    
    var countSeconds = 0
    
    @IBOutlet weak var minituesLabel: UILabel!
    
    @IBOutlet weak var secondsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target:self, selector: Selector("hoge"), userInfo:nil, repeats: true)
        startButtonTap("nil")

    }
    @IBAction func startButtonTap(sender: AnyObject) {
        
        print("start")
        
        if(timer.valid){
            //timerが生きている
            timer.invalidate()
        }else{
            //timerが死んでる
            print("stop")
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target:self, selector: Selector("hoge"), userInfo:nil, repeats: true)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    @IBAction func stopButtonTap(sender: AnyObject) {
        print("stop")
        timer.invalidate()
        
    }
    
    @IBAction func clearButtonTap(sender: AnyObject) {
        timer.invalidate()
        self.secondsLabel.text = "0"
        self.minituesLabel.text = "0"
        count = 0
    }
    
    func hoge(){
    
        count = count + 0.1
        //print(count)
        //上のカウント＿秒
        var scondsTmp = count
        let df1 = NSString(format: "%03.1f" , scondsTmp)
        print(df1)
        //let df1 = scondsTmp
        //print(df1)
        
        if(df1 == NSString(format: "%03.1f" , 60.0)){
            print("うえ")
            countSeconds = 0
            self.secondsLabel.text = "0"
            count = 0
            
            //上のカウント＿分
            countMinitues++
            self.minituesLabel.text = "\(countMinitues)"
        }else{
            self.secondsLabel.text = "\(df1)"
            //上のカウント＿分
            self.minituesLabel.text = "\(countMinitues)"
        }
    }

}

