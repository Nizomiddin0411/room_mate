
import '../models/get_region_model.dart';
import '../services/get_region_service.dart';

class RegionRepository{
  GetRegionService _getRegionService = GetRegionService();
  Future<List<GetRegionModel>?> getAll() async{
    return await _getRegionService.fetchRegion();}
}
