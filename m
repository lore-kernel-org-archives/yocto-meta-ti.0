Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F77C00140
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 16:03:24 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.8606.1658851393763437283
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 26 Jul 2022 09:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=PkP+Okvm;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26QG3Ae0013213;
	Tue, 26 Jul 2022 11:03:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1658851390;
	bh=tx1YBspODPaQ92jaawyryIrcSGTrYeuVphOMowEsbyA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=PkP+Okvm5iKDjStTql9NjUFg+tYdl7pPJsZHRs2g4nhDqazu1BxurU42gE9Fu9Y42
	 CDyG6CJjPtvxIbSUByqCq0WSk2LHbRgSiGYCF3HPrm3K7wgWjDlqVz1KrITByALw3L
	 LNA0w18CjlTCM9R63In6q8PNH87tpShG3f3WHKts=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26QG3A5O110775
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 26 Jul 2022 11:03:10 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Jul 2022 11:03:03 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 26 Jul 2022 11:03:03 -0500
Received: from [10.247.29.70] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26QG32fw058976;
	Tue, 26 Jul 2022 11:03:02 -0500
Message-ID: <6095fc89-1fc4-6937-61cb-b053537d39c7@ti.com>
Date: Tue, 26 Jul 2022 11:03:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [kirkstone/master PATCH v2] k3conf: update SRCREV to add j721S2
 support
Content-Language: en-US
To: Bryan Brattlof <bb@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Denys
 Dmytriyenko <denis@denix.org>
CC: Meta-TI <meta-ti@lists.yoctoproject.org>
References: <20220719203840.29751-1-bb@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20220719203840.29751-1-bb@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 26 Jul 2022 16:03:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14909



On 7/19/2022 3:38 PM, Bryan Brattlof wrote:
> update the SHA for k3conf to pickup j721s2 support
> 
> Signed-off-by: Bryan Brattlof <bb@ti.com>
> ---
> Changes from v1:
>   - send a separate patch for each branch to avoid merge conflicts

Ryan, i dont see this patch in master/kirkstone.

https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb?h=kirkstone#n11


>   - include the mailing list in the email :(
> 
>   meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
> index 3f542da4aa96e..567e8d55b51ba 100644
> --- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
> +++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
> @@ -8,7 +8,7 @@ PV = "0.2+git${SRCPV}"
>   COMPATIBLE_MACHINE = "k3"
>   
>   BRANCH ?= "master"
> -SRCREV = "966a5695b73bc53039ca60d196b77de0640088d4"
> +SRCREV = "48cb8e8d7dc962229a9f318cd512b4ddeec5cdc5"
>   
>   SRC_URI = "git://git.ti.com/k3conf/k3conf.git;protocol=git;branch=${BRANCH}"
>   

