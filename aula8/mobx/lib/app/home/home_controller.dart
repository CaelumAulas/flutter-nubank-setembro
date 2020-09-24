import 'package:mobx/mobx.dart';
import './repositories/home_repository_impl.dart';
import '../../shared/models/product.dart';
import './home_state.dart';
import './home_event.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final repository = HomeRepositoryImpl();

  @observable
  HomeState state = None();

  @observable
  ObservableFuture products;
  _HomeControllerBase() {
    products = repository.getProducts().asObservable();
  }

  @action
  Future<void> getProducts() async {
    state = Loading();
    try {
      final response = await repository.getProducts();
      state = Success(products: response);
      return;
    } catch (e) {
      state = Error(message: "Nao foi possivel buscar os produtos");
    }
  }

  void _mapToEvent(HomeEvent event) {
    if (event is GetProducts) {
      getProducts();
    }
  }

  void update(HomeEvent event) {
    _mapToEvent(event);
  }
}
