Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF954C38142
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 18:13:01 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.109484.1674843177365387900
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 27 Jan 2023 10:12:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=KuJIsAY3;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30RICu7t028184
	for <meta-ti@lists.yoctoproject.org>; Fri, 27 Jan 2023 12:12:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674843176;
	bh=/jcpU4ck+x1lHdHf2/0yK2YkU0TcwjKAbszzF2PynsM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=KuJIsAY3TpsUnnJ+yb0iT8z5tMoGiW5GOU3UUOlszzhv2YfhkjQMLZcUUFPHd7rHT
	 vqxk2Cz9rp6ze/mBe56b8O7MVYXbkt1vKNLAHfUTq70zsm6Hm9ggZYQME4RUhUhKqo
	 erv4yOgVEQlZuiqVA+o4IV6Qb8ZFYqy7vV8z+uBo=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30RICuZj029470
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 27 Jan 2023 12:12:56 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 27
 Jan 2023 12:12:55 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 27 Jan 2023 12:12:55 -0600
Received: from [10.250.36.129] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30RICtca060350;
	Fri, 27 Jan 2023 12:12:55 -0600
Message-ID: <b0f1c107-cc8f-9ec1-d6fa-6b8dda3402a3@ti.com>
Date: Fri, 27 Jan 2023 12:12:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] meta-ti-extras: ti-unpack: Drop update_data call
Content-Language: en-US
To: Randolph Sapp <rs@ti.com>, <denys@ti.com>, <afd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20230127180217.1760815-1-rs@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230127180217.1760815-1-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Jan 2023 18:13:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15692


This change was already made on the master branch back in November to 
address this issue.  Are you seeing this on other branches?  I do not 
believe that this patch needs to be applied to dunfell or kirkstone 
unless you are seeing an issue.

On 1/27/2023 12:02, Randolph Sapp wrote:
> Bitbake made it's data store dynamic many releases ago and finally
> removed the update_data command altogether in commit
> 584989ed2b5af4e8799571dece0cf94f995ef14e. This drops our references as
> well.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   meta-ti-extras/recipes-ti/includes/ti-unpack.inc | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/meta-ti-extras/recipes-ti/includes/ti-unpack.inc b/meta-ti-extras/recipes-ti/includes/ti-unpack.inc
> index 46bfb957..13068843 100644
> --- a/meta-ti-extras/recipes-ti/includes/ti-unpack.inc
> +++ b/meta-ti-extras/recipes-ti/includes/ti-unpack.inc
> @@ -24,7 +24,6 @@ python ti_bin_do_unpack() {
>           bb.fatal("TI installer requires 32bit glibc libraries for proper operation\nrun 'yum install glibc.i686' on Fedora or 'apt-get install libc6:i386' on Ubuntu/Debian")
>   
>       localdata = bb.data.createCopy(d)
> -    bb.data.update_data(localdata)
>   
>       binfile  = localdata.getVar('BINFILE')
>       binfile  = bb.data.expand(binfile, localdata)

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

