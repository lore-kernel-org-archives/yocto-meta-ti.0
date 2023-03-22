Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83EC7C6FD1C
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 15:27:54 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.46297.1679498873163937214
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Mar 2023 08:27:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=sZ4OJ1lX;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32MFRq3M128236;
	Wed, 22 Mar 2023 10:27:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1679498872;
	bh=ZwzuVKtkPtpHYgMMUWoLJWfDiBTvtIyw9CtMUHURH9A=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=sZ4OJ1lXJsz/g/udjbwPRTkaQekp245eqLzcwghepNiy1UQ0vswVGI3ZUD+sShGSS
	 JB69orwDphyK+3j2AvGY+1B2ymuTZr+EvLgG2eusW2Hy1/RF+Kxx0EHmv12s3rZ9Kn
	 3mP+OdFQiSdU9lGf/M8LXzjLHekaeJehSfTvEAiE=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32MFRqxF022900
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 Mar 2023 10:27:52 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 22
 Mar 2023 10:27:51 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 22 Mar 2023 10:27:52 -0500
Received: from [10.247.30.6] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32MFRpo7120932;
	Wed, 22 Mar 2023 10:27:51 -0500
Message-ID: <49e381b6-a8c0-5888-438b-58f24d1bee2d@ti.com>
Date: Wed, 22 Mar 2023 10:27:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [meta-ti][kirkstone/master][PATCH v4 3/3] u-boot-ti-staging: Add
 2023.01 in prep for LTS migration
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20230322143203.20360-1-reatmon@ti.com>
 <20230322143203.20360-4-reatmon@ti.com>
Content-Language: en-US
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20230322143203.20360-4-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Mar 2023 15:27:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16238



On 3/22/2023 9:32 AM, Ryan Eatmon wrote:
> We are preparing to migrate our u-boot version to 2023.01.  As we are still
> working on the migration, mark the default preference low for this
> version.  We will enable building with this u-boot in a meta-arago brand
> in the near future.  Once the migration is complete, we will remove the
> 2021.01 u-boot and make this the default.
> 

Doing some sanity testing and will submit a patch to switch to 2023.04 . 
Dont pull this patch yet.


> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>   .../recipes-bsp/u-boot/u-boot-ti-staging_2023.01.bb   | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>   create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.01.bb
> 
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.01.bb
> new file mode 100644
> index 00000000..b3f56878
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.01.bb
> @@ -0,0 +1,11 @@
> +require u-boot-ti.inc
> +
> +LIC_FILES_CHKSUM = "file://Licenses/README;md5=2ca5f2c35c8cc335f0a19756634782f1"
> +
> +PR = "r0"
> +
> +BRANCH = "ti-u-boot-2023.01"
> +
> +SRCREV = "62e2ad1ceafbfdf2c44d3dc1b6efc81e768a96b9"
> +
> +DEFAULT_PREFERENCE = "-1"

