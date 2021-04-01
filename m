Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.6604.1617309069651775232
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 01 Apr 2021 13:31:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BEEB540C34;
	Thu,  1 Apr 2021 20:31:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rfIDb7ChYeQo; Thu,  1 Apr 2021 20:31:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9D8A940BA9;
	Thu,  1 Apr 2021 20:31:06 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 03EF2174568; Thu,  1 Apr 2021 16:31:06 -0400 (EDT)
Date: Thu, 1 Apr 2021 16:31:05 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: praneeth@ti.com
Cc: Shivalingappa Sujith <sujith.s@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [dunfell/master PATCH] ti-rtos: Update metadata and versions for RTOS firmware
Message-ID: <20210401203105.GR23013@denix.org>
References: <20210401201629.10334-1-praneeth@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210401201629.10334-1-praneeth@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Praneeth,

You didn't update metadata recipe, even though the commit says otherwise.

So, if you pull metadata first, it will point to the old firmware version.


On Thu, Apr 01, 2021 at 03:16:29PM -0500, praneeth via lists.yoctoproject.org wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
> 
> updated rtos firmwares
> j721e, j7200: 07.03.00.26
> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>  recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> index 176d0ad0..84dae9a6 100644
> --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -20,8 +20,8 @@ include ${DEPLOY_DIR_IMAGE}/${DEFAULT_METADATA_FILE}
>  
>  # Set some defaults for when metadata.inc is not available
>  DEFAULT_RTOS_FAMILY = "jacinto"
> -DEFAULT_RTOS_VERSION = "07_03_00_21"
> -DEFAULT_RTOS_VERSION_DOT = "07.03.00.21"
> +DEFAULT_RTOS_VERSION = "07_03_00_26"
> +DEFAULT_RTOS_VERSION_DOT = "07.03.00.26"
>  
>  DEFAULT_RTOS_VERSION_am64xx = "07_03_00_18"
>  DEFAULT_RTOS_VERSION_DOT_am64xx = "07.03.00.18"
> @@ -48,8 +48,8 @@ DEFAULT_FIRMWARE_URL = "file://empty"
>  DEFAULT_FIRMWARE_URL_k3 = "${CORESDK_RTOS_WEBLINK}/${DEFAULT_FIRMWARE_FILE}"
>  
>  DEFAULT_FIRMWARE_SHA256SUM = "unknown"
> -DEFAULT_FIRMWARE_SHA256SUM_j7 = "fc7805ed3d6c1801efb2b85ac9af99a8657aa3a7a9327bc16a1163d566f11c2c"
> -DEFAULT_FIRMWARE_SHA256SUM_j7200-evm = "71f282ba6768ad3b603a17d30851cc621986c88311c174960a50196bfc79f85c"
> +DEFAULT_FIRMWARE_SHA256SUM_j7 = "d3fc9fbcfaf67ebd5a509e56ef30e9a54242c290baecfda15e7ff92c127738d0"
> +DEFAULT_FIRMWARE_SHA256SUM_j7200-evm = "674040e161cb4b87845fd527dea166a2dd25d0df9136aa6206d73a9240058c40"
>  DEFAULT_FIRMWARE_SHA256SUM_am65xx = "61e0be08bea8ab1055645bd96504a6a29c70318c5b277237dee9981cd94d7f79"
>  DEFAULT_FIRMWARE_SHA256SUM_am64xx = "1b44bccd20b767568e996e924a2ef18cabd1c3e16d3412629ff72d83b81b152f"
>  
> -- 
> 2.17.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
