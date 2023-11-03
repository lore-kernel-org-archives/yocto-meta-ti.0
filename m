Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E542C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 06:19:23 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.33578.1698992362059629501
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 Nov 2023 23:19:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 364F140C88;
	Fri,  3 Nov 2023 06:19:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W1Re4Xj92gP0; Fri,  3 Nov 2023 06:19:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C88C440C61;
	Fri,  3 Nov 2023 06:19:17 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4DDBB163D44; Fri,  3 Nov 2023 02:19:17 -0400 (EDT)
Date: Fri, 3 Nov 2023 02:19:17 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][RFC] optee: Rework include files
Message-ID: <20231103061917.GM2408@denix.org>
References: <20231102182046.25324-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231102182046.25324-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 03 Nov 2023 06:19:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17233

I like the -overrides naming. Not so sure about -srcrev one. Maybe -ver or 
-version?


On Thu, Nov 02, 2023 at 01:20:46PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> Minor rework of the TI include files used to override both SRCREV and
> other settings in the optee recipes for TI SOC parts.  The intent is to
> make it more clear when we are changing SRCREVs versus changing other
> items, and allow for sharing the SRCREV changes for optee-os-tadevkit
> which should track the optee-os SRCREV.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  ...optee-client-ti.inc => optee-client-ti-srcrev.inc} |  0
>  .../recipes-security/optee/optee-client_%.bbappend    |  6 +++---
>  ...e-examples-ti.inc => optee-examples-ti-srcrev.inc} |  0
>  .../recipes-security/optee/optee-examples_%.bbappend  |  6 +++---
>  .../optee/optee-os-tadevkit-ti-overrides.inc          |  1 +
>  .../optee/optee-os-tadevkit_%.bbappend                | 11 ++++++++---
>  .../{optee-os-ti.inc => optee-os-ti-overrides.inc}    |  8 --------
>  ...ptee-os-tadevkit-ti.inc => optee-os-ti-srcrev.inc} |  2 --
>  .../recipes-security/optee/optee-os_%.bbappend        | 11 ++++++++---
>  .../{optee-test-ti.inc => optee-test-ti-srcrev.inc}   |  0
>  .../recipes-security/optee/optee-test_%.bbappend      |  6 +++---
>  11 files changed, 26 insertions(+), 25 deletions(-)
>  rename meta-ti-bsp/recipes-security/optee/{optee-client-ti.inc => optee-client-ti-srcrev.inc} (100%)
>  rename meta-ti-bsp/recipes-security/optee/{optee-examples-ti.inc => optee-examples-ti-srcrev.inc} (100%)
>  create mode 100644 meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti-overrides.inc
>  rename meta-ti-bsp/recipes-security/optee/{optee-os-ti.inc => optee-os-ti-overrides.inc} (86%)
>  rename meta-ti-bsp/recipes-security/optee/{optee-os-tadevkit-ti.inc => optee-os-ti-srcrev.inc} (87%)
>  rename meta-ti-bsp/recipes-security/optee/{optee-test-ti.inc => optee-test-ti-srcrev.inc} (100%)
> 
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti-srcrev.inc
> similarity index 100%
> rename from meta-ti-bsp/recipes-security/optee/optee-client-ti.inc
> rename to meta-ti-bsp/recipes-security/optee/optee-client-ti-srcrev.inc
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
> index 08c5256b..71b85720 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
> +++ b/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
> @@ -1,4 +1,4 @@
> -OPTEE_TI = ""
> -OPTEE_TI:ti-soc = "${BPN}-ti.inc"
> +OPTEE_TI_SRCREV = ""
> +OPTEE_TI_SRCREV:ti-soc = "${BPN}-ti-srcrev.inc"
>  
> -require ${OPTEE_TI}
> +require ${OPTEE_TI_SRCREV}
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-srcrev.inc
> similarity index 100%
> rename from meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc
> rename to meta-ti-bsp/recipes-security/optee/optee-examples-ti-srcrev.inc
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend
> index 08c5256b..71b85720 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend
> +++ b/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend
> @@ -1,4 +1,4 @@
> -OPTEE_TI = ""
> -OPTEE_TI:ti-soc = "${BPN}-ti.inc"
> +OPTEE_TI_SRCREV = ""
> +OPTEE_TI_SRCREV:ti-soc = "${BPN}-ti-srcrev.inc"
>  
> -require ${OPTEE_TI}
> +require ${OPTEE_TI_SRCREV}
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti-overrides.inc b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti-overrides.inc
> new file mode 100644
> index 00000000..df46e243
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti-overrides.inc
> @@ -0,0 +1 @@
> +EXTRA_OEMAKE:remove = "CFG_MAP_EXT_DT_SECURE=y"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
> index 08c5256b..9f265932 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
> @@ -1,4 +1,9 @@
> -OPTEE_TI = ""
> -OPTEE_TI:ti-soc = "${BPN}-ti.inc"
> +OPTEE_TI_SRCREV = ""
> +OPTEE_TI_SRCREV:ti-soc = "optee-os-ti-srcrev.inc"
>  
> -require ${OPTEE_TI}
> +require ${OPTEE_TI_SRCREV}
> +
> +OPTEE_TI_OVERRIDES = ""
> +OPTEE_TI_OVERRIDES:ti-soc = "${BPN}-ti-overrides.inc"
> +
> +require ${OPTEE_TI_OVERRIDES}
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> similarity index 86%
> rename from meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
> rename to meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> index 6d192bbe..de13d282 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> @@ -1,11 +1,3 @@
> -PV = "4.0.0+git${SRCPV}"
> -SRCREV = "2a5b1d1232f582056184367fb58a425ac7478ec6"
> -
> -# Fixes for pointing to 4.0.0 before upstream meta-arm
> -FILESEXTRAPATHS:prepend := "${THISDIR}/optee-os-4.0.0:"
> -SRC_URI:remove = "file://0002-core-Define-section-attributes-for-clang.patch"
> -SRC_URI:append = " file://0002ti-core-Define-section-attributes-for-clang.patch"
> -
>  # Use TI SECDEV for signing
>  inherit ti-secdev
>  
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-srcrev.inc
> similarity index 87%
> rename from meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc
> rename to meta-ti-bsp/recipes-security/optee/optee-os-ti-srcrev.inc
> index 55453366..06472e34 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-srcrev.inc
> @@ -5,5 +5,3 @@ SRCREV = "2a5b1d1232f582056184367fb58a425ac7478ec6"
>  FILESEXTRAPATHS:prepend := "${THISDIR}/optee-os-4.0.0:"
>  SRC_URI:remove = "file://0002-core-Define-section-attributes-for-clang.patch"
>  SRC_URI:append = " file://0002ti-core-Define-section-attributes-for-clang.patch"
> -
> -EXTRA_OEMAKE:remove = "CFG_MAP_EXT_DT_SECURE=y"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
> index 08c5256b..eb29392b 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
> @@ -1,4 +1,9 @@
> -OPTEE_TI = ""
> -OPTEE_TI:ti-soc = "${BPN}-ti.inc"
> +OPTEE_TI_SRCREV = ""
> +OPTEE_TI_SRCREV:ti-soc = "${BPN}-ti-srcrev.inc"
>  
> -require ${OPTEE_TI}
> +require ${OPTEE_TI_SRCREV}
> +
> +OPTEE_TI_OVERRIDES = ""
> +OPTEE_TI_OVERRIDES:ti-soc = "${BPN}-ti-overrides.inc"
> +
> +require ${OPTEE_TI_OVERRIDES}
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-test-ti-srcrev.inc
> similarity index 100%
> rename from meta-ti-bsp/recipes-security/optee/optee-test-ti.inc
> rename to meta-ti-bsp/recipes-security/optee/optee-test-ti-srcrev.inc
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend
> index 08c5256b..71b85720 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend
> +++ b/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend
> @@ -1,4 +1,4 @@
> -OPTEE_TI = ""
> -OPTEE_TI:ti-soc = "${BPN}-ti.inc"
> +OPTEE_TI_SRCREV = ""
> +OPTEE_TI_SRCREV:ti-soc = "${BPN}-ti-srcrev.inc"
>  
> -require ${OPTEE_TI}
> +require ${OPTEE_TI_SRCREV}
> -- 
> 2.17.1

