part of 'sub_category_cubit.dart';

 class SubCategoryState extends Equatable {
  final RequestState? getSubCategoriesState;
  final List<SubCategory> subCategories;


  SubCategoryState({this.getSubCategoriesState,this.subCategories = const []});
  
  @override
  // TODO: implement props
  List<Object?> get props => [
    getSubCategoriesState,
    subCategories
  ];
}
