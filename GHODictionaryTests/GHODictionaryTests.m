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
  GHODictionary *dict = [[GHODictionary alloc] init];
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

  //NSLog(@"Description: %@", [dictCopy description]);
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

