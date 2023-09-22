function new_X = task1(photo, k)
  [m, n] = size(photo);
  
  % initializare matrice finala
  new_X = zeros(m, n);
  
  % cast photo la double
  photo = double(photo);
  
  % aplicam algoritmul SVD asupra matricii photo
  [U, S, V] = svd(photo);
  
  % transpun matricea V
  V = V';
  
  % calculeaz noile matrici reduse U, S si V, continand doar primele k valori
  % singulare
  new_U = U(:, 1 : k);
  new_S = S(1 : k, 1 : k);
  new_V = V(1 : k, :);
  
  % calculez new_X care este aproximarea matricii initiale photo
  new_X = new_U * new_S * new_V;
  
  % transform matricea in uint8 pentru a fi o imagine valida.
  new_X = uint8(new_X);
  
endfunction
