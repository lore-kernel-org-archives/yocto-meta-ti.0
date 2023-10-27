Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D52BC25B47
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 05:31:14 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.811.1698384665651595751
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Oct 2023 22:31:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=RKxz+DbE;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: m-chawdhry@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39R5V41w077749;
	Fri, 27 Oct 2023 00:31:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698384664;
	bh=8FIPaigVIy+HfEagfVvHYb0xwrjQ1dMODcc+6sjFvEY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=RKxz+DbEQ9LCKPSb+gJSLEWoI8iu1jKlhsgfKusfEvNV28i+f6lG0P98CLVnPHfx2
	 yLmBR07q3OSCZJO9c253Ld4In7cnWAtta9X70DS4OsWjK+EZWUbny4TamqjOkwuqLB
	 FTTVm4iY7xT2EIinVupR6Q6wmbROjofrEjEFauPs=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39R5V3Pi022058
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Oct 2023 00:31:04 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 27
 Oct 2023 00:31:03 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 27 Oct 2023 00:31:03 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39R5V2Tt022226;
	Fri, 27 Oct 2023 00:31:03 -0500
Date: Fri, 27 Oct 2023 11:01:02 +0530
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][kirkstone][PATCH] optee: Update to upstream 4.0.0
Message-ID: <20231027053102.7mfjuvkavx72c4zv@ula0497581>
References: <20231026132915.1441-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231026132915.1441-1-reatmon@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Oct 2023 05:31:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17203

Hi Ryan,

On 08:29-20231026, Ryan Eatmon via lists.yoctoproject.org wrote:
> Update all of the optee components to the upstream 4.0.0 version.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta-ti-bsp/recipes-security/optee/optee-client-ti.inc    | 4 ++--
>  meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc  | 4 ++--
>  .../recipes-security/optee/optee-os-tadevkit-ti.inc       | 5 +++--
>  meta-ti-bsp/recipes-security/optee/optee-os-ti.inc        | 4 ++--
>  meta-ti-bsp/recipes-security/optee/optee-test-ti.inc      | 8 ++++++--
>  5 files changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti.inc
> index fef87d30..f64a90c3 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-client-ti.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti.inc
> @@ -1,5 +1,5 @@
> -PV = "3.20.0+git${SRCPV}"
> -SRCREV = "dd2d39b49975d2ada7870fe2b7f5a84d0d3860dc"
> +PV = "4.0.0+git${SRCPV}"
> +SRCREV = "acb0885c117e73cb6c5c9b1dd9054cb3f93507ee"
>  
>  inherit pkgconfig
>  DEPENDS += "util-linux"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc
> index 7d119f0d..7a733f53 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc
> @@ -1,3 +1,3 @@
> -PV = "3.20.0+git${SRCPV}"
> -SRCREV = "a98d01e1b9168eaed96bcd0bac0df67c44a81081"
> +PV = "4.0.0+git${SRCPV}"
> +SRCREV = "378dc0db2d5dd279f58a3b6cb3f78ffd6b165035"
>  SRC_URI:remove = "file://0001-Makefile-Fix-non-portable-sh-check-for-plugins.patch"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc
> index 18820af1..c1354539 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc
> @@ -1,2 +1,3 @@
> -PV = "3.20.0+git${SRCPV}"
> -SRCREV = "8e74d47616a20eaa23ca692f4bbbf917a236ed94"
> +PV = "4.0.0+git${SRCPV}"
> +SRCREV = "2a5b1d1232f582056184367fb58a425ac7478ec6"

If possible, can we pick the same SHA of optee-os itself for this
through some include file? I don't think it makes sense to update the
same SHA at two places for this tadevkit that I see always being in sync
with optee-os only. Ig this had been the missing piece in my testing
that I had missed updating that led to crashed for me. Upto you but just
a suggestion.

Regards,
Manorit
> +
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
> index 19386295..763dd1d5 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
> @@ -1,5 +1,5 @@
> -PV = "3.20.0+git${SRCPV}"
> -SRCREV = "8e74d47616a20eaa23ca692f4bbbf917a236ed94"
> +PV = "4.0.0+git${SRCPV}"
> +SRCREV = "2a5b1d1232f582056184367fb58a425ac7478ec6"
>  
>  # Use TI SECDEV for signing
>  inherit ti-secdev
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-test-ti.inc
> index 43e0172d..b68caf0c 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-test-ti.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti.inc
> @@ -1,2 +1,6 @@
> -PV = "3.19.0+git${SRCPV}"
> -SRCREV = "ab9863cc187724e54c032b738c28bd6e9460a4db"
> +PV = "4.0.0+git${SRCPV}"
> +SRCREV = "1c3d6be5eaa6174e3dbabf60928d15628e39b994"
> +
> +EXTRA_OEMAKE:append = " OPTEE_OPENSSL_EXPORT=${STAGING_INCDIR}"
> +DEPENDS:append = " openssl"
> +
> -- 
> 2.17.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17195): https://lists.yoctoproject.org/g/meta-ti/message/17195
> Mute This Topic: https://lists.yoctoproject.org/mt/102199608/6945827
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/11362175/6945827/309017070/xyzzy [m-chawdhry@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


