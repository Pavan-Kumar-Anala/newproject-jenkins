   <!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width,initial-scale=1"/>
  <title>NexusShop — Premium Commerce</title>
  <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@300;400;600;700&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" crossorigin="anonymous">

  <style>
    :root {
      --bg: #0c0c0e;
      --surface: #141416;
      --card: #18181c;
      --border: rgba(255,255,255,0.06);
      --text: #f0ede8;
      --muted: #7a7870;
      --gold: #c9a96e;
      --gold-light: #e8c98a;
      --gold-dim: rgba(201,169,110,0.12);
      --radius: 16px;
      --container: 1260px;
    }

    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
    html { scroll-behavior: smooth; }

    body {
      font-family: 'DM Sans', system-ui, sans-serif;
      background: var(--bg);
      color: var(--text);
      -webkit-font-smoothing: antialiased;
      overflow-x: hidden;
    }

    /* Noise grain overlay */
    body::before {
      content: '';
      position: fixed;
      inset: 0;
      background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 512 512' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.75' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)' opacity='0.04'/%3E%3C/svg%3E");
      pointer-events: none;
      z-index: 999;
      opacity: 0.35;
    }

    a { text-decoration: none; color: inherit; }

    .container { width: 100%; max-width: var(--container); margin: 0 auto; padding: 0 28px; }

    /* ─── HEADER ─── */
    header {
      position: sticky; top: 0; z-index: 100;
      background: rgba(12,12,14,0.88);
      backdrop-filter: blur(18px) saturate(1.4);
      border-bottom: 1px solid var(--border);
    }

    .header-inner {
      display: flex; align-items: center; justify-content: space-between;
      gap: 20px; padding: 16px 0;
    }

    .brand {
      font-family: 'Cormorant Garamond', serif;
      font-size: 24px; font-weight: 600; letter-spacing: 0.04em;
      color: var(--text);
    }
    .brand span { color: var(--gold); }

    nav.main-nav ul {
      display: flex; gap: 4px; list-style: none; align-items: center;
    }
    nav.main-nav li a {
      display: flex; align-items: center; gap: 8px;
      padding: 8px 14px; border-radius: 8px;
      font-size: 14px; font-weight: 500; color: var(--muted);
      transition: color .2s, background .2s;
    }
    nav.main-nav li a:hover { color: var(--text); background: rgba(255,255,255,0.04); }

    .search-wrap {
      display: flex; align-items: center; gap: 10px;
      background: var(--surface); border: 1px solid var(--border);
      padding: 9px 14px; border-radius: 999px;
      min-width: 220px; transition: border-color .2s;
    }
    .search-wrap:focus-within { border-color: var(--gold); }
    .search-wrap input {
      border: 0; background: transparent; outline: none;
      font-size: 13px; color: var(--text); width: 100%;
      font-family: inherit;
    }
    .search-wrap input::placeholder { color: var(--muted); }
    .search-wrap button {
      background: none; border: 0; cursor: pointer;
      color: var(--muted); font-size: 14px; transition: color .2s;
    }
    .search-wrap button:hover { color: var(--gold); }

    .header-actions { display: flex; align-items: center; gap: 6px; }
    .icon-btn {
      background: none; border: 0; cursor: pointer;
      color: var(--muted); font-size: 16px; padding: 8px;
      border-radius: 8px; transition: color .2s, background .2s;
    }
    .icon-btn:hover { color: var(--text); background: rgba(255,255,255,0.05); }

    .cart-btn {
      position: relative; display: inline-flex; align-items: center;
      gap: 8px; padding: 8px 14px; border-radius: 999px;
      background: var(--gold-dim); border: 1px solid rgba(201,169,110,0.2);
      color: var(--gold); font-size: 14px; cursor: pointer;
      transition: background .2s, border-color .2s;
    }
    .cart-btn:hover { background: rgba(201,169,110,0.2); border-color: rgba(201,169,110,0.4); }
    .cart-count {
      background: var(--gold); color: #0c0c0e;
      font-size: 11px; font-weight: 700; width: 18px; height: 18px;
      border-radius: 50%; display: inline-grid; place-items: center;
    }

    .mobile-toggle { display: none; background: none; border: 0; cursor: pointer; font-size: 20px; color: var(--text); }

    /* ─── HERO ─── */
    .hero {
      position: relative; overflow: hidden;
      min-height: 540px;
      display: flex; align-items: center;
    }

    .hero-bg {
      position: absolute; inset: 0;
      background:
        radial-gradient(ellipse 80% 60% at 60% 50%, rgba(201,169,110,0.08) 0%, transparent 70%),
        linear-gradient(180deg, rgba(12,12,14,0.2) 0%, rgba(12,12,14,0.85) 100%),
        url('https://images.unsplash.com/photo-1555529669-e69e7aa0ba9a?auto=format&fit=crop&w=1600&q=80') center/cover no-repeat;
    }

    .hero-content {
      position: relative; z-index: 2;
      max-width: 620px;
      animation: fadeUp .8s ease both;
    }
    .hero-eyebrow {
      display: inline-flex; align-items: center; gap: 8px;
      font-size: 12px; font-weight: 600; letter-spacing: 0.12em;
      text-transform: uppercase; color: var(--gold);
      margin-bottom: 20px;
    }
    .hero-eyebrow::before {
      content: ''; display: block; width: 28px; height: 1px; background: var(--gold);
    }
    .hero h1 {
      font-family: 'Cormorant Garamond', serif;
      font-size: 62px; font-weight: 300; line-height: 1.08;
      letter-spacing: -0.02em; margin-bottom: 20px; color: var(--text);
    }
    .hero h1 em { font-style: italic; color: var(--gold); }
    .hero p {
      font-size: 16px; line-height: 1.7; color: var(--muted);
      margin-bottom: 36px; max-width: 480px;
    }
    .hero-cta { display: flex; gap: 12px; flex-wrap: wrap; }

    .btn {
      display: inline-flex; align-items: center; gap: 10px;
      padding: 13px 26px; border-radius: 999px;
      font-weight: 600; font-size: 14px; cursor: pointer; border: 0;
      font-family: inherit; transition: all .2s;
    }
    .btn-gold {
      background: var(--gold); color: #0c0c0e;
      box-shadow: 0 8px 32px rgba(201,169,110,0.3);
    }
    .btn-gold:hover { background: var(--gold-light); transform: translateY(-1px); box-shadow: 0 12px 40px rgba(201,169,110,0.4); }
    .btn-outline {
      background: transparent; border: 1px solid var(--border);
      color: var(--text);
    }
    .btn-outline:hover { border-color: rgba(255,255,255,0.2); background: rgba(255,255,255,0.04); }

    /* Hero stats */
    .hero-stats {
      position: absolute; bottom: 40px; right: 0; z-index: 2;
      display: flex; gap: 1px;
    }
    .stat-box {
      background: rgba(20,20,22,0.8); backdrop-filter: blur(12px);
      border: 1px solid var(--border); padding: 20px 28px;
      text-align: center;
    }
    .stat-box:first-child { border-radius: 12px 0 0 12px; }
    .stat-box:last-child { border-radius: 0 12px 12px 0; }
    .stat-num { font-family: 'Cormorant Garamond', serif; font-size: 28px; font-weight: 600; color: var(--gold); }
    .stat-label { font-size: 11px; color: var(--muted); text-transform: uppercase; letter-spacing: 0.08em; margin-top: 2px; }

    /* ─── SECTIONS ─── */
    .section { padding: 80px 0; }
    .section-head { margin-bottom: 48px; }
    .section-head .eyebrow {
      font-size: 11px; font-weight: 600; letter-spacing: 0.14em;
      text-transform: uppercase; color: var(--gold); margin-bottom: 12px;
    }
    .section-head h2 {
      font-family: 'Cormorant Garamond', serif;
      font-size: 40px; font-weight: 300; letter-spacing: -0.01em;
    }
    .section-head p { color: var(--muted); margin-top: 8px; font-size: 15px; line-height: 1.6; }

    .section-head.centered { text-align: center; }
    .section-head.centered .eyebrow::before,
    .section-head.centered .eyebrow::after {
      content: '——'; margin: 0 8px; opacity: 0.4;
    }

    /* ─── CATEGORIES ─── */
    .categories-grid {
      display: grid;
      grid-template-columns: repeat(6, 1fr);
      gap: 16px;
    }

    .cat-card {
      background: var(--card);
      border: 1px solid var(--border);
      border-radius: var(--radius);
      padding: 28px 16px 22px;
      text-align: center;
      cursor: pointer;
      transition: border-color .25s, transform .25s, background .25s;
      position: relative; overflow: hidden;
    }
    .cat-card::after {
      content: '';
      position: absolute; bottom: 0; left: 50%; transform: translateX(-50%);
      width: 0; height: 2px; background: var(--gold);
      transition: width .3s;
    }
    .cat-card:hover { border-color: rgba(201,169,110,0.3); transform: translateY(-4px); background: #1c1c20; }
    .cat-card:hover::after { width: 60%; }
    .cat-icon {
      width: 52px; height: 52px; border-radius: 14px;
      background: var(--gold-dim); display: inline-grid; place-items: center;
      font-size: 22px; color: var(--gold); margin-bottom: 14px;
      transition: background .25s, transform .25s;
    }
    .cat-card:hover .cat-icon { background: rgba(201,169,110,0.2); transform: scale(1.08); }
    .cat-card h4 { font-size: 13px; font-weight: 600; letter-spacing: 0.02em; }
    .cat-card span { font-size: 11px; color: var(--muted); margin-top: 4px; display: block; }

    /* ─── PRODUCTS ─── */
    .products-grid {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: 20px;
    }

    .product-card {
      background: var(--card);
      border: 1px solid var(--border);
      border-radius: var(--radius);
      overflow: hidden;
      display: flex; flex-direction: column;
      transition: border-color .25s, transform .3s;
      position: relative;
    }
    .product-card:hover { border-color: rgba(201,169,110,0.25); transform: translateY(-6px); }

    .product-img-wrap {
      position: relative; overflow: hidden;
      background: var(--surface);
    }
    .product-img-wrap img {
      width: 100%; height: 220px; object-fit: cover; display: block;
      transition: transform .5s ease;
    }
    .product-card:hover .product-img-wrap img { transform: scale(1.06); }

    .product-badge {
      position: absolute; top: 12px; left: 12px;
      padding: 5px 10px; border-radius: 6px;
      font-size: 11px; font-weight: 700; letter-spacing: 0.05em;
      text-transform: uppercase;
    }
    .badge-new { background: var(--gold); color: #0c0c0e; }
    .badge-sale { background: #e05c5c; color: white; }

    .wish-overlay {
      position: absolute; top: 12px; right: 12px;
      width: 34px; height: 34px; border-radius: 50%;
      background: rgba(12,12,14,0.75); backdrop-filter: blur(8px);
      display: grid; place-items: center;
      cursor: pointer; border: 1px solid var(--border);
      color: var(--muted); font-size: 13px;
      opacity: 0; transition: opacity .2s, color .2s;
    }
    .product-card:hover .wish-overlay { opacity: 1; }
    .wish-overlay:hover { color: #e05c5c; }

    .product-body { padding: 16px 18px 12px; flex: 1; }
    .product-cat { font-size: 11px; text-transform: uppercase; letter-spacing: 0.1em; color: var(--muted); margin-bottom: 6px; }
    .product-body h5 { font-size: 15px; font-weight: 500; margin-bottom: 10px; }
    .price-row { display: flex; align-items: center; justify-content: space-between; gap: 8px; }
    .price { font-family: 'Cormorant Garamond', serif; font-size: 22px; font-weight: 600; color: var(--gold); }
    .old-price { font-size: 13px; color: var(--muted); text-decoration: line-through; }
    .rating { font-size: 12px; color: #c9a96e; }

    .product-footer { padding: 12px 18px 16px; }
    .add-btn {
      width: 100%; background: var(--surface); border: 1px solid var(--border);
      color: var(--text); padding: 11px; border-radius: 10px;
      cursor: pointer; font-weight: 600; font-size: 13px;
      font-family: inherit; transition: background .2s, border-color .2s, color .2s;
      display: flex; align-items: center; justify-content: center; gap: 8px;
    }
    .add-btn:hover { background: var(--gold); border-color: var(--gold); color: #0c0c0e; }
    .add-btn:disabled { opacity: 0.6; pointer-events: none; }

    /* ─── DEAL ─── */
    .deal-section {
      background: var(--card);
      border: 1px solid var(--border);
      border-radius: 20px;
      overflow: hidden;
      display: grid; grid-template-columns: 1fr 1fr;
    }
    .deal-img {
      position: relative;
    }
    .deal-img img { width: 100%; height: 100%; object-fit: cover; display: block; min-height: 400px; }
    .deal-img::after {
      content: '';
      position: absolute; inset: 0;
      background: linear-gradient(90deg, transparent 60%, var(--card));
    }
    .deal-content { padding: 52px 48px; display: flex; flex-direction: column; justify-content: center; }
    .deal-discount-badge {
      display: inline-block; background: #e05c5c; color: white;
      padding: 6px 14px; border-radius: 999px; font-size: 13px;
      font-weight: 700; margin-bottom: 20px; width: fit-content;
    }
    .deal-content h2 {
      font-family: 'Cormorant Garamond', serif;
      font-size: 44px; font-weight: 300; line-height: 1.1; margin-bottom: 12px;
    }
    .deal-content p { color: var(--muted); font-size: 15px; line-height: 1.6; margin-bottom: 28px; }

    .timer { display: flex; gap: 12px; margin-bottom: 32px; }
    .time-box {
      background: var(--surface); border: 1px solid var(--border);
      border-radius: 12px; padding: 16px 20px; text-align: center; min-width: 72px;
    }
    .time-num {
      font-family: 'Cormorant Garamond', serif;
      font-size: 32px; font-weight: 600; color: var(--gold); line-height: 1;
    }
    .time-label { font-size: 10px; color: var(--muted); text-transform: uppercase; letter-spacing: 0.1em; margin-top: 4px; }

    .deal-price {
      display: flex; align-items: baseline; gap: 12px; margin-bottom: 24px;
    }
    .deal-price .price { font-size: 36px; }
    .deal-price .old-price { font-size: 16px; }

    /* ─── TESTIMONIALS ─── */
    .testimonials-grid { display: grid; grid-template-columns: repeat(2, 1fr); gap: 20px; }
    .testimonial-card {
      background: var(--card); border: 1px solid var(--border);
      border-radius: var(--radius); padding: 28px 28px 24px;
      transition: border-color .25s;
    }
    .testimonial-card:hover { border-color: rgba(201,169,110,0.2); }
    .t-stars { color: var(--gold); font-size: 14px; margin-bottom: 14px; }
    .t-text { color: var(--muted); font-size: 14px; line-height: 1.7; font-style: italic; margin-bottom: 20px; }
    .t-author { display: flex; align-items: center; gap: 12px; }
    .t-avatar {
      width: 40px; height: 40px; border-radius: 50%; object-fit: cover;
      border: 2px solid var(--gold-dim);
    }
    .t-name { font-weight: 600; font-size: 14px; }
    .t-label { font-size: 12px; color: var(--muted); }

    /* ─── NEWSLETTER ─── */
    .newsletter {
      background:
        radial-gradient(ellipse 60% 80% at 50% 100%, rgba(201,169,110,0.1) 0%, transparent 70%),
        var(--card);
      border: 1px solid var(--border);
      border-radius: 20px; padding: 64px 40px; text-align: center;
    }
    .newsletter h2 {
      font-family: 'Cormorant Garamond', serif;
      font-size: 42px; font-weight: 300; margin-bottom: 12px;
    }
    .newsletter p { color: var(--muted); margin-bottom: 32px; font-size: 15px; }
    .newsletter-form {
      display: flex; justify-content: center; gap: 10px; flex-wrap: wrap;
    }
    .newsletter-form input {
      padding: 13px 22px; border-radius: 999px;
      border: 1px solid var(--border); background: var(--surface);
      color: var(--text); font-size: 14px; font-family: inherit;
      outline: none; min-width: 280px; transition: border-color .2s;
    }
    .newsletter-form input:focus { border-color: var(--gold); }
    .newsletter-form input::placeholder { color: var(--muted); }
    #newsletterMsg { margin-top: 16px; font-size: 14px; display: none; }

    /* ─── FOOTER ─── */
    footer {
      border-top: 1px solid var(--border);
      padding: 56px 0 32px; color: var(--muted); font-size: 14px;
    }
    .footer-inner { display: flex; gap: 60px; align-items: flex-start; flex-wrap: wrap; }
    .footer-brand { font-family: 'Cormorant Garamond', serif; font-size: 20px; font-weight: 600; color: var(--text); margin-bottom: 10px; }
    .footer-brand span { color: var(--gold); }
    .footer-socials { display: flex; gap: 10px; margin-top: 18px; }
    .footer-socials a {
      width: 36px; height: 36px; border-radius: 8px;
      border: 1px solid var(--border); display: grid; place-items: center;
      color: var(--muted); font-size: 14px; transition: color .2s, border-color .2s;
    }
    .footer-socials a:hover { color: var(--gold); border-color: rgba(201,169,110,0.3); }
    .footer-col h4 { color: var(--text); font-size: 13px; font-weight: 600; letter-spacing: 0.05em; margin-bottom: 14px; }
    .footer-col a { display: block; color: var(--muted); font-size: 13px; margin-bottom: 10px; transition: color .2s; }
    .footer-col a:hover { color: var(--gold); }
    .footer-bottom { border-top: 1px solid var(--border); margin-top: 48px; padding-top: 24px; text-align: center; font-size: 13px; }

    /* ─── ANIMATIONS ─── */
    @keyframes fadeUp {
      from { opacity: 0; transform: translateY(24px); }
      to { opacity: 1; transform: translateY(0); }
    }

    .fade-in {
      opacity: 0; transform: translateY(20px);
      transition: opacity .6s ease, transform .6s ease;
    }
    .fade-in.visible { opacity: 1; transform: translateY(0); }

    /* ─── MOBILE ─── */
    #mobileMenu { display: none; background: var(--surface); border-top: 1px solid var(--border); }
    #mobileMenu ul { list-style: none; padding: 12px 0; }
    #mobileMenu li a { display: block; padding: 10px 28px; font-size: 15px; color: var(--muted); }
    #mobileMenu li a:hover { color: var(--text); }

    @media (max-width: 1100px) {
      .categories-grid { grid-template-columns: repeat(3, 1fr); }
      .products-grid { grid-template-columns: repeat(3, 1fr); }
    }
    @media (max-width: 860px) {
      nav.main-nav { display: none; }
      .mobile-toggle { display: block; }
      .products-grid { grid-template-columns: repeat(2, 1fr); }
      .categories-grid { grid-template-columns: repeat(2, 1fr); }
      .deal-section { grid-template-columns: 1fr; }
      .deal-img img { min-height: 260px; }
      .hero h1 { font-size: 42px; }
      .hero-stats { position: static; margin-top: 40px; }
      .testimonials-grid { grid-template-columns: 1fr; }
    }
    @media (max-width: 580px) {
      .hero h1 { font-size: 32px; }
      .products-grid { grid-template-columns: 1fr; }
      .categories-grid { grid-template-columns: repeat(2, 1fr); }
      .stat-box { padding: 14px 18px; }
      .deal-content { padding: 32px 24px; }
      .hero-stats { flex-wrap: wrap; }
    }
  </style>
</head>
<body>

  <!-- HEADER -->
  <header>
    <div class="container header-inner">
      <div style="display:flex;align-items:center;gap:16px;">
        <button class="mobile-toggle" id="mobileToggle" aria-label="Menu"><i class="fas fa-bars"></i></button>
        <a class="brand" href="#">Nexus<span>Shop</span></a>
      </div>

      <nav class="main-nav" aria-label="Primary">
        <ul>
          <li><a href="#">Home</a></li>
          <li><a href="#">Categories</a></li>
          <li><a href="#">Trending</a></li>
          <li><a href="#deals">Deals</a></li>
          <li><a href="#about">About</a></li>
        </ul>
      </nav>

      <div style="display:flex;align-items:center;gap:12px;">
        <div class="search-wrap">
          <button aria-label="Search"><i class="fas fa-search"></i></button>
          <input type="search" id="searchInput" placeholder="Search products…" aria-label="Search"/>
          <button id="searchBtn" aria-label="Go"><i class="fas fa-arrow-right"></i></button>
        </div>
        <div class="header-actions">
          <a class="icon-btn" title="Account" href="#"><i class="far fa-user"></i></a>
          <a class="icon-btn" title="Wishlist" href="#"><i class="far fa-heart"></i></a>
          <a class="cart-btn" href="#" id="cartBtn" aria-label="Cart">
            <i class="fas fa-bag-shopping"></i>
            <span class="cart-count" id="cartCount">0</span>
          </a>
        </div>
      </div>
    </div>

    <div id="mobileMenu">
      <ul>
        <li><a href="#">Home</a></li>
        <li><a href="#">Categories</a></li>
        <li><a href="#">Trending</a></li>
        <li><a href="#deals">Deals</a></li>
        <li><a href="#about">About</a></li>
      </ul>
    </div>
  </header>

  <main>
    <!-- HERO -->
    <section class="hero">
      <div class="hero-bg"></div>
      <div class="container" style="padding-top:80px;padding-bottom:80px;position:relative;z-index:2;width:100%;">
        <div class="hero-content">
          <div class="hero-eyebrow">Autumn Collection 2024</div>
          <h1>Curated For The<br><em>Discerning Few</em></h1>
          <p>Explore premium fashion, technology and accessories from the world's most celebrated brands — now with exclusive deals and complimentary shipping.</p>
          <div class="hero-cta">
            <button class="btn btn-gold" id="shopNow">Shop Now <i class="fas fa-arrow-right"></i></button>
            <button class="btn btn-outline" id="exploreDeals">View Flash Sale</button>
          </div>
        </div>
        <div class="hero-stats">
          <div class="stat-box">
            <div class="stat-num">12k+</div>
            <div class="stat-label">Products</div>
          </div>
          <div class="stat-box">
            <div class="stat-num">98%</div>
            <div class="stat-label">Satisfaction</div>
          </div>
          <div class="stat-box">
            <div class="stat-num">4.9★</div>
            <div class="stat-label">Rating</div>
          </div>
        </div>
      </div>
    </section>

    <!-- CATEGORIES -->
    <section class="section container fade-in">
      <div class="section-head centered">
        <div class="eyebrow">Browse</div>
        <h2>Shop by Category</h2>
        <p>Explore our curated range across every lifestyle.</p>
      </div>
      <div class="categories-grid" id="categoriesGrid"></div>
    </section>

    <!-- PRODUCTS -->
    <section class="section container fade-in">
      <div class="section-head" style="display:flex;align-items:flex-end;justify-content:space-between;gap:20px;">
        <div>
          <div class="eyebrow">Trending</div>
          <h2>Popular Right Now</h2>
        </div>
        <a href="#" style="color:var(--gold);font-size:14px;font-weight:500;white-space:nowrap;">View all <i class="fas fa-arrow-right" style="font-size:12px;"></i></a>
      </div>
      <div class="products-grid" id="productsGrid"></div>
    </section>

    <!-- DEAL -->
    <section id="deals" class="section container fade-in">
      <div class="section-head">
        <div class="eyebrow">Limited Time</div>
        <h2>Flash Sale</h2>
      </div>
      <div class="deal-section">
        <div class="deal-img">
          <img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=900&q=80" alt="MacBook Air M2">
        </div>
        <div class="deal-content">
          <div class="deal-discount-badge">Save 17% — Today Only</div>
          <h2>MacBook Air M2</h2>
          <p>Extraordinarily thin. Remarkably powerful. The new M2 chip delivers next-level performance in the world's most portable laptop.</p>
          <div class="timer">
            <div class="time-box"><div class="time-num" id="dealDays">0</div><div class="time-label">Days</div></div>
            <div class="time-box"><div class="time-num" id="dealHours">00</div><div class="time-label">Hrs</div></div>
            <div class="time-box"><div class="time-num" id="dealMinutes">00</div><div class="time-label">Min</div></div>
            <div class="time-box"><div class="time-num" id="dealSeconds">00</div><div class="time-label">Sec</div></div>
          </div>
          <div class="deal-price">
            <div class="price">$999</div>
            <div class="old-price">$1,199</div>
          </div>
          <p style="font-size:13px;color:var(--muted);margin-bottom:20px;">Only <strong style="color:var(--text);">12 units</strong> left at this price.</p>
          <button class="btn btn-gold" id="buyDeal">Add to Cart <i class="fas fa-bag-shopping"></i></button>
        </div>
      </div>
    </section>

    <!-- TESTIMONIALS -->
    <section class="section container fade-in">
      <div class="section-head centered">
        <div class="eyebrow">Reviews</div>
        <h2>What Our Customers Say</h2>
        <p>Verified feedback from real buyers.</p>
      </div>
      <div class="testimonials-grid">
        <div class="testimonial-card">
          <div class="t-stars">★★★★★</div>
          <p class="t-text">"Fast shipping and exceptional customer support. The product far exceeded my expectations — this is premium quality at a fair price."</p>
          <div class="t-author">
            <img class="t-avatar" src="https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=80&q=80" alt="Ava Martin">
            <div><div class="t-name">Ava Martin</div><div class="t-label">Verified buyer</div></div>
          </div>
        </div>
        <div class="testimonial-card">
          <div class="t-stars">★★★★☆</div>
          <p class="t-text">"Outstanding selection and a seamless checkout experience. I've been shopping here for months and every order has been flawless."</p>
          <div class="t-author">
            <img class="t-avatar" src="https://images.unsplash.com/photo-1546456073-6712f79251bb?auto=format&fit=crop&w=80&q=80" alt="Michael Lee">
            <div><div class="t-name">Michael Lee</div><div class="t-label">Frequent buyer</div></div>
          </div>
        </div>
        <div class="testimonial-card">
          <div class="t-stars">★★★★★</div>
          <p class="t-text">"The packaging alone tells you you're dealing with a premium brand. Delivery was ahead of schedule and the product is beautiful."</p>
          <div class="t-author">
            <img class="t-avatar" src="https://images.unsplash.com/photo-1499952127939-9bbf5af6c51c?auto=format&fit=crop&w=80&q=80" alt="Sarah Kim">
            <div><div class="t-name">Sarah Kim</div><div class="t-label">Verified buyer</div></div>
          </div>
        </div>
        <div class="testimonial-card">
          <div class="t-stars">★★★★★</div>
          <p class="t-text">"Browsing the site is genuinely enjoyable. Found exactly what I needed, prices were competitive and returns were effortless."</p>
          <div class="t-author">
            <img class="t-avatar" src="https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?auto=format&fit=crop&w=80&q=80" alt="James Okafor">
            <div><div class="t-name">James Okafor</div><div class="t-label">Frequent buyer</div></div>
          </div>
        </div>
      </div>
    </section>

    <!-- NEWSLETTER -->
    <section class="section container fade-in">
      <div class="newsletter">
        <h2>Stay in the Loop</h2>
        <p>Subscribe for exclusive offers, early access & new arrivals.</p>
        <form class="newsletter-form" id="newsletterForm" onsubmit="return false;">
          <input id="newsletterEmail" type="email" placeholder="Enter your email address" aria-label="Email" required>
          <button class="btn btn-gold" id="subscribeBtn">Subscribe</button>
        </form>
        <div id="newsletterMsg"></div>
      </div>
    </section>
  </main>

  <!-- FOOTER -->
  <footer>
    <div class="container">
      <div class="footer-inner">
        <div style="max-width:300px;flex-shrink:0;">
          <div class="footer-brand">Nexus<span>Shop</span></div>
          <p style="font-size:13px;line-height:1.7;margin-top:8px;">A curated premium shopping experience built for those who appreciate quality.</p>
          <div class="footer-socials">
            <a href="#" title="Facebook"><i class="fab fa-facebook-f"></i></a>
            <a href="#" title="Twitter/X"><i class="fab fa-x-twitter"></i></a>
            <a href="#" title="Instagram"><i class="fab fa-instagram"></i></a>
            <a href="#" title="Pinterest"><i class="fab fa-pinterest-p"></i></a>
          </div>
        </div>
        <div style="display:flex;gap:48px;flex:1;justify-content:flex-end;flex-wrap:wrap;">
          <div class="footer-col">
            <h4>Company</h4>
            <a href="#">About Us</a>
            <a href="#">Careers</a>
            <a href="#">Press</a>
            <a href="#">Blog</a>
          </div>
          <div class="footer-col">
            <h4>Support</h4>
            <a href="#">Help Centre</a>
            <a href="#">Shipping & Returns</a>
            <a href="#">Track Order</a>
            <a href="#">Contact Us</a>
          </div>
          <div class="footer-col">
            <h4>Legal</h4>
            <a href="#">Privacy Policy</a>
            <a href="#">Terms of Service</a>
            <a href="#">Cookie Policy</a>
          </div>
        </div>
      </div>
      <div class="footer-bottom">© <span id="year"></span> NexusShop. All rights reserved.</div>
    </div>
  </footer>

  <script>
    const CATEGORIES = [
      { id: 'phones',      name: 'Smartphones',  icon: 'fa-mobile-screen-button' },
      { id: 'laptops',     name: 'Laptops',       icon: 'fa-laptop' },
      { id: 'clothing',    name: 'Clothing',      icon: 'fa-shirt' },
      { id: 'gadgets',     name: 'Gadgets',       icon: 'fa-headphones' },
      { id: 'footwear',    name: 'Footwear',      icon: 'fa-shoe-prints' },
      { id: 'accessories', name: 'Accessories',   icon: 'fa-watch' },
    ];

    const PRODUCTS = [
      { id:1, title:'iPhone 14 Pro Max',    price:1099, oldPrice:1199, rating:5, reviews:128, badge:'new',  img:'https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?auto=format&fit=crop&w=600&q=80', category:'phones' },
      { id:2, title:'MacBook Pro 14"',      price:1999, rating:4, reviews:86,                 img:'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&w=600&q=80', category:'laptops' },
      { id:3, title:'Apple Watch Series 8', price:349,  oldPrice:399, rating:5, reviews:214, badge:'sale', img:'https://images.unsplash.com/photo-1529374255404-311a2a4f1fd9?auto=format&fit=crop&w=600&q=80', category:'accessories' },
      { id:4, title:'Nike Air Max 270',     price:150,  rating:4, reviews:53,                 img:'https://images.unsplash.com/photo-1542272604-787c3835535d?auto=format&fit=crop&w=600&q=80', category:'footwear' },
      { id:5, title:'Sony A7 IV Camera',    price:2499, rating:5, reviews:42,                 img:'https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?auto=format&fit=crop&w=600&q=80', category:'gadgets' },
      { id:6, title:'Chanel No. 5',         price:120,  rating:5, reviews:189,                img:'https://images.unsplash.com/photo-1585386959984-a4155224a1ad?auto=format&fit=crop&w=600&q=80', category:'accessories' },
      { id:7, title:'Travel Backpack',      price:79,   oldPrice:99, rating:4, reviews:67,   img:'https://images.unsplash.com/photo-1551232864-3f0890e580d9?auto=format&fit=crop&w=600&q=80', category:'accessories' },
      { id:8, title:'Sony WH-1000XM5',      price:399,  rating:5, reviews:156,               img:'https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?auto=format&fit=crop&w=600&q=80', category:'gadgets' },
    ];

    let cartCount = 0;
    const cartCountEl = document.getElementById('cartCount');
    const searchInput = document.getElementById('searchInput');

    function esc(t) {
      return String(t).replace(/[&<>"']/g, s => ({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[s]));
    }

    function renderCategories() {
      const g = document.getElementById('categoriesGrid');
      g.innerHTML = '';
      CATEGORIES.forEach(cat => {
        const el = document.createElement('div');
        el.className = 'cat-card';
        el.innerHTML = `
          <div class="cat-icon"><i class="fas ${cat.icon}"></i></div>
          <h4>${cat.name}</h4>
          <span>Explore →</span>`;
        el.addEventListener('click', () => {
          searchInput.value = cat.name;
          filterProducts(cat.name);
          document.getElementById('productsGrid').scrollIntoView({behavior:'smooth', block:'start'});
        });
        g.appendChild(el);
      });
    }

    function renderProducts(list) {
      const g = document.getElementById('productsGrid');
      g.innerHTML = '';
      list.forEach(p => {
        const el = document.createElement('article');
        el.className = 'product-card';
        const badgeHtml = p.badge === 'new'
          ? '<span class="product-badge badge-new">New</span>'
          : p.badge === 'sale'
          ? '<span class="product-badge badge-sale">Sale</span>'
          : '';
        el.innerHTML = `
          <div class="product-img-wrap">
            ${badgeHtml}
            <img src="${p.img}" alt="${esc(p.title)}" loading="lazy">
            <button class="wish-overlay" aria-label="Wishlist"><i class="far fa-heart"></i></button>
          </div>
          <div class="product-body">
            <div class="product-cat">${esc(p.category)}</div>
            <h5>${esc(p.title)}</h5>
            <div class="price-row">
              <div>
                <span class="price">$${p.price.toLocaleString()}</span>
                ${p.oldPrice ? `<span class="old-price"> $${p.oldPrice.toLocaleString()}</span>` : ''}
              </div>
              <span class="rating">${'★'.repeat(Math.round(p.rating))} <span style="color:var(--muted);font-size:11px;">(${p.reviews})</span></span>
            </div>
          </div>
          <div class="product-footer">
            <button class="add-btn" data-id="${p.id}"><i class="fas fa-bag-shopping"></i> Add to Cart</button>
          </div>`;
        g.appendChild(el);
      });

      g.querySelectorAll('.add-btn').forEach(btn => {
        btn.addEventListener('click', () => {
          addToCart(Number(btn.dataset.id));
          btn.innerHTML = '<i class="fas fa-check"></i> Added!';
          btn.disabled = true;
          setTimeout(() => { btn.innerHTML = '<i class="fas fa-bag-shopping"></i> Add to Cart'; btn.disabled = false; }, 1400);
        });
      });
    }

    function addToCart(id) {
      cartCount++;
      cartCountEl.textContent = cartCount;
    }

    function filterProducts(q) {
      const ql = (q || '').trim().toLowerCase();
      if (!ql) { renderProducts(PRODUCTS); return; }
      renderProducts(PRODUCTS.filter(p => p.title.toLowerCase().includes(ql) || p.category.toLowerCase().includes(ql)));
    }

    // Search
    document.getElementById('searchBtn').addEventListener('click', () => filterProducts(searchInput.value));
    searchInput.addEventListener('keydown', e => { if (e.key === 'Enter') filterProducts(e.target.value); });

    // Mobile menu
    document.getElementById('mobileToggle').addEventListener('click', () => {
      const m = document.getElementById('mobileMenu');
      m.style.display = m.style.display === 'block' ? 'none' : 'block';
    });

    // Newsletter
    document.getElementById('newsletterForm').addEventListener('submit', e => {
      e.preventDefault();
      const email = document.getElementById('newsletterEmail').value.trim();
      const msg = document.getElementById('newsletterMsg');
      msg.style.display = 'block';
      if (!email.includes('@')) { msg.style.color = '#e05c5c'; msg.textContent = 'Please enter a valid email.'; return; }
      msg.style.color = 'var(--gold)';
      msg.textContent = '✓ You\'re subscribed — welcome aboard.';
      document.getElementById('newsletterEmail').value = '';
      setTimeout(() => msg.style.display = 'none', 3500);
    });

    // Deal countdown
    (function() {
      const target = new Date(Date.now() + (24 * 60 + 36) * 60000);
      function tick() {
        const d = target - Date.now();
        document.getElementById('dealDays').textContent = Math.floor(d / 86400000);
        document.getElementById('dealHours').textContent = String(Math.floor((d % 86400000) / 3600000)).padStart(2,'0');
        document.getElementById('dealMinutes').textContent = String(Math.floor((d % 3600000) / 60000)).padStart(2,'0');
        document.getElementById('dealSeconds').textContent = String(Math.floor((d % 60000) / 1000)).padStart(2,'0');
        if (d <= 0) clearInterval(t);
      }
      tick(); const t = setInterval(tick, 1000);
    })();

    // Scroll fade
    const observer = new IntersectionObserver(entries => {
      entries.forEach(e => { if (e.isIntersecting) { e.target.classList.add('visible'); observer.unobserve(e.target); } });
    }, { threshold: 0.1 });
    document.querySelectorAll('.fade-in').forEach(el => observer.observe(el));

    // CTA buttons
    document.getElementById('shopNow').addEventListener('click', () => document.getElementById('productsGrid').scrollIntoView({behavior:'smooth'}));
    document.getElementById('exploreDeals').addEventListener('click', () => document.getElementById('deals').scrollIntoView({behavior:'smooth'}));
    document.getElementById('buyDeal').addEventListener('click', () => { cartCount++; cartCountEl.textContent = cartCount; const b = document.getElementById('buyDeal'); b.innerHTML = '<i class="fas fa-check"></i> Added to Cart'; setTimeout(() => b.innerHTML = 'Add to Cart <i class="fas fa-bag-shopping"></i>', 1500); });

    // Init
    renderCategories();
    renderProducts(PRODUCTS);
    document.getElementById('year').textContent = new Date().getFullYear();
  </script>
</body>
</html>
