function prediction = classifyImage(im, train_mat, train_val, pcs)
  % initializare predictie.
  prediction = -1;
  
  % cast im la double
  im = double(im);
  
  % aplicam functia magic_with_pca setului de date de antrenament
  [train, ~, Y, Vk] = magic_with_pca(train_mat, pcs);
  
  % scadem din vectorul imagine media fiecarei coloane din train_mat
  miu = mean(train_mat);
  im = im - miu;

  % schimbam baza inmultind cu matricea Vk
  im = im * Vk;
  
  % calculam predictia folosindu-ne de metoda k nearest neighbour cu k = 5.
  prediction = KNN(train_val, Y, im, 5);
  
endfunction
