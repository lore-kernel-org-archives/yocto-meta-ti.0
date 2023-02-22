Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F4FDC61DA4
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 19:38:48 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2845.1677094718293782242
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Feb 2023 11:38:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B515840C2E;
	Wed, 22 Feb 2023 19:38:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eI0U5xaAVkl4; Wed, 22 Feb 2023 19:38:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9802D40AC9;
	Wed, 22 Feb 2023 19:38:35 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D6F74163764; Wed, 22 Feb 2023 14:38:10 -0500 (EST)
Date: Wed, 22 Feb 2023 14:38:10 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH v2 03/15] optee-os: Use new
 ti-secdev class to sign the images
Message-ID: <20230222193810.GU22689@denix.org>
References: <20230215193355.9676-1-afd@ti.com>
 <20230215193355.9676-4-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215193355.9676-4-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Feb 2023 19:38:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15909

On Wed, Feb 15, 2023 at 01:33:43PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> Use the new ti-k3-secdev package to pull in the signing tools if they are
> not provided by the environment. This allows us to use these tools
> unconditionally. Remove the checks for the script and do the signing
> for all K3 machines. The signature is automatically stripped from
> the binaries on non-HS devices at boot time as needed so this change
> is harmless for GP devices.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Tested-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  .../optee/optee-os_3.16%.bbappend             | 43 +++----------------
>  1 file changed, 7 insertions(+), 36 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend
> index 6913851b..1e0072ef 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend
> @@ -1,14 +1,13 @@
>  PV:ti-soc = "3.19.0+git${SRCPV}"
>  SRCREV:ti-soc = "afacf356f9593a7f83cae9f96026824ec242ff52"
>  
> +# Use TI SECDEV for signing
> +inherit ti-secdev
> +
>  EXTRA_OEMAKE:append:k3 = "${@ ' CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
>  
>  EXTRA_OEMAKE:append:am62xx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
>  
> -do_compile:prepend:ti-soc() {
> -    export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
> -}
> -
>  do_compile:append:k3() {
>      ( cd ${B}/core/; \
>          cp tee-pager_v2.bin ${B}/bl32.bin; \
> @@ -35,20 +34,6 @@ optee_sign_legacyhs() {
>      fi
>  }
>  
> -# Signing procedure for K3 HS devices
> -optee_sign_k3hs() {
> -    ( cd ${B}/core/; \
> -        if [ -f ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ]; then \
> -            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh tee-pager_v2.bin tee-pager.bin.signed; \
> -        else \
> -            echo "Warning: TI_SECURE_DEV_PKG not set, OP-TEE not signed."; \
> -            cp tee-pager_v2.bin tee-pager.bin.signed; \
> -        fi; \
> -        mv tee-pager.bin.signed ${B}/bl32.bin; \
> -        cp tee.elf ${B}/bl32.elf; \
> -    )
> -}
> -
>  do_compile:append:ti43x() {
>      optee_sign_legacyhs
>  }
> @@ -57,24 +42,10 @@ do_compile:append:dra7xx() {
>      optee_sign_legacyhs
>  }
>  
> -do_compile:append:am65xx-hs-evm() {
> -    optee_sign_k3hs
> -}
> -
> -do_compile:append:am64xx-evm() {
> -    optee_sign_k3hs
> -}
> -
> -do_compile:append:j721e-hs-evm() {
> -    optee_sign_k3hs
> -}
> -
> -do_compile:append:j7200-hs-evm() {
> -    optee_sign_k3hs
> -}
> -
> -do_compile:append:j721s2-hs-evm() {
> -    optee_sign_k3hs
> +# Signing procedure for K3 devices
> +do_compile:append:k3() {
> +    ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${B}/core/tee-pager_v2.bin ${B}/bl32.bin
> +    cp ${B}/core/tee.elf ${B}/bl32.elf
>  }
>  
>  do_install:append:ti-soc() {
> -- 
> 2.39.1

