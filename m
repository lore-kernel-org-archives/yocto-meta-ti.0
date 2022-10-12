Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D9FBC433FE
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 14:56:47 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.190.1665586603478493289
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Oct 2022 07:56:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=v7sI6Cje;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29CEucZT060781;
	Wed, 12 Oct 2022 09:56:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665586598;
	bh=BDQe97WeAVksurawyDGnBwv2BQyqKi9ZeR65eSr/F9w=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=v7sI6CjeI7wS8uBioYj0sGKgJw8xS10ypHu6cPeXN2hUInt0skJIUylhLMRpF9Mdf
	 dynhoBeK1vAzvS55ui++eFe5t53bpVtQeOXwHrz8J2be/wxQ4CWBmoO6q3Q+Q2fsPu
	 yyXvrTqDOC347zkaJa0AJ2mr3W4tXE31Dto2szR0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29CEucbR023967
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Oct 2022 09:56:38 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 12
 Oct 2022 09:56:38 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 12 Oct 2022 09:56:38 -0500
Received: from [128.247.81.69] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29CEuc79004706;
	Wed, 12 Oct 2022 09:56:38 -0500
Message-ID: <c8c49492-b9a3-726a-2b34-26cccfe389dd@ti.com>
Date: Wed, 12 Oct 2022 09:56:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [meta-ti] [PATCH v2 1/2] layers: Bump layer compatibility to
 langdale
To: Khem Raj <raj.khem@gmail.com>, <meta-ti@lists.yoctoproject.org>
References: <20221005153114.265420-1-raj.khem@gmail.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20221005153114.265420-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Oct 2022 14:56:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15156



On 10/5/2022 10:31 AM, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Replace kirkstone instead of adding just langdale
> 
>   meta-ti-bsp/conf/layer.conf    | 2 +-
>   meta-ti-extras/conf/layer.conf | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
> index e3542f50..76c1af2f 100644
> --- a/meta-ti-bsp/conf/layer.conf
> +++ b/meta-ti-bsp/conf/layer.conf
> @@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-ti-bsp"
>   BBFILE_PATTERN_meta-ti-bsp := "^${LAYERDIR}/"
>   BBFILE_PRIORITY_meta-ti-bsp = "6"
>   
> -LAYERSERIES_COMPAT_meta-ti-bsp = "kirkstone"
> +LAYERSERIES_COMPAT_meta-ti-bsp = "langdale"

Since we are trying to keep master and kirkstone aligned as long we can, 
we cannot accept the patch on master that removes kirkstone.  Your 
previous patch was better in that regard.


>   LICENSE_PATH += "${LAYERDIR}/licenses"
>   
> diff --git a/meta-ti-extras/conf/layer.conf b/meta-ti-extras/conf/layer.conf
> index 1fb77e2a..96d5e315 100644
> --- a/meta-ti-extras/conf/layer.conf
> +++ b/meta-ti-extras/conf/layer.conf
> @@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-ti-extras"
>   BBFILE_PATTERN_meta-ti-extras := "^${LAYERDIR}/"
>   BBFILE_PRIORITY_meta-ti-extras = "6"
>   
> -LAYERSERIES_COMPAT_meta-ti-extras = "kirkstone"
> +LAYERSERIES_COMPAT_meta-ti-extras = "langdale"
>   
>   LICENSE_PATH += "${LAYERDIR}/licenses"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15111): https://lists.yoctoproject.org/g/meta-ti/message/15111
> Mute This Topic: https://lists.yoctoproject.org/mt/94137980/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

