Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF98EC433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 12:15:06 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.9188.1651148103034791018
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 28 Apr 2022 05:15:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=DGm351Tv;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23SCEvQI110015;
	Thu, 28 Apr 2022 07:14:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651148097;
	bh=M2e1i6zlOE+TfJxGVaOow2nz2EUB0Q+RVeitnO0GE6g=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=DGm351TvX7D1UpCdQz4YX1c4kv/fSOTB9DANpPJ72H2tH0tDWQB1OUHQRYoA2Mcvw
	 3Qch4Bh92+56715HZfJMVbg7lRxV057/eFk/ZdhgEp8AIXOm8hfxKp+g0Ks9ZD1m91
	 VpH6DwzKbgQkdeik4fOr8UX2zQSS2LEwcaClqKBE=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23SCEvP0075207
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 28 Apr 2022 07:14:57 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 28
 Apr 2022 07:14:56 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 28 Apr 2022 07:14:56 -0500
Received: from [10.250.37.187] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23SCEulf116153;
	Thu, 28 Apr 2022 07:14:56 -0500
Message-ID: <dc469d95-7e70-b736-f899-65ed854f16dd@ti.com>
Date: Thu, 28 Apr 2022 07:14:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [dunfell PATCH V2] u-boot-ti: Use SRCPV instead of SRCREV for
 U_BOOT_LOCAL_VERSION
Content-Language: en-US
To: Nishanth Menon <nm@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: <devarsht@ti.com>, <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>,
        <nikhil.nd@ti.com>, <nsekhar@ti.com>, <vigneshr@ti.com>,
 <a-m1@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>
References: <20220428031442.21013-1-nm@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220428031442.21013-1-nm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 28 Apr 2022 12:15:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14632


Patch applied to dunfell-wip.


On 4/27/2022 22:14, Nishanth Menon wrote:
> SRCREV works with fixed commits, but when we use AUTOREV for a
> downstream distro bbappend, we will end up getting a bad local
> revision.
> 
> Lets use SRCPV instead, which bitbake already deals with sensibly.
> 
> [1] https://www.yoctoproject.org/docs/2.5.1/dev-manual/dev-manual.html#automatically-incrementing-a-binary-package-revision-number
> 
> Fixes: 39fa0c1d3d02 ("u-boot-ti: Use SRCREV to get short commit ID")
> Suggested-by: Denys Dmytriyenko <denys@konsulko.com>
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
> 
> I think we had a case of dunfell updated with a partial fix.
> 
> as discussed in review of the original patch:
> https://lore.kernel.org/all/20220427144355.GK9834@denix.org/
> a) we should have used SRCPV that deals with AUTOREV better
> b) we should have fixed the kernel rev as well.. which is broke as well
> (follow on patch)
> 
> Changes since V1:
> * Update to fix up the $subject to indicate the branch. (sorry for the
>    noise).
> 
> V1: https://lore.kernel.org/all/20220428030828.18705-1-nm@ti.com/
> 
>   recipes-bsp/u-boot/u-boot-ti.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
> index cc775e2e271c..903c61f09004 100644
> --- a/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -1,6 +1,6 @@
>   # UBOOT_LOCALVERSION can be set to add a tag to the end of the
>   # U-boot version string.  such as the commit id
> -UBOOT_LOCALVERSION = "-g${@d.getVar("SRCREV", False).__str__()[:10]}"
> +UBOOT_LOCALVERSION = "-g${@d.getVar('SRCPV', True).split('+')[1]}"
>   
>   UBOOT_SUFFIX ?= "img"
>   SPL_BINARY ?= "MLO"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

