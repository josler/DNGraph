// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DNArticle.m instead.

#import "_DNArticle.h"

const struct DNArticleAttributes DNArticleAttributes = {
	.comments = @"comments",
	.dateCreated = @"dateCreated",
	.favourite = @"favourite",
	.hashValue = @"hashValue",
	.imageFilename = @"imageFilename",
	.personId = @"personId",
	.ranking = @"ranking",
	.subjectId = @"subjectId",
	.textValue = @"textValue",
	.title = @"title",
	.type = @"type",
	.videoUrl = @"videoUrl",
};

const struct DNArticleRelationships DNArticleRelationships = {
	.person = @"person",
	.source = @"source",
	.subject = @"subject",
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
	if ([key isEqualToString:@"rankingValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"ranking"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic comments;






@dynamic dateCreated;






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






@dynamic personId;






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





@dynamic subjectId;






@dynamic textValue;






@dynamic title;






@dynamic type;






@dynamic videoUrl;






@dynamic person;

	

@dynamic source;

	

@dynamic subject;

	






@end
