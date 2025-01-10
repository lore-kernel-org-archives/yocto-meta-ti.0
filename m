Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2FB5E77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 19:57:31 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.442.1736539042098590340
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 10 Jan 2025 11:57:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=o6yczoaM;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50AJvK543355222
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 10 Jan 2025 13:57:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736539040;
	bh=M3lB0YohoQ/wh4Qs0p7+5WW7T6FnZteJMT4xcnPKNfU=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=o6yczoaM3k7qAvKP29MhW6/EpmPeIreDXuEd5tsToXNZnQ4X6PFwJC2x4lh2aPqDc
	 JZHPGMsHGdqAuO5Lm3L3/ddzw00cKYsjRln9ugIRCHHwO8AqFZQNd4pAFOknGu3s40
	 kEUdjfO5n9CZF7rz+kYnn1wJLMfc3Po/6d2nv2Pw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50AJvKUS042376;
	Fri, 10 Jan 2025 13:57:20 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 10
 Jan 2025 13:57:20 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 10 Jan 2025 13:57:20 -0600
Received: from [10.249.33.244] ([10.249.33.244])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50AJvKAM093062;
	Fri, 10 Jan 2025 13:57:20 -0600
Message-ID: <fd7e456b-f2fe-4ea6-9e56-5228943aca0e@ti.com>
Date: Fri, 10 Jan 2025 13:57:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [meta-arago][master][PATCH v2] libdce: Fix compile
 errors
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <18196CF61C4D3145.16280@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <18196CF61C4D3145.16280@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 10 Jan 2025 19:57:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18181


Wrong mailing list...  ignore


On 1/10/2025 1:55 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> Update SRCREV to pick up patch that fixes some compile errors:
> 
> ../git/memplugin_linux.c: In function 'memplugin_alloc':
> ../git/memplugin_linux.c:69:9: error: implicit declaration of function 'dsp_dce_buf_lock' [-Wimplicit-function-declaration]
>     69 |         dsp_dce_buf_lock(1, &(h->dma_buf_fd));
>        |         ^~~~~~~~~~~~~~~~
> ../git/memplugin_linux.c:71:9: error: implicit declaration of function 'dce_buf_lock' [-Wimplicit-function-declaration]
>     71 |         dce_buf_lock(1, &(h->dma_buf_fd));
>        |         ^~~~~~~~~~~~
> ../git/memplugin_linux.c: In function 'memplugin_free':
> ../git/memplugin_linux.c:91:17: error: implicit declaration of function 'dsp_dce_buf_unlock' [-Wimplicit-function-declaration]
>     91 |                 dsp_dce_buf_unlock(1, &(h->dma_buf_fd));
>        |                 ^~~~~~~~~~~~~~~~~~
> ../git/memplugin_linux.c:93:17: error: implicit declaration of function 'dce_buf_unlock' [-Wimplicit-function-declaration]
>     93 |                 dce_buf_unlock(1, &(h->dma_buf_fd));
>        |                 ^~~~~~~~~~~~~~
> ../git/memplugin_linux.c:95:13: error: implicit declaration of function 'close'; did you mean 'pclose'? [-Wimplicit-function-declaration]
>     95 |             close(h->dma_buf_fd);
>        |             ^~~~~
>        |             pclose
> 
> and
> 
> ../git/libdce_linux.c: In function 'dce_deinit':
> ../git/libdce_linux.c:90:9: error: implicit declaration of function 'close'; did you mean 'pclose'? [-Wimplicit-function-declaration]
>     90 |         close(OmapDrm_FD);
>        |         ^~~~~
>        |         pclose
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
> v2: The patch was added to the repo, so we can just point to the new
>      SRCREV.
> 
>   meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb b/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
> index f46d9c77..a31fe20d 100644
> --- a/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
> +++ b/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
> @@ -8,7 +8,7 @@ DEPENDS = "libdrm ti-ipc"
>   
>   SRC_URI = "git://git.ti.com/git/omapzoom/libdce.git;protocol=https;branch=master"
>   
> -SRCREV = "ec14e1d5cea1ed3c3ea0e2b9cf1fd581acff93e3"
> +SRCREV = "182aea18596eb2b3a82cffc536a6404f5000fb30"
>   
>   S = "${WORKDIR}/git"
>   EXTRA_OECONF += "IPC_HEADERS=${STAGING_INCDIR}/ti/ipc/mm"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18180): https://lists.yoctoproject.org/g/meta-ti/message/18180
> Mute This Topic: https://lists.yoctoproject.org/mt/110541937/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

