Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D6CDC4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 22:13:20 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.66762.1699049592845932083
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 03 Nov 2023 15:13:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=EUZjefM3;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A3MD96u031571;
	Fri, 3 Nov 2023 17:13:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699049589;
	bh=iHmcVoPHiSbEtxEHmhMKPqvhHzlMwMqFjEet1bwJnHs=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=EUZjefM370/GtQe6Iihis4ynRvx4ixfq+Y20SCxJMtnGjFCi8MFTgVmlkwtbuToMO
	 IdkqlAlUUqpij0SIB/6/4w+2agPjWvyj37rNWtxx5e/bpnXCd7PiC3hg4an+dI2pv0
	 uVWsQbK+62uldXKnKyLtEOwGRmcO6r3VMHz45H3w=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A3MD9eS101350
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Nov 2023 17:13:09 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Nov 2023 17:13:09 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Nov 2023 17:13:09 -0500
Received: from [10.249.38.142] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A3MD9Jf010140;
	Fri, 3 Nov 2023 17:13:09 -0500
Message-ID: <6eba65f2-330d-4667-b291-2d8ba9bb4b44@ti.com>
Date: Fri, 3 Nov 2023 17:13:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][RFC v2] optee: Rework include files
Content-Language: en-US
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <17943C4ECC579846.30622@lists.yoctoproject.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <17943C4ECC579846.30622@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 03 Nov 2023 22:13:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17241


Forgot that v2 is just renaming the verison file based on prior feedback.


On 11/3/2023 5:07 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> Minor rework of the TI include files used to override both SRCREV and
> other settings in the optee recipes for TI SOC parts.  The intent is to
> make it more clear when we are changing SRCREVs versus changing other
> items, and allow for sharing the SRCREV changes for optee-os-tadevkit
> which should track the optee-os SRCREV.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   ...ptee-client-ti.inc => optee-client-ti-version.inc} |  0
>   .../recipes-security/optee/optee-client_%.bbappend    |  6 +++---
>   ...-examples-ti.inc => optee-examples-ti-version.inc} |  0
>   .../recipes-security/optee/optee-examples_%.bbappend  |  6 +++---
>   .../optee/optee-os-tadevkit-ti-overrides.inc          |  1 +
>   .../optee/optee-os-tadevkit_%.bbappend                | 11 ++++++++---
>   .../{optee-os-ti.inc => optee-os-ti-overrides.inc}    |  8 --------
>   ...tee-os-tadevkit-ti.inc => optee-os-ti-version.inc} |  2 --
>   .../recipes-security/optee/optee-os_%.bbappend        | 11 ++++++++---
>   .../{optee-test-ti.inc => optee-test-ti-version.inc}  |  0
>   .../recipes-security/optee/optee-test_%.bbappend      |  6 +++---
>   11 files changed, 26 insertions(+), 25 deletions(-)
>   rename meta-ti-bsp/recipes-security/optee/{optee-client-ti.inc => optee-client-ti-version.inc} (100%)
>   rename meta-ti-bsp/recipes-security/optee/{optee-examples-ti.inc => optee-examples-ti-version.inc} (100%)
>   create mode 100644 meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti-overrides.inc
>   rename meta-ti-bsp/recipes-security/optee/{optee-os-ti.inc => optee-os-ti-overrides.inc} (86%)
>   rename meta-ti-bsp/recipes-security/optee/{optee-os-tadevkit-ti.inc => optee-os-ti-version.inc} (87%)
>   rename meta-ti-bsp/recipes-security/optee/{optee-test-ti.inc => optee-test-ti-version.inc} (100%)
> 
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> similarity index 100%
> rename from meta-ti-bsp/recipes-security/optee/optee-client-ti.inc
> rename to meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
> index 08c5256b..f193e78b 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
> +++ b/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
> @@ -1,4 +1,4 @@
> -OPTEE_TI = ""
> -OPTEE_TI:ti-soc = "${BPN}-ti.inc"
> +OPTEE_TI_VERSION = ""
> +OPTEE_TI_VERSION:ti-soc = "${BPN}-ti-version.inc"
>   
> -require ${OPTEE_TI}
> +require ${OPTEE_TI_VERSION}
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
> similarity index 100%
> rename from meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc
> rename to meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend
> index 08c5256b..f193e78b 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend
> +++ b/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend
> @@ -1,4 +1,4 @@
> -OPTEE_TI = ""
> -OPTEE_TI:ti-soc = "${BPN}-ti.inc"
> +OPTEE_TI_VERSION = ""
> +OPTEE_TI_VERSION:ti-soc = "${BPN}-ti-version.inc"
>   
> -require ${OPTEE_TI}
> +require ${OPTEE_TI_VERSION}
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti-overrides.inc b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti-overrides.inc
> new file mode 100644
> index 00000000..df46e243
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti-overrides.inc
> @@ -0,0 +1 @@
> +EXTRA_OEMAKE:remove = "CFG_MAP_EXT_DT_SECURE=y"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
> index 08c5256b..980f7a4b 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
> @@ -1,4 +1,9 @@
> -OPTEE_TI = ""
> -OPTEE_TI:ti-soc = "${BPN}-ti.inc"
> +OPTEE_TI_VERSION = ""
> +OPTEE_TI_VERSION:ti-soc = "optee-os-ti-version.inc"
>   
> -require ${OPTEE_TI}
> +require ${OPTEE_TI_VERSION}
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
>   # Use TI SECDEV for signing
>   inherit ti-secdev
>   
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
> similarity index 87%
> rename from meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc
> rename to meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
> index 55453366..06472e34 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
> @@ -5,5 +5,3 @@ SRCREV = "2a5b1d1232f582056184367fb58a425ac7478ec6"
>   FILESEXTRAPATHS:prepend := "${THISDIR}/optee-os-4.0.0:"
>   SRC_URI:remove = "file://0002-core-Define-section-attributes-for-clang.patch"
>   SRC_URI:append = " file://0002ti-core-Define-section-attributes-for-clang.patch"
> -
> -EXTRA_OEMAKE:remove = "CFG_MAP_EXT_DT_SECURE=y"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
> index 08c5256b..0cee127f 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
> @@ -1,4 +1,9 @@
> -OPTEE_TI = ""
> -OPTEE_TI:ti-soc = "${BPN}-ti.inc"
> +OPTEE_TI_VERSION = ""
> +OPTEE_TI_VERSION:ti-soc = "${BPN}-ti-version.inc"
>   
> -require ${OPTEE_TI}
> +require ${OPTEE_TI_VERSION}
> +
> +OPTEE_TI_OVERRIDES = ""
> +OPTEE_TI_OVERRIDES:ti-soc = "${BPN}-ti-overrides.inc"
> +
> +require ${OPTEE_TI_OVERRIDES}
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
> similarity index 100%
> rename from meta-ti-bsp/recipes-security/optee/optee-test-ti.inc
> rename to meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend
> index 08c5256b..f193e78b 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend
> +++ b/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend
> @@ -1,4 +1,4 @@
> -OPTEE_TI = ""
> -OPTEE_TI:ti-soc = "${BPN}-ti.inc"
> +OPTEE_TI_VERSION = ""
> +OPTEE_TI_VERSION:ti-soc = "${BPN}-ti-version.inc"
>   
> -require ${OPTEE_TI}
> +require ${OPTEE_TI_VERSION}
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17240): https://lists.yoctoproject.org/g/meta-ti/message/17240
> Mute This Topic: https://lists.yoctoproject.org/mt/102374573/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/10828724/6551054/1815494134/xyzzy [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

