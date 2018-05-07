//
//  ViewController.swift
//  SwiftStudy1
//
//  Created by syk on 2018/5/1.
//  Copyright © 2018年 syk. All rights reserved.
//

import UIKit
import Alamofire
import SnapKit
import AlamofireObjectMapper
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var dataArray:[book]?
    var tableView:UITableView?
    let identifier = "YRJokeCellIdentifier"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//
//        let redView = UIView()
//        self.view.addSubview(redView)
//
//        redView.backgroundColor = UIColor.red

        // 创建约束
        
//        redView.snp.remakeConstraints { (make) in
//            // 距离上左下右各20
//            make.top.left.equalToSuperview().offset(20)
//            make.right.equalToSuperview().offset(-20)
//            make.height.equalTo(redView.snp.width).multipliedBy(0.5)
//        }
        
//        let jsonStr = "[{\"name\": \"hangge\", \"age\": 100, \"phones\": [{\"name\": \"公司\",\"number\": \"123456\"}, {\"name\": \"家庭\",\"number\": \"001\"}]}, {\"name\": \"big boss\",\"age\": 1,\"phones\": [{ \"name\": \"公司\",\"number\": \"111111\"}]}]"
        
        setupViews()
        webRequst()
        
        
        
    }

    
    func webRequst()  {
        let url = "https://api.douban.com/v2/book/search?q=%E6%96%87%E5%AD%A6"
        //注意返回的类型为<Mappable对象,NSError>
//        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
//            if(response.error == nil){
//                print("请求成功")
//                print(response.result.value)
//            }else{
//                print("请求失败\(String(describing: response.error))")
//            }
//        }
        
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseObject { (response: DataResponse<literature>) in
            let myResponse = response.result.value
            print(myResponse?.books)
            if let books = myResponse?.books{
                self.dataArray = books;
                self.tableView?.reloadData();
            }
        }
    }
    
    func setupViews()
    {
        
        self.dataArray = [book]();
        let width = UIScreen.main.bounds.size.width
        let height = self.view.frame.size.height
        self.tableView = UITableView(frame:CGRect(x: 0,y: 64,width: width,height: height-49-64))
        self.tableView?.delegate = self;
        self.tableView?.dataSource = self;
        self.tableView?.separatorStyle = .none
        self.tableView?.register(MyCell.self, forCellReuseIdentifier: identifier)
        self.view.addSubview(self.tableView!)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return  self.dataArray!.count;
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! MyCell
        let index = indexPath.row
        var book = dataArray![index]
        cell.book = book
        cell.descLab.text = book.subtitle
//        let data = self.dataArray[index] as! NSDictionary
//        cell.data = data
        return cell;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
//        let index = indexPath.row
//        return self.cellHeight[index] as! CGFloat
        return 150;
    }


}

