//
//  Tests.m
//  Tests
//
//  Created by Travis Jeffery on 5/13/14.
//
//

#import <XCTest/XCTest.h>
#import "TRVSXMLDictionary.h"

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)testDictionary {
  NSData *data = [
          @"<person><names><firstName>Travis</firstName><lastName>Jeffery</"
      @"lastName></names><socialNetworks><socialNetwork>twitter.com/"
      @"travisjeffery</socialNetwork><socialNetwork>github.com/travisjeffery</"
      @"socialNetwork></socialNetworks></person>"
      dataUsingEncoding:NSUTF8StringEncoding];
  NSDictionary *actual = [TRVSXMLDictionary dictionaryUsingData:data];

  NSString *expectedFirstName = @"Travis";
  NSString *actualFirstName =
      [actual valueForKeyPath:@"person.names.firstName.text"];
  XCTAssertEqualObjects(actualFirstName, expectedFirstName);

  NSArray *actualNetworks =
      [actual valueForKeyPath:@"person.socialNetworks.socialNetwork"];
  NSArray *expectedNetworks = @[
    @{@"text" : @"twitter.com/travisjeffery"},
    @{@"text" : @"github.com/travisjeffery"}
  ];
  XCTAssertEqualObjects(expectedNetworks, actualNetworks);
}

@end
