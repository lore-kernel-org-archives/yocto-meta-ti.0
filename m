Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF420C6FD1D
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 00:21:02 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.54367.1679962853979480512
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 27 Mar 2023 17:20:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xaXZahZS;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32S0Kq3E130829;
	Mon, 27 Mar 2023 19:20:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1679962852;
	bh=e22Fxp7HRfAHIAGAwxqSKIlrVhqGvXqXPOhKRGdLxb0=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=xaXZahZSgKsy70J+2lJ3CqQAa6dKgeaYUcK8mEH+RdNsczIKB3nL9a7mQZO4zlZZs
	 6Y/zSobcTwX7K9TGSW5KU6RpAHBivuYklKSoy4AEst+1+wKTtzTSrVz7NdnBDbYbVi
	 mkz9kiWVpXXD4HSMWj3YhW0t9tr8GFt9vMctWAHk=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32S0KqAR022361
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Mar 2023 19:20:52 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 27
 Mar 2023 19:20:52 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 27 Mar 2023 19:20:52 -0500
Received: from [10.247.30.6] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32S0Kqpc011604;
	Mon, 27 Mar 2023 19:20:52 -0500
Message-ID: <c45e7139-df38-92b0-9aba-347d54c25af6@ti.com>
Date: Mon, 27 Mar 2023 19:20:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [meta-ti][master/kirkstone][PATCH v5 3/3] u-boot-ti-staging: Add
 2023.01 in prep for LTS migration
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20230323225221.12918-1-reatmon@ti.com>
 <20230323225221.12918-4-reatmon@ti.com>
Content-Language: en-US
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20230323225221.12918-4-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 28 Mar 2023 00:21:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16246



On 3/23/2023 5:52 PM, Ryan Eatmon wrote:
> We are preparing to migrate our u-boot version to 2023.01.  As we are still
> working on the migration, mark the default preference low for this
> version.  We will enable building with this u-boot in a meta-arago brand
> in the near future.  Once the migration is complete, we will remove the
> 2021.01 u-boot and make this the default.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>   .../recipes-bsp/u-boot/u-boot-ti-staging_2023.01.bb   | 11 +++++++++++

instead: meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb

Can you switch directly to 2023.04. already created a branch.


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

update BRANCH and SRCREV as follows in 2023.04.bb

BRANCH = "ti-u-boot-2023.04"

SRCREV = "41a88ad529b3943b1e465846eb24fe2c29203e35"


> +
> +DEFAULT_PREFERENCE = "-1"

