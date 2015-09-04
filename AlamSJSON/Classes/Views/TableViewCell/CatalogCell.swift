//
//  TradesSummaryCell.swift
//  ASR
//
//  Created by Ara Hakobyan on 7/29/15.
//  Copyright (c) 2015 Arohak LLC. All rights reserved.
//

class CatalogCell: UITableViewCell {
    
    var title: UILabel = UILabel.newAutoLayoutView()
    var desc: UILabel = UILabel.newAutoLayoutView()
    var price: UILabel = UILabel.newAutoLayoutView()
    var logoImageView: UIImageView = UIImageView.newAutoLayoutView()
    var lineImage: UIImageView = UIImageView.newAutoLayoutView()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.contentView.addSubview(self.title)
        self.contentView.addSubview(self.desc)
        self.contentView.addSubview(self.price)
        self.contentView.addSubview(self.logoImageView)
        self.contentView.addSubview(self.lineImage)

        self.title.textColor = BLUE
        self.title.font = FIC_NAME_FONT
        self.title.numberOfLines = 0
        self.title.autoPinEdgeToSuperviewEdge(ALEdge.Top, withInset: FIC_OFFSET)
        self.title.autoPinEdge(ALEdge.Left, toEdge: ALEdge.Right, ofView: self.logoImageView, withOffset: FIC_OFFSET)
        self.title.autoPinEdgeToSuperviewEdge(ALEdge.Right, withInset: FIC_OFFSET)

        self.desc.textColor = WHITE
        self.desc.font = FIC_LBL_FONT
        self.desc.numberOfLines = 0
        self.desc.autoPinEdge(ALEdge.Top, toEdge: ALEdge.Bottom, ofView: self.title, withOffset: FIC_OFFSET)
        self.desc.autoPinEdge(ALEdge.Left, toEdge: ALEdge.Right, ofView: self.logoImageView, withOffset: FIC_OFFSET)
        self.desc.autoPinEdgeToSuperviewEdge(ALEdge.Right, withInset: FIC_OFFSET)
        
        self.price.textColor = UIColor.orangeColor()
        self.price.font = FIC_LBL_FONT
        self.price.numberOfLines = 0
        self.price.autoPinEdge(ALEdge.Top, toEdge: ALEdge.Bottom, ofView: self.desc, withOffset: FIC_OFFSET)
        self.price.autoPinEdge(ALEdge.Left, toEdge: ALEdge.Right, ofView: self.logoImageView, withOffset: FIC_OFFSET)
        
        self.logoImageView.image = UIImage(named: "img_fileType")
        self.logoImageView.autoAlignAxisToSuperviewAxis(ALAxis.Horizontal)
        self.logoImageView.autoPinEdgeToSuperviewEdge(ALEdge.Left)
        self.logoImageView.autoSetDimensionsToSize(CGSizeMake(50, 50))
        
        self.lineImage.image = UIImage(named: "line.png")
        self.lineImage.autoPinEdge(ALEdge.Top, toEdge: ALEdge.Bottom, ofView: self.price, withOffset: FIC_OFFSET)
        self.lineImage.autoPinEdgeToSuperviewEdge(ALEdge.Bottom)
        self.lineImage.autoSetDimensionsToSize(CGSizeMake(self.frame.size.width, 1))
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}