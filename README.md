# Pact Provider Verification

This setup simplifies Pact Provider [verification](https://docs.pact.io/documentation/verifying_pacts.html)
process in any language, wrapping the Ruby implementation into a cross-platform,
binary-like CLI tool.

[![Build Status](https://travis-ci.org/pact-foundation/pact-provider-verifier.svg?branch=master)](https://travis-ci.org/pact-foundation/pact-provider-verifier)

**Features**:

* Verify Pacts against Pacts published to an http endpoint, such as a [Pact Broker](https://github.com/pact-foundation/pact_broker)
* Verify local `*.json` Pacts on the file system
* Works with Pact [provider states](https://docs.pact.io/documentation/provider_states.html) should you need them

## Installation

### Docker

Take a look at https://github.com/DiUS/pact-provider-verifier-docker.

### Native Installation

Download the appropriate [release](https://github.com/pact-foundation/pact-provider-verifier/releases)
for your OS and put somewhere on your `PATH`.

### With Ruby on Mac OSX and Linux

```
gem install pact-provider-verifier
pact-provider-verifier <args>
```

Run `pact-provider-verifier help` for command line options.

## Examples

See the [example](examples) for a demonstration with a [Sinatra](http://www.sinatrarb.com/) API:

```
cd examples
bundle install
./test.sh
```

### Simple API

*Steps*:

1. Create an API and a corresponding Docker image for it
1. Publish Pacts to the Pact broker (or create local ones)
1. Run the CLI tool for your OS, passing the appropriate flags:
   * `--pact_urls` - a comma delimited list of local Pact file urls or Pact Broker URLs.
   * `--provider_base_url` - the base url of the pact provider (i.e. your API)
1.

### Setting a custom Authentication header

If you need to set a valid Authentication header for your replayed requests and provider state setup calls, specify `--custom-provider-header "Authentication: Type VALUE"` in the command line options.

Modification of the request headers is sometimes necessary, but be aware that any modification of the request before it is replayed lessens your confidence that the consumer and provider will work correctly in real life, so do it with caution.

### API with Provider States

Execute pact provider verification against a provider which implements the following:

* an http POST endpoint (`--provider-states-setup-url`) which sets the active pact consumer and provider state accepting two parameters: `consumer` and `state` and returns an HTTP `200` eg.

		consumer=web&state=customer%20is%20logged%20in

The following flags are required:

* `--pact-urls` - a comma delimited list of pact file urls
* `--provider-base-url` - the base url of the pact provider
* `--provider-states-setup-url` - the full url of the endpoint which sets the active pact consumer and provider state

### Using the Pact Broker with Basic authentication

The following flags are required to use basic authentication with a Pact Broker:

* `--broker-user` - the Username for Pact Broker basic authentication.
* `--broker-password` - the Password for Pact Broker basic authentication.

NOTE: the `http://user:password@host` format for basic HTTP auth is not supported.

## Contributing

See [CONTRIBUTING.md](/CONTRIBUTING.md)

[pact]: https://github.com/realestate-com-au/pact
[releases]: https://github.com/bethesque/pact-mock_service/releases
[javascript]: https://github.com/DiUS/pact-consumer-js-dsl
[pact-dev]: https://groups.google.com/forum/#!forum/pact-dev
[windows]: https://github.com/bethesque/pact-mock_service/wiki/Building-a-Windows-standalone-executable
[install-windows]: https://github.com/bethesque/pact-mock_service/wiki/Installing-the-pact-mock_service-gem-on-Windows
[why-generated]: https://github.com/realestate-com-au/pact/wiki/FAQ#why-are-the-pacts-generated-and-not-static
