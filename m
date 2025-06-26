Return-Path: <s-anna@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFEAEC7EE31
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 17:11:50 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.1165.1750957904324204662
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Jun 2025 10:11:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=GQuIJ9ie;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: s-anna@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55QHBhVV2205877
	for <meta-ti@lists.yoctoproject.org>; Thu, 26 Jun 2025 12:11:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750957903;
	bh=8VI2Fun8YS/Ejfe9wIR9/f30+dEe2afVa4CHC8hPz8k=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=GQuIJ9ie7EKXDy+tCdojeaL3rV5XmObubodA3Q7FYt+81E3I67lVFW9ndWK7tZ4L9
	 Rm/5Zvougi1KpU107davbpwJHjkaIKstYO/BidH8GMdWacSPkKeuch1lflsHdGEOu6
	 N6Bq5mZ5MnoaOBYxh4VTbJ4NIvOCs7prQeXkKcA8=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55QHBhSq3799926
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 26 Jun 2025 12:11:43 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 26
 Jun 2025 12:11:43 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 26 Jun 2025 12:11:43 -0500
Received: from [128.247.81.162] (irmo.dhcp.ti.com [128.247.81.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55QHBgqV1634723;
	Thu, 26 Jun 2025 12:11:42 -0500
Message-ID: <19eebdc9-dbb3-5c94-0f4c-65123cec35ef@ti.com>
Date: Thu, 26 Jun 2025 12:11:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-ti][scarthgap/master][PATCH] Revert "conf: machine: k3:
 disable all fit signing for uboot"
Content-Language: en-US
To: <m-chawdhry@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Ryan Eatmon
	<reatmon@ti.com>
CC: Aniket Limaye <a-limaye@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Kamlesh Gurudasani <kamlesh@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, Udit Kumar <u-kumar1@ti.com>,
        Bryan Brattlof <bb@ti.com>
References: <20250626105933.564282-1-m-chawdhry@ti.com>
From: Suman Anna <s-anna@ti.com>
In-Reply-To: <20250626105933.564282-1-m-chawdhry@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Jun 2025 17:11:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18693

Hi Manorit,

On 6/26/25 05:59, Manorit Chawdhry via lists.yoctoproject.org wrote:
> The following revert requires a patch in U-boot as well which has been
> posted upstream [0] and backported internally too.
> 
> This reverts commit 9656b79cb557a46d2611b67e7e51702f6da05594.
>

Please add detail on what this patch is fixing and why we are reverting this
commit. The current description gives zero information on why we are doing this.

regards
Suman


> [0]: https://lore.kernel.org/all/20250626-b4-upstream-fix-icssg-fit-v1-1-95eff1c853a4@ti.com/
> 
> Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
> ---
>  meta-ti-bsp/conf/machine/include/k3.inc | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
> index 9b85f867c206..14d7db8a1184 100644
> --- a/meta-ti-bsp/conf/machine/include/k3.inc
> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> @@ -25,6 +25,10 @@ SPL_BINARY = "tispl.bin"
>  SPL_BINARYNAME = "tispl.bin"
>  UBOOT_SUFFIX = "img"
>  
> +UBOOT_SIGN_ENABLE = "1"
> +UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb"
> +UBOOT_SIGN_KEYNAME ?= "custMpk"
> +UBOOT_SIGN_KEYDIR ?= "${TI_SECURE_DEV_PKG}/keys"
>  FIT_HASH_ALG ?= "sha512"
>  FIT_SIGN_ALG ?= "rsa4096"
>  
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18692): https://lists.yoctoproject.org/g/meta-ti/message/18692
> Mute This Topic: https://lists.yoctoproject.org/mt/113841171/4594561
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [s-anna@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


