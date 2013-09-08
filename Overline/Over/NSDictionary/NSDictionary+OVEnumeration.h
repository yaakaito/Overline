//
// Created by yaakaito on 2012/12/24.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@interface NSDictionary (OVEnumeration)

- (NSDictionary *)mappedDictionaryUsingBlock:(id (^)(id obj, NSString *key))block;
- (NSArray *)arrayMap:(id (^)(id obj, NSString *key))block;
- (NSArray *)mappedArrayUsingBlock:(id (^)(id obj, NSString *key))block;
- (NSDictionary *)filterKey:(BOOL (^)(NSString *key))block;
- (NSDictionary *)dictionaryFilteredByKeyUsingBlock:(BOOL (^)(NSString *key))block;
- (NSDictionary *)rejectKey:(BOOL (^)(NSString *key))block;
- (NSDictionary *)dictionaryRejectedByKeyUsingBlock:(BOOL (^)(NSString *key))block;
- (NSDictionary *)filterObject:(BOOL (^)(id obj))block;
- (NSDictionary *)dictionaryFilteredByObjectUsingBlock:(BOOL (^)(id obj))block;
- (NSDictionary *)rejectObject:(BOOL (^)(id obj))block;
- (NSDictionary *)dictionaryRejectedByObjectUsingBlock:(BOOL (^)(id obj))block;
- (NSDictionary *)merge:(NSDictionary *)dictionary;
- (NSDictionary *)dictionaryByMergingDictionary:(NSDictionary *)dictionary;
- (id)reducedObjectUsingBlock:(id (^)(id memo, id obj, NSString *key))block memo:(id)memo;
- (NSString *)queryString;
- (NSString *)stringByFormattingQuery;
@end