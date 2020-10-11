Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.19689.1602429740926045852
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 11 Oct 2020 08:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=t9S3uroL;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: dmurphy@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09BFMH79064496;
	Sun, 11 Oct 2020 10:22:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1602429737;
	bh=fk3uQsbFk9JmaLDushqystFN0gra+4xhlyeIWnWSXDg=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=t9S3uroLezBv03qGED37q+Jijpg5pwCxUOX2bNM+XRXFtt6oCKf7txlzJ/6jZJMsG
	 Vp7hhsqZbK/pMQ/Bygg327AAkiDOfOW0A3VadtQ8QaTvpEFJ7kImVMUjt5e4+098c7
	 1czjj9G1Cs3clqEen5iSPin/vYRMTkHAWH3TUlLA=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09BFMHqF053216
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 11 Oct 2020 10:22:17 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sun, 11
 Oct 2020 10:22:16 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sun, 11 Oct 2020 10:22:16 -0500
Received: from [10.250.67.63] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09BFMGWh099343;
	Sun, 11 Oct 2020 10:22:16 -0500
Subject: Re: [meta-ti] [dunfell/master][PATCH 1/3] conf/machine: pass OPTEEFLAVOR via OPTEEMACHINE as <mach>-<flavor>
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@ti.com>
References: <1602274310-28284-1-git-send-email-denis@denix.org>
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <baee04f8-49b7-917b-ce8d-5aca887ec50e@ti.com>
Date: Sun, 11 Oct 2020 10:22:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1602274310-28284-1-git-send-email-denis@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys

On 10/9/20 3:11 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> Recipe in meta-arm doesn't use OPTEEFLAVOR, but optee-os Makefile can extract
> it from OPTEEMACHINE.
> Keep OPTEEFLAVOR for legacy platforms - used for HS signing in the output name.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>   conf/machine/am437x-hs-evm.conf | 2 +-
>   conf/machine/am57xx-hs-evm.conf | 2 +-
>   conf/machine/dra7xx-hs-evm.conf | 2 +-
>   conf/machine/include/am65xx.inc | 3 +--
>   conf/machine/include/j7.inc     | 3 +--
>   5 files changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/conf/machine/am437x-hs-evm.conf b/conf/machine/am437x-hs-evm.conf
> index 34c1016..0a8ca06 100644
> --- a/conf/machine/am437x-hs-evm.conf
> +++ b/conf/machine/am437x-hs-evm.conf
> @@ -13,6 +13,6 @@ UBOOT_RD_ENTRYPOINT = "0x84000000"
>   
>   TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_CAT}/am4x"
>   
> -OPTEEMACHINE = "ti"
> +OPTEEMACHINE = "ti-am43xx"
>   OPTEEFLAVOR = "am43xx"
>   OPTEEOUTPUTMACHINE = "ti"
> diff --git a/conf/machine/am57xx-hs-evm.conf b/conf/machine/am57xx-hs-evm.conf
> index 4d3eb00..d4f6e09 100644
> --- a/conf/machine/am57xx-hs-evm.conf
> +++ b/conf/machine/am57xx-hs-evm.conf
> @@ -13,7 +13,7 @@ UBOOT_RD_ENTRYPOINT = "0x84000000"
>   
>   TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_AUTO}/am5x"
>   
> -OPTEEMACHINE = "ti"
> +OPTEEMACHINE = "ti-am57xx"
>   OPTEEFLAVOR = "am57xx"
>   OPTEEOUTPUTMACHINE = "ti"
>   OPTEEPAGER = "y"
> diff --git a/conf/machine/dra7xx-hs-evm.conf b/conf/machine/dra7xx-hs-evm.conf
> index 9b02985..da4000f 100644
> --- a/conf/machine/dra7xx-hs-evm.conf
> +++ b/conf/machine/dra7xx-hs-evm.conf
> @@ -13,7 +13,7 @@ UBOOT_RD_ENTRYPOINT = "0x84000000"
>   
>   TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_AUTO}/dra7"
>   
> -OPTEEMACHINE = "ti"
> +OPTEEMACHINE = "ti-dra7xx"
>   OPTEEFLAVOR = "dra7xx"
>   OPTEEOUTPUTMACHINE = "ti"
>   OPTEEPAGER = "y"
> diff --git a/conf/machine/include/am65xx.inc b/conf/machine/include/am65xx.inc
> index 1acb205..67cfabe 100644
> --- a/conf/machine/include/am65xx.inc
> +++ b/conf/machine/include/am65xx.inc
> @@ -21,8 +21,7 @@ KERNEL_DEVICETREE = " \
>       ti/k3-am654-evm-prupwm.dtbo \
>   "
>   
> -OPTEEMACHINE = "k3"
> -OPTEEFLAVOR = "am65x"
> +OPTEEMACHINE = "k3-am65x"
>   OPTEEOUTPUTMACHINE = "k3"
>   
>   # Set the list of device targets for ti-pdk class recipes
> diff --git a/conf/machine/include/j7.inc b/conf/machine/include/j7.inc
> index f6d9161..7d326f4 100644
> --- a/conf/machine/include/j7.inc
> +++ b/conf/machine/include/j7.inc
> @@ -1,8 +1,7 @@
>   require conf/machine/include/k3.inc
>   SOC_FAMILY_append = ":j7"
>   
> -OPTEEMACHINE = "k3"
> -OPTEEFLAVOR = "j7"
> +OPTEEMACHINE = "k3-j7"
>   OPTEEOUTPUTMACHINE = "k3"
>   
>   # Set the list of device targets for ti-pdk class recipes
>
All 3 applied

Thanks

