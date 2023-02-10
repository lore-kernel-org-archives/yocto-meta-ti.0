Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9FB9C05027
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 18:52:14 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2523.1676055126945097809
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 10 Feb 2023 10:52:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0C6FF40C1E;
	Fri, 10 Feb 2023 18:52:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uA7bPnAWvHkZ; Fri, 10 Feb 2023 18:52:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D6C6440A0B;
	Fri, 10 Feb 2023 18:52:02 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id AADD3163757; Fri, 10 Feb 2023 13:51:39 -0500 (EST)
Date: Fri, 10 Feb 2023 13:51:39 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH 1/4] trusted-firmware-a: Use
 ti-k3-secdev if TI_SECURE_DEV_PKG_K3 is not defined
Message-ID: <20230210185139.GW22689@denix.org>
References: <20230208231031.16363-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208231031.16363-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 10 Feb 2023 18:52:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15796

On Wed, Feb 08, 2023 at 05:10:28PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> Use the new ti-k3-secdev package to pull in the signing tools if they are
> not provided by the environment. This allows us to use these tools
> unconditionally. Remove the checks for the script and do the signing
> for all K3 machines. The signature is automatically stripped from
> the binaries on non-HS devices at boot time as needed so this change
> is harmless for GP devices.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  .../trusted-firmware-a_%.bbappend             | 43 ++++++-------------
>  1 file changed, 12 insertions(+), 31 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> index 5acc5c2e..95f1d2d9 100644
> --- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> +++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> @@ -6,39 +6,20 @@ TFA_BUILD_TARGET:k3 = "all"
>  TFA_INSTALL_TARGET:k3 = "bl31"
>  TFA_SPD:k3 = "opteed"
>  
> +# Use default package TI SECDEV is one is not provided

typo - *if* one is not provided


> +DEPENDS:append:k3 = "${@ '' if d.getVar('TI_SECURE_DEV_PKG_K3') else ' ti-k3-secdev-native' }"
> +
> +# Set a default value for TI_K3_SECDEV_INSTALL_DIR
> +export TI_K3_SECDEV_INSTALL_DIR = "${STAGING_DIR_NATIVE}${datadir}/ti/ti-k3-secdev"
> +include recipes-ti/includes/ti-paths.inc

If you set TI_K3_SECDEV_INSTALL_DIR explicitly, why do you need to include 
ti-paths.inc here?


> +TI_SECURE_DEV_PKG:k3 = "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or d.getVar('TI_K3_SECDEV_INSTALL_DIR') }"
> +
>  EXTRA_OEMAKE:append:k3 = "${@ ' K3_USART=' + d.getVar('TFA_K3_USART') if d.getVar('TFA_K3_USART') else ''}"
>  EXTRA_OEMAKE:append:k3 = "${@ ' K3_PM_SYSTEM_SUSPEND=' + d.getVar('TFA_K3_SYSTEM_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"
>  
> -# Signing procedure for K3 HS devices
> -tfa_sign_k3hs() {
> +# Signing procedure for K3 devices
> +do_compile:append:k3() {
>  	export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
> -	( cd ${BUILD_DIR}; \
> -		mv bl31.bin bl31.bin.unsigned; \
> -		if [ -f ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ]; then \
> -			${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh bl31.bin.unsigned bl31.bin; \
> -		else \
> -			echo "Warning: TI_SECURE_DEV_PKG not set, TF-A not signed."; \
> -			cp bl31.bin.unsigned bl31.bin; \
> -		fi; \
> -	)
> -}
> -
> -do_compile:append:am65xx-hs-evm() {
> -	tfa_sign_k3hs
> -}
> -
> -do_compile:append:am64xx-evm() {
> -	tfa_sign_k3hs
> -}
> -
> -do_compile:append:j721e-hs-evm() {
> -	tfa_sign_k3hs
> -}
> -
> -do_compile:append:j7200-hs-evm() {
> -	tfa_sign_k3hs
> -}
> -
> -do_compile:append:j721s2-hs-evm() {
> -	tfa_sign_k3hs
> +	mv ${BUILD_DIR}/bl31.bin ${BUILD_DIR}/bl31.bin.unsigned
> +	${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${BUILD_DIR}/bl31.bin.unsigned ${BUILD_DIR}/bl31.bin
>  }
> -- 
> 2.39.1

