function [train_mat, train_val] = prepare_data(name, no_train_images)
  n = 784;
  
  % initializare train_mat
  train_mat = zeros(no_train_images, n);
  
  %initializare train_val
  train_val = zeros(1, no_train_images);
  
  % incarca datele din tabelul primit ca argument
  data = load(name);
  
  images = data.trainX;
  labels = data.trainY;
  
  % salvez in matricea train_mat primele no_train_images linii din
  % tabelul de imagini de antrenament
  train_mat = images(1 : no_train_images, :);
  
  % salvez in vectorul train_val primele no_train_images valori ale
  % vectorului de etichete.
  train_val = labels(1 : no_train_images);
  
endfunction
