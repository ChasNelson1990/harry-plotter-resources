%% Load commodities data
filename = '../data/commodityprices.csv';
data = csvread(filename,1);
headings = {'Year','Week','Butter','Cheese','Potatoes (main)', 'Potatoes (early)'};

%% Scatter Plot - Butter: Week vs. Price (coloured by year)
figure
% Remove empty time points
data(data(:,3)==0,:) = [];
scatter(data(:,2),data(:,3),20,data(:,1),'o','filled');
% Change colours
colormap('jet')
% Set x-axis limits and add label
xlim([1,52])
xlabel('Week Number')
% Set y-axis label
ylabel('Cost of Butter, £/tonnes')

%% Line Plot - Butter: Week vs. Price (one line per year)
figure
% Remove empty time points
data(data(:,3)==0,:) = [];
for y=2013:2016
    ydata = data(data(:,1)==y,:);
    % Specify line style for 2016
    if y==2016
        plot(ydata(:,2),ydata(:,3),'--');
    else
        plot(ydata(:,2),ydata(:,3));
    end
    hold on;
end
% Add legend
legend('2013','2014','2015','2016')
% Set x-axis limits and add label
xlim([1,52])
xlabel('Week Number')
% Set y-axis label
ylabel('Cost of Butter, £/tonnes')

%% Line Plot w/ Error Bars - Butter: Week vs. Price (one line per year)
% Note that we've used a random error here created with rand for
% illustration purposes, for different values at each point use a
figure
% Remove empty time points
data(data(:,3)==0,:) = [];
for y=2013:2016
    ydata = data(data(:,1)==y,:);
    % Specify line style for 2016
    if y==2016
        plot(ydata(:,2),ydata(:,3),'--');
    else
        plot(ydata(:,2),ydata(:,3));
    end
    errorbar(ydata(:,2),ydata(:,3),50*rand(1,length(ydata(:,2))));
    hold on;
end
set(gca,'FontSize',16);%Set a font size for axis tick labels, note gca means 'get current axis;
% Add legend
legend({'2013','2014','2015','2016'},'Location','bestoutside','Orientation','horizontal','FontSize',16)
% Set x-axis limits and add label
xlim([1,52])
xlabel('Week Number','FontSize',16)
% Set y-axis label
ylabel('Cost of Butter, £/tonnes','FontSize',16)
