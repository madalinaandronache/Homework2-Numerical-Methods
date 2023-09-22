function new_X = task2(photo, pcs)
  [m n] = size(photo);
  
  % initializare matrice finala
  new_X = zeros(m, n);
  
  % cast photo la double
  photo = double(photo);
    
  % calculam media fiecarui rand al matricei photo
  miu = mean(photo, 2);
  
  % normalizam matricea initiala scazand din ea media fiecarui rand
  for i = 1 : m
    photo(i, :) = photo(i, :) - miu(i);
  endfor
  
  % construim matricea Z
  Z = photo' / sqrt(n - 1);
  
  % calculam matricea V din algoritmul SVD aplicat matricii Z
  [~, ~, V] = svd(Z);
   
  % construiesc matricea W din primele pcs coloane ale lui V
  W = V(:, 1 : pcs);
  
  % caclulez matricea Y schimband baza matricii initiale
  Y = W' * photo;
  
  % aproximeaza matricea initiala
  new_X = W * Y + miu;
  
  % transformam matricea in uint8 pentru a fi o imagine valida
  new_X = uint8(new_X);
  
endfunction
