// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DNPerson.h instead.

#import <CoreData/CoreData.h>


extern const struct DNPersonAttributes {
	__unsafe_unretained NSString *facebookId;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *ranking;
} DNPersonAttributes;

extern const struct DNPersonRelationships {
	__unsafe_unretained NSString *articles;
} DNPersonRelationships;

extern const struct DNPersonFetchedProperties {
} DNPersonFetchedProperties;

@class DNArticle;





@interface DNPersonID : NSManagedObjectID {}
@end

@interface _DNPerson : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (DNPersonID*)objectID;





@property (nonatomic, strong) NSString* facebookId;



//- (BOOL)validateFacebookId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* ranking;



@property float rankingValue;
- (float)rankingValue;
- (void)setRankingValue:(float)value_;

//- (BOOL)validateRanking:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *articles;

- (NSMutableSet*)articlesSet;





@end

@interface _DNPerson (CoreDataGeneratedAccessors)

- (void)addArticles:(NSSet*)value_;
- (void)removeArticles:(NSSet*)value_;
- (void)addArticlesObject:(DNArticle*)value_;
- (void)removeArticlesObject:(DNArticle*)value_;

@end

@interface _DNPerson (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveFacebookId;
- (void)setPrimitiveFacebookId:(NSString*)value;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSNumber*)primitiveRanking;
- (void)setPrimitiveRanking:(NSNumber*)value;

- (float)primitiveRankingValue;
- (void)setPrimitiveRankingValue:(float)value_;





- (NSMutableSet*)primitiveArticles;
- (void)setPrimitiveArticles:(NSMutableSet*)value;


@end
