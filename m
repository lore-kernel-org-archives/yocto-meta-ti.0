Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5E9DFE00788
	for <meta-ti@yoctoproject.org>; Wed,  5 Feb 2014 11:45:24 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s15JjNrP018291
	for <meta-ti@yoctoproject.org>; Wed, 5 Feb 2014 13:45:23 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s15JjNqE017050
	for <meta-ti@yoctoproject.org>; Wed, 5 Feb 2014 13:45:23 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 5 Feb 2014 13:45:23 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s15JjNuc025329;
	Wed, 5 Feb 2014 13:45:23 -0600
Date: Wed, 5 Feb 2014 14:45:23 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20140205194522.GV18784@edge>
References: <1391541392-16928-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1391541392-16928-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v3] linux-keystone: Update to linux kernel version 3.10
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
X-List-Received-Date: Wed, 05 Feb 2014 19:45:27 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Feb 04, 2014 at 02:16:32PM -0500, Sam Nelson wrote:
> - Updated Source URL & version
> - Added device tree file
> - Added LOADADDR extra args
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> 
> ---
> Changes from last revision of patch
> - Added LOADADDR extra args
> - Name change to from 3.10.10--> 3.10

Ok, I think Chase and I have confused you a bit here...

Initially, you already had the recipe named as linux-keystone_3.10.bb and I 
made a comment that you might want to consider setting PV = "3.10.10" to 
indicate this stable version in the resulting package:

http://article.gmane.org/gmane.linux.embedded.yocto.meta-ti/3285

It wasn't probably very clear, since you then renamed the recipe to 
linux-keystone_3.10.10.bb and after another Chase' comment reverted back to 
linux-keystone_3.10.bb, but still there's no PV being set to the full version.

The best illustration may be to look at the change history of our 
linux-ti-staging_3.12.bb recipe:

http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/log/recipes-kernel/linux/linux-ti-staging_3.12.bb

Take a look at those commits, but few things to note:

1. it has _3.12 in the filename, so no renames for stable updates
2. it has actual PV = "3.12.9" which follows the stable version of kernel
3. when SRCREV is updated, but PV stays the same, you bump MACHINE_KERNEL_PR
4. when SRCREV is updated along with PV, you want to reset MACHINE_KERNEL_PR

-- 
Denys


> ---
> ---
>  .../defconfig                                      |    0
>  ...ux-keystone_3.8.4.bb => linux-keystone_3.10.bb} |   26 +++++++++++---------
>  2 files changed, 15 insertions(+), 11 deletions(-)
>  rename recipes-kernel/linux/{linux-keystone-3.8.4 => linux-keystone-3.10}/defconfig (100%)
>  rename recipes-kernel/linux/{linux-keystone_3.8.4.bb => linux-keystone_3.10.bb} (59%)
> 
> diff --git a/recipes-kernel/linux/linux-keystone-3.8.4/defconfig b/recipes-kernel/linux/linux-keystone-3.10/defconfig
> similarity index 100%
> rename from recipes-kernel/linux/linux-keystone-3.8.4/defconfig
> rename to recipes-kernel/linux/linux-keystone-3.10/defconfig
> diff --git a/recipes-kernel/linux/linux-keystone_3.8.4.bb b/recipes-kernel/linux/linux-keystone_3.10.bb
> similarity index 59%
> rename from recipes-kernel/linux/linux-keystone_3.8.4.bb
> rename to recipes-kernel/linux/linux-keystone_3.10.bb
> index d176f14..3ddd195 100644
> --- a/recipes-kernel/linux/linux-keystone_3.8.4.bb
> +++ b/recipes-kernel/linux/linux-keystone_3.10.bb
> @@ -3,26 +3,30 @@ DESCRIPTION = "Linux kernel for TI Keystone devices"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
>  
> +COMPATIBLE_MACHINE = "keystone"
> +
>  inherit kernel
>  
>  require recipes-kernel/linux/linux-dtb.inc
>  require recipes-kernel/linux/setup-defconfig.inc
>  
> +MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
> +PR = "${MACHINE_KERNEL_PR}"
> +
>  KERNEL_DEVICETREE_keystone-evm = "k2hk-evm.dtb"
>  
> -COMPATIBLE_MACHINE = "keystone"
> +KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
>  
> -S = "${WORKDIR}/git"
> +#This commit corresponds to "K2_LINUX_03.10.10_13.12"
> +SRCREV = "335d14b1c2ce23585835243126c6acba89067ecf"
>  
> -BRANCH = "sept-2013/master"
> +BRANCH = "master"
>  
> -# This commit corresponds to K2_LINUX_03.08.04_13.09 tag
> -SRCREV = "20a48dc5309c4434650baef2b6072b5f1016f946"
> +SRC_URI = "git://git.ti.com/keystone-linux/linux.git;protocol=git;branch=${BRANCH}\
> +           file://defconfig\
> +           "
>  
> -# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
> -MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
> -PR = "${MACHINE_KERNEL_PR}"
> +S = "${WORKDIR}/git"
> +
> +RDEPENDS_kernel-base = ""
>  
> -SRC_URI = "git://arago-project.org/git/projects/linux-keystone.git;protocol=git;branch=${BRANCH}\
> -           file://defconfig\
> -          "
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

