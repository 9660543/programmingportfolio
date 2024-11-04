// Maya Jacobsen | Calc project | 2 Oct 2024
Button[] buttons = new Button[23];
String dVal = "0";
float l, r, result;
char op;
boolean left;

void setup () {
  size(180, 250);
  background(0);
  l = 0.0;
  r = 0.0;
  result = 0.0;
  op = ' ';
  left = true;
  buttons[0] = new Button(45, 230, 70, 20, "0", true );
  buttons[1] = new Button(25, 200, 30, 20, "1", true);
  buttons[2] = new Button(65, 200, 30, 20, "2", true);
  buttons[3] = new Button(105, 200, 30, 20, "3", true);
  buttons[4] = new Button(25, 170, 30, 20, "4", true);
  buttons[5] = new Button(65, 170, 30, 20, "5", true);
  buttons[6] = new Button(105, 170, 30, 20, "6", true);
  buttons[7] = new Button(25, 140, 30, 20, "7", true);
  buttons[8] = new Button(65, 140, 30, 20, "8", true);
  buttons[9] = new Button(105, 140, 30, 20, "9", true);
  buttons[10] = new Button(75, 110, 30, 20, "%", false);
  buttons[11] = new Button(75, 80, 30, 20, "x²", false);
  buttons[12] = new Button(30, 80, 40, 20, "√", false);
  buttons[13] = new Button(115, 80, 30, 20, "π", false);
  buttons[14] = new Button(155, 80, 30, 20, "|x|", false);
  buttons[15] = new Button(30, 110, 40, 20, "C", false);
  buttons[16] = new Button(115, 110, 30, 20, "±", false);
  buttons[17] = new Button(150, 200, 40, 20, "-", false);
  buttons[18] = new Button(155, 110, 30, 20, "÷", false);
  buttons[19] = new Button(150, 140, 40, 20, "*", false);
  buttons[20] = new Button(150, 170, 40, 20, "+", false);
  buttons[21] = new Button(105, 230, 30, 20, ".", false);
  buttons[22] = new Button(150, 230, 40, 20, "=", false);
}

void draw () {
  background(0);
  //println("Left:" + l + " Right:" + r + " Result:" + result + " Op:" + op + " L:" + left);
  for (int i=0; i<buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover(mouseX, mouseY);
  }

  updateDisplay();
}

void updateDisplay() {
  rectMode(CENTER);
  fill(250);
  rect(width/2, 35, 160, 50);
  fill(0);
  if (dVal.length()<10) {
    textSize(30);
  } else if (dVal.length()==10) {
    textSize(28);
  } else if (dVal.length()== 11) {
    textSize(26);
  } else if (dVal.length()== 12) {
    textSize(24);
  } else if (dVal.length()== 13) {
    textSize(23);
  } else if (dVal.length()== 14) {
    textSize(22);
  } else if (dVal.length()== 15) {
    textSize(20);
  } else if (dVal.length()== 16) {
    textSize(19);
  } else if (dVal.length()== 17) {
    textSize(18);
  } else if (dVal.length()== 18) {
    textSize(16);
  } else if (dVal.length()== 19) {
    textSize(15);
  }
  textAlign(RIGHT);
  text(dVal, width-15, 55);
}

