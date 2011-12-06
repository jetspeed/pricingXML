//
//  ParseOperation.m
//  PricingXML
//
//  Created by wang xuanqiang on 12/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ParseOperation.h"

@implementation ParseOperation

@synthesize pricingComputingData;
@synthesize currentComputingObject;
@synthesize parsingComputingArray;
@synthesize parsedCharacterComputingData;


- (id)initWithData:(NSData *)parseData
{
    if (self = [super init]) {    
        pricingComputingData = [parseData copy];

    }
    return self;
}

// the main function for this NSOperation, to start the parsing
- (void)main {
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:self.pricingComputingData];
    [parser setDelegate:self];
    [parser parse];
}

static NSString * const kEntryElementName = @"computing";
static NSString * const kIdElementName = @"id";
static NSString * const kNameElementName = @"name";
static NSString * const kFunctionElementName = @"function";


- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    if ([elementName isEqualToString:kEntryElementName]) {
        NSMutableString *computing = [[NSMutableString alloc] init];
        self.currentComputingObject = computing;
    } else if ([elementName isEqualToString:kIdElementName] ||
               [elementName isEqualToString:kNameElementName] ||
               [elementName isEqualToString:kFunctionElementName]) {
        // For the 'title', 'updated', or 'georss:point' element begin accumulating parsed character data.
        // The contents are collected in parser:foundCharacters:.
        accumulatingParsedCharacterData = YES;
        // The mutable string needs to be reset to empty.
        [parsedCharacterComputingData setString:@""];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
                                      namespaceURI:(NSString *)namespaceURI
                                     qualifiedName:(NSString *)qName {     
    if ([elementName isEqualToString:kEntryElementName]) {
        [self.parsingComputingArray addObject:self.currentComputingObject];
        [self performSelectorOnMainThread:@selector(addEarthquakesToList:)
                               withObject:self.parsingComputingArray
                            waitUntilDone:NO];
        self.parsingComputingArray = [NSMutableArray array];
    } else if ([elementName isEqualToString:kIdElementName] ||
               [elementName isEqualToString:kNameElementName] ||
               [elementName isEqualToString:kFunctionElementName]) {
        [currentComputingObject appendString:parsedCharacterComputingData];
    } 
    // Stop accumulating parsed character data. We won't start again until specific elements begin.
    accumulatingParsedCharacterData = NO;
}

// This method is called by the parser when it find parsed character data ("PCDATA") in an element.
// The parser is not guaranteed to deliver all of the parsed character data for an element in a single
// invocation, so it is necessary to accumulate character data until the end of the element is reached.
//
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (accumulatingParsedCharacterData) {
        // If the current element is one whose content we care about, append 'string'
        // to the property that holds the content of the current element.
        //
        [self.parsedCharacterComputingData appendString:string];
    }
}
@end
