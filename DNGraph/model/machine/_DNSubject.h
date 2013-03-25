// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DNSubject.h instead.

#import <CoreData/CoreData.h>


extern const struct DNSubjectAttributes {
	__unsafe_unretained NSString *category;
	__unsafe_unretained NSString *facebookId;
	__unsafe_unretained NSString *imageFilename;
	__unsafe_unretained NSString *meta;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *ranking;
} DNSubjectAttributes;

extern const struct DNSubjectRelationships {
	__unsafe_unretained NSString *articles;
} DNSubjectRelationships;

extern const struct DNSubjectFetchedProperties {
} DNSubjectFetchedProperties;

@class DNArticle;








@interface DNSubjectID : NSManagedObjectID {}
@end

@interface _DNSubject : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (DNSubjectID*)objectID;





@property (nonatomic, strong) NSString* category;



//- (BOOL)validateCategory:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* facebookId;



//- (BOOL)validateFacebookId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* imageFilename;



//- (BOOL)validateImageFilename:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* meta;



//- (BOOL)validateMeta:(id*)value_ error:(NSError**)error_;





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

@interface _DNSubject (CoreDataGeneratedAccessors)

- (void)addArticles:(NSSet*)value_;
- (void)removeArticles:(NSSet*)value_;
- (void)addArticlesObject:(DNArticle*)value_;
- (void)removeArticlesObject:(DNArticle*)value_;

@end

@interface _DNSubject (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveCategory;
- (void)setPrimitiveCategory:(NSString*)value;




- (NSString*)primitiveFacebookId;
- (void)setPrimitiveFacebookId:(NSString*)value;




- (NSString*)primitiveImageFilename;
- (void)setPrimitiveImageFilename:(NSString*)value;




- (NSString*)primitiveMeta;
- (void)setPrimitiveMeta:(NSString*)value;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSNumber*)primitiveRanking;
- (void)setPrimitiveRanking:(NSNumber*)value;

- (float)primitiveRankingValue;
- (void)setPrimitiveRankingValue:(float)value_;





- (NSMutableSet*)primitiveArticles;
- (void)setPrimitiveArticles:(NSMutableSet*)value;


@end
