%% Load commodities data
filename = '../data/commodityentries.csv';
data = csvread(filename,1);
headings = {'Year','Butter','Cheese','Potatoes (main)', 'Potatoes (early)'};

%% Grouped Bar Chart
figure, bar(data(:,1),data(:,2:end));
set(gca,'FontSize',16)
% Add legend (outside plot area)
legend({headings{2},headings{3},headings{4},headings{5}},'FontSize',16,'Location','bestoutside','Orientation','horizontal')
% Change colours
colormap('jet')
% Add axis labels
xlabel('Years','FontSize',16)
ylabel('Number of Data Entries','FontSize',16)

%% Stacked Bar Chart
figure, bar(data(:,1),data(:,2:end),'stacked')
set(gca,'FontSize',20);%Set a font size for axis tick labels, note gca means 'get current axis;
% Add legend (inside plot area)
legend(headings{2},headings{3},headings{4},headings{5},'Location','best')
% Add axis labels of specific size
xlabel('Years','FontSize',20)
ylabel('Number of Data Entries','FontSize',20)

%% Bar Chart with Highlight
figure, b=bar(data(:,1),data(:,2:end));
% Highlight bar
b(2).EdgeColor='red';

%% Horizontal Bar Chart
figure, barh(data(:,1),data(:,2),'stacked')
% Add axis labels of specific size
xlabel('Years','FontSize',10)
ylabel('Number of Data Entries','FontSize',10)