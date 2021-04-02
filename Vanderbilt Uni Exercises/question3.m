function output = question3(arr, point, k)
distances = zeros(3, size(arr, 2));
distances(1:2, :) = arr;

for index = 1:size(arr, 2)
    distances(3, index) = distanceCoordinate(arr(:, index), point);
end

sorted = (sortrows(distances', 3))';
output = sorted(1:2, 1:k);

end

function distanceOut = distanceCoordinate(p1, p2)
distanceOut = sqrt(...
    abs(p1(1) - p2(1))^2 + abs(p1(2) - p2(2))^2 ...
    );
end