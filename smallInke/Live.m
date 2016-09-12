//
//	Live.m
//on 12/9/2016
//	Copyright © 2016. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Live.h"

NSString *const kLiveCity = @"city";
NSString *const kLiveCreator = @"creator";
NSString *const kLiveGroup = @"group";
NSString *const kLiveIdField = @"id";
NSString *const kLiveLink = @"link";
NSString *const kLiveMulti = @"multi";
NSString *const kLiveName = @"name";
NSString *const kLiveOnlineUsers = @"online_users";
NSString *const kLiveOptimal = @"optimal";
NSString *const kLiveShareAddr = @"share_addr";
NSString *const kLiveSlot = @"slot";
NSString *const kLiveStreamAddr = @"stream_addr";
NSString *const kLiveVersion = @"version";

@interface Live ()
@end
@implementation Live




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kLiveCity] isKindOfClass:[NSNull class]]){
        self.city = dictionary[kLiveCity];
    }
    if(![dictionary[kLiveCreator] isKindOfClass:[NSNull class]]){
        self.creator = [[Creator alloc] initWithDictionary:dictionary[kLiveCreator]];
    }
    
    if(![dictionary[kLiveGroup] isKindOfClass:[NSNull class]]){
        self.group = [dictionary[kLiveGroup] integerValue];
    }
    
    if(![dictionary[kLiveIdField] isKindOfClass:[NSNull class]]){
        self.idField = dictionary[kLiveIdField];
    }
    if(![dictionary[kLiveLink] isKindOfClass:[NSNull class]]){
        self.link = [dictionary[kLiveLink] integerValue];
    }
    
    if(![dictionary[kLiveMulti] isKindOfClass:[NSNull class]]){
        self.multi = [dictionary[kLiveMulti] integerValue];
    }
    
    if(![dictionary[kLiveName] isKindOfClass:[NSNull class]]){
        self.name = dictionary[kLiveName];
    }
    if(![dictionary[kLiveOnlineUsers] isKindOfClass:[NSNull class]]){
        self.onlineUsers = [dictionary[kLiveOnlineUsers] integerValue];
    }
    
    if(![dictionary[kLiveOptimal] isKindOfClass:[NSNull class]]){
        self.optimal = [dictionary[kLiveOptimal] integerValue];
    }
    
    if(![dictionary[kLiveShareAddr] isKindOfClass:[NSNull class]]){
        self.shareAddr = dictionary[kLiveShareAddr];
    }
    if(![dictionary[kLiveSlot] isKindOfClass:[NSNull class]]){
        self.slot = [dictionary[kLiveSlot] integerValue];
    }
    
    if(![dictionary[kLiveStreamAddr] isKindOfClass:[NSNull class]]){
        self.streamAddr = dictionary[kLiveStreamAddr];
    }
    if(![dictionary[kLiveVersion] isKindOfClass:[NSNull class]]){
        self.version = [dictionary[kLiveVersion] integerValue];
    }
    
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.city != nil){
        dictionary[kLiveCity] = self.city;
    }
    if(self.creator != nil){
        dictionary[kLiveCreator] = [self.creator toDictionary];
    }
    dictionary[kLiveGroup] = @(self.group);
    if(self.idField != nil){
        dictionary[kLiveIdField] = self.idField;
    }
    dictionary[kLiveLink] = @(self.link);
    dictionary[kLiveMulti] = @(self.multi);
    if(self.name != nil){
        dictionary[kLiveName] = self.name;
    }
    dictionary[kLiveOnlineUsers] = @(self.onlineUsers);
    dictionary[kLiveOptimal] = @(self.optimal);
    if(self.shareAddr != nil){
        dictionary[kLiveShareAddr] = self.shareAddr;
    }
    dictionary[kLiveSlot] = @(self.slot);
    if(self.streamAddr != nil){
        dictionary[kLiveStreamAddr] = self.streamAddr;
    }
    dictionary[kLiveVersion] = @(self.version);
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
    if(self.city != nil){
        [aCoder encodeObject:self.city forKey:kLiveCity];
    }
    if(self.creator != nil){
        [aCoder encodeObject:self.creator forKey:kLiveCreator];
    }
    [aCoder encodeObject:@(self.group) forKey:kLiveGroup];	if(self.idField != nil){
        [aCoder encodeObject:self.idField forKey:kLiveIdField];
    }
    [aCoder encodeObject:@(self.link) forKey:kLiveLink];	[aCoder encodeObject:@(self.multi) forKey:kLiveMulti];	if(self.name != nil){
        [aCoder encodeObject:self.name forKey:kLiveName];
    }
    [aCoder encodeObject:@(self.onlineUsers) forKey:kLiveOnlineUsers];	[aCoder encodeObject:@(self.optimal) forKey:kLiveOptimal];	if(self.shareAddr != nil){
        [aCoder encodeObject:self.shareAddr forKey:kLiveShareAddr];
    }
    [aCoder encodeObject:@(self.slot) forKey:kLiveSlot];	if(self.streamAddr != nil){
        [aCoder encodeObject:self.streamAddr forKey:kLiveStreamAddr];
    }
    [aCoder encodeObject:@(self.version) forKey:kLiveVersion];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.city = [aDecoder decodeObjectForKey:kLiveCity];
    self.creator = [aDecoder decodeObjectForKey:kLiveCreator];
    self.group = [[aDecoder decodeObjectForKey:kLiveGroup] integerValue];
    self.idField = [aDecoder decodeObjectForKey:kLiveIdField];
    self.link = [[aDecoder decodeObjectForKey:kLiveLink] integerValue];
    self.multi = [[aDecoder decodeObjectForKey:kLiveMulti] integerValue];
    self.name = [aDecoder decodeObjectForKey:kLiveName];
    self.onlineUsers = [[aDecoder decodeObjectForKey:kLiveOnlineUsers] integerValue];
    self.optimal = [[aDecoder decodeObjectForKey:kLiveOptimal] integerValue];
    self.shareAddr = [aDecoder decodeObjectForKey:kLiveShareAddr];
    self.slot = [[aDecoder decodeObjectForKey:kLiveSlot] integerValue];
    self.streamAddr = [aDecoder decodeObjectForKey:kLiveStreamAddr];
    self.version = [[aDecoder decodeObjectForKey:kLiveVersion] integerValue];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    Live *copy = [Live new];
    
    copy.city = [self.city copyWithZone:zone];
    copy.creator = [self.creator copyWithZone:zone];
    copy.group = self.group;
    copy.idField = [self.idField copyWithZone:zone];
    copy.link = self.link;
    copy.multi = self.multi;
    copy.name = [self.name copyWithZone:zone];
    copy.onlineUsers = self.onlineUsers;
    copy.optimal = self.optimal;
    copy.shareAddr = [self.shareAddr copyWithZone:zone];
    copy.slot = self.slot;
    copy.streamAddr = [self.streamAddr copyWithZone:zone];
    copy.version = self.version;
    
    return copy;
}
@end