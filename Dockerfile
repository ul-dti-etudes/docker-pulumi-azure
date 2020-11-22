# Image servant à exécuter Pulumi en typescript 
# avec le plugin azure-nextgen qui nécessite le client az
FROM mcr.microsoft.com/azure-cli

# Installation de nodejs et pulumi
RUN apk add --no-cache nodejs npm \
    && curl -fsSL https://get.pulumi.com | sh \
    && mkdir /work

ENV PATH="/root/.pulumi/bin:${PATH}"

WORKDIR /work