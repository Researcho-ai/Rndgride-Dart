import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'sophisticated_image_model.dart';
export 'sophisticated_image_model.dart';

class SophisticatedImageWidget extends StatefulWidget {
  const SophisticatedImageWidget({
    super.key,
    this.nmr,
    this.tem,
    this.afm,
    this.ramanSpectoscop,
    this.sem,
    this.xrd,
    this.xrf,
    this.ipcOsc,
    this.dsc,
    this.tga,
    this.dls,
    this.instrumentName,
  });

  final Widget? nmr;
  final Widget? tem;
  final Widget? afm;
  final Widget? ramanSpectoscop;
  final Widget? sem;
  final Widget? xrd;
  final Widget? xrf;
  final Widget? ipcOsc;
  final Widget? dsc;
  final Widget? tga;
  final Widget? dls;
  final String? instrumentName;

  @override
  State<SophisticatedImageWidget> createState() =>
      _SophisticatedImageWidgetState();
}

class _SophisticatedImageWidgetState extends State<SophisticatedImageWidget> {
  late SophisticatedImageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SophisticatedImageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          'https://picsum.photos/seed/90/600',
          width: 300.0,
          height: 200.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
