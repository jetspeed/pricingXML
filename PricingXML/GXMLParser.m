//
//  GXMLParser.m
//  PricingXML
//
//  Created by wangxq on 12/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "GXMLParser.h"

@implementation GXMLParser

@synthesize xmlData;


- (id) initWithData:(NSData *)data{
    if (self = [super init]) {    
        xmlData = [data copy];
    }
    return self;
}

- (void) parse{
    NSError *error;
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:xmlData options:0 error:&error];
    if (doc != nil) {
        NSLog(@"root Element:%@", doc.rootElement);
        [doc release];
    }
}

- (void) dealloc{
    [xmlData release];
    [super dealloc];
}
@end
