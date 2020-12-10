import Chart from 'chart.js';

const donutProgression = () => {
  const ctx = document.querySelector('#progress-bar-dashboard');

  console.log(ctx)

  if (ctx){
    console.log(ctx.dataset.done)
        console.log(ctx.dataset.todo)
    const options = {
        cutoutPercentage:80,
        legend:{
          display:false
        }
      }
    const myChart = new Chart(ctx, {
      type: 'doughnut',
      options: options,
      data: {
        labels:["done", "to do"],
        datasets:[{
          backgroundColor:[
                '#8AC926',
                'rgba(180, 180, 180, 0.2)'
          ],
          label: "Progression chart dashboard",
          data:[ctx.dataset.done, ctx.dataset.todo],
          borderWidth: 0
        }]
      }
    });

  }
}

export {donutProgression};
