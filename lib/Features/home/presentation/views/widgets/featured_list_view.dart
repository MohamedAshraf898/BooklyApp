import 'package:bookly_app/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'Custom_book_item.dart';

class FutureBoxListView extends StatelessWidget {
  const FutureBoxListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.225,
            child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Builder(builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.KBookDetails,
                            extra: state.books[index]);
                      },
                      child: CustomBookImage(
                        image_url:
                            state.books[index].volumeInfo.imageLinks.thumbnail,
                      ),
                    );
                  }),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errorM: state.errorM);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
