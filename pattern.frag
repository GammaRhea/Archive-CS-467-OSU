#version 400 compatibility

uniform int		disl;
uniform float	fTime;		// "Time", from Animate( )
in vec2  	vST;		// texture coords
uniform sampler uTexUnit;

void
main( )
{
	vec3 newvec = texture(uTexUnit, vST).rbg;
	vec3 myColor = vec3( 0.7, 0.2, 0.);

	// x, y
	if (vST.x > .5 && vST.y > .5){

		myColor = vec3( .2 * fTime, .2, .1 * fTime);
	}
	// -x, -y
	if (vST.x < .5 && vST.y < .5){
		myColor = vec3( .5 * fTime, .2, .2);
	}
	// x, -y
	if (vST.x > .5 && vST.y < .5){
		myColor = vec3( .3, .3, .6 * fTime);
	}
	// -x, y
	if (vST.x < .5 && vST.y > .5){
		myColor = vec3( .3, .4 * fTime, .0);
	}
	if (vST.x > 3){
		myColor = vec3( 0.3, 0.3, 0.3);
	}

	if (disl == 1){
		myColor = vec3(.4,.4,.4);
		gl_FragColor = vec4( myColor, 1);
	}

	gl_FragColor = vec4( myColor,  1. );
}