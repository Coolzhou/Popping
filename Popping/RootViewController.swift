//
//  RootViewController.swift
//  Popping
//
//  Created by Apple on 2018/3/20.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class RootViewController: UITableViewController {
    
    var items = [["Button Animation",ButtonViewController()],
                 ["Decay Animation",DecayViewController()],
                 ["Circle Animation",DecayViewController()],
                 ["Image Animation",DecayViewController()],
                 ["Custom Transition",DecayViewController()],
                 ["Paper Button Animation",DecayViewController()],
                 ["Folding Animation",DecayViewController()],
                 ["Password Indicator Animation",DecayViewController()],
                 ["Constraints Animation",ConstraintsViewController()]]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

        self.navigationItem.title = "Popping"
        
        configureTableView()
    }
    
    func configureTableView(){
        
        self.tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MenuTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuTableViewCell
        cell.textLabel?.text = titleForRowAtIndexPath(indexPath: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = items[indexPath.row].last as! UIViewController
        viewController.title = titleForRowAtIndexPath(indexPath: indexPath)
        viewController.view.backgroundColor = UIColor.white
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func titleForRowAtIndexPath(indexPath:IndexPath) -> String {
        return items[indexPath.row].first as! String
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
