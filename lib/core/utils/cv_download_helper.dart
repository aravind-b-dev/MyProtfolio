import 'cv_download_stub.dart'
    if (dart.library.html) 'cv_download_web.dart';

class CvDownloadHelper {
  static const String cvAssetPath = 'assets/utils/AravindB_FlutterDeveloper_CV.pdf';
  static const String cvFileName = 'AravindB_FlutterDeveloper_CV.pdf';

  static void downloadCV() {
    downloadCvPdf(cvAssetPath, cvFileName);
  }
}
