import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_tlawateh/core/helpers/helper_functions.dart';
import 'package:hack_tlawateh/core/helpers/sizing.dart';
import 'package:hack_tlawateh/core/utlis/api_constatns.dart';
import 'package:hack_tlawateh/core/utlis/app_model.dart';
import 'package:hack_tlawateh/core/utlis/data.dart';
import 'package:hack_tlawateh/core/utlis/enums.dart';
import 'package:hack_tlawateh/core/widgets/cached_image_widget.dart';
import 'package:hack_tlawateh/core/widgets/loading_widget.dart';
import 'package:hack_tlawateh/core/widgets/texts.dart';
import 'package:hack_tlawateh/modules/education/presentaion/ui/education_home/education_home_screen/education_home_screen.dart';
import 'package:hack_tlawateh/modules/general/domin/entities/category.dart';
import 'package:hack_tlawateh/modules/general/domin/entities/teacher.dart';
import 'package:hack_tlawateh/modules/general/presentaion/controllers/home_cubit/home_cubit.dart';
import 'package:hack_tlawateh/modules/quran/presentaion/controllers/quran_cubit/quran_cubit.dart';
import 'package:hack_tlawateh/modules/quran/presentaion/ui/quran_home_screen/quran_home_screen.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/utlis/strings.dart';
import '../../../domin/entities/add.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void initState() {
    super.initState();

    HomeCubit.get(context).getHomeData();
    // QuranCubit.get(context).getDocument();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: state.getHomeState == RequestState.loading
              ? Center(
                  child: LoadingWidget2(),
                )
              : SingleChildScrollView(
                  child: Padding(
                  padding: defaultPadding,
                  child: Column(
                    children: [
                      sizedHeight(60),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.grid_view,
                            color: Color(0xff1C315E),
                            size: 30,
                          ),
                          InkWell(
                            onTap: () {
                              // Share.share(dataForShare);
                            },
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff1C315E)),
                              child: Icon(
                                Icons.share,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      sizedHeight(30),

                      Row(
                        children: [
                          Texts(
                              title: "مرحبا بك ",
                              textColor: Colors.black.withOpacity(.5),
                              fontSize: padding25,
                              weight: FontWeight.normal),
                          Texts(
                              title:
                                  currentUser.fullName!.split(" ")[0] + " 👋",
                              textColor: Colors.black,
                              fontSize: padding25,
                              weight: FontWeight.bold)
                        ],
                      ),

                      sizedHeight(5),
                      Row(
                        children: [
                          Texts(
                              title: " مرحبا بك في الصفحة الرئيسية",
                              textColor: Colors.grey,
                              fontSize: padding15,
                              weight: FontWeight.normal),
                        ],
                      ),
                      sizedHeight(20),
                      // adds

                      state.homeResponse!.adds.isEmpty
                          ? SizedBox()
                          : ListAdds(state),

                      sizedHeight(15),
                      Container(
                        padding: EdgeInsets.all(15),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xffE9F8F9)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Texts(
                                        title: Strings.orderlesson,
                                        textColor: Colors.black,
                                        fontSize: padding20,
                                        weight: FontWeight.bold),
                                    sizedHeight(5),
                                    Texts(
                                        title: "دروس خاصة لجميع المواد",
                                        textColor: Colors.grey,
                                        fontSize: padding15,
                                        weight: FontWeight.normal),
                                  ],
                                ),
                                // list teachers
                                Expanded(
                                    child: Container(
                                  height: 50,
                                  child: Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: ListView.builder(
                                        itemCount: state.homeResponse!.teachers
                                                    .length >
                                                3
                                            ? 3
                                            : state
                                                .homeResponse!.teachers.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (ctx, index) {
                                          Teacher teacher = state
                                              .homeResponse!.teachers[index];
                                          return Align(
                                              widthFactor: .6,
                                              child: Container(
                                                // padding: EdgeInsets.all(3),
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                    // shape: BoxShape.circle,
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                    border: Border.all(
                                                        color: Color.fromARGB(
                                                            255, 239, 195, 119),
                                                        width: 2)),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  child:
                                                      CachedNetworkImageWidget(
                                                    height: 50,
                                                    width: 50,
                                                    image: teacher.image,
                                                    iconError: Icon(
                                                      Icons.person,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ));
                                        }),
                                  ),
                                ))
                              ],
                            ),
                            sizedHeight(5),
                          ],
                        ),
                      ),

                      sizedHeight(10),
                      ListCategories(state.homeResponse!.categories)
                    ],
                  ),
                )),
        );
      },
    );
  }
}

class ListCategories extends StatelessWidget {
  final List<Category> categories;
  const ListCategories(this.categories);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: categories.length,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            childAspectRatio: 1,
            crossAxisSpacing: 10),
        itemBuilder: (ctx, index) {
          Category category = categories[index];

          return InkWell(
            onTap: () {
              pushPageCategory(category.name,context: context);
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Color(int.parse(category.color)),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: CachedNetworkImageWidget(
                      height: 60,
                      width: 60,
                      image: category.image,
                      iconError: Icon(Icons.photo),
                    ),
                  ),
                  sizedHeight(10),
                  Texts(
                      title: category.name,
                      textColor: Colors.black,
                      fontSize: padding15,
                      weight: FontWeight.bold),
                ],
              ),
            ),
          );
        });
  }
  
  void pushPageCategory(String name,{context}) {
    switch (name) {
      case "القرآن الكريم":
        pushPage(context, QuranHomeScreen());
        break;
         case "تأسيس علمي ":
        pushPage(context, EducationHomeScreen());
        break;
         case "أذكار وتسبيح":
        pushPage(context, QuranHomeScreen());
        break;
        break;
         case "عبرة وعظة":
       pushPage(context, QuranHomeScreen());
        break;
        break;
      default:
    }
  }
}

class ListAdds extends StatelessWidget {
  final HomeState state;
  const ListAdds(
    this.state,
  );

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        aspectRatio: .9,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        height: 100,
        autoPlay: true,
        reverse: true,
        viewportFraction: 1,
        enableInfiniteScroll: false,
        initialPage: 0,
      ),
      itemCount: state.homeResponse!.adds.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        Add sliderModel = state.homeResponse!.adds[itemIndex];

        return InkWell(
          onTap: () {
            // Category categoryModel=Category(name: sliderModel.name,
            //     id: sliderModel.id,image: sliderModel.image);
            // pushPage(
            //     context: context,
            //     page: DetailsCare(sliderModel));
          },
          child: Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  imageUrl: ApiConstants.imageUrl(sliderModel.image),
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: mainColor,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )),
          ),
        );
      },
    );
  }
}
