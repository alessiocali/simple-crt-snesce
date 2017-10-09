#pragma parameter scanLineScale "Scan Line Scale" 2.0 0.5 8.0 0.5
#pragma parameter blendExponent "Blend Exponent" 0.2 0.1 1.0 0.1

#ifndef PARAMETER_UNIFORM
#define scanLineScale 2.0
#define blendExponent 0.2
#endif

precision highp float;

#if defined(FRAGMENT)

varying vec2 vTexCoord;
varying vec2 vScanline;

uniform sampler2D Texture;
#ifdef PARAMETER_UNIFORM
uniform float scanLineScale;
uniform float blendExponent;
#endif

#define hScale 224.0

vec4 powv(vec4 base, float ex) 
{
	return vec4(pow(base.x, ex), pow(base.y, ex), pow(base.z, ex), pow(base.w, ex));
}

void main()
{
    vec4 col = texture2D(Texture, vTexCoord);
	vec2 tScanline = vScanline;
	tScanline.y = mod(tScanline.y * hScale * scanLineScale, 2.0);
	tScanline.x = 1.0 - tScanline.y;
	
    gl_FragColor = (tScanline.x + tScanline.y * powv(col, blendExponent)) * col;
}

#elif defined(VERTEX)

varying vec2 vTexCoord;
varying vec2 vScanline;

attribute vec4 VertexCoord;
attribute vec4 TexCoord;

uniform mat4 MVPMatrix;

void main()
{
	gl_Position = MVPMatrix * VertexCoord;
	vScanline = VertexCoord.xy;
	vTexCoord = TexCoord.xy;
}
#endif
