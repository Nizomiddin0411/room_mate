

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talaba_uy/bloc/bloc_region/region_event.dart';
import 'package:talaba_uy/bloc/bloc_region/region_statate.dart';
import 'package:talaba_uy/chat/model.dart';
import 'package:talaba_uy/repository/region_repository.dart';

import '../../models/get_region_model.dart';

class RegionBloc extends Bloc<RegionEvent,RegionState>{
  final RegionRepository? regionRepository;

  RegionBloc( this.regionRepository):assert (regionRepository != null), super(RegionEmptyState());
  @override
 RegionState get intialState => RegionEmptyState();

  @override
  Stream<RegionState> mapEventToState(RegionEvent event) async*{
    if(event is RegionLoadEvent){
      try{
        final GetRegionModel?  _loadedRegionList = (await regionRepository?.getAll()) as GetRegionModel?;
        yield RegionLoadedState(loadedRegion: _loadedRegionList);
      }catch(e){
        yield RegionEmptyState();
      }
    }else if(event is RegionClearEvent){
      yield   RegionEmptyState();
    }
  }

}