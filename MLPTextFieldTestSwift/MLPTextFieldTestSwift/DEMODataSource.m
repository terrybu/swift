//
//  DEMODataSource.m
//  MLPAutoCompleteDemo
//
//  Created by Eddy Borja on 5/28/14.
//  Copyright (c) 2014 Mainloop. All rights reserved.
//

#import "DEMODataSource.h"
#import "DEMOCustomAutoCompleteObject.h"
#import <UIKit/UIKit.h>

@interface DEMODataSource ()

@property (strong, nonatomic) NSArray * clientObjects;

@end


@implementation DEMODataSource


#pragma mark - MLPAutoCompleteTextField DataSource


//example of asynchronous fetch:
- (void)autoCompleteTextField:(MLPAutoCompleteTextField *)textField
 possibleCompletionsForString:(NSString *)string
            completionHandler:(void (^)(NSArray *))handler
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_async(queue, ^{
        if(self.simulateLatency){
            CGFloat seconds = arc4random_uniform(4)+arc4random_uniform(4); //normal distribution
            NSLog(@"sleeping fetch of completions for %f", seconds);
            sleep(seconds);
        }
        
        NSArray *completions;
        if(self.testWithAutoCompleteObjectsInsteadOfStrings){
            completions = [self allClientObjects];
        } else {
            completions = [self allClients];
        }
        
        handler(completions);
    });
}

/*
 - (NSArray *)autoCompleteTextField:(MLPAutoCompleteTextField *)textField
 possibleCompletionsForString:(NSString *)string
 {
 
 if(self.simulateLatency){
 CGFloat seconds = arc4random_uniform(4)+arc4random_uniform(4); //normal distribution
 NSLog(@"sleeping fetch of completions for %f", seconds);
 sleep(seconds);
 }
 
 NSArray *completions;
 if(self.testWithAutoCompleteObjectsInsteadOfStrings){
 completions = [self allCountryObjects];
 } else {
 completions = [self allCountries];
 }
 
 return completions;
 }
 */

- (NSArray *)allClientObjects
{
    if(!self.clientObjects){
        NSArray *clientNames = [self allClients];
        NSMutableArray *mutableClients = [NSMutableArray new];
        for(NSString *clientName in clientNames){
            DEMOCustomAutoCompleteObject *country = [[DEMOCustomAutoCompleteObject alloc] initWithClient:clientName];
            [mutableClients addObject:country];
        }
        
        [self setClientObjects:[NSArray arrayWithArray:mutableClients]];
    }
    
    return self.clientObjects;
}


- (NSArray *)allClients
{
    NSArray *clients =
    @[
      @"BAM-X",
      @"Viacom",
      @"SOLS",
      @"Intent Media"
      ];
    
    return clients;
}





@end
