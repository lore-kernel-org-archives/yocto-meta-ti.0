Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D88C79FBF
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 18:13:21 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21528.1789063992591614453
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 10 Sep 2026 11:13:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7FE1940C6C;
	Thu, 10 Sep 2026 18:13:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O55nwfAPSDnz; Thu, 10 Sep 2026 18:13:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 19509406B5;
	Thu, 10 Sep 2026 18:13:08 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1B04A17D36F; Thu, 10 Sep 2026 14:13:07 -0400 (EDT)
Date: Thu, 10 Sep 2026 14:13:07 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH v2 1/5] u-boot-ti-staging: Fixes for
 OpenSSL 4.0
Message-ID: <20260910181307.GT19759@denix.org>
References: <20260910015454.2933250-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910015454.2933250-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 10 Sep 2026 18:13:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20369

On Wed, Sep 09, 2026 at 08:54:48PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> With the recent move to OpenSSL 4.0 [1] we need to update the same code
> in the various u-boot versions that we support.
> 
> [1] https://git.openembedded.org/openembedded-core/commit/?id=20bf704e5809e95036b998f0f45145cf7205b05b
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
> v2; No change.
> 
>  ...ort-for-OpenSSL-Provider-API-2024-04.patch | 300 ++++++++++++++++
>  ...ort-for-OpenSSL-Provider-API-2025-01.patch | 300 ++++++++++++++++
>  ...ort-for-OpenSSL-Provider-API-2026-01.patch | 340 ++++++++++++++++++
>  .../u-boot/u-boot-ti-staging_2024.04.bb       |   6 +-
>  .../u-boot/u-boot-ti-staging_2025.01.bb       |   1 +
>  .../u-boot/u-boot-ti-staging_2026.01.bb       |   2 +
>  meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  |   1 +
>  7 files changed, 948 insertions(+), 2 deletions(-)
>  create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2024-04.patch
>  create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2025-01.patch
>  create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2026-01.patch

For the old U-Boot versions, instead of massaging the patch heavily and 
carrying multiple copies of it, should we just use the workaraound, like 
meta-arm[1] does? And 2026.10 will have this fixed upstream...

https://patchwork.yoctoproject.org/project/arm/patch/20260909180341.3858400-1-ross.burton@arm.com/


> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2024-04.patch b/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2024-04.patch
> new file mode 100644
> index 00000000..9f67644b
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2024-04.patch
> @@ -0,0 +1,300 @@
> +From 401c19f6b0a7c63afad92e9d3f2cbb75d6ed8566 Mon Sep 17 00:00:00 2001
> +From: Ryan Eatmon <reatmon@ti.com>
> +Date: Wed, 9 Sep 2026 10:04:50 -0500
> +Subject: [PATCH] Add support for OpenSSL Provider API
> +
> +Backport from 2026.01 patch [1] by Ryan Eatmon <reatmon@ti.com>
> +
> +Upsatream-Status: Inappropriate [OE-specific]
> +
> +The Engine API has been deprecated since the release of OpenSSL 3.0. End
> +users have been advised to migrate to the new Provider interface.
> +Several distributions have already removed support for engines, which is
> +preventing U-Boot from being compiled in those environments.
> +
> +Add support for the Provider API while continuing to support the existing
> +Engine API on distros shipping older releases of OpenSSL.
> +
> +This is based on similar work contributed by Jan Stancek updating Linux
> +to use the Provider interface.
> +
> +    commit 558bdc45dfb2669e1741384a0c80be9c82fa052c
> +    Author: Jan Stancek <jstancek@redhat.com>
> +    Date:   Fri Sep 20 19:52:48 2024 +0300
> +
> +        sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >= 3
> +
> +The changes have been tested with the FIT signature verification vboot
> +tests on Fedora 42 and Debian 13. All 30 tests pass with both the legacy
> +Engine library installed and with the Provider API.
> +
> +Signed-off-by: Eddie Kovsky <ewk@edkovsky.org>
> +
> +Upstream-Status: Submitted [https://lore.kernel.org/u-boot/20260429180247.83091-1-ekovsky@redhat.com/]
> +
> +Note: Modified to make pkcs11 provider loading optional. The upstream
> +patch unconditionally requires the pkcs11 provider, which is not
> +available in the OE build environment. File-based key signing only needs
> +the default provider; pkcs11 is only required for pkcs11: URI keys.
> +Changes from upstream:
> + - Load default provider first (was pkcs11 first)
> + - Make pkcs11 provider load failure non-fatal (ERR_clear_error instead
> +   of ERR(1, ...) which calls errx/abort)
> +
> +Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> +
> +Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> +---
> + lib/aes/aes-encrypt.c |  4 +-
> + lib/rsa/rsa-sign.c    | 95 ++++++++++++++++++++++++++++++++++++++++++-
> + 2 files changed, 97 insertions(+), 2 deletions(-)
> +
> +diff --git a/lib/aes/aes-encrypt.c b/lib/aes/aes-encrypt.c
> +index e74e35eaa28..8a6f7715df9 100644
> +--- a/lib/aes/aes-encrypt.c
> ++++ b/lib/aes/aes-encrypt.c
> +@@ -16,7 +16,9 @@
> + #include <openssl/err.h>
> + #include <openssl/ssl.h>
> + #include <openssl/evp.h>
> +-#include <openssl/engine.h>
> ++#if !defined(OPENSSL_NO_ENGINE) && !defined(OPENSSL_NO_DEPRECATED_3_0)
> ++# include <openssl/engine.h>
> ++#endif
> + #include <uboot_aes.h>
> + 
> + #if OPENSSL_VERSION_NUMBER >= 0x10000000L
> +diff --git a/lib/rsa/rsa-sign.c b/lib/rsa/rsa-sign.c
> +index 2304030e32f..29b3bd3dbb1 100644
> +--- a/lib/rsa/rsa-sign.c
> ++++ b/lib/rsa/rsa-sign.c
> +@@ -19,7 +19,47 @@
> + #include <openssl/err.h>
> + #include <openssl/ssl.h>
> + #include <openssl/evp.h>
> +-#include <openssl/engine.h>
> ++#if OPENSSL_VERSION_MAJOR >= 3
> ++# define USE_PKCS11_PROVIDER
> ++# include <err.h>
> ++# include <openssl/provider.h>
> ++# include <openssl/store.h>
> ++#else
> ++# if !defined(OPENSSL_NO_ENGINE) && !defined(OPENSSL_NO_DEPRECATED_3_0)
> ++#  define USE_PKCS11_ENGINE
> ++#  include <openssl/engine.h>
> ++# endif
> ++#endif
> ++
> ++#ifdef USE_PKCS11_PROVIDER
> ++#define ERR(cond, fmt, ...)				\
> ++	do {						\
> ++		bool __cond = (cond);			\
> ++		drain_openssl_errors(__LINE__, 0);	\
> ++		if (__cond) {				\
> ++			errx(1, fmt, ## __VA_ARGS__);	\
> ++		}					\
> ++	} while (0)
> ++
> ++static void drain_openssl_errors(int l, int silent)
> ++{
> ++	const char *file;
> ++	char buf[120];
> ++	int e, line;
> ++
> ++	if (ERR_peek_error() == 0)
> ++		return;
> ++	if (!silent)
> ++		fprintf(stderr, "At main.c:%d:\n", l);
> ++
> ++	while ((e = ERR_peek_error_line(&file, &line))) {
> ++		ERR_error_string(e, buf);
> ++		if (!silent)
> ++			fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
> ++		ERR_get_error();
> ++	}
> ++}
> ++#endif
> + 
> + static int rsa_err(const char *msg)
> + {
> +@@ -98,6 +138,7 @@ err_cert:
> +  * @evpp	Returns EVP_PKEY object, or NULL on failure
> +  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
> +  */
> ++#ifdef USE_PKCS11_ENGINE
> + static int rsa_engine_get_pub_key(const char *keydir, const char *name,
> + 				  ENGINE *engine, EVP_PKEY **evpp)
> + {
> +@@ -157,6 +198,7 @@ static int rsa_engine_get_pub_key(const char *keydir, const char *name,
> + 
> + 	return 0;
> + }
> ++#endif
> + 
> + /**
> +  * rsa_get_pub_key() - read a public key
> +@@ -170,8 +212,10 @@ static int rsa_engine_get_pub_key(const char *keydir, const char *name,
> + static int rsa_get_pub_key(const char *keydir, const char *name,
> + 			   ENGINE *engine, EVP_PKEY **evpp)
> + {
> ++#ifdef USE_PKCS11_ENGINE
> + 	if (engine)
> + 		return rsa_engine_get_pub_key(keydir, name, engine, evpp);
> ++#endif
> + 	return rsa_pem_get_pub_key(keydir, name, evpp);
> + }
> + 
> +@@ -207,6 +251,38 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
> + 		return -ENOENT;
> + 	}
> + 
> ++#ifdef USE_PKCS11_PROVIDER
> ++	EVP_PKEY *private_key = NULL;
> ++	OSSL_STORE_CTX *store;
> ++
> ++	if (!OSSL_PROVIDER_try_load(NULL, "default", true))
> ++		ERR(1, "OSSL_PROVIDER_try_load(default)");
> ++	/* pkcs11 provider is optional; only needed for pkcs11: URIs */
> ++	if (!OSSL_PROVIDER_try_load(NULL, "pkcs11", true))
> ++		ERR_clear_error();
> ++
> ++	store = OSSL_STORE_open(path, NULL, NULL, NULL, NULL);
> ++	ERR(!store, "OSSL_STORE_open");
> ++
> ++	while (!OSSL_STORE_eof(store)) {
> ++		OSSL_STORE_INFO *info = OSSL_STORE_load(store);
> ++
> ++		if (!info) {
> ++			drain_openssl_errors(__LINE__, 0);
> ++			continue;
> ++		}
> ++		if (OSSL_STORE_INFO_get_type(info) == OSSL_STORE_INFO_PKEY) {
> ++			private_key = OSSL_STORE_INFO_get1_PKEY(info);
> ++			ERR(!private_key, "OSSL_STORE_INFO_get1_PKEY");
> ++		}
> ++		OSSL_STORE_INFO_free(info);
> ++		if (private_key)
> ++			break;
> ++	}
> ++	OSSL_STORE_close(store);
> ++
> ++	*evpp = private_key;
> ++#else
> + 	if (!PEM_read_PrivateKey(f, evpp, NULL, path)) {
> + 		rsa_err("Failure reading private key");
> + 		fclose(f);
> +@@ -214,6 +290,7 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
> + 	}
> + 	fclose(f);
> + 
> ++#endif
> + 	return 0;
> + }
> + 
> +@@ -226,6 +303,7 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
> +  * @evpp	Returns EVP_PKEY object, or NULL on failure
> +  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
> +  */
> ++#ifdef USE_PKCS11_ENGINE
> + static int rsa_engine_get_priv_key(const char *keydir, const char *name,
> + 				   const char *keyfile,
> + 				   ENGINE *engine, EVP_PKEY **evpp)
> +@@ -293,6 +371,7 @@ static int rsa_engine_get_priv_key(const char *keydir, const char *name,
> + 
> + 	return 0;
> + }
> ++#endif
> + 
> + /**
> +  * rsa_get_priv_key() - read a private key
> +@@ -306,9 +385,11 @@ static int rsa_engine_get_priv_key(const char *keydir, const char *name,
> + static int rsa_get_priv_key(const char *keydir, const char *name,
> + 			    const char *keyfile, ENGINE *engine, EVP_PKEY **evpp)
> + {
> ++#ifdef USE_PKCS11_ENGINE
> + 	if (engine)
> + 		return rsa_engine_get_priv_key(keydir, name, keyfile, engine,
> + 					       evpp);
> ++#endif
> + 	return rsa_pem_get_priv_key(keydir, name, keyfile, evpp);
> + }
> + 
> +@@ -325,6 +406,7 @@ static int rsa_init(void)
> + 	return 0;
> + }
> + 
> ++#ifdef USE_PKCS11_ENGINE
> + static int rsa_engine_init(const char *engine_id, ENGINE **pe)
> + {
> + 	const char *key_pass;
> +@@ -372,6 +454,7 @@ err_engine_init:
> + 	ENGINE_free(e);
> + 	return ret;
> + }
> ++#endif
> + 
> + static void rsa_engine_remove(ENGINE *e)
> + {
> +@@ -471,11 +554,13 @@ int rsa_sign(struct image_sign_info *info,
> + 	if (ret)
> + 		return ret;
> + 
> ++#ifdef USE_PKCS11_ENGINE
> + 	if (info->engine_id) {
> + 		ret = rsa_engine_init(info->engine_id, &e);
> + 		if (ret)
> + 			return ret;
> + 	}
> ++#endif
> + 
> + 	ret = rsa_get_priv_key(info->keydir, info->keyname, info->keyfile,
> + 			       e, &pkey);
> +@@ -487,16 +572,20 @@ int rsa_sign(struct image_sign_info *info,
> + 		goto err_sign;
> + 
> + 	EVP_PKEY_free(pkey);
> ++#ifdef USE_PKCS11_ENGINE
> + 	if (info->engine_id)
> + 		rsa_engine_remove(e);
> ++#endif
> + 
> + 	return ret;
> + 
> + err_sign:
> + 	EVP_PKEY_free(pkey);
> + err_priv:
> ++#ifdef USE_PKCS11_ENGINE
> + 	if (info->engine_id)
> + 		rsa_engine_remove(e);
> ++#endif
> + 	return ret;
> + }
> + 
> +@@ -636,11 +725,13 @@ int rsa_add_verify_data(struct image_sign_info *info, void *keydest)
> + 	ENGINE *e = NULL;
> + 
> + 	debug("%s: Getting verification data\n", __func__);
> ++#ifdef USE_PKCS11_ENGINE
> + 	if (info->engine_id) {
> + 		ret = rsa_engine_init(info->engine_id, &e);
> + 		if (ret)
> + 			return ret;
> + 	}
> ++#endif
> + 	ret = rsa_get_pub_key(info->keydir, info->keyname, e, &pkey);
> + 	if (ret)
> + 		goto err_get_pub_key;
> +@@ -717,8 +808,10 @@ done:
> + err_get_params:
> + 	EVP_PKEY_free(pkey);
> + err_get_pub_key:
> ++#ifdef USE_PKCS11_ENGINE
> + 	if (info->engine_id)
> + 		rsa_engine_remove(e);
> ++#endif
> + 
> + 	if (ret)
> + 		return ret;
> +-- 
> +2.43.0
> +
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2025-01.patch b/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2025-01.patch
> new file mode 100644
> index 00000000..c5f3655e
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2025-01.patch
> @@ -0,0 +1,300 @@
> +From 0525693750b1b7a8fb7228dbb97bf592a21322fc Mon Sep 17 00:00:00 2001
> +From: Ryan Eatmon <reatmon@ti.com>
> +Date: Wed, 9 Sep 2026 10:04:50 -0500
> +Subject: [PATCH] Add support for OpenSSL Provider API
> +
> +Backport from 2026.01 patch [1] by Ryan Eatmon <reatmon@ti.com>
> +
> +Upsatream-Status: Inappropriate [OE-specific]
> +
> +The Engine API has been deprecated since the release of OpenSSL 3.0. End
> +users have been advised to migrate to the new Provider interface.
> +Several distributions have already removed support for engines, which is
> +preventing U-Boot from being compiled in those environments.
> +
> +Add support for the Provider API while continuing to support the existing
> +Engine API on distros shipping older releases of OpenSSL.
> +
> +This is based on similar work contributed by Jan Stancek updating Linux
> +to use the Provider interface.
> +
> +    commit 558bdc45dfb2669e1741384a0c80be9c82fa052c
> +    Author: Jan Stancek <jstancek@redhat.com>
> +    Date:   Fri Sep 20 19:52:48 2024 +0300
> +
> +        sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >= 3
> +
> +The changes have been tested with the FIT signature verification vboot
> +tests on Fedora 42 and Debian 13. All 30 tests pass with both the legacy
> +Engine library installed and with the Provider API.
> +
> +Signed-off-by: Eddie Kovsky <ewk@edkovsky.org>
> +
> +Upstream-Status: Submitted [https://lore.kernel.org/u-boot/20260429180247.83091-1-ekovsky@redhat.com/]
> +
> +Note: Modified to make pkcs11 provider loading optional. The upstream
> +patch unconditionally requires the pkcs11 provider, which is not
> +available in the OE build environment. File-based key signing only needs
> +the default provider; pkcs11 is only required for pkcs11: URI keys.
> +Changes from upstream:
> + - Load default provider first (was pkcs11 first)
> + - Make pkcs11 provider load failure non-fatal (ERR_clear_error instead
> +   of ERR(1, ...) which calls errx/abort)
> +
> +Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> +
> +Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> +---
> + lib/aes/aes-encrypt.c |  4 +-
> + lib/rsa/rsa-sign.c    | 95 ++++++++++++++++++++++++++++++++++++++++++-
> + 2 files changed, 97 insertions(+), 2 deletions(-)
> +
> +diff --git a/lib/aes/aes-encrypt.c b/lib/aes/aes-encrypt.c
> +index e74e35eaa28..8a6f7715df9 100644
> +--- a/lib/aes/aes-encrypt.c
> ++++ b/lib/aes/aes-encrypt.c
> +@@ -16,7 +16,9 @@
> + #include <openssl/err.h>
> + #include <openssl/ssl.h>
> + #include <openssl/evp.h>
> +-#include <openssl/engine.h>
> ++#if !defined(OPENSSL_NO_ENGINE) && !defined(OPENSSL_NO_DEPRECATED_3_0)
> ++# include <openssl/engine.h>
> ++#endif
> + #include <uboot_aes.h>
> + 
> + #if OPENSSL_VERSION_NUMBER >= 0x10000000L
> +diff --git a/lib/rsa/rsa-sign.c b/lib/rsa/rsa-sign.c
> +index fa9e143b4ca..af5b18e0c95 100644
> +--- a/lib/rsa/rsa-sign.c
> ++++ b/lib/rsa/rsa-sign.c
> +@@ -19,7 +19,47 @@
> + #include <openssl/err.h>
> + #include <openssl/ssl.h>
> + #include <openssl/evp.h>
> +-#include <openssl/engine.h>
> ++#if OPENSSL_VERSION_MAJOR >= 3
> ++# define USE_PKCS11_PROVIDER
> ++# include <err.h>
> ++# include <openssl/provider.h>
> ++# include <openssl/store.h>
> ++#else
> ++# if !defined(OPENSSL_NO_ENGINE) && !defined(OPENSSL_NO_DEPRECATED_3_0)
> ++#  define USE_PKCS11_ENGINE
> ++#  include <openssl/engine.h>
> ++# endif
> ++#endif
> ++
> ++#ifdef USE_PKCS11_PROVIDER
> ++#define ERR(cond, fmt, ...)				\
> ++	do {						\
> ++		bool __cond = (cond);			\
> ++		drain_openssl_errors(__LINE__, 0);	\
> ++		if (__cond) {				\
> ++			errx(1, fmt, ## __VA_ARGS__);	\
> ++		}					\
> ++	} while (0)
> ++
> ++static void drain_openssl_errors(int l, int silent)
> ++{
> ++	const char *file;
> ++	char buf[120];
> ++	int e, line;
> ++
> ++	if (ERR_peek_error() == 0)
> ++		return;
> ++	if (!silent)
> ++		fprintf(stderr, "At main.c:%d:\n", l);
> ++
> ++	while ((e = ERR_peek_error_line(&file, &line))) {
> ++		ERR_error_string(e, buf);
> ++		if (!silent)
> ++			fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
> ++		ERR_get_error();
> ++	}
> ++}
> ++#endif
> + 
> + static int rsa_err(const char *msg)
> + {
> +@@ -98,6 +138,7 @@ err_cert:
> +  * @evpp	Returns EVP_PKEY object, or NULL on failure
> +  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
> +  */
> ++#ifdef USE_PKCS11_ENGINE
> + static int rsa_engine_get_pub_key(const char *keydir, const char *name,
> + 				  ENGINE *engine, EVP_PKEY **evpp)
> + {
> +@@ -157,6 +198,7 @@ static int rsa_engine_get_pub_key(const char *keydir, const char *name,
> + 
> + 	return 0;
> + }
> ++#endif
> + 
> + /**
> +  * rsa_get_pub_key() - read a public key
> +@@ -170,8 +212,10 @@ static int rsa_engine_get_pub_key(const char *keydir, const char *name,
> + static int rsa_get_pub_key(const char *keydir, const char *name,
> + 			   ENGINE *engine, EVP_PKEY **evpp)
> + {
> ++#ifdef USE_PKCS11_ENGINE
> + 	if (engine)
> + 		return rsa_engine_get_pub_key(keydir, name, engine, evpp);
> ++#endif
> + 	return rsa_pem_get_pub_key(keydir, name, evpp);
> + }
> + 
> +@@ -207,6 +251,38 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
> + 		return -ENOENT;
> + 	}
> + 
> ++#ifdef USE_PKCS11_PROVIDER
> ++	EVP_PKEY *private_key = NULL;
> ++	OSSL_STORE_CTX *store;
> ++
> ++	if (!OSSL_PROVIDER_try_load(NULL, "default", true))
> ++		ERR(1, "OSSL_PROVIDER_try_load(default)");
> ++	/* pkcs11 provider is optional; only needed for pkcs11: URIs */
> ++	if (!OSSL_PROVIDER_try_load(NULL, "pkcs11", true))
> ++		ERR_clear_error();
> ++
> ++	store = OSSL_STORE_open(path, NULL, NULL, NULL, NULL);
> ++	ERR(!store, "OSSL_STORE_open");
> ++
> ++	while (!OSSL_STORE_eof(store)) {
> ++		OSSL_STORE_INFO *info = OSSL_STORE_load(store);
> ++
> ++		if (!info) {
> ++			drain_openssl_errors(__LINE__, 0);
> ++			continue;
> ++		}
> ++		if (OSSL_STORE_INFO_get_type(info) == OSSL_STORE_INFO_PKEY) {
> ++			private_key = OSSL_STORE_INFO_get1_PKEY(info);
> ++			ERR(!private_key, "OSSL_STORE_INFO_get1_PKEY");
> ++		}
> ++		OSSL_STORE_INFO_free(info);
> ++		if (private_key)
> ++			break;
> ++	}
> ++	OSSL_STORE_close(store);
> ++
> ++	*evpp = private_key;
> ++#else
> + 	if (!PEM_read_PrivateKey(f, evpp, NULL, path)) {
> + 		rsa_err("Failure reading private key");
> + 		fclose(f);
> +@@ -214,6 +290,7 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
> + 	}
> + 	fclose(f);
> + 
> ++#endif
> + 	return 0;
> + }
> + 
> +@@ -226,6 +303,7 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
> +  * @evpp	Returns EVP_PKEY object, or NULL on failure
> +  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
> +  */
> ++#ifdef USE_PKCS11_ENGINE
> + static int rsa_engine_get_priv_key(const char *keydir, const char *name,
> + 				   const char *keyfile,
> + 				   ENGINE *engine, EVP_PKEY **evpp)
> +@@ -293,6 +371,7 @@ static int rsa_engine_get_priv_key(const char *keydir, const char *name,
> + 
> + 	return 0;
> + }
> ++#endif
> + 
> + /**
> +  * rsa_get_priv_key() - read a private key
> +@@ -306,9 +385,11 @@ static int rsa_engine_get_priv_key(const char *keydir, const char *name,
> + static int rsa_get_priv_key(const char *keydir, const char *name,
> + 			    const char *keyfile, ENGINE *engine, EVP_PKEY **evpp)
> + {
> ++#ifdef USE_PKCS11_ENGINE
> + 	if (engine)
> + 		return rsa_engine_get_priv_key(keydir, name, keyfile, engine,
> + 					       evpp);
> ++#endif
> + 	return rsa_pem_get_priv_key(keydir, name, keyfile, evpp);
> + }
> + 
> +@@ -325,6 +406,7 @@ static int rsa_init(void)
> + 	return 0;
> + }
> + 
> ++#ifdef USE_PKCS11_ENGINE
> + static int rsa_engine_init(const char *engine_id, ENGINE **pe)
> + {
> + 	const char *key_pass;
> +@@ -372,6 +454,7 @@ err_engine_init:
> + 	ENGINE_free(e);
> + 	return ret;
> + }
> ++#endif
> + 
> + static void rsa_engine_remove(ENGINE *e)
> + {
> +@@ -480,11 +563,13 @@ int rsa_sign(struct image_sign_info *info,
> + 	if (ret)
> + 		return ret;
> + 
> ++#ifdef USE_PKCS11_ENGINE
> + 	if (info->engine_id) {
> + 		ret = rsa_engine_init(info->engine_id, &e);
> + 		if (ret)
> + 			return ret;
> + 	}
> ++#endif
> + 
> + 	ret = rsa_get_priv_key(info->keydir, info->keyname, info->keyfile,
> + 			       e, &pkey);
> +@@ -496,16 +581,20 @@ int rsa_sign(struct image_sign_info *info,
> + 		goto err_sign;
> + 
> + 	EVP_PKEY_free(pkey);
> ++#ifdef USE_PKCS11_ENGINE
> + 	if (info->engine_id)
> + 		rsa_engine_remove(e);
> ++#endif
> + 
> + 	return ret;
> + 
> + err_sign:
> + 	EVP_PKEY_free(pkey);
> + err_priv:
> ++#ifdef USE_PKCS11_ENGINE
> + 	if (info->engine_id)
> + 		rsa_engine_remove(e);
> ++#endif
> + 	return ret;
> + }
> + 
> +@@ -645,11 +734,13 @@ int rsa_add_verify_data(struct image_sign_info *info, void *keydest)
> + 	ENGINE *e = NULL;
> + 
> + 	debug("%s: Getting verification data\n", __func__);
> ++#ifdef USE_PKCS11_ENGINE
> + 	if (info->engine_id) {
> + 		ret = rsa_engine_init(info->engine_id, &e);
> + 		if (ret)
> + 			return ret;
> + 	}
> ++#endif
> + 	ret = rsa_get_pub_key(info->keydir, info->keyname, e, &pkey);
> + 	if (ret)
> + 		goto err_get_pub_key;
> +@@ -726,8 +817,10 @@ done:
> + err_get_params:
> + 	EVP_PKEY_free(pkey);
> + err_get_pub_key:
> ++#ifdef USE_PKCS11_ENGINE
> + 	if (info->engine_id)
> + 		rsa_engine_remove(e);
> ++#endif
> + 
> + 	if (ret)
> + 		return ret;
> +-- 
> +2.43.0
> +
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2026-01.patch b/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2026-01.patch
> new file mode 100644
> index 00000000..346d0584
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2026-01.patch
> @@ -0,0 +1,340 @@
> +From a81cb0932dce109af44d7245d47489fe54ae390f Mon Sep 17 00:00:00 2001
> +From: Eddie Kovsky <ewk@edkovsky.org>
> +Date: Mon, 23 Feb 2026 09:43:22 -0700
> +Subject: [PATCH] Add support for OpenSSL Provider API
> +
> +The Engine API has been deprecated since the release of OpenSSL 3.0. End
> +users have been advised to migrate to the new Provider interface.
> +Several distributions have already removed support for engines, which is
> +preventing U-Boot from being compiled in those environments.
> +
> +Add support for the Provider API while continuing to support the existing
> +Engine API on distros shipping older releases of OpenSSL.
> +
> +This is based on similar work contributed by Jan Stancek updating Linux
> +to use the Provider interface.
> +
> +    commit 558bdc45dfb2669e1741384a0c80be9c82fa052c
> +    Author: Jan Stancek <jstancek@redhat.com>
> +    Date:   Fri Sep 20 19:52:48 2024 +0300
> +
> +        sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >= 3
> +
> +The changes have been tested with the FIT signature verification vboot
> +tests on Fedora 42 and Debian 13. All 30 tests pass with both the legacy
> +Engine library installed and with the Provider API.
> +
> +Signed-off-by: Eddie Kovsky <ewk@edkovsky.org>
> +
> +Upstream-Status: Submitted [https://lore.kernel.org/u-boot/20260429180247.83091-1-ekovsky@redhat.com/]
> +
> +Note: Modified to make pkcs11 provider loading optional. The upstream
> +patch unconditionally requires the pkcs11 provider, which is not
> +available in the OE build environment. File-based key signing only needs
> +the default provider; pkcs11 is only required for pkcs11: URI keys.
> +Changes from upstream:
> + - Load default provider first (was pkcs11 first)
> + - Make pkcs11 provider load failure non-fatal (ERR_clear_error instead
> +   of ERR(1, ...) which calls errx/abort)
> +
> +Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> +---
> + doc/build/gcc.rst      |   4 +-
> + lib/aes/aes-encrypt.c |   4 +-
> + lib/rsa/rsa-sign.c    | 102 +++++++++++++++++++++++++++++++++++++++---
> + tools/docker/Dockerfile |  1 +
> + 4 files changed, 103 insertions(+), 8 deletions(-)
> +
> +diff --git a/doc/build/gcc.rst b/doc/build/gcc.rst
> +index 1fef718ceecb..29a6a632e7e3 100644
> +--- a/doc/build/gcc.rst
> ++++ b/doc/build/gcc.rst
> +@@ -25,8 +25,8 @@ Depending on the build targets further packages maybe needed
> + 
> +     sudo apt-get install bc bison build-essential coccinelle \
> +       device-tree-compiler dfu-util efitools flex gdisk graphviz imagemagick \
> +-      libgnutls28-dev libguestfs-tools libncurses-dev \
> +-      libpython3-dev libsdl2-dev libssl-dev lz4 lzma lzma-alone openssl \
> ++      libgnutls28-dev libguestfs-tools libncurses-dev libpython3-dev \
> ++      libsdl2-dev libssl-dev lz4 lzma lzma-alone openssl pkcs11-provider \
> +       pkg-config python3 python3-asteval python3-coverage python3-filelock \
> +       python3-pkg-resources python3-pycryptodome python3-pyelftools \
> +       python3-pytest python3-pytest-xdist python3-sphinxcontrib.apidoc \
> +diff --git a/lib/aes/aes-encrypt.c b/lib/aes/aes-encrypt.c
> +index 90e1407b4f09..4fc4ce232478 100644
> +--- a/lib/aes/aes-encrypt.c
> ++++ b/lib/aes/aes-encrypt.c
> +@@ -16,7 +16,9 @@
> + #include <openssl/err.h>
> + #include <openssl/ssl.h>
> + #include <openssl/evp.h>
> +-#include <openssl/engine.h>
> ++#if !defined(OPENSSL_NO_ENGINE) && !defined(OPENSSL_NO_DEPRECATED_3_0)
> ++# include <openssl/engine.h>
> ++#endif
> + #include <uboot_aes.h>
> + 
> + #if OPENSSL_VERSION_NUMBER >= 0x10000000L
> +diff --git a/lib/rsa/rsa-sign.c b/lib/rsa/rsa-sign.c
> +index 0e38c9e802fd..f456f3c58e65 100644
> +--- a/lib/rsa/rsa-sign.c
> ++++ b/lib/rsa/rsa-sign.c
> +@@ -19,7 +19,47 @@
> + #include <openssl/err.h>
> + #include <openssl/ssl.h>
> + #include <openssl/evp.h>
> +-#include <openssl/engine.h>
> ++#if OPENSSL_VERSION_MAJOR >= 3
> ++# define USE_PKCS11_PROVIDER
> ++# include <err.h>
> ++# include <openssl/provider.h>
> ++# include <openssl/store.h>
> ++#else
> ++# if !defined(OPENSSL_NO_ENGINE) && !defined(OPENSSL_NO_DEPRECATED_3_0)
> ++#  define USE_PKCS11_ENGINE
> ++#  include <openssl/engine.h>
> ++# endif
> ++#endif
> ++
> ++#ifdef USE_PKCS11_PROVIDER
> ++#define ERR(cond, fmt, ...)				\
> ++	do {						\
> ++		bool __cond = (cond);			\
> ++		drain_openssl_errors(__LINE__, 0);	\
> ++		if (__cond) {				\
> ++			errx(1, fmt, ## __VA_ARGS__);	\
> ++		}					\
> ++	} while (0)
> ++
> ++static void drain_openssl_errors(int l, int silent)
> ++{
> ++	const char *file;
> ++	char buf[120];
> ++	int e, line;
> ++
> ++	if (ERR_peek_error() == 0)
> ++		return;
> ++	if (!silent)
> ++		fprintf(stderr, "At main.c:%d:\n", l);
> ++
> ++	while ((e = ERR_peek_error_line(&file, &line))) {
> ++		ERR_error_string(e, buf);
> ++		if (!silent)
> ++			fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
> ++		ERR_get_error();
> ++	}
> ++}
> ++#endif
> + 
> + static int rsa_err(const char *msg)
> + {
> +@@ -94,10 +134,11 @@ static int rsa_pem_get_pub_key(const char *keydir, const char *name, EVP_PKEY **
> +  *
> +  * @keydir:	Key prefix
> +  * @name	Name of key
> +- * @engine	Engine to use
> ++ * @engine	Engine to use or NULL when using pkcs11 provider
> +  * @evpp	Returns EVP_PKEY object, or NULL on failure
> +  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
> +  */
> ++#ifdef USE_PKCS11_ENGINE
> + static int rsa_engine_get_pub_key(const char *keydir, const char *name,
> + 				  ENGINE *engine, EVP_PKEY **evpp)
> + {
> +@@ -157,21 +198,24 @@ static int rsa_engine_get_pub_key(const char *keydir, const char *name,
> + 
> + 	return 0;
> + }
> ++#endif
> + 
> + /**
> +  * rsa_get_pub_key() - read a public key
> +  *
> +  * @keydir:	Directory containing the key (PEM file) or key prefix (engine)
> +  * @name	Name of key file (will have a .crt extension)
> +- * @engine	Engine to use
> ++ * @engine	Engine to use or NULL when using pkcs11 provider
> +  * @evpp	Returns EVP_PKEY object, or NULL on failure
> +  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
> +  */
> + static int rsa_get_pub_key(const char *keydir, const char *name,
> + 			   ENGINE *engine, EVP_PKEY **evpp)
> + {
> ++#ifdef USE_PKCS11_ENGINE
> + 	if (engine)
> + 		return rsa_engine_get_pub_key(keydir, name, engine, evpp);
> ++#endif
> + 	return rsa_pem_get_pub_key(keydir, name, evpp);
> + }
> + 
> +@@ -207,13 +251,45 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
> + 		return -ENOENT;
> + 	}
> + 
> ++#ifdef USE_PKCS11_PROVIDER
> ++	EVP_PKEY *private_key = NULL;
> ++	OSSL_STORE_CTX *store;
> ++
> ++	if (!OSSL_PROVIDER_try_load(NULL, "default", true))
> ++		ERR(1, "OSSL_PROVIDER_try_load(default)");
> ++	/* pkcs11 provider is optional; only needed for pkcs11: URIs */
> ++	if (!OSSL_PROVIDER_try_load(NULL, "pkcs11", true))
> ++		ERR_clear_error();
> ++
> ++	store = OSSL_STORE_open(path, NULL, NULL, NULL, NULL);
> ++	ERR(!store, "OSSL_STORE_open");
> ++
> ++	while (!OSSL_STORE_eof(store)) {
> ++		OSSL_STORE_INFO *info = OSSL_STORE_load(store);
> ++
> ++		if (!info) {
> ++			drain_openssl_errors(__LINE__, 0);
> ++			continue;
> ++		}
> ++		if (OSSL_STORE_INFO_get_type(info) == OSSL_STORE_INFO_PKEY) {
> ++			private_key = OSSL_STORE_INFO_get1_PKEY(info);
> ++			ERR(!private_key, "OSSL_STORE_INFO_get1_PKEY");
> ++		}
> ++		OSSL_STORE_INFO_free(info);
> ++		if (private_key)
> ++			break;
> ++	}
> ++	OSSL_STORE_close(store);
> ++
> ++	*evpp = private_key;
> ++#else
> + 	if (!PEM_read_PrivateKey(f, evpp, NULL, path)) {
> + 		rsa_err("Failure reading private key");
> + 		fclose(f);
> + 		return -EPROTO;
> + 	}
> + 	fclose(f);
> +-
> ++#endif
> + 	return 0;
> + }
> + 
> +@@ -226,6 +301,7 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
> +  * @evpp	Returns EVP_PKEY object, or NULL on failure
> +  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
> +  */
> ++#ifdef USE_PKCS11_ENGINE
> + static int rsa_engine_get_priv_key(const char *keydir, const char *name,
> + 				   const char *keyfile,
> + 				   ENGINE *engine, EVP_PKEY **evpp)
> +@@ -293,22 +369,25 @@ static int rsa_engine_get_priv_key(const char *keydir, const char *name,
> + 
> + 	return 0;
> + }
> ++#endif
> + 
> + /**
> +  * rsa_get_priv_key() - read a private key
> +  *
> +  * @keydir:	Directory containing the key (PEM file) or key prefix (engine)
> +  * @name	Name of key
> +- * @engine	Engine to use for signing
> ++ * @engine	Engine to use or NULL when using pkcs11 provider
> +  * @evpp	Returns EVP_PKEY object, or NULL on failure
> +  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
> +  */
> + static int rsa_get_priv_key(const char *keydir, const char *name,
> + 			    const char *keyfile, ENGINE *engine, EVP_PKEY **evpp)
> + {
> ++#ifdef USE_PKCS11_ENGINE
> + 	if (engine)
> + 		return rsa_engine_get_priv_key(keydir, name, keyfile, engine,
> + 					       evpp);
> ++#endif
> + 	return rsa_pem_get_priv_key(keydir, name, keyfile, evpp);
> + }
> + 
> +@@ -325,6 +404,7 @@ static int rsa_init(void)
> + 	return 0;
> + }
> + 
> ++#ifdef USE_PKCS11_ENGINE
> + static int rsa_engine_init(const char *engine_id, ENGINE **pe)
> + {
> + 	const char *key_pass;
> +@@ -380,6 +460,7 @@ static void rsa_engine_remove(ENGINE *e)
> + 		ENGINE_free(e);
> + 	}
> + }
> ++#endif
> + 
> + static int rsa_sign_with_key(EVP_PKEY *pkey, struct padding_algo *padding_algo,
> + 			     struct checksum_algo *checksum_algo,
> +@@ -480,11 +561,13 @@ int rsa_sign(struct image_sign_info *info,
> + 	if (ret)
> + 		return ret;
> + 
> ++#ifdef USE_PKCS11_ENGINE
> + 	if (info->engine_id) {
> + 		ret = rsa_engine_init(info->engine_id, &e);
> + 		if (ret)
> + 			return ret;
> + 	}
> ++#endif
> + 
> + 	ret = rsa_get_priv_key(info->keydir, info->keyname, info->keyfile,
> + 			       e, &pkey);
> +@@ -496,16 +579,21 @@ int rsa_sign(struct image_sign_info *info,
> + 		goto err_sign;
> + 
> + 	EVP_PKEY_free(pkey);
> ++
> ++#ifdef USE_PKCS11_ENGINE
> + 	if (info->engine_id)
> + 		rsa_engine_remove(e);
> ++#endif
> + 
> + 	return ret;
> + 
> + err_sign:
> + 	EVP_PKEY_free(pkey);
> + err_priv:
> ++#ifdef USE_PKCS11_ENGINE
> + 	if (info->engine_id)
> + 		rsa_engine_remove(e);
> ++#endif
> + 	return ret;
> + }
> + 
> +@@ -645,11 +733,13 @@ int rsa_add_verify_data(struct image_sign_info *info, void *keydest)
> + 	ENGINE *e = NULL;
> + 
> + 	debug("%s: Getting verification data\n", __func__);
> ++#ifdef USE_PKCS11_ENGINE
> + 	if (info->engine_id) {
> + 		ret = rsa_engine_init(info->engine_id, &e);
> + 		if (ret)
> + 			return ret;
> + 	}
> ++#endif
> + 	ret = rsa_get_pub_key(info->keydir, info->keyname, e, &pkey);
> + 	if (ret)
> + 		goto err_get_pub_key;
> +@@ -726,8 +816,10 @@ int rsa_add_verify_data(struct image_sign_info *info, void *keydest)
> + err_get_params:
> + 	EVP_PKEY_free(pkey);
> + err_get_pub_key:
> ++#ifdef USE_PKCS11_ENGINE
> + 	if (info->engine_id)
> + 		rsa_engine_remove(e);
> ++#endif
> + 
> + 	if (ret)
> + 		return ret;
> +diff --git a/tools/docker/Dockerfile b/tools/docker/Dockerfile
> +index 73bf6cdd2c52..50e98e83dc20 100644
> +--- a/tools/docker/Dockerfile
> ++++ b/tools/docker/Dockerfile
> +@@ -122,6 +122,7 @@ RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
> + 	openssl \
> + 	picocom \
> + 	parted \
> ++	pkcs11-provider \
> + 	pkg-config \
> + 	python-is-python3 \
> + 	python3 \
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
> index d3a78d8b..5812b914 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
> @@ -4,6 +4,8 @@ PR = "r0"
>  
>  BRANCH = "ti-u-boot-2024.04"
>  
> -SRC_URI += "file://0001-scripts-dtc-pylibfdt-libfdt.i_shipped-Use-SWIG_Appen.patch"
> -
>  SRCREV_uboot = "29d0c23d67ee7b88e46fe1753cd020e2b04c2ef6"
> +
> +SRC_URI += "file://0001-scripts-dtc-pylibfdt-libfdt.i_shipped-Use-SWIG_Appen.patch"
> +SRC_URI += "file://0001-binman-migrate-form-pkg_resources-to-importlib.patch"
> +SRC_URI += "file://0001-Add-support-for-OpenSSL-Provider-API-2024-04.patch"
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
> index f7475c2b..af4b1b77 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
> @@ -7,3 +7,4 @@ BRANCH = "ti-u-boot-2025.01"
>  SRCREV_uboot = "4ca322ca563a21cccad8c9ba65e386b9fd34dd16"
>  
>  SRC_URI += "file://0001-binman-migrate-form-pkg_resources-to-importlib.patch"
> +SRC_URI += "file://0001-Add-support-for-OpenSSL-Provider-API-2025-01.patch"
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
> index 7637cfaf..d1ef241d 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
> @@ -5,3 +5,5 @@ PR = "r0"
>  BRANCH = "ti-u-boot-2026.01"
>  
>  SRCREV_uboot = "2a85f4bcffc50ddc8b443d8e4162e9e46ed0f200"
> +
> +SRC_URI += "file://0001-Add-support-for-OpenSSL-Provider-API-2026-01.patch"
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> index 3d6769bf..8213ac60 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -25,6 +25,7 @@ UBOOT_GIT_PROTOCOL ?= "https"
>  UBOOT_GIT_BRANCH ?= "branch=${BRANCH}"
>  SRC_URI = "${UBOOT_GIT_URI};protocol=${UBOOT_GIT_PROTOCOL};${UBOOT_GIT_BRANCH};name=uboot"
>  
> +SRC_URI:append:bsp-ti-6_6 = " file://0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch"
>  SRC_URI:append:bsp-ti-6_12 = " file://0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch"
>  SRC_URI:append:bsp-ti-6_18 = " file://0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch"
>  
> -- 
> 2.43.0

