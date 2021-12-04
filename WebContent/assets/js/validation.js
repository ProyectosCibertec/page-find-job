const regexs = {
  inputEmail: /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/,
  phone: /^[0-9]{9}$/
}


function hasClass(element, className) {
  return element.className.indexOf(`${className}`) > -1
}

function isRegexValid(value, regex) {
  return regex && regex.test(value);
}

function showError(element) {
  element.style.border = '1px solid red';
  element.addEventListener('click', () => {
    element.style.border = "1px solid #7c7c7c";
  });
  return false;
}

function formValidation(formId, inputList, callback) {

  const form = document.getElementById(formId);
  form.addEventListener('submit', (e) => {
    e.preventDefault();

    let isValid = true;
    const params = {};

    inputList.map((e) => {
      const element = document.getElementById(e);

      if (element) {
        if (hasClass(element, 'required') && !element.value) {
          isValid = showError(element);
        }

        if (hasClass(element, 'regex') && !isRegexValid(element.value, regexs[e])) {
          isValid = showError(element);
        }

        if (hasClass(element, 'checked') && !element.checked) {
          isValid = showError(element);
        }

        params[element.getAttribute("name")] = element.value;
      }
    });

    callback(isValid, params);
  })
}
