Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 14C4AE0049C
	for <meta-ti@yoctoproject.org>; Thu, 30 Jan 2014 23:06:37 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0V76afa004153
	for <meta-ti@yoctoproject.org>; Fri, 31 Jan 2014 01:06:36 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0V76ai4014516
	for <meta-ti@yoctoproject.org>; Fri, 31 Jan 2014 01:06:36 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 31 Jan 2014 01:06:36 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0V76ZqW022390;
	Fri, 31 Jan 2014 01:06:36 -0600
Date: Fri, 31 Jan 2014 02:06:35 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20140131070635.GJ6814@edge>
References: <1391145789-9460-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1391145789-9460-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2] linux-keystone: Create recipe for linux-keystone kernel version 3.10
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
X-List-Received-Date: Fri, 31 Jan 2014 07:06:40 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Sam,

This is much better! And easier to compare against the previous version too. 
I'll take it as is, although there are couple very minor comments below...


On Fri, Jan 31, 2014 at 12:23:09AM -0500, Sam Nelson wrote:
> - Updated Source URL & version
> - Added device tree file
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> 
> -----

Should be exactly "---" as the one below or instead of that, so it won't go 
into the commit message.


> Changes from last patch
> Renamed recipe from 3.10--> 3.10.10
> Removed directory path from dtb file
> Removed do_deploy_append
> ----
> ---
>  .../defconfig                                      |    0
>  ...keystone_3.8.4.bb => linux-keystone_3.10.10.bb} |   25 +++++++++++---------
>  2 files changed, 14 insertions(+), 11 deletions(-)
>  rename recipes-kernel/linux/{linux-keystone-3.8.4 => linux-keystone-3.10.10}/defconfig (100%)
>  rename recipes-kernel/linux/{linux-keystone_3.8.4.bb => linux-keystone_3.10.10.bb} (50%)
> 
> diff --git a/recipes-kernel/linux/linux-keystone-3.8.4/defconfig b/recipes-kernel/linux/linux-keystone-3.10.10/defconfig
> similarity index 100%
> rename from recipes-kernel/linux/linux-keystone-3.8.4/defconfig
> rename to recipes-kernel/linux/linux-keystone-3.10.10/defconfig
> diff --git a/recipes-kernel/linux/linux-keystone_3.8.4.bb b/recipes-kernel/linux/linux-keystone_3.10.10.bb
> similarity index 50%
> rename from recipes-kernel/linux/linux-keystone_3.8.4.bb
> rename to recipes-kernel/linux/linux-keystone_3.10.10.bb
> index d176f14..a5c113e 100644
> --- a/recipes-kernel/linux/linux-keystone_3.8.4.bb
> +++ b/recipes-kernel/linux/linux-keystone_3.10.10.bb
> @@ -3,26 +3,29 @@ DESCRIPTION = "Linux kernel for TI Keystone devices"
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
> +MACHINE_KERNEL_PR_append = "a"

1. You might want to also add "+gitr${SRCPV}" so git commit ID gets into 
package version and file name. Useful when you have several builds from 
different points in git which are all 3.10.10 etc. But it's up to you.

2. Having PR = "${MACHINE_KERNEL_PR}" is also useful for others, when not 
using meta-openembedded layer and its machine_kernel_pr.bbclass...


> +
> +CORTEXA8FIXUP = "no"

I don't think this is needed any more...


>  KERNEL_DEVICETREE_keystone-evm = "k2hk-evm.dtb"
>  
> -COMPATIBLE_MACHINE = "keystone"
> +#This commit corresponds to "K2_LINUX_03.10.10_13.12"
> +SRCREV = "335d14b1c2ce23585835243126c6acba89067ecf"
>  
> -S = "${WORKDIR}/git"
> +BRANCH = "master"
>  
> -BRANCH = "sept-2013/master"
> +SRC_URI = "git://git.ti.com/keystone-linux/linux.git;protocol=git;branch=${BRANCH}\
> +           file://defconfig\
> +           "
>  
> -# This commit corresponds to K2_LINUX_03.08.04_13.09 tag
> -SRCREV = "20a48dc5309c4434650baef2b6072b5f1016f946"
> +S = "${WORKDIR}/git"
>  
> -# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
> -MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
> -PR = "${MACHINE_KERNEL_PR}"
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

