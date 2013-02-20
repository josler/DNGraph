//
//  DNPersonTests.h
//  DNGraph
//
//  Created by James Osler on 15/02/2013.
//  Copyright (c) 2013 James Osler. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

@class DNPerson;

@interface DNPersonTests : SenTestCase

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) DNPerson *testPerson;

@end
