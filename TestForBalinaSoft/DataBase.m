//
//  DataBase.m
//  TestForBalinaSoft
//
//  Created by Admin on 14.04.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "DataBase.h"

@implementation DataBase

+ (instancetype)sharedInstance
{
    static DataBase *_sharedInstance = nil;
    
    if(_sharedInstance == nil)
    {
        _sharedInstance = [[DataBase alloc] init];
    }
    
    return _sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        [self fillDataBase];
    }
    
    return self;
}


- (void)addCategory:(Category *) category
{
    [self.categories addObject:category];
}



#pragma mark - NSXMLParserDelegate -

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict
{
    _currentElement = elementName;
    
    if ([elementName isEqualToString:@"category"])
    {
        _category = [[Category alloc] init];
        
        NSString *_categoryId = [attributeDict objectForKey:@"id"];
        
        _category.categoryId = _categoryId;
        
        _category.imageName = [[NSBundle mainBundle] pathForResource:_categoryId ofType:@".png"];
        
        _categoryName = [NSMutableString string];
    }
    else
    {
        if ([elementName isEqualToString:@"offer"])
        {
            _offer = [[Offer alloc] init];
        }
        else
        {
            if([elementName isEqualToString:@"name"])
            {
                _offerName = [NSMutableString string];
            }
            
            if([elementName isEqualToString:@"price"])
            {
                _offerPrice = [NSMutableString string];
            }
            
            if([elementName isEqualToString:@"picture"])
            {
                _offerImageUrl = [NSMutableString string];
            }
            
            if([elementName isEqualToString:@"description"])
            {
                _offerDescription = [NSMutableString string];
            }
            
            if([elementName isEqualToString:@"categoryId"])
            {
                _offerCategoryId = [NSMutableString string];
            }
            
            if(_isFirstParam == YES)
            {
                if([elementName isEqualToString:@"param"])
                {
                    NSString *_param = [attributeDict objectForKey:@"name"];
                    
                    if([_param isEqualToString:@"Вес"])
                    {
                        _offerWeight = [NSMutableString string];
                        
                        _isFirstParam = NO;
                    }
                }
            }
        }
    }
    
}


- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if([_currentElement isEqualToString:@"category"])
    {
        [_categoryName appendString:string];
    }
    
    if([_currentElement isEqualToString:@"name"])
    {
        [_offerName appendString:string];
    }
    
    if([_currentElement isEqualToString:@"price"])
    {
        [_offerPrice appendString:string];
    }
    
    if([_currentElement isEqualToString:@"picture"])
    {
        [_offerImageUrl appendString:string];
    }
    
    if([_currentElement isEqualToString:@"description"])
    {
        [_offerDescription appendString:string];
    }
    
    if([_currentElement isEqualToString:@"categoryId"])
    {
        [_offerCategoryId appendString:string];
    }
    
    if([_currentElement isEqualToString:@"param"])
    {
        [_offerWeight appendString:string];
        
    }
}


- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"category"])
    {
        _category.name = [[_categoryName  stringByReplacingOccurrencesOfString:@"\n" withString:@""] stringByTrimmingCharactersInSet:
                          [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        [self addCategory:_category];
        
        _category = nil;
        
        _categoryName =  nil;
    }
    
    if ([elementName isEqualToString:@"offer"])
    {
        _offer.name = [[_offerName stringByReplacingOccurrencesOfString:@"\n" withString:@""] stringByTrimmingCharactersInSet:
                       [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        _offer.price = [NSString stringWithFormat:@"%@ %@",[[_offerCategoryId stringByReplacingOccurrencesOfString:@"\n" withString:@""] stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]], @"p"];
        
        NSArray *_paramsArray = [_offerWeight componentsSeparatedByString:@"\n"];
        
        _offer.weight = [[_paramsArray firstObject]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        _offer.offerDescription = [[_offerDescription stringByReplacingOccurrencesOfString:@"\n" withString:@""] stringByTrimmingCharactersInSet:
                                   [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        _offer.imageUrl = [[_offerImageUrl stringByReplacingOccurrencesOfString:@"\n" withString:@""] stringByTrimmingCharactersInSet:
                           [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        _offer.categoryId = [[_offerCategoryId stringByReplacingOccurrencesOfString:@"\n" withString:@""] stringByTrimmingCharactersInSet:
                             [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        for(Category *_eachCategory in  self.categories)
        {
            if([_eachCategory.categoryId isEqualToString:_offer.categoryId])
            {
                [_eachCategory addOffer:_offer];
            }
        }
        
        _offer = nil;
        
        _offerName =  nil;
        
        _offerPrice =  nil;
        
        _offerWeight =  nil;
        
        _offerDescription =  nil;
        
        _offerImageUrl =  nil;
        
        _offerCategoryId =  nil;
        
        _isFirstParam = YES;
    }
}



#pragma mark - User functions -

- (void) fillDataBase
{
    self.categories = [NSMutableArray array];
    
    _isFirstParam = YES;
    
    [self loadWithURLSessionOnSuccess:^(NSData *data)
    {
        [self parserInitWithDataAndParse:data];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"MyNotification" object:nil];
    }];
}


- (void) loadWithURLSessionOnSuccess:(void(^)(NSData *data)) success
{
    NSURL *_url = [NSURL URLWithString:@"http://ufa.farfor.ru/getyml/?key=ukAXxeJYZN"];
    
    NSData *_data = [NSData dataWithContentsOfURL:_url];
    
    [self parserInitWithDataAndParse:_data];
    
}


- (void) parserInitWithDataAndParse:(NSData *) data
{
    _parser = [[NSXMLParser alloc] initWithData:data];
    
    _parser.delegate = self;
    
    [_parser parse];
}


@end
