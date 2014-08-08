//
//  SalesEventViewController.m
//  EA_Demo
//
//  Created by Tamer Alaa on 8/5/14.
//  Copyright (c) 2014 SpringMoon. All rights reserved.
//

#import "SalesEventViewController.h"
#import "SalesEventTableViewCell.h"
#import "DataObjects.h"
#import "SalesEventDetailViewController.h"
@interface SalesEventViewController ()
@property (nonatomic,strong)NSArray *tablearray;
@property (nonatomic,strong)NSMutableArray *country;
@property (nonatomic,strong)NSMutableArray *product;
@end

@implementation SalesEventViewController

@synthesize filtercountries,filterproducts,tablearray,Filtercountry,Filterproduct,saleseventtable,country,product;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated{

    NSLog(@"i have started here ");
    //Query Tables from Prase
    //PFQuery *query = [PFQuery queryWithClassName:@"Sales_Event"];
    //NSLog(@"The array from app delegate is %@",[DataObjects SalesEventArray]);
    //[query whereKey:@"playerName" equalTo:@"Dan Stemkoski"];
    //tablearray=[query findObjects];
    
    country =[[NSMutableArray alloc]init];
    product =[[NSMutableArray alloc]init];
    for (NSMutableDictionary *dict in tablearray) {
        //[country arrayByAddingObject:[dict objectForKey:@"Country"]];
        [country addObject:[dict objectForKey:@"Country"]];
        [product addObject:[dict objectForKey:@"Product"]];
    //NSLog(@"The Countries are %@",[dict objectForKey:@"Country"]);
    }
    tablearray=[DataObjects SalesEventArray];
    /*
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %d entries.", objects.count);
            // Do something with the found objects
            
            tablearray=objects;
            [self reloadInputViews];
            //NSLog(@"The Array retrieved is %@",tablearray);
            for (PFObject *object in objects) {
                NSLog(@"%@", object.objectId);
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
     */
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    //Prepare the UI
    self.title=@"Sales Event";
    //saleseventtable = [[UITableView alloc] initWithFrame:CGRectMake(0, 280, 320, 240)];
    //saleseventtable.rowHeight=120;
    //saleseventtable.backgroundColor=[UIColor redColor];
    UIPickerView *picker1 = [[UIPickerView alloc] init];
    UIPickerView *picker2 = [[UIPickerView alloc] init];
    picker1.dataSource = self;
    picker1.delegate = self;
    picker2.delegate=self;
    picker2.dataSource=self;
    picker1.tag=1;
    picker2.tag=2;
    saleseventtable.dataSource=self;
    saleseventtable.delegate=self;
    self.Filtercountry.inputView = picker1;
    self.Filterproduct.inputView=picker2;
    
   
    // Do any additional setup after loading the view.
    //[self.view addSubview:saleseventtable];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSIndexPath *indexpath=[self.saleseventtable indexPathForSelectedRow];
    if ([[segue identifier] isEqualToString:@"Detailsegue"]) {
        SalesEventDetailViewController *destcontroller=(SalesEventDetailViewController*)[segue destinationViewController];
        destcontroller.title=[[tablearray objectAtIndex:indexpath.row]objectForKey:@"EventName"];

        [DataObjects setsaleseventdic:[tablearray objectAtIndex:indexpath.row]];
        NSLog(@"The Passed Dict is %@",[tablearray objectAtIndex:indexpath.row]);
    }

    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    NSLog(@"The number is %i",[self.tablearray count]);
    return [self.tablearray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tablecell" forIndexPath:indexPath];
    SalesEventTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tablecell" forIndexPath:indexPath];
    
    // Configure the cell...
    NSLog(@"the Event Name is %@",[[tablearray objectAtIndex:indexPath.row]objectForKey:@"EventName"]);
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd  HH:mm:ss"];
    NSLog(@"System time: %@", [dateFormatter stringFromDate:[NSDate date]]);
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Aqtobe"]];
    NSString *dateString = [dateFormatter stringFromDate:[[tablearray objectAtIndex:indexPath.row]objectForKey:@"Date"]];
    cell.monthlabel.text=[[tablearray objectAtIndex:indexPath.row]objectForKey:@"Month"];
    cell.eventnamelabel.text=[[tablearray objectAtIndex:indexPath.row]objectForKey:@"EventName"];
    cell.locationlabel.text=[[tablearray objectAtIndex:indexPath.row]objectForKey:@"Location"];
    cell.Datelabel.text=dateString;
    PFFile *imageparse=[[tablearray objectAtIndex:indexPath.row]objectForKey:@"Company_Logo"];
    [imageparse getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
        if (!error) {
            UIImage *image = [UIImage imageWithData:imageData];
            cell.eventlogo.image=image;
        }
    }];
    
    
    //cell.textLabel.text=[basicarray objectAtIndex:indexPath.row];
    //cell.imageView.image=[UIImage imageNamed:[basicarray objectAtIndex:indexPath.row]];
    return cell;
}


//Prepare th UI
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (pickerView.tag==1) {
        //return [[DataObjects Countries]count];
        return [country count];
    }else{
        //return [[DataObjects Products]count];
        return [product count];
    }
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return  1;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if (pickerView.tag==1) {
        //return [DataObjects Countries][row];
        return country[row];
    }else{
        //return [DataObjects Products][row];
        return product[row];
    }
    
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if (pickerView.tag==1) {
        //self.Filtercountry.text = [DataObjects Countries][row];
        self.Filtercountry.text = country[row];
        [self.Filtercountry resignFirstResponder];
    }else{
    //self.Filterproduct.text = [DataObjects Products][row];
        self.Filterproduct.text = product[row];
    [self.Filterproduct resignFirstResponder];
    }
}


@end
