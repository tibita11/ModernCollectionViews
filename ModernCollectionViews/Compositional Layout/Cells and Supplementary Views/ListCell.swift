//
//  ListCell.swift
//  ModernCollectionViews
//
//  Created by 鈴木楓香 on 2023/10/22.
//

import UIKit
import PinLayout

class ListCell: UICollectionViewCell {
    let label = UILabel()
    let accessoryImageView = UIImageView(image: UIImage(systemName: "chevron.right"))
    let separatorView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ListCell {
    func configure() {
        label.textAlignment = .left
        contentView.addSubview(label)
        accessoryImageView.tintColor = UIColor.lightGray.withAlphaComponent(0.7)
        contentView.addSubview(accessoryImageView)
        separatorView.backgroundColor = .lightGray
        contentView.addSubview(separatorView)
        
        accessoryImageView.pin.width(13).height(20).vCenter().right()
        label.pin.before(of: accessoryImageView).left().top().bottom()
        separatorView.pin.left().bottom().right().height(0.5)
    }
}
