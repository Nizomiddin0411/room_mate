import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:talaba_uy/models/get_faculty_model.dart';
import 'package:talaba_uy/models/search_universitety_model.dart';
import 'package:talaba_uy/services/get_faculty_service.dart';
import 'package:talaba_uy/services/get_search%20universitety.dart';

class SearchUniversitet  extends ChangeNotifier{
  List<SearchUniversitetyModel> searchuniversitet =[];

  List<GetFacultyModel> searchfakultet = [];
bool ischanging=false;

void setChange(bool value){
  ischanging = value;
  notifyListeners();
}
  Future<void>
  getSearchUniver(String query) async{
  setChange(false);
    searchuniversitet = (await GetSearchUniverService().fetchUniverSearch(query));
    setChange(true);
  }
  Future<void> getFakultet(int id) async{
    searchfakultet = await GetFacultyService().fetchFaculty(id);

  }
}
