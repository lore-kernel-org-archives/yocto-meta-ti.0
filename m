Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE18CC4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 15:31:23 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.15014.1672846276051689043
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Jan 2023 07:31:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=aAsDrEht;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 304FVFti036763
	for <meta-ti@lists.yoctoproject.org>; Wed, 4 Jan 2023 09:31:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1672846275;
	bh=/Dp18I/XgdN++dCYF8HsnWH5GxnMLYNGxn8473Vwz/U=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=aAsDrEhtFEtnAVGhj2MnPi8DxI/pCtD4YgdvPOazGNASObA4vxnFextNJyYf35Cjy
	 52J91a1u8SUaZlvGlIFmkkcWW69UzNOPVrfw+hQPpSCzi9OHYA6b7hA/dV3Si9xSev
	 pel3yCcyL6V/uTdWzsF/IHSYtaXyfDpOeQUWVLzE=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 304FVFQB120885
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 4 Jan 2023 09:31:15 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 4
 Jan 2023 09:31:14 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 4 Jan 2023 09:31:14 -0600
Received: from [10.247.24.212] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 304FVE6D046523;
	Wed, 4 Jan 2023 09:31:14 -0600
Message-ID: <ff5b976e-7c0a-6a9c-fe3a-0eed8a1c30df@ti.com>
Date: Wed, 4 Jan 2023 09:31:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [meta-ti][dunfell][PATCH] ipc: ti-rpmsg-char: Update library to
 0.5.2
To: Devarsh Thakkar <devarsht@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <reatmon@ti.com>
CC: <vigneshr@ti.com>, "Nagalla, Hari" <hnagalla@ti.com>
References: <20230104142609.26769-1-devarsht@ti.com>
Content-Language: en-US
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20230104142609.26769-1-devarsht@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 04 Jan 2023 15:31:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15518



On 1/4/2023 8:26 AM, Devarsh Thakkar wrote:
> Update library to 0.5.2 as it adds support for AM62A
> SoC.
> 

Please make a separate patch for master/kirkstone as well.


> Co-Authored-By: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>

Acked-by: Praneeth Bajjuri <praneeth@ti.com>


> ---
>   recipes-ti/ipc/ti-rpmsg-char.inc | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-ti/ipc/ti-rpmsg-char.inc b/recipes-ti/ipc/ti-rpmsg-char.inc
> index 0b35f412..2c6ab414 100644
> --- a/recipes-ti/ipc/ti-rpmsg-char.inc
> +++ b/recipes-ti/ipc/ti-rpmsg-char.inc
> @@ -7,10 +7,10 @@ PROTOCOL = "https"
>   BRANCH = "master"
>   SRC_URI = "git://git.ti.com/git/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};branch=${BRANCH};"
>   
> -# Initial 0.5.1 release
> -SRCREV = "adb964ee72f99545e2ad55c50cfd14015a7d837e"
> +# Initial 0.5.2 release
> +SRCREV = "1da3e1bd0412c148ab57690940fea5d129220896"
>   
> -PV = "0.5.1+git${SRCPV}"
> +PV = "0.5.2+git${SRCPV}"
>   
>   S = "${WORKDIR}/git"
>   

