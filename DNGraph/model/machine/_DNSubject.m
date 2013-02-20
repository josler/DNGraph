// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DNSubject.m instead.

#import "_DNSubject.h"

const struct DNSubjectAttributes DNSubjectAttributes = {
	.category = @"category",
	.facebookId = @"facebookId",
	.imageFilename = @"imageFilename",
	.meta = @"meta",
	.name = @"name",
	.ranking = @"ranking",
};

const struct DNSubjectRelationships DNSubjectRelationships = {
};

const struct DNSubjectFetchedProperties DNSubjectFetchedProperties = {
};

@implementation DNSubjectID
@end

@implementation _DNSubject

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"DNSubject" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"DNSubject";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"DNSubject" inManagedObjectContext:moc_];
}

- (DNSubjectID*)objectID {
	return (DNSubjectID*)[super objectID];
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




@dynamic category;






@dynamic facebookId;






@dynamic imageFilename;






@dynamic meta;






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
