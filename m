Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.491.1614718377007654513
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 02 Mar 2021 12:52:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E33EB40C1D;
	Tue,  2 Mar 2021 20:52:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9v2MVi-yHZWA; Tue,  2 Mar 2021 20:52:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AD4B0407E5;
	Tue,  2 Mar 2021 20:52:52 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6E908174524; Tue,  2 Mar 2021 15:52:52 -0500 (EST)
Date: Tue, 2 Mar 2021 15:52:52 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: praneeth@ti.com
Cc: Lokesh Vutla <lokeshvutla@ti.com>,
	Shivalingappa Sujith <sujith.s@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [dunfell/master PATCH] ti-rtos: Update metadata and versions for RTOS firmware
Message-ID: <20210302205252.GP4892@denix.org>
References: <20210301235735.24491-1-praneeth@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210301235735.24491-1-praneeth@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 01, 2021 at 05:57:35PM -0600, praneeth via lists.yoctoproject.org wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
> 
> updated rtos firmwares
> am64xx: 07.03.01.06
> am65xx: 07.03.00.16
> j721e: 07.03.00.16
> j7200: 07.03.00.16

Since most of the versions are now the same, you can simplify it by setting 
common variable once and then altering it for am64xx only:

DEFAULT_RTOS_VERSION = "07_03_00_16"
DEFAULT_RTOS_VERSION_DOT = "07.03.00.16"

DEFAULT_RTOS_VERSION_am64xx = "07_03_01_06"
DEFAULT_RTOS_VERSION_DOT_am64xx = "07.03.01.06"

I.e. no need to set _j7200 and _am65xx separately.


> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>  recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 24 +++++++++++-----------
>  recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb |  2 +-
>  2 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> index ed62b876..2cd19ac8 100644
> --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -17,17 +17,17 @@ include ${DEPLOY_DIR_IMAGE}/metadata.inc
>  
>  # Set some defaults for when metadata.inc is not available
>  DEFAULT_RTOS_FAMILY = "jacinto"
> -DEFAULT_RTOS_VERSION = "07_03_00_12"
> -DEFAULT_RTOS_VERSION_DOT = "07.03.00.12"
> +DEFAULT_RTOS_VERSION = "07_03_00_16"
> +DEFAULT_RTOS_VERSION_DOT = "07.03.00.16"
>  
> -DEFAULT_RTOS_VERSION_j7200 = "07_03_00_10"
> -DEFAULT_RTOS_VERSION_DOT_j7200 = "07.03.00.10"
> +DEFAULT_RTOS_VERSION_j7200 = "07_03_00_16"
> +DEFAULT_RTOS_VERSION_DOT_j7200 = "07.03.00.16"
>  
> -DEFAULT_RTOS_VERSION_am64xx = "07_03_01_02"
> -DEFAULT_RTOS_VERSION_DOT_am64xx = "07.03.01.02"
> +DEFAULT_RTOS_VERSION_am64xx = "07_03_01_06"
> +DEFAULT_RTOS_VERSION_DOT_am64xx = "07.03.01.06"
>  
> -DEFAULT_RTOS_VERSION_am65xx = "07_03_00_10"
> -DEFAULT_RTOS_VERSION_DOT_am65xx = "07.03.00.10"
> +DEFAULT_RTOS_VERSION_am65xx = "07_03_00_16"
> +DEFAULT_RTOS_VERSION_DOT_am65xx = "07.03.00.16"
>  
>  DEFAULT_RTOS_SOC = "undefined"
>  DEFAULT_RTOS_SOC_j7 = "j721e"
> @@ -46,10 +46,10 @@ DEFAULT_FIRMWARE_URL = "file://empty"
>  DEFAULT_FIRMWARE_URL_k3 = "${CORESDK_RTOS_WEBLINK}/${DEFAULT_FIRMWARE_FILE}"
>  
>  DEFAULT_FIRMWARE_SHA256SUM = "unknown"
> -DEFAULT_FIRMWARE_SHA256SUM_j7 = "69cc16c30c895fe813002bd7bdb3d30e6ca622d86b008a6bf6e2a24b86550969"
> -DEFAULT_FIRMWARE_SHA256SUM_j7200-evm = "a16865d928b2b00bfca64e0c41b02dcfc0ac8ec1ce125fbfd3581a1c610847f8"
> -DEFAULT_FIRMWARE_SHA256SUM_am65xx = "aa121c10d3099dd61ef898717245ecee25b501170607c9a95afd741e05783a5d"
> -DEFAULT_FIRMWARE_SHA256SUM_am64xx = "9e9efeef0b1dbb101de97e58cfda8bf052a697f2ea635fdf6ca5158fffdc212b"
> +DEFAULT_FIRMWARE_SHA256SUM_j7 = "78f3ab929a0f3c6e2907538061de82e16d8aff7ffb2fac0c3c4d56df8abec3b0"
> +DEFAULT_FIRMWARE_SHA256SUM_j7200-evm = "5bae696d35e206bbcd9b26ab6508af59a2c2d72f9b89aa1d3fc1aa808f7a8615"
> +DEFAULT_FIRMWARE_SHA256SUM_am65xx = "7bd854dbf96c25683d684ac731fde3edd7fb8a65f8727f7aae3802a2e9a9cab6"
> +DEFAULT_FIRMWARE_SHA256SUM_am64xx = "450bf23d659756695d62168fe06eebe4641522293d89692a9eea837426bac0f9"
>  
>  # Use weak assignment for CORESDK_RTOS_* variables to use defaults if not yet set
>  CORESDK_RTOS_FAMILY ?= "${DEFAULT_RTOS_FAMILY}"
> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
> index 1bbe5f22..9bb0d3c5 100644
> --- a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
> @@ -18,7 +18,7 @@ PLAT_SFX_am64xx = "/am64x"
>  # Use weak assignment to set defaults to TI_RTOS_METADATA_* variables
>  TI_RTOS_METADATA_URI ?= "git://git.ti.com/processor-sdk/coresdk_rtos_releases.git"
>  TI_RTOS_METADATA_PROTOCOL ?= "git"
> -TI_RTOS_METADATA_SRCREV ?= "e15de0d731606abdf112f2910543fd08b781ad64"
> +TI_RTOS_METADATA_SRCREV ?= "ba81dc5a9342fc35435920092a0df2cb2ab342ef"
>  TI_RTOS_METADATA_BRANCH ?= "master"
>  TI_RTOS_METADATA_DIR ?= "${PLAT_SFX}"
>  TI_RTOS_METADATA_FILE ?= "${S}${TI_RTOS_METADATA_DIR}/metadata.inc"
> -- 
> 2.17.1
