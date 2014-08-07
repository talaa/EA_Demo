//
//  SalesEventTableViewCell.h
//  EA_Demo
//
//  Created by Tamer Alaa on 8/5/14.
//  Copyright (c) 2014 SpringMoon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SalesEventTableViewCell : UITableViewCell
@property (nonatomic,strong)IBOutlet UILabel *monthlabel;
@property (nonatomic,strong)IBOutlet UILabel *Datelabel;
@property (nonatomic,strong)IBOutlet UILabel *locationlabel;
@property (nonatomic,strong)IBOutlet UILabel *eventnamelabel;
@property (nonatomic,strong)IBOutlet UIImageView *eventlogo;
@end
