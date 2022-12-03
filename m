Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0175EC4321E
	for <webhook@archiver.kernel.org>; Sat,  3 Dec 2022 02:04:55 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.95133.1670033095204928488
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 02 Dec 2022 18:04:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=HsayHy6q;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2B324suO103295
	for <meta-ti@lists.yoctoproject.org>; Fri, 2 Dec 2022 20:04:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1670033094;
	bh=fz1oQW6Rx9EFGZlCF/WvRzWr5X9R9tcjFdaQ31/zw0s=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=HsayHy6qNsAO8oyhS2OU2pdeFrEry41aqPxu9sEALkvtcSDRTJ1fVTAsFb8i5yBnN
	 VhcA4sYUzds5hLnF3zJwUXd0IpdUOcH0KYd/L2M5LmRXbKj2U4RvxTRLVCxwAMGfyy
	 tzAHkX4Av2B2MLX2rI4VpqbOZkKsIL2iN7E+pSBM=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2B324sR7052283
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 2 Dec 2022 20:04:54 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 2
 Dec 2022 20:04:53 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 2 Dec 2022 20:04:53 -0600
Received: from [10.249.38.163] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2B324rUJ091777;
	Fri, 2 Dec 2022 20:04:53 -0600
Message-ID: <b1812e45-6c73-4a2a-16a1-704393f35e3a@ti.com>
Date: Fri, 2 Dec 2022 20:04:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [meta-ti][dunfell][PATCH] optee: update optee-client, optee-test,
 optee-examples to 3.19 tag
Content-Language: en-US
To: Manorit Chawdhry <m-chawdhry@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
        Praneeth
 Bajjuri <praneeth@ti.com>
References: <20221202100452.1868797-1-m-chawdhry@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20221202100452.1868797-1-m-chawdhry@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 03 Dec 2022 02:04:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15397



On 12/2/2022 4:04, Manorit Chawdhry wrote:
> optee-os was updated to 3.19 tag but the others were still outdated.
> 
> Updates other optee components to 3.19 tag
> 
> Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
> ---
>   recipes-security/optee/optee-client_%.bbappend   | 4 ++--
>   recipes-security/optee/optee-examples_%.bbappend | 4 ++--
>   recipes-security/optee/optee-test_%.bbappend     | 4 ++--
>   3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/recipes-security/optee/optee-client_%.bbappend b/recipes-security/optee/optee-client_%.bbappend
> index 5675570a..6737ba92 100644
> --- a/recipes-security/optee/optee-client_%.bbappend
> +++ b/recipes-security/optee/optee-client_%.bbappend
> @@ -1,2 +1,2 @@
> -PV_ti-soc = "3.17.0+git${SRCPV}"
> -SRCREV_ti-soc = "a5c30b1277466a9bf85b62f45a6b00e79774e29c"
> +PV_ti-soc = "3.19.0+git${SRCPV}"
> +SRCREV_ti-soc = "140bf463046071d3ca5ebbde3fb21ee0854e1951"

optee-client will not build against this SRCREV.  They added a call to 
pkg-config which is not readily available to the recipe without a change 
to your patch.

You need to add:

DEPENDS += "pkgconfig"


Please do so and resubmit the patch.


> diff --git a/recipes-security/optee/optee-examples_%.bbappend b/recipes-security/optee/optee-examples_%.bbappend
> index 9941b345..dda7cbbf 100644
> --- a/recipes-security/optee/optee-examples_%.bbappend
> +++ b/recipes-security/optee/optee-examples_%.bbappend
> @@ -1,5 +1,5 @@
> -PV_ti-soc = "3.17.0+git${SRCPV}"
> -SRCREV_ti-soc = "65fc74309e12189ad5b6ce3ffec37c8011088a5a"
> +PV_ti-soc = "3.19.0+git${SRCPV}"
> +SRCREV_ti-soc = "f301ee9df2129c0db683e726c91dc2cefe4cdb65"
>   SRC_URI_ti-soc = "git://github.com/linaro-swg/optee_examples.git;protocol=https"
>   
>   DEPENDS_append_ti-soc = " python3-cryptography-native"
> diff --git a/recipes-security/optee/optee-test_%.bbappend b/recipes-security/optee/optee-test_%.bbappend
> index d81ae521..79b4b4d6 100644
> --- a/recipes-security/optee/optee-test_%.bbappend
> +++ b/recipes-security/optee/optee-test_%.bbappend
> @@ -1,5 +1,5 @@
> -PV_ti-soc = "3.17.0+git${SRCPV}"
> -SRCREV_ti-soc = "8a698baf9e8e010e4d8d52e6aded42dfc31e5b25"
> +PV_ti-soc = "3.19.0+git${SRCPV}"
> +SRCREV_ti-soc = "ab9863cc187724e54c032b738c28bd6e9460a4db"
>   SRC_URI_ti-soc = "git://github.com/OP-TEE/optee_test.git;protocol=https"
>   
>   DEPENDS_append_ti-soc = " python3-cryptography-native"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

