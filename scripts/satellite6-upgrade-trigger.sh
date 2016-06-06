pip install -U pip

if [ "$(curl --version | grep NSS 2>/dev/null)" ]; then
    pip install --compile --install-option="--with-nss" pycurl
else
    pip install --compile --install-option="--with-openssl" pycurl
fi

pip install -r requirements.txt
source "${RHEV_CONFIG}"
source "${SATELLITE6_REPOS_URLS}"
source "${SUBSCRIPTION_CONFIG}"

export BASE_URL="${SATELLITE6_REPO}"
export CAPSULE_URL="${CAPSULE_REPO}"
export TOOLS_URL="${TOOLS_REPO}"

fab -u root product_upgrade:'capsule'
