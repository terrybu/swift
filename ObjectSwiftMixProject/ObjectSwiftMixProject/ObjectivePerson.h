//
//  ObjectivePerson.h
//  
//
//  Created by Terry Bu on 5/13/15.
//
//

#import <Foundation/Foundation.h>

@class SwiftObject;

@interface ObjectivePerson : NSObject

@property (nonatomic, strong) SwiftObject *swiftObject;


- (void) useThatSwiftObject;

@end
