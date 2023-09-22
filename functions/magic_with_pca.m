function [train, miu, Y, Vk] = magic_with_pca(train_mat, pcs)
  [m, n] = size(train_mat);
  
  % initializare train
  train = zeros(m, n);
  
  % initializare miu
  miu = zeros(1, n);
  
  % initializare Y
  Y = zeros(m, pcs);
  
  % initializare Vk
  Vk = zeros(n, pcs);
  
  % cast train_mat la double
  train_mat = double (train_mat);
  
  % calculeaz media fiecarei coloane a matricii
  miu = mean(train_mat);
  
  % scadem media din matricea initiala
  for i = 1 : n
    train_mat(:, i) = train_mat(:, i) - miu(i);
  endfor
  
  % calculez matricea de covarianta
  cov_matrix = train_mat' * train_mat / (m - 1);
  
  % calculam vectorii si valorile proprii ale matricei de covarianta
  [V, S] = eig(cov_matrix);
  values = diag(S);
  vectors = V;
  
  % ordonez descrescator valorile proprii si coloanele matricei V, astfel 
  % incat prima coloana sa fie vectorul propriu corespunzator celei mai mari 
  % valori proprii si asa mai departe
  [values, idx] = sort(values, 'descend');
  Vk = vectors(:, idx);
  
  % in W se pastreaza doar primele pcs coloane
  Vk = Vk(:, 1 : pcs);
    
  % calculez matricea Y schimband baza matricii initiale
  Y = train_mat * Vk;
  
  % matricea train este o aproximatie a matricii initiale
  train = Y * Vk';
  
endfunction
