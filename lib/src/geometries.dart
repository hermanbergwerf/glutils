// Copyright (c) 2016, Herman Bergwerf. All rights reserved.
// Use of this source code is governed by a MIT-style license
// that can be found in the LICENSE file.

part of glutils;

/// Base for drawing geometries
class GlGeometry {
  /// Wireframe and polygon mesh objects.
  final GlObject wireframe, surface;

  GlGeometry(this.wireframe, this.surface);

  /// Get geometry transformation.
  Matrix4 get transform => wireframe.transform;

  /// Set the transformation of [wireframe] and [surface] at once.
  set transform(Matrix4 matrix) {
    wireframe.transform = matrix;
    surface.transform = matrix;
  }

  /// Draw the shape.
  void draw({bool drawWireframe: true, bool drawSurface: true}) {
    if (drawWireframe) {
      wireframe.drawElements(gl.WebGL.LINES);
    }
    if (drawSurface) {
      surface.drawElements(gl.WebGL.TRIANGLES);
    }
  }
}
