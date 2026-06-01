// lib/presentation/marketplace/providers/marketplace_providers.dart

import 'package:cloud_firestore/cloud_firestore.dart' hide Order;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/database_provider.dart';
import '../../../data/marketplace/cart_repository_impl.dart';
import '../../../data/marketplace/order_repository_impl.dart';
import '../../../data/marketplace/product_repository_impl.dart';
import '../../../domain/marketplace/entities/order.dart';
import '../../../domain/marketplace/entities/product.dart';
import '../../../domain/marketplace/entities/cart_item.dart';
import '../../../domain/marketplace/repositories/cart_repository.dart';
import '../../../domain/marketplace/repositories/order_repository.dart';
import '../../../domain/marketplace/repositories/product_repository.dart';
import '../../../domain/marketplace/usecases/add_to_cart_usecase.dart';
import '../../../domain/marketplace/usecases/cancel_order_usecase.dart';
import '../../../domain/marketplace/usecases/clear_cart_usecase.dart';
import '../../../domain/marketplace/usecases/get_catalog_usecase.dart';
import '../../../domain/marketplace/usecases/get_order_history_usecase.dart';
import '../../../domain/marketplace/usecases/place_order_usecase.dart';
import '../../../domain/marketplace/usecases/remove_from_cart_usecase.dart';
import '../../../domain/marketplace/usecases/search_products_usecase.dart';
import '../../../domain/marketplace/usecases/update_cart_item_usecase.dart';
import '../../auth/providers/auth_providers.dart';

// ─── REPOSITORIES ───

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepositoryImpl(
    ref.watch(productsDaoProvider),
    FirebaseFirestore.instance,
  );
});

final cartRepositoryProvider = Provider<CartRepository>((ref) {
  return CartRepositoryImpl(
    ref.watch(ordersDaoProvider),
    ref.watch(productsDaoProvider),
  );
});

final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  return OrderRepositoryImpl(
    ref.watch(ordersDaoProvider),
    ref.watch(productsDaoProvider),
  );
});

// ─── USE CASES ───

final getCatalogUseCaseProvider = Provider<GetCatalogUseCase>((ref) {
  return GetCatalogUseCase(ref.watch(productRepositoryProvider));
});

final searchProductsUseCaseProvider = Provider<SearchProductsUseCase>((ref) {
  return SearchProductsUseCase(ref.watch(productRepositoryProvider));
});

final addToCartUseCaseProvider = Provider<AddToCartUseCase>((ref) {
  return AddToCartUseCase(ref.watch(cartRepositoryProvider));
});

final removeFromCartUseCaseProvider = Provider<RemoveFromCartUseCase>((ref) {
  return RemoveFromCartUseCase(ref.watch(cartRepositoryProvider));
});

final updateCartItemUseCaseProvider = Provider<UpdateCartItemUseCase>((ref) {
  return UpdateCartItemUseCase(ref.watch(cartRepositoryProvider));
});

final clearCartUseCaseProvider = Provider<ClearCartUseCase>((ref) {
  return ClearCartUseCase(ref.watch(cartRepositoryProvider));
});

final placeOrderUseCaseProvider = Provider<PlaceOrderUseCase>((ref) {
  return PlaceOrderUseCase(ref.watch(orderRepositoryProvider));
});

final cancelOrderUseCaseProvider = Provider<CancelOrderUseCase>((ref) {
  return CancelOrderUseCase(ref.watch(orderRepositoryProvider));
});

final getOrderHistoryUseCaseProvider = Provider<GetOrderHistoryUseCase>((ref) {
  return GetOrderHistoryUseCase(ref.watch(orderRepositoryProvider));
});

// ─── STREAMS / STATE ───

class SelectedCategoryNotifier extends Notifier<ProductCategory?> {
  @override
  ProductCategory? build() => null;
  void select(ProductCategory? category) => state = category;
}

final selectedCategoryProvider = NotifierProvider<SelectedCategoryNotifier, ProductCategory?>(SelectedCategoryNotifier.new);

final activeCatalogProvider = StreamProvider<List<Product>>((ref) {
  final category = ref.watch(selectedCategoryProvider);
  return ref.watch(getCatalogUseCaseProvider).execute(category: category);
});

final activeCartProvider = StreamProvider<Order?>((ref) {
  final user = ref.watch(authStateProvider).value;
  if (user == null) return Stream.value(null);
  return ref.watch(cartRepositoryProvider).watchCart(user.id);
});

final cartItemsProvider = StreamProvider<List<CartItem>>((ref) {
  final user = ref.watch(authStateProvider).value;
  if (user == null) return Stream.value([]);
  return ref.watch(cartRepositoryProvider).watchCartItems(user.id);
});

final cartTotalsProvider = StreamProvider<CartTotals>((ref) {
  final user = ref.watch(authStateProvider).value;
  if (user == null) return Stream.value(CartTotals.empty);
  return ref.watch(cartRepositoryProvider).watchTotals(user.id);
});

final orderHistoryProvider = StreamProvider<List<Order>>((ref) {
  final user = ref.watch(authStateProvider).value;
  if (user == null) return Stream.value([]);
  return ref.watch(getOrderHistoryUseCaseProvider).execute(user.id);
});
