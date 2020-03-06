function fn() {    
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'local';
  }
  var config = {
    env: env,
	petstoreUrl: 'http://some-environment:8080'
  }
  if (env == 'local') {
    config.petstoreUrl = 'http://localhost:8080'
  } else if (env == 'dev') {
    config.petstoreUrl = 'http://dev-environment:8080'
  }
  return config;
}