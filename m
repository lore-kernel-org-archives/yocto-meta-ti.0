Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 800E9E01601
	for <meta-ti@yoctoproject.org>; Wed, 25 Sep 2013 12:07:27 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8PJ7RcD011176
	for <meta-ti@yoctoproject.org>; Wed, 25 Sep 2013 14:07:27 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8PJ7RX1002765
	for <meta-ti@yoctoproject.org>; Wed, 25 Sep 2013 14:07:27 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 25 Sep 2013 14:07:26 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8PJ7Qqn008640	for
	<meta-ti@yoctoproject.org>; Wed, 25 Sep 2013 14:07:26 -0500
Date: Wed, 25 Sep 2013 15:07:26 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Message-ID: <20130925190726.GV6590@edge>
References: <1380135454-5044-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1380135454-5044-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] linux-ti-staging: fix missing kernel image in /boot
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Sep 2013 19:07:27 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Sep 25, 2013 at 02:57:34PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> We rely on kernel-base having run-time dependency on kernel-image, which
> normally would pull uImage/zImage into /boot directory of rootfs.
> Thanks to Chase for pointing me in the right direction by noticing that our
> addition of cm3 firmware breaks that dependency for ti33x.
> The reason for that is RDEPENDS is being conditionally assigned with ?=
> in kernel.bbclass and using += with that is unsafe/racy and _append should

A tiny clarification I lost here - using += together with machine-override on 
top of that ?= conditional is what is broken. _append makes it all work :)

> be used instead.
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-kernel/linux/linux-ti-staging_3.8.bb | 2 +-
>  recipes-kernel/linux/linux-ti-staging_git.bb | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-ti-staging_3.8.bb b/recipes-kernel/linux/linux-ti-staging_3.8.bb
> index fd7b671..833fb48 100644
> --- a/recipes-kernel/linux/linux-ti-staging_3.8.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_3.8.bb
> @@ -11,7 +11,7 @@ require recipes-kernel/linux/setup-defconfig.inc
>  
>  # Add a run-time dependency for the PM firmware to be installed
>  # on the target file system.
> -RDEPENDS_kernel-base_ti33x += "am33x-cm3 am33x-cm3-initscript"
> +RDEPENDS_kernel-base_append_ti33x = " am33x-cm3 am33x-cm3-initscript"
>  
>  # Default is to package all dtb files for ti33x devices unless building
>  # for the specific beaglebone machine.
> diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_git.bb
> index e903215..778ea7f 100644
> --- a/recipes-kernel/linux/linux-ti-staging_git.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_git.bb
> @@ -10,7 +10,7 @@ require recipes-kernel/linux/setup-defconfig.inc
>  
>  # Add a run-time dependency for the PM firmware to be installed
>  # on the target file system.
> -RDEPENDS_kernel-base_ti33x += "am33x-cm3 am33x-cm3-initscript"
> +RDEPENDS_kernel-base_append_ti33x = " am33x-cm3 am33x-cm3-initscript"
>  
>  # Default is to package all dtb files for ti33x devices unless building
>  # for the specific beaglebone machine.
> -- 
> 1.8.3.2
> 

