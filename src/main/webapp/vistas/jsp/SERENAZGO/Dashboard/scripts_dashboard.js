// Objeto que contiene las etiquetas para días, semanas y meses
const etiquetas = {
  dia: ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo'],
  semana: ['Semana 1', 'Semana 2', 'Semana 3', 'Semana 4'],
  mes: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre']
};

const tiposIncidencia = {
  incidencias : ['Hurto','Discriminación','Disturbios','Vandalismo','Drogas','Extorsión','Secuestro','Acoso','Fraudes','Violación','Homicidio','Ruido','Otros']
  
}

const urbanizaciones = {
  urbanizacion : ['San Miguelito','Udima','Pershing','Miramar','San Luis','Maranga','German Astete','Pando']
}

// Función para actualizar el gráfico de área según el periodo seleccionado
function actualizarDatosAreaChart(selectedPeriod) {
  let newData = [];
  let newData2 = [];
  // Generar datos de prueba según el periodo seleccionado
  if (selectedPeriod === 'mes') {
    newData = [30, 40, 45, 55, 60,30, 40, 45, 55, 60,30, 40]; // Datos para un mes
    newData2 = [10, 20, 30, 40, 50,10, 20, 30, 40, 50,10, 20];
    areaChart.updateOptions({ xaxis: { categories: etiquetas.mes } }); // Actualizar etiquetas del eje X
  } else if (selectedPeriod === 'semana') {
    newData = [8, 12, 10, 15]; // Datos para una semana
    newData2 = [2, 10, 8, 5];
    areaChart.updateOptions({ xaxis: { categories: etiquetas.semana } }); // Actualizar etiquetas del eje X
  } else if (selectedPeriod === 'dia') {
    newData = [2, 3, 5, 4, 6,2, 3]; // Datos para un día
    newData2 = [0, 1, 2, 3, 4,2, 3];
    areaChart.updateOptions({ xaxis: { categories: etiquetas.dia } }); // Actualizar etiquetas del eje X
  }
  // Actualizar datos de la gráfica de área
  areaChart.updateSeries([
    { name: 'Casos resueltos', data: newData },
    { name: 'Casos pendientes', data: newData2 }
  ]);
}

// Función para actualizar el gráfico de barras 2 según el periodo seleccionado
function actualizarDatosBarChart2(selectedPeriod) {
  let arregloUrba = [];
  // Generar datos de prueba según el periodo seleccionado
  if (selectedPeriod === 'mes') {
    arregloUrba = [50, 60,70,40,35,40,50, 60];
    barChart2.updateOptions({ xaxis: { categories: etiquetas.mes } }); // Actualizar etiquetas del eje X
  } else if (selectedPeriod === 'semana') {
    arregloUrba = [30, 20,10,30,20,15,25, 30,];
    barChart2.updateOptions({ xaxis: { categories: etiquetas.semana } }); // Actualizar etiquetas del eje X
  } else if (selectedPeriod === 'dia') {
    arregloUrba = [20, 10,8,13,10,13,13, 15];
    barChart2.updateOptions({ xaxis: { categories: etiquetas.dia } }); // Actualizar etiquetas del eje X
  }
  // Actualizar datos de la gráfica de barras 2
  barChart2.updateSeries([{ data: arregloUrba }]);
}

// Función para actualizar el gráfico de pastel según el periodo seleccionado
function actualizarDatosPieChart(selectedPeriod) {
  let arreglopastel = [];
  // Generar datos de prueba según el periodo seleccionado
  if (selectedPeriod === 'mes') {
    arreglopastel = [40,35,25];
  } else if (selectedPeriod === 'semana') {
    arreglopastel = [60,30,10];
  } else if (selectedPeriod === 'dia') {
    arreglopastel = [10,40,50];
  }
  // Actualizar datos de la gráfica de pastel
  pieChart.updateSeries(arreglopastel);
}

// Función para actualizar el gráfico de barras según el periodo seleccionado
function actualizarDatosBarChart(selectedPeriod) {
  let listabarra = [];
  // Generar datos de prueba según el periodo seleccionado
  if (selectedPeriod === 'mes') {
    listabarra = [10, 20, 30, 40, 50,10, 20, 30, 40, 50,10, 20,25];
    barChart.updateOptions({ xaxis: { categories: tiposIncidencia.incidencias } }); 
  } else if (selectedPeriod === 'semana') {
    listabarra = [8, 18, 25, 20, 25,9, 10, 20, 20, 28,10, 15,18];
    barChart.updateOptions({ xaxis: { categories: tiposIncidencia.incidencias } }); 
  } else if (selectedPeriod === 'dia') {
    listabarra = [2,14, 10, 2, 12,5, 7, 17, 15, 10,8, 13,11];
    barChart.updateOptions({ xaxis: { categories: tiposIncidencia.incidencias } });
  }
  // Actualizar datos de la gráfica de barras
  barChart.updateSeries([{ data: listabarra }]);
}

// ---------- CHARTS ----------

// BAR CHART
const barChartOptions = {
  series: [
    {
      data:[10, 20, 30, 40, 50,10, 20, 30, 40, 50,10, 20,25] ,
      name: 'Tipos incidencias de la semana',
    },
  ],
  chart: {
    type: 'bar',
    background: 'transparent',
    height: 350,
    toolbar: {
      show: false,
    },
  },
  colors: ['#2962ff', '#d50000', '#2e7d32', '#ff6d00', '#583cb3'],
  plotOptions: {
    bar: {
      distributed: true,
      borderRadius: 4,
      horizontal: false,
      columnWidth: '40%',
    },
  },
  dataLabels: {
    enabled: false,
  },
  fill: {
    opacity: 1,
  },
  grid: {
    borderColor: '#55596e',
    yaxis: {
      lines: {
        show: true,
      },
    },
    xaxis: {
      lines: {
        show: true,
      },
    },
  },
  legend: {
    labels: {
      colors: '#bfc9d4',
    },
    offsetY: 10,
  },
  xaxis: {
    categories: tiposIncidencia.incidencias, // Cambiado a tipos de incidencia por defecto
    labels: {
      style: {
        colors: '#bfc9d4',
      },
    },
    axisBorder: {
      color: '#55596e',
    },
  },
  yaxis: {
    labels: {
      style: {
        color: '#bfc9d4',
      },
    },
    axisBorder: {
      color: '#55596e',
    },
  },
};

