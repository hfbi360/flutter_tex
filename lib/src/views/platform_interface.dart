import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:flutter_tex/src/models/tex_view_container.dart';
import 'package:flutter_tex/src/utils/tex_view_rendering_engine.dart';
import 'package:flutter_tex/src/views/mobile_tex_view.dart'
    if (dart.library.html) 'package:flutter_tex/src/views/web_tex_view.dart'
    as teXView;

///A Flutter Widget to render Mathematics / Maths, Physics and Chemistry, Statistics / Stats Equations based on LaTeX with full HTML and JavaScript support.
class TeXView extends StatelessWidget {
  final Key key;

  /// A list of TeXViewChild.
  @required
  final List<TeXViewContainer> children;

  /// Style TeXView Widget with [TeXViewStyle].
  final TeXViewStyle style;

  /// Render Engine to render TeX.
  @required
  final TeXViewRenderingEngine renderingEngine;

  /// Fixed Height for TeXView. (Avoid using fixed height for TeXView, let it to adopt the height by itself)
  final double height;

  /// Show a loading widget before rendering completes.
  final Widget loadingWidget;

  /// Show or hide loadingWidget.
  final bool showLoadingWidget;

  /// On Tap Callback when a TeXViewChild is tapped.
  final Function(String childID) onTap;

  /// Callback when TEX rendering finishes.
  final Function(double height) onRenderFinished;

  /// Callback when TeXView loading finishes.
  final Function(String message) onPageFinished;

  /// Keep widget Alive. (True by default).
  final bool keepAlive;

  TeXView(
      {this.key,
      this.children,
      this.style,
      this.height,
      this.loadingWidget,
      this.showLoadingWidget = false,
      this.onTap,
      this.keepAlive,
      this.onRenderFinished,
      this.onPageFinished,
      this.renderingEngine});

  @override
  Widget build(BuildContext context) {
    return teXView.TeXView(
        height: this.height,
        loadingWidget: this.loadingWidget,
        showLoadingWidget: this.showLoadingWidget,
        keepAlive: this.keepAlive,
        key: this.key,
        onTap: this.onTap,
        onPageFinished: this.onPageFinished,
        onRenderFinished: this.onRenderFinished,
        children: this.children,
        style: this.style,
        renderingEngine: this.renderingEngine);
  }
}
