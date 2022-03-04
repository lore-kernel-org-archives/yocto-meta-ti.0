Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.658.1646421426374537972
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Mar 2022 11:17:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=jxRzs30x;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 224JH1ZL086416;
	Fri, 4 Mar 2022 13:17:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1646421421;
	bh=XPpM4v38tVYVOyQrDYmlb28L65pkSzOq9OgKb/SsAhQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=jxRzs30xZBoaE0cxs75yLgTD5Ybanr592EBFs1zUlUKc6T3h1vJjXTgAkFj3mSkKi
	 +E1GwneJOV7u2eLsNDmNwmLrWWK+mN2+VnXYmArorAQbBqbBKH4pIYY9bvlGj/lh1Z
	 mdxuHVmGmRzdmRjdxUWJkWhLrMbOV6PwTMOPc3VU=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 224JH1xZ050204
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Mar 2022 13:17:01 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 4
 Mar 2022 13:17:01 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 4 Mar 2022 13:17:01 -0600
Received: from [10.247.28.135] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 224JH02u082435;
	Fri, 4 Mar 2022 13:17:00 -0600
Message-ID: <193b4b79-455d-3b21-58bb-0c550c8d9477@ti.com>
Date: Fri, 4 Mar 2022 13:17:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [dunfell/master PATCH] pruss-fw: am57xx: Update hsr/prp/sw/dual-emac firmware
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Yogesh
 Siraswar <yogeshs@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20220304191540.8578-1-praneeth@ti.com>
From: "praneeth" <praneeth@ti.com>
In-Reply-To: <20220304191540.8578-1-praneeth@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 3/4/2022 1:15 PM, Praneeth Bajjuri wrote:
> commit 5a05d0b ("ti-pruss: Update AM57x PRP firmware to 002.020.035")
> commit d88ee87 ("ti-pruss: Update AM57x HSR firmware to 002.020.035")
> commit bc428f2 ("ti-pruss: Update AM57x Switch firmware to 003.002.012")
> commit f154d9e ("ti-pruss: Update AM57x Dual-EMAC firmware to 005.006.018")
> 
> has updated hsr/prp/sw/dual-emac pruss firmware version for am57xx.
> 
> This fix is to update the version for am57xx and while at it
> rename the recipes and capture the fix version for am335x, am437x and am57xx
> in ti-linux-fw.inc.
> 

Ryan,
Have not chance to test this patch. Please review and verify.


> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>   .../{prueth-fw_5.6.15.bb => prueth-fw.bb}          |  3 +++
>   .../{pruhsr-fw_2.17.25.bb => pruhsr-fw.bb}         |  3 +++
>   .../{pruprp-fw_2.17.25.bb => pruprp-fw.bb}         |  3 +++
>   .../prusw-fw/{prusw-fw_3.2.9.bb => prusw-fw.bb}    |  3 +++
>   recipes-bsp/ti-linux-fw/ti-linux-fw.inc            | 14 +++++++++++++-
>   5 files changed, 25 insertions(+), 1 deletion(-)
>   rename recipes-bsp/prueth-fw/{prueth-fw_5.6.15.bb => prueth-fw.bb} (88%)
>   rename recipes-bsp/pruhsr-fw/{pruhsr-fw_2.17.25.bb => pruhsr-fw.bb} (88%)
>   rename recipes-bsp/pruprp-fw/{pruprp-fw_2.17.25.bb => pruprp-fw.bb} (88%)
>   rename recipes-bsp/prusw-fw/{prusw-fw_3.2.9.bb => prusw-fw.bb} (88%)
> 
> diff --git a/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb b/recipes-bsp/prueth-fw/prueth-fw.bb
> similarity index 88%
> rename from recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
> rename to recipes-bsp/prueth-fw/prueth-fw.bb
> index f7336fb1..e41bb3c0 100644
> --- a/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
> +++ b/recipes-bsp/prueth-fw/prueth-fw.bb
> @@ -2,6 +2,9 @@ SUMMARY = "PRU Ethernet firmware for AM57xx, AM437x and AM335x"
>   
>   require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>   
> +PV = "${PRUETH_FW_AM335X_VERSION}"
> +PV = "${PRUETH_FW_AM437X_VERSION}"
> +PV = "${PRUETH_FW_AM57XX_VERSION}"
>   PR = "${INC_PR}.0"
>   
>   CLEANBROKEN = "1"
> diff --git a/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb b/recipes-bsp/pruhsr-fw/pruhsr-fw.bb
> similarity index 88%
> rename from recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb
> rename to recipes-bsp/pruhsr-fw/pruhsr-fw.bb
> index 507a500b..1decd3d6 100644
> --- a/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb
> +++ b/recipes-bsp/pruhsr-fw/pruhsr-fw.bb
> @@ -3,6 +3,9 @@ SUMMARY = "PRU HSR firmware for AM335x/AM437x/AM57xx"
>   require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>   
>   PE = "1"
> +PV = "${PRUHSR_FW_AM335X_VERSION}"
> +PV = "${PRUHSR_FW_AM437X_VERSION}"
> +PV = "${PRUHSR_FW_AM57XX_VERSION}"
>   PR = "${INC_PR}.0"
>   
>   CLEANBROKEN = "1"
> diff --git a/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb b/recipes-bsp/pruprp-fw/pruprp-fw.bb
> similarity index 88%
> rename from recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
> rename to recipes-bsp/pruprp-fw/pruprp-fw.bb
> index ba203948..656a640b 100644
> --- a/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
> +++ b/recipes-bsp/pruprp-fw/pruprp-fw.bb
> @@ -3,6 +3,9 @@ SUMMARY = "PRU PRP firmware for AM335x/AM437x/AM57xx"
>   require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>   
>   PE = "1"
> +PV = "${PRUPRP_FW_AM335X_VERSION}"
> +PV = "${PRUPRP_FW_AM437X_VERSION}"
> +PV = "${PRUPRP_FW_AM57XX_VERSION}"
>   PR = "${INC_PR}.0"
>   
>   CLEANBROKEN = "1"
> diff --git a/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb b/recipes-bsp/prusw-fw/prusw-fw.bb
> similarity index 88%
> rename from recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
> rename to recipes-bsp/prusw-fw/prusw-fw.bb
> index ec0a15f4..ce0e5013 100644
> --- a/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
> +++ b/recipes-bsp/prusw-fw/prusw-fw.bb
> @@ -2,6 +2,9 @@ SUMMARY = "PRU Switch firmware for AM57xx, AM437x and AM335x"
>   
>   require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>   
> +PV = "${PRUSW_FW_AM335X_VERSION}"
> +PV = "${PRUSW_FW_AM437X_VERSION}"
> +PV = "${PRUSW_FW_AM57XX_VERSION}"
>   PR = "${INC_PR}.0"
>   
>   CLEANBROKEN = "1"
> diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> index fced78fd..368b203f 100644
> --- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> +++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> @@ -12,14 +12,26 @@ SERDES_FW_VERSION = "3.3.0.2c"
>   NETCP_SA_FW_VERSION = "1.0.0"
>   NETCP_PA_FW_VERSION = "3.0.2.3"
>   QMSS_PDSP_FW_VERSION = "1.0.0.9"
> +PRUETH_FW_AM335X_VERSION = "REL.PDK_ICSS_EMAC_FW_08.01.00"
> +PRUETH_FW_AM437X_VERSION "REL.PDK_ICSS_EMAC_FW_08.01.00"
> +PRUETH_FW_AM57XX_VERSION = "5.6.18"
>   PRUETH_FW_AM65X_VERSION = "08.00.00.20"
>   PRUETH_FW_AM65X_SR2_VERSION = "02.02.09.07"
> +PRUHSR_FW_AM335X_VERSION = "2.17.25"
> +PRUHSR_FW_AM437X_VERSION = "2.17.25"
> +PRUHSR_FW_AM57XX_VERSION = "2.20.35"
> +PRUPRP_FW_AM335X_VERSION = "2.17.25"
> +PRUPRP_FW_AM437X_VERSION = "2.17.25"
> +PRUPRP_FW_AM57XX_VERSION = "2.20.35"
> +PRUSW_FW_AM335X_VERSION = "3.2.7"
> +PRUSW_FW_AM437X_VERSION = "3.2.7"
> +PRUSW_FW_AM57XX_VERSION = "3.2.12"
>   GOODIX_FW_VERSION = "1.0.0.0"
>   CADENCE_MHDP_FW_VERSION = "1.2.17"
>   IMG_DEC_FW_VERSION = "1.0"
>   CNM_WAVE521_FW_VERSION = "1.0.00"
>   
> -TI_LINUX_FW_SRCREV ?= "8810faf0c51a80554150e185122e43bee1553c37"
> +TI_LINUX_FW_SRCREV ?= "0f4905088d24e474063f33777559149e11538be5"
>   SRCREV = "${TI_LINUX_FW_SRCREV}"
>   
>   BRANCH ?= "ti-linux-firmware"
