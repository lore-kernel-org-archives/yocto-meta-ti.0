Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6601C636D6
	for <webhook@archiver.kernel.org>; Mon,  6 Feb 2023 14:51:54 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.55060.1675695113902061752
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 06 Feb 2023 06:51:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=c87csivp;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 316EpqYs024031
	for <meta-ti@lists.yoctoproject.org>; Mon, 6 Feb 2023 08:51:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675695112;
	bh=e5vK6A6mw8JDl+vrDTxGM981f4CxcfXdq7Tp8RzM6Pk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=c87csivpyqjOrNrGxWHvRhntPn58bhO4zAS+8L0Lodcb7X4aCrUfAWBHVSyEbMlOZ
	 IeYkKyyzv40MTzRPjPeuBcu8pZA9jlsBa3ZNYg4YeqXgtjusaXynH4kiNsiLUXyIBj
	 apQXapLAS/5rTnNKpprH57obFq/2wpy5plRfHjbc=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 316EpqMQ036445
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 6 Feb 2023 08:51:52 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 6
 Feb 2023 08:51:52 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 6 Feb 2023 08:51:52 -0600
Received: from [10.250.32.73] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 316EpqlP007305;
	Mon, 6 Feb 2023 08:51:52 -0600
Message-ID: <a1f5bb03-5f76-76d0-496e-6627fef9bf8e@ti.com>
Date: Mon, 6 Feb 2023 08:51:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [meta-ti][dunfell][PATCH v1] optee: update optee components to
 3.20 tag
Content-Language: en-US
To: Manorit Chawdhry <m-chawdhry@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
        Praneeth
 Bajjuri <praneeth@ti.com>
References: <20230131052053.3759470-1-m-chawdhry@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230131052053.3759470-1-m-chawdhry@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 06 Feb 2023 14:51:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15728


Ok.  It was my fault for accepting this patch without doing all of the 
test builds that I normally do and having to revert it.  This is what 
happens when you rush.

On 1/30/2023 23:20, Manorit Chawdhry wrote:
> OPTEE tests is not being upgraded due to a newer python dependency for
> the build
> 
> Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
> ---
>   recipes-security/optee/optee-client_%.bbappend   | 9 ++++++---
>   recipes-security/optee/optee-examples_%.bbappend | 4 ++--
>   recipes-security/optee/optee-os_%.bbappend       | 4 ++--
>   3 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/recipes-security/optee/optee-client_%.bbappend b/recipes-security/optee/optee-client_%.bbappend
> index a8adef47..0ede4898 100644
> --- a/recipes-security/optee/optee-client_%.bbappend
> +++ b/recipes-security/optee/optee-client_%.bbappend
> @@ -1,4 +1,7 @@
> -PV_ti-soc = "3.19.0+git${SRCPV}"
> -SRCREV_ti-soc = "140bf463046071d3ca5ebbde3fb21ee0854e1951"
> +PV_ti-soc = "3.20.0+git${SRCPV}"
> +SRCREV_ti-soc = "dd2d39b49975d2ada7870fe2b7f5a84d0d3860dc"
>   
> -DEPENDS_append_ti-soc = "pkgconfig util-linux"
> +inherit pkgconfig
> +DEPENDS_append_ti-soc = "util-linux"
> +
> +EXTRA_OEMAKE_append_k3 = " PKG_CONFIG=pkg-config"


The above line is locking down the PKG_CONFIG change to just k3 parts. 
It should be based on ti-soc like all of the other overrides in the file.

Please make that change and submit a v2.



> diff --git a/recipes-security/optee/optee-examples_%.bbappend b/recipes-security/optee/optee-examples_%.bbappend
> index dda7cbbf..ef6da34e 100644
> --- a/recipes-security/optee/optee-examples_%.bbappend
> +++ b/recipes-security/optee/optee-examples_%.bbappend
> @@ -1,5 +1,5 @@
> -PV_ti-soc = "3.19.0+git${SRCPV}"
> -SRCREV_ti-soc = "f301ee9df2129c0db683e726c91dc2cefe4cdb65"
> +PV_ti-soc = "3.20.0+git${SRCPV}"
> +SRCREV_ti-soc = "a98d01e1b9168eaed96bcd0bac0df67c44a81081"
>   SRC_URI_ti-soc = "git://github.com/linaro-swg/optee_examples.git;protocol=https"
>   
>   DEPENDS_append_ti-soc = " python3-cryptography-native"
> diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
> index db9064de..a77fbc5a 100644
> --- a/recipes-security/optee/optee-os_%.bbappend
> +++ b/recipes-security/optee/optee-os_%.bbappend
> @@ -1,5 +1,5 @@
> -PV_ti-soc = "3.19.0+git${SRCPV}"
> -SRCREV_ti-soc = "d6c5d0037b46f46caf71d67d7825d4b722cbcddf"
> +PV_ti-soc = "3.20.0+git${SRCPV}"
> +SRCREV_ti-soc = "3bc3809afe372ca7e8216fc5d7a64e965bb4ad70"
>   SRC_URI_ti-soc = "git://github.com/OP-TEE/optee_os.git;protocol=https"
>   
>   DEPENDS_append_ti-soc = " python3-cryptography-native"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

