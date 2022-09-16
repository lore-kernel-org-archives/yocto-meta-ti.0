Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B34FFECAAD8
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 22:09:05 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.66.1663366137512128890
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 16 Sep 2022 15:08:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=FbQ+4KVG;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 28GM8u4u017894;
	Fri, 16 Sep 2022 17:08:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1663366136;
	bh=E1qcSA0CGyizMq8p8SjxDuAqs7swE1PFYVDvbxu+LC0=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=FbQ+4KVGQIHGyJtoG4wY9/90Sap87l0gEkoIuw4/jVaqnjrLIoQHi/nWwLrrQW0V1
	 ON8aVdKccxgrBWkwcNPzOZ1M+/LlaxfL9enIHOYTEM3UZfWzFQOM1RqyuZm4bGZ+pd
	 iu8n1/MJnyI9SIWO7TxVwAgpxW3eaL3GHdfFR7Hc=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 28GM8uGd063646
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 Sep 2022 17:08:56 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Fri, 16
 Sep 2022 17:08:56 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Fri, 16 Sep 2022 17:08:56 -0500
Received: from [10.249.39.108] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 28GM8urM032269;
	Fri, 16 Sep 2022 17:08:56 -0500
Message-ID: <768ca3ff-da90-8ff0-1a01-08c7cc3ac723@ti.com>
Date: Fri, 16 Sep 2022 17:08:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [meta-ti][dunfell][PATCH] linux-ti-staging-rt: RC Auto-Merger:
 08.04.01.004
Content-Language: en-US
To: LCPD Automation Script <lcpdbld@list.ti.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <1663348276-6201-1-git-send-email-lcpdbld@list.ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <1663348276-6201-1-git-send-email-lcpdbld@list.ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 16 Sep 2022 22:09:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15090

Ignore this patch.  There were issues with the script and this patch is 
incomplete.

On 9/16/2022 12:11, LCPD Automation Script wrote:
> Updated the value(s) for:
>    SRCREV
> 
> Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
> ---
>   recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
> index f1070fe..f4f643a 100644
> --- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
> +++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
> @@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
>   
>   BRANCH = "ti-rt-linux-5.10.y"
>   
> -SRCREV = "0330d95502f55f34e92e5bff65ab5a10f124d575"
> +SRCREV = "16f8fef44a48ef2b6e79d25484151fc956aacdc6"
>   PV = "5.10.140+git${SRCPV}"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

