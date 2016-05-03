%% 3D Scatter Plot: Car Year vs. Weight vs. MPG, sizer by cylinder number, coloured by MPG
load carbig
figure, scatter3(Model_Year,Weight,MPG,5*Cylinders,MPG)%X,Y,Z,Size,Colour
% Add axis labels
xlabel('Model Year')
ylabel('Weight of Model')
zlabel('Miles per Gallon')
c = colorbar;
ylabel(c,'MPG')

%% 3D Surface Plot without face edges
% Example data
[X,Y,Z] = peaks(50);%X,Y,Z are all matrices
figure, surf(X,Y,Z,'EdgeColor','none')
% Add axis labels of specific size
xlabel('X')
ylabel('Y')
zlabel('Z')
c=colorbar;
ylabel(c,'Z')

%% Heat Map
% Example data
[X,Y,Z] = peaks(20);%X,Y,Z are all matrices
figure, surf(X,Y,Z)
% Add axis labels of specific size
xlabel('X')
ylabel('Y')
c = colorbar;
ylabel(c,'Z')
% Change view
view(0,90)