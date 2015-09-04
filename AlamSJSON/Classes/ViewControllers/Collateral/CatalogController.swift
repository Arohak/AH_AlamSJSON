//
//  PageViewController.swift
//  ASR
//
//  Created by Ara Hakobyan on 5/19/15.
//  Copyright (c) 2015 Arohak LLC. All rights reserved.
//

class CatalogController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let cellIdentifire : String = "catalogCell"
    let catalogs = NSMutableArray()

    //MARK: - View Lifecycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.addAllUIElements()
        self.getCatalogs()
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
    }
    
    //MARK: - Constraints
    func setConstraints() {
        
        self.tableView.autoPinEdgeToSuperviewEdge(ALEdge.Top, withInset: 0)
        self.tableView.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(0, TS_INSET, 0, TS_INSET), excludingEdge: ALEdge.Top)
    }
    
    //MARK: - Custom methods
    func addAllUIElements() {

        self.view.addSubview(self.tableView)
        self.setConstraints()
    }
    
    func getCatalogs() {
        
        APIHelper.sharedInstance.getCatalogs { (data, error) in
            
            for catalog in data as! NSArray {
                var cat = Catalog(catalogJSON: catalog as! NSDictionary)
                self.catalogs.addObject(cat)
            }
            self.tableView.reloadData()
        }
    }
    
    //MARK: - Actions
    func openDateList(sender: UIButton) {
        
    }
    
    //MARK: - UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.catalogs.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: CatalogCell! = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifire) as? CatalogCell;
        cell.selectionStyle = UITableViewCellSelectionStyle.None;
        cell.backgroundColor = BLACK
        
        let catalog: Catalog = self.catalogs[indexPath.row] as! Catalog;
        
        cell.title.text = catalog.title
        cell.desc.text = catalog.desc
        cell.price.text = "$\(catalog.price!)"
        cell.logoImageView.setImageWithUrl(NSURL(string: catalog.img_url!)!, placeHolderImage: UIImage(named: ""))
        
        cell.setNeedsUpdateConstraints()
        cell.updateConstraintsIfNeeded()

        return cell;
    }
    
    //MARK: - Lazy initialization of members
    lazy var tableView : UITableView = {
        var table = UITableView.newAutoLayoutView()
        table.backgroundColor = BLACK
        table.separatorStyle = UITableViewCellSeparatorStyle.None
        table.delegate = self
        table.dataSource = self
        table.estimatedRowHeight = 40
        table.rowHeight = UITableViewAutomaticDimension
        table.registerClass(CatalogCell.classForCoder(), forCellReuseIdentifier: self.cellIdentifire)
        table.showsVerticalScrollIndicator = false
        
        return table
        }()
}
