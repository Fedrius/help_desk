console.log("JS test 2works!");

$(document).ready(function(){
  console.log("jquery test 2 works!")
  
  // const getCellValue = (tr, idx) => tr.children[idx].innerText || tr.children[idx].textContent;
  
  const getCellValue = function(tr, idx) {
    return tr.children[idx].innerText || tr.children[idx].textContent;
  }

  // const comparer = (idx, asc) => (a, b) => ((v1, v2) => 
  //     v1 !== '' && v2 !== '' && !isNaN(v1) && !isNaN(v2) ? v1 - v2 : v1.toString().localeCompare(v2)
  //     )(getCellValue(asc ? a : b, idx), getCellValue(asc ? b : a, idx));
  
  const comparer = function(idx, asc) { 
    return function(a, b) { 
      return function(v1, v2) {
        return v1 !== '' && v2 !== '' && !isNaN(v1) && !isNaN(v2) ? v1 - v2 : v1.toString().localeCompare(v2);
      }(getCellValue(asc ? a : b, idx), getCellValue(asc ? b : a, idx));
    }
  };
  
  // document.querySelectorAll('th').forEach(th => th.addEventListener('click', (() => {
  //   console.log("table header")
  //   const table = th.closest('table');
  //   Array.from(table.querySelectorAll('tr:nth-child(n+2)'))
  //       .sort(comparer(Array.from(th.parentNode.children).indexOf(th), this.asc = !this.asc))
  //       .forEach(tr => table.appendChild(tr) );
  // })));

  Array.from(document.querySelectorAll('th')).forEach(function(th) { 
    th.addEventListener('click', function() {
        console.log("test")
        let table = th.closest('table');
        Array.from(table.querySelectorAll('tr:nth-child(n+2)'))
            .sort(comparer(Array.from(th.parentNode.children).indexOf(th), this.asc = !this.asc))
            .forEach(function(tr) { 
              table.appendChild(tr) 
            });
    })
  });
  
  
})