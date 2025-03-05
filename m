Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 533BFC282DE
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 16:35:15 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.17601.1741192510053336198
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Mar 2025 08:35:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=QLTGwO1J;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 525GZ9tF3912961
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-ti@lists.yoctoproject.org>; Wed, 5 Mar 2025 10:35:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741192509;
	bh=Henyp8KS4OZzFmJia9BZVIxmeIPqcZatlcYL0RLlXWY=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=QLTGwO1Jz72aItlvg0m0mpG5gU/6SrShf3TzxPVmOXAiQIvvn1DHqmTxBZDTnmBVX
	 HkzZyV05/N83LL24XRoZhxvgzmRpX1gCW0UJZpdzv+IeTPrIjFMDxWwEe2lELhD6v+
	 VFurb9GZ2jYmveydccA+L+N7D1M1vwWqYEm44vGI=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 525GZ9T0029645
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 5 Mar 2025 10:35:09 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Mar 2025 10:35:09 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Mar 2025 10:35:09 -0600
Received: from [10.249.33.231] ([10.249.33.231])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 525GZ9Ed081315;
	Wed, 5 Mar 2025 10:35:09 -0600
Message-ID: <bad14a3a-a21c-4252-be84-4872365478f7@ti.com>
Date: Wed, 5 Mar 2025 10:35:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap/master][PATCH v2 2/3] recipes-graphics : port
 gc320 libs to work on kernel 6.12
To: <a-christidis@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20250305161535.351340-1-a-christidis@ti.com>
 <20250305161535.351340-3-a-christidis@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250305161535.351340-3-a-christidis@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Mar 2025 16:35:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18349



On 3/5/2025 10:15 AM, Antonios Christidis via lists.yoctoproject.org wrote:
> From: Antonios Christidis <a-christidis@ti.com>
> 
> The user mode libraries needed recompiling with the scarthgap revision of gcc to
> remove all the warning about 32bit API usage during the linking stage, New SRCREV
> and branch includes this changes. Versions of the libraries remain the same.
> 
> Signed-Off-By: Antonios Christidis <a-christidis@ti.com>
> ---
> 
> v2: ti-gc320-libs
> - No longer include within the ${PN} package /usr/include files and symb link
>    to library file. This is done by not changing the FILES/PACKAGES variables, thus creating a -dev
>    package including the above.
> 
>   .../recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> index 807f421c..97c82a6e 100644
> --- a/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> +++ b/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> @@ -11,10 +11,10 @@ COMPATIBLE_MACHINE = "omap-a15"
>   
>   CLEANBROKEN = "1"
>   
> -BRANCH = "ti-${PV}"
> +BRANCH = "ti-${PV}-scarthgap"
>   
>   SRC_URI = "git://git.ti.com/git/graphics/ti-gc320-libs.git;protocol=https;branch=${BRANCH}"
> -SRCREV = "c0afab259de59909cfe74c01f3f7fbaa147f94b5"
> +SRCREV = "85c175e8425c33dda6e272aeb45afe0f69a79096"
>   
>   RRECOMMENDS:${PN} = "ti-gc320-driver"
>   
> @@ -41,6 +41,10 @@ EXTRA_OEMAKE += "DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT} LIBDIR=${libdir}"
>   do_install() {
>       oe_runmake install
>       chown -R root:root ${D}
> +    mkdir lib

Do we need this mkdir?  You aren't copying anything into it after 
creating it...


>   }
>   
> -INSANE_SKIP:${PN} += "ldflags"
> +# FILES:${PN} = "${libdir}"
> +# FILES:${PN}-dev = "/usr/include"

Why are these line commented out?  Should they be removed?


> +
> +INSANE_SKIP:${PN} += "ldflags already-stripped dev-so"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18346): https://lists.yoctoproject.org/g/meta-ti/message/18346
> Mute This Topic: https://lists.yoctoproject.org/mt/111530806/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

