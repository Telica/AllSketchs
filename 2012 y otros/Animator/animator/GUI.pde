void gui() {
  fill(70);
  rect(400,0,200,height);
  cuadroColor();
  sel1.act();
  b1.act();
  play = b1.val;
  b2.act();
  lop = b2.val;
  sel2.act();
}

void cuadroColor() {
  scr1.act();
  scr2.act();
  scr3.act();
  scr4.act();
  col = color(scr1.val, scr2.val, scr3.val,scr4.val);
  fill(col);
  rect(410, 10, 80, 80);
}

class scrollH {
  float x, y, width, height, max, min, val;
  String name;
  scrollH(float nx, float ny, float nw, float nh, float nmin, float nmax, float nvar, String n) {
    x = nx;
    y = ny;
    width = nw;
    height = nh;
    max = nmax;
    min = nmin;
    val = nvar;
    name = n;
  }

  void act() {
    if (mousePressed) {
      if ( mouseX >= x + height/2 && mouseX - 8 <= x + width - height/2+ 8) {
        if ( mouseY >= y  && mouseY <= y + height )
          val = min + (max-min) * ((mouseX- height/2 - x )/(width - height));
        if (val < min) {
          val = min;
        }
        else if (val > max) {
          val = max;
        }
      }
    } 
    draw();
  }

  void draw() {
    fill(120);
    rect(x, y, width, height);

    fill(150);
    float pos = x + ((width-height) * (val-min)/(max-min));
    rect(pos, y, height, height);
    fill(255);
    text(name+" "+val, x+2, y+height-4);
  }
}

class Boton {
  float x, y, width, height;
  boolean val, aux;
  String name;

  Boton(float nx, float ny, float nw, float nh, boolean nv, String n) {
    x = nx;
    y = ny;
    width = nw;
    height = nh;
    val = nv;
    name = n;
    aux = false;
  }

  void act() {
    if (mousePressed && !aux) {
      aux = true;
      if ( mouseX >= x  && mouseX <= x + width ) {
        if ( mouseY >= y  && mouseY <= y + height ) {
          if (val) {
            val = false;
          }
          else {
            val = true;
          }
        }
      }
    }
    if (aux && !mousePressed) {
      aux = false;
    }
    draw();
  }

  void draw() {
    noStroke();
    if (val) {
      fill(150);
    }
    else {
      fill(120);
    }
    rect(x, y, width, height);
    fill(255);
    text(name, x+width+2, y+height-2);
  }
}

class Selector {
  int cant, val;
  float x, y, width, height;
  boolean aux;
  String name;

  Selector(float nx, float ny, float nw, float nh, int nc, int nv, String n) {
    x = nx;
    y = ny;
    width = nw;
    height = nh;
    cant = nc;
    val = nv;
    name = n;
    aux = false;
  }

  void act() {
    if (mousePressed) {
      if ( mouseX >= x  && mouseX < x + width ) {
        if ( mouseY >= y  && mouseY <= y + height ) {
          val = int((mouseX - x)/(width/cant));
        }
      }
    }
    draw();
  }

  void draw() {
    noStroke();
    for (int i = 0; i < cant; i++) {
      if (val == i) {
        fill(150);
      }
      else {
        fill(120);
      }
      rect(x+(width)/cant*i, y, width/cant, height);
    }
    fill(255);
    text(name+" "+(val+1), x+2, y+height-4);
  }
}

