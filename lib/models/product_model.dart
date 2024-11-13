// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'product_model.freezed.dart';
// part 'product_model.g.dart';

// @freezed
// class ProductModel with _$ProductModel {
//   const factory ProductModel({
//     @Default('') String id, // Default to empty string
//     @Default('') String slug, // Default to empty string
//     @Default('') String name, // Default to empty string
//     @Default(0) int price, // Default to 0
//     @Default(0) int strikePrice, // Default to 0
//     @Default(1) int minOrder, // Default to 1
//     @Default(2) int maxOrder, // Default to 2
//     @Default(true) bool variantStatus, // Default to true
//     @Default('') String category, // Default to empty string
//     @Default('') String categoryName, // Default to empty string
//     @Default('') String categorySlug, // Default to empty string
//     @Default(false) bool status, // Default to false
//     required List<Variant> variants,
//     @Default('') String description, // Default to empty string
//     required List<Specification> specification,
//     required List<VariantDetail> variantDetails,
//     required List<Image> image,
//     required VendorDetail vendorDetail,
//     @Default(0) int viewCount, // Default to 0
//     @Default(false) bool isFavourite, // Default to false
//     @Default(false) bool commissionStatus, // Default to false
//     @Default('') String commissionType, // Default to empty string
//     @Default('0.00') String commissionAmount, // Default to '0.00'
//     @Default(0.0) double averageRating, // Default to 0.0
//     @Default(false) bool isApproved, // Default to false
//     @Default(false) bool isFeatured, // Default to false
//     @Default(false) bool isPublished, // Default to false
//   }) = _ProductModel;

//   factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
// }

// @freezed
// class Variant with _$Variant {
//   const factory Variant({
//     required Type type,
//     required List<Value> values,
//   }) = _Variant;

//   factory Variant.fromJson(Map<String, dynamic> json) => _$VariantFromJson(json);
// }

// @freezed
// class Type with _$Type {
//   const factory Type({
//     @Default('') String id, // Default to empty string
//     @Default('') String name, // Default to empty string
//   }) = _Type;

//   factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);
// }

// @freezed
// class Value with _$Value {
//   const factory Value({
//     @Default('') String id, // Default to empty string
//     @Default('') String value, // Default to empty string
//   }) = _Value;

//   factory Value.fromJson(Map<String, dynamic> json) => _$ValueFromJson(json);
// }

// @freezed
// class Specification with _$Specification {
//   const factory Specification({
//     @Default('') String type, // Default to empty string
//     @Default('') String value, // Default to empty string
//   }) = _Specification;

//   factory Specification.fromJson(Map<String, dynamic> json) => _$SpecificationFromJson(json);
// }

// @freezed
// class VariantDetail with _$VariantDetail {
//   const factory VariantDetail({
//     @Default('') String id, // Default to empty string
//     @Default(0) int price, // Default to 0
//     @Default(0) int strikePrice, // Default to 0
//     @Default(1) int minOrder, // Default to 1
//     @Default(2) int maxOrder, // Default to 2
//     @Default(true) bool status, // Default to true
//     @Default(0) int? stock, // Default nullable field; default value is set as needed.
//     @Default(0) int? initialStock,
//     required List<VariantInfo> variants,
//     required List<Image> image,
//   }) = _VariantDetail;

//   factory VariantDetail.fromJson(Map<String, dynamic> json) => _$VariantDetailFromJson(json);
// }

// @freezed
// class VariantInfo with _$VariantInfo {
//   const factory VariantInfo({
//     @Default('') String id,
//     @Default('') String typeId,
//     required Value valueData,
//   }) = _VariantInfo;

//   factory VariantInfo.fromJson(Map<String, dynamic> json) => _$VariantInfoFromJson(json);
// }

// @freezed
// class Image with _$Image {
//   const factory Image({
//     @Default('') String id,
//     String? title,
//     required String path,
//   }) = _Image;

//   factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
// }

// @freezed
// class VendorDetail with _$VendorDetail {
//   const factory VendorDetail({
//     @Default('') String id,
//     @Default('') String userId,
//     @Default('') String slug,
//     @Default(false) bool isAdmin,
//     @Default(false) bool isVendor,
//     @Default('') String companyName,
//     @Default('') String companyAddress,
//     @Default('') String companyPhone,
//     String? vatRegisterNo,
//     String? businessEmail,
//     DateTime? companyRegistrationDate,
//   }) = _VendorDetail;

//   factory VendorDetail.fromJson(Map<String, dynamic> json) => _$VendorDetailFromJson(json);
// }


import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    Data? data;

    Product({
        this.data,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
    };
}

