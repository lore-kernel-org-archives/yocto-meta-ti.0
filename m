Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2837FC433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 18:53:16 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.768.1655232793339329159
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 14 Jun 2022 11:53:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=IZP1GoNT;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25EIr9LZ112078;
	Tue, 14 Jun 2022 13:53:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1655232789;
	bh=UUtwYAa+gcKxEmmF8+VTf7DEhHDVCzElNoB/d3gsMgU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=IZP1GoNTmYpSOlitQsoV7npEvJHuazReFlxAqhnUuFwx17ZIlJvpeg2AW6C1QPQbL
	 RrgxAVoJT1EJ/kqKUxlqFS1XA97wfrwGvuxvGZ752QCgTLbqBbeBD4hONyh6fIIDNd
	 Kp2x6VwJ/Llqx9RmsNFZnhTiXULNL9p5egF3ydYU=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25EIr9CJ015902
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 14 Jun 2022 13:53:09 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 14
 Jun 2022 13:53:08 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 14 Jun 2022 13:53:08 -0500
Received: from [10.250.234.162] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25EIr51F042069;
	Tue, 14 Jun 2022 13:53:06 -0500
Message-ID: <2493176f-8cd3-cd28-3665-77a60af94db9@ti.com>
Date: Wed, 15 Jun 2022 00:23:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [dunfell PATCH] k3conf: Update SRCREV to add J721S2 support
Content-Language: en-US
To: Bryan Brattlof <bb@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan
 Eatmon <reatmon@ti.com>
CC: Meta-TI <meta-ti@lists.yoctoproject.org>, Nishanth Menon <nm@ti.com>
References: <20220614182316.19935-1-bb@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20220614182316.19935-1-bb@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 14 Jun 2022 18:53:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14815



On 6/14/2022 11:53 PM, Bryan Brattlof wrote:
> update the SHA of k3conf to pickup j721s2 support

how about master branch?


> 
> Signed-off-by: Bryan Brattlof <bb@ti.com>

Reviewed-by: Praneeth Bajjuri <praneeth@ti.com>


> ---
>   recipes-devtools/k3conf/k3conf_git.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-devtools/k3conf/k3conf_git.bb b/recipes-devtools/k3conf/k3conf_git.bb
> index 3f542da4aa96e..af48337f5cb4d 100644
> --- a/recipes-devtools/k3conf/k3conf_git.bb
> +++ b/recipes-devtools/k3conf/k3conf_git.bb
> @@ -8,7 +8,7 @@ PV = "0.2+git${SRCPV}"
>   COMPATIBLE_MACHINE = "k3"
>   
>   BRANCH ?= "master"
> -SRCREV = "966a5695b73bc53039ca60d196b77de0640088d4"
> +SRCREV = "4ca1c3d330bc1de779909e733483b09a1fc4fe44"
>   
>   SRC_URI = "git://git.ti.com/k3conf/k3conf.git;protocol=git;branch=${BRANCH}"
>   

