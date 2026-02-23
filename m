Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 532F1EC111D
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 18:09:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1074.1771870191135412071
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 10:09:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3574F40CAB;
	Mon, 23 Feb 2026 18:09:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 15aMksyhpOrH; Mon, 23 Feb 2026 18:09:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E4DB440A46;
	Mon, 23 Feb 2026 18:09:46 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1CBD5178E15; Mon, 23 Feb 2026 13:09:46 -0500 (EST)
Date: Mon, 23 Feb 2026 13:09:46 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH v2] optee: Update to 4.9.0 tag
Message-ID: <20260223180946.GP11121@denix.org>
References: <20260212221955.3319340-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212221955.3319340-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Feb 2026 18:09:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19561

On Thu, Feb 12, 2026 at 04:19:55PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> From: Manorit Chawdhry <m-chawdhry@ti.com>
> 
> Update optee_os, optee_client, optee_examples and optee_test to the
> newer 4.9.0 tag.
> 
> Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
> v2: Removed platform specific backported patches that are no longer
>     needed.
> 
>  .../optee/optee-client-ti-version.inc                 |  8 ++------
>  .../optee/optee-examples-ti-version.inc               |  4 ++--
>  .../recipes-security/optee/optee-ftpm-ti-version.inc  |  4 ++--
>  .../recipes-security/optee/optee-os-ti-overrides.inc  |  9 ---------
>  .../recipes-security/optee/optee-os-ti-version.inc    | 11 ++---------
>  .../recipes-security/optee/optee-test-ti-version.inc  |  5 ++---
>  6 files changed, 10 insertions(+), 31 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> index ec10cefe..68b6b262 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> @@ -1,6 +1,2 @@
> -PV = "4.7.0+git"
> -SRCREV = "23c112a6f05cc5e39bd4aaf52ad515cad532237d"
> -
> -SRC_URI:remove = " \
> -    file://0001-tee-supplicant-add-udev-rule-and-systemd-service-fil.patch \
> -"
> +PV = "4.9.0+git"
> +SRCREV = "9f5e90918093c1d1cd264d8149081b64ab7ba672"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
> index 91dd5e60..6ec2a83d 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
> @@ -1,2 +1,2 @@
> -PV = "4.7.0+git"
> -SRCREV = "14321a0607db16099d158478b21a2b2e37b3a935"
> +PV = "4.9.0+git"
> +SRCREV = "934c7edb74a26e90f68024cf441073528444177f"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
> index edc9d68e..350eb9c9 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
> @@ -1,3 +1,3 @@
> -PV = "4.7.0+git"
> +PV = "4.9.0+git"
>  OPTEE_TA_GIT_TAG = "${@'branch=master' if d.getVar('PV') == 'git' or d.getVar('PV').endswith('+git') else 'tag=%s;nobranch=1' % d.getVar('PV')}"
> -SRCREV_optee-ta = "ce33372ab772e879826361a1ca91126260bd9be1"
> +SRCREV_optee-ta = "a09269b15de635e1816fe832e26adfbfb44c5455"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> index 30dbb430..83087030 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> @@ -78,12 +78,3 @@ RDEPENDS:${PN} += "${PN}-ta"
>  
>  # This is needed for bl32.elf
>  INSANE_SKIP:${PN}:append:k3 = " textrel"
> -
> -# LPM support patch for Jacinto platforms (J7200, J742S2, J784S4)
> -OPTEE_JACINTO_LPM_PATCHES = " \
> -    file://0001-plat-k3-drivers-Open-TRNG-firewall-for-TIFS-on-all-k.patch \

The patch file was left behind unused...


> -"
> -
> -SRC_URI:append:j7200 = " ${OPTEE_JACINTO_LPM_PATCHES}"
> -SRC_URI:append:j742s2 = " ${OPTEE_JACINTO_LPM_PATCHES}"
> -SRC_URI:append:j784s4 = " ${OPTEE_JACINTO_LPM_PATCHES}"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
> index 9b1db77b..8f75db04 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
> @@ -1,9 +1,2 @@
> -PV = "4.7.0+git"
> -SRCREV = "a9690ae39995af36a31b7a4f446f27ea0787e3a4"
> -
> -SRC_URI:remove = " \
> -    file://0001-mk-compile.mk-remove-absolute-build-time-paths.patch \
> -    file://0001-compile.mk-use-CFLAGS-from-environment.patch \
> -    file://0002-link.mk-use-CFLAGS-with-version.o.patch \
> -    file://0003-link.mk-generate-version.o-in-link-out-dir.patch \
> -"
> +PV = "4.9.0+git"
> +SRCREV = "c2b0684fcd89929976a8726e6e3af922b48dd2c7"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
> index 2d8fd8b2..15b43063 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
> @@ -1,5 +1,4 @@
>  FILESEXTRAPATHS:prepend := "${THISDIR}/optee-test:"
>  
> -PV = "4.7.0+git"
> -SRCREV = "a15be9eca1b7e935917d834284726027dffc8cfb"
> -
> +PV = "4.9.0+git"
> +SRCREV = "b27648ea8472cceceb8dda368a965c709066f7aa"
> -- 
> 2.43.0

