//
//  MyCell.swift
//  SwiftStudy1
//
//  Created by syk on 2018/5/2.
//  Copyright © 2018年 syk. All rights reserved.
//

import UIKit
import SnapKit


class MyCell: UITableViewCell {
    var book:book?
    var icon:UIImageView!
    var descLab:UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.setupViews()
        self.selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        icon = UIImageView.init()
        icon.backgroundColor = UIColor.red
        descLab = UILabel.init()
        descLab?.backgroundColor = UIColor.red
        descLab.numberOfLines = 0
        self.contentView.addSubview(icon!)
        self.contentView.addSubview(descLab!)
        
        icon?.snp.remakeConstraints({ (make) in
            make.top.left.equalTo(10);
            make.bottom.equalTo(-10)
            make.width.equalTo(icon.snp.height)
        })
        
        descLab.snp.remakeConstraints { (make) in
            make.centerY.equalTo(icon.snp.centerY)
            make.left.equalTo(icon.snp.right).offset(20)
        }

    }
}
