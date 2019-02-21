document.addEventListener('turbolinks:load', function () {

  let toggled = false;
  const links = document.getElementsByClassName('mobile-links')[0];
  const btn = document.getElementsByClassName('nav-tgl')[0];
  const flexContainer = document.getElementsByClassName('flex-container');
  const header = document.getElementsByTagName('header')[0];
  btn.onclick = function(evt) {
    if (!toggled) {
      toggled = true;
      evt.target.classList.add('toggled');
      links.classList.add('active');
      flexContainer[0].style.display = 'flex';
      document.getElementsByTagName('header')[0].style.display = 'none';
      document.getElementsByClassName('hero-text-box')[0].style.display = 'none';

    } else {
      toggled = false;
      evt.target.classList.remove('toggled');
      links.classList.remove('active');
      flexContainer[0].style.display = 'none';
      document.getElementsByTagName('header')[0].style.display = 'block';
      document.getElementsByClassName('hero-text-box')[0].style.display = 'block';
    }
  };
});
