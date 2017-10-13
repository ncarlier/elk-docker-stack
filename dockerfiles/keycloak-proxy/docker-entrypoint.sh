#!/bin/ash

die() { echo "$@" 1>&2 ; exit 1; }

#########################################
# Validation
#########################################
[ -z "$OIDC_DISCOVERY_URL" ] && die "OpenID Connect discovery URL not set (OIDC_DISCOVERY_URL is empty)"
[ -z "$OIDC_CLIENT_ID" ] && die "OpenID Connect client ID (OIDC_CLIENT_ID is empty)"
[ -z "$OIDC_CLIENT_SECRET" ] && die "OpenID Connect client secret (OIDC_CLIENT_SECRET is empty)"
[ -z "$OIDC_REDIRECTION_URL" ] && die "OpenID Connect redirection URL (OIDC_REDIRECTION_URL is empty)"
[ -z "$OIDC_UPSTREAM_URL" ] && die "OpenID Connect upstream URL not set (OIDC_UPSTREAM_URL is empty)"
[ -z "$OIDC_ENCRYPTION_KEY" ] && die "OpenID Connect session encryption state not set (OIDC_ENCRYPTION_KEY is empty)"

#########################################
# Start proxy
#########################################
keycloak-proxy \
  --discovery-url=${OIDC_DISCOVERY_URL} \
  --skip-openid-provider-tls-verify=true \
  --client-id=${OIDC_CLIENT_ID} \
  --client-secret=${OIDC_CLIENT_SECRET} \
  --listen=:3000 \
  --redirection-url=${OIDC_REDIRECTION_URL} \
  --enable-refresh-tokens=true \
  --upstream-url=${OIDC_UPSTREAM_URL} \
  --encryption-key=${OIDC_ENCRYPTION_KEY} \
  --secure-cookie=false \
  --resources="uri=/*"

