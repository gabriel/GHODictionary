GHODictionary
===========

Ordered dictionary.

# Podfile

```ruby
pod "GHODictionary"
```

# Usage

```objc
#import <GHODictionary/GHODictionary.h>

GHODictionary *dict = [[GHODictionary alloc] init];
[dict addEntriesFromDictionary:@{@"c": @(1), @"b": @(2), @"a": @(3)}];

[dict sortKeysUsingSelector:@selector(localizedCaseInsensitiveCompare:)];

```

