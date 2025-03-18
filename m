Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71402C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 21:01:47 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.6462.1742331699397092159
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Mar 2025 14:01:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=R10OwyNa;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52IL1cvc2699268
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-ti@lists.yoctoproject.org>; Tue, 18 Mar 2025 16:01:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742331698;
	bh=gPLn3FrShOzu8T/2v44cqiGl87qHt2/fAYrNS/5b5FU=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=R10OwyNa5nsTsPITlWyQbsDYS/MDcsdRKeviUUGsk4GLFPrF+YDI0qbZZQqyc8hfr
	 1DZEYqQtSti7K4B3PKQdfLaRO66DpfPLde91uGyOLDd1fBiO6CFTH5GmVuEUUpoyPC
	 wVgD44vXaIHff2NDhf4lkIGWSsojx7VuNvcyQr5c=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52IL1cAD097425
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 18 Mar 2025 16:01:38 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Mar 2025 16:01:37 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Mar 2025 16:01:38 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52IL1b9N041047;
	Tue, 18 Mar 2025 16:01:38 -0500
Message-ID: <9859996f-68b6-485c-86cb-9182c5a5e219@ti.com>
Date: Tue, 18 Mar 2025 16:01:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap/master][PATCH v5 3/3] recipes-graphics: port
 gc320 libs to work on kernel 6.12
To: <a-christidis@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20250318023836.3507801-1-a-christidis@ti.com>
 <20250318023836.3507801-4-a-christidis@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250318023836.3507801-4-a-christidis@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 18 Mar 2025 21:01:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18403

On 3/17/25 9:38 PM, Antonios Christidis via lists.yoctoproject.org wrote:
> From: Antonios Christidis <a-christidis@ti.com>
> 
> The user mode libraries needed recompiling with the scarthgap revision of gcc to
> remove all the warnings about 32bit API usage during the linking stage, new
> SRCREV and branch includes this changes. Versions of the libraries remain the
> same.
> 
> Signed-off-by: Antonios Christidis <a-christidis@ti>
> ---
> v5:
> - Move the symb link of libGAL.so within the ${PN} package. While making
>    sure the header files are part of the ${PN}-dev package.
> 
> v3:
> - Removed commented lines and extra lib directory that was being created
>    in do_install()
> 
> v2:
> - No longer include withing the PN package /usr/include file and symb
>    link to library file. This is done by not chaning the FILES/PACKAGES
>    variables, thus creating a -dev package.
> 
>   .../recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb    | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> index 807f421c..6b7226ab 100644
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
> @@ -43,4 +43,6 @@ do_install() {
>       chown -R root:root ${D}
>   }
>   
> -INSANE_SKIP:${PN} += "ldflags"
> +FILES:${PN}:append = " ${libdir}"

FILES:${PN} += "${libdir}" ?

Andrew

> +
> +INSANE_SKIP:${PN} += "ldflags already-stripped dev-so"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18399): https://lists.yoctoproject.org/g/meta-ti/message/18399
> Mute This Topic: https://lists.yoctoproject.org/mt/111763600/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

