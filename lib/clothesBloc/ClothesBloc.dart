import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clothes/main.dart';
import 'package:clothes/models/ClothesInfo.dart';
part 'ClothesEvent.dart';
part 'ClothesState.dart';

class ClothesBloc extends Bloc<ClothesEvent, ClothesState> {
  List<ClothesInfo> _data = <ClothesInfo>[];
  List<ClothesInfo> filteredData = <ClothesInfo>[];



  ClothesBloc() :super(ClothesInitialState()) {
    on<ClothesGetEvent>(_onGet);
    on<ClothesFilterEvent>(_onFilter);
    on<ClothesSelectionEvent>(_onSelection);
  }

  void _onGet (ClothesGetEvent event, Emitter<ClothesState> emit) async {
    emit(ClothesLoadingState());
    _data = await db!.parseClotheToClothesInfo(db!.allClotheEntries);
    if (event.category != null) {
      _data = _data.where((cl) => cl.category == event.category).toList();
    }
    //print(_data);
    filteredData = _data;
    emit(ClothesLoadedState());
  }

  void _onFilter(ClothesFilterEvent event, Emitter<ClothesState> emit) {
    emit(ClothesLoadingState());
    filteredData = _data.where((e) => e.name.contains(event.query)).toList();
    //print(filteredData);

    emit(ClothesLoadedState());
  }



