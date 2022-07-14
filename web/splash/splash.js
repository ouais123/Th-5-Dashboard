let searchParams = new URLSearchParams(window.location.search);
if (searchParams.has('renderer')) {
  window.flutterWebRenderer = searchParams.get('renderer');
  console.log(searchParams.get('renderer') + ' renderer requested in the URL');
}
