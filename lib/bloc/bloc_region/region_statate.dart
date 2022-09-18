import 'package:flutter/cupertino.dart';

import '../../models/get_region_model.dart';

abstract class RegionState{}

class RegionLoadedState extends RegionState{
  GetRegionModel? loadedRegion;
  RegionLoadedState({@required this.loadedRegion}):assert(loadedRegion != null);
}
class RegionEmptyState extends RegionState{

}

