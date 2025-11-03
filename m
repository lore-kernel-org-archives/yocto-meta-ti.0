Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F22ACCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 23:30:58 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5703.1762212649037144981
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 03 Nov 2025 15:30:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0EAB340C2E;
	Mon,  3 Nov 2025 23:30:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pVSFdjcvqQ-z; Mon,  3 Nov 2025 23:30:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D0E8A40C2C;
	Mon,  3 Nov 2025 23:30:45 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2EF7617055E; Mon,  3 Nov 2025 18:30:45 -0500 (EST)
Date: Mon, 3 Nov 2025 18:30:45 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: s-joshi@ti.com
Cc: meta-ti@lists.yoctoproject.org, kamlesh@ti.com
Subject: Re: [meta-ti][scarthgap][PATCH] meta-ti-bsp: optee: Add flags to
 enable RPMB and PKCS#11
Message-ID: <20251103233045.GK3125@denix.org>
References: <20251103053940.555954-1-s-joshi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103053940.555954-1-s-joshi@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 03 Nov 2025 23:30:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19221

On Mon, Nov 03, 2025 at 11:09:41AM +0530, Suhaas Joshi via lists.yoctoproject.org wrote:
> RPMB is a secure storage mechanism used to store data in a separate
> partition of compliant storage devices such as eMMC, NVME etc. It is
> provided by TEE's, including OP-TEE.
> 
> Add the following build options to optee_os:
>     * CFG_REE_FS=n -> disables the default REE_FS, this is so that
>       RPMB can be be demonstrated
>     * CFG_RPMB_FS=y -> enables the RPMB feature
>     * CFG_RPMB_WRITE_KEY=y -> generates Auth Key during first access to
>       storage device. Note: This needs to be turned off for production
>       builds.
>     * CFG_PKCS11_TA=y -> enables PKCS#11 API support in form of a
>       Trusted Application. This commit also copies this TA to the
>       relevant location.
> 
> In optee_client, do the following:
>     * Add RPMB_EMU=1 option. This is enabled by-default, but even so,
>       enable it explicitly. This option makes tee-supplicant emulate
>       RPMB instead of using the actual hardware. The actual hardware
>       should be used consciously since the key, once written, cannot be
>       re-programmed. But in the emulated flow, each reboot wipes the key
>       off, since the "emulated RPMB" is just a portion of primary
>       memory.
>     * Copy libckteec library files to relevant locations.
> 
> Signed-off-by: Suhaas Joshi <s-joshi@ti.com>
> ---
>  .../recipes-security/optee/optee-client_%.bbappend   | 12 ++++++++++++
>  .../recipes-security/optee/optee-os-ti-overrides.inc | 10 ++++++----
>  2 files changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
> index f193e78b..07db2955 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
> +++ b/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
> @@ -2,3 +2,15 @@ OPTEE_TI_VERSION = ""
>  OPTEE_TI_VERSION:ti-soc = "${BPN}-ti-version.inc"
>  
>  require ${OPTEE_TI_VERSION}
> +
> +do_install:append() {
> +   install -d ${D}${libdir}
> +
> +   install -m 0644 ${B}/libckteec/libckteec.so.0.1.0 ${D}${libdir}/
> +   ln -v -sf libckteec.so.0.1.0 ${D}${libdir}/libckteec.so.0.1
> +   ln -v -sf libckteec.so.0.1 ${D}${libdir}/libckteec.so.0
> +   ln -v -sf libckteec.so.0 ${D}${libdir}/libckteec.so
> +}
> +
> +FILES:${PN} += "${libdir}/libckteec.so.0 ${libdir}/libckteec.so.0.1 ${libdir}/libckteec.so.0.1.0"
> +FILES:${PN}-dev += "${libdir}/libckteec.so"

This modifies upstream recipe directly, which violates YP Compatible 
compliance.

Simply put - you cannot modify .bbappend of upstream recipes directly, 
that's why those ${BPN}-ti-*.inc file exist.


> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> index 61a74a06..0b940e5c 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> @@ -6,11 +6,11 @@ EXTRA_OEMAKE:remove = "CFG_MAP_EXT_DT_SECURE=y"
>  EXTRA_OEMAKE:append:k3 = " ${@ 'CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
>  EXTRA_OEMAKE:append:k3 = " ${@ 'CFG_TZDRAM_START='+ d.getVar('OPTEE_K3_TZDRAM_START') if d.getVar('OPTEE_K3_TZDRAM_START') else ''}"
>  
> -EXTRA_OEMAKE:append:am62xx = " CFG_TEE_CORE_LOG_LEVEL=1"
> +EXTRA_OEMAKE:append:am62xx = " CFG_TEE_CORE_LOG_LEVEL=1 CFG_REE_FS=n CFG_RPMB_FS=y CFG_RPMB_WRITE_KEY=y CFG_PKCS11_TA=y"
>  EXTRA_OEMAKE:append:am62lxx = " CFG_TEE_CORE_LOG_LEVEL=1"
> -EXTRA_OEMAKE:append:am62pxx = " CFG_TEE_CORE_LOG_LEVEL=1"
> -EXTRA_OEMAKE:append:am62axx = " CFG_TEE_CORE_LOG_LEVEL=1"
> -EXTRA_OEMAKE:append:am62dxx = " CFG_TEE_CORE_LOG_LEVEL=1"
> +EXTRA_OEMAKE:append:am62pxx = " CFG_TEE_CORE_LOG_LEVEL=1 CFG_REE_FS=n CFG_RPMB_FS=y CFG_RPMB_WRITE_KEY=y CFG_PKCS11_TA=y"
> +EXTRA_OEMAKE:append:am62axx = " CFG_TEE_CORE_LOG_LEVEL=1 CFG_REE_FS=n CFG_RPMB_FS=y CFG_RPMB_WRITE_KEY=y CFG_PKCS11_TA=y"
> +EXTRA_OEMAKE:append:am62dxx = " CFG_TEE_CORE_LOG_LEVEL=1 CFG_REE_FS=n CFG_RPMB_FS=y CFG_RPMB_WRITE_KEY=y CFG_PKCS11_TA=y"
>  EXTRA_OEMAKE:append:j722s = " CFG_TEE_CORE_LOG_LEVEL=1"
>  
>  do_compile:append:k3() {
> @@ -49,6 +49,8 @@ do_install:append() {
>      install -m 644 ${B}/*.optee ${D}${nonarch_base_libdir}/firmware/ || true
>      install -m 644 ${B}/bl32.bin ${D}${nonarch_base_libdir}/firmware/ || true
>      install -m 644 ${B}/bl32.elf ${D}${nonarch_base_libdir}/firmware/ || true
> +    install -d ${D}${nonarch_base_libdir}/optee_armtz
> +    install -m 644 ${B}/ta/pkcs11/fd02c9da-306c-48c7-a49c-bbd827ae86ee.ta ${D}${nonarch_base_libdir}/optee_armtz
>  }
>  
>  optee_deploy_legacyhs() {
> -- 
> 2.34.1

