//
//  SalesEventViewController.h
//  EA_Demo
//
//  Created by Tamer Alaa on 8/5/14.
//  Copyright (c) 2014 SpringMoon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface SalesEventViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) IBOutlet UIButton *filtercountries;
@property (nonatomic,strong) IBOutlet UIButton *filterproducts;
@property (nonatomic,weak) IBOutlet UITextField *Filtercountry;
@property (nonatomic,weak) IBOutlet UITextField *Filterproduct;
@property (nonatomic,strong) IBOutlet UITableView *saleseventtable;
@end
