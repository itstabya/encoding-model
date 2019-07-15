function [inds,inds2]=find_non_empty_cells(x)
if nargout<2
    inds=find(~cellfun('isempty', x)); %cellfun is applying function to each cell - isempty checking if empty
    %
else %nargout > 2 #more arguments
    [inds,inds2]=find(~cellfun('isempty', x));
end