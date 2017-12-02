// Declare Variable
Particle[] dots;
int size = 0;

void setup() {
  rectMode(RADIUS);
  size(500, 500);
  // Initialize dots
  dots = new Particle[1000];
  for (int i = 0; i < dots.length; i++) {
    dots[i] = new NParticle();
  }
  dots[0] = new SpecialParticle();
  dots[1] = new JumboParticle();
  background(0);
}

void draw() {
  background(0);
  // Draw Dots
  for (int i = 0; i < dots.length; i++) {
    stroke(0);
    dots[i].show();
    dots[i].move();

    // Make dots move towards center
    if (mousePressed) {
      dots[i].implode();
    }

    // If the black box of doom englulfs the screen, reset the dots
    if (size == 500) {
      dots[i].reset();
    }
  }
  // Creates black box of doom
  if (keyPressed == true) {
    apocalypse();
  }
}

// Reset size
void keyReleased() {
  size = 0;
}

// Black box of doom
void apocalypse() {
  stroke(0);
  fill(0);
  rect(250, 250, size, size);
  size += 20;
}

// Particle interface
interface Particle {
  public void move();
  public void show();
  public void implode();
  public void reset();
}

// Normal Particle class
class NParticle implements Particle {        
  double x, y, speeeed, angle;
  NParticle() {
    x = width / 2;
    y = height / 2;
    speeeed = (Math.random() * 5) + 1;
    angle = (Math.random()) * (Math.PI * 2);
  }
  
  // Move particles
  public void move() {
    x += Math.sin(angle) * speeeed;
    y += Math.cos(angle) * speeeed;
  }
  
  // Show particles
  public void show() {
    fill((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    ellipse((float)x, (float)y, 5, 5);
  }
  
  // Move particles towards center of screen
  public void implode() {
    if (x > 250 && y > 250) {
      x -= 15;
      y -= 15;
    } else if (x < 250 && y > 250) {
      x += 15;
      y -= 15;
    } else if (x > 250 && y < 250) {
      x -= 15;
      y += 15;
    } else {
      x += 15;
      y += 15;
    }
  }

  // Reset x, and y to default
  public void reset() {
    x = width / 2;
    y = height / 2;
  }
}

// Odball Particle Class
class SpecialParticle implements Particle {        
  double x, y, speeeed;
  SpecialParticle() {
    x = width / 2;
    y = height / 2;
  }
  
  // Move the special particle
  public void move() {
    x = Math.random() * 501;
    y = Math.random() * 501;
  }
  // Show the special particle
  public void show() {
    fill((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    rect((float)x, (float)y, 10, 10);
  }
  
  // Move special particle towards center
  public void implode() {
    if (x > 250 && y > 250) {
      x -= 15;
      y -= 15;
    } else if (x < 250 && y > 250) {
      x += 15;
      y -= 15;
    } else if (x > 250 && y < 250) {
      x -= 15;
      y += 15;
    } else {
      x += 15;
      y += 15;
    }
  }

  // Reset x and y to default
  public void reset() {
    x = width / 2;
    y = height / 2;
  }
}

// Jumbo Particle Class
class JumboParticle extends NParticle {
  
  // Show the jumbo particle
  public void show() {
    fill((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    ellipse((float)x, (float)y, 50, 50);
  }
}
