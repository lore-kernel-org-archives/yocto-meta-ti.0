Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C10C25B08
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 22:53:55 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.654.1659653625814296261
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Aug 2022 15:53:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=swcIJPWH;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 274Mrhwv121165;
	Thu, 4 Aug 2022 17:53:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1659653623;
	bh=T+oh6Decdsag/aCmDaGaJVsmHA0bq4uuWGcsZgT57Oc=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=swcIJPWHno/KpVDo/fQU8V+gvLTdYJH/TyUDQ4hzhmnYiuOSDd20tIWPDwLsozrVt
	 2blYl7bunOo0zKav+DIYlNyGXJ2Lcq91WSBH/XiVu1yg7gtBDVrAlbB35z4aIS9MuP
	 dNgkK73KdqK2gx+6QijvImAu2Rckma1AjtdFva8g=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 274MrhqW003863
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 4 Aug 2022 17:53:43 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 4
 Aug 2022 17:53:42 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 4 Aug 2022 17:53:43 -0500
Received: from [10.247.29.70] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 274MrhcA032073;
	Thu, 4 Aug 2022 17:53:43 -0500
Message-ID: <70250faf-d8f3-35b3-18b4-8b55c062824b@ti.com>
Date: Thu, 4 Aug 2022 17:53:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [meta-ti][dunfell][PATCH 0/3] Update to 08.04.01.001
Content-Language: en-US
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20220804222959.17202-1-reatmon@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20220804222959.17202-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 04 Aug 2022 22:53:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14925



On 8/4/2022 5:29 PM, Ryan Eatmon wrote:
> Update linux, linux rt and ti-linux-fw to 08.04.01.001 tag
> 
> Ryan Eatmon (3):
>    linux-ti-staging: Bump to 08.04.01.001 release
>    linux-ti-staging-rt: Bump to 08.04.01.001 release

also u-boot?
https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tag/?h=08.04.01.001


>    ti-linux-fw: Bump to 08.04.01.001 release
> 
>   recipes-bsp/ti-linux-fw/ti-linux-fw.inc          | 2 +-

missing k3-image-gen from this include file ?
https://git.ti.com/cgit/k3-image-gen/k3-image-gen/tag/?h=08.04.01.001


>   recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
>   recipes-kernel/linux/linux-ti-staging_5.10.bb    | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 

