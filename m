Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2920CE002A7
	for <meta-ti@yoctoproject.org>; Wed,  5 Feb 2014 15:31:56 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s15NVtRP007403
	for <meta-ti@yoctoproject.org>; Wed, 5 Feb 2014 17:31:55 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s15NVtML008096
	for <meta-ti@yoctoproject.org>; Wed, 5 Feb 2014 17:31:55 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 5 Feb 2014 17:31:55 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s15NVs5N006498;
	Wed, 5 Feb 2014 17:31:55 -0600
Date: Wed, 5 Feb 2014 18:31:54 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20140205233154.GC18784@edge>
References: <1391642718-24978-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1391642718-24978-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2] linux-keystone-rt: Add new recipe for build rt-kernel
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
X-List-Received-Date: Wed, 05 Feb 2014 23:31:57 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Feb 05, 2014 at 06:25:18PM -0500, Sam Nelson wrote:
> - Builds kernel tree with RT patches
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>

Ack.

Just to check in general for your kernels and SDKs - you don't want devicetree 
files to be in the /boot directory of your rootfs, right?


> ---
> Changed from previous patch
> * Added PV 3.10.10
> * Renamed linux-keystone-rt-3.10/defconfig
>   -->linux-keystone-rt/defconfig
> ---
> ---
>  recipes-kernel/linux/linux-keystone-rt/defconfig   |    1 +
>  ...-keystone_3.10.bb => linux-keystone-rt_3.10.bb} |    8 ++++----
>  2 files changed, 5 insertions(+), 4 deletions(-)
>  create mode 100644 recipes-kernel/linux/linux-keystone-rt/defconfig
>  copy recipes-kernel/linux/{linux-keystone_3.10.bb => linux-keystone-rt_3.10.bb} (76%)
> 
> diff --git a/recipes-kernel/linux/linux-keystone-rt/defconfig b/recipes-kernel/linux/linux-keystone-rt/defconfig
> new file mode 100644
> index 0000000..731bb00
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-keystone-rt/defconfig
> @@ -0,0 +1 @@
> +use-kernel-config=keystone2_fullrt_defconfig
> diff --git a/recipes-kernel/linux/linux-keystone_3.10.bb b/recipes-kernel/linux/linux-keystone-rt_3.10.bb
> similarity index 76%
> copy from recipes-kernel/linux/linux-keystone_3.10.bb
> copy to recipes-kernel/linux/linux-keystone-rt_3.10.bb
> index 2384ede..9c2f904 100644
> --- a/recipes-kernel/linux/linux-keystone_3.10.bb
> +++ b/recipes-kernel/linux/linux-keystone-rt_3.10.bb
> @@ -1,5 +1,5 @@
>  SECTION = "kernel"
> -DESCRIPTION = "Linux kernel for TI Keystone devices"
> +DESCRIPTION = "Linux RT kernel for TI Keystone devices"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
>  
> @@ -17,11 +17,11 @@ KERNEL_DEVICETREE_keystone-evm = "k2hk-evm.dtb"
>  
>  KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
>  
> -#This commit corresponds to "K2_LINUX_03.10.10_13.12"
> -SRCREV = "335d14b1c2ce23585835243126c6acba89067ecf"
> +#This commit corresponds to "K2_RT_LINUX_03.10.10_13.12"
> +SRCREV = "8fa9091d0f9c91a048a975ddebbf2f492e73bf61"
>  PV = "3.10.10"
>  
> -BRANCH = "master"
> +BRANCH = "master-rt"
>  SRC_URI = "git://git.ti.com/keystone-linux/linux.git;protocol=git;branch=${BRANCH}\
>             file://defconfig\
>             "
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