  void _onSelection(ClothesSelectionEvent event, Emitter<ClothesState> emit) async {
    emit(ClothesLoadingState());
    /// event.t - температура
    _data.clear();
    /// TO DO algorithm
    if (event.t <= 7){
      ///Выбор шапки
        var hat = await db!.parseClotheToClothesInfo(db!.getType("Шапки"));
        if(hat.isNotEmpty){
          _data.add(hat[0]);
        }
      ///Выбор верхней одежды
        var puh = await db!.parseClotheToClothesInfo(db!.getType("Пуховики"));
        if(puh.isNotEmpty){
          _data.add(puh[0]);
        }
        else{
          var jac = await db!.parseClotheToClothesInfo(db!.getType("Жилеты"));
          if(jac.isNotEmpty){
            _data.add(jac[0]);
          }
        }

        ///Выбор обуви
        var bot = await db!.parseClotheToClothesInfo(db!.getType("Ботинки"));
        if(bot.isNotEmpty){
          _data.add(bot[0]);
        }
        else{
          var sap = await db!.parseClotheToClothesInfo(db!.getType("Сапоги"));
          if(sap.isNotEmpty){
            _data.add(sap[0]);
          }
        }

        ///Выбор "НЕ" штанов
        var jea = await db!.parseClotheToClothesInfo(db!.getType("Джинсы"));
        if(jea.isNotEmpty){
          _data.add(jea[0]);
        }
        else{
          var tro = await db!.parseClotheToClothesInfo(db!.getType("Брюки"));
          if(tro.isNotEmpty){
            _data.add(tro[0]);
          }
        }

        ///Выбор футболки
        var tsh = await db!.parseClotheToClothesInfo(db!.getType("Футболки и поло"));
        if(tsh.isNotEmpty){
          _data.add(tsh[0]);
        }

        ///Выбор кофты
        var hoo = await db!.parseClotheToClothesInfo(db!.getType("Худи и свитшоты"));
        if(hoo.isNotEmpty){
          _data.add(hoo[0]);
        }
        else{
          var kof = await db!.parseClotheToClothesInfo(db!.getType("Кофты"));
          if(kof.isNotEmpty){
            _data.add(kof[0]);
          }
          else{
            var jem = await db!.parseClotheToClothesInfo(db!.getType("Джемперы и свитеры"));
            if(jem.isNotEmpty){
              _data.add(jem[0]);
            }
          }
        }

    }
    else if (event.t<=20){
      ///Выбор куртки
      var jac = await db!.parseClotheToClothesInfo(db!.getType("Куртки"));
      if(jac.isNotEmpty){
        _data.add(jac[0]);
      }
      else{
        var coa = await db!.parseClotheToClothesInfo(db!.getType("Пальто"));
        if(coa.isNotEmpty){
          _data.add(coa[0]);
        }
        else{
          var rai = await db!.parseClotheToClothesInfo(db!.getType("Плащи"));
          if(rai.isNotEmpty){
            _data.add(rai[0]);
          }
        }
      }

      ///Выбор обуви
      var sne = await db!.parseClotheToClothesInfo(db!.getType("Кроссовки"));
      if(sne.isNotEmpty){
        _data.add(sne[0]);
      }
      else{
        var sho = await db!.parseClotheToClothesInfo(db!.getType("Туфли"));
        if(sho.isNotEmpty){
          _data.add(sho[0]);
        }
      }

      ///Выбор штанов
      var jea = await db!.parseClotheToClothesInfo(db!.getType("Джинсы"));
      if(jea.isNotEmpty){
          _data.add(jea[0]);
      }
      else{
        var tro = await db!.parseClotheToClothesInfo(db!.getType("Брюки"));
        if(tro.isNotEmpty){
        _data.add(tro[0]);
        }
        else{
          var tig = await db!.parseClotheToClothesInfo(db!.getType("Трико"));
          if(tig.isNotEmpty){
            _data.add(tig[0]);
          }
        }
      }
      ///Выбор майки
      var tsh = await db!.parseClotheToClothesInfo(db!.getType("Футболки и поло"));
      if(tsh.isNotEmpty){
        _data.add(tsh[0]);
      }
      else{
        var und = await db!.parseClotheToClothesInfo(db!.getType("Майки и топы"));
        if(und.isNotEmpty){
          _data.add(und[0]);
        }
      }

      ///Выбор кофты
      var hoo = await db!.parseClotheToClothesInfo(db!.getType("Худи и свитшоты"));
      if(hoo.isNotEmpty){
        _data.add(hoo[0]);
      }
      else{
        var kof = await db!.parseClotheToClothesInfo(db!.getType("Кофты"));
        if(kof.isNotEmpty){
          _data.add(kof[0]);
        }
        else{
          var jem = await db!.parseClotheToClothesInfo(db!.getType("Джемперы и свитеры"));
          if(jem.isNotEmpty){
            _data.add(jem[0]);
          }
        }
      }
    }
    else if (event.t<=25){
      ///Выбор обуви
      var sne = await db!.parseClotheToClothesInfo(db!.getType("Кроссовки"));
      if(sne.isNotEmpty){
        _data.add(sne[0]);
      }
      else{
        var sho = await db!.parseClotheToClothesInfo(db!.getType("Туфли"));
        if(sho.isNotEmpty){
          _data.add(sho[0]);
        }
      }

      ///Выбор штанов
      var jea = await db!.parseClotheToClothesInfo(db!.getType("Джинсы"));
      if(jea.isNotEmpty){
        _data.add(jea[0]);
      }
      else{
        var tro = await db!.parseClotheToClothesInfo(db!.getType("Брюки"));
        if(tro.isNotEmpty){
          _data.add(tro[0]);
        }
        else{
          var tig = await db!.parseClotheToClothesInfo(db!.getType("Трико"));
          if(tig.isNotEmpty){
            _data.add(tig[0]);
          }
        }
      }
      ///Выбор майки
      var tsh = await db!.parseClotheToClothesInfo(db!.getType("Футболки и поло"));
      if(tsh.isNotEmpty){
        _data.add(tsh[0]);
      }
      else{
        var und = await db!.parseClotheToClothesInfo(db!.getType("Майки и топы"));
        if(und.isNotEmpty){
          _data.add(und[0]);
        }
      }

      ///Выбор кофты
      var hoo = await db!.parseClotheToClothesInfo(db!.getType("Худи и свитшоты"));
      if(hoo.isNotEmpty){
        _data.add(hoo[0]);
      }
      else{
        var kof = await db!.parseClotheToClothesInfo(db!.getType("Кофты"));
        if(kof.isNotEmpty){
          _data.add(kof[0]);
        }
        else{
          var jem = await db!.parseClotheToClothesInfo(db!.getType("Джемперы и свитеры"));
          if(jem.isNotEmpty){
            _data.add(jem[0]);
          }
        }
      }
    }
    //запрос к бд: await db!.parseClotheToClothesInfo(db!.getType("НЕ ШТАНЫ"));
    //возвращает лист ClothesInfo

    filteredData = _data;
    emit(ClothesLoadedState());
  }
}