import 'package:booking_app/core/utils/assets_manager.dart';
import 'package:booking_app/core/utils/color_manager.dart';
import 'package:booking_app/core/utils/values_manager.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<String> imagesSlider = [
      ImageAssets.explore_1,
      ImageAssets.explore_2,
      ImageAssets.explore_3,
    ];
    CarouselController carouselController = CarouselController();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          
          SliverAppBar(
            automaticallyImplyLeading: false,
            leadingWidth: double.infinity,
            toolbarHeight: size.height * 0.1,
            collapsedHeight: size.height * 0.25,
            title: containerSearch(size, context),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSize.s20),
                    topRight: Radius.circular(AppSize.s20),
                  ),
                  color: Colors.teal,
                ),
                child: const Center(child: Text('Don\'t know ')),
              ),
            ),
            pinned: true,
            expandedHeight: size.height * 0.6,
            flexibleSpace: FlexibleSpaceBar(
                background: Stack(
              children: [
                carouselSliderImages(size, carouselController, imagesSlider),
              ],
            )),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(
                  left: AppMargin.m20, right: AppMargin.m20),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        left: AppMargin.m20, right: AppMargin.m20),
                    child: const Text(
                      ' Paragraphs are the building blocks of papers. Many students define paragraphs in terms of length: a paragraph is a group of at least five sentences, a paragraph is half a page long, etc. In reality, though, the unity and coherence of ideas among sentences is what constitutes a paragraph. A paragraph is defined as “a group of sentences or a single sentence that forms a unit” (Lunsford and Connors 116). Length and appearance do not determine whether a section in a paper is a paragraph. For instance, in some styles of writing, particularly journalistic styles, a paragraph can be just one sentence long. Ultimately, a paragraph is a sentence or group of sentences that support one main idea. In this handout, we will refer to this as the “controlling idea,” because it controls what happens in the rest of the paragraph. Paragraphs are the building blocks of papers. Many students define paragraphs in terms of length: a paragraph is a group of at least five sentences, a paragraph is half a page long, etc. In reality, though, the unity and coherence of ideas among sentences is what constitutes a paragraph. A paragraph is defined as “a group of sentences or a single sentence that forms a unit” (Lunsford and Connors 116). Length and appearance do not determine whether a section in a paper is a paragraph. For instance, in some styles of writing, particularly journalistic styles, a paragraph can be just one sentence long. Ultimately, a paragraph is a sentence or group of sentences that support one main idea. In this handout, we will refer to this as the “controlling idea,” because it controls what happens in the rest of the paragraph.Paragraphs are the building blocks of papers. Many students define paragraphs in terms of length: a paragraph is a group of at least five sentences, a paragraph is half a page long, etc. In reality, though, the unity and coherence of ideas among sentences is what constitutes a paragraph. A paragraph is defined as “a group of sentences or a single sentence that forms a unit” (Lunsford and Connors 116). Length and appearance do not determine whether a section in a paper is a paragraph. For instance, in some styles of writing, particularly journalistic styles, a paragraph can be just one sentence long. Ultimately, a paragraph is a sentence or group of sentences that support one main idea. In this handout, we will refer to this as the “controlling idea,” because it controls what happens in the rest of the paragraph.Paragraphs are the building blocks of papers. Many students define paragraphs in terms of length: a paragraph is a group of at least five sentences, a paragraph is half a page long, etc. In reality, though, the unity and coherence of ideas among sentences is what constitutes a paragraph. A paragraph is defined as “a group of sentences or a single sentence that forms a unit” (Lunsford and Connors 116). Length and appearance do not determine whether a section in a paper is a paragraph. For instance, in some styles of writing, particularly journalistic styles, a paragraph can be just one sentence long. Ultimately, a paragraph is a sentence or group of sentences that support one main idea. In this handout, we will refer to this as the “controlling idea,” because it controls what happens in the rest of the paragraph.',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  CarouselSlider carouselSliderImages(Size size,
      CarouselController carouselController, List<String> imagesSlider) {
    return CarouselSlider(
      options: CarouselOptions(
        height: size.height * 0.6,
        initialPage: 0,
        disableCenter: true,
        reverse: false,
        autoPlay: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        autoPlayInterval: const Duration(seconds: 4),
        autoPlayAnimationDuration: const Duration(seconds: 1),
        enableInfiniteScroll: true,
        viewportFraction: 1,
      ),
      carouselController: carouselController,
      items: imagesSlider.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Image.asset(
              i,
              fit: BoxFit.cover,
              width: double.infinity,
              height: size.height * 0.6,
            );
          },
        );
      }).toList(),
    );
  }

  InkWell containerSearch(Size size, BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        height: size.height * 0.06,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: AppMargin.m12),
        padding: const EdgeInsets.symmetric(horizontal: AppMargin.m12),
        decoration: BoxDecoration(
          color: ColorManager.darkGrey,
          borderRadius: BorderRadius.circular(AppSize.s20),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.search,
              color: ColorManager.primary,
              size: AppSize.s25,
            ),
            SizedBox(
              width: size.width * 0.02,
            ),
            Text(
              'Where are you going ?',
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: ColorManager.grey),
            ),
          ],
        ),
      ),
    );
  }
}
