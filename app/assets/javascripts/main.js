$(document).on('turbolinks:load', init);

function init() {
  console.log('Intialized and running');
  
  //for sort func
  const getCellValue = function(tr, idx) {
    return tr.children[idx].innerText || tr.children[idx].textContent;
  }
  
  //for sort func
  const comparer = function(idx, asc) { 
    return function(a, b) { 
      return function(v1, v2) {
        return v1 !== '' && v2 !== '' && !isNaN(v1) && !isNaN(v2) ? v1 - v2 : v1.toString().localeCompare(v2);
      }(getCellValue(asc ? a : b, idx), getCellValue(asc ? b : a, idx));
    }
  };

  //enables ASC and DESC sorting for table columns
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
  
  $('#tableBtn1').click(function() {
    $('#allTicketsTable').show();
    $('#openTicketsTable').hide();
    $('#closedTicketsTable').hide();
  })
  
  $('#tableBtn2').click(function() {
    $('#allTicketsTable').hide();
    $('#openTicketsTable').show();
    $('#closedTicketsTable').hide();
  })
  
  $('#tableBtn3').click(function() {
    $('#allTicketsTable').hide();
    $('#openTicketsTable').hide();
    $('#closedTicketsTable').show();
  })
  
  $("#testButton").click(tester);
  
  function tester() {
    // let selectVals = $("#tester").val();
    let selectVals = document.getElementById('tester');
    console.log(getSelectedOptions(selectVals));
  }
  
  function getSelectedOptions(sel, fn) {
    let optsArray = [];
    let opt = null;
    
    // loop through options in select list
    for (var i=0; i<sel.options.length; i++) {
      opt = sel.options[i];
      
      // check if selected
      if ( opt.selected ) {
        // add to array of option elements to return from this function
        optsArray.push(opt.value);
        
        // invoke optional callback function if provided
        if (fn) {
          fn(opt);
        }
      }
    }
    // return array containing references to selected option elements
    return optsArray;
  }
}

