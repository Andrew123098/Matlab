function DrawHouse( m )
%Define points and draw the house

house = [ -0.5 0.5 0.5 0.0 -0.5 -0.5; -0.5 -0.5 0.5 0.75 0.5 -0.5];
window = [ 0.1 0.3 0.3 0.1 0.1; -0.1 -0.1 0.3 0.3 -0.1 ];
door = [ -0.2 -0.2 -0.4 -0.4 ; -0.5 -0.2 -0.2 -0.5 ];

house(3,:) = ones(1, size(house, 2));
window(3,:) = ones(1, size(window, 2));
door(3,:) = ones(1, size(door, 2));

house = m * house;
window = m * window;
door = m * door;

plot(house(1,:), house(2,:), '-b' )
hold on;
plot(window(1,:), window(2,:), '-r' )
plot(door(1,:), door(2,:), '-k' )

end

