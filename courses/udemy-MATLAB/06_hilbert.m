%% Make a Hilbert Matrix

m = 5;
hilMat   = zeros(m);
checkMat = zeros(m);

for i=1:m
  for j=1:m
    den = i + j - 1;
    hilMat(i,j) = 1 / den;
    checkMat(i,j) = (-1) ^ den;
  end
end

figure(1), clf

subplot(121)
imagesc(hilMat)
axis square, title('Hilbert Matrix')
set(gca, 'xtick', [], 'ytick', [])

subplot(122)
imagesc(checkMat)
axis square, title('Checkerboard Matrix')
set(gca, 'xtick', [], 'ytick', [])
