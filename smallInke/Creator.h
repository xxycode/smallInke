//
//	Creator.h
//on 12/9/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface Creator : NSObject

@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, assign) NSInteger level;
@property (nonatomic, strong) NSString * nick;
@property (nonatomic, strong) NSString * portrait;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

- (instancetype)copyWithZone:(NSZone *)zone;

@end