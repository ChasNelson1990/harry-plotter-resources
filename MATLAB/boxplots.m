%% Load commodities data
filename = '../data/commodityprices.csv';
data = csvread(filename,1);
headings = {'Year','Week','Butter','Cheese','Potatoes (main)', 'Potatoes (early)'};

%% Plot Box Plots for Cost vs. Commodity
% melt comoddities into a colum, i.e. 1-to-1 relationship with values
commodity = char(repmat(['Butter'],size(data,1),1),...
                repmat(['Cheese'],size(data,1),1),...
                repmat(['Potatoes'],size(data,1),1));
cost = data(:,3:end-1); cost=cost(:);
% ignore zeros
cost(cost==0) = NaN;
figure, boxplot(cost,commodity)
set(gca,'FontSize',16);% set fontsize and deal with newline characters