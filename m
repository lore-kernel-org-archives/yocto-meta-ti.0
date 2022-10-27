Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D80D3FA373D
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 23:54:22 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.683.1666914854462043071
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 27 Oct 2022 16:54:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Pe/DgXIR;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29RNsDdx103183;
	Thu, 27 Oct 2022 18:54:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1666914853;
	bh=W/0WemUZUSWHZjsq6RJ9DyNDlyGHD11CrJLWi7MKkOc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Pe/DgXIRuDT3xpS0s+TpUSm3IvvmyU2PXmGwJ8VwSEnLpfZHzeju0QN3K5UXm0RVI
	 tAF1ubFn82U8uE51hYKgZ/3pY6G7lArip6vNQqz3iC+E1J4yIbGSuva/pIbWj52QqV
	 noR/pRItvWWxr+8cA2MSzxfb3uORGhEKx40H6Xew=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29RNsD6a015388
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Oct 2022 18:54:13 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 27
 Oct 2022 18:54:12 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 27 Oct 2022 18:54:12 -0500
Received: from [10.247.29.70] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29RNsCnf045391;
	Thu, 27 Oct 2022 18:54:12 -0500
Message-ID: <37f2be94-ea5e-3a44-1022-c35291f55574@ti.com>
Date: Thu, 27 Oct 2022 18:54:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [dunfell PATCH] optee-os: Upgrade to upstream 3.19.0
Content-Language: en-US
To: <meta-ti@lists.yoctoproject.org>, Judith Mendez <jm@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Jayesh Choudhary <j-choudhary@ti.com>, Andrew Davis <afd@ti.com>
References: <20221027233027.29967-1-praneeth@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20221027233027.29967-1-praneeth@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 27 Oct 2022 23:54:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15210



On 10/27/2022 6:30 PM, Praneeth Bajjuri wrote:
> Update to the latest upstream master which is 3.19.0.

+judith, jai to verify on TI platforms.

> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>   recipes-security/optee/optee-os_%.bbappend | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
> index 38d1ce50..4a4ebfd7 100644
> --- a/recipes-security/optee/optee-os_%.bbappend
> +++ b/recipes-security/optee/optee-os_%.bbappend
> @@ -1,5 +1,5 @@
> -PV_ti-soc = "3.18.0+git${SRCPV}"
> -SRCREV_ti-soc = "6bf4a81a8f5388e6cb6b1d7e8ebe57c5089c0954"
> +PV_ti-soc = "3.19.0+git${SRCPV}"
> +SRCREV_ti-soc = "afacf356f9593a7f83cae9f96026824ec242ff52"
>   SRC_URI_ti-soc = "git://github.com/OP-TEE/optee_os.git;protocol=https"
>   
>   DEPENDS_append_ti-soc = " python3-cryptography-native"

