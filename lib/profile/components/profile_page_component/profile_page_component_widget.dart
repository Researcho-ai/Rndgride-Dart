import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'profile_page_component_model.dart';
export 'profile_page_component_model.dart';

class ProfilePageComponentWidget extends StatefulWidget {
  const ProfilePageComponentWidget({
    super.key,
    this.userImage,
  });

  final String? userImage;

  @override
  State<ProfilePageComponentWidget> createState() =>
      _ProfilePageComponentWidgetState();
}

class _ProfilePageComponentWidgetState
    extends State<ProfilePageComponentWidget> {
  late ProfilePageComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfilePageComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(1.0, 1.0),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Align(
          alignment: AlignmentDirectional(1.0, 0.0),
          child: Stack(
            alignment: AlignmentDirectional(0.9, 0.9),
            children: [
              if (widget.userImage == null || widget.userImage == '')
                Container(
                  width: () {
                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                      return 90.0;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointMedium) {
                      return 105.0;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointLarge) {
                      return 120.0;
                    } else {
                      return 120.0;
                    }
                  }(),
                  height: () {
                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                      return 90.0;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointMedium) {
                      return 105.0;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointLarge) {
                      return 120.0;
                    } else {
                      return 120.0;
                    }
                  }(),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    FFIcons.kprofile,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: () {
                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                        return 60.0;
                      } else if (MediaQuery.sizeOf(context).width <
                          kBreakpointMedium) {
                        return 70.0;
                      } else if (MediaQuery.sizeOf(context).width <
                          kBreakpointLarge) {
                        return 90.0;
                      } else {
                        return 90.0;
                      }
                    }(),
                  ),
                ),
              if (widget.userImage != null && widget.userImage != '')
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('PROFILE_COMPONENT_UserImage_ON_TAP');
                    logFirebaseEvent('UserImage_expand_image');
                    await Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: FlutterFlowExpandedImageView(
                          image: CachedNetworkImage(
                            fadeInDuration: Duration(milliseconds: 500),
                            fadeOutDuration: Duration(milliseconds: 500),
                            imageUrl: valueOrDefault<String>(
                              widget.userImage,
                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/codots-blj7r8/assets/xajpc72imnio/profile.svg',
                            ),
                            fit: BoxFit.contain,
                          ),
                          allowRotation: false,
                          tag: valueOrDefault<String>(
                            widget.userImage,
                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/codots-blj7r8/assets/xajpc72imnio/profile.svg',
                          ),
                          useHeroAnimation: true,
                        ),
                      ),
                    );
                  },
                  child: Hero(
                    tag: valueOrDefault<String>(
                      widget.userImage,
                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/codots-blj7r8/assets/xajpc72imnio/profile.svg',
                    ),
                    transitionOnUserGestures: true,
                    child: Container(
                      width: () {
                        if (MediaQuery.sizeOf(context).width <
                            kBreakpointSmall) {
                          return 90.0;
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointMedium) {
                          return 105.0;
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointLarge) {
                          return 120.0;
                        } else {
                          return 120.0;
                        }
                      }(),
                      height: () {
                        if (MediaQuery.sizeOf(context).width <
                            kBreakpointSmall) {
                          return 90.0;
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointMedium) {
                          return 105.0;
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointLarge) {
                          return 120.0;
                        } else {
                          return 120.0;
                        }
                      }(),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: CachedNetworkImage(
                        fadeInDuration: Duration(milliseconds: 500),
                        fadeOutDuration: Duration(milliseconds: 500),
                        imageUrl: valueOrDefault<String>(
                          widget.userImage,
                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/codots-blj7r8/assets/xajpc72imnio/profile.svg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              if (valueOrDefault<bool>(
                    FFAppState().userProfileData.photoUrl == '',
                    true,
                  ) &&
                  responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                    tabletLandscape: false,
                    desktop: false,
                  ))
                Container(
                  width: () {
                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                      return 90.0;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointMedium) {
                      return 105.0;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointLarge) {
                      return 120.0;
                    } else {
                      return 120.0;
                    }
                  }(),
                  height: () {
                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                      return 90.0;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointMedium) {
                      return 105.0;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointLarge) {
                      return 120.0;
                    } else {
                      return 120.0;
                    }
                  }(),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: CachedNetworkImage(
                    fadeInDuration: Duration(milliseconds: 500),
                    fadeOutDuration: Duration(milliseconds: 500),
                    imageUrl: '',
                    fit: BoxFit.cover,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
