Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.13342.1604677799053011303
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 06 Nov 2020 07:49:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 198.145.29.25, mailfrom: denis@denix.org)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.yoctoproject.org (Postfix) with ESMTPS id D0DE838C0858
	for <meta-ti@yoctoproject.org>; Fri,  6 Nov 2020 07:49:57 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A695140AFF;
	Fri,  6 Nov 2020 15:49:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bzpmGk27aXR0; Fri,  6 Nov 2020 15:49:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7D8F040A89;
	Fri,  6 Nov 2020 15:49:55 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D77FE1744DF; Fri,  6 Nov 2020 10:49:54 -0500 (EST)
Date: Fri, 6 Nov 2020 10:49:54 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: dmurphy@ti.com
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [dunfell/master] PATCH 2/2] ti-sci-fw: Update to 2020.08b system firmware
Message-ID: <20201106154954.GI19155@denix.org>
References: <20201106151341.29928-1-dmurphy@ti.com>
 <20201106151341.29928-2-dmurphy@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201106151341.29928-2-dmurphy@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 06, 2020 at 09:13:41AM -0600, Dan Murphy via lists.yoctoproject.org wrote:
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  recipes-bsp/ti-sci-fw/ti-sci-fw.inc    | 6 +++---
>  recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 1 +
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> index 00e611876733..24de33d67008 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> @@ -3,11 +3,11 @@ SUMMARY = "TI SCI firmware (SYSFW)"
>  LICENSE = "TI-TFL"
>  LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
>  
> -PV = "2020.08-rc3"
> +PV = "2020.08b"
>  
> -SRCREV = "8a22979dc944f6f4f867e2ac637c51a317efaacd"
> +SRCREV = "f5685b5980d93709e20466ffa19145ffd83b4ca4"
>  BRANCH ?= "ti-linux-firmware"
> -SRCREV_imggen = "36fe2d183a734f65b9adbd3097e5d51a6f931521"
> +SRCREV_imggen = "7b4fe13d642d69a559724349aede4817891008a7"
>  SRCREV_FORMAT = "imggen"
>  
>  SRC_URI = " \
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> index 1239b278a1a7..92992440c352 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> @@ -19,6 +19,7 @@ SYSFW_SOC ?= "unknown"
>  SYSFW_CONFIG ?= "unknown"
>  
>  SYSFW_PREFIX = "ti-sci-firmware"
> +SYSFW_PREFIX_append_j7 = "ti-fs-firmware"

You probably don't want _append_j7 here, but just _j7 override...


>  SYSFW_SUFFIX ?= "unknown"
>  
>  SYSFW_BASE = "${SYSFW_PREFIX}-${SYSFW_SOC}-${SYSFW_SUFFIX}"
> -- 
> 2.29.2
> 

> 
> 
> 

