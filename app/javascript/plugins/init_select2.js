import $ from 'jquery';
import 'select2';

// function definitions
const initSelect2 = () => {
  const selector2 = document.querySelector('.js-example-basic-multiple')
  if (selector2) {
    $('.js-example-basic-multiple').select2();
  };
};


export { initSelect2 };