const barChart = new ApexCharts(document.querySelector('#bar-chart'), barChartOptions);
barChart.render();

// AREA CHART
const areaChartOptions = {
  series: [
    {
      name: 'Casos resueltos',
      data: [30, 40, 45, 55, 60,30, 40, 45, 55, 60,30, 40],
    },
    {
      name: 'Casos pendientes',
      data: [10, 20, 30, 40, 50,10, 20, 30, 40, 50,10, 20],
    },
  ],
  chart: {
    type: 'area',
    background: 'transparent',
    height: 350,
    toolbar: {
      show: false,
    },
  },
  colors: ['#2962ff', '#d50000'],
  dataLabels: {
    enabled: false,
  },
  stroke: {
    curve: 'smooth',
  },
  grid: {
    borderColor: '#55596e',
    yaxis: {
      lines: {
        show: true,
      },
    },
    xaxis: {
      lines: {
        show: true,
      },
    },
  },
  legend: {
    labels: {
      colors: '#bfc9d4',
    },
    offsetY: 10,
  },
  xaxis: {
    categories: etiquetas.mes, // Cambiado a meses por defecto
    labels: {
      style: {
        colors: '#bfc9d4',
      },
    },
    axisBorder: {
      color: '#55596e',
    },
  },
  yaxis: {
    labels: {
      style: {
        color: '#bfc9d4',
      },
    },
    axisBorder: {
      color: '#55596e',
    },
  },
};

const areaChart = new ApexCharts(document.querySelector('#area-chart'), areaChartOptions);
areaChart.render();

// PIE CHART
const pieChartOptions = {
  series: [40,35,25],
  chart: {
    type: 'donut',
    background: 'transparent',
    height: 350,
  },
  colors: ['#2962ff', '#d50000', '#2e7d32'],
  labels: ['Resueltos', 'Pendientes', 'Anulados'],
  dataLabels: {
    enabled: true,
    dropShadow: {
      enabled: false,
    },
  },
  legend: {
    labels: {
      colors: '#bfc9d4',
    },
  },
};

const pieChart = new ApexCharts(document.querySelector('#pie-chart'), pieChartOptions);
pieChart.render();

// BAR CHART 2
const barChart2Options = {
  series: [
    {
      data: [50, 60,70,40,35,40,50, 60],
      name: 'Urbanizaciones',
    },
  ],
  chart: {
    type: 'bar',
    background: 'transparent',
    height: 350,
    toolbar: {
      show: false,
    },
  },
  colors: ['#2962ff', '#d50000', '#2e7d32', '#ff6d00', '#583cb3'],
  plotOptions: {
    bar: {
      distributed: true,
      borderRadius: 4,
      horizontal: false,
      columnWidth: '40%',
    },
  },
  dataLabels: {
    enabled: false,
  },
  fill: {
    opacity: 1,
  },
  grid: {
    borderColor: '#55596e',
    yaxis: {
      lines: {
        show: true,
      },
    },
    xaxis: {
      lines: {
        show: true,
      },
    },
  },
  legend: {
    labels: {
      colors: '#bfc9d4',
    },
    offsetY: 10,
  },
  xaxis: {
    categories: urbanizaciones.urbanizacion, // Cambiado a urbanizaciones por defecto
    labels: {
      style: {
        colors: '#bfc9d4',
      },
    },
    axisBorder: {
      color: '#55596e',
    },
  },
  yaxis: {
    labels: {
      style: {
        color: '#bfc9d4',
      },
    },
    axisBorder: {
      color: '#55596e',
    },
  },
};

const barChart2 = new ApexCharts(document.querySelector('#bar-chart2'), barChart2Options);
barChart2.render();

// Event listeners para los filtros

const periodSelectBarChart = document.getElementById('periodBarChart');
periodSelectBarChart.addEventListener('change', function() {
  const selectedPeriod = periodSelectBarChart.value;
  actualizarDatosBarChart(selectedPeriod);
  actualizarDatosAreaChart(selectedPeriod); // Agregar esta línea para actualizar el gráfico de área
});

const periodSelectAreaChart = document.getElementById('periodAreaChart');
periodSelectAreaChart.addEventListener('change', function() {
  const selectedPeriod = periodSelectAreaChart.value;
  actualizarDatosAreaChart(selectedPeriod);
});

const periodSelectBarChart2 = document.getElementById('periodBarChart2');
periodSelectBarChart2.addEventListener('change', function() {
  const selectedPeriod = periodSelectBarChart2.value;
  actualizarDatosBarChart2(selectedPeriod);
  
});

const periodSelectPieChart = document.getElementById('periodPieChart');
periodSelectPieChart.addEventListener('change', function() {
  const selectedPeriod = periodSelectPieChart.value;
  actualizarDatosPieChart(selectedPeriod);
  
});

// actualizarDatosAreaChart(selectedPeriod); // Agregar esta línea para actualizar el gráfico de área
// actualizarDatosAreaChart(selectedPeriod); // Agregar esta línea para actualizar el gráfico de área
