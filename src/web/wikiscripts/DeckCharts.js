// ==========================================================================
// Start: Deck Charts
// Renders charts on deck articles
// Version 1.5.0
// Author: Aspallar
//
// ** Please dont edit this code directly in the wikia.
// ** Instead clone the git repository https://github.com/Aspallar/WikiLua
// <nowiki>
window.magicArena = window.magicArena || {};
window.magicArena.charts = window.magicArena.charts || (function ($) {
    /*globals google, mw, _ */
    'use strict';

    if (document.getElementById('mdw-deckcharts') === null || $('#mdw-disabled-js').attr('data-deckcharts-1-5-0'))
        return null;

    var colorPieChartId = 'mdw-cardsbycolor-chart';
    var manaCurveChartId = 'mdw-manacurve-chart';
    var typesPieChartId = 'mdw-types-chart';
    var meanCmcId = 'mdw-mean-cmc';
    var landProbabilitiesId = 'mdw-land-probabilities';
    var lastManaCurveCmc = 6; // max cmc to show on mana curve chart

    function hasColorPieChart() {
        return document.getElementById(colorPieChartId) !== null;
    }

    function hasManaCurveChart() {
        return document.getElementById(manaCurveChartId) !== null;
    }

    function hasTypesPieChart() {
        return document.getElementById(typesPieChartId) !== null;
    }

    function hasMeanConvertedManaCost() {
        return document.getElementById(meanCmcId) !== null;
    }

    function hasLandProbabilities() {
        return document.getElementById(landProbabilitiesId) !== null;
    }

    function chartColor(dataColor) {
        var colors = {
            Red: '#f28f78',
            Green: '#7dcd98',
            Blue: '#92d4f7',
            White: '#ffffd9',
            Black: '#515151',
            Multicolored: '#ffd778',
            Colorless: '#abafb0'
        };
        return colors[dataColor];
    }

    function cardTypeColor(type) {
        var colors = {
            Land: '#FFFFFF',
            Creature: '#F5F5F5',
            Artifact: '#606060',
            Enchantment: '#696969',
            Instant: '#808080',
            Sorcery: '#B0B0B0',
            Planeswalker: '#C8C8C8'
        };
        return colors[type];
    }

    var dataIndex = {
        color: 0,
        num: 1,
        cmc: 2,
        type: 0
    };

    var charts = {
        colorPie: {
            data: null,
            colors: null,
            chart: null
        },
        manaCurve: {
            data: null,
            colors: null,
            ticks: null,
            chart: null
        },
        typesPie: {
            data: null,
            colors: null,
            chart: null
        }
    };

    function drawManaCurveChart() {
        var options = {
            height: 240,
            legend: {
                position: 'top',
                maxLines: 3
            },
            bar: {
                groupWidth: '80%'
            },
            isStacked: true,
            backgroundColor: {
                fill: 'transparent'
            },
            vAxis: {
                ticks: charts.manaCurve.ticks
            },
            colors: charts.manaCurve.colors
        };
        if (charts.manaCurve.chart && charts.manaCurve.data)
            charts.manaCurve.chart.draw(charts.manaCurve.data, options);
    }

    function drawColorPieChart() {
        var options = {
            height: 240,
            colors: charts.colorPie.colors,
            pieSliceText: 'value',
            pieSliceBorderColor: 'black',
            pieSliceTextStyle: {
                color: 'black',
                bold: true
            },
            backgroundColor: {
                fill: 'transparent'
            },
            legend: {
                textStyle: {
                    color: 'black'
                }
            }
        };
        if (charts.colorPie.chart && charts.colorPie.data)
            charts.colorPie.chart.draw(charts.colorPie.data, options);
    }

    function drawTypesPieChart() {
        var options = {
            height: 240,
            colors: charts.typesPie.colors,
            pieSliceText: 'value',
            pieSliceBorderColor: 'black',
            pieSliceTextStyle: {
                color: 'black',
                bold: true
            },
            backgroundColor: {
                fill: 'transparent'
            },
            legend: {
                textStyle: {
                    color: 'black'
                },
                position: 'labeled'
            }
        };
        if (charts.typesPie.chart && charts.typesPie.data)
            charts.typesPie.chart.draw(charts.typesPie.data, options);
    }

    var statistics = {
        // n choose k
        nck: function (n, k) {
            var result = 1;
            for (var kcount = 1; kcount <= k; kcount++)
                result *= (n + 1 - kcount) / kcount;
            return result;
        },
        // probability mass function, hypergeometric distribution 
        pmf: function (N, m, n, k) {
            return (this.nck(m, k) * this.nck(N - m, n - k)) / this.nck(N, n);
        }
    };

    function findCardInData(data, name) {
        for (var k = 0, l = data.length; k < l; k++) {
            if (data[k].name === name)
                return data[k];
        }
        return null;
    }

    function findCard(deckData, sideboardData, name) {
        var card = findCardInData(deckData, name) || findCardInData(sideboardData, name);
        return card ? card : null;
    }

    function cmcClass(cmc) {
        return cmc >= lastManaCurveCmc ? 'mdw-cmc-max' : 'mdw-cmc-' + cmc;
    }

    function colorClass(color) {
        return 'mdw-card-' + color;
    }

    function clearHighlight() {
        $('.mdw-card-highlight').removeClass('mdw-card-highlight');
    }

    var selectedManaCurveRow = null;

    function clearManaCurveSelection() {
        selectedManaCurveRow = null;
        charts.manaCurve.chart.setSelection([]);
    }

    function onManaCurveSelect() {
        clearHighlight();
        charts.colorPie.chart.setSelection([]);
        var selected = charts.manaCurve.chart.getSelection();
        if (selected.length > 0 && selected[0].column !== null) {
            var row = selected[0].row;
            if (row !== selectedManaCurveRow) {
                $('.' + cmcClass(row)).addClass('mdw-card-highlight');
                charts.manaCurve.chart.setSelection([{row:row, column:null}]);
                selectedManaCurveRow = row;
            } else {
                clearManaCurveSelection();
            }
        }
    }

    function onColorPieSelect() {
        clearHighlight();
        var selected = charts.colorPie.chart.getSelection();
        if (selected.length > 0) {
            var color = charts.colorPie.data.getValue(selected[0].row, 0);
            $('.' + colorClass(color)).addClass('mdw-card-highlight');
            clearManaCurveSelection();
        }
    }

    function addHighlightClasses(deckData, sideboardData) {
        $('div.div-col.columns.column-count.column-count-2 span.card-image-tooltip').each(function () {
            var cardElement = $(this);
            var name = cardElement.text();
            var card = findCard(deckData, sideboardData, name);
            if (card !== null) {
                if (typeof card.cmc === 'number')  
                    cardElement.addClass(cmcClass(card.cmc));
                if (typeof card.adjustedColor === 'string' && card.adjustedColor.length > 0)
                    cardElement.addClass(colorClass(card.adjustedColor));
            }
        });
    }

    function isLand(card) {
        return $.inArray('Land', card.types) !== -1;
    }

    function adjustedColor(colors) {
        if (colors === undefined || colors.length === 0)
            return 'Colorless';
        if (colors.length > 1)
            return 'Multicolored';
        return colors[0];
    }

    function normalName(name) {
        var pos = name.indexOf('//');
        return pos === -1 ? name : name.substring(0, pos - 1);
    }

    function addCalculatedFieldsToData(cardData) {
        cardData.forEach(function (card) {
            card.name = normalName(card.name);
            card.isLand = isLand(card);
            if (!card.isLand)
                card.adjustedColor = adjustedColor(card.colors);
        });
        return cardData;
    }

    function getData(id) {
        var dataElement = document.getElementById(id);
        var cardData = [];
        if (dataElement !== null) {
            try { cardData = JSON.parse(dataElement.textContent); } catch (e) { }
            return addCalculatedFieldsToData(cardData);
        }
        return cardData;
    }

    function getChartData() {
        return getData('mdw-chartdata-pre');
    }

    function getSideboardData() {
        return getData('mdw-sideboard-data');
    }

    function hasNonLands(data) {
        return data.some(function (card) { return !card.isLand; });
    }

    function zeroedArray(size) {
        var arr = [];
        for (var k = 0; k < size; k++)
            arr.push(0);
        return arr;
    }

    function getCardTotals(cardData) {
        var totals = {
            cards: 0,
            lands: 0
        };
        for (var k = 0, l = cardData.length; k < l; k++) {
            var card = cardData[k];
            totals.cards += card.num;
            if (card.isLand)
                totals.lands += card.num;
        }
        return totals;
    }

    function landProbabilities(cardTotals) {
        var result = [];
        for (var landCount = 0; landCount <= 7; landCount++) {
            var probability = statistics.pmf(cardTotals.cards, cardTotals.lands, 7, landCount);
            result.push(probability);
        }
        return result;
    }

    function meanConvertedManaCost(chartData) {
        var cmcCardCount = 0;
        var totalCmc = 0;
        for (var k = 0, l = chartData.length; k < l; k++) {
            var card = chartData[k];
            if (!card.isLand) {
                cmcCardCount += card.num;
                totalCmc += card.cmc * card.num;
            }
        }
        var mean = totalCmc / cmcCardCount;
        return mean;
    }

    function getColorOnlyData(cardData) {
        var colorData = [];
        cardData.forEach(function (card) {
            if (!card.isLand)
                colorData.push([card.adjustedColor, card.num]);
        });
        colorData.sort(function (a, b) {
            return a[dataIndex.color].localeCompare(b[dataIndex.color]);
        });
        return colorData;
    }

    function getCardTypeData(cardData) {
        var typeData = [];
        cardData.forEach(function (card) {
            card.types.forEach(function (type) {
                typeData.push([type, card.num]);
            });
        });
        typeData.sort(function (a, b) {
            return a[dataIndex.type].localeCompare(b[dataIndex.type]);
        });
        return typeData;
    }

    function sumByType(data) {
        var summedData = [];
        if (data.length === 0)
            return summedData;
        summedData.push(data[0]);
        for (var k = 1; k < data.length; k++) {
            var lastIndex = summedData.length - 1;
            if (data[k][dataIndex.type] === summedData[lastIndex][dataIndex.type])
                summedData[lastIndex][dataIndex.num] += data[k][dataIndex.num];
            else
                summedData.push(data[k]);
        }
        return summedData;
    }

    function getColorWithCostData(cardData) {
        var colorData = [];
        cardData.forEach(function (card) {
            if (!card.isLand)
                colorData.push([card.adjustedColor, card.num, card.cmc]);
        });
        // order by color then by cmc
        colorData.sort(function (a, b) {
            var colorCompare = a[dataIndex.color].localeCompare(b[dataIndex.color]);
            if (colorCompare !== 0)
                return colorCompare;
            return a[dataIndex.cmc] - b[dataIndex.cmc];
        });
        return colorData;
    }

    function sumByColor(data) {
        var summedData = [];
        if (data.length === 0)
            return summedData;
        summedData.push(data[0]);
        for (var k = 1; k < data.length; k++) {
            var lastIndex = summedData.length - 1;
            if (data[k][dataIndex.color] === summedData[lastIndex][dataIndex.color])
                summedData[lastIndex][dataIndex.num] += data[k][dataIndex.num];
            else
                summedData.push(data[k]);
        }
        return summedData;
    }

    function sumByColorAndCost(data) {
        var summedData = [];
        if (data.length === 0)
            return summedData;
        summedData.push(data[0]);
        for (var k = 1; k < data.length; k++) {
            var lastIndex = summedData.length - 1;
            if (data[k][dataIndex.color] === summedData[lastIndex][dataIndex.color] &&
                    data[k][dataIndex.cmc] === summedData[lastIndex][dataIndex.cmc])
                summedData[lastIndex][1] += data[k][1];
            else
                summedData.push(data[k]);
        }
        return summedData;
    }

    function makeLabelsForManaCurve(chartData) {
        var labels = ['Cost'];
        var k = 0;
        while (k < chartData.length) {
            var color = chartData[k++][dataIndex.color];
            labels.push(color);
            while (k < chartData.length && chartData[k][dataIndex.color] === color)
                ++k;
        }
        return labels;
    }

    function addZeroedDataSeriesForManaCurve(data, numSeries, seriesLength) {
        var labelIndex = 0;
        for (var k = 0; k < numSeries; k++) {
            var dataSeries = zeroedArray(seriesLength);
            dataSeries[labelIndex] = k.toString();
            data.push(dataSeries);
        }
        data[numSeries][labelIndex] += '+';
    }

    function fillDataForManaCurve(data, chartData, maxCmc) {
        var index = 1;
        var color = chartData[0][dataIndex.color];
        chartData.forEach(function (chartDataRow) {
            if (color !== chartDataRow[dataIndex.color]) {
                ++index;
                color = chartDataRow[dataIndex.color];
            }
            var cmc = Math.min(chartDataRow[dataIndex.cmc], maxCmc);
            data[cmc + 1][index] += chartDataRow[dataIndex.num];
        });
    }

    function nullZeroValuesInData(data, numSeries) {
        // we do this to avoid any zero values appearing in chart as a single line
        var totals = zeroedArray(numSeries);
        for (var seriesIndex = 1; seriesIndex < data.length; seriesIndex++) {
            var series = data[seriesIndex];
            for (var itemIndex = 1; itemIndex < series.length; itemIndex++) {
                totals[seriesIndex - 1] += series[itemIndex];
                if (series[itemIndex] === 0)
                    series[itemIndex] = null;
            }
        }
        return Math.max.apply(null, totals);
    }

    function getManaCurveAxisTicks(ticks, maxColumnTotal) {
        var tick = 0;
        do {
            tick += 2;
            ticks.push(tick);
        } while (tick < maxColumnTotal);
    }

    function formatDataForManaCurveChart(chartData, ticks) {
        var lastCmc = lastManaCurveCmc + 1;
        var labels = makeLabelsForManaCurve(chartData);
        var data = [labels];
        addZeroedDataSeriesForManaCurve(data, lastCmc, labels.length);
        fillDataForManaCurve(data, chartData, lastCmc - 1);
        var maxColumnTotal = nullZeroValuesInData(data, lastCmc);
        getManaCurveAxisTicks(ticks, maxColumnTotal);
        return data;
    }

    function cacheManaCurveData(data) {
        var rawData = getColorWithCostData(data);
        var summedData = sumByColorAndCost(rawData);
        var ticks = [];
        var formattedData = formatDataForManaCurveChart(summedData, ticks);

        var sectionColors = [];
        for (var k = 1; k < formattedData[0].length; k++)
            sectionColors.push(chartColor(formattedData[0][k]));

        charts.manaCurve.data = google.visualization.arrayToDataTable(formattedData);
        charts.manaCurve.colors = sectionColors;
        charts.manaCurve.ticks = ticks;
    }

    function cacheColorPieData(cardData) {
        var rawData = getColorOnlyData(cardData);
        var summedData = sumByColor(rawData);

        var dataTable = new google.visualization.DataTable();
        dataTable.addColumn('string', 'Color');
        dataTable.addColumn('number', 'Amount');
        dataTable.addRows(summedData);

        var sliceColors = [];
        summedData.forEach(function (e) {
            sliceColors.push(chartColor(e[dataIndex.color]));
        });

        charts.colorPie.data = dataTable;
        charts.colorPie.colors = sliceColors;
    }

    function cacheTypesPieData(cardData) {
        var rawData = getCardTypeData(cardData);
        var summedData = sumByType(rawData);

        var dataTable = new google.visualization.DataTable();
        dataTable.addColumn('string', 'Type');
        dataTable.addColumn('number', 'Amount');
        dataTable.addRows(summedData);

        var sliceColors = [];
        summedData.forEach(function (e) {
            sliceColors.push(cardTypeColor(e[dataIndex.type]));
        });

        charts.typesPie.data = dataTable;
        charts.typesPie.colors = sliceColors;
    }

    function createCharts() {
        var chartContainer = document.getElementById(typesPieChartId);
        if (chartContainer  !== null) {
            charts.typesPie.chart = new google.visualization.PieChart(chartContainer);
        }
        chartContainer = document.getElementById(colorPieChartId);
        if (chartContainer !== null) {
            charts.colorPie.chart = new google.visualization.PieChart(chartContainer);
            google.visualization.events.addListener(charts.colorPie.chart, 'select', onColorPieSelect);
        }
        chartContainer = document.getElementById(manaCurveChartId);
        if (chartContainer !== null) {
            charts.manaCurve.chart = new google.visualization.ColumnChart(chartContainer);
            google.visualization.events.addListener(charts.manaCurve.chart, 'select', onManaCurveSelect);
        }
    }

    function setMeanCmc(chartData) {
        var mean = meanConvertedManaCost(chartData).toFixed(2);
        $('#' + meanCmcId).text(mean);
    }

    var landProbabilityTemplate;
    function getLandProbabilityTemplate() {
        landProbabilityTemplate = $('#' + landProbabilitiesId).html();
    }

    function setLandDrawProbabilities(chartData) {
        var probabilities = landProbabilities(getCardTotals(chartData));
        var html = landProbabilityTemplate;
        for (var k = 0; k <= 7; k++) {
            var percent = (probabilities[k] * 100).toFixed(1);
            html = html.replace('[' + k + ']', percent);
        }
        $('#' + landProbabilitiesId).html(html);
    }

    function drawAllCharts() {
        if (hasColorPieChart())
            drawColorPieChart();
        if (hasManaCurveChart())
            drawManaCurveChart();
        if (hasTypesPieChart())
            drawTypesPieChart();
    }

    function setAllNonChartSections(chartData) {
        if (hasMeanConvertedManaCost())
            setMeanCmc(chartData);
        if (hasLandProbabilities())
            setLandDrawProbabilities(chartData);
    }

    function wireEvents() {
        $('.mdw-charts-more-button').click(function () {
            $('#mdw-misc-stats-contents').toggle(500);
        });
        $(window).resize(_.debounce(drawAllCharts, 150));
    }

    function changeMoreSpansToButtons() {
        $('.mdw-charts-more-button').replaceWith(function () {
            return $('<input type="button" class="mdw-charts-more-button mdw-chart-box-button" />')
                .val($(this).text());
        });
    }

    function setVisible(visible) {
        $('#mdw-deckcharts-container').toggle(visible);
        $('#mdw-deckcharts-error').toggle(!visible);
    }

    function refresh() {
        var data = getChartData();
        if (hasNonLands(data)) {
            setVisible(true);
            addHighlightClasses(data, getSideboardData());
            cacheColorPieData(data);
            cacheManaCurveData(data);
            cacheTypesPieData(data);
            drawAllCharts();
            setAllNonChartSections(data);
        } else {
            setVisible(false);
        }
    }

    function chartLibraryLoaded() {
        getLandProbabilityTemplate();
        createCharts();
        refresh();
        changeMoreSpansToButtons();
        wireEvents();
        mw.hook('magicarena.chartsready').fire();
    }

    $.getScript('https://www.gstatic.com/charts/loader.js', function () {
        google.charts.load('current', { 'packages': ['corechart'] });
        google.charts.setOnLoadCallback(chartLibraryLoaded);
    });

    return {
        refresh: refresh
    };

})(jQuery);
