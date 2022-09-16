import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:talaba_uy/models/search_universitety_model.dart';
import 'package:talaba_uy/services/get_search%20universitety.dart';

class SearchUniversitet  extends ChangeNotifier{
  List<SearchUniversitetyModel> searchuniversitet =[];

  Future<void> getSearchUniver() async{
    searchuniversitet = (await GetSearchUniverService().fetchUniverSearch());
  }
}