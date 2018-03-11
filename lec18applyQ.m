function QX = lec18applyQ(QR,tau,X)
[m,n] = size(QR);
QX = X;
for j = n:-1:1
w = [1; QR(j+1:end,j)];
QX(j:end,:) = QX(j:end,:)-(tau(j)*w)*(w'*QX(j:end,:));
end

function QTX = lec18applyQT(QR,tau,X)
[m,n] = size(QR);
QTX = X;
for j = 1:n
w = [1; QR(j+1:end,j)];
QTX(j:end,:) = QTX(j:end,:)-(tau(j)*w)*(w'*QTX(j:end,:));
end