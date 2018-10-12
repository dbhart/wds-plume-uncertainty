%% This script is in the public domain.
% This script creates graphics for the Paper
% https://dx.doi.org/10.1061/(ASCE)WR.1943-5452.0001005 
% The raw data is too large ( > 500 MiB ) to save on any of the file
% servers such as GitHub. As such, this script was modified to save the
% plots' data points for examination.


function make_plots
    
    N6 = load('./For_Article_Net6/outputs/matlab.mat');
    N6.Tau = 1.0./N6.Tau;
    
    N6.meanEC = mean(mean(N6.EC));
    N6.meanUEC = mean(mean(N6.UEC));
    N6.meanPI = mean(mean(N6.PI));
    N6.meanUPI = mean(mean(N6.UPI));
    
    N6.sel1621 = N6.InjLocOrig == 1621;
    N6.sel0522 = N6.InjLocOrig == 522;
    N6.sel0440 = N6.InjLocOrig == 440;
    
    N6.meanEC1621 = mean(mean(N6.EC(N6.sel1621,:)));
    N6.meanUEC1621 = mean(mean(N6.UEC(N6.sel1621,:)));
    N6.meanEC522 = mean(mean(N6.EC(N6.sel0522,:)));
    N6.meanUEC522 = mean(mean(N6.UEC(N6.sel0522,:)));
    N6.meanEC440 = mean(mean(N6.EC(N6.sel0440,:)));
    N6.meanUEC440 = mean(mean(N6.UEC(N6.sel0440,:)));
    
    KL = load('./For_Article_KL/results/matlab.mat');
    KL.Tau = 1.0./KL.Tau;
    KL.meanEC = mean(mean(KL.EC));
    KL.meanUEC = mean(mean(KL.UEC));
    KL.meanPI = mean(mean(KL.PI));
    KL.meanUPI = mean(mean(KL.UPI));
    
    KL.sel000 = KL.InjLocOrig == 0;
    KL.sel227 = KL.InjLocOrig == 227;
    KL.sel156 = KL.InjLocOrig == 156;
    
    KL.meanEC0 = mean(mean(KL.EC(KL.sel000,:)));
    KL.meanUEC0 = mean(mean(KL.UEC(KL.sel000,:)));
    KL.meanEC227 = mean(mean(KL.EC(KL.sel227,:)));
    KL.meanUEC227 = mean(mean(KL.UEC(KL.sel227,:)));
    KL.meanEC156 = mean(mean(KL.EC(KL.sel156,:)));
    KL.meanUEC156 = mean(mean(KL.UEC(KL.sel156,:)));
    
    %% Plot Net6 relative impact plots
    
    Y = {
        N6.EC./1000 %N6.meanEC
        N6.UEC./1000 %N6.meanUEC
        N6.PI./1000 %N6.meanPI
        N6.UPI./1000 %N6.meanUPI
        N6.EC./1000 %N6.meanEC
        N6.EC(N6.sel1621,:)./1000 %N6.meanEC1621
        N6.EC(N6.sel0522,:)./1000 %N6.meanEC522
        N6.EC(N6.sel0440,:)./1000 %N6.meanEC440
        N6.UEC./1000 %N6.meanUEC
        N6.UEC(N6.sel1621,:)./1000 %N6.meanUEC1621
        N6.UEC(N6.sel0522,:)./1000 %N6.meanUEC522
        N6.UEC(N6.sel0440,:)./1000 %N6.meanUEC440
        };
    
    GROUP = {
        [N6.DemandVar,N6.PipeClose*100,N6.K_b,N6.InjStart,N6.InjDur,N6.Tau,N6.InjLoc],
        [N6.DemandVar,N6.PipeClose*100,N6.K_b,N6.InjStart,N6.InjDur,N6.Tau,N6.InjLoc],
        [N6.DemandVar,N6.PipeClose*100,N6.K_b,N6.InjStart,N6.InjDur,N6.Tau,N6.InjLoc],
        [N6.DemandVar,N6.PipeClose*100,N6.K_b,N6.InjStart,N6.InjDur,N6.Tau,N6.InjLoc],
        [N6.DemandVar,N6.PipeClose*100,N6.K_b,N6.InjStart,N6.InjDur,N6.Tau],
        [N6.DemandVar(N6.sel1621),N6.PipeClose(N6.sel1621)*100,N6.K_b(N6.sel1621),N6.InjStart(N6.sel1621),N6.InjDur(N6.sel1621),N6.Tau(N6.sel1621)],
        [N6.DemandVar(N6.sel0522),N6.PipeClose(N6.sel0522)*100,N6.K_b(N6.sel0522),N6.InjStart(N6.sel0522),N6.InjDur(N6.sel0522),N6.Tau(N6.sel0522)],
        [N6.DemandVar(N6.sel0440),N6.PipeClose(N6.sel0440)*100,N6.K_b(N6.sel0440),N6.InjStart(N6.sel0440),N6.InjDur(N6.sel0440),N6.Tau(N6.sel0440)],
        [N6.DemandVar,N6.PipeClose*100,N6.K_b,N6.InjStart,N6.InjDur,N6.Tau],
        [N6.DemandVar(N6.sel1621),N6.PipeClose(N6.sel1621)*100,N6.K_b(N6.sel1621),N6.InjStart(N6.sel1621),N6.InjDur(N6.sel1621),N6.Tau(N6.sel1621)],
        [N6.DemandVar(N6.sel0522),N6.PipeClose(N6.sel0522)*100,N6.K_b(N6.sel0522),N6.InjStart(N6.sel0522),N6.InjDur(N6.sel0522),N6.Tau(N6.sel0522)],
        [N6.DemandVar(N6.sel0440),N6.PipeClose(N6.sel0440)*100,N6.K_b(N6.sel0440),N6.InjStart(N6.sel0440),N6.InjDur(N6.sel0440),N6.Tau(N6.sel0440)],
        };
    
    VARNAMES = {
        {'$\sigma$','$\kappa$','$K_b$','$t^0_{inj}$','$\Delta t_{inj}$','$r_{inj}$','$a_{inj}$'}
        {'$\sigma$','$\kappa$','$K_b$','$t^0_{inj}$','$\Delta t_{inj}$','$r_{inj}$','$a_{inj}$'}
        {'$\sigma$','$\kappa$','$K_b$','$t^0_{inj}$','$\Delta t_{inj}$','$r_{inj}$','$a_{inj}$'}
        {'$\sigma$','$\kappa$','$K_b$','$t^0_{inj}$','$\Delta t_{inj}$','$r_{inj}$','$a_{inj}$'}
        {'$\sigma$','$\kappa$','$K_b$','$t^0_{inj}$','$\Delta t_{inj}$','$r_{inj}$'}
        {'$\sigma$','$\kappa$','$K_b$','$t^0_{inj}$','$\Delta t_{inj}$','$r_{inj}$'}
        {'$\sigma$','$\kappa$','$K_b$','$t^0_{inj}$','$\Delta t_{inj}$','$r_{inj}$'}
        {'$\sigma$','$\kappa$','$K_b$','$t^0_{inj}$','$\Delta t_{inj}$','$r_{inj}$'}
        {'$\sigma$','$\kappa$','$K_b$','$t^0_{inj}$','$\Delta t_{inj}$','$r_{inj}$'}
        {'$\sigma$','$\kappa$','$K_b$','$t^0_{inj}$','$\Delta t_{inj}$','$r_{inj}$'}
        {'$\sigma$','$\kappa$','$K_b$','$t^0_{inj}$','$\Delta t_{inj}$','$r_{inj}$'}
        {'$\sigma$','$\kappa$','$K_b$','$t^0_{inj}$','$\Delta t_{inj}$','$r_{inj}$'}
        };
    
    TITLES = {
        {{'Demand','Model'},{'Iso. Valve','Closure'},{'Reaction','Coefficient'},{'Injection','Start'},{'Injection','Duration'},{'Injection','Rate'},{'Injection','Location'}}
        {{'Demand','Model'},{'Iso. Valve','Closure'},{'Reaction','Coefficient'},{'Injection','Start'},{'Injection','Duration'},{'Injection','Rate'},{'Injection','Location'}}
        {{'Demand','Model'},{'Iso. Valve','Closure'},{'Reaction','Coefficient'},{'Injection','Start'},{'Injection','Duration'},{'Injection','Rate'},{'Injection','Location'}}
        {{'Demand','Model'},{'Iso. Valve','Closure'},{'Reaction','Coefficient'},{'Injection','Start'},{'Injection','Duration'},{'Injection','Rate'},{'Injection','Location'}}
        {{'Demand','Model'},{'Iso. Valve','Closure'},{'Reaction','Coefficient'},{'Injection','Start'},{'Injection','Duration'},{'Injection','Rate'}}
        {{'Demand','Model'},{'Iso. Valve','Closure'},{'Reaction','Coefficient'},{'Injection','Start'},{'Injection','Duration'},{'Injection','Rate'}}
        {{'Demand','Model'},{'Iso. Valve','Closure'},{'Reaction','Coefficient'},{'Injection','Start'},{'Injection','Duration'},{'Injection','Rate'}}
        {{'Demand','Model'},{'Iso. Valve','Closure'},{'Reaction','Coefficient'},{'Injection','Start'},{'Injection','Duration'},{'Injection','Rate'}}
        {{'Demand','Model'},{'Iso. Valve','Closure'},{'Reaction','Coefficient'},{'Injection','Start'},{'Injection','Duration'},{'Injection','Rate'}}
        {{'Demand','Model'},{'Iso. Valve','Closure'},{'Reaction','Coefficient'},{'Injection','Start'},{'Injection','Duration'},{'Injection','Rate'}}
        {{'Demand','Model'},{'Iso. Valve','Closure'},{'Reaction','Coefficient'},{'Injection','Start'},{'Injection','Duration'},{'Injection','Rate'}}
        {{'Demand','Model'},{'Iso. Valve','Closure'},{'Reaction','Coefficient'},{'Injection','Start'},{'Injection','Duration'},{'Injection','Rate'}}
        };
    
    STATS = {
        'mean'
        'mean'
        'mean'
        'mean'
        'mean'
        'mean'
        'mean'
        'mean'
        'mean'
        'mean'
        'mean'
        'mean'
        };
    
    YLABEL = {
        'impact (km or 1000ppl)'
        'impact (km or 1000ppl)'
        'impact (km or 1000ppl)'
        'impact (km or 1000ppl)'
        '$EC$ (km)'
        '$EC$ (km)'
        '$EC$ (km)'
        '$EC$ (km)'
        '$uEC$ (km)'
        '$uEC$ (km)'
        '$uEC$ (km)'
        '$uEC$ (km)'
        };
    
    LEGEND = {
        {'$EC$'}
        {'$EC$','$uEC$'}
        {'$EC$','$uEC$','$PI$'}
        {'$EC$','$uEC$','$PI$','$uPI$'}
        {'All'}
        {'All','N6-3323'}
        {'All','N6-3323','N6-188'}
        {'All','N6-3323','N6-188','N6-1718'}
        {'All'}
        {'All','N6-3323'}
        {'All','N6-3323','N6-188'}
        {'All','N6-3323','N6-188','N6-1718'}
        };
    
    PREFIX = 'Net6_rel_';
    
    do_plot_rel()
    %%
    
    N6.nzdEC = zeros(1656,1);
    N6.nzdUEC = N6.nzdEC;
    for i = 1:1656
        sel = N6.InjLocOrig==i-1;
        N6.nzdEC(i) = mean(mean(N6.EC(sel,:)))/N6.meanEC;
        N6.nzdUEC(i) = mean(N6.UEC(sel))/1000;
    end
    
    f = figure(3); clf();
    f.PaperOrientation = 'landscape';
    f.Units = 'inches';
    dx = 6.5; dy = 4.5;
    f.PaperSize = [dx dy];
    f.Position = [2 2 dx dy];
    
    patch(N6.lnkcrdx,N6.lnkcrdy,[1,1,1],'EdgeColor',[.8,.8,.8],'LineWidth',0.25);
    hold all;
    % scatter(nzdcrd(:,1),nzdcrd(:,2),22+ceil(nzdEC/2.5),[0.8,0.8,0.8]);
    %scatter(nzdcrd(:,1),nzdcrd(:,2),80,nzdEC,'filled');
    scatter(N6.nzdcrd(:,1),N6.nzdcrd(:,2),5+10*N6.nzdEC,N6.nzdUEC,'filled');
    scatter(N6.nzdcrd([1622,523,441],1),N6.nzdcrd([1622,523,441],2),130,'rd','LineWidth',1);
    axis image;
    c = colorbar();
    c.FontSize = 10;
    c.Units = 'inches';
    c.Label.FontSize = 10;
    c.Label.Interpreter = 'latex';
    c.Label.String = 'Mean uncertain extent of contamination (km)';
    c.Label.Rotation = 90;
    set(gca(),'XTick',[],'YTick',[],'Box','off','Units','inches','XColor',[1 1 1],'YColor',[1 1 1]);
    set(gca(),'OuterPosition', [-0.25 -0.25 7 5]);
    a = axes();
    a.Units = 'inches';
    a.Position = [5 c.Position(2) 5.0000e-01 1.1000e+00];
    maxEC = max(N6.nzdEC);
    scatter([1 1 1 1 1],[1 2 3 4 5],[5+0.01*10*maxEC, 5+0.05*10*maxEC, 5+0.2*10*maxEC, 5+0.5*10*maxEC, 5+10*maxEC],'k')
    a.YTick = [1 2 3 4 5];
    a.YTickLabel = {num2str(0.01*maxEC*N6.meanEC/1000,'%.0f'), num2str(0.05*maxEC*N6.meanEC/1000,'%.0f'), num2str(0.2*maxEC*N6.meanEC/1000,'%.0f'), num2str(0.5*maxEC*N6.meanEC/1000,'%.0f'), num2str(maxEC*N6.meanEC/1000,'%.0f')};
    yl = ylabel(a,{'Mean extent of','contam. (km)'});
    yl.Interpreter = 'latex';
    yl.FontSize = 10;
    a.XTick = [];
    a.XColor = 'w';
    
    x = N6.nzdcrd(:,1);
    y = N6.nzdcrd(:,2);
    names = N6.nzdnodes;
    EC = N6.nzdEC;
    uEC = N6.nzdUEC;
    T = table(x,y,EC,uEC,'RowNames',names);
    writetable(T,['graphics/',PREFIX,'map.dat'],'WriteRowNames',true);
    print(f, ['graphics/',PREFIX,'map.pdf'], '-dpdf', '-r300','-loose', '-painters');
    
    %% Plot KL relative impact plots
    
    KL.meanEC = mean(mean(KL.EC));
    KL.meanUEC = mean(mean(KL.UEC));
    KL.meanPI = mean(mean(KL.PI));
    KL.meanUPI = mean(mean(KL.UPI));
    KL.sel000 = KL.InjLocOrig == 0;
    KL.sel227 = KL.InjLocOrig == 227;
    KL.sel156 = KL.InjLocOrig == 156;
    
    KL.meanEC0 = mean(mean(KL.EC(KL.sel000,:)));
    KL.meanUEC0 = mean(mean(KL.UEC(KL.sel000,:)));
    KL.meanEC227 = mean(mean(KL.EC(KL.sel227,:)));
    KL.meanUEC227 = mean(mean(KL.UEC(KL.sel227,:)));
    KL.meanEC156 = mean(mean(KL.EC(KL.sel156,:)));
    KL.meanUEC156 = mean(mean(KL.UEC(KL.sel156,:)));
    
    Y = {
        KL.EC./1000 %KL.meanEC,
        KL.UEC./1000 %KL.meanUEC,
        KL.PI./1000 %KL.meanPI,
        KL.UPI./1000 %KL.meanUPI
        KL.EC./1000 %KL.meanEC,
        KL.EC(KL.sel000,:)./1000 %KL.meanEC0,
        KL.EC(KL.sel227,:)./1000 %KL.meanEC227,
        KL.EC(KL.sel156,:)./1000 %KL.meanEC156,
        KL.UEC./1000 %KL.meanEC,
        KL.UEC(KL.sel000,:)./1000 %KL.meanUEC0,
        KL.UEC(KL.sel227,:)./1000 %KL.meanUEC227,
        KL.UEC(KL.sel156,:)./1000 %KL.meanUEC156,
        };
    
    GROUP = {
        [KL.DemandVar,KL.PipeClose*100,KL.K_b,KL.InjStart,KL.InjDur,KL.Tau,KL.InjLoc],
        [KL.DemandVar,KL.PipeClose*100,KL.K_b,KL.InjStart,KL.InjDur,KL.Tau,KL.InjLoc],
        [KL.DemandVar,KL.PipeClose*100,KL.K_b,KL.InjStart,KL.InjDur,KL.Tau,KL.InjLoc],
        [KL.DemandVar,KL.PipeClose*100,KL.K_b,KL.InjStart,KL.InjDur,KL.Tau,KL.InjLoc],
        [KL.DemandVar,KL.PipeClose*100,KL.K_b,KL.InjStart,KL.InjDur,KL.Tau],
        [KL.DemandVar(KL.sel000),KL.PipeClose(KL.sel000)*100,KL.K_b(KL.sel000),KL.InjStart(KL.sel000),KL.InjDur(KL.sel000),KL.Tau(KL.sel000)],
        [KL.DemandVar(KL.sel227),KL.PipeClose(KL.sel227)*100,KL.K_b(KL.sel227),KL.InjStart(KL.sel227),KL.InjDur(KL.sel227),KL.Tau(KL.sel227)],
        [KL.DemandVar(KL.sel156),KL.PipeClose(KL.sel156)*100,KL.K_b(KL.sel156),KL.InjStart(KL.sel156),KL.InjDur(KL.sel156),KL.Tau(KL.sel156)],
        [KL.DemandVar,KL.PipeClose*100,KL.K_b,KL.InjStart,KL.InjDur,KL.Tau],
        [KL.DemandVar(KL.sel000),KL.PipeClose(KL.sel000)*100,KL.K_b(KL.sel000),KL.InjStart(KL.sel000),KL.InjDur(KL.sel000),KL.Tau(KL.sel000)],
        [KL.DemandVar(KL.sel227),KL.PipeClose(KL.sel227)*100,KL.K_b(KL.sel227),KL.InjStart(KL.sel227),KL.InjDur(KL.sel227),KL.Tau(KL.sel227)],
        [KL.DemandVar(KL.sel156),KL.PipeClose(KL.sel156)*100,KL.K_b(KL.sel156),KL.InjStart(KL.sel156),KL.InjDur(KL.sel156),KL.Tau(KL.sel156)],
        };
    
    VARNAMES = {
        {'$\sigma$','$\kappa$','$K_b$','$t^0_{inj}$','$\Delta t_{inj}$','$r_{inj}$','$a_{inj}$'}
        {'$\sigma$','$\kappa$','$K_b$','$t^0_{inj}$','$\Delta t_{inj}$','$r_{inj}$','$a_{inj}$'}
        {'$\sigma$','$\kappa$','$K_b$','$t^0_{inj}$','$\Delta t_{inj}$','$r_{inj}$','$a_{inj}$'}
        {'$\sigma$','$\kappa$','$K_b$','$t^0_{inj}$','$\Delta t_{inj}$','$r_{inj}$','$a_{inj}$'}
        {'$\sigma$','$\kappa$','$K_b$','$t^0_{inj}$','$\Delta t_{inj}$','$r_{inj}$'}
        {'$\sigma$','$\kappa$','$K_b$','$t^0_{inj}$','$\Delta t_{inj}$','$r_{inj}$'}
        {'$\sigma$','$\kappa$','$K_b$','$t^0_{inj}$','$\Delta t_{inj}$','$r_{inj}$'}
        {'$\sigma$','$\kappa$','$K_b$','$t^0_{inj}$','$\Delta t_{inj}$','$r_{inj}$'}
        {'$\sigma$','$\kappa$','$K_b$','$t^0_{inj}$','$\Delta t_{inj}$','$r_{inj}$'}
        {'$\sigma$','$\kappa$','$K_b$','$t^0_{inj}$','$\Delta t_{inj}$','$r_{inj}$'}
        {'$\sigma$','$\kappa$','$K_b$','$t^0_{inj}$','$\Delta t_{inj}$','$r_{inj}$'}
        {'$\sigma$','$\kappa$','$K_b$','$t^0_{inj}$','$\Delta t_{inj}$','$r_{inj}$'}
        {'$\sigma$','$\kappa$','$K_b$','$t^0_{inj}$','$\Delta t_{inj}$','$r_{inj}$'}
        {'$\sigma$','$\kappa$','$K_b$','$t^0_{inj}$','$\Delta t_{inj}$','$r_{inj}$'}
        {'$\sigma$','$\kappa$','$K_b$','$t^0_{inj}$','$\Delta t_{inj}$','$r_{inj}$'}
        {'$\sigma$','$\kappa$','$K_b$','$t^0_{inj}$','$\Delta t_{inj}$','$r_{inj}$'}
        };
    
    STATS = {
        'mean'
        'mean'
        'mean'
        'mean'
        'mean'
        'mean'
        'mean'
        'mean'
        'mean'
        'mean'
        'mean'
        'mean'
        };
    
    YLABEL = {
        'impact (km or 1000ppl)'
        'impact (km or 1000ppl)'
        'impact (km or 1000ppl)'
        'impact (km or 1000ppl)'
        '$EC$ (km)'
        '$EC$ (km)'
        '$EC$ (km)'
        '$EC$ (km)'
        '$uEC$ (km)'
        '$uEC$ (km)'
        '$uEC$ (km)'
        '$uEC$ (km)'
        };
    
    LEGEND = {
        {'$EC$'}
        {'$EC$','$uEC$'}
        {'$EC$','$uEC$','$PI$'}
        {'$EC$','$uEC$','$PI$','$uPI$'}
        {'All'}
        {'All','KL-1'}
        {'All','KL-1','KL-326'}
        {'All','KL-1','KL-326','KL-1427'}
        {'All'}
        {'All','KL-1'}
        {'All','KL-1','KL-326'}
        {'All','KL-1','KL-326','KL-1427'}
        };
    
    PREFIX = 'KL_rel_';
    
    do_plot_rel()
    %%
    
    KL.nzdEC = zeros(624,1);
    KL.nzdUEC = KL.nzdEC;
    for i = 1:624
        sel = KL.InjLocOrig==i-1;
        KL.nzdEC(i) = mean(mean(KL.EC(sel,:)))/KL.meanEC;
        KL.nzdUEC(i) = mean(KL.UEC(sel))/1000;
    end
      
    f = figure(2); clf();
    f.PaperOrientation = 'landscape';
    f.Units = 'inches';
    dx = 6.5; dy = 4.5;
    f.PaperSize = [dx dy];
    f.Position = [5 5 dx dy];
    
    patch(KL.lnkcrdx,KL.lnkcrdy,[1,1,1],'EdgeColor',[.8,.8,.8],'LineWidth',0.25);
    hold all;
    % scatter(nzdcrd(:,1),nzdcrd(:,2),22+ceil(nzdEC/2.5),[0.8,0.8,0.8]);
    %scatter(nzdcrd(:,1),nzdcrd(:,2),80,nzdEC,'filled');
    scatter(KL.nzdcrd(:,1),KL.nzdcrd(:,2),5+30*KL.nzdEC,KL.nzdUEC,'filled');
    scatter(KL.nzdcrd([1,228,157],1),KL.nzdcrd([1,228,157],2),130,'rd','LineWidth',1);
    axis image;
    c = colorbar();
    c.Units = 'inches';
    c.FontSize = 10;
    c.Label.FontSize = 10;
    c.Label.Interpreter = 'latex';
    c.Label.String = 'Mean uncertain extent of contamination (km)';
    c.Label.Rotation = 90;
    a1 = gca();
    set(gca(),'XTick',[],'YTick',[],'Box','off','Units','inches','XColor',[1 1 1],'YColor',[1 1 1]);
    set(gca(),'OuterPosition', [-0.25 -0.25 7 5]);
    a = axes();
    c.Position = [5.583 c.Position(2) c.Position(3) c.Position(4)];
    a1.Position = [-0.5 a1.Position(2) a1.Position(3) a1.Position(4)];
    a.Units = 'inches';
    a.Position = [5 c.Position(2) 5.0000e-01 1.1000e+00];
    maxEC = max(KL.nzdEC);
    scatter([1 1 1 1 1],[1 2 3 4 5],[5+0.01*30*maxEC, 5+0.05*30*maxEC, 5+0.2*30*maxEC, 5+0.5*30*maxEC, 5+30*maxEC],'k')
    a.YTick = [1 2 3 4 5];
    a.YTickLabel = {num2str(0.01*maxEC*KL.meanEC/1000,'%.0f'), num2str(0.05*maxEC*KL.meanEC/1000,'%.0f'), num2str(0.2*maxEC*KL.meanEC/1000,'%.0f'), num2str(0.5*maxEC*KL.meanEC/1000,'%.0f'), num2str(maxEC*KL.meanEC/1000,'%.0f')};
    yl = ylabel(a,{'Mean extent of','contam. (km)'});
    yl.Interpreter = 'latex';
    yl.FontSize = 10;
    a.XTick = [];
    a.XColor = 'w';
    x = KL.nzdcrd(:,1);
    y = KL.nzdcrd(:,2);
    indices = KL.indices;
    EC = KL.nzdEC;
    uEC = KL.nzdUEC;
    T = table(indices,x,y,EC,uEC);
    writetable(T,['graphics/',PREFIX,'map.dat']);
    print(f, ['graphics/',PREFIX,'map.pdf'], '-dpdf', '-r300','-loose', '-painters');
    
    
    %% Helper function
    function do_plot_rel()
        
        for j = 1:length(YLABEL)
            
            if j <= 6
                nmix = 4;
            else
                nmix = 4;
            end
            if mod(j-1,nmix) ~= 0,
                f = figure(2);
                clf;
                mep = maineffectsplot(Y{j}, GROUP{j}, 'varnames', VARNAMES{j}, 'statistics', STATS{j});
            else
                f = figure(1);
                clf;
                mep = maineffectsplot(Y{j}, GROUP{j}, 'varnames', VARNAMES{j}, 'statistics', STATS{j});
                f1 = f;
                mep1 = mep;
            end
            
            f.PaperOrientation = 'landscape';
            f.Units = 'inches';
            dx = 6.5; dy = 2.0;
            nc = length(mep.Children);
            f.PaperSize = [dx dy];
            f.PaperPosition = [-0.1 0 dx dy];
            f.Position = [5 5 dx dy];
            for i = 1:nc
                ax = mep.Children(i);
                ax.Units = 'inches';
                ax.Position = [dx - (i+1)*dx/(nc+1)*0.9 + 0.1*dx/(nc+1) 0.5 0.9*0.8*dx/(nc+1) 1.125];
                set(ax,'TickLabelInterpreter','latex','FontSize',10);
                set(ax,'XTickLabelRotation',90);
                xl = ax.XLabel;
                set(xl,'Interpreter','latex','FontSize',10);
                xl.Units = 'inches';
                p = xl.Position;
                xl.Position = [p(1) -1/3 0];
                grid(ax,'on')
                ax.Children(1).LineWidth = 1;
                ttl = title(mep1.Children(i),TITLES{j}{nc-i+1});
                ttl.FontName = 'Times';
                if mod(j-1,nmix) ~= 0,
                    ax2 = mep1.Children(i);
                    myline = ax.Children(1);
                    myline.Parent = mep1.Children(i);
                    if mod(j-1,nmix) == 1
                        myline.Color = [7.4100e-01, 2.4700e-01, 0];
                        myline.LineStyle = '-';
                        myline.Marker = 'o';
                    elseif mod(j-1,nmix) == 2
                        myline.Color = [7.4100e-01, 2.4700e-01, 7.4100e-01];
                        myline.LineStyle = '-';
                        myline.Marker = '+';
                    else
                        myline.Color = [2.4700e-01, 7.4100e-01, 2.4700e-01];
                        myline.LineStyle = '-';
                        myline.Marker = 'x';
                    end
                    if ax.YLim(2) > ax2.YLim(2),
                        ax2.YLim(2) = ax.YLim(2);
                        ax2.YTickMode = 'auto';
                        if i == nc
                            ax2.YTickLabelMode = 'auto';
                        end
                    end
                    if ax.YLim(1) < ax2.YLim(1),
                        ax2.YLim(1) = ax.YLim(1);
                        ax2.YTickMode = 'auto';
                        if i == nc
                            ax2.YTickLabelMode = 'auto';
                        end
                    end
                else
                    myline = ax.Children(1);
                    myline.LineStyle = '-';
                    myline.Marker = 's';
                end
            end;
            if j <= 4
                set(mep1.Children(1),'XTick',[0.5,500.5,1000.5,1500.5],'XTickLabels',{'0','500','1000','1500'})
                mep1.Children(1).Children(1).LineStyle = 'none';
                mep1.Children(1).Children(1).Marker = '.';
                if mod(j-1,nmix) ~= 0,
                    mep1.Children(1).Children(1+mod(j-1,nmix)).LineStyle = 'none';
                    mep1.Children(1).Children(1+mod(j-1,nmix)).Marker = '.';
                end
            end
            yl = ylabel(mep1.Children(nc),YLABEL{j},'Interpreter','latex');
            yl.Units = 'inches';
            fff = figure(1);
            if true
                 cax = fff.Children(nc);
                 RowNames = cell(1,1+length(cax.Children));
                 RowNames{1,1} = 'Levels';
                 ticks = get(cax,'XTickLabels');
                 DemandModel = zeros(1+length(cax.Children),length(ticks));
                 for it = 1:length(ticks)
                     DemandModel(1,it) = str2double(ticks(it));
                 end
                 for ir = 1:length(cax.Children);
                     RowNames{1,ir+1} = LEGEND{j}{end+1-ir};
                     YData = cax.Children(ir).YData;
                     DemandModel(ir+1,:) = YData(:);
                 end
                 
                 cax = fff.Children(nc-1);
                 ticks = get(cax,'XTickLabels');
                 IsoValveClosure = zeros(1+length(cax.Children),length(ticks));
                 for it = 1:length(ticks)
                     IsoValveClosure(1,it) = str2double(ticks(it));
                 end
                 for ir = 1:length(cax.Children);
                     YData = cax.Children(ir).YData;
                     IsoValveClosure(ir+1,:) = YData(:);
                 end
                 
                 cax = fff.Children(nc-2);
                 ticks = get(cax,'XTickLabels');
                 ReaxCoeff = zeros(1+length(cax.Children),length(ticks));
                 for it = 1:length(ticks)
                     ReaxCoeff(1,it) = str2double(ticks(it));
                 end
                 for ir = 1:length(cax.Children);
                     YData = cax.Children(ir).YData;
                     ReaxCoeff(ir+1,:) = YData(:);
                 end

                 cax = fff.Children(nc-3);
                 ticks = get(cax,'XTickLabels');
                 InjStart = zeros(1+length(cax.Children),length(ticks));
                 for it = 1:length(ticks)
                     InjStart(1,it) = str2double(ticks(it));
                 end
                 for ir = 1:length(cax.Children);
                     YData = cax.Children(ir).YData;
                     InjStart(ir+1,:) = YData(:);
                 end

                 cax = fff.Children(nc-4);
                 ticks = get(cax,'XTickLabels');
                 InjDur = zeros(1+length(cax.Children),length(ticks));
                 for it = 1:length(ticks)
                     InjDur(1,it) = str2double(ticks(it));
                 end
                 for ir = 1:length(cax.Children);
                     YData = cax.Children(ir).YData;
                     InjDur(ir+1,:) = YData(:);
                 end

                 cax = fff.Children(nc-5);
                 ticks = get(cax,'XTickLabels');
                 InjRate = zeros(1+length(cax.Children),length(ticks));
                 for it = 1:length(ticks)
                     InjRate(1,it) = str2double(ticks(it));
                 end
                 for ir = 1:length(cax.Children);
                     YData = cax.Children(ir).YData;
                     InjRate(ir+1,:) = YData(:);
                 end

                 if nc > 6
                     cax = fff.Children(nc-6);
                     ticks = get(cax.Children(1),'XData');
                     InjLocSorted = zeros(1+length(cax.Children),length(ticks));
                     for it = 1:length(ticks)
                         InjLocSorted(1,it) = str2double(ticks(it));
                     end
                     for ir = 1:length(cax.Children);
                         YData = cax.Children(ir).YData;
                         InjLocSorted(ir+1,:) = YData(:);
                     end
                     
                     T = table(DemandModel,IsoValveClosure,ReaxCoeff,InjStart,InjDur,InjRate,InjLocSorted,'RowNames',RowNames);
                     writetable(T,['graphics/',PREFIX,num2str(j,'%.2d'),'.dat'],'WriteRowNames',true);
                 else
                     T = table(DemandModel,IsoValveClosure,ReaxCoeff,InjStart,InjDur,InjRate,'RowNames',RowNames);
                     writetable(T,['graphics/',PREFIX,num2str(j,'%.2d'),'.dat'],'WriteRowNames',true);
                 end
            end
            aaa = fff.Children(nc);
            lg = legend(aaa,LEGEND{j});
            lg.Units = 'inches';
            lg.Box = 'off';
            lg.Interpreter = 'latex';
            lg.FontSize = 8;
            lg.Position = [dx - dx/(nc+1)*0.9 + 0.15*dx/(nc+1) 0.5 0.8*0.8*dx/(nc+1) 1.45];
            print(f1, ['graphics/',PREFIX,num2str(j,'%.2d'),'.pdf'], '-loose', '-dpdf', '-r300','-painters');
            delete(lg);
        end
    end
end