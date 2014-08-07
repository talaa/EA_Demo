//
//  SalesEventregisterViewController.m
//  EA_Demo
//
//  Created by Tamer Alaa on 8/6/14.
//  Copyright (c) 2014 SpringMoon. All rights reserved.
//

#import "SalesEventregisterViewController.h"
#import "DataObjects.h"

@interface SalesEventregisterViewController ()

@end

@implementation SalesEventregisterViewController
@synthesize askquestion,Addtocalendar,sharesocial;

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
-(IBAction)AddtoCalendar:(id)sender{
    EKEventStore *store = [[EKEventStore alloc] init];
    [store requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
        if (!granted) { return; }
        EKEvent *event = [EKEvent eventWithEventStore:store];
        event.title = @"Event Title";
        event.startDate = [NSDate date]; //today
        event.endDate = [event.startDate dateByAddingTimeInterval:60*60];  //set 1 hour meeting
        [event setCalendar:[store defaultCalendarForNewEvents]];
        NSError *err = nil;
        [store saveEvent:event span:EKSpanThisEvent commit:YES error:&err];
        NSString *savedEventId = event.eventIdentifier;  //this is so you can access this event later
    }];
}
-(IBAction)Askquestion:(id)sender{
    //NSArray *tomail=[[NSArray alloc]initWithObjects:[self.detailItem valueForKey:@"email"], nil];
    MFMailComposeViewController *picker=[[MFMailComposeViewController alloc]init];
    picker.mailComposeDelegate=self;
    [picker setSubject:@"Query About Event" ];
    [picker setToRecipients:@[@"mohamed.amiri@hotmail.com"]];
    //[picker setMessageBody:NSLocalizedString(@"moreinfo", nil) isHTML:NO];
    //[picker addAttachmentData:[self.detailItem valueForKey:@"image"] mimeType:@"image/png" fileName:@"Photos"];
    [self presentViewController:picker animated:YES completion:nil];

}
-(IBAction)sharesocial:(id)sender{
    NSString *initalTextString = [NSString
                                  stringWithFormat:@"I am attending the Event: %@ at %@",
                                  [[DataObjects saleseventdict]objectForKey:@"EventName"],[[DataObjects saleseventdict]objectForKey:@"Location"]];
    //[newArraytext arrayByAddingObject:initalTextString];
    

    NSArray *addArray=[[NSArray alloc]initWithObjects:[[DataObjects saleseventdict]objectForKey:@"Event_image" ],initalTextString, nil];
    UIActivityViewController *activityViewController2 =[[UIActivityViewController alloc]initWithActivityItems:addArray applicationActivities:nil];
    
    [self presentViewController:activityViewController2 animated:YES completion:^{}];

}
-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    
    [controller dismissViewControllerAnimated:YES completion:nil];
    
}
@end
