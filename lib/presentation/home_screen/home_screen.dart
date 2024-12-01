
  import 'package:animeapp/core/theme/app_color.dart';
import 'package:animeapp/data/bloc/anime_bloc/anime_bloc.dart';
import 'package:animeapp/presentation/home_screen/widgets/backward_forward_btns.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../data/services/graphlql_service.dart';

class HomeScreen extends StatefulWidget {
    const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final pageController = PageController();

  @override
  void initState() {
     super.initState();

     context.read<AnimeBloc>().add(getAnimeRequest());
  }



    @override
    Widget build(BuildContext context) {
      var theme =Theme.of(context);
      var size = MediaQuery.of(context).size;
      return Scaffold(
        backgroundColor: AppColor.appColor1,
        body: BlocConsumer<AnimeBloc,AnimeState>(
          listener:(context,state){
            if (state is AnimeLoadFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.error,
                  ),
                ),
              );
            }
          },
          builder: (context,state){

            if(state is AnimeLoadFailure){
              return Center(child: TextButton(onPressed: (){
                context.read<AnimeBloc>().add(getAnimeRequest());
              }, child: Card(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Retry",style:theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500,color: AppColor.appColor3)),
              ))));
            }

              if(state is! AnimeLoadSuccess){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }


              final data = state.animeData.page!.media!;

            return PageView.builder(
                controller: pageController,
                 physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                itemBuilder: (context,index){
                    var result = data[index];
                  return  Column(
                    children: [


                      CachedNetworkImage(
                        width: double.infinity,
                        height: size.height*0.60,
                        fit: BoxFit.cover,
                        imageUrl: result.coverImage!.extraLarge!,
                        progressIndicatorBuilder: (context, url, downloadProgress) =>
                            Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),

                      const Gap(12.0),



                      SizedBox(
                        height: 300,
                        child: Stack(
                          children: [
                            Positioned(
                              top:-0.4,
                              //left: 10.0,
                              right:10.0,
                              child:  Container(
                                width: 70.0,
                                height: 68.0,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColor.appColor4
                                ),
                                child: Icon(Icons.play_arrow,color: AppColor.appColor2,size: 40,),
                              ),
                            ),

                            Column(
                              children: [
                                const Gap(12.0),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0,right: 16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width:260,
                                            child: Text(result.title!.english??result.title!.native!,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: theme.textTheme.bodyLarge,),
                                          ),
                                          const Gap(3.0),
                                          SizedBox(
                                            width: 280,
                                              child: Text("${result.seasonYear.toString()} - | ${result.genres!.join(',')}",
                                                  overflow: TextOverflow.ellipsis,
                                                  style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500))),
                                          const Gap(3.0),
                                          Text("Season 20, Episode ${result.episodes.toString()}",style: theme.textTheme.bodySmall?.copyWith(fontSize: 8,color: AppColor.appColor3)),
                                        ],
                                      ),






                                    ],
                                  ),
                                ),
                                const Gap(12.0),

                                ///Description
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0,right: 30.0),
                                  child: SizedBox(
                                    height: 100,
                                    child: Text(result.description!,
                                        maxLines: 6,
                                        overflow: TextOverflow.ellipsis,
                                        style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500)),
                                  ),
                                ),


                                const Gap(20.0),

                                ///buttons
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ///backwards
                                    BackwardForwardBtns(
                                        icon:Icons.arrow_back_outlined,
                                        ontap:(){
                                          if(index>0){
                                            context.read<AnimeBloc>().add(buttonBackward(controller: pageController));
                                          }
                                        }
                                    ),

                                    const Gap(12.0),

                                    ///forwards
                                    BackwardForwardBtns(
                                        icon:Icons.arrow_forward_outlined,
                                        ontap:(){
                                          context.read<AnimeBloc>().add(buttonForward(controller: pageController));
                                        }
                                    )
                                  ],
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),







                    ],
                  );
                });



          },
        ) ,
      );
    }


}



