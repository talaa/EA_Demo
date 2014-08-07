//
//  SalesEventregisterViewController.h
//  EA_Demo
//
//  Created by Tamer Alaa on 8/6/14.
//  Copyright (c) 2014 SpringMoon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <EventKit/EventKit.h>

@interface SalesEventregisterViewController : UIViewController<MFMailComposeViewControllerDelegate>
@property (nonatomic,strong)IBOutlet UIButton *Addtocalendar;
@property (nonatomic,strong)IBOutlet UIButton *askquestion;
@property (nonatomic,strong)IBOutlet UIButton *sharesocial;
-(IBAction)AddtoCalendar:(id)sender;
-(IBAction)Askquestion:(id)sender;
-(IBAction)sharesocial:(id)sender;
@end
