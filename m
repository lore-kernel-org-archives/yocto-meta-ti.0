Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ACD7C43334
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 18:11:57 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.801.1654711914488901810
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Jun 2022 11:11:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xV2LjOXN;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: nm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 258IBrvo024944
	for <meta-ti@lists.yoctoproject.org>; Wed, 8 Jun 2022 13:11:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1654711913;
	bh=T3l4+KS5GFgPf2bBDvdH2T3XukhKpxzptPmw7X41sPI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=xV2LjOXNdipvWQ2+prS3QX2bRSy1a+ZwB/DJ+XJB9JFOXLcCnS7dVMza5fPDOk8dO
	 KC1wG3Dj0aGGQI4j8sn0aWsdnBbpJXGTUAVnetpAoYOY9GFFGI40ui+SoLGWT5iDre
	 7GUaS+pDIjK43w0web3Y6whFI7b6MQ9OblyOWI+w=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 258IBrWA117254
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 8 Jun 2022 13:11:53 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 8
 Jun 2022 13:11:53 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 8 Jun 2022 13:11:53 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 258IBrEE045489;
	Wed, 8 Jun 2022 13:11:53 -0500
Date: Wed, 8 Jun 2022 13:11:53 -0500
From: Nishanth Menon <nm@ti.com>
To: <j-choudhary@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <afd@ti.com>, <praneeth@ti.com>,
        <reatmon@ti.com>
Subject: Re: [meta-ti] [dunfell PATCH v2 1/5] conf: machine: Add j721s2 hs
 platform
Message-ID: <20220608181153.dbe6e3pu5q7kqncp@bobbed>
References: <20220607103529.13068-1-j-choudhary@ti.com>
 <20220607103529.13068-2-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220607103529.13068-2-j-choudhary@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Jun 2022 18:11:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14797

On 16:05-20220607, Jayesh Choudhary via lists.yoctoproject.org wrote:
> Machine conf for J721S2 HS platform.
> Used j7200 hs as reference.
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>  conf/machine/j721s2-hs-evm-k3r5.conf | 13 +++++++++++++
>  conf/machine/j721s2-hs-evm.conf      | 22 ++++++++++++++++++++++
>  2 files changed, 35 insertions(+)
>  create mode 100644 conf/machine/j721s2-hs-evm-k3r5.conf
>  create mode 100644 conf/machine/j721s2-hs-evm.conf
> 
> diff --git a/conf/machine/j721s2-hs-evm-k3r5.conf b/conf/machine/j721s2-hs-evm-k3r5.conf
> new file mode 100644
> index 00000000..ac4df86e
> --- /dev/null
> +++ b/conf/machine/j721s2-hs-evm-k3r5.conf
> @@ -0,0 +1,13 @@
> +#@TYPE: Machine
> +#@NAME: J721S2 HS EVM (R5F)
> +#@DESCRIPTION: Machine configuration for the TI J721S2 HS EVM (R5F core)
> +
> +require conf/machine/include/k3r5.inc
> +
> +SYSFW_SOC = "j721s2"
> +SYSFW_CONFIG = "evm"
> +SYSFW_SUFFIX = "hs"
> +
> +UBOOT_MACHINE = "j721s2_hs_evm_r5_defconfig"
> +
> +TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
> diff --git a/conf/machine/j721s2-hs-evm.conf b/conf/machine/j721s2-hs-evm.conf
> new file mode 100644
> index 00000000..43fb2ebc
> --- /dev/null
> +++ b/conf/machine/j721s2-hs-evm.conf
> @@ -0,0 +1,22 @@
> +#@TYPE: Machine
> +#@NAME: J721S2 HS EVM
> +#@DESCRIPTION: Machine configuration for the TI J721S2 HS EVM
> +
> +require conf/machine/j721s2-evm.conf
> +
> +UBOOT_MACHINE = "j721s2_hs_evm_a72_defconfig"
> +
> +UBOOT_ENTRYPOINT =       "0x80080000"
> +UBOOT_LOADADDRESS =      "0x80080000"
> +UBOOT_RD_LOADADDRESS =   "0x84000000"
> +UBOOT_RD_ENTRYPOINT =    "0x84000000"
> +UBOOT_DTB_LOADADDRESS =  "0x83000000"
> +UBOOT_DTBO_LOADADDRESS = "0x83080000"
> +UBOOT_DTBO_OFFSET =      "0x00010000"

Is there any way we can get rid of addresses from recipes?

> +
> +SPL_BINARY = "tispl.bin_HS"
> +SPL_BINARYNAME = "tispl.bin"
> +UBOOT_BINARY = "u-boot.img_HS"
> +IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
> +
> +TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
> -- 
> 2.17.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14787): https://lists.yoctoproject.org/g/meta-ti/message/14787
> Mute This Topic: https://lists.yoctoproject.org/mt/91597540/5513541
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [nm@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

