import 'package:bloc/bloc.dart';
import 'package:disaster_management/volunteerCollectionCentre_register/model/volunteerCollectionCenter_model.dart';
import 'package:disaster_management/volunteerCollectionCentre_register/service/volunteer_collectionReg_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'collection_center_event.dart';
part 'collection_center_state.dart';
part 'collection_center_bloc.freezed.dart';

class CollectionCenterBloc
    extends Bloc<CollectionCenterEvent, CollectionCenterState> {
  CollectionCenterBloc() : super(_Initial()) {
    on<CollectionCenterEvent>((event, emit) async {
      try {
        emit(const CollectionCenterState.loding());
        if (event is _$CollectionRegImpl) {
          final response = await collectionRegService(
            email: event.email,
            password: event.password,
            choose_collection_center: event.choose_collection_center,
            name: event.name,
            address: event.address,
            aadhaar: event.aadhaar,
            district: event.district,
            phone_number: event.phone_number,
          );

          emit(CollectionCenterState.success(response: response));
        }
      } catch (e) {
        emit(CollectionCenterState.error(error: e.toString()));
      }
    });
  }
}
