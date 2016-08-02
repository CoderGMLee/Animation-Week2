//
//  ViewController.swift
//  Animation-Week2
//
//  Created by GM on 16/8/1.
//  Copyright © 2016年 LGM. All rights reserved.
//

import UIKit
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView:UITableView?
    let screenHei = UIScreen.mainScreen().bounds.height;
    let screenWid = UIScreen.mainScreen().bounds.width;


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setupTableView();
    }

    func setupTableView(){

        tableView = UITableView(frame: CGRectMake(0, 0, screenWid, screenHei),style:.Plain);
        tableView?.delegate = self;
        tableView?.dataSource = self;
        tableView?.contentInset = UIEdgeInsetsMake(200 - 75, 0, (tableView?.frame.size.height)! - 200, 0);
        tableView?.separatorStyle = .None;
        self.view.addSubview(tableView!);

        tableView?.registerClass(CustomCell.self, forCellReuseIdentifier: "CustomCell");

    }
    //UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20;
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("CustomCell", forIndexPath: indexPath) as? CustomCell;
        let randRed :CGFloat = CGFloat(arc4random() % 255);
        let randGreen :CGFloat = CGFloat(arc4random() % 255);
        let randBlue :CGFloat = CGFloat(arc4random() % 255);
        cell?.backView?.backgroundColor = UIColor(red: randRed/255,green: randGreen/255,blue: randBlue/255,alpha: 1);
        cell?.cellOffsetOnTableView(tableView);
        cell?.selectionStyle = .None;
        return cell!;
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75;
    }
    //ScrollViewDelegate
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let visibleCells = tableView!.visibleCells
        for cell in visibleCells {
            let customCell = cell as! CustomCell;
            customCell.cellOffsetOnTableView(tableView!);
        }
    }

}

