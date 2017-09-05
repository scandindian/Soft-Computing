function print_path(path)
% prints a resulting path
% the format of the path is [ Attribute label, Attribute value ]
% and at the last row there is the value of the goal attribute:
% path(end,1) = 1 | 0

fprintf('\nPath:\n==========\n');
s = [];
for i = 1 : ( length(path) - 1 )
   s = [s '%2i ']; 
end
fprintf(['Attribute:' s '\n'], path(1:(end-1),1));
fprintf(['Value    :' s '\n'], path(1:(end-1),2));
fprintf('Output   : %i\n\n', path(end,1));

end
