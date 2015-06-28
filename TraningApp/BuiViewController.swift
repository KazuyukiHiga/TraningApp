//
//  BuiViewController.swift
//  tableViewtest
//
//  Created by 比嘉　和之 on 2015/06/28.
//  Copyright (c) 2015年 比嘉　和之. All rights reserved.
//

import UIKit

class BuiViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var BuiName: UILabel!
    @IBOutlet weak var SubViewCell: UITableView!
    
    //部位の名称を保持する変数※判定用に使用
    var Buiname_global:String = ""
    //胸のトレーニングメニュー
    var mune:[String] = ["ベンチプレス","インクラインプレス","フライ","ダンベルフライ"]
    //胸の重量
    var mune_omosa:[String] = ["60","50","40","30"]
    //足のトレーニングメニュー
    var ashi:[String] = ["スクワット","レッグプレス","レッグエクステンション"]
    //足の重量
    var ashi_omosa:[String] = ["10","20","30"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //前画面から取得した文字列を画面にセット
        var appDelegete:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let bui:String? = appDelegete.BuiName
        
        //グローバル変数にセット
        Buiname_global = bui!
        
        //画面に表示するラベルにセット
        let name:String = "の管理画面"
        BuiName.text = bui! + name
        
        //テーブルビューを作成
        let tableView = UITableView(frame: self.view.frame, style: UITableViewStyle.Grouped)
        self.view.addSubview(tableView)
        
        //デリゲート設定
        tableView.delegate = self
        tableView.dataSource = self
        
        //xibファイルを読み込みこのViewに設定する
        let xib = UINib(nibName: "BuiViewTableViewCell", bundle: nil)
        tableView.registerNib(xib, forCellReuseIdentifier: "BuiViewCell")

        // Do any additional setup after loading the view.
    }
    
    //セクションのセルの数を設定
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //選ばれた部位によってリターンするカウントを変更する
        if (Buiname_global == "胸") {
            return mune.count
        } else if (Buiname_global == "足") {
            return ashi.count
        } else {
            return 1
        }
    }
    
    //セクションに表示するオブジェクトを設定
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "subCell")
        
        let cell = tableView.dequeueReusableCellWithIdentifier("BuiViewCell") as! BuiViewTableViewCell
        
        //前画面からのもらった情報によってどの部位のトレーニングメニューを表示するか判定
        //胸が選択された場合
        if (Buiname_global == "胸") {
            cell.BuiName.text = mune[indexPath.row]
            cell.Kg.text = mune_omosa[indexPath.row]
        } else if (Buiname_global == "足") {
            //足が選択された場合
            cell.BuiName.text = ashi[indexPath.row]
            cell.Kg.text = ashi[indexPath.row]
        } else {
            cell.BuiName.text = "エラー"
            cell.Kg.text = "エラー"
        }
        
        //設定したセルをリターン
        return cell
        
    }
    //セクションの数を設定
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
