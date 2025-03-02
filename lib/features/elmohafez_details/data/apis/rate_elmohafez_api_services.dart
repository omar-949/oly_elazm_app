import 'package:oly_elazm/core/networking/network/network_call.dart';
import 'package:oly_elazm/core/networking/network/result.dart';
import 'package:oly_elazm/features/elmohafez_details/data/apis/rate_elmohafez_api_constants.dart';

import '../repo/rate_elmohafez_repo.dart';



class RateElMohafezApiServices implements RateElMohafezRepo {
  /// fetch all students
  @override
  Future<Result<T>> addRate<T>({required int teacherId,required double rating,required String comment}) async {
    return await networkCall(
      method: ServerMethods.POST,
      data: {
        "teacher_id": teacherId,
        "rating": rating,
        "comment": comment
      },
      path: RateElMohafezApiConstants.addRate,
      fromJson: (p0) => p0 as T,
    );
  }

}
