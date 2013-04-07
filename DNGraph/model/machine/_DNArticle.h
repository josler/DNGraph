// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DNArticle.h instead.

#import <CoreData/CoreData.h>


extern const struct DNArticleAttributes {
	__unsafe_unretained NSString *comments;
	__unsafe_unretained NSString *dateCreated;
	__unsafe_unretained NSString *favourite;
	__unsafe_unretained NSString *hashValue;
	__unsafe_unretained NSString *imageFilename;
	__unsafe_unretained NSString *personId;
	__unsafe_unretained NSString *ranking;
	__unsafe_unretained NSString *subjectId;
	__unsafe_unretained NSString *textValue;
	__unsafe_unretained NSString *title;
	__unsafe_unretained NSString *type;
	__unsafe_unretained NSString *videoUrl;
} DNArticleAttributes;

extern const struct DNArticleRelationships {
	__unsafe_unretained NSString *person;
	__unsafe_unretained NSString *source;
	__unsafe_unretained NSString *subject;
} DNArticleRelationships;

extern const struct DNArticleFetchedProperties {
} DNArticleFetchedProperties;

@class DNPerson;
@class DNSource;
@class DNSubject;














@interface DNArticleID : NSManagedObjectID {}
@end

@interface _DNArticle : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (DNArticleID*)objectID;





@property (nonatomic, strong) NSString* comments;



//- (BOOL)validateComments:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* dateCreated;



//- (BOOL)validateDateCreated:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* favourite;



@property BOOL favouriteValue;
- (BOOL)favouriteValue;
- (void)setFavouriteValue:(BOOL)value_;

//- (BOOL)validateFavourite:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* hashValue;



//- (BOOL)validateHashValue:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* imageFilename;



//- (BOOL)validateImageFilename:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* personId;



//- (BOOL)validatePersonId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* ranking;



@property float rankingValue;
- (float)rankingValue;
- (void)setRankingValue:(float)value_;

//- (BOOL)validateRanking:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* subjectId;



//- (BOOL)validateSubjectId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* textValue;



//- (BOOL)validateTextValue:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* title;



//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* type;



//- (BOOL)validateType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* videoUrl;



//- (BOOL)validateVideoUrl:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) DNPerson *person;

//- (BOOL)validatePerson:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) DNSource *source;

//- (BOOL)validateSource:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) DNSubject *subject;

//- (BOOL)validateSubject:(id*)value_ error:(NSError**)error_;





@end

@interface _DNArticle (CoreDataGeneratedAccessors)

@end

@interface _DNArticle (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveComments;
- (void)setPrimitiveComments:(NSString*)value;




- (NSDate*)primitiveDateCreated;
- (void)setPrimitiveDateCreated:(NSDate*)value;




- (NSNumber*)primitiveFavourite;
- (void)setPrimitiveFavourite:(NSNumber*)value;

- (BOOL)primitiveFavouriteValue;
- (void)setPrimitiveFavouriteValue:(BOOL)value_;




- (NSString*)primitiveHashValue;
- (void)setPrimitiveHashValue:(NSString*)value;




- (NSString*)primitiveImageFilename;
- (void)setPrimitiveImageFilename:(NSString*)value;




- (NSString*)primitivePersonId;
- (void)setPrimitivePersonId:(NSString*)value;




- (NSNumber*)primitiveRanking;
- (void)setPrimitiveRanking:(NSNumber*)value;

- (float)primitiveRankingValue;
- (void)setPrimitiveRankingValue:(float)value_;




- (NSString*)primitiveSubjectId;
- (void)setPrimitiveSubjectId:(NSString*)value;




- (NSString*)primitiveTextValue;
- (void)setPrimitiveTextValue:(NSString*)value;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;




- (NSString*)primitiveType;
- (void)setPrimitiveType:(NSString*)value;




- (NSString*)primitiveVideoUrl;
- (void)setPrimitiveVideoUrl:(NSString*)value;





- (DNPerson*)primitivePerson;
- (void)setPrimitivePerson:(DNPerson*)value;



- (DNSource*)primitiveSource;
- (void)setPrimitiveSource:(DNSource*)value;



- (DNSubject*)primitiveSubject;
- (void)setPrimitiveSubject:(DNSubject*)value;


@end
