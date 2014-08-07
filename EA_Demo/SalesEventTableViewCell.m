//
//  SalesEventTableViewCell.m
//  EA_Demo
//
//  Created by Tamer Alaa on 8/5/14.
//  Copyright (c) 2014 SpringMoon. All rights reserved.
//

#import "SalesEventTableViewCell.h"

@implementation SalesEventTableViewCell
@synthesize monthlabel,eventlogo,Datelabel,eventnamelabel,locationlabel;

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
    [monthlabel setTransform:CGAffineTransformMakeRotation(-M_PI / 2)];
    NSLog(@"i am here ");

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
