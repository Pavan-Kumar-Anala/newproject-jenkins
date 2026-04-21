<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>NexusShop — Chroma Commerce</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:opsz,wght@14..32,300;14..32,400;14..32,500;14..32,600;14..32,700&family=Space+Grotesk:wght@400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Inter', sans-serif;
      background: #f5f9ff;
      color: #1a2c3e;
      overflow-x: hidden;
    }

    /* VIBRANT COLOR PALETTE */
    :root {
      --blue-deep: #0a2b5e;
      --blue-bright: #1e6fdf;
      --blue-glow: rgba(30,111,223,0.15);
      --green-mint: #10b981;
      --green-bright: #34d399;
      --red-coral: #ef4444;
      --red-light: #fee2e2;
      --bg-light: #f0f7ff;
      --card-white: #ffffff;
      --text-dark: #0f2b3d;
      --text-soft: #4a5b6e;
      --border-light: rgba(0,0,0,0.06);
      --shadow-md: 0 12px 30px rgba(0,0,0,0.08);
      --radius-xl: 24px;
      --radius-lg: 20px;
    }

    .container {
      max-width: 1280px;
      margin: 0 auto;
      padding: 0 28px;
    }

    /* HEADER with glassmorphism */
    header {
      position: sticky;
      top: 0;
      z-index: 200;
      background: rgba(255,255,255,0.92);
      backdrop-filter: blur(16px);
      border-bottom: 1px solid rgba(30,111,223,0.15);
      box-shadow: 0 2px 12px rgba(0,0,0,0.02);
    }

    .header-inner {
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 20px;
      padding: 14px 0;
    }

    .brand {
      font-family: 'Space Grotesk', monospace;
      font-size: 26px;
      font-weight: 700;
      background: linear-gradient(135deg, #0a2b5e, #1e6fdf, #10b981);
      -webkit-background-clip: text;
      background-clip: text;
      color: transparent;
      letter-spacing: -0.3px;
    }
    .brand span { background: none; color: #1e6fdf; }

    nav.main-nav ul {
      display: flex;
      gap: 8px;
      list-style: none;
    }
    nav.main-nav li a {
      padding: 8px 18px;
      border-radius: 40px;
      font-weight: 600;
      font-size: 14px;
      color: #2c4b6e;
      transition: all 0.2s;
      cursor: pointer;
    }
    nav.main-nav li a:hover, nav.main-nav li a.active {
      background: var(--blue-glow);
      color: var(--blue-bright);
    }

    .search-wrap {
      display: flex;
      align-items: center;
      gap: 12px;
      background: white;
      border: 1px solid #e2edf7;
      padding: 8px 18px;
      border-radius: 60px;
      transition: all 0.2s;
      box-shadow: 0 1px 3px rgba(0,0,0,0.02);
    }
    .search-wrap:focus-within {
      border-color: var(--blue-bright);
      box-shadow: 0 0 0 3px rgba(30,111,223,0.2);
    }
    .search-wrap input {
      border: none;
      background: transparent;
      outline: none;
      font-size: 14px;
      width: 200px;
    }
    .search-wrap button {
      background: none;
      border: none;
      cursor: pointer;
      color: #6c86a3;
      transition: color 0.2s;
    }
    .search-wrap button:hover { color: var(--blue-bright); }

    .cart-btn {
      background: #eef3fc;
      border-radius: 60px;
      padding: 8px 20px;
      display: flex;
      gap: 12px;
      align-items: center;
      font-weight: 700;
      cursor: pointer;
      transition: all 0.2s;
      border: 1px solid #dce7f2;
      color: var(--blue-deep);
    }
    .cart-count {
      background: var(--red-coral);
      color: white;
      border-radius: 40px;
      width: 22px;
      height: 22px;
      display: inline-grid;
      place-items: center;
      font-size: 12px;
      font-weight: bold;
    }
    .icon-btn {
      background: none;
      border: none;
      font-size: 18px;
      color: #517e9e;
      cursor: pointer;
      padding: 8px;
      border-radius: 50%;
      transition: all 0.2s;
    }
    .icon-btn:hover { background: #e4f0fe; color: var(--blue-bright); }
    .mobile-toggle { display: none; font-size: 24px; background: none; border: none; cursor: pointer; }

    /* Hero with gradients */
    .hero {
      background: linear-gradient(125deg, #e0f0ff 0%, #c7e2ff 40%, #b9d9fc 100%);
      border-radius: 0 0 48px 48px;
      margin-bottom: 20px;
    }
    .hero-content h1 {
      font-family: 'Space Grotesk', sans-serif;
      font-size: 58px;
      font-weight: 700;
      background: linear-gradient(135deg, #0a2b5e, #1e6fdf, #10b981);
      -webkit-background-clip: text;
      background-clip: text;
      color: transparent;
    }
    .btn-primary {
      background: var(--blue-bright);
      color: white;
      border: none;
      padding: 14px 32px;
      border-radius: 60px;
      font-weight: 700;
      cursor: pointer;
      transition: all 0.2s;
      box-shadow: 0 4px 10px rgba(30,111,223,0.3);
    }
    .btn-primary:hover { background: #0a58ca; transform: translateY(-2px); }
    .btn-outline-blue {
      background: transparent;
      border: 1px solid var(--blue-bright);
      color: var(--blue-bright);
      padding: 14px 28px;
      border-radius: 60px;
      font-weight: 600;
      cursor: pointer;
      transition: all 0.2s;
    }
    .btn-outline-blue:hover { background: rgba(30,111,223,0.1); }

    /* Categories grid */
    .section { padding: 70px 0; }
    .section-title {
      font-size: 36px;
      font-weight: 700;
      font-family: 'Space Grotesk', sans-serif;
      color: #0f2b3d;
    }
    .categories-grid {
      display: grid;
      grid-template-columns: repeat(6, 1fr);
      gap: 20px;
    }
    .cat-card {
      background: var(--card-white);
      border-radius: 28px;
      padding: 28px 12px;
      text-align: center;
      cursor: pointer;
      transition: all 0.25s;
      border: 1px solid #e8f0fe;
      box-shadow: 0 4px 12px rgba(0,0,0,0.02);
    }
    .cat-card:hover {
      transform: translateY(-6px);
      border-color: var(--blue-bright);
      box-shadow: var(--shadow-md);
    }
    .cat-icon {
      width: 70px;
      height: 70px;
      background: linear-gradient(145deg, #eef6ff, #e1edfe);
      border-radius: 35px;
      display: inline-grid;
      place-items: center;
      font-size: 28px;
      color: var(--blue-bright);
      margin-bottom: 16px;
    }
    .products-grid {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: 26px;
    }
    .product-card {
      background: white;
      border-radius: var(--radius-lg);
      overflow: hidden;
      transition: all 0.25s;
      border: 1px solid #eef3fa;
      box-shadow: 0 4px 12px rgba(0,0,0,0.02);
    }
    .product-card:hover { transform: translateY(-6px); box-shadow: var(--shadow-md); border-color: #cde3fe; }
    .product-img-wrap {
      height: 200px;
      overflow: hidden;
      position: relative;
      background: #f8fbfe;
    }
    .product-img-wrap img { width: 100%; height: 100%; object-fit: cover; transition: 0.3s; }
    .product-card:hover .product-img-wrap img { transform: scale(1.05); }
    .badge {
      position: absolute;
      top: 12px;
      left: 12px;
      background: var(--green-mint);
      color: white;
      padding: 4px 12px;
      border-radius: 60px;
      font-size: 11px;
      font-weight: 700;
    }
    .badge.red { background: var(--red-coral); }
    .product-body { padding: 16px; }
    .price { font-weight: 800; font-size: 22px; color: var(--blue-bright); font-family: 'Space Grotesk'; }
    .old-price { text-decoration: line-through; color: #9aaebf; font-size: 13px; margin-left: 6px; }
    .add-cart {
      width: 100%;
      background: #f0f7fe;
      border: none;
      padding: 12px;
      border-radius: 40px;
      font-weight: 700;
      cursor: pointer;
      transition: all 0.2s;
      color: var(--blue-deep);
      display: flex;
      gap: 8px;
      justify-content: center;
    }
    .add-cart:hover { background: var(--blue-bright); color: white; }
    .favorite-btn {
      position: absolute;
      top: 12px;
      right: 12px;
      background: rgba(255,255,255,0.9);
      border-radius: 50%;
      width: 34px;
      height: 34px;
      display: grid;
      place-items: center;
      cursor: pointer;
      border: none;
      color: #cbdae9;
      transition: 0.2s;
      opacity: 0;
    }
    .product-card:hover .favorite-btn { opacity: 1; }
    .favorite-btn.active { color: var(--red-coral); opacity: 1; background: white; }

    /* Cart sidebar */
    .cart-sidebar {
      position: fixed;
      top: 0;
      right: -420px;
      width: 400px;
      height: 100vh;
      background: white;
      box-shadow: -8px 0 30px rgba(0,0,0,0.15);
      z-index: 1000;
      transition: right 0.3s ease;
      display: flex;
      flex-direction: column;
      padding: 24px;
      gap: 20px;
    }
    .cart-sidebar.open { right: 0; }
    .cart-overlay {
      position: fixed;
      inset: 0;
      background: rgba(0,0,0,0.4);
      z-index: 999;
      display: none;
    }
    .cart-overlay.open { display: block; }
    .cart-item {
      display: flex;
      gap: 12px;
      padding: 12px 0;
      border-bottom: 1px solid #eef2f7;
    }
    .cart-item img { width: 60px; height: 60px; object-fit: cover; border-radius: 12px; }
    .remove-item { color: var(--red-coral); background: none; border: none; cursor: pointer; font-weight: 600; }
    .close-cart { background: none; border: none; font-size: 24px; cursor: pointer; float: right; }

    @media (max-width: 1024px) {
      .products-grid { grid-template-columns: repeat(3,1fr); }
      .categories-grid { grid-template-columns: repeat(3,1fr); }
    }
    @media (max-width: 768px) {
      nav.main-nav { display: none; }
      .mobile-toggle { display: block; }
      .products-grid { grid-template-columns: repeat(2,1fr); }
      .hero-content h1 { font-size: 40px; }
      .cart-sidebar { width: 320px; }
    }
    @media (max-width: 540px) {
      .products-grid { grid-template-columns: 1fr; }
    }
    .fade-in { opacity: 0; transform: translateY(20px); transition: all 0.6s; }
    .fade-in.visible { opacity: 1; transform: translateY(0); }
    .mobile-nav {
      display: none;
      background: white;
      border-top: 1px solid #eef3fa;
      padding: 12px 20px;
    }
    .mobile-nav ul { display: flex; gap: 20px; justify-content: center; list-style: none; }
    .mobile-nav a { font-weight: 600; color: #2c4b6e; cursor: pointer; }
  </style>
</head>
<body>

<header>
  <div class="container header-inner">
    <div style="display:flex; gap:16px; align-items:center;">
      <button class="mobile-toggle" id="mobileToggleBtn"><i class="fas fa-bars"></i></button>
      <div class="brand">Nexus<span>Shop</span></div>
    </div>
    <nav class="main-nav">
      <ul id="navList">
        <li><a data-nav="home">Home</a></li>
        <li><a data-nav="categories">Categories</a></li>
        <li><a data-nav="trending">Trending</a></li>
        <li><a data-nav="deals">Deals</a></li>
        <li><a data-nav="about">About</a></li>
      </ul>
    </nav>
    <div style="display:flex; gap:10px; align-items:center;">
      <div class="search-wrap">
        <button id="searchIconBtn"><i class="fas fa-search"></i></button>
        <input type="text" id="searchInput" placeholder="Search products...">
        <button id="searchClearBtn"><i class="fas fa-times-circle"></i></button>
      </div>
      <button class="icon-btn" id="favoritesNavBtn"><i class="far fa-heart"></i></button>
      <div class="cart-btn" id="openCartBtn"><i class="fas fa-shopping-bag"></i><span class="cart-count" id="cartCount">0</span></div>
    </div>
  </div>
  <div class="mobile-nav" id="mobileNavMenu">
    <ul><li><a data-nav="home">Home</a></li><li><a data-nav="categories">Categories</a></li><li><a data-nav="trending">Trending</a></li><li><a data-nav="deals">Deals</a></li><li><a data-nav="about">About</a></li></ul>
  </div>
</header>

<main>
  <section class="hero" id="homeSection">
    <div class="container" style="padding: 70px 0 80px;">
      <div class="hero-content"><div class="hero-eyebrow" style="color:#1e6fdf; font-weight:600;">✦ CHROMA EDITION</div>
      <h1>Vibrant Finds,<br> Bold & <span style="color:#10b981;">Sustainable</span></h1>
      <p style="font-size: 18px; color: #2c4b6e; margin: 20px 0 28px;">Explore curated tech, fashion, and lifestyle with joyful colors — free shipping & 30-day returns.</p>
      <div><button class="btn-primary" id="shopNowHero">Shop Now →</button> <button class="btn-outline-blue" id="exploreDealsHero">Flash Sale 🔥</button></div></div>
    </div>
  </section>

  <section class="section container fade-in" id="categoriesSection"><div style="display:flex; justify-content:space-between; align-items:center;"><h2 class="section-title">Shop by <span style="color:#10b981;">Category</span></h2></div><div class="categories-grid" id="categoriesGrid"></div></section>
  <section class="section container fade-in" id="productsSection"><div style="display:flex; justify-content:space-between;"><h2 class="section-title">🔥 Trending Now</h2><span id="resultsHint" style="color:#6c86a3;"></span></div><div class="products-grid" id="productsGrid"></div></section>
  <section id="dealsSection" class="section container fade-in"><div style="background: linear-gradient(115deg, #eef6ff, #e0f0fe); border-radius: 40px; padding: 48px; display: grid; grid-template-columns: 1fr 1fr; gap: 30px;"><div><h2 style="font-size: 38px; font-weight:700;">⚡ Flash Sale</h2><p style="margin: 16px 0;">MacBook Air M2 – 17% OFF</p><div class="timer" style="display:flex; gap:16px;"><div class="time-box" style="background:white; border-radius:20px; padding:12px 20px;"><span id="dealDays" style="font-size:32px; font-weight:800;">0</span><br>Days</div><div class="time-box" style="background:white; border-radius:20px; padding:12px 20px;"><span id="dealHours" style="font-size:32px;">00</span><br>Hrs</div><div class="time-box" style="background:white; border-radius:20px; padding:12px 20px;"><span id="dealMinutes" style="font-size:32px;">00</span><br>Min</div></div><div><span class="price" style="font-size: 36px;">$999</span> <span class="old-price">$1,199</span></div><button class="btn-primary" id="buyDealBtn" style="margin-top:24px;">Add to Cart</button></div><div><img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=500" style="border-radius: 32px; width:100%; object-fit:cover;"></div></div></section>
  <section class="section container fade-in"><div style="text-align:center;"><h2 class="section-title">💬 Happy Customers</h2><div style="display:grid; grid-template-columns:repeat(2,1fr); gap:24px; margin-top:40px;"><div style="background:white; border-radius:28px; padding:28px;"><i class="fas fa-star" style="color:#fbbf24;"></i> ★★★★★<p style="margin-top:12px;">"Amazing colors and quality! Cart works perfect."</p><strong>— Emma R.</strong></div><div style="background:white; border-radius:28px; padding:28px;"><i class="fas fa-star" style="color:#fbbf24;"></i> ★★★★★<p>"Fast shipping, loved the green backpack!"</p><strong>— David K.</strong></div></div></div></section>
  <section class="section container fade-in"><div style="background: linear-gradient(145deg, #0a2b5e, #1e3a5f); border-radius: 48px; padding: 48px; text-align:center; color:white;"><h2 style="color:white;">Join the Chroma Club</h2><p style="margin:12px 0;">Get 15% off + exclusive drops</p><form id="newsletterForm"><input type="email" id="newsEmail" placeholder="Your email" style="padding:14px 24px; border-radius:60px; border:none; width:280px;"><button type="submit" class="btn-primary" style="background:#10b981; margin-left:10px;">Subscribe</button></form><div id="newsMsg" style="margin-top:16px;"></div></div></section>
</main>

<footer style="background:#0f2b3d; color:#b8d1f0; padding:40px 0; text-align:center;">© 2025 NexusShop — Vibrant Commerce</footer>

<!-- Cart Sidebar -->
<div class="cart-overlay" id="cartOverlay"></div>
<div class="cart-sidebar" id="cartSidebar">
  <div style="display:flex; justify-content:space-between;"><h3>Your Cart</h3><button class="close-cart" id="closeCartBtn">✕</button></div>
  <div id="cartItemsList" style="flex:1; overflow-y:auto;"></div>
  <div><strong>Total: $<span id="cartTotal">0</span></strong><button id="clearCartBtn" style="background:#fee2e2; border:none; padding:8px; border-radius:40px; margin-left:12px; cursor:pointer;">Clear all</button></div>
</div>

<script>
  // ---------- PRODUCTS (VIBRANT) ----------
  const PRODUCTS = [
    { id:1, title:'iPhone 15 Pro Max', price:1199, oldPrice:1299, rating:5, badge:'new', img:'https://images.unsplash.com/photo-1695048133142-1a20484d2569?auto=format&fit=crop&w=400&q=80', category:'Smartphones', catKey:'smartphones' },
    { id:2, title:'Samsung S24 Ultra', price:1099, rating:5, img:'https://images.unsplash.com/photo-1610945415295-d9bbf067e59c?auto=format&fit=crop&w=400&q=80', category:'Smartphones', catKey:'smartphones' },
    { id:3, title:'Google Pixel 8 Pro', price:899, oldPrice:999, rating:4.5, badge:'sale', img:'https://images.unsplash.com/photo-1592890288564-76628a30a657?auto=format&fit=crop&w=400&q=80', category:'Smartphones', catKey:'smartphones' },
    { id:4, title:'MacBook Pro M3', price:1999, rating:5, badge:'new', img:'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=400&q=80', category:'Laptops', catKey:'laptops' },
    { id:5, title:'Dell XPS 13', price:1499, rating:4, img:'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&w=400&q=80', category:'Laptops', catKey:'laptops' },
    { id:6, title:'ASUS ROG Zephyrus', price:1799, rating:5, img:'https://images.unsplash.com/photo-1603302576837-37561b2e2302?auto=format&fit=crop&w=400&q=80', category:'Laptops', catKey:'laptops' },
    { id:7, title:'Denim Jacket', price:89, rating:4.5, img:'https://images.unsplash.com/photo-1551537482-f2075a1d41f2?auto=format&fit=crop&w=400&q=80', category:'Clothing', catKey:'clothing' },
    { id:8, title:'Cashmere Sweater', price:129, oldPrice:199, rating:5, badge:'sale', img:'https://images.unsplash.com/photo-1576566588028-4147f3842f27?auto=format&fit=crop&w=400&q=80', category:'Clothing', catKey:'clothing' },
    { id:9, title:'Silk Dress', price:149, rating:4.7, img:'https://images.unsplash.com/photo-1612336307429-8a898d10e223?auto=format&fit=crop&w=400&q=80', category:'Clothing', catKey:'clothing' },
    { id:10, title:'Sony WH-1000XM5', price:399, rating:5, badge:'new', img:'https://images.unsplash.com/photo-1618366712010-f4ae9c647dcb?auto=format&fit=crop&w=400&q=80', category:'Gadgets', catKey:'gadgets' },
    { id:11, title:'DJI Mini 4 Pro', price:759, rating:5, img:'https://images.unsplash.com/photo-1507582020474-9a35b7d455d9?auto=format&fit=crop&w=400&q=80', category:'Gadgets', catKey:'gadgets' },
    { id:12, title:'Nike Air Max', price:150, rating:4, img:'https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&w=400&q=80', category:'Footwear', catKey:'footwear' },
    { id:13, title:'Adidas Ultraboost', price:180, rating:4.5, img:'https://images.unsplash.com/photo-1605348532760-6753d2c43329?auto=format&fit=crop&w=400&q=80', category:'Footwear', catKey:'footwear' },
    { id:14, title:'Chelsea Boots', price:199, rating:5, img:'https://images.unsplash.com/photo-1549298916-b41d501d3772?auto=format&fit=crop&w=400&q=80', category:'Footwear', catKey:'footwear' },
    { id:15, title:'Minimalist Watch', price:249, rating:4.8, img:'https://images.unsplash.com/photo-1522312346375-d1a52e2b99b3?auto=format&fit=crop&w=400&q=80', category:'Accessories', catKey:'accessories' },
    { id:16, title:'Leather Backpack', price:119, rating:4.5, img:'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?auto=format&fit=crop&w=400&q=80', category:'Accessories', catKey:'accessories' }
  ];

  const CATEGORIES = [
    { id:'smartphones', name:'Smartphones', icon:'fa-mobile-alt' }, { id:'laptops', name:'Laptops', icon:'fa-laptop' },
    { id:'clothing', name:'Clothing', icon:'fa-tshirt' }, { id:'gadgets', name:'Gadgets', icon:'fa-headphones' },
    { id:'footwear', name:'Footwear', icon:'fa-shoe-prints' }, { id:'accessories', name:'Accessories', icon:'fa-gem' }
  ];

  let cart = []; // { id, title, price, img }
  let favorites = new Set(); // store favorite ids
  let currentFilter = '';

  // DOM elements
  const productsGrid = document.getElementById('productsGrid');
  const categoriesGrid = document.getElementById('categoriesGrid');
  const cartCountSpan = document.getElementById('cartCount');
  const cartSidebar = document.getElementById('cartSidebar');
  const cartOverlay = document.getElementById('cartOverlay');
  const cartItemsDiv = document.getElementById('cartItemsList');
  const cartTotalSpan = document.getElementById('cartTotal');
  const searchInput = document.getElementById('searchInput');
  const searchClearBtn = document.getElementById('searchClearBtn');
  const searchIconBtn = document.getElementById('searchIconBtn');

  function renderProducts(productList) {
    productsGrid.innerHTML = '';
    const filtered = productList.filter(p => p.title.toLowerCase().includes(currentFilter.toLowerCase()) || p.category.toLowerCase().includes(currentFilter));
    if(filtered.length === 0) { productsGrid.innerHTML = '<div style="grid-column:1/-1; text-align:center;">✨ No products found</div>'; return; }
    filtered.forEach(p => {
      const card = document.createElement('div'); card.className = 'product-card';
      const isFav = favorites.has(p.id);
      card.innerHTML = `<div class="product-img-wrap">${p.badge ? `<span class="badge ${p.badge==='sale'?'red':''}">${p.badge==='new'?'NEW':'SALE'}</span>` : ''}<img src="${p.img}" loading="lazy"><button class="favorite-btn ${isFav ? 'active' : ''}" data-id="${p.id}"><i class="fa-${isFav ? 'solid' : 'regular'} fa-heart"></i></button></div>
      <div class="product-body"><div style="color:#10b981; font-size:12px;">${p.category}</div><h3 style="font-size:18px;">${p.title}</h3><div><span class="price">$${p.price}</span>${p.oldPrice ? `<span class="old-price">$${p.oldPrice}</span>` : ''}</div></div>
      <div style="padding:0 16px 16px;"><button class="add-cart" data-id="${p.id}" data-title="${p.title}" data-price="${p.price}" data-img="${p.img}"><i class="fas fa-cart-plus"></i> Add to Cart</button></div>`;
      productsGrid.appendChild(card);
    });
    attachProductEvents();
  }

  function attachProductEvents() {
    document.querySelectorAll('.add-cart').forEach(btn => {
      btn.removeEventListener('click', addHandler);
      btn.addEventListener('click', addHandler);
    });
    document.querySelectorAll('.favorite-btn').forEach(btn => {
      btn.removeEventListener('click', favHandler);
      btn.addEventListener('click', favHandler);
    });
    function addHandler(e) {
      const btn = e.currentTarget;
      const id = parseInt(btn.dataset.id); const title = btn.dataset.title; const price = parseFloat(btn.dataset.price); const img = btn.dataset.img;
      const existing = cart.find(i => i.id === id);
      if(existing) existing.qty = (existing.qty||1)+1;
      else cart.push({ id, title, price, img, qty:1 });
      updateCartUI();
    }
    function favHandler(e) {
      e.stopPropagation();
      const btn = e.currentTarget;
      const id = parseInt(btn.dataset.id);
      if(favorites.has(id)) favorites.delete(id);
      else favorites.add(id);
      renderProducts(PRODUCTS);
    }
  }

  function updateCartUI() {
    let total = 0, count = 0;
    cartItemsDiv.innerHTML = '';
    cart.forEach((item, idx) => {
      total += item.price * (item.qty||1);
      count += (item.qty||1);
      const div = document.createElement('div'); div.className = 'cart-item';
      div.innerHTML = `<img src="${item.img}" width="50"><div><strong>${item.title}</strong><br>$${item.price} x ${item.qty||1}</div><div style="margin-left:auto;"><button class="remove-item" data-index="${idx}">Remove</button></div>`;
      cartItemsDiv.appendChild(div);
    });
    document.querySelectorAll('.remove-item').forEach(btn => {
      btn.addEventListener('click', (e) => { const idx = parseInt(btn.dataset.index); cart.splice(idx,1); updateCartUI(); });
    });
    cartCountSpan.innerText = count;
    cartTotalSpan.innerText = total.toFixed(2);
    localStorage.setItem('nexusCart', JSON.stringify(cart));
    localStorage.setItem('favorites', JSON.stringify([...favorites]));
  }

  function renderCategories() {
    categoriesGrid.innerHTML = '';
    CATEGORIES.forEach(cat => {
      const card = document.createElement('div'); card.className = 'cat-card';
      card.innerHTML = `<div class="cat-icon"><i class="fas ${cat.icon}"></i></div><h4>${cat.name}</h4><span>Explore →</span>`;
      card.addEventListener('click', () => { searchInput.value = cat.name; currentFilter = cat.name; renderProducts(PRODUCTS); document.getElementById('productsSection').scrollIntoView({behavior:'smooth'}); });
      categoriesGrid.appendChild(card);
    });
  }

  function loadFromStorage() {
    const savedCart = localStorage.getItem('nexusCart');
    if(savedCart) { cart = JSON.parse(savedCart); updateCartUI(); }
    const savedFavs = localStorage.getItem('favorites');
    if(savedFavs) favorites = new Set(JSON.parse(savedFavs));
  }

  // Navigation smooth scroll + active
  function setupNavigation() {
    const navItems = document.querySelectorAll('[data-nav]');
    const sections = { home:'homeSection', categories:'categoriesSection', trending:'productsSection', deals:'dealsSection', about:'aboutSection' };
    navItems.forEach(el => {
      el.addEventListener('click', (e) => {
        const sectionId = sections[el.getAttribute('data-nav')];
        if(sectionId) document.getElementById(sectionId).scrollIntoView({behavior:'smooth'});
        document.getElementById('mobileNavMenu').style.display = 'none';
      });
    });
    document.getElementById('shopNowHero').addEventListener('click', ()=>document.getElementById('productsSection').scrollIntoView({behavior:'smooth'}));
    document.getElementById('exploreDealsHero').addEventListener('click', ()=>document.getElementById('dealsSection').scrollIntoView({behavior:'smooth'}));
    document.getElementById('buyDealBtn').addEventListener('click',()=>{ cart.push({ id:999, title:'MacBook Air M2', price:999, img:'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=100&q=80', qty:1 }); updateCartUI(); alert('MacBook added!'); });
  }

  // Search logic
  function performSearch() {
    currentFilter = searchInput.value.trim();
    renderProducts(PRODUCTS);
  }
  searchIconBtn.addEventListener('click', performSearch);
  searchClearBtn.addEventListener('click', () => { searchInput.value = ''; currentFilter = ''; renderProducts(PRODUCTS); });
  searchInput.addEventListener('keypress', (e) => { if(e.key === 'Enter') performSearch(); });

  // Cart Sidebar Toggle
  document.getElementById('openCartBtn').addEventListener('click', () => { cartSidebar.classList.add('open'); cartOverlay.classList.add('open'); });
  document.getElementById('closeCartBtn').addEventListener('click', () => { cartSidebar.classList.remove('open'); cartOverlay.classList.remove('open'); });
  cartOverlay.addEventListener('click', () => { cartSidebar.classList.remove('open'); cartOverlay.classList.remove('open'); });
  document.getElementById('clearCartBtn').addEventListener('click', () => { cart = []; updateCartUI(); });
  document.getElementById('favoritesNavBtn').addEventListener('click', () => { const favProds = PRODUCTS.filter(p => favorites.has(p.id)); renderProducts(favProds); document.getElementById('productsSection').scrollIntoView({behavior:'smooth'}); });

  // Newsletter
  document.getElementById('newsletterForm').addEventListener('submit', (e) => { e.preventDefault(); const email = document.getElementById('newsEmail').value; const msgDiv = document.getElementById('newsMsg'); if(email.includes('@')) { msgDiv.innerHTML = '🎉 Subscribed! Welcome.'; msgDiv.style.color='#34d399'; } else { msgDiv.innerHTML = 'Invalid email'; msgDiv.style.color='#ef4444'; } });

  // timer
  function startTimer() { const target = Date.now() + 23*3600000; setInterval(()=>{ let diff = target - Date.now(); if(diff<0) diff=0; document.getElementById('dealDays').innerText = Math.floor(diff/86400000); document.getElementById('dealHours').innerText = String(Math.floor((diff%86400000)/3600000)).padStart(2,'0'); document.getElementById('dealMinutes').innerText = String(Math.floor((diff%3600000)/60000)).padStart(2,'0'); },1000); }
  startTimer();
  const observer = new IntersectionObserver(entries=>entries.forEach(e=>{if(e.isIntersecting)e.target.classList.add('visible');}),{threshold:0.1});
  document.querySelectorAll('.fade-in').forEach(el=>observer.observe(el));
  document.getElementById('mobileToggleBtn').addEventListener('click', () => { const menu = document.getElementById('mobileNavMenu'); menu.style.display = menu.style.display === 'block' ? 'none' : 'block'; });

  loadFromStorage(); renderCategories(); renderProducts(PRODUCTS); setupNavigation();
</script>
</body>
</html>
