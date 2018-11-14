



var ligne = 1;


function createIngr()
{
	//alert("Ajout Ligne");
	var newRow = document.getElementById('table').insertRow(-1);

        var newCell = newRow.insertCell(0);
        newCell.innerHTML = '<tr><td><input type="text" class="form-control elem" placeholder="nom ingredient" /></td>';
        newCell = newRow.insertCell(1); 
        newCell.innerHTML = '<td><input type="text" class="form-control elem" placeholder="poids" /></td>';                  
        ligne++;    
}  

function deleteIngr()
{
    if(ligne !== 1)
    {
        var nb = document.getElementById('table').rows.length;
        document.getElementById('table').deleteRow(-1); 
        ligne--; 
    }
    else
    {
        alert('Une recette doit avoir au moins 1 ingredient !!');
    }
}   
        
document.getElementById("addRow").onclick = function() {createIngr();};  
document.getElementById("deleRow").onclick = function() {deleteIngr();};
        
    

