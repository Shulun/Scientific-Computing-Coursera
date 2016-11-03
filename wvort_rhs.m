function rhs = wvort_rhs(t,wt2,dummy,mu,K,K2,n,KX,KY)
wt=reshape(wt2,n,n);
psit=-wt./K;
psix=real(ifft2(1i*KX.*psit));
psiy=real(ifft2(1i*KY.*psit));
wx=real(ifft2(1i*KX.*wt));
wy=real(ifft2(1i*KY.*wt));

rhs=mu*K2.*wt2+reshape(fft2(wx.*psiy-wy.*psix),n^2,1);
end

