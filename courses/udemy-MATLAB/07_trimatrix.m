%% Make triangular matrices

m = 70;
outMat = zeros(m);
outMat2 = zeros(m);

for i=1:m
  for j=1:m
    if i < j
      outMat(i,j) = 1.03 ^ sqrt(i * j);
    else
      outMat2(i,j) = (1.03 ^ m) - (1.03 ^ sqrt(i * j));
    end
  end
end

outMat2 = outMat + outMat2; % build full matrix

figure(1), clf
subplot(121)
imagesc(outMat);
axis square, title('Upper Triangular Matrix')
set(gca, 'xtick', [], 'ytick', [], 'clim', [0 1.03 ^ m])

subplot(122)
imagesc(outMat);
axis square, title('Full Matrix')
set(gca, 'xtick', [], 'ytick', [], 'clim', [0 1.03 ^ m])
