import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
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
              Align(
                alignment: AlignmentDirectional(0.66, 0.79),
                child: FlutterFlowIconButton(
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: () {
                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                      return 30.0;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointMedium) {
                      return 35.0;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointLarge) {
                      return 40.0;
                    } else {
                      return 40.0;
                    }
                  }(),
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  icon: Icon(
                    FFIcons.kcamera,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: () {
                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                        return 16.0;
                      } else if (MediaQuery.sizeOf(context).width <
                          kBreakpointMedium) {
                        return 18.0;
                      } else if (MediaQuery.sizeOf(context).width <
                          kBreakpointLarge) {
                        return 24.0;
                      } else {
                        return 24.0;
                      }
                    }(),
                  ),
                  onPressed: () async {
                    logFirebaseEvent('PROFILE_COMPONENT_camera_ICN_ON_TAP');
                    logFirebaseEvent('IconButton_store_media_for_upload');
                    final selectedMedia = await selectMedia(
                      mediaSource: MediaSource.photoGallery,
                      multiImage: false,
                    );
                    if (selectedMedia != null &&
                        selectedMedia.every((m) =>
                            validateFileFormat(m.storagePath, context))) {
                      safeSetState(() => _model.isDataUploading = true);
                      var selectedUploadedFiles = <FFUploadedFile>[];

                      try {
                        showUploadMessage(
                          context,
                          'Uploading file...',
                          showLoading: true,
                        );
                        selectedUploadedFiles = selectedMedia
                            .map((m) => FFUploadedFile(
                                  name: m.storagePath.split('/').last,
                                  bytes: m.bytes,
                                  height: m.dimensions?.height,
                                  width: m.dimensions?.width,
                                  blurHash: m.blurHash,
                                ))
                            .toList();
                      } finally {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        _model.isDataUploading = false;
                      }
                      if (selectedUploadedFiles.length ==
                          selectedMedia.length) {
                        safeSetState(() {
                          _model.uploadedLocalFile =
                              selectedUploadedFiles.first;
                        });
                        showUploadMessage(context, 'Success!');
                      } else {
                        safeSetState(() {});
                        showUploadMessage(context, 'Failed to upload data');
                        return;
                      }
                    }

                    logFirebaseEvent('IconButton_custom_action');
                    _model.base4String = await actions.encodeImageToBase64(
                      _model.uploadedLocalFile,
                    );
                    logFirebaseEvent('IconButton_update_app_state');
                    FFAppState().debugString = _model.base4String!;
                    safeSetState(() {});
                    logFirebaseEvent('IconButton_backend_call');
                    _model.imageUrl = await UsersGroup.uoploadImageCall.call(
                      image: _model.base4String,
                    );

                    if ((_model.imageUrl?.succeeded ?? true)) {
                      logFirebaseEvent('IconButton_backend_call');
                      _model.apiResulto9p =
                          await UsersGroup.updateUserImageCall.call(
                        userId: FFAppState().userProfileData.uid,
                        imageUrl: UsersGroup.uoploadImageCall.imageUrl(
                          (_model.imageUrl?.jsonBody ?? ''),
                        ),
                      );

                      if ((_model.apiResulto9p?.succeeded ?? true)) {
                        logFirebaseEvent('IconButton_update_app_state');
                        FFAppState().userProfileData = UserProfileDataStruct(
                          photoUrl: UsersGroup.uoploadImageCall.imageUrl(
                            (_model.imageUrl?.jsonBody ?? ''),
                          ),
                        );
                        safeSetState(() {});
                      }
                    }

                    safeSetState(() {});
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
