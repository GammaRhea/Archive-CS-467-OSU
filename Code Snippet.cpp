	// Fransisco Hernandez Code Review Sample in Display()
	Pattern = new GLSLProgram();
	if (WhichShader == BOTH) {
		bool valid = Pattern->Create("pattern.vert", "pattern.frag");
		if (FragmentShader && VertexShader) {
			A = Time;
			Pattern->SetUniformVariable("fTime", A);
			Pattern->SetUniformVariable("vTime", A);
		}
		else if (FragmentShader) {
			Pattern->SetUniformVariable("vTime", A);
			A = Time;
			Pattern->SetUniformVariable("fTime", A);
		}
		else if (VertexShader) {
			Pattern->SetUniformVariable("fTime", A);
			A = Time;
			Pattern->SetUniformVariable("fTime", A);
		}
		else {
			Pattern->SetUniformVariable("fTime", A);
			Pattern->SetUniformVariable("vTime", A);
		}
		Pattern->Use();
	}
	else if (WhichShader == VERTEX) {
		bool valid = Pattern->Create("pattern.vert", "pattern.frag");
		if (VertexShader) {
			A = Time;
			Pattern->SetUniformVariable("vTime", A);
			Pattern->SetUniformVariable("disl", B);
		}
		else {
			Pattern->SetUniformVariable("vTime", A);
			B = 0;
			Pattern->SetUniformVariable("disl", B);
		}
		Pattern->Use();
	}
	else if (WhichShader == FRAGMENT) {
		bool valid = Pattern->Create("pattern.frag");
		if (FragmentShader) {
			A = Time;
			Pattern->SetUniformVariable("fTime", A);
		}
		else {
			Pattern->SetUniformVariable("fTime", A);
		}
		Pattern->Use();
	}
	else {
		Pattern->Use(0);
	}


	//glEnable(GL_LIGHTING);

	glPushMatrix();
	glShadeModel(GL_SMOOTH);
	//glEnable(GL_TEXTURE_2D);
	//glActiveTexture(GL_TEXTURE5);
	//glBindTexture(GL_TEXTURE_2D, Tex0);
	//Pattern->SetUniformVariable("uTexUnit", 5);
	//SetMaterial(.4F, .4F, .4F, .0F);
	glColor3f(.6, .6, .6);
	MjbSphere(2.F, 360, 360, Time);
	//glDisable(GL_TEXTURE_2D);
	glPopMatrix();

	Pattern->Use( 0 );			// go back to fixed-function OpenGl
	// End of Fransisco Hernandez Code Review snippet from Display()