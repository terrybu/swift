//
//  ObjectivePerson.m
//  
//
//  Created by Terry Bu on 5/13/15.
//
//

#import "ObjectivePerson.h"
#import "ObjectSwiftMixProject-Swift.h"

@implementation ObjectivePerson

- (void) useThatSwiftObject {
    SwiftObject *swiftObject = [[SwiftObject alloc]init];
    swiftObject.firstName = @"Terry";
    swiftObject.lastName = @"Bu";
    self.swiftObject = swiftObject;
    NSLog(@"swift object name is %@ %@", self.swiftObject.firstName, self.swiftObject.lastName);
}

@end
