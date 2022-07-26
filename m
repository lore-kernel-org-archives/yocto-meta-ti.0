Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E85C00140
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 16:05:24 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.8522.1658851514529439980
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 26 Jul 2022 09:05:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=juW+nDQz;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26QG5Bks127320;
	Tue, 26 Jul 2022 11:05:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1658851511;
	bh=/8BTEuVTBJSBMlCWw9bl4AMxmq2TtoromVU0F9hz7E8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=juW+nDQzF6R4PIVHtFBTOqtEvIeUo1NXM6GM/J9t7CLPttF3YSg/GhAbSVqp5i+GT
	 lrf3Ny6TziA1cddsTr+AJ/0nSoMncOv46M08HUnTT9tiBwuUm/9i2pN79VtzqeWkMP
	 zcOXU9RgY8iqiYgg5KCSDyyuXghK8OB4jNf6t/dA=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26QG5Bt9008659
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 26 Jul 2022 11:05:11 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Jul 2022 11:05:10 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 26 Jul 2022 11:05:11 -0500
Received: from [10.247.29.70] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26QG59Pc061395;
	Tue, 26 Jul 2022 11:05:09 -0500
Message-ID: <51f559b0-d3ca-5fc7-2b4f-14beaf898c4f@ti.com>
Date: Tue, 26 Jul 2022 11:05:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [dunfel PATCH v2] k3conf: update SRCREV to add j721S2 fixes
Content-Language: en-US
To: Bryan Brattlof <bb@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Denys
 Dmytriyenko <denis@denix.org>
CC: Meta-TI <meta-ti@lists.yoctoproject.org>
References: <20220719195940.15129-1-bb@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20220719195940.15129-1-bb@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 26 Jul 2022 16:05:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14910



On 7/19/2022 2:59 PM, Bryan Brattlof wrote:
> update the SHA for k3conf to pickup the j721s2 fixes
> 
> Signed-off-by: Bryan Brattlof <bb@ti.com>
> ---
> Changes from v1:
>   - send a separate patch for each branch to avoid merge conflicts
>   - include the mailing list in the email :(
> 
>   recipes-devtools/k3conf/k3conf_git.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-devtools/k3conf/k3conf_git.bb b/recipes-devtools/k3conf/k3conf_git.bb
> index af48337f5cb4d..567e8d55b51ba 100644
> --- a/recipes-devtools/k3conf/k3conf_git.bb
> +++ b/recipes-devtools/k3conf/k3conf_git.bb
> @@ -8,7 +8,7 @@ PV = "0.2+git${SRCPV}"
>   COMPATIBLE_MACHINE = "k3"
>   
>   BRANCH ?= "master"
> -SRCREV = "4ca1c3d330bc1de779909e733483b09a1fc4fe44"
> +SRCREV = "48cb8e8d7dc962229a9f318cd512b4ddeec5cdc5"

same here, doesnt look to be merged yet:
https://git.yoctoproject.org/meta-ti/tree/recipes-devtools/k3conf/k3conf_git.bb?h=dunfell#n11 
.
>   
>   SRC_URI = "git://git.ti.com/k3conf/k3conf.git;protocol=git;branch=${BRANCH}"
>   

