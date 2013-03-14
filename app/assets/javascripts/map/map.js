/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
var map = L.map('map').setView([59.94, 30.30], 11);
    L.tileLayer('http://{s}.tile.cloudmade.com/27811c2dd4ab4a1d9bc5a8ebe17a82a6/997/256/{z}/{x}/{y}.png', {
        attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
        maxZoom: 18
    }).addTo(map);