function prediction = KNN(labels, Y, test, k)
  % initializeaza prediction
  prediction = -1;
  
  % initializeaza distantele
  [m, n] = size (Y);
  distance = zeros (m, 1);
  
  % pentru fiecare rand se calculeaza distanta Euclidiana dintre acesta si
  % vectorul de test primit ca argument.
  distances = sqrt(sum((Y - test).^2, 2));
  
  % se ordoneaza crescator distantele
  [~, idx] = sort(distances);
  
  % se memoreaza primele k valori ale imaginilor cele mai apropriate
  k_nearest_labels = labels(idx(1 : k));
  
  % se calculeaza predictia ca mediana celor k valori cele mai apropiate
  prediction = median(k_nearest_labels);
  
endfunction
