//
//  ViewController.swift
//  Swift5TableViewBasic
//
//  Created by 玉城秀大 on 2020/11/10.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var textField: UITextField!
    
    var textArray = [String]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        textField.delegate = self
        
    }
    
    //複数回、画面が表示されるたびに呼ばれる
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //ナビゲーションバーがなくなる
        navigationController?.isNavigationBarHidden = true
    }
    
    //セクションの中のセルの数を決める
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return textArray.count
        
    }

    //セクションの数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //セルの中身を構築される時に呼ばれるデリゲートメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        //indexPath.rowは、配列が下から数えられる
        cell.textLabel?.text = textArray[indexPath.row]
        cell.imageView!.image = UIImage(named: "checkImage")
        cell.selectionStyle = .none
        
        return cell
        
    }

    //セルがタップした後に呼ばれるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //タップした時にその配列の番号の中身を取り出して値を渡す
        let nextVC = storyboard?.instantiateViewController(identifier: "next") as! NextViewController

        nextVC.todoString = textArray[indexPath.row]
        
                    navigationController?.pushViewController(nextVC, animated: true)
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height / 6
    }
    
    //キーボードのリターンキーが押された時に行われるメソッド
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //テキストアレイの中にテキストフィールドの値を入れる
        textArray.append(textField.text!)
        //キーボードを閉じる
        textField.resignFirstResponder()
        //テキストフィールドを空にする
        textField.text = ""
        //
        tableView.reloadData()
        
        return true
        
    }
    
    
    
    
}

