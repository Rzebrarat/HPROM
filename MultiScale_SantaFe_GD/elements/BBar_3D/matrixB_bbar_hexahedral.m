function [B,detJ] = matrixB_bbar_hexahedral(coord_n,xg,BH,e_VG)

%global ndn dofpe ntens
ndn = e_VG.ndn;
dofpe = e_VG.dofpe;
ntens = e_VG.ntens;

% Matriz Bs (standard)
% ��������������������
[Bs,detJ] = matrixBs_bbar_hexahedral(coord_n,xg,e_VG);

% Matriz B corregida:
% �������������������
B      = zeros(ntens,dofpe);

B1     = [Bs(1,1) 0 0  ; 0 Bs(2,2) 0  ; 0 0 Bs(3,3)];
B2     = [Bs(1,4) 0 0  ; 0 Bs(2,5) 0  ; 0 0 Bs(3,6)];
B3     = [Bs(1,7) 0 0  ; 0 Bs(2,8) 0  ; 0 0 Bs(3,9)];
B4     = [Bs(1,10) 0 0 ; 0 Bs(2,11) 0 ; 0 0 Bs(3,12)];
B5     = [Bs(1,13) 0 0 ; 0 Bs(2,14) 0 ; 0 0 Bs(3,15)];
B6     = [Bs(1,16) 0 0 ; 0 Bs(2,17) 0 ; 0 0 Bs(3,18)];
B7     = [Bs(1,19) 0 0 ; 0 Bs(2,20) 0 ; 0 0 Bs(3,21)];
B8     = [Bs(1,22) 0 0 ; 0 Bs(2,23) 0 ; 0 0 Bs(3,24)];

B(1,:) = [2/3*B1(1,1) -1/3*B1(2,2) -1/3*B1(3,3)...
          2/3*B2(1,1) -1/3*B2(2,2) -1/3*B2(3,3)...
          2/3*B3(1,1) -1/3*B3(2,2) -1/3*B3(3,3)...
          2/3*B4(1,1) -1/3*B4(2,2) -1/3*B4(3,3)...
          2/3*B5(1,1) -1/3*B5(2,2) -1/3*B5(3,3)...
          2/3*B6(1,1) -1/3*B6(2,2) -1/3*B6(3,3)...
          2/3*B7(1,1) -1/3*B7(2,2) -1/3*B7(3,3)...
          2/3*B8(1,1) -1/3*B8(2,2) -1/3*B8(3,3)];

B(2,:) = [-1/3*B1(1,1) 2/3*B1(2,2) -1/3*B1(3,3)...
          -1/3*B2(1,1) 2/3*B2(2,2) -1/3*B2(3,3)...
          -1/3*B3(1,1) 2/3*B3(2,2) -1/3*B3(3,3)...
          -1/3*B4(1,1) 2/3*B4(2,2) -1/3*B4(3,3)...
          -1/3*B5(1,1) 2/3*B5(2,2) -1/3*B5(3,3)...
          -1/3*B6(1,1) 2/3*B6(2,2) -1/3*B6(3,3)...
          -1/3*B7(1,1) 2/3*B7(2,2) -1/3*B7(3,3)...
          -1/3*B8(1,1) 2/3*B8(2,2) -1/3*B8(3,3)];

B(3,:) = [-1/3*B1(1,1) -1/3*B1(2,2) 2/3*B1(3,3)...
          -1/3*B2(1,1) -1/3*B2(2,2) 2/3*B2(3,3)...        
          -1/3*B3(1,1) -1/3*B3(2,2) 2/3*B3(3,3)...        
          -1/3*B4(1,1) -1/3*B4(2,2) 2/3*B4(3,3)...        
          -1/3*B5(1,1) -1/3*B5(2,2) 2/3*B5(3,3)...        
          -1/3*B6(1,1) -1/3*B6(2,2) 2/3*B6(3,3)...        
          -1/3*B7(1,1) -1/3*B7(2,2) 2/3*B7(3,3)...        
          -1/3*B8(1,1) -1/3*B8(2,2) 2/3*B8(3,3)];


B(1:3,:)     = B(1:3,:) + 1/3*BH;
B(4:ntens,:) = Bs(4:ntens,:);