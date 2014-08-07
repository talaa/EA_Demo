//
//  DataObjects.h
//  EA_Demo
//
//  Created by Tamer Alaa on 8/5/14.
//  Copyright (c) 2014 SpringMoon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataObjects : NSObject
+(NSArray*)Countries;
+(NSArray*)Products;
+(NSMutableDictionary*)saleseventdict;
+(void)setsaleseventdic:(NSMutableDictionary*)newdict;
+(NSArray*)SalesEventArray;
+(void)SetSaleseventArray:(NSArray*)newSaleseventarray;

@end
