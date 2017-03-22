//
//  RootViewController.swift
//  LargerIMG
//
//  Created by sqluo on 2017/3/21.
//  Copyright © 2017年 sqluo. All rights reserved.
//

import UIKit



class RootViewController: UIViewController ,UITableViewDelegate ,UITableViewDataSource{

    
    fileprivate let dataArray = ["CollectionViewController"]
    
    
    fileprivate var myTabView: UITableView?
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "RootVC"
        self.view.backgroundColor = UIColor.red
        
        let rect = self.view.bounds
        myTabView = UITableView(frame: rect, style: .plain)
        
        myTabView?.delegate = self
        myTabView?.dataSource = self
        
        myTabView?.tableFooterView = UIView()
        
        self.view.addSubview(myTabView!)
        
        
    }
    
    override func viewWillLayoutSubviews() {
        let widt = self.view.frame.width
        
        print(widt)
        
        myTabView?.frame = self.view.bounds
        
        
        print("....")
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        
//        let widt = self.view.frame.width
//        
//        print(widt)
//        
//        myTabView?.frame = self.view.bounds
//        
//        
//        print("....")
//    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let idf = "Cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: idf)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: idf)
        }
        cell?.textLabel?.text = self.dataArray[indexPath.row]
        
     
        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let ctr = self.dataArray[indexPath.row].classType(){
            self.navigationController?.pushViewController(ctr, animated: true)
        }
        
        
    }
    

}
