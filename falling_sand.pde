int cellSize = 5;
int cols, rows;
int[][] grid;


void setup(){
  size(600,400);
  cols = width / cellSize;
  rows = height / cellSize;
  grid = new int[cols][rows];
  
}
void draw(){
  background(0);
  updateGrid();
  displayGrid();
  if (mousePressed) {
    int gridX = mouseX / cellSize;
    int gridY = mouseY / cellSize;
    
    // Ensure the mouse is within bounds
    if (gridX >= 0 && gridX < cols && gridY >= 0 && gridY < rows) {
    grid[gridX+int(random(2))][gridY] = int(random(4));
    grid[gridX][gridY+int(random(2))] = int(random(4));
    grid[gridX+int(random(2))][gridY+int(random(2))] = int(random(4));
    grid[gridX+int(random(2))][gridY-int(random(2))] = int(random(4));
    grid[gridX-int(random(2))][gridY-int(random(2))] = int(random(4));
    grid[gridX][gridY] = int(random(4));
    }
  }
}
void updateGrid(){
  for (int y = rows - 2; y >= 0; y--){
    for (int x = 0; x <= cols - 1; x++){
      if(grid[x][y] > 0){
        if(grid[x][y+1] == 0){ // check below if empty
          grid[x][y+1] = grid[x][y];
          grid[x][y] = 0;
        } else { // below == SAND
          if (grid[x-1][y+1]==0 && grid[x+1][y+1]==0){ // both left and right below are empty
            if(random(1) < 0.5){
              grid[x-1][y+1] = grid[x][y]; // shift left
              grid[x][y] = 0;
            } else {
              grid[x+1][y+1] = grid[x][y]; // shift right
              grid[x][y] = 0;
            }
          } else if (grid[x-1][y+1] == 0){ // only left below is EMPTY
            grid[x-1][y+1] = grid[x][y]; //shift left
            grid[x][y] = 0;
          } else if (grid[x + 1][y + 1] == 0){ // only right below is EMPTY
            grid[x+1][y+1] = grid[x][y]; // shift right
            grid[x][y] = 0;
          }
        }
      }
    }
  }
}
void displayGrid(){
  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < cols; x++) {
      if (grid[x][y] > 0) {
        switch(grid[x][y]){
          case 0:
            fill(235, 90, 60);
            break;
          case 1:
            fill(223, 151, 85);
            break;
          case 2:
            fill(231, 210, 131);
            break;
          case 3:
            fill(237, 244, 194);
            break;
        }
        noStroke();
        rect(x * cellSize, y * cellSize, cellSize, cellSize);
      }
    }
  }
}
