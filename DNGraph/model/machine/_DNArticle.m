// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DNArticle.m instead.

#import "_DNArticle.h"

const struct DNArticleAttributes DNArticleAttributes = {
	.comments = @"comments",
	.favourite = @"favourite",
	.hashValue = @"hashValue",
	.imageFilename = @"imageFilename",
	.nodeCount = @"nodeCount",
	.nodeRanking = @"nodeRanking",
	.personId = @"personId",
	.sourceId = @"sourceId",
	.subjectId = @"subjectId",
	.textValue = @"textValue",
	.videoUrl = @"videoUrl",
};

const struct DNArticleRelationships DNArticleRelationships = {
};

const struct DNArticleFetchedProperties DNArticleFetchedProperties = {
};

@implementation DNArticleID
@end

@implementation _DNArticle

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"DNArticle" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"DNArticle";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"DNArticle" inManagedObjectContext:moc_];
}

- (DNArticleID*)objectID {
	return (DNArticleID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"favouriteValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"favourite"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"nodeCountValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"nodeCount"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"nodeRankingValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"nodeRanking"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic comments;






@dynamic favourite;



- (BOOL)favouriteValue {
	NSNumber *result = [self favourite];
	return [result boolValue];
}

- (void)setFavouriteValue:(BOOL)value_ {
	[self setFavourite:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveFavouriteValue {
	NSNumber *result = [self primitiveFavourite];
	return [result boolValue];
}

- (void)setPrimitiveFavouriteValue:(BOOL)value_ {
	[self setPrimitiveFavourite:[NSNumber numberWithBool:value_]];
}





@dynamic hashValue;






@dynamic imageFilename;






@dynamic nodeCount;



- (int16_t)nodeCountValue {
	NSNumber *result = [self nodeCount];
	return [result shortValue];
}

- (void)setNodeCountValue:(int16_t)value_ {
	[self setNodeCount:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveNodeCountValue {
	NSNumber *result = [self primitiveNodeCount];
	return [result shortValue];
}

- (void)setPrimitiveNodeCountValue:(int16_t)value_ {
	[self setPrimitiveNodeCount:[NSNumber numberWithShort:value_]];
}





@dynamic nodeRanking;



- (double)nodeRankingValue {
	NSNumber *result = [self nodeRanking];
	return [result doubleValue];
}

- (void)setNodeRankingValue:(double)value_ {
	[self setNodeRanking:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveNodeRankingValue {
	NSNumber *result = [self primitiveNodeRanking];
	return [result doubleValue];
}

- (void)setPrimitiveNodeRankingValue:(double)value_ {
	[self setPrimitiveNodeRanking:[NSNumber numberWithDouble:value_]];
}





@dynamic personId;






@dynamic sourceId;






@dynamic subjectId;






@dynamic textValue;






@dynamic videoUrl;











@end
