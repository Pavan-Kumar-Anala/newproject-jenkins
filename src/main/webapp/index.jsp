<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>NexusShop — Vibrant Premium Commerce</title>
  <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@300;400;600;700&family=DM+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" crossorigin="anonymous">
  <style>
    :root {
      --bg: #fef9f0;           /* warm cream background */
      --surface: #ffffff;
      --card: #ffffff;
      --border: rgba(0,0,0,0.08);
      --text: #1e1b1a;
      --muted: #6c5f5a;
      --gold: #c66e2c;          /* vibrant terracotta / copper */
      --gold-light: #e68a3c;
      --gold-dim: rgba(198,110,44,0.1);
      --radius: 20px;
      --container: 1280px;
      --shadow-sm: 0 8px 20px rgba(0,0,0,0.03), 0 2px 4px rgba(0,0,0,0.05);
      --shadow-hover: 0 20px 30px -12px rgba(0,0,0,0.12);
    }

    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
    html { scroll-behavior: smooth; }

    body {
      font-family: 'DM Sans', system-ui, sans-serif;
      background: var(--bg);
      color: var(--text);
      -webkit-font-smoothing: antialiased;
    }

    /* remove dark noise overlay, use colorful background */
    .container { width: 100%; max-width: var(--container); margin: 0 auto; padding: 0 28px; }

    /* HEADER — lighter, modern */
    header {
      position: sticky; top: 0; z-index: 100;
      background: rgba(254,249,240,0.92);
      backdrop-filter: blur(16px);
      border-bottom: 1px solid var(--border);
      box-shadow: 0 2px 8px rgba(0,0,0,0.02);
    }
    .header-inner {
      display: flex; align-items: center; justify-content: space-between;
      gap: 20px; padding: 14px 0;
    }
    .brand {
      font-family: 'Cormorant Garamond', serif;
      font-size: 26px; font-weight: 700; letter-spacing: -0.01em;
      background: linear-gradient(135deg, #c66e2c, #aa4f1c);
      background-clip: text;
      -webkit-background-clip: text;
      color: transparent;
    }
    .brand span { color: #c66e2c; background: none; -webkit-background-clip: unset; background-clip: unset; }

    nav.main-nav ul { display: flex; gap: 6px; list-style: none; align-items: center; }
    nav.main-nav li a {
      padding: 8px 16px; border-radius: 40px;
      font-size: 14px; font-weight: 500; color: #4b3b36;
      transition: all 0.2s;
    }
    nav.main-nav li a:hover { background: #f0e3d8; color: #c66e2c; }

    .search-wrap {
      display: flex; align-items: center; gap: 10px;
      background: white; border: 1px solid #e2d9d2;
      padding: 8px 16px; border-radius: 60px;
      transition: all 0.2s; box-shadow: var(--shadow-sm);
    }
    .search-wrap:focus-within { border-color: var(--gold); box-shadow: 0 0 0 2px rgba(198,110,44,0.2);}
    .search-wrap input { border: 0; background: transparent; outline: none; font-size: 14px; width: 180px; color: #1e1b1a; }
    .search-wrap input::placeholder { color: #b6a59c; }
    .search-wrap button { background: none; border: 0; cursor: pointer; color: #7a665d; transition: color .2s; }
    .search-wrap button:hover { color: var(--gold); }

    .cart-btn {
      background: var(--gold-dim); border: 1px solid rgba(198,110,44,0.3);
      border-radius: 60px; padding: 8px 18px; display: inline-flex; gap: 10px;
      align-items: center; font-weight: 600; color: var(--gold); cursor: pointer;
      transition: all 0.2s;
    }
    .cart-btn:hover { background: rgba(198,110,44,0.2); transform: scale(0.98);}
    .cart-count { background: var(--gold); color: white; border-radius: 40px; width: 20px; height: 20px; display: inline-grid; place-items: center; font-size: 11px; font-weight: bold; }

    .icon-btn { background: none; border: 0; color: #5c4b44; font-size: 18px; padding: 8px; border-radius: 50%; cursor: pointer; transition: background .2s; }
    .icon-btn:hover { background: #f0e3d8; color: var(--gold); }
    .mobile-toggle { display: none; background: none; border: 0; font-size: 24px; cursor: pointer; color: #3e2d27;}

    /* Hero colorful gradient */
    .hero {
      position: relative; overflow: hidden;
      min-height: 520px;
      background: linear-gradient(125deg, #ffeedb 0%, #ffe2c4 100%);
    }
    .hero-bg {
      position: absolute; inset: 0;
      background-image: radial-gradient(circle at 10% 30%, rgba(255,180,110,0.15) 2%, transparent 2.5%),
                        radial-gradient(circle at 90% 70%, rgba(198,110,44,0.1) 1.5%, transparent 2%);
      background-size: 40px 40px, 32px 32px;
    }
    .hero-content { position: relative; z-index: 2; max-width: 620px; animation: fadeUp 0.7s ease; }
    .hero-eyebrow { font-size: 12px; font-weight: 700; letter-spacing: 0.12em; text-transform: uppercase; color: var(--gold); margin-bottom: 20px; display: flex; align-items: center; gap: 12px; }
    .hero-eyebrow::before { content: ''; width: 36px; height: 2px; background: var(--gold); }
    .hero h1 { font-family: 'Cormorant Garamond', serif; font-size: 68px; font-weight: 400; line-height: 1.05; color: #2c241f; margin-bottom: 20px; }
    .hero h1 em { font-style: italic; color: var(--gold); }
    .hero p { font-size: 16px; line-height: 1.65; color: #5e4c44; margin-bottom: 36px; max-width: 460px; }
    .btn { display: inline-flex; align-items: center; gap: 10px; padding: 14px 30px; border-radius: 60px; font-weight: 700; font-size: 14px; cursor: pointer; border: 0; transition: all 0.2s; font-family: inherit; }
    .btn-gold { background: var(--gold); color: white; box-shadow: 0 6px 14px rgba(198,110,44,0.3); }
    .btn-gold:hover { background: #b65b24; transform: translateY(-2px); box-shadow: 0 12px 20px rgba(198,110,44,0.3); }
    .btn-outline { background: transparent; border: 1px solid #d4c4b8; color: #3e2d27; }
    .btn-outline:hover { border-color: var(--gold); background: rgba(198,110,44,0.05); }

    .hero-stats { display: flex; gap: 1px; margin-top: 48px; flex-wrap: wrap; }
    .stat-box { background: rgba(255,255,245,0.85); backdrop-filter: blur(8px); border-radius: 24px; padding: 12px 28px; border: 1px solid rgba(0,0,0,0.05); margin-right: 12px; margin-bottom: 8px; box-shadow: var(--shadow-sm);}
    .stat-num { font-family: 'Cormorant Garamond', serif; font-size: 28px; font-weight: 700; color: var(--gold);}
    .stat-label { font-size: 12px; color: #7a685f; letter-spacing: 0.05em; }

    /* sections colorful */
    .section { padding: 80px 0; }
    .section-head { margin-bottom: 48px; }
    .section-head .eyebrow { font-size: 12px; font-weight: 700; letter-spacing: 0.1em; color: var(--gold); margin-bottom: 12px; }
    .section-head h2 { font-family: 'Cormorant Garamond', serif; font-size: 44px; font-weight: 400; color: #2c241f; letter-spacing: -0.01em; }
    .section-head p { color: #6f5b52; margin-top: 8px; }

    /* Categories cards — vibrant */
    .categories-grid {
      display: grid;
      grid-template-columns: repeat(6, 1fr);
      gap: 18px;
    }
    .cat-card {
      background: white; border-radius: 28px; padding: 28px 12px 24px; text-align: center;
      box-shadow: var(--shadow-sm); transition: all 0.25s; cursor: pointer;
      border: 1px solid #f2e5db;
    }
    .cat-card:hover { transform: translateY(-6px); box-shadow: var(--shadow-hover); border-color: var(--gold-light); background: #fffaf5; }
    .cat-icon { width: 64px; height: 64px; background: #fce8db; border-radius: 32px; display: inline-grid; place-items: center; font-size: 28px; color: var(--gold); margin-bottom: 16px; transition: all 0.2s; }
    .cat-card:hover .cat-icon { background: var(--gold); color: white; transform: scale(1.02);}
    .cat-card h4 { font-size: 15px; font-weight: 700; color: #2f241f; margin-top: 6px;}
    .cat-card span { font-size: 12px; color: #b29a8a; }

    /* Products grid — vivid images */
    .products-grid {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: 24px;
    }
    .product-card {
      background: white; border-radius: 24px; overflow: hidden; transition: all 0.25s; box-shadow: var(--shadow-sm); border: 1px solid #f0e2d8;
    }
    .product-card:hover { transform: translateY(-8px); box-shadow: var(--shadow-hover); border-color: #ffd5bb; }
    .product-img-wrap { position: relative; overflow: hidden; background: #faf0e8; height: 220px; }
    .product-img-wrap img { width: 100%; height: 100%; object-fit: cover; transition: transform 0.4s ease; display: block; }
    .product-card:hover .product-img-wrap img { transform: scale(1.05); }
    .product-badge { position: absolute; top: 14px; left: 14px; padding: 5px 12px; border-radius: 40px; font-size: 11px; font-weight: 800; text-transform: uppercase; background: var(--gold); color: white; letter-spacing: 0.5px; }
    .badge-sale { background: #e06c5c; }
    .wish-overlay { position: absolute; top: 14px; right: 14px; background: rgba(255,255,245,0.9); border-radius: 50%; width: 34px; height: 34px; display: grid; place-items: center; cursor: pointer; opacity: 0; transition: 0.2s; color: #ab7a64; border: none; box-shadow: 0 2px 6px rgba(0,0,0,0.1); }
    .product-card:hover .wish-overlay { opacity: 1; }
    .product-body { padding: 18px 18px 8px; }
    .product-cat { font-size: 11px; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: var(--gold); margin-bottom: 6px; }
    .product-body h5 { font-size: 16px; font-weight: 600; margin-bottom: 8px; color: #2c241f; }
    .price-row { display: flex; justify-content: space-between; align-items: baseline; flex-wrap: wrap; }
    .price { font-family: 'Cormorant Garamond', serif; font-size: 24px; font-weight: 700; color: var(--gold); }
    .old-price { font-size: 13px; color: #aa917f; text-decoration: line-through; margin-left: 8px; }
    .rating { font-size: 13px; color: #e0a044; }
    .product-footer { padding: 12px 18px 18px; }
    .add-btn { width: 100%; background: #fef4ed; border: 1px solid #eedbcb; padding: 12px; border-radius: 40px; font-weight: 700; font-size: 13px; cursor: pointer; transition: all 0.2s; color: #3b2a23; display: flex; align-items: center; justify-content: center; gap: 10px; }
    .add-btn:hover { background: var(--gold); border-color: var(--gold); color: white; }

    /* deal section light */
    .deal-section { background: white; border-radius: 32px; overflow: hidden; display: grid; grid-template-columns: 1fr 1fr; box-shadow: var(--shadow-sm); border: 1px solid #f0e2d8; }
    .deal-img img { width: 100%; height: 100%; object-fit: cover; min-height: 380px; }
    .deal-content { padding: 48px 44px; background: white; }
    .deal-discount-badge { background: #e06c5c; color: white; padding: 6px 16px; border-radius: 60px; font-size: 13px; font-weight: 700; display: inline-block; margin-bottom: 20px; }
    .deal-content h2 { font-family: 'Cormorant Garamond', serif; font-size: 42px; font-weight: 500; color: #2c241f; }
    .timer { display: flex; gap: 14px; margin: 28px 0 24px; }
    .time-box { background: #fef3ea; border-radius: 20px; padding: 12px 16px; text-align: center; min-width: 70px; border: 1px solid #f5e3d6; }
    .time-num { font-family: 'Cormorant Garamond', serif; font-size: 32px; font-weight: 700; color: var(--gold); }
    .time-label { font-size: 10px; text-transform: uppercase; color: #927e6e; letter-spacing: 0.05em; }

    /* testimonials soft */
    .testimonials-grid { display: grid; grid-template-columns: repeat(2, 1fr); gap: 24px; }
    .testimonial-card { background: white; border-radius: 28px; padding: 28px; box-shadow: var(--shadow-sm); border: 1px solid #f2e5db; transition: 0.2s; }
    .testimonial-card:hover { border-color: #ffd7bf; }
    .t-stars { color: #f5b042; font-size: 16px; margin-bottom: 14px; letter-spacing: 2px; }
    .t-text { color: #4c3c34; line-height: 1.6; margin-bottom: 18px; font-style: normal; }
    .t-avatar { width: 44px; height: 44px; border-radius: 50%; object-fit: cover; border: 2px solid var(--gold-dim); }
    .t-name { font-weight: 700; color: #2f241f; }

    /* newsletter vibrant */
    .newsletter {
      background: linear-gradient(110deg, #fff3e8 0%, #ffe6d6 100%);
      border-radius: 40px; padding: 64px 48px; text-align: center; border: 1px solid #f3e0d2;
    }
    .newsletter h2 { font-family: 'Cormorant Garamond', serif; font-size: 44px; font-weight: 500; color: #3e2d27; }
    .newsletter-form input { padding: 14px 24px; border-radius: 60px; border: 1px solid #e2cfbf; background: white; width: 280px; font-size: 14px; outline: none; transition: 0.2s; }
    .newsletter-form input:focus { border-color: var(--gold); box-shadow: 0 0 0 2px rgba(198,110,44,0.2); }

    footer { background: #fef6ef; border-top: 1px solid #f0e0d4; padding: 56px 0 32px; color: #5f4c41; }
    .footer-brand { font-family: 'Cormorant Garamond', serif; font-size: 24px; font-weight: 700; background: linear-gradient(135deg, #c66e2c, #aa4f1c); background-clip: text; -webkit-background-clip: text; color: transparent; }
    .footer-socials a { background: white; border-radius: 12px; width: 38px; height: 38px; display: inline-grid; place-items: center; color: #b68c74; transition: 0.2s; border: 1px solid #eedbcb; }
    .footer-socials a:hover { color: var(--gold); border-color: var(--gold); }
    .fade-in { opacity: 0; transform: translateY(24px); transition: opacity 0.6s ease, transform 0.6s ease; }
    .fade-in.visible { opacity: 1; transform: translateY(0); }

    @media (max-width: 1100px) { .categories-grid { grid-template-columns: repeat(3,1fr); } .products-grid { grid-template-columns: repeat(3,1fr); } }
    @media (max-width: 860px) { nav.main-nav { display: none; } .mobile-toggle { display: block; } .products-grid { grid-template-columns: repeat(2,1fr); } .hero h1 { font-size: 46px; } .deal-section { grid-template-columns: 1fr; } .testimonials-grid { grid-template-columns: 1fr; } }
    @media (max-width: 580px) { .products-grid { grid-template-columns: 1fr; } .categories-grid { grid-template-columns: repeat(2,1fr); } .newsletter-form input { width: 100%; } .deal-content { padding: 28px; } }
  </style>
</head>
<body>

<header>
  <div class="container header-inner">
    <div style="display:flex; align-items:center; gap:16px;">
      <button class="mobile-toggle" id="mobileToggle"><i class="fas fa-bars"></i></button>
      <a class="brand" href="#">Nexus<span>Shop</span></a>
    </div>
    <nav class="main-nav">
      <ul><li><a href="#">Home</a></li><li><a href="#">Categories</a></li><li><a href="#">Trending</a></li><li><a href="#deals">Deals</a></li><li><a href="#about">About</a></li></ul>
    </nav>
    <div style="display:flex; gap:12px; align-items:center;">
      <div class="search-wrap"><button><i class="fas fa-search"></i></button><input type="search" id="searchInput" placeholder="Search..."/><button id="searchBtn"><i class="fas fa-arrow-right"></i></button></div>
      <div class="header-actions"><button class="icon-btn"><i class="far fa-user"></i></button><button class="icon-btn"><i class="far fa-heart"></i></button><div class="cart-btn" id="cartBtn"><i class="fas fa-bag-shopping"></i><span class="cart-count" id="cartCount">0</span></div></div>
    </div>
  </div>
  <div id="mobileMenu" style="display:none; background:white; border-top:1px solid #f0e2d8;"><ul><li><a href="#">Home</a></li><li><a href="#">Categories</a></li><li><a href="#">Trending</a></li><li><a href="#deals">Deals</a></li></ul></div>
</header>

<main>
  <section class="hero">
    <div class="hero-bg"></div>
    <div class="container" style="padding:70px 0 70px; position:relative;">
      <div class="hero-content"><div class="hero-eyebrow">Autumn Harvest 2024</div><h1>Curated For The <em>Colorful Soul</em></h1><p>Discover bold fashion, premium gadgets, and accessories — vibrant arrivals + free express shipping.</p><div class="hero-cta"><button class="btn btn-gold" id="shopNow">Shop Now <i class="fas fa-arrow-right"></i></button><button class="btn btn-outline" id="exploreDeals">Flash Sale</button></div><div class="hero-stats"><div class="stat-box"><div class="stat-num">18k+</div><div class="stat-label">Products</div></div><div class="stat-box"><div class="stat-num">99%</div><div class="stat-label">Happy buyers</div></div><div class="stat-box"><div class="stat-num">4.9★</div><div class="stat-label">Rating</div></div></div></div>
    </div>
  </section>

  <section class="section container fade-in"><div class="section-head centered"><div class="eyebrow">Explore</div><h2>Shop by Category</h2><p>Discover curated collections just for you.</p></div><div class="categories-grid" id="categoriesGrid"></div></section>
  <section class="section container fade-in"><div class="section-head" style="display:flex;justify-content:space-between;"><div><div class="eyebrow">Bestsellers</div><h2>Popular Right Now</h2></div><a href="#" style="color:var(--gold); font-weight:600;">View all →</a></div><div class="products-grid" id="productsGrid"></div></section>
  <section id="deals" class="section container fade-in"><div class="section-head"><div class="eyebrow">Limited Offer</div><h2>Flash Sale</h2></div><div class="deal-section"><div class="deal-img"><img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=900&q=80" alt="MacBook Air M2"></div><div class="deal-content"><div class="deal-discount-badge">Save 17% — Today Only</div><h2>MacBook Air M2</h2><p>Supercharged by M2 chip. Thin, light, and all‑day battery life.</p><div class="timer"><div class="time-box"><div class="time-num" id="dealDays">0</div><div class="time-label">Days</div></div><div class="time-box"><div class="time-num" id="dealHours">00</div><div class="time-label">Hrs</div></div><div class="time-box"><div class="time-num" id="dealMinutes">00</div><div class="time-label">Min</div></div><div class="time-box"><div class="time-num" id="dealSeconds">00</div><div class="time-label">Sec</div></div></div><div class="deal-price"><span class="price">$999</span><span class="old-price">$1,199</span></div><button class="btn btn-gold" id="buyDeal">Add to Cart <i class="fas fa-bag-shopping"></i></button></div></div></section>
  <section class="section container fade-in"><div class="section-head centered"><div class="eyebrow">Testimonials</div><h2>Loved by customers</h2></div><div class="testimonials-grid"><div class="testimonial-card"><div class="t-stars">★★★★★</div><p class="t-text">"The most beautiful shopping experience! Vibrant design and fast delivery. Absolutely premium."</p><div class="t-author"><img class="t-avatar" src="https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=80&q=80"><div><div class="t-name">Ava Martin</div><div class="t-label">Verified</div></div></div></div><div class="testimonial-card"><div class="t-stars">★★★★★</div><p class="t-text">"Love the bold new look! Found amazing laptop and clothing. Great support."</p><div class="t-author"><img class="t-avatar" src="https://images.unsplash.com/photo-1546456073-6712f79251bb?auto=format&fit=crop&w=80&q=80"><div><div class="t-name">Michael Lee</div></div></div></div></div></section>
  <section class="section container fade-in"><div class="newsletter"><h2>Stay in the Loop</h2><p>Get early access & exclusive member drops</p><form id="newsletterForm" onsubmit="return false;"><input id="newsletterEmail" type="email" placeholder="Your email address"/><button class="btn btn-gold" id="subscribeBtn">Subscribe</button></form><div id="newsletterMsg"></div></div></section>
</main>
<footer><div class="container"><div class="footer-inner" style="display:flex; gap:40px; flex-wrap:wrap;"><div><div class="footer-brand">Nexus<span>Shop</span></div><p style="margin-top:8px;">Colorful, premium, effortless.</p><div class="footer-socials" style="display:flex; gap:12px; margin-top:16px;"><a href="#"><i class="fab fa-instagram"></i></a><a href="#"><i class="fab fa-twitter"></i></a><a href="#"><i class="fab fa-pinterest"></i></a></div></div><div><h4>Support</h4><a href="#">Shipping</a><a href="#">Returns</a></div><div><h4>Legal</h4><a href="#">Privacy</a><a href="#">Terms</a></div></div><div class="footer-bottom" style="margin-top:40px; text-align:center;">© <span id="year"></span> NexusShop — vibrant commerce</div></div></footer>

<script>
  // ---------- EXPANDED PRODUCTS with high-quality images for each category ----------
  const PRODUCTS = [
    { id:1, title:'iPhone 15 Pro Max', price:1199, oldPrice:1299, rating:5, reviews:230, badge:'new', img:'https://images.unsplash.com/photo-1695048133142-1a20484d2569?auto=format&fit=crop&w=600&q=80', category:'smartphones' },
    { id:2, title:'Samsung Galaxy S24 Ultra', price:1099, rating:5, reviews:189, badge:'', img:'https://images.unsplash.com/photo-1610945415295-d9bbf067e59c?auto=format&fit=crop&w=600&q=80', category:'smartphones' },
    { id:3, title:'Google Pixel 8 Pro', price:899, oldPrice:999, rating:4.5, reviews:112, badge:'sale', img:'https://images.unsplash.com/photo-1592890288564-76628a30a657?auto=format&fit=crop&w=600&q=80', category:'smartphones' },
    { id:4, title:'MacBook Pro 14" M3', price:1999, rating:5, reviews:302, badge:'new', img:'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=600&q=80', category:'laptops' },
    { id:5, title:'Dell XPS 13 Plus', price:1499, rating:4, reviews:78, img:'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&w=600&q=80', category:'laptops' },
    { id:6, title:'ASUS ROG Zephyrus', price:1799, rating:5, reviews:94, img:'https://images.unsplash.com/photo-1603302576837-37561b2e2302?auto=format&fit=crop&w=600&q=80', category:'laptops' },
    { id:7, title:'Oversized Denim Jacket', price:89, rating:4.5, reviews:210, badge:'', img:'https://images.unsplash.com/photo-1551537482-f2075a1d41f2?auto=format&fit=crop&w=600&q=80', category:'clothing' },
    { id:8, title:'Cashmere Sweater', price:129, oldPrice:199, rating:5, reviews:88, badge:'sale', img:'https://images.unsplash.com/photo-1576566588028-4147f3842f27?auto=format&fit=crop&w=600&q=80', category:'clothing' },
    { id:9, title:'Silk Midi Dress', price:149, rating:4.7, reviews:67, img:'https://images.unsplash.com/photo-1612336307429-8a898d10e223?auto=format&fit=crop&w=600&q=80', category:'clothing' },
    { id:10, title:'Sony WH-1000XM5', price:399, rating:5, reviews:346, badge:'new', img:'https://images.unsplash.com/photo-1618366712010-f4ae9c647dcb?auto=format&fit=crop&w=600&q=80', category:'gadgets' },
    { id:11, title:'DJI Mini 4 Pro', price:759, rating:5, reviews:91, img:'https://images.unsplash.com/photo-1507582020474-9a35b7d455d9?auto=format&fit=crop&w=600&q=80', category:'gadgets' },
    { id:12, title:'Nike Air Max Pulse', price:150, rating:4, reviews:203, img:'https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&w=600&q=80', category:'footwear' },
    { id:13, title:'Adidas Ultraboost Light', price:180, rating:4.5, reviews:112, img:'https://images.unsplash.com/photo-1605348532760-6753d2c43329?auto=format&fit=crop&w=600&q=80', category:'footwear' },
    { id:14, title:'Leather Chelsea Boots', price:199, rating:5, reviews:76, img:'https://images.unsplash.com/photo-1549298916-b41d501d3772?auto=format&fit=crop&w=600&q=80', category:'footwear' },
    { id:15, title:'Minimalist Watch', price:249, rating:4.8, reviews:144, badge:'', img:'https://images.unsplash.com/photo-1522312346375-d1a52e2b99b3?auto=format&fit=crop&w=600&q=80', category:'accessories' },
    { id:16, title:'Leather Backpack', price:119, rating:4.5, reviews:98, img:'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?auto=format&fit=crop&w=600&q=80', category:'accessories' }
  ];

  const CATEGORIES = [
    { id: 'smartphones', name: 'Smartphones', icon: 'fa-mobile-alt' },
    { id: 'laptops', name: 'Laptops', icon: 'fa-laptop' },
    { id: 'clothing', name: 'Clothing', icon: 'fa-tshirt' },
    { id: 'gadgets', name: 'Gadgets', icon: 'fa-headphones' },
    { id: 'footwear', name: 'Footwear', icon: 'fa-shoe-prints' },
    { id: 'accessories', name: 'Accessories', icon: 'fa-gem' }
  ];

  let cartCount = 0;
  const cartCountEl = document.getElementById('cartCount');
  const searchInput = document.getElementById('searchInput');

  function renderCategories() {
    const grid = document.getElementById('categoriesGrid');
    grid.innerHTML = '';
    CATEGORIES.forEach(cat => {
      const card = document.createElement('div');
      card.className = 'cat-card';
      card.innerHTML = `<div class="cat-icon"><i class="fas ${cat.icon}"></i></div><h4>${cat.name}</h4><span>Shop →</span>`;
      card.addEventListener('click', () => { searchInput.value = cat.name; filterProducts(cat.name); document.getElementById('productsGrid').scrollIntoView({behavior:'smooth'}); });
      grid.appendChild(card);
    });
  }

  function renderProducts(list) {
    const grid = document.getElementById('productsGrid');
    grid.innerHTML = '';
    if(!list.length) { grid.innerHTML = '<div style="grid-column:1/-1; text-align:center; padding:60px;">✨ No products found</div>'; return; }
    list.forEach(p => {
      const el = document.createElement('div'); el.className = 'product-card';
      const badgeHtml = p.badge === 'new' ? '<span class="product-badge">New</span>' : (p.badge === 'sale' ? '<span class="product-badge badge-sale">Sale</span>' : '');
      el.innerHTML = `<div class="product-img-wrap">${badgeHtml}<img src="${p.img}" alt="${p.title}" loading="lazy"><button class="wish-overlay"><i class="far fa-heart"></i></button></div>
                      <div class="product-body"><div class="product-cat">${p.category}</div><h5>${p.title}</h5><div class="price-row"><div><span class="price">$${p.price.toLocaleString()}</span>${p.oldPrice ? `<span class="old-price"> $${p.oldPrice.toLocaleString()}</span>` : ''}</div><span class="rating">${'★'.repeat(Math.round(p.rating))}</span></div></div>
                      <div class="product-footer"><button class="add-btn" data-id="${p.id}"><i class="fas fa-bag-shopping"></i> Add to Cart</button></div>`;
      grid.appendChild(el);
    });
    document.querySelectorAll('.add-btn').forEach(btn => btn.addEventListener('click', (e) => { e.stopPropagation(); addToCart(parseInt(btn.dataset.id)); btn.innerHTML = '<i class="fas fa-check"></i> Added!'; btn.disabled=true; setTimeout(()=>{ btn.innerHTML='<i class="fas fa-bag-shopping"></i> Add to Cart'; btn.disabled=false; },1200); }));
  }

  function filterProducts(query) {
    const q = query.trim().toLowerCase();
    if(!q) return renderProducts(PRODUCTS);
    const filtered = PRODUCTS.filter(p => p.title.toLowerCase().includes(q) || p.category.toLowerCase().includes(q));
    renderProducts(filtered);
  }

  function addToCart(id) { cartCount++; cartCountEl.textContent = cartCount; }

  document.getElementById('searchBtn').addEventListener('click', () => filterProducts(searchInput.value));
  searchInput.addEventListener('keydown', e => { if(e.key === 'Enter') filterProducts(e.target.value); });
  document.getElementById('mobileToggle').addEventListener('click', () => { let m = document.getElementById('mobileMenu'); m.style.display = m.style.display === 'block' ? 'none' : 'block'; });
  document.getElementById('newsletterForm').addEventListener('submit', (e) => { e.preventDefault(); const email = document.getElementById('newsletterEmail').value; const msgDiv = document.getElementById('newsletterMsg'); if(!email.includes('@')){ msgDiv.style.color='#e06c5c'; msgDiv.innerText='Valid email required'; } else { msgDiv.style.color='#c66e2c'; msgDiv.innerText='✓ Thanks for joining!'; document.getElementById('newsletterEmail').value=''; setTimeout(()=> msgDiv.innerText='',2500); } });
  document.getElementById('shopNow').addEventListener('click', () => document.getElementById('productsGrid').scrollIntoView({behavior:'smooth'}));
  document.getElementById('exploreDeals').addEventListener('click', () => document.getElementById('deals').scrollIntoView({behavior:'smooth'}));
  document.getElementById('buyDeal').addEventListener('click', () => { cartCount++; cartCountEl.textContent = cartCount; const btn = document.getElementById('buyDeal'); btn.innerHTML = '<i class="fas fa-check"></i> Added!'; setTimeout(()=> btn.innerHTML='Add to Cart <i class="fas fa-bag-shopping"></i>',1500); });
  function updateTimer(){ const target = new Date(Date.now() + (23 * 3600000) + (45 * 60000)); const i=setInterval(()=>{ const diff = target-Date.now(); if(diff<=0){clearInterval(i); document.getElementById('dealDays').innerText='0'; return;} document.getElementById('dealDays').innerText=Math.floor(diff/86400000); document.getElementById('dealHours').innerText=String(Math.floor((diff%86400000)/3600000)).padStart(2,'0'); document.getElementById('dealMinutes').innerText=String(Math.floor((diff%3600000)/60000)).padStart(2,'0'); document.getElementById('dealSeconds').innerText=String(Math.floor((diff%60000)/1000)).padStart(2,'0'); },1000); } updateTimer();
  const observer = new IntersectionObserver(entries=>entries.forEach(e=>{if(e.isIntersecting){e.target.classList.add('visible'); observer.unobserve(e.target);}}),{threshold:0.1});
  document.querySelectorAll('.fade-in').forEach(el=>observer.observe(el));
  renderCategories(); renderProducts(PRODUCTS); document.getElementById('year').innerText = new Date().getFullYear();
</script>
</body>
</html>
