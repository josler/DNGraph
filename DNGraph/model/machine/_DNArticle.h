// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DNArticle.h instead.

#import <CoreData/CoreData.h>


extern const struct DNArticleAttributes {
	__unsafe_unretained NSString *comments;
	__unsafe_unretained NSString *favourite;
	__unsafe_unretained NSString *hashValue;
	__unsafe_unretained NSString *imageFilename;
	__unsafe_unretained NSString *nodeCount;
	__unsafe_unretained NSString *nodeRanking;
	__unsafe_unretained NSString *personId;
	__unsafe_unretained NSString *sourceId;
	__unsafe_unretained NSString *subjectId;
	__unsafe_unretained NSString *textValue;
	__unsafe_unretained NSString *videoUrl;
} DNArticleAttributes;

extern const struct DNArticleRelationships {
} DNArticleRelationships;

extern const struct DNArticleFetchedProperties {
} DNArticleFetchedProperties;














@interface DNArticleID : NSManagedObjectID {}
@end

@interface _DNArticle : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (DNArticleID*)objectID;





@property (nonatomic, strong) NSString* comments;



//- (BOOL)validateComments:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* favourite;



@property BOOL favouriteValue;
- (BOOL)favouriteValue;
- (void)setFavouriteValue:(BOOL)value_;

//- (BOOL)validateFavourite:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* hashValue;



//- (BOOL)validateHashValue:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* imageFilename;



//- (BOOL)validateImageFilename:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* nodeCount;



@property int16_t nodeCountValue;
- (int16_t)nodeCountValue;
- (void)setNodeCountValue:(int16_t)value_;

//- (BOOL)validateNodeCount:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* nodeRanking;



@property double nodeRankingValue;
- (double)nodeRankingValue;
- (void)setNodeRankingValue:(double)value_;

//- (BOOL)validateNodeRanking:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* personId;



//- (BOOL)validatePersonId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* sourceId;



//- (BOOL)validateSourceId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* subjectId;



//- (BOOL)validateSubjectId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* textValue;



//- (BOOL)validateTextValue:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* videoUrl;



//- (BOOL)validateVideoUrl:(id*)value_ error:(NSError**)error_;






@end

@interface _DNArticle (CoreDataGeneratedAccessors)

@end

@interface _DNArticle (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveComments;
- (void)setPrimitiveComments:(NSString*)value;




- (NSNumber*)primitiveFavourite;
- (void)setPrimitiveFavourite:(NSNumber*)value;

- (BOOL)primitiveFavouriteValue;
- (void)setPrimitiveFavouriteValue:(BOOL)value_;




- (NSString*)primitiveHashValue;
- (void)setPrimitiveHashValue:(NSString*)value;




- (NSString*)primitiveImageFilename;
- (void)setPrimitiveImageFilename:(NSString*)value;




- (NSNumber*)primitiveNodeCount;
- (void)setPrimitiveNodeCount:(NSNumber*)value;

- (int16_t)primitiveNodeCountValue;
- (void)setPrimitiveNodeCountValue:(int16_t)value_;




- (NSNumber*)primitiveNodeRanking;
- (void)setPrimitiveNodeRanking:(NSNumber*)value;

- (double)primitiveNodeRankingValue;
- (void)setPrimitiveNodeRankingValue:(double)value_;




- (NSString*)primitivePersonId;
- (void)setPrimitivePersonId:(NSString*)value;




- (NSString*)primitiveSourceId;
- (void)setPrimitiveSourceId:(NSString*)value;




- (NSString*)primitiveSubjectId;
- (void)setPrimitiveSubjectId:(NSString*)value;




- (NSString*)primitiveTextValue;
- (void)setPrimitiveTextValue:(NSString*)value;




- (NSString*)primitiveVideoUrl;
- (void)setPrimitiveVideoUrl:(NSString*)value;




@end
