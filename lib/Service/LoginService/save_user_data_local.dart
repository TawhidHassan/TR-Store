import 'package:hive/hive.dart';

class LoginDataSave{

  Future storeTokenUserdata(Box? users,String? token,String? id,String? name,String? email,String? role,String? employeId,bool? isAssigned,String? image) async{
    print(id);
    users?.put("token", token);
    users?.put("userId", id);
    users?.put("email", email);
    users?.put("name", name);
    users?.put("role", role);
    users?.put("employeeId", employeId);
    users?.put("isAssigned", isAssigned);
  }

  Future storeShowCae(Box? users,String done) async{
    print(done);
    users?.put("isShowCase", done);
  }

//login

}

// import 'dart:io';
//
// import 'package:Aisky/config/color/custom_color.dart';
// import 'package:country_flags/country_flags.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:showcaseview/showcaseview.dart';
//
// import '../../../Service/GoogleAds/google_ads_service.dart';
// import '../../../config/Strings/strings.dart';
// import '../../../config/util/logger.dart';
// import '../../../config/util/text_style.dart';
// import '../../../custom_assets/assets.gen.dart';
// import '../../../network/api_services.dart';
// import '../../../routes/route_path.dart';
// import '../bloc/home_bloc.dart';
// import '../controller/HomeController.dart';
// import 'Component/action_button.dart';
// import 'Component/app_bar.dart';
// import 'Component/choice_chat_button.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//   static final controller=  Get.find<HomeController>();
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   static final AdRequest request = AdRequest(
//     keywords: <String>['foo', 'bar'],
//     contentUrl: 'http://foo.com/bar.html',
//     nonPersonalizedAds: true,
//   );
//
//
//   int maxFailedLoadAttempts = 3;
//
//   InterstitialAd? _interstitialAd;
//   int _numInterstitialLoadAttempts = 0;
//
//   RewardedAd? _rewardedAd;
//   int _numRewardedLoadAttempts = 0;
//
//   BannerAd? myBanner;
//   bool showAds = false;
//
//   RewardedInterstitialAd? _rewardedInterstitialAd;
//   int _numRewardedInterstitialLoadAttempts = 0;
//
//   GooglAdsService googlAdsService= GooglAdsService();
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     googlAdsService.createInterstitialAd();
//     googlAdsService.createRewardedAd();
//     bannerAd();
//     super.initState();
//     myBanner!.load();
//     myBanner!..responseInfo;
//   }
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//
//   }
//   ///InterstitialAd
//   void _showInterstitialAd() async{
//     if (_interstitialAd == null) {
//       print('Warning: attempt to show interstitial before loaded.');
//       return;
//     }
//     _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
//       onAdShowedFullScreenContent: (InterstitialAd ad) =>
//           print('ad onAdShowedFullScreenContent.'),
//       onAdDismissedFullScreenContent: (InterstitialAd ad) {
//         print('$ad onAdDismissedFullScreenContent.');
//         ad.dispose();
//         googlAdsService.createInterstitialAd();
//         context.pushNamed(Routes.chatPage);
//       },
//       onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
//         print('$ad onAdFailedToShowFullScreenContent: $error');
//         ad.dispose();
//         googlAdsService.createInterstitialAd();
//       },
//     );
//     await _interstitialAd!.show();
//     _interstitialAd = null;
//   }
//
//   ///RewardedAd
//   void _showRewardedAd() {
//     if (_rewardedAd == null) {
//       print('Warning: attempt to show rewarded before loaded.');
//       return;
//     }
//     _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
//       onAdShowedFullScreenContent: (RewardedAd ad) =>
//           print('ad onAdShowedFullScreenContent.'),
//       onAdDismissedFullScreenContent: (RewardedAd ad) {
//         print('$ad onAdDismissedFullScreenContent.');
//         ad.dispose();
//         googlAdsService.createRewardedAd();
//         context.pushNamed(Routes.imageChatPage);
//       },
//       onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
//         print('$ad onAdFailedToShowFullScreenContent: $error');
//         ad.dispose();
//         googlAdsService.createRewardedAd();
//       },
//     );
//
//     _rewardedAd!.setImmersiveMode(true);
//     _rewardedAd!.show(
//         onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
//           print('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
//         });
//     _rewardedAd = null;
//   }
//
//
//   ///Bannerad
//   BannerAd bannerAd() {
//     myBanner =  BannerAd(
//       adUnitId: Platform.isAndroid
//           ? 'ca-app-pub-3940256099942544/6300978111'
//           : 'ca-app-pub-3940256099942544/6300978111',
//       size: AdSize.banner,
//       request: AdRequest(),
//       listener: BannerAdListener(
//         onAdLoaded: (ad) {
//           print('admob is loaded or loading');
//           setState(() {
//             showAds = true;
//           });
//         },
//         onAdFailedToLoad: (ad, error) {
//           print('admob is dispose or disposing');
//           log.e(error);
//           ad.dispose();
//           setState(() {
//             showAds = false;
//           });
//         },
//       ),
//     );
//     return myBanner!;
//   }
//
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     myBanner!.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return ShowCaseWidget(
//         onComplete: (index, key){
//           print("Show Done");
//           print(index);
//           if(index==2){
//             // BlocProvider.of<ShowCaseCubit>(context).scroolBottom();
//           }
//           Get.find<HomeController>().loginDataSave!.storeShowCae(Get.find<HomeController>().users,"done");
//         },
//         builder: Builder(
//             builder: (context) {
//               return Scaffold(
//                 appBar: AppBar(
//                   elevation: 0,
//                   // systemOverlayStyle: const SystemUiOverlayStyle(
//                   //   // Status bar color
//                   //   statusBarColor: Color(0xFF302B53),
//                   //   // Status bar brightness (optional)
//                   //   statusBarIconBrightness: Brightness.light, // For Android (dark icons)
//                   //   statusBarBrightness: Brightness.light, // For iOS (dark icons)
//                   // ),
//                   toolbarHeight: 77.h,
//                   title: const CustomeAppBar(),
//                   actions: [
//                     Container(
//                       margin: EdgeInsets.only(right: 16.w),
//                       child: InkWell(
//                           onTap: () async {
//                             WidgetsBinding.instance.addPostFrameCallback(
//                                   (_) => ShowCaseWidget.of(context)
//                                   .startShowCase([HomePage.controller.first, HomePage.controller.second, HomePage.controller.third,HomePage.controller.fourth]),
//                             );
//                           },
//                           child: Assets.icons.qus.svg(height: 24.h,)),
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(right: 16.w),
//                       child: InkWell(
//                         onTap: () async {
//                           showMenu(
//                             color: Theme.of(context).primaryColor,
//                             context: context,
//                             position: RelativeRect.fromLTRB(0.9.sw, 100, 50, 100),
//                             items: [
//                               PopupMenuItem<String>(
//                                 value: 'US',
//                                 child: Row(
//                                   children: [
//                                     CountryFlag.fromCountryCode(
//                                       'US',
//                                       height: 32,
//                                       width: 32,
//                                       borderRadius: 8,
//                                     ),
//                                     SizedBox(width: 8,),
//                                     Text("Usa")
//                                   ],
//                                 ),
//                                 onTap: (){
//                                   context.locale=Locale('en', 'US');
//                                   Get.updateLocale(Locale('en', 'US'));
//                                 },
//                               ),
//                               PopupMenuItem<String>(
//                                 value: 'BD',
//                                 child: Row(
//                                   children: [
//                                     CountryFlag.fromCountryCode(
//                                       'BD',
//                                       height: 32,
//                                       width: 32,
//                                       borderRadius: 8,
//                                     ),
//                                     SizedBox(width: 8,),
//                                     Text("Babgla")
//                                   ],
//                                 ),
//                                 onTap: (){
//                                   context.locale=Locale('bn', 'BD');
//                                   Get.updateLocale(Locale('bn', 'BD'));
//                                 },
//                               ),
//                               PopupMenuItem<String>(
//                                 value: 'ES',
//                                 child: Row(
//                                   children: [
//                                     CountryFlag.fromCountryCode(
//                                       'ES',
//                                       height: 32,
//                                       width: 32,
//                                       borderRadius: 8,
//                                     ),
//                                     SizedBox(width: 8,),
//                                     Text("Spanish")
//                                   ],
//                                 ),
//                                 onTap: (){
//                                   context.locale=Locale('es', 'ES');
//                                   Get.updateLocale(Locale('es', 'ES'));
//                                 },
//                               ),
//                               PopupMenuItem<String>(
//                                 value: 'IN',
//                                 child: Row(
//                                   children: [
//                                     CountryFlag.fromCountryCode(
//                                       'IN',
//                                       height: 32,
//                                       width: 32,
//                                       borderRadius: 8,
//                                     ),
//                                     SizedBox(width: 8,),
//                                     Text("Hindi")
//                                   ],
//                                 ),
//                                 onTap: (){
//                                   context.locale=Locale('hi', 'IN');
//                                   Get.updateLocale(Locale('hi', 'IN'));
//                                 },
//                               ),
//                               PopupMenuItem<String>(
//                                 value: 'SA',
//                                 child: Row(
//                                   children: [
//                                     CountryFlag.fromCountryCode(
//                                       'SA',
//                                       height: 32,
//                                       width: 32,
//                                       borderRadius: 8,
//                                     ),
//                                     SizedBox(width: 8,),
//                                     Text("Arabic")
//                                   ],
//                                 ),
//                                 onTap: (){
//                                   context.locale=Locale('ar', 'SA');
//                                   Get.updateLocale(Locale('ar', 'SA'));
//                                 },
//                               ),
//
//
//                             ],
//                             elevation: 8.0,
//
//                           );
//                         },
//                         child: Assets.icons.translate.svg(color: Color(0xFF5761F6)),),
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(right: 16.w),
//                       child: InkWell(
//                         onTap: () async {
//                           // context.
//                           HomePage.controller.switchTheme();
//                           Get.changeThemeMode(HomePage.controller.currentTheme.value);
//                         },
//                         child: Icon(Theme.of(context).brightness==Brightness.dark?Icons.sunny:Icons.nightlight),),
//                     ),
//
//                   ],
//                 ),
//                 // floatingActionButton: FloatingActionButton(
//                 //   onPressed: () {
//                 //     Get.find<HomeController>().getcategory();
//                 //     context.read<HomeBloc>().add(const HomeEvent.increment());
//                 //   },
//                 //   tooltip: 'Increment',
//                 //   child: Assets.images.user.image(),
//                 // ),
//
//                 body: GetBuilder<HomeController>(
//                   assignId: true,
//                   builder: (controller) {
//                     return Container(
//                         height: 1.0.sh,
//                         width: 1.0.sw,
//                         padding: EdgeInsets.all(16),
//                         child: SafeArea(
//                           child: CustomScrollView(
//                             slivers: [
//                               SliverToBoxAdapter(
//                                   child: SizedBox(
//                                     width: 1.0.sw,
//                                     child: Row(
//                                       children: [
//                                         Expanded(
//                                           child: InkWell(
//                                             onTap: () {
//                                               if (controller.popularResult.isEmpty) {
//                                                 ShowCaseWidget.of(context).startShowCase(
//                                                     [controller.first, controller.second, controller.third, controller.fourth]);
//                                               } else {
//                                                 _showInterstitialAd();
//                                               }
//                                             },
//                                             child: Showcase(
//                                               key: controller.first,
//                                               title: tr(Strings.TextChat),
//                                               description: tr(Strings.YouCanTextChat),
//                                               child: const ChoiceChatButton(
//                                                 title: Strings.ChatGPT,
//                                                 description: Strings.YouCanTextChatMain,
//                                                 icon: "assets/icons/chat.svg",
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         SizedBox(width: 15.w,),
//                                         Expanded(
//                                           child: InkWell(
//                                             onTap: () {
//                                               if (controller.popularResult.isEmpty) {
//                                                 ShowCaseWidget.of(context).startShowCase(
//                                                     [controller.first, controller.second, controller.third, controller.fourth]);
//                                               } else {
//                                                 // Navigator.pushNamed(
//                                                 //     context, IMAGE_CHAT_PAGE);
//                                                 _showRewardedAd();
//
//
//                                               }
//                                             },
//                                             child: Showcase(
//                                               key: controller.second,
//                                               title: tr(Strings.ImageChat),
//                                               description: tr(Strings.YouCanTextImage),
//                                               child: ChoiceChatButton(
//                                                 title: tr(Strings.ImageChat),
//                                                 description: Strings.YouCanTextImageMain,
//                                                 icon: "assets/icons/image.svg",
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   )
//                               ),
//                               SliverToBoxAdapter(
//                                 child: SizedBox(height: 15.h,),
//                               ),
//                               SliverToBoxAdapter(
//                                 child: Showcase(
//                                   key: controller.third,
//                                   title: tr(Strings.TutorialButton),
//                                   description: tr(Strings.YoucanSeeTutorial),
//                                   child: InkWell(
//                                     onTap: () {
//                                       // Navigator.pushNamed(context, TUTORIAL_PAGE);
//                                       context.goNamed(Routes.tutorialPath);
//                                     },
//                                     child: Container(
//                                       padding: const EdgeInsets.all(16),
//                                       width: 1.0.sw,
//                                       decoration: BoxDecoration(
//                                           color: Theme.of(context).primaryColor,
//                                           borderRadius: BorderRadius.circular(12),
//                                           border: Border.all(
//                                               color: Theme.of(context).primaryColor)
//                                       ),
//                                       child: Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Column(
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               Row(
//                                                 children: [
//                                                   Assets.icons.qus.svg(width: 16.w,),
//                                                   SizedBox(width: 8.w,),
//                                                   Text(tr(Strings.Tutorials), style: boldText(
//                                                       13.sp, color: Theme.of(context).textTheme.bodyMedium!.color!),)
//                                                 ],
//                                               ),
//                                               SizedBox(height: 7.h,),
//                                               Text(tr(Strings.JustSeeHelp),
//                                                 style: boldText(
//                                                     11.sp, color: Theme.of(context).textTheme.bodySmall!.color!),)
//                                             ],
//                                           ),
//                                           const Icon(Icons.keyboard_arrow_right,
//                                             color: Color(0xFF514888),)
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               SliverToBoxAdapter(
//                                 child: SizedBox(height: 20.h,),
//                               ),
//                               SliverToBoxAdapter(
//                                 child: showAds
//                                     ?
//                                 Container(
//                                   height: 52,
//                                   width: double.infinity,
//                                   margin: EdgeInsets.only(bottom: 5, top: 5, left: 8, right: 8),
//                                   child: AdWidget(
//                                     ad: myBanner!,
//                                   ),
//                                 )
//                                     : Container(),
//                               ),
//                               SliverToBoxAdapter(
//                                 child: SizedBox(height:showAds
//                                     ? 10.h:0,),
//                               ),
//                               SliverToBoxAdapter(
//                                 child: Showcase(
//                                     key: controller.fourth,
//                                     title: tr(Strings.PopularSearchHistory),
//                                     description: tr(Strings.YouCanFindQuestions),
//                                     child: Text(tr(Strings.PopularSearch), style: extraBoldText(15
//                                         .sp, color:Theme.of(context).textTheme.bodyMedium!.color!),)),
//                               ),
//                               SliverToBoxAdapter(
//                                 child: SizedBox(height: 10.h,),
//                               ),
//                               SliverToBoxAdapter(
//                                   child: ListView.builder(
//                                       physics: const NeverScrollableScrollPhysics(),
//                                       shrinkWrap: true,
//                                       itemCount: controller.popularResult.length,
//                                       itemBuilder: (context, index) =>
//                                           InkWell(
//                                               onTap: () {
//                                                 // Navigator.pushNamed(
//                                                 // context, TEXT_CHAT_PAGE, arguments: );
//                                                 context.pushNamed(Routes.chatPage,queryParameters: {
//                                                   'text': controller.popularResult[index]
//                                                 });
//                                               },
//                                               child: ActionButton(
//                                                   title: controller.popularResult[index])))
//                               ),
//                               SliverToBoxAdapter(
//                                   child: ClipRRect(
//                                       borderRadius: BorderRadius.zero,
//                                       child: Container(width: 1.0.sw,
//                                         height: 40.h,
//                                         decoration: BoxDecoration(),
//                                         child: Center(
//                                             child: Text(tr(Strings.Version)+" 1.0.0",
//                                               style: mediumText(13.sp, color: Color(0xFF919ABD)),)),
//                                       )
//                                   )
//                               ),
//                               SliverToBoxAdapter(
//                                 child: SizedBox(height: 10.h,),
//                               ),
//
//                               SliverToBoxAdapter(
//                                 child: SizedBox(height: 40.h,),
//                               )
//                             ],
//                           ),
//                         )
//                     );
//                   },
//                 ),
//               );
//             }
//         )
//     );
//   }
// }
