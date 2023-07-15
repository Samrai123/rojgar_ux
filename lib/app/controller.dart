import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:rojgar/screens/home/data.dart';

class JobController extends GetxController {
  var _job = {}.obs;
  void addJob(Job job) {
    if (_job.containsKey(job)) {
      _job[job] += 1;
    } else {
      _job[job] = 1;
    }
  }

  get job => _job;
  void removeJob(Job job) {
    if (_job.containsKey(job) && _job[job] == 1) {
      _job.removeWhere((key, value) => key == job);
    } else {
      _job[job] -= 1;
    }
  }
}

class ApplyController extends GetxController {
  var _job = {}.obs;
  void addJob(Job job) {
    if (_job.containsKey(job)) {
      _job[job] += 1;
    } else {
      _job[job] = 1;
    }
  }

  get job => _job;
  void removeJob(Job job) {
    if (_job.containsKey(job) && _job[job] == 1) {
      _job.removeWhere((key, value) => key == job);
    } else {
      _job[job] -= 1;
    }
  }
}
