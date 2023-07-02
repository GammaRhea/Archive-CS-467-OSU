#version 330 compatibility

uniform float	vTime;		// "Time", from Animate( )
out vec2  	vST;		// texture coords

const float PI = 	3.14159265;
const float AMP = 	0.2;		// amplitude
const float W = 	2.;		// frequency

mat4 rotateX(){
	return mat4(1.0,	0,	0,	0,
				0, 	cos(0), -sin(0),	0,
				0,  sin(0),  cos(0),	0,
				0,	0,	0,	1.0);
}

// author : Neil Mendoza
// taken from: http://www.neilmendoza.com/glsl-rotation-about-an-arbitrary-axis/
// description: used to rotate a matrix along a specific axis
mat4 rotationMatrix(vec3 axis, float angle)
{
    axis = normalize(axis);
    float s = sin(angle);
    float c = cos(angle);
    float oc = 1.0 - c;
    
    return mat4(oc * axis.x * axis.x + c,           oc * axis.x * axis.y - axis.z * s,  oc * axis.z * axis.x + axis.y * s,  0.0,
                oc * axis.x * axis.y + axis.z * s,  oc * axis.y * axis.y + c,           oc * axis.y * axis.z - axis.x * s,  0.0,
                oc * axis.z * axis.x - axis.y * s,  oc * axis.y * axis.z + axis.x * s,  oc * axis.z * axis.z + c,           0.0,
                0.0,                                0.0,                                0.0,                                1.0);
}

void
main( )
{ 
	vST = gl_MultiTexCoord0.st;
	vec3 vert = gl_Vertex.xyz;
	vec3 temp = vec3(0, 0, 1);
	//vert = vert * temp;
	mat4 rotate = rotationMatrix(temp, vTime * 6.3);
	if(vert.y < 0){
		vST.s = vST.s  * (vTime * 3.5);
		//vert.x = vert.x + 2;
		vert.y = vert.y - vTime * 2;
		vert.x = vert.x - vTime * 2;
		//vert.y = vert.y - vTime * 5.3;
	}
	else{
		vST.t = vST.t  * (vTime * 5.3);
		//vert.x = vert.x - 2;
		vert.y = vert.y + vTime * 2;
		vert.x = vert.x + vTime * 2;
		//vert.x = vert.x + vTime * 5.3;
	}
	if(vert.z > 0){
		vert.z = vert.z - 2;
	}
	else{
		vert.z = vert.z + 2;
	}
	if(vert.x > 3){
		vert.x = vert.x - (vTime * 3);
		vert.y = vert.y - (vTime * 5);
	}
	if(vert.x < -3){
		vert.x = vert.x + (vTime * 3);
		vert.y = vert.y + (vTime * 5);
	}

	vec2 tempvST = vST.st;
	vST.t = tempvST.s;
	vST.s = tempvST.t;
	


	//gl_Position = gl_ModelViewProjectionMatrix * vec4( vert, 1. ) * rotate;
	gl_Position = gl_ModelViewProjectionMatrix * vec4( vert, 1. );
}