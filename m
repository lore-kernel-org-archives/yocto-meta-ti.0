Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.204.1617233581215860298
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 16:33:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=H3v4BVO5;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12VNWuov117607;
	Wed, 31 Mar 2021 18:32:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617233576;
	bh=p3yptXDUsYE2Hz7thyZlOxaOmwRB8T0nqewzjfxcR84=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=H3v4BVO5BOrcDU/sLgH9Zft3kh8CjY+uWeiUIcFtkSbjvPbNCXSuXH+eT1fudcL4C
	 UvormdrqU9AIhT/LIsNQb0XKg+UmXsvi5rwvlsPks/Bp/qjHxCQ1swWvlbN18xZ/G5
	 +9hzIPg9vSPimH/pTcrqZZLlOAJ2QeXiZe4zWwUc=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12VNWukK084836
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 31 Mar 2021 18:32:56 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 31
 Mar 2021 18:32:56 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 31 Mar 2021 18:32:56 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12VNWuEX056933;
	Wed, 31 Mar 2021 18:32:56 -0500
Date: Wed, 31 Mar 2021 18:32:56 -0500
From: "Nishanth Menon" <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [meta-ti] [dunfell/master][PATCH] conf/machine: am64*,j7200: cleanup k3r5 configs
Message-ID: <20210331233256.mppj2ksko3uem522@equation>
References: <1617232092-43825-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1617232092-43825-1-git-send-email-denis@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 19:08-20210331, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> Remove duplicate machine-specific redefines of UBOOT_BINARY, UBOOT_IMAGE and
> UBOOT_SYMLINK variables, as they are already defined with same values in the
> common k3r5.inc file.

> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>

Aaah.. thanks.

Reviewed-by: Nishanth Menon <nm@ti.com>

> ---
>  conf/machine/am64xx-evm-k3r5.conf | 3 ---
>  conf/machine/am64xx-sk-k3r5.conf  | 3 ---
>  conf/machine/j7200-evm-k3r5.conf  | 3 ---
>  3 files changed, 9 deletions(-)
> 
> diff --git a/conf/machine/am64xx-evm-k3r5.conf b/conf/machine/am64xx-evm-k3r5.conf
> index dfeaeb5..afd36b7 100644
> --- a/conf/machine/am64xx-evm-k3r5.conf
> +++ b/conf/machine/am64xx-evm-k3r5.conf
> @@ -9,6 +9,3 @@ SYSFW_CONFIG = "evm"
>  SYSFW_SUFFIX = "gp"
>  
>  UBOOT_MACHINE = "am64x_evm_r5_defconfig"
> -UBOOT_BINARY = "tiboot3.${UBOOT_SUFFIX}"
> -UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
> -UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
> diff --git a/conf/machine/am64xx-sk-k3r5.conf b/conf/machine/am64xx-sk-k3r5.conf
> index 1256db7..07ca590 100644
> --- a/conf/machine/am64xx-sk-k3r5.conf
> +++ b/conf/machine/am64xx-sk-k3r5.conf
> @@ -9,6 +9,3 @@ SYSFW_CONFIG = "evm"
>  SYSFW_SUFFIX = "gp"
>  
>  UBOOT_MACHINE = "am64x_sk_r5_defconfig"
> -UBOOT_BINARY = "tiboot3.${UBOOT_SUFFIX}"
> -UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
> -UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
> diff --git a/conf/machine/j7200-evm-k3r5.conf b/conf/machine/j7200-evm-k3r5.conf
> index a889481..6806188 100644
> --- a/conf/machine/j7200-evm-k3r5.conf
> +++ b/conf/machine/j7200-evm-k3r5.conf
> @@ -9,6 +9,3 @@ SYSFW_CONFIG = "evm"
>  SYSFW_SUFFIX = "gp"
>  
>  UBOOT_MACHINE = "j7200_evm_r5_defconfig"
> -UBOOT_BINARY = "tiboot3.${UBOOT_SUFFIX}"
> -UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
> -UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
> -- 
> 2.7.4
> 


-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
