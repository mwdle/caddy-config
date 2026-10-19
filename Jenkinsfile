boolean disableIndexTriggers = env.BRANCH_NAME != 'main'

quadletPipeline(
    disableIndexTriggers: disableIndexTriggers,
    podmanSecretMappings: [
        [
            type: 'string',
            credentialsId: 'caddy-cloudflare-api-token',
            podmanSecretStringName: 'caddy_cloudflare_api_token'
        ],
        [
            type: 'string',
            credentialsId: 'caddy-email',
            podmanSecretStringName: 'caddy_email'
        ]
    ]
)
