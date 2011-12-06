//
//  RootViewController.h
//  PricingXML
//
//  Created by wang xuanqiang on 12/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource>{
    NSMutableArray *computingArray;
}

@property (strong, nonatomic) NSMutableArray *computingArray;
- (void) insertComputings:(NSArray *) computings;

@end
