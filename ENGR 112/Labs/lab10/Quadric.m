function [x,y,z] = Quadric(u,v)
%QUADRIC creates super quadric values
x=u.^2;
y=v.^(2)+u;
z=1./((u.*v)+3);
end

