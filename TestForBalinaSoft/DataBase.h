//
//  DataBase.h
//  TestForBalinaSoft
//
//  Created by Admin on 14.04.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Category.h"

@interface DataBase : NSObject <NSXMLParserDelegate>
{
    NSXMLParser *_parser;
    NSString *_currentElement;
    NSMutableString *_categoryName;
    NSMutableString *_offerName;
    NSMutableString *_offerPrice;
    NSMutableString *_offerImageUrl;
    NSMutableString *_offerWeight;
    NSMutableString *_offerDescription;
    NSMutableString *_offerCategoryId;
    BOOL _isFirstParam;
    BOOL _isEndOfParsing;
    Category *_category;
    Offer *_offer;
}

@property(strong, nonatomic) NSMutableArray *categories;


+ (instancetype)sharedInstance;

- (void)addCategory:(Category *) category;


@end