class Data {
    String? id;
    String? slug;
    String? name;
    int? price;
    int? strikePrice;
    int? minOrder;
    int? maxOrder;
    bool? variantStatus;
    String? category;
    String? categoryName;
    String? categorySlug;
    bool? status;
    List<DataVariant>? variants;
    dynamic stock;
    dynamic initialStock;
    String? description;
    List<Specification>? specification;
    List<VariantDetail>? variantDetails;
    List<Image>? image;
    VendorDetail? vendorDetail;
    int? viewCount;
    bool? isFavourite;
    bool? commissionStatus;
    String? commissionType;
    String? commissionAmount;
    int? averageRating;
    bool? isApproved;
    bool? isFeatured;
    bool? isPublished;
    dynamic unapprovedMessage;

    Data({
        this.id,
        this.slug,
        this.name,
        this.price,
        this.strikePrice,
        this.minOrder,
        this.maxOrder,
        this.variantStatus,
        this.category,
        this.categoryName,
        this.categorySlug,
        this.status,
        this.variants,
        this.stock,
        this.initialStock,
        this.description,
        this.specification,
        this.variantDetails,
        this.image,
        this.vendorDetail,
        this.viewCount,
        this.isFavourite,
        this.commissionStatus,
        this.commissionType,
        this.commissionAmount,
        this.averageRating,
        this.isApproved,
        this.isFeatured,
        this.isPublished,
        this.unapprovedMessage,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        price: json["price"],
        strikePrice: json["strike_price"],
        minOrder: json["min_order"],
        maxOrder: json["max_order"],
        variantStatus: json["variant_status"],
        category: json["category"],
        categoryName: json["category_name"],
        categorySlug: json["category_slug"],
        status: json["status"],
        variants: json["variants"] == null ? [] : List<DataVariant>.from(json["variants"]!.map((x) => DataVariant.fromJson(x))),
        stock: json["stock"],
        initialStock: json["initial_stock"],
        description: json["description"],
        specification: json["specification"] == null ? [] : List<Specification>.from(json["specification"]!.map((x) => Specification.fromJson(x))),
        variantDetails: json["variant_details"] == null ? [] : List<VariantDetail>.from(json["variant_details"]!.map((x) => VariantDetail.fromJson(x))),
        image: json["image"] == null ? [] : List<Image>.from(json["image"]!.map((x) => Image.fromJson(x))),
        vendorDetail: json["vendor_detail"] == null ? null : VendorDetail.fromJson(json["vendor_detail"]),
        viewCount: json["view_count"],
        isFavourite: json["is_favourite"],
        commissionStatus: json["commission_status"],
        commissionType: json["commission_type"],
        commissionAmount: json["commission_amount"],
        averageRating: json["average_rating"],
        isApproved: json["is_approved"],
        isFeatured: json["is_featured"],
        isPublished: json["is_published"],
        unapprovedMessage: json["unapproved_message"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
        "price": price,
        "strike_price": strikePrice,
        "min_order": minOrder,
        "max_order": maxOrder,
        "variant_status": variantStatus,
        "category": category,
        "category_name": categoryName,
        "category_slug": categorySlug,
        "status": status,
        "variants": variants == null ? [] : List<dynamic>.from(variants!.map((x) => x.toJson())),
        "stock": stock,
        "initial_stock": initialStock,
        "description": description,
        "specification": specification == null ? [] : List<dynamic>.from(specification!.map((x) => x.toJson())),
        "variant_details": variantDetails == null ? [] : List<dynamic>.from(variantDetails!.map((x) => x.toJson())),
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x.toJson())),
        "vendor_detail": vendorDetail?.toJson(),
        "view_count": viewCount,
        "is_favourite": isFavourite,
        "commission_status": commissionStatus,
        "commission_type": commissionType,
        "commission_amount": commissionAmount,
        "average_rating": averageRating,
        "is_approved": isApproved,
        "is_featured": isFeatured,
        "is_published": isPublished,
        "unapproved_message": unapprovedMessage,
    };
}

class Image {
    String? id;
    dynamic title;
    String? path;

    Image({
        this.id,
        this.title,
        this.path,
    });

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        title: json["title"],
        path: json["path"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "path": path,
    };
}

class Specification {
    String? type;
    String? value;

    Specification({
        this.type,
        this.value,
    });

    factory Specification.fromJson(Map<String, dynamic> json) => Specification(
        type: json["type"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "value": value,
    };
}

class VariantDetail {
    String? id;
    int? price;
    int? strikePrice;
    int? minOrder;
    int? maxOrder;
    bool? status;
    int? stock;
    int? initialStock;
    List<VariantDetailVariant>? variants;
    List<Image>? image;

    VariantDetail({
        this.id,
        this.price,
        this.strikePrice,
        this.minOrder,
        this.maxOrder,
        this.status,
        this.stock,
        this.initialStock,
        this.variants,
        this.image,
    });

