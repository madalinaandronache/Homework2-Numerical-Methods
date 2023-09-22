function new_X = task3(photo, pcs)
  [m, n] = size(photo);
  
  % initializare matrice finala
  new_X = zeros(m, n);
  
  % cast photo la double
  photo = double (photo);
  
  % calculam media fiecarui rand al matricei photo
  miu = mean(photo, 2);
  
  % normalizam matricea initiala scazand din ea media fiecarui rand
  for i = 1 : m
    photo(i, :) = photo(i, :) - miu(i);
  endfor
  
  % calculam matricea de covarianta
  Z = (photo * photo') / (n - 1);
  
  % calculam vectorii si valorile proprii ale matricei de covarianta
  [V, S] = eig(Z);
  values = diag(S);
  vectors = V;
  
  % ordonez descrescator valorile proprii si coloanele matricei V, astfel 
  % incat prima coloana sa fie vectorul propriu corespunzator celei mai mari 
  % valori proprii si asa mai departe
  [values, idx] = sort(values, 'descend');
  vectors = vectors(:, idx);

  % in W se pastreaza doar primele pcs coloane
  W = vectors(:, 1:pcs);
  
  % calculez matricea Y schimband baza matricii initiale
  Y = W' * photo;
  
  % matricea new_X este o aproximatie a matricii initiale
  new_X = W * Y + miu;
    
  % transformam matricea in uint8 pentru a fi o imagine valida
  new_X = uint8(new_X);
  
endfunction
