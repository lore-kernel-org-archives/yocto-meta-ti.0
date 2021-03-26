Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.2020.1616785292541345461
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 Mar 2021 12:01:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E782540C82;
	Fri, 26 Mar 2021 19:01:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xA0pZywMW_vw; Fri, 26 Mar 2021 19:01:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BCA1C40952;
	Fri, 26 Mar 2021 19:01:29 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 231CA174567; Fri, 26 Mar 2021 15:01:29 -0400 (EDT)
Date: Fri, 26 Mar 2021 15:01:29 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: shiju@ti.com
Cc: meta-ti@lists.yoctoproject.org, Praneeth Bajjuri <praneeth@ti.com>
Subject: Re: [meta-ti] [dunfell/master PATCH] ti-rtos: update metadata and version of am64x rtos firmware
Message-ID: <20210326190129.GX18041@denix.org>
References: <20210326071732.5268-1-shiju@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210326071732.5268-1-shiju@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 26, 2021 at 12:47:32PM +0530, Shiju Sivasankaran via lists.yoctoproject.org wrote:
> updated rtos firmware
> am64xx: 07.03.00.13
> 
> rtos fw of am64x build and upload from mcu-plus-sdk repo.
> rtos fw of am65x, j7 and j7200 build and upload from pdk repo.
> a separate TI_RTOS_METADATA_SRCREV_am64xx for pining am64x fw
> from mcu-plus-sdk avoids syncing of builds from two different repos.
> 
> Signed-off-by: Shiju Sivasankaran <shiju@ti.com>
> ---

It seems you are using the same external WEBLINK location between coresdk and 
mcusdk.

Here's the latest location with mcusdk images:
https://downloads.ti.com/processor-sdk-rtos/esd/AM64X/firmware/07_03_00_13

Here's the latest location with coresdk images:
https://downloads.ti.com/processor-sdk-rtos/esd/AM64X/firmware/07_03_01_06

The difference is in version and mcusdk is lower than coresdk. So, it's very 
confusing and you have a chance of clashing eventually.


> v2 - typo in the commit-message corrected
> 
> All the FW are hosted on same repo processor-sdk/coresdk_rtos_releases. 
> But its only hosting purpose, these FW are builds from PDK (all device 
> except AM64x) and mcu-plus-sdk (AM64x alone) Similarly metadata.inc will 
> be used to get the version/urls details for all devices except AM64x and 
> mcusdk_metadata.inc is used for AM64x. Same metadata.inc for mcu-plus-sdk 
> is a big risk as any PDK build of AM64x can override this.
> 
> coresdk_rtos_releases  has 2 branches - master & next.  
> All metadata files and tags are applied on next and during RC period 
> coreSDK team merge next to master.  At the same time next-branch also 
> carry the metadata files from daily build as well.  During this merge 
> they make sure only release builds of all devices on that tag/commit, 
> as only release build points the FW url from external location.  
> If any daily build of any device happens in between the tagging and 
> as daily build has TI internal url for FW will spoil the purpose.  
> AM65x, J7 & J7200 builds of PSDK should have happen one after another 
> without any daily builds in between, this can be controlled as all these 
> are built from same codebase of PDK.  As AM64x builds from mcu-plus-sdk, 
> a different codebase, code-freeze and RC timing rarely match.  
> Rebuild of all devices and recipe updates will arises if builds from 
> both repo doesn't happen at same time. Separate TI_RTOS_METADATA_SRCREV_am64xx 
> is added to avoid this syncing of builds from two different repos.

Not convincing. You use separate metadata.inc files, and even though coresdk 
and mcusdk commits are interspersed, it's quite safe to use one latest commit 
for both. The way this system was designed is to be used with nightly builds 
where commit is AUTOREV-ed (from next branch) and should work the same with 
master branch as well.


>  recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 6 +++---
>  recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb | 1 +
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> index e85948b2..fe020aa3 100644
> --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -23,8 +23,8 @@ DEFAULT_RTOS_FAMILY = "jacinto"
>  DEFAULT_RTOS_VERSION = "07_03_00_21"
>  DEFAULT_RTOS_VERSION_DOT = "07.03.00.21"
>  
> -DEFAULT_RTOS_VERSION_am64xx = "07_03_00_03"
> -DEFAULT_RTOS_VERSION_DOT_am64xx = "07.03.00.03"
> +DEFAULT_RTOS_VERSION_am64xx = "07_03_00_13"
> +DEFAULT_RTOS_VERSION_DOT_am64xx = "07.03.00.13"
>  
>  DEFAULT_RTOS_VERSION_am65xx = "07_03_00_22"
>  DEFAULT_RTOS_VERSION_DOT_am65xx = "07.03.00.22"
> @@ -51,7 +51,7 @@ DEFAULT_FIRMWARE_SHA256SUM = "unknown"
>  DEFAULT_FIRMWARE_SHA256SUM_j7 = "fc7805ed3d6c1801efb2b85ac9af99a8657aa3a7a9327bc16a1163d566f11c2c"
>  DEFAULT_FIRMWARE_SHA256SUM_j7200-evm = "71f282ba6768ad3b603a17d30851cc621986c88311c174960a50196bfc79f85c"
>  DEFAULT_FIRMWARE_SHA256SUM_am65xx = "61e0be08bea8ab1055645bd96504a6a29c70318c5b277237dee9981cd94d7f79"
> -DEFAULT_FIRMWARE_SHA256SUM_am64xx = "bc2d3d603ad30006ea3fefa3e777c26c19b95ee6d6f5a630259009f2f5a4996b"
> +DEFAULT_FIRMWARE_SHA256SUM_am64xx = "0c43cea6ccaf45b3d7c48996f1c561e814a6e409a330da5d45877c82ce7a299a"
>  
>  # Use weak assignment for CORESDK_RTOS_* variables to use defaults if not yet set
>  CORESDK_RTOS_FAMILY ?= "${DEFAULT_RTOS_FAMILY}"
> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
> index 83e0e901..f052c627 100644
> --- a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
> @@ -19,6 +19,7 @@ PLAT_SFX_am64xx = "/am64x"
>  TI_RTOS_METADATA_URI ?= "git://git.ti.com/processor-sdk/coresdk_rtos_releases.git"
>  TI_RTOS_METADATA_PROTOCOL ?= "git"
>  TI_RTOS_METADATA_SRCREV ?= "3cda650c9e22eb4fd4eb5797ad998991a6124243"
> +TI_RTOS_METADATA_SRCREV_am64xx ?= "051de801b539f4acc6e7630684f9993e34332dde"
>  TI_RTOS_METADATA_BRANCH ?= "master"
>  TI_RTOS_METADATA_DIR ?= "${PLAT_SFX}"
>  TI_RTOS_METADATA_FILE ?= "${S}${TI_RTOS_METADATA_DIR}/metadata.inc"
> -- 
> 2.17.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
