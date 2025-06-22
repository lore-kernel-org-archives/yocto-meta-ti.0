Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED40FC7115A
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 21:01:33 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.5211.1750626070337146403
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 22 Jun 2025 14:01:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=POG0H8ve;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55ML18HB1076825;
	Sun, 22 Jun 2025 16:01:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750626068;
	bh=2lXWoktraDgTAfAMwu2l9RmtN3gEkP4yxwjK6qPemLY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=POG0H8veesBOi0nbjtoR9dPi7k7I8ChgRmHjF94hwIL4vLDUZ/OyVtuyrO9eYIh4m
	 cBhbRDfawUDDlTCpRw5QdEVALki8DLdOX2wktJZoO5fPrm60UXhID2z61KS7QDJVSH
	 ZtT5RtJ8VtDxuaNSILXmvjOlzzLK/hI/CCiVfE3c=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55ML18TP2584467
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sun, 22 Jun 2025 16:01:08 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sun, 22
 Jun 2025 16:01:08 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Sun, 22 Jun 2025 16:01:08 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55ML18Tr2819772;
	Sun, 22 Jun 2025 16:01:08 -0500
Message-ID: <7f7ed1cd-855b-40dc-8771-e8f2cfc23da1@ti.com>
Date: Sun, 22 Jun 2025 16:01:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master][PATCH] meta-ti: layer.conf: add compatibility
 with the new whinlatter release
To: <hiagofranco@gmail.com>, <meta-ti@lists.yoctoproject.org>
CC: Hiago De Franco <hiago.franco@toradex.com>
References: <20250622170731.11233-1-hiagofranco@gmail.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250622170731.11233-1-hiagofranco@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 22 Jun 2025 21:01:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18665


Thank you for the patch.  There is a third layer in meta-ti that is 
missing from this patch.  I'll send a more comprehensive version.


On 6/22/2025 12:07 PM, Hiago De Franco via lists.yoctoproject.org wrote:
> From: Hiago De Franco <hiago.franco@toradex.com>
> 
> Update all layers with the new Yocto release, fixing the current build
> error:
> 
> ERROR: Layer meta-ti-bsp is not compatible with the core layer which
> only supports these series: whinlatter (layer is compatible with styhead
> walnascar)
> 
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> ---
>   meta-beagle/conf/layer.conf    | 2 +-
>   meta-ti-bsp/conf/layer.conf    | 2 +-
>   meta-ti-extras/conf/layer.conf | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-beagle/conf/layer.conf b/meta-beagle/conf/layer.conf
> index b5d3eaaa770c..d036bb08b36a 100644
> --- a/meta-beagle/conf/layer.conf
> +++ b/meta-beagle/conf/layer.conf
> @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-beagle"
>   BBFILE_PATTERN_meta-beagle := "^${LAYERDIR}/"
>   BBFILE_PRIORITY_meta-beagle = "6"
>   
> -LAYERSERIES_COMPAT_meta-beagle = "styhead walnascar"
> +LAYERSERIES_COMPAT_meta-beagle = "walnascar whinlatter"
>   
>   LAYERDEPENDS_meta-beagle = " \
>       meta-ti-bsp \
> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
> index 6d2b0a9a14b0..481daf2cc997 100644
> --- a/meta-ti-bsp/conf/layer.conf
> +++ b/meta-ti-bsp/conf/layer.conf
> @@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-ti-bsp"
>   BBFILE_PATTERN_meta-ti-bsp := "^${LAYERDIR}/"
>   BBFILE_PRIORITY_meta-ti-bsp = "6"
>   
> -LAYERSERIES_COMPAT_meta-ti-bsp = "styhead walnascar"
> +LAYERSERIES_COMPAT_meta-ti-bsp = "walnascar whinlatter"
>   
>   LICENSE_PATH += "${LAYERDIR}/licenses"
>   
> diff --git a/meta-ti-extras/conf/layer.conf b/meta-ti-extras/conf/layer.conf
> index bd13967322fc..d340c414fc60 100644
> --- a/meta-ti-extras/conf/layer.conf
> +++ b/meta-ti-extras/conf/layer.conf
> @@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-ti-extras"
>   BBFILE_PATTERN_meta-ti-extras := "^${LAYERDIR}/"
>   BBFILE_PRIORITY_meta-ti-extras = "6"
>   
> -LAYERSERIES_COMPAT_meta-ti-extras = "styhead walnascar"
> +LAYERSERIES_COMPAT_meta-ti-extras = "walnascar whinlatter"
>   
>   LICENSE_PATH += "${LAYERDIR}/licenses"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18664): https://lists.yoctoproject.org/g/meta-ti/message/18664
> Mute This Topic: https://lists.yoctoproject.org/mt/113774522/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