    factory VariantDetail.fromJson(Map<String, dynamic> json) => VariantDetail(
        id: json["id"],
        price: json["price"],
        strikePrice: json["strike_price"],
        minOrder: json["min_order"],
        maxOrder: json["max_order"],
        status: json["status"],
        stock: json["stock"],
        initialStock: json["initial_stock"],
        variants: json["variants"] == null ? [] : List<VariantDetailVariant>.from(json["variants"]!.map((x) => VariantDetailVariant.fromJson(x))),
        image: json["image"] == null ? [] : List<Image>.from(json["image"]!.map((x) => Image.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "strike_price": strikePrice,
        "min_order": minOrder,
        "max_order": maxOrder,
        "status": status,
        "stock": stock,
        "initial_stock": initialStock,
        "variants": variants == null ? [] : List<dynamic>.from(variants!.map((x) => x.toJson())),
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x.toJson())),
    };
}

class VariantDetailVariant {
    String? id;
    String? type;
    String? value;
    TypeData? typeData;
    Type? valueData;

    VariantDetailVariant({
        this.id,
        this.type,
        this.value,
        this.typeData,
        this.valueData,
    });

    factory VariantDetailVariant.fromJson(Map<String, dynamic> json) => VariantDetailVariant(
        id: json["id"],
        type: json["type"],
        value: json["value"],
        typeData: json["type_data"] == null ? null : TypeData.fromJson(json["type_data"]),
        valueData: json["value_data"] == null ? null : Type.fromJson(json["value_data"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "value": value,
        "type_data": typeData?.toJson(),
        "value_data": valueData?.toJson(),
    };
}

class TypeData {
    Name? name;

    TypeData({
        this.name,
    });

    factory TypeData.fromJson(Map<String, dynamic> json) => TypeData(
        name: nameValues.map[json["name"]]!,
    );

    Map<String, dynamic> toJson() => {
        "name": nameValues.reverse[name],
    };
}

enum Name {
    COLORS,
    RAM,
    ROM
}

final nameValues = EnumValues({
    "Colors": Name.COLORS,
    "RAM": Name.RAM,
    "ROM": Name.ROM
});

class Type {
    String? id;
    String? name;

    Type({
        this.id,
        this.name,
    });

    factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class DataVariant {
    Type? type;
    List<Value>? values;

    DataVariant({
        this.type,
        this.values,
    });

    factory DataVariant.fromJson(Map<String, dynamic> json) => DataVariant(
        type: json["type"] == null ? null : Type.fromJson(json["type"]),
        values: json["values"] == null ? [] : List<Value>.from(json["values"]!.map((x) => Value.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "type": type?.toJson(),
        "values": values == null ? [] : List<dynamic>.from(values!.map((x) => x.toJson())),
    };
}

class Value {
    String? id;
    String? value;

    Value({
        this.id,
        this.value,
    });

    factory Value.fromJson(Map<String, dynamic> json) => Value(
        id: json["id"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
    };
}

class VendorDetail {
    String? id;
    String? user;
    String? slug;
    String? isAdmin;
    String? isVendor;
    String? companyName;
    String? companyAddress;
    String? companyPhone;
    dynamic vatRegisterNo;
    String? businessEmail;
    DateTime? companyRegistrationDate;
    String? category;
    dynamic subCategory;
    String? description;
    dynamic otherDocument;

    VendorDetail({
        this.id,
        this.user,
        this.slug,
        this.isAdmin,
        this.isVendor,
        this.companyName,
        this.companyAddress,
        this.companyPhone,
        this.vatRegisterNo,
        this.businessEmail,
        this.companyRegistrationDate,
        this.category,
        this.subCategory,
        this.description,
        this.otherDocument,
    });

    factory VendorDetail.fromJson(Map<String, dynamic> json) => VendorDetail(
        id: json["id"],
        user: json["user"],
        slug: json["slug"],
        isAdmin: json["is_admin"],
        isVendor: json["is_vendor"],
        companyName: json["company_name"],
        companyAddress: json["company_address"],
        companyPhone: json["company_phone"],
        vatRegisterNo: json["vat_register_no"],
        businessEmail: json["business_email"],
        companyRegistrationDate: json["company_registration_date"] == null ? null : DateTime.parse(json["company_registration_date"]),
        category: json["category"],
        subCategory: json["sub_category"],
        description: json["description"],
        otherDocument: json["other_document"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "slug": slug,
        "is_admin": isAdmin,
        "is_vendor": isVendor,
        "company_name": companyName,
        "company_address": companyAddress,
        "company_phone": companyPhone,
        "vat_register_no": vatRegisterNo,
        "business_email": businessEmail,
        "company_registration_date": "${companyRegistrationDate!.year.toString().padLeft(4, '0')}-${companyRegistrationDate!.month.toString().padLeft(2, '0')}-${companyRegistrationDate!.day.toString().padLeft(2, '0')}",
        "category": category,
        "sub_category": subCategory,
        "description": description,
        "other_document": otherDocument,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
