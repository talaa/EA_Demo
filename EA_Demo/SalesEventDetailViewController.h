//
//  SalesEventDetailViewController.h
//  EA_Demo
//
//  Created by Tamer Alaa on 8/6/14.
//  Copyright (c) 2014 SpringMoon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "DataObjects.h"
#import <CoreLocation/CoreLocation.h>

@interface SalesEventDetailViewController : UIViewController
@property (nonatomic,strong)IBOutlet UIImageView *eventlogo;
@property (nonatomic,strong)IBOutlet UIImageView *companylogo;
@property (nonatomic,strong)IBOutlet UITextView *eventdescription;
@property (nonatomic,strong)IBOutlet MKMapView *eventMap;
@property (nonatomic,strong)IBOutlet UIButton *eventregisterbutton;

@end
