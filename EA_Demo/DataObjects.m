//
//  DataObjects.m
//  EA_Demo
//
//  Created by Tamer Alaa on 8/5/14.
//  Copyright (c) 2014 SpringMoon. All rights reserved.
//

#import "DataObjects.h"
static NSMutableDictionary *tempdict=nil;
static NSArray *tempsaleseventarray=nil;


@implementation DataObjects
+(NSArray*)Countries{
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"country_product_data" ofType:@"plist"]];
    //NSLog(@"dictionary = %@", dictionary);
    NSArray *array = [dictionary objectForKey:@"Country"];
    //NSLog(@"array = %@", array);
    return array;
}
+(NSArray*)Products{
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"country_product_data" ofType:@"plist"]];
    //NSLog(@"dictionary = %@", dictionary);
    NSArray *array = [dictionary objectForKey:@"Product"];
    //NSLog(@"array = %@", array);
    return array;

}
+(NSMutableDictionary*)saleseventdict{
    return tempdict;
}
+(void)setsaleseventdic:(NSMutableDictionary*)newdict{
    tempdict=newdict;
}
+(NSArray*)SalesEventArray{
    return tempsaleseventarray;
}
+(void)SetSaleseventArray:(NSArray*)newSaleseventarray{

    tempsaleseventarray=newSaleseventarray;
}

@end
