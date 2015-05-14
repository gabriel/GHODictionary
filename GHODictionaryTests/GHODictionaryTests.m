//
//  GHODictionaryTests.m
//  GHODictionaryTests
//
//  Created by Gabriel on 5/13/15.
//  Copyright (c) 2015 Gabriel Handford. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>

#import "GHODictionary_IMP.h"

@interface GHOrderedDictionaryTests : XCTestCase
@end

@implementation GHOrderedDictionaryTests

- (void)testDict {
  GHODictionary *dict = [GHODictionary dictionary];
  NSMutableArray *keys = [NSMutableArray array];
  for (NSInteger i = 0; i < 1024; i++) {
    [keys addObject:@(i)];
    dict[@(i)] = @(i);
  }

  NSMutableArray *keysIterated = [NSMutableArray array];
  for (id key in dict) {
    [keysIterated addObject:key];
  }

  XCTAssertEqualObjects(keysIterated, keys);

  GHODictionary *dictCopy = [dict copy];
  dictCopy[@(1)] = @"test";

  NSLog(@"dictCopy=%@", dictCopy);
}

- (void)testAddEntries {
  GHODictionary *dict = [GHODictionary dictionary];
  [dict addEntriesFromDictionary:@{@"dup": @(1)}];
  [dict addEntriesFromDictionary:@{@"ok": @(0)}];
  [dict addEntriesFromDictionary:@{@"dup": @(2)}];
  XCTAssertEqual([[dict allKeys] count], 2);
  XCTAssertEqualObjects(dict[@"dup"], @(2));

  NSArray *expectedKeys = @[@"dup", @"ok"];
  XCTAssertEqualObjects([dict allKeys], expectedKeys);
}

- (void)testMap {
  GHODictionary *dict = [GHODictionary dictionary];
  dict[@"a"] = @(1);
  dict[@"b"] = @(2);
  dict[@"c"] = @(3);

  NSArray *fromMap = [dict map:^id(id key, id value) { return @[key, value]; }];
  NSArray *expected = @[@[@"a", @(1)],@[@"b", @(2)],@[@"c", @(3)]];

  XCTAssertEqualObjects(fromMap, expected);
}

- (void)testSort {
  GHODictionary *dict = [[GHODictionary alloc] init];
  dict[@"a"] = @(1);
  dict[@"c"] = @(2);
  dict[@"d"] = @(3);
  dict[@"b"] = @(4);
  dict[@"e"] = @(5);

  GHODictionary *subdict = [GHODictionary d:@{@"y": @(6), @"x": @(7), @"z": @(8)}];
  dict[@"sub"] = subdict;

  NSArray *expected = @[@"a", @"b", @"c", @"d", @"e", @"sub"];
  NSArray *expected2 = @[@"x", @"y", @"z"];
  NSLog(@"Dict: %@", dict);

  XCTAssertNotEqualObjects(expected, [dict allKeys]);
  [dict sortKeysUsingSelector:@selector(localizedCaseInsensitiveCompare:) deepSort:YES];
  XCTAssertEqualObjects(expected, [dict allKeys]);
  XCTAssertEqualObjects(expected, [[dict keyEnumerator] allObjects]);
  XCTAssertEqualObjects(expected2, [dict[@"sub"] allKeys]);
}

@end

