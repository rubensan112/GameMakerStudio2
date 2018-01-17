//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor = vec4(1.0,1.0,1.0,gl_FragColor.a); //vec4(los tres colores, yno se que) //Es para aumentar el balnco o algo asi
}
