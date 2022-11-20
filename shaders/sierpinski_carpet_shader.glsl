#define max_gen 20.

uniform float iterations;
uniform vec4 carpetColor;
uniform vec4 backgroundColor;

// From: https://github.com/pedrotrschneider/shader-fractals/blob/main/2D/SierpinskiCarpet.glsl
// this function returns a positive value for points that are still on the
// carpet and zero for points that are removed from the carpet.
float sierpinskiCarpet (vec2 uv) {
  // doc is assuming uv is in the range 0,1 and paints bottom right part of the carpet.
  // actually it is in the range -1,1 and paints the entire carpet, but it is easy to
  // understand with the above assumption.

  // 3x once
  float scale = 3.0;
  uv *= 3.0;
  uv = abs (uv);

  for (float i = 0.; i < max_gen; ++i) {
    // 3x again
    scale *= 3.0;
    uv *= 3.0;
    uv = abs (uv);

    // considering 9 sections, removes the top left square by collapsing all
    // the points inside it to the top left point i.e., (0,0) now represents
    // the top left square while the rest of the square remains the same.
    uv *= 1.0 - step (uv.x, 3.0) * step (uv.y, 3.0);

    // in case of top left square (i.e., (0,0)), moving and `abs`ing twice
    // brings it back to (0,0).
    //
    // in case of the rest, moving and `abs`ing each time is like moving
    // the canvas up by 1/3rd and folding the top 1/3rd. by the end, there'll
    // be 1/3rd (by height) of the canvas left.
    uv -= vec2 (0, 3);
    uv = abs (uv);
    uv -= vec2 (0, 3);
    uv = abs (uv);

    // same as above, but for the left 1/3rd. by the end, there'll be 1/3rd
    // (by width and height) of the canvas left, overlapping the original
    // top left square that was removed.
    uv -= vec2 (3, 0);
    uv = abs (uv);
    uv -= vec2 (3, 0);
    uv = abs (uv);

    // this is a workaround to break the loop at the desired gen as glsl does
    // not support non-constant loop bounds.
    if (i >= iterations) break;
  }

  // by this time, for the number of generation, after scaling, moving and
  // `abs`ing multiple times, all the parts of the carpet that are to be
  // removed are in the top left (1,1) square. so, we just need to remove
  // that and we're done.
  //
  // this returns a zero if the point is inside vec2(1) i.e., the top left
  // (1,1) square, and a positive value otherwise.
  float d = length (uv - vec2 (min (uv, vec2 (1)))) / scale;
  // uv /= scale;
  return d;
}

vec4 fragment (vec2 uv, vec2 fragCoord) {
  // scales uv from (0,1) to (-1,1) [both x and y as this assumes the canvas
  // is a square].
  vec2 uv2 = 2. * (uv - .5 * vec2(1));

  float d = sierpinskiCarpet (uv2);

  if (d > 0.) {
    return carpetColor;
  }
  return backgroundColor;
}