//
//  CartCell.h
//  D2D
//
//  Created by jaya prakash rao polsani on 28/12/12.
//  Copyright (c) 2012 jaya prakash rao polsani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CartCell : UITableViewCell
{
    NSMutableDictionary *bCart;
    UIButton *delBtn;
}

@property (nonatomic, weak) IBOutlet UIButton *delBtn;
@property (nonatomic, weak) IBOutlet UILabel *productLabel;
@property (nonatomic, weak) IBOutlet UILabel *weightLabel;
@property (nonatomic, weak) IBOutlet UILabel *quantityLabel;
@property (nonatomic, weak) IBOutlet UILabel *priceLabel;

@end

