Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD8BC433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 18:07:47 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.755.1654711662711821520
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Jun 2022 11:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=YtfrEqJz;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 258I7fom035936
	for <meta-ti@lists.yoctoproject.org>; Wed, 8 Jun 2022 13:07:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1654711661;
	bh=w1bHckUWfFBC0UI+6E4kjvUoF7OeXQbaxtr0yk4pid8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=YtfrEqJzF3wQYu4CrW5uXKkD1pHJucm4HPqbCH8Rxvq9X0tsmPPzUtQzYDknA0EG9
	 2+LE9BBC0ReTO150sVMaXWdLhF5oFHrrAejojSWSRgEAtadIWwwSHjvWXQQw+dOnjw
	 dN2YVgtbUH2PQsryf1vDUQqjCDixfZXOZ8Y4ThPY=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 258I7fGq029775
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 8 Jun 2022 13:07:41 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 8
 Jun 2022 13:07:41 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 8 Jun 2022 13:07:41 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 258I7fWs107953;
	Wed, 8 Jun 2022 13:07:41 -0500
Date: Wed, 8 Jun 2022 13:07:41 -0500
From: Nishanth Menon <nm@ti.com>
To: <j-choudhary@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <afd@ti.com>, <praneeth@ti.com>,
        <reatmon@ti.com>
Subject: Re: [meta-ti] [dunfell PATCH v2 5/5] cnm-wave-fw: add compatible for
 j721s2-hs-evm
Message-ID: <20220608180741.wotw5fzlr6e3hons@reunion>
References: <20220607103529.13068-1-j-choudhary@ti.com>
 <20220607103529.13068-6-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220607103529.13068-6-j-choudhary@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Jun 2022 18:07:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14795

On 16:05-20220607, Jayesh Choudhary via lists.yoctoproject.org wrote:
> Add the HS platform to the compatible list in the recipe.
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>  recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb | 3 ++-
>  recipes-kernel/linux/kernel-rdepends.inc   | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
> index 0c432de2..83619090 100644
> --- a/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
> +++ b/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
> @@ -13,7 +13,7 @@ PR = "${INC_PR}.1"
>  
>  CLEANBROKEN = "1"
>  
> -COMPATIBLE_MACHINE = "j721s2-evm"
> +COMPATIBLE_MACHINE = "j721s2-evm|j721s2-hs-evm"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -22,6 +22,7 @@ TARGET_WAVE521C = "wave521c_codec_fw.bin"
>  
>  SOURCE_WAVE521C = "wave521c_codec_fw.bin"
>  SOURCE_WAVE521C_j721s2-evm = "wave521c_j721s2_codec_fw.bin"
> +SOURCE_WAVE521C_j721s2-hs-evm = "wave521c_j721s2_codec_fw.bin"

Just curious..

Is the codec binary changing per board? if not, why not just plug it
based on SoC?

>  
>  ALTERNATIVE_LINK_NAME[wave521c_codec_fw.bin] = "${base_libdir}/firmware/${TARGET_WAVE521C}"
>  ALTERNATIVE_TARGET[wave521c_codec_fw.bin] = "${base_libdir}/firmware/cnm/${TARGET_WAVE521C}"
> diff --git a/recipes-kernel/linux/kernel-rdepends.inc b/recipes-kernel/linux/kernel-rdepends.inc
> index 17aee4c2..2ebf4948 100644
> --- a/recipes-kernel/linux/kernel-rdepends.inc
> +++ b/recipes-kernel/linux/kernel-rdepends.inc
> @@ -45,6 +45,7 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " vxd-dec-fw"
>  
>  # Add run-time dependency for Chips&Media Wave521 firmware to the rootfs
>  RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j721s2-evm = " cnm-wave-fw"
> +RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j721s2-hs-evm = " cnm-wave-fw"
>  
>  # Add run-time dependency for TIFS Low Power Module stub
>  RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am62xx-evm = " tifs-lpm-stub"
> -- 
> 2.17.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14791): https://lists.yoctoproject.org/g/meta-ti/message/14791
> Mute This Topic: https://lists.yoctoproject.org/mt/91597545/5513541
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [nm@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

