function im = visualise_image(train_mat, number)
  
  % initializare matrice finala
  im = zeros (28, 28);
  
  % citeste din matricea de antrenament linia cu numarul number
  image_row = train_mat(number, :);
  
  % transforma linia citita intr-o matrice 28x28 
  im = reshape(image_row, 28, 28);
   
  % transpunem matricea obtinuta
  im = im';
  
  % transformam matricea in uint8 pentru a fi o imagine valida
  im = uint8(im);

endfunction
