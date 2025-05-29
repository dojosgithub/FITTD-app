import '../../data/model/apparel_response_model.dart';

class ApparelCategoryEntity {
  final String id;
  final String label;
  final int count;

  ApparelCategoryEntity({
    required this.id,
    required this.label,
    required this.count,
  });
}

extension ApparelEntityMapper on ApparelResponseModel {
  List<ApparelCategoryEntity> toEntities() {
    final data = this.data;
    if (data == null) return [];

    return [
      ApparelCategoryEntity(
          id: 'outerwear', label: 'Outerwear', count: data.outerwear ?? 0),
      ApparelCategoryEntity(
          id: 'denim', label: 'Denim', count: data.denim ?? 0),
      ApparelCategoryEntity(id: 'tops', label: 'Tops', count: data.tops ?? 0),
      ApparelCategoryEntity(
          id: 'bottoms', label: 'Bottoms', count: data.bottoms ?? 0),
      ApparelCategoryEntity(
          id: 'dresses', label: 'Dresses', count: data.dresses ?? 0),
      ApparelCategoryEntity(
          id: 'accessories',
          label: 'Accessories',
          count: data.accessories ?? 0),
      ApparelCategoryEntity(
          id: 'footwear', label: 'Footwear', count: data.footwear ?? 0),
    ];
  }
}
