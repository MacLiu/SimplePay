//
//  BillTableViewCell.m
//  Split Pay
//
//  Created by Mac Liu on 7/19/14.
//  Copyright (c) 2014 Mac Liu. All rights reserved.
//

#import "BillTableViewCell.h"

@implementation BillTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)makePaymentButtonPressed:(UIButton *)sender {
}
@end
