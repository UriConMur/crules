#!/usr/bin/env node

const shell = require('shelljs');

const init = () => {
  let scriptFolder = `${__dirname}/scripts`;
  scriptFolder = scriptFolder.replace(/ /g, '\\ ');
  shell.exec(`${scriptFolder}/index.sh`);
  if (shell.exec(`${scriptFolder}/checkDocs.sh`).code) {
    process.exit(1);
  }
};

init();
