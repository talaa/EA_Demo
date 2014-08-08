//
//  SalesEventDetailViewController.m
//  EA_Demo
//
//  Created by Tamer Alaa on 8/6/14.
//  Copyright (c) 2014 SpringMoon. All rights reserved.
//

#import "SalesEventDetailViewController.h"
#import <Parse/Parse.h>
@interface SalesEventDetailViewController ()

@end

@implementation SalesEventDetailViewController
@synthesize eventlogo,eventdescription,eventMap,eventregisterbutton,companylogo;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    PFFile *imageparse=[[DataObjects saleseventdict] objectForKey:@"Company_Logo"];
    [imageparse getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
        if (!error) {
            UIImage *image = [UIImage imageWithData:imageData];
            companylogo.image=image;
        }else{
            NSLog(@"I have error Downloading the image");
        }
    }];
    
    PFFile *imageparse2=[[DataObjects saleseventdict] objectForKey:@"Event_logo"];
    [imageparse2 getDataInBackgroundWithBlock:^(NSData *imageData2, NSError *error) {
        if (!error) {
            UIImage *image2 = [UIImage imageWithData:imageData2];
            eventlogo.image=image2;
        }
    }];
    
    eventdescription.text=[[DataObjects saleseventdict]objectForKey:@"Event_Description"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
