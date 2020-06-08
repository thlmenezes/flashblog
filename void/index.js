(function () {
  let dict = {
    github: (value) => {
      fetch(`https://api.github.com/users/${value}`)
        .then((api) => api.json())
        .then((user) => {
          document.querySelector('.preview .lecturer img').src =
            user['avatar_url'];
        });
      return '.lecturer .username span';
    },
    title: (v) => '.title',
    date: (v) => '.date span',
    time: (v) => '.time span',
  };
  Object.keys(dict).forEach((key) => {
    document
      .querySelector(`[name=${key}]`)
      .addEventListener('change', ({ target }) => {
        document.querySelector(
          `.preview ${dict[key](target.value)}`
        ).innerHTML = target.value;
      });
  });
})();
