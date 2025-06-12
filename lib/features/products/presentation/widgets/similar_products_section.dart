import 'package:fitted/features/products/presentation/bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/widgets/product_card.dart';
import '../../domain/entities/product_detail_entity.dart';

class SimilarProductsSection extends StatelessWidget {
  const SimilarProductsSection({
    super.key,
    required this.similarProducts,
  });

  final List<SimilarProductEntity> similarProducts;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: similarProducts.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.h,
        crossAxisSpacing: 12.w,
        childAspectRatio: 162.w / 270.h,
      ),
      itemBuilder: (context, index) {
        return ProductCard(
          name: similarProducts[index].name,
          image: similarProducts[index].primaryImage,
          id: similarProducts[index].id,
          price: similarProducts[index].price,
          isLiked: similarProducts[index].isWishlist,
          onTap: () => context.read<ProductsBloc>().add(
                WishList(
                  productId: similarProducts[index].id,
                  isAdded: similarProducts[index].isWishlist,
                ),
              ),
        );
      },
    );
  }
}