void mouseReleased() {
  //println("Left:" + l + " Right:" + r + " Result:" + result + " Op:" + op + " L:" + left);
  for (int i = 0; i<buttons.length; i++) {
    if (buttons[i].on && buttons[i].isNum && left == true && dVal.length()<20) {
      dVal += buttons[i].val;
      l = float(dVal);
    } else if (buttons[i].on && buttons[i].isNum && !left) {
      dVal += buttons[i].val;
      r = float(dVal);
    } else if (buttons[i].on && buttons[i].val.equals("C")) {
      handleEvent("C", false);
    } else if (buttons[i].on && buttons[i].val.equals("+")) {
      handleEvent("+", false);
    } else if (buttons[i].on && buttons[i].val.equals("-")) {
      handleEvent("-", false);
    } else if (buttons[i].on && buttons[i].val.equals("*")) {
      handleEvent("*", false);
    } else if (buttons[i].on && buttons[i].val.equals("÷")) {
      handleEvent("/", false);
    } else if (buttons[i].on && buttons[i].val.equals("=")) {
      handleEvent("=", false);
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("±")) {
      if (left == true) {
        l *=-1;
        dVal = str(l);
      } else if (left == false) {
        r *=-1;
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("√")) {
      if (left) {
        l = sqrt(l);
        dVal = str(l);
      } else if (left == false) {
        r = sqrt(r);
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("π")) {
      if (left) {
        l = PI;
        dVal = str(l);
      } else if (left == false) {
        r = PI;
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("|x|")) {
      if (left) {
        l = abs(l);
        dVal = str(l);
      } else if (left == false) {
        r = abs(r);
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("x²")) {
      if (left) {
        l = sq(l);
        dVal = str(l);
      } else if (left == false) {
        r = sq(r);
        dVal = str(r);
      }
    } else if (buttons[i].on && buttons[i].val.equals(".")) {
      //decimal
      handleEvent(".", false);
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("%")) {
      if (left) {
        l = l/100;
        dVal = str(l);
      } else if (left == false) {
        r = r/100;
        dVal = str(r);
      }
    }
  }
}
void performCalc() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '*') {
    result = l * r;
  } else if (op == '÷') {
    result = l / r;
  }
  dVal = str(result);
}



void keyPressed () {
  println("Key:" + key);
  println("KeyCode:" + keyCode);
  if (key == 0 || keyCode == 96 || keyCode == 48) {
    handleEvent("0", true);
  } else if (key == 1 || keyCode == 97 || keyCode == 49) {
    handleEvent("1", true);
  } else if (key == 2 || keyCode == 98 || keyCode == 50) {
    handleEvent("2", true);
  } else if (key == 3 || keyCode == 99 || keyCode == 51) {
    handleEvent("3", true);
  } else if (key == 4 || keyCode == 100 || keyCode == 52) {
    handleEvent("4", true);
  } else if (key == 5 || keyCode == 101 || keyCode == 53) {
    handleEvent("5", true);
  } else if (key == 6 || keyCode == 102 || keyCode == 54) {
    handleEvent("6", true);
  } else if (key == 7 || keyCode == 103 || keyCode == 55) {
    handleEvent("7", true);
  } else if (key == 8 || keyCode == 104 || keyCode == 56) {
    handleEvent("8", true);
  } else if (key == 9 || keyCode == 105 || keyCode == 57) {
    handleEvent("9", true);
  } else if (key == '/' || keyCode == 111) {
    handleEvent("/", false);
  } else if (key == 'C' || keyCode == 12) {
    handleEvent("C", false);
  } else if (key == '*' || keyCode == 106) {
    handleEvent("*", false);
  } else if (key == '-' || keyCode == 109) {
    handleEvent("-", false);
  } else if (key == '+' || keyCode == 107) {
    handleEvent("+", false);
  } else if (key == '=' || keyCode == 10) {
    handleEvent("=", false);
  } else if (key == '.' || keyCode == 110) {
    handleEvent(".", false);
  }
}

void handleEvent(String keyVal, boolean isNum) {
  if (left && dVal.length()<20 && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    l = float(dVal);
  } else if (!left && dVal.length()<20 && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    r = float(dVal);
  } else if (keyVal.equals("+") && !isNum) {
    op = '+';
    left = false;
    dVal = "0";
  } else if (keyVal.equals("-") && !isNum) {
    op = '-';
    left = false;
    dVal = "0";
  } else if (keyVal.equals("*") && !isNum) {
    op = '*';
    left = false;
    dVal = "0";
  } else if (keyVal.equals("/") && !isNum) {
    op = '÷';
    left = false;
    dVal = "0";
  } else if (keyVal.equals("=") && !isNum) {
    performCalc();
  } else if (keyVal.equals("C") && !isNum) {
    dVal = "0";
    l = 0.0;
    r = 0.0;
    result = 0.0;
    op = ' ';
    left = true;
  } else if (keyVal.equals(".") && !isNum) {
    if (left) {
      if (!dVal.contains(".")) {
        dVal += keyVal;
        l = float(dVal);
      } else if (!dVal.contains(".")) {
        dVal += keyVal;
        r = float(dVal);
      }
    }
  }
}
