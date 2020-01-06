float[] stuff1 = {1, 2, 3}; 
float[] stuff2 = {4, 5, 6}; 
ArrayList <float[]> list = new ArrayList<float[]>();
list.add(stuff1); //<>//
list.add(stuff2);
printArray(list);
println();

//Print Test 1
println(list.get(0));
println(list.get(1));
println();

//Print Test 2
for (int i=0; i< 2; i++) 
  {
  println(list.get(i));
  }
println();

 //Print Test 3  
for (float[] i : list) 
  {
  println(i);  
  }
println();  
