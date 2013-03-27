// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DNSource.m instead.

#import "_DNSource.h"

const struct DNSourceAttributes DNSourceAttributes = {
	.facebookId = @"facebookId",
	.name = @"name",
	.ranking = @"ranking",
};

const struct DNSourceRelationships DNSourceRelationships = {
};

const struct DNSourceFetchedProperties DNSourceFetchedProperties = {
};

@implementation DNSourceID
@end

@implementation _DNSource

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"DNSource" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"DNSource";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"DNSource" inManagedObjectContext:moc_];
}

- (DNSourceID*)objectID {
	return (DNSourceID*)[super objectID];
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










@end
