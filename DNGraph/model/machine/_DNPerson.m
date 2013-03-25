// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DNPerson.m instead.

#import "_DNPerson.h"

const struct DNPersonAttributes DNPersonAttributes = {
	.facebookId = @"facebookId",
	.name = @"name",
	.ranking = @"ranking",
};

const struct DNPersonRelationships DNPersonRelationships = {
	.articles = @"articles",
};

const struct DNPersonFetchedProperties DNPersonFetchedProperties = {
};

@implementation DNPersonID
@end

@implementation _DNPerson

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"DNPerson" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"DNPerson";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"DNPerson" inManagedObjectContext:moc_];
}

- (DNPersonID*)objectID {
	return (DNPersonID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"rankingValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"ranking"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic facebookId;






@dynamic name;






@dynamic ranking;



- (float)rankingValue {
	NSNumber *result = [self ranking];
	return [result floatValue];
}

- (void)setRankingValue:(float)value_ {
	[self setRanking:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveRankingValue {
	NSNumber *result = [self primitiveRanking];
	return [result floatValue];
}

- (void)setPrimitiveRankingValue:(float)value_ {
	[self setPrimitiveRanking:[NSNumber numberWithFloat:value_]];
}





@dynamic articles;

	
- (NSMutableSet*)articlesSet {
	[self willAccessValueForKey:@"articles"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"articles"];
  
	[self didAccessValueForKey:@"articles"];
	return result;
}
	






@end
