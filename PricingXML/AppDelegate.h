//
//  AppDelegate.h
//  PricingXML
//
//  Created by wang xuanqiang on 12/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RootViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate, NSXMLParserDelegate> {
    UIWindow *winwindow;
    RootViewController *rootViewController;
    UINavigationController *navigationController;
    
    @private
    NSURLConnection *pricingIndexConnection;
    NSMutableData *pricingComputings;
    
    NSOperationQueue *parseQueue;
} 
@property (strong, nonatomic) IBOutlet UIWindow *window;
@property (strong, nonatomic) IBOutlet RootViewController *rootViewController;
@property (strong, nonatomic) IBOutlet UINavigationController *navigationController;

@property (strong, nonatomic) NSURLConnection *pricingIndexConnection;
@property (strong, nonatomic) NSMutableData *pricingComputings;
@property (strong, nonatomic) NSOperationQueue *parseQueue;

-(void) handleError:(NSError *) error;

@end
