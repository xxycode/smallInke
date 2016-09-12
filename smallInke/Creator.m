//
//	Creator.m
//on 12/9/2016
//	Copyright © 2016. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Creator.h"

NSString *const kCreatorIdField = @"id";
NSString *const kCreatorLevel = @"level";
NSString *const kCreatorNick = @"nick";
NSString *const kCreatorPortrait = @"portrait";

@interface Creator ()
@end
@implementation Creator




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kCreatorIdField] isKindOfClass:[NSNull class]]){
        self.idField = [dictionary[kCreatorIdField] integerValue];
    }
    
    if(![dictionary[kCreatorLevel] isKindOfClass:[NSNull class]]){
        self.level = [dictionary[kCreatorLevel] integerValue];
    }
    
    if(![dictionary[kCreatorNick] isKindOfClass:[NSNull class]]){
        self.nick = dictionary[kCreatorNick];
    }
    if(![dictionary[kCreatorPortrait] isKindOfClass:[NSNull class]]){
        self.portrait = dictionary[kCreatorPortrait];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    dictionary[kCreatorIdField] = @(self.idField);
    dictionary[kCreatorLevel] = @(self.level);
    if(self.nick != nil){
        dictionary[kCreatorNick] = self.nick;
    }
    if(self.portrait != nil){
        dictionary[kCreatorPortrait] = self.portrait;
    }
    return dictionary;
    
}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:@(self.idField) forKey:kCreatorIdField];	[aCoder encodeObject:@(self.level) forKey:kCreatorLevel];	if(self.nick != nil){
        [aCoder encodeObject:self.nick forKey:kCreatorNick];
    }
    if(self.portrait != nil){
        [aCoder encodeObject:self.portrait forKey:kCreatorPortrait];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.idField = [[aDecoder decodeObjectForKey:kCreatorIdField] integerValue];
    self.level = [[aDecoder decodeObjectForKey:kCreatorLevel] integerValue];
    self.nick = [aDecoder decodeObjectForKey:kCreatorNick];
    self.portrait = [aDecoder decodeObjectForKey:kCreatorPortrait];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    Creator *copy = [Creator new];
    
    copy.idField = self.idField;
    copy.level = self.level;
    copy.nick = [self.nick copyWithZone:zone];
    copy.portrait = [self.portrait copyWithZone:zone];
    
    return copy;
}
@end