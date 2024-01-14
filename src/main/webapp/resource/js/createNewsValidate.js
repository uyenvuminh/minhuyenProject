/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

const idNews = document.getElementById("idnews");
const tittle = document.getElementById("tittle");
const author = document.getElementById("author");
const header = document.getElementById("header");
const body = document.getElementById("body");
const footer = document.getElementById("footer");
const pubDate = document.getElementById("pubDate");
const arrNew = document.querySelectorAll('.elementNews');
const formCreate = document.getElementById("formCreateNews");

formCreate.addEventListener('submit', function(e){
    if(!validateInputs()){
        e.preventDefault();
    }
});

const setError = (element, message) => {
    const inputControl = element.parentElement;
    const errorDisplay = inputControl.querySelector('.error');
    
    errorDisplay.innerText = message;
    inputControl.classList.add('error');
    inputControl.classList.remove('success');
};

const setSuccess = element => {
    const inputControl = element.parentElement;
    const errorDisplay = inputControl.querySelector('.error');
    
    errorDisplay.innerText = '';
    inputControl.classList.add('success');
    inputControl.classList.remove('error');
};

const isValidNewsID = idNews => {
    var count = 0;
    for(var i = 0; i < arrNew.length; i++){
        if(idNews === arrNew[i].value){
            count++;
        }
    }
//    true is valid and false is invalid
    return (count === 0) ? true : false;
};
 const validateInputs = () => {
    var count = 0;
    const idNews_value = idNews.value.trim();
    const tittle_value = tittle.value.trim();
    const author_value = author.value.trim();
    const header_value = header.value.trim();
    const body_value = body.value.trim();
    const footer_value = footer.value.trim();
    const pubDate_value = pubDate.value.trim();
    
    if(idNews_value === ''){
        setError(idNews, 'Hãy điền ID bản tin');
        count++;
    } else if(!isValidNewsID(idNews_value)){
        setError(idNews, 'ID bản tin đã tồn tại');
        count++;
    } else{
        setSuccess(idNews);
    }
    
    if(tittle_value === ''){
        setError(tittle, 'Hãy điền tiêu đề của bản tin');
        count++;
    } else{
        setSuccess(tittle);
    }
    
    if(author_value === ''){
        setError(author, 'Hãy điền tác giả của bản tin');
        count++;
    } else{
        setSuccess(author);
    }
    
    if(header_value === ''){
        setError(header, 'Hãy điền tối thiểu 1 phần thông tin cho bài Blog này.');
        count++;
    } else{
        setSuccess(header);
    }
    
//    if(body_value === ''){
//        setError(body, 'Hãy điền phần thân bài của bản tin');
//        count++;
//    } else{
//        setSuccess(body);
//    }
//    
//    if(footer_value === ''){
//        setError(footer, 'Hãy điền phần kết bài của bản tin');
//        count++;
//    } else{
//        setSuccess(body);
//    }
//    
    return (count === 0) ? true : false;
};

