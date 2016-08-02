
//
//  CustomCell.swift
//  Animation-Week2
//
//  Created by GM on 16/8/1.
//  Copyright © 2016年 LGM. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    var backView : UIView?
    var backImageView : UIImageView?
    let lastCellHei : CGFloat = 200;
    let selfHei :CGFloat = 75
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backView = UIView(frame:self.bounds);
        self.addSubview(self.backView!);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func cellOffsetOnTableView(tableView:UITableView){

        let currentLocation : CGFloat = tableView.contentOffset.y + lastCellHei;
        let screenWid = UIScreen.mainScreen().bounds.width;

        if tableView.contentOffset.y + lastCellHei - selfHei > self.frame.origin.y{
            self.backView?.frame = CGRectMake(0, -(lastCellHei - selfHei), screenWid, lastCellHei);
            print("1",self.backView?.frame);
        }else if (self.frame.origin.y >= tableView.contentOffset.y) && (self.frame.origin.y <= currentLocation) {
            let tmp = abs(self.frame.origin.y - currentLocation);
            let moveY = tmp  * (lastCellHei - selfHei) / selfHei;
            self.superview?.bringSubviewToFront(self);
            self.backView?.frame = CGRectMake(0, -moveY, screenWid, selfHei+moveY);
            print("2",self.backView?.frame,"moveY=",moveY,"tmp=",tmp,"selfHei=",selfHei,"(lastCellHei - selfHei)=",(lastCellHei - selfHei));
        }else{
            self.backView?.frame = CGRectMake(0, 0, screenWid, selfHei);
            print("3",self.backView?.frame);
        }
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
