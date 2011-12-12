//
//  GXMLParser.h
//  PricingXML
//
//  Created by wangxq on 12/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDataXMLNode.h"

@interface GXMLParser : NSObject{
    NSData *xmlData;
}

@property (strong, nonatomic) NSData *xmlData;

- (id) initWithData:(NSData *)data;
- (void) parse;
@end

