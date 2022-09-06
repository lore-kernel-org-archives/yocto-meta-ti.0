Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24354ECAAD5
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 18:37:29 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.3045.1662489445964243001
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Sep 2022 11:37:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=XDMftGOR;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 286IbOVs084589
	for <meta-ti@lists.yoctoproject.org>; Tue, 6 Sep 2022 13:37:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1662489444;
	bh=QFWBs9fFfyd3YfRoabg9PSAzKET8wooIW2kXDgdssQM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=XDMftGOR7RvIGjPlOVZxGLr6TVw4MxdRQjVopyGle9DH+j+9td2+dE25d5yx/+P+0
	 Fbzwg6AwbvbhV0IpiIkgEJfyjYs5hJJjq/ZTGq6bhUiNHZUyIdApTDAJWCCCPbnDC4
	 /E4rF4Mq3cLqvSc9LSvDpaCns+u6qpGZbQ5U5qeQ=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 286IbOdD024960
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 6 Sep 2022 13:37:24 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 6 Sep
 2022 13:37:24 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 6 Sep 2022 13:37:24 -0500
Received: from [10.250.32.221] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 286IbOXd022055;
	Tue, 6 Sep 2022 13:37:24 -0500
Message-ID: <6015a645-b1ea-c87c-2b1e-00870118dea1@ti.com>
Date: Tue, 6 Sep 2022 13:37:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [meta-ti] [dunfell][PATCH] ti-sci-fw: Use d.getVar() in DEPENDS
 expression
Content-Language: en-US
To: <rs@ti.com>, <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20220902201247.605908-1-rs@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20220902201247.605908-1-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 Sep 2022 18:37:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14996

On 9/2/22 3:12 PM, Randolph Sapp via lists.yoctoproject.org wrote:
> Switch the DEPENDS_append expression to use d.getVar() instead of the
> usual variable expansion to prevent the inline Python command from
> becoming mangled.
> 


I had originally done it this way (just due to copy/paste from elsewhere), but
couldn't think of a case that would cause mangling, do you have an example?

Either way LGTM,

Acked-by: Andrew Davis <afd@ti.com>


> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> index 3986af47..2a59e896 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> @@ -9,7 +9,7 @@ DEPENDS_remove_am65xx-hs-evm-k3r5-sr2 = " virtual/bootloader"
>   DEPENDS_remove_j7-evm-k3r5 = " virtual/bootloader"
>   DEPENDS_remove_j7-hs-evm-k3r5 = " virtual/bootloader"
>   DEPENDS_remove_j7-hs-evm-k3r5-sr1-1 = " virtual/bootloader"
> -DEPENDS_append = " ${@ '' if '${TI_SECURE_DEV_PKG_K3}' else 'ti-k3-secdev-native' }"
> +DEPENDS_append = " ${@ '' if d.getVar('TI_SECURE_DEV_PKG_K3') else 'ti-k3-secdev-native' }"
>   
>   CLEANBROKEN = "1"
>   PR = "${INC_PR}.2"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14991): https://lists.yoctoproject.org/g/meta-ti/message/14991
> Mute This Topic: https://lists.yoctoproject.org/mt/93427763/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

