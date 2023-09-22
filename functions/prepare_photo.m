function sir = prepare_photo(im)
  %initializare sirul final
  sir = zeros (1, 784);
  
  % inverseaza pixelii imaginii im
  im = 255 - im;
  
  % transpune imaginea
  im = im';
  
  % transforma imaginea intr-un vector linie
  sir = reshape(im, 1, []);
  
endfunction
