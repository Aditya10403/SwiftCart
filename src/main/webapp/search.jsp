<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.tailwindcss.com"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.css" rel="stylesheet" />
<script src="https://cdn.tailwindcss.com"></script>
<script src="https://kit.fontawesome.com/f4f2f592f2.js" crossorigin="anonymous"></script>
<script>
    tailwind.config = {
      theme: {
    	  fontFamily: {
    	      normaltext: ["Poppins", "sans-serif"],
    	    },
        extend: {
          colors: {
            clifford: '#da373d',
          }
        }
      }
    }
</script>
<style type="text/css">
html {
  scroll-behavior: smooth;
}</style>
<title>Insert title here</title>
</head>
<body class="bg-[#E1E2E2] font-normaltext">

<!-- Navbar  -->
<nav class="bg-[#1D2228]">
  <div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto p-4">
  <a href="index.jsp" class="flex items-center space-x-3 rtl:space-x-reverse">
      <img src="assets/SwiftCart.png" class="h-8" alt="Flowbite Logo" />
      <span class="self-center text-[#FB8122] text-2xl font-semibold whitespace-nowrap">SwiftCart</span>
  </a>
  <form class="w-[40%] mx-auto">   
    <label for="search" class="mb-2 text-sm font-medium text-gray-900 sr-only dark:text-white">Search</label>
    <div class="relative">
        <div class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">
            <svg class="w-4 h-4 text-gray-500 dark:text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z"/>
            </svg>
        </div>
       	<div class="absolute top-14 end-20">
       	<a href="#" class="block px-4 py-2 text-white bg-gray-800 cursor-pointer rounded-md"><p id="msg"></p></a>
       	</div>
        <input name="search" id="search" type="search" class="block w-full p-4 ps-10 text-sm text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Search ..." required />
        <button type="submit" class="text-white absolute end-2.5 bottom-2.5 bg-[#FB8122] hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2 ">Search</button>
    </div>
</form>
  <div class="flex md:order-2">
    <a class="link" href="search.jsp"><button type="button" class="text-white bg-blue-600 hover:bg-blue-700 active:bg-blue-800 font-medium rounded-lg text-sm px-4 py-2 text-center">Get started</button></a>
   	<a href="cart.jsp"><button type="button" class="ml-3 relative inline-flex items-center px-5 py-2.5 text-sm font-medium text-center text-white bg-[#FB8122] active:bg-[#FB8122]/50 rounded-lg">
	<i class="fa-solid fa-cart-shopping"></i>
  		<div class="absolute inline-flex items-center justify-center w-6 h-6 text-xs font-bold text-white bg-red-500 border-2 border-white rounded-full -top-2 -end-2 dark:border-gray-900">2</div>
	</button></a>
  </div>
</nav>

</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	  $("#search").keyup(function(){
	    var pname=$(this).val()
	    $.ajax({
	        type: "get",
	        url: "search1.jsp?pname="+pname, 
	        success: function(data){      
	                $('#msg').html(data);
	        }
	    });
	});
});
</script>
</html>