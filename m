Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5882C27C76
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 23:59:19 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.62413.1674691151637446907
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Jan 2023 15:59:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ow/5TH5p;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30PNx6gG069155;
	Wed, 25 Jan 2023 17:59:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674691146;
	bh=FSRz2H6rM/iVDGleN1rjZCE2ApLiIEDxOuxB8oS3rCU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ow/5TH5pslwuZyPK8PgeoIihGmU04rK65Aa5Resv+9XsG7yy481LVhF9Ulhx/PY+R
	 QetdYBnXD4gA3E6LL7xwVPB60qSSdan3j07m47aprYH+GKSigJt2rc+s/dwDE1AxU3
	 N8Mk9jyQFXdGgKVD84PdoUEGkis3l9dzm0haNEHk=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30PNx6eN047940
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 25 Jan 2023 17:59:06 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 25
 Jan 2023 17:59:06 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 25 Jan 2023 17:59:06 -0600
Received: from [10.247.26.97] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30PNx6lC098383;
	Wed, 25 Jan 2023 17:59:06 -0600
Message-ID: <cc06f7dd-29e5-70c3-74d2-b69c76adc687@ti.com>
Date: Wed, 25 Jan 2023 17:59:05 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [meta-ti] [dunfell PATCH] k3conf update SRCREV to add am62ax
 support
Content-Language: en-US
To: <bb@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Denys Dmytriyenko
	<denis@denix.org>
CC: Meta-TI <meta-ti@lists.yoctoproject.org>
References: <20230125235405.7558-1-bb@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20230125235405.7558-1-bb@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Jan 2023 23:59:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15660



On 1/25/2023 5:54 PM, Bryan Brattlof via lists.yoctoproject.org wrote:
> update the SHA of k3conf to pickup am62ax support
> 
> Signed-off-by: Bryan Brattlof <bb@ti.com>

Reviewed-by: Praneeth Bajjuri <praneeth@ti.com>


> ---
>   recipes-devtools/k3conf/k3conf_git.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-devtools/k3conf/k3conf_git.bb b/recipes-devtools/k3conf/k3conf_git.bb
> index 10e2631e05c7f..c6d3773eed26f 100644
> --- a/recipes-devtools/k3conf/k3conf_git.bb
> +++ b/recipes-devtools/k3conf/k3conf_git.bb
> @@ -8,7 +8,7 @@ PV = "0.2+git${SRCPV}"
>   COMPATIBLE_MACHINE = "k3"
>   
>   BRANCH ?= "master"
> -SRCREV = "48cb8e8d7dc962229a9f318cd512b4ddeec5cdc5"
> +SRCREV = "982f5c2f02f732b5829861218812904cd776773d"
>   
>   SRC_URI = "git://git.ti.com/git/k3conf/k3conf.git;protocol=https;branch=${BRANCH}"
>   
> 
> base-commit: 6918dfd0f477873b0630a34606bf5dddd6d87173
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15659): https://lists.yoctoproject.org/g/meta-ti/message/15659
> Mute This Topic: https://lists.yoctoproject.org/mt/96533703/2167429
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [praneeth@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

