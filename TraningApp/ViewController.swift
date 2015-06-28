//
//  ViewController.swift
//  TraningApp
//
//  Created by 比嘉　和之 on 2015/06/28.
//  Copyright (c) 2015年 比嘉　和之. All rights reserved..
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var testTableView: UITableView!
    
    //トレーニング部位のメニューをセット
    let menu:[String] = ["胸","肩","腕","足"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testTableView.delegate = self
        testTableView.dataSource = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // セクションのセルの行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    
    //セルの内容を変更
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = menu[indexPath.row]
        return cell
    }
    
    //セクションのタイトルを設定
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "メニュー"
    }
    
    //セルが選択された場合
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        //選択された部位の名前を取得
        var BuiName_ = menu[indexPath.row] as String
        
        //遷移先の画面のセット用の変数に設定
        var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.BuiName = BuiName_
        
        //セグエを呼び出し画面遷移する
        performSegueWithIdentifier("toSubView", sender: nil)
    }
    
    //次画面の表示設定
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //let subView:BuiViewController = segue.destinationViewController as! BuiViewController
        //subView.BuiName!.text = "筋肉"
    }
    
    
}

