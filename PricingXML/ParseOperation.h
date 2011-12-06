//
//  ParseOperation.h
//  PricingXML
//
//  Created by wang xuanqiang on 12/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ParseOperation : NSOperation<NSXMLParserDelegate> {
    NSData *pricingComputingData;
    NSMutableString *currentComputingObject;
    NSMutableArray *parsingComputingArray;
    NSMutableString *parsedCharacterComputingData;
@private
    BOOL accumulatingParsedCharacterData;
}

@property (copy, readonly) NSData *pricingComputingData;
@property (strong, nonatomic) NSMutableString *currentComputingObject;
@property (nonatomic, strong) NSMutableArray *parsingComputingArray;
@property (nonatomic, strong) NSMutableString *parsedCharacterComputingData;

- (id)initWithData:(NSData *)parseData;
@end
