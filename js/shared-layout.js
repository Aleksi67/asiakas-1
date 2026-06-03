// Shared layout for all pages
export function renderHeader() {
  return `
  <!-- TOP BAR - REMOVED -->

  <!-- HEADER -->
  <header class="site-header">
    <div class="header-inner">
      <a href="index.html" class="logo">
        <img src="images/rightspot_logo-e1423440880466-1.png" alt="RightSpot Ltd Logo" width="180" height="70">
      </a>
      <nav class="main-nav" aria-label="Main Navigation">
        <a href="index.html">Home</a>
        <a href="news.html">News</a>
        <a href="software-development.html">Software Development</a>
        <a href="products.html">Software Products</a>
        <a href="references.html">Customer References</a>
        <a href="about.html">About Us</a>
        <a href="contact.html">Contact Us</a>
        <a href="eula.html">EULA</a>
      </nav>
      <div class="lang-switcher">
        <a href="index.html" title="English"><img src="images/en.png" alt="English"></a>
        <a href="https://rightspot.fi/?lang=fi" title="Finnish"><img src="images/fi.png" alt="Finnish"></a>
      </div>
      <button class="mobile-menu-btn" id="mobileMenuBtn" aria-label="Open menu" aria-expanded="false">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="3" y1="6" x2="21" y2="6"/><line x1="3" y1="12" x2="21" y2="12"/><line x1="3" y1="18" x2="21" y2="18"/></svg>
      </button>
    </div>
  </header>

  <!-- MOBILE NAV -->
  <nav class="mobile-nav" id="mobileNav" aria-label="Mobile Navigation">
    <a href="index.html">Home</a>
    <a href="news.html">News</a>
    <a href="software-development.html">Software Development</a>
    <a href="products.html">Software Products</a>
    <a href="references.html">Customer References</a>
    <a href="about.html">About Us</a>
    <a href="contact.html">Contact Us</a>
    <a href="eula.html">EULA</a>
    <div style="display:flex;gap:.75rem;padding:.75rem 1rem;">
      <a href="index.html" title="English" style="display:flex;align-items:center;gap:.5rem;font-size:.875rem;color:var(--neutral-600);"><img src="images/en.png" alt="EN" style="width:20px;"> English</a>
      <a href="https://rightspot.fi/?lang=fi" title="Finnish" style="display:flex;align-items:center;gap:.5rem;font-size:.875rem;color:var(--neutral-600);"><img src="images/fi.png" alt="FI" style="width:20px;"> Finnish</a>
    </div>
  </nav>
  `;
}

export function renderFooter() {
  return `
  <!-- FOOTER -->
  <footer class="site-footer">
    <div class="footer-top">
      <div class="container">
        <div class="footer-grid">
          <div class="footer-brand">
            <img src="images/rightspot_logo-e1423440880466-1.png" alt="RightSpot Ltd" width="180" height="70">
            <p>RightSpot Ltd develops SOFTWARE and WIRELESS solutions for PC, smart phones and tablets, web / Cloud. Established in 2013, based in Salo, Finland.</p>
            <div class="footer-social" style="margin-top:1.25rem;">
              <a href="https://www.facebook.com/RightSpotLtd" target="_blank" rel="noreferrer" aria-label="Facebook">
                <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M18.77 7.46H14.5v-1.9c0-.9.6-1.1 1-1.1h3V.5h-4.33C10.24.5 9.5 3.44 9.5 5.32v2.15h-3v4h3v12h5v-12h3.85l.42-4z"/></svg>
              </a>
            </div>
          </div>
          <div class="footer-col">
            <h4>Navigation</h4>
            <ul>
              <li><a href="news.html">News</a></li>
              <li><a href="software-development.html">Software Development</a></li>
              <li><a href="products.html">Software Products</a></li>
              <li><a href="references.html">Customer References</a></li>
              <li><a href="about.html">About Us</a></li>
              <li><a href="contact.html">Contact Us</a></li>
              <li><a href="eula.html">EULA</a></li>
            </ul>
          </div>
          <div class="footer-col">
            <h4>Contact</h4>
            <div class="footer-contact">
              <div class="footer-contact-item">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0118 0z"/><circle cx="12" cy="10" r="3"/></svg>
                <span>Satamakatu 28, 24100 SALO, Finland</span>
              </div>
              <div class="footer-contact-item">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07A19.5 19.5 0 0 1 4.69 12 19.79 19.79 0 0 1 1.61 3.42 2 2 0 0 1 3.6 1.24h3a2 2 0 0 1 2 1.72c.127.96.361 1.903.7 2.81a2 2 0 0 1-.45 2.11L7.91 8.73a16 16 0 0 0 6.29 6.29l.95-.95a2 2 0 0 1 2.11-.45c.907.339 1.85.573 2.81.7a2 2 0 0 1 1.72 2.03z"/></svg>
                <span><a href="tel:+35840554853" style="color:var(--neutral-500);transition:color .2s;" onmouseover="this.style.color='#fff'" onmouseout="this.style.color=''"  >+358 (0)40 5544853</a></span>
              </div>
              <div class="footer-contact-item">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/><polyline points="22,6 12,13 2,6"/></svg>
                <span>rightspot(at)rightspot.fi</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="footer-bottom">
      <div class="container">
        <div class="footer-bottom-inner">
          <p class="footer-copy">Copyright &copy; 2022 RightSpot Ltd</p>
          <div class="footer-links">
            <a href="https://rightspot.fi/privacy-policy/">Privacy Policy</a>
            <a href="eula.html">EULA</a>
            <a href="login.html">Admin</a>
          </div>
        </div>
      </div>
    </div>
  </footer>

  <!-- BACK TO TOP -->
  <button class="back-to-top" id="backToTop" aria-label="Back to top">
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="18,15 12,9 6,15"/></svg>
  </button>
  `;
}

export function initMobileMenu() {
  const mobileMenuBtn = document.getElementById('mobileMenuBtn');
  const mobileNav = document.getElementById('mobileNav');
  if (!mobileMenuBtn || !mobileNav) return;

  mobileMenuBtn.addEventListener('click', () => {
    const isOpen = mobileNav.classList.toggle('open');
    mobileMenuBtn.setAttribute('aria-expanded', isOpen);
  });
}

export function initBackToTop() {
  const backToTop = document.getElementById('backToTop');
  if (!backToTop) return;

  window.addEventListener('scroll', () => {
    backToTop.classList.toggle('visible', window.scrollY > 400);
  });
  backToTop.addEventListener('click', () => window.scrollTo({ top: 0, behavior: 'smooth' }));
}

export function setActiveNav(page) {
  document.querySelectorAll('.main-nav a').forEach(link => {
    const href = link.getAttribute('href');
    link.classList.toggle('active', href === page);
  });
}
