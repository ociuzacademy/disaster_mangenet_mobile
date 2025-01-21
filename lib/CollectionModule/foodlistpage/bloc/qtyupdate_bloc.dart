import 'package:bloc/bloc.dart';
import 'package:disaster_management/CollectionModule/foodlistpage/model/qtyupdate.dart';
import 'package:disaster_management/CollectionModule/foodlistpage/service/qtyupdate_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'qtyupdate_event.dart';
part 'qtyupdate_state.dart';
part 'qtyupdate_bloc.freezed.dart';

class QtyupdateBloc extends Bloc<QtyupdateEvent, QtyupdateState> {
  QtyupdateBloc() : super(_Initial()) {
    on<QtyupdateEvent>((event, emit) async {
      try {
        emit(const QtyupdateState.loading());
        if (event is _$QtyupdateImpl) {
          final response = await QtyupdateService(
            stockid: event.stockid,
            unit: event.unit,
          );

          emit(QtyupdateState.success(response: response));
        }
      } catch (e) {
        emit(QtyupdateState.error(error: e.toString()));
      }
    });
  }
}
