% Converts class labels into an ordering.
%
% Creates an ordering order such that IDX(order)=[1 1...1 2...2 ... k...k]. All points
% within a class retain the ordering in which they originally appeared.  Also, Xb =
% X(order,:) has cluster labels IDX(order), ie adjacent elements in X typically belong to
% the same cluster.
%
% INPUTS
%   IDX     - cluster membership [see kmeans2.m]
%
% OUTPUTS
%   order   - n-by-1 vector containing a new ordering for the points.
%
% EXAMPLE
%   order = IDX2order( [1 1 3 1 2 2] ),  % order should be: [1 2 4 5 6 3]
%
% DATESTAMP
%   29-Sep-2005  2:00pm

% Piotr's Image&Video Toolbox      Version 1.03   
% Written and maintained by Piotr Dollar    pdollar-at-cs.ucsd.edu 
% Please email me if you find bugs, or have suggestions or questions! 
 
function order = IDX2order( IDX )
    k = max(IDX);  n = length(IDX);
    order = zeros(1,n);  count = 0;
    for i=1:k
        locs = (IDX==i); orderi = cumsum(locs);
        order(locs) = orderi(locs) + count;
        count = count+sum(locs);
    end
    [dis,order] = sort(order);
