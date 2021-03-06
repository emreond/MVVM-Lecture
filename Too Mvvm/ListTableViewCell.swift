//
//  ListTableViewCell.swift
//  Too Mvvm
//
//  Created by Emre on 8.12.2019.
//  Copyright © 2019 Emre. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
       var data: Task? {
            didSet {
                self.taskNameLabel.text = data!.title
                self.taskCheckBox.isChecked = data!.isDone
            }
        }
        
        private let taskNameLabel = UILabel()
        private let taskCheckBox: Checkbox = {
            let i = Checkbox()
            i.borderStyle = .circle
            i.checkmarkStyle = Checkbox.CheckmarkStyle.tick
            i.borderWidth = 6
            i.uncheckedBorderColor = Colors.gooodBlue
            i.checkedBorderColor = Colors.gooodBlue
            i.checkmarkSize = 0.5
            i.checkmarkColor = UIColor.white
            return i
        }()
    
        // MARK: Initalizers
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            self.backgroundColor = UIColor.white
            
            // configure label
            contentView.addSubview(taskNameLabel)
            contentView.addSubview(taskCheckBox)
            
            taskCheckBox.translatesAutoresizingMaskIntoConstraints = false
            taskCheckBox.widthAnchor.constraint(equalTo: taskCheckBox.heightAnchor).isActive = true
            taskCheckBox.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
            let bottomAnchor = taskCheckBox.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
            bottomAnchor.priority = UILayoutPriority(rawValue: 999)
            bottomAnchor.isActive = true
            taskCheckBox.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 20).isActive = true
            
            taskNameLabel.translatesAutoresizingMaskIntoConstraints = false
            taskNameLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
            taskNameLabel.leftAnchor.constraint(equalTo: taskCheckBox.rightAnchor, constant: 20).isActive = true
            taskNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -60).isActive = true
            taskNameLabel.numberOfLines = 1
            taskNameLabel.textColor = UIColor(red:0.32, green:0.36, blue:0.36, alpha:1.0)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func prepareForReuse() {
            super.prepareForReuse()
        }
        
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }
    }
