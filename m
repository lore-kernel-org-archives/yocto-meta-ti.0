Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EBB26E0127D
	for <meta-ti@yoctoproject.org>; Tue,  7 May 2013 15:45:03 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r47MiwYF009528;
	Tue, 7 May 2013 17:44:58 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r47MiwjX025634;
	Tue, 7 May 2013 17:44:58 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 7 May 2013 17:44:58 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r47Miwju019475;
	Tue, 7 May 2013 17:44:58 -0500
Date: Tue, 7 May 2013 18:44:58 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <maxin.john@enea.com>
Message-ID: <20130507224458.GK12982@edge>
References: <1367940866-5055-1-git-send-email-maxin.john@enea.com>
MIME-Version: 1.0
In-Reply-To: <1367940866-5055-1-git-send-email-maxin.john@enea.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] keystone-evm: upgrade kernel to 3.8.4
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
X-List-Received-Date: Tue, 07 May 2013 22:45:04 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Maxin,

Thank you for your contribution! Our developers were also working on the 
kernel upgrade changes and I was waiting for their recipe patches to be sent 
to the list. Sorry for any misunderstanding. Hope to see more contributions 
from you in the future.

-- 
Denys


On Tue, May 07, 2013 at 05:34:26PM +0200, maxin.john@enea.com wrote:
> From: "Maxin B. John" <maxin.john@enea.com>
> 
> Update to latest supported kernel version for TI keystone-evm.
> 
> Signed-off-by: Maxin B. John <maxin.john@enea.com>
> ---
>  conf/machine/include/keystone.inc                               |    2 +-
>  .../{linux-keystone-3.6.6 => linux-keystone-3.8.4}/defconfig    |    7 +++++++
>  .../linux/{linux-keystone_3.6.6.bb => linux-keystone_3.8.4.bb}  |    2 +-
>  3 files changed, 9 insertions(+), 2 deletions(-)
>  rename recipes-kernel/linux/{linux-keystone-3.6.6 => linux-keystone-3.8.4}/defconfig (96%)
>  rename recipes-kernel/linux/{linux-keystone_3.6.6.bb => linux-keystone_3.8.4.bb} (90%)
> 
> diff --git a/conf/machine/include/keystone.inc b/conf/machine/include/keystone.inc
> index 72e71bf..e14c26c 100644
> --- a/conf/machine/include/keystone.inc
> +++ b/conf/machine/include/keystone.inc
> @@ -8,7 +8,7 @@ PREFERRED_PROVIDER_virtual/bootloader = "u-boot-keystone"
>  PREFERRED_PROVIDER_u-boot = "u-boot-keystone"
>  
>  # Increase this everytime you change something in the kernel
> -MACHINE_KERNEL_PR = "r6"
> +MACHINE_KERNEL_PR = "r7"
>  
>  KERNEL_IMAGETYPE = "uImage"
>  
> diff --git a/recipes-kernel/linux/linux-keystone-3.6.6/defconfig b/recipes-kernel/linux/linux-keystone-3.8.4/defconfig
> similarity index 96%
> rename from recipes-kernel/linux/linux-keystone-3.6.6/defconfig
> rename to recipes-kernel/linux/linux-keystone-3.8.4/defconfig
> index d326a41..d2939ef 100644
> --- a/recipes-kernel/linux/linux-keystone-3.6.6/defconfig
> +++ b/recipes-kernel/linux/linux-keystone-3.8.4/defconfig
> @@ -20,6 +20,10 @@ CONFIG_MODULE_UNLOAD=y
>  CONFIG_MODULE_FORCE_UNLOAD=y
>  CONFIG_MODVERSIONS=y
>  CONFIG_ARCH_KEYSTONE=y
> +CONFIG_ARM_LPAE=y
> +CONFIG_PCI=y
> +CONFIG_TI_KEYSTONE_PCIE=y
> +CONFIG_PCI_REALLOC_ENABLE_AUTO=y
>  CONFIG_SMP=y
>  CONFIG_ARM_ARCH_TIMER=y
>  CONFIG_PREEMPT__LL=y
> @@ -108,6 +112,8 @@ CONFIG_IP6_NF_IPTABLES=m
>  CONFIG_IP_SCTP=y
>  CONFIG_VLAN_8021Q=y
>  CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
> +CONFIG_DEVTMPFS=y
> +CONFIG_DEVTMPFS_MOUNT=y
>  CONFIG_CMA=y
>  CONFIG_MTD=y
>  CONFIG_MTD_TESTS=m
> @@ -153,6 +159,7 @@ CONFIG_USB_GADGET=y
>  CONFIG_DMADEVICES=y
>  CONFIG_UIO=y
>  CONFIG_UIO_PDRV=y
> +CONFIG_VIRTIO_KEYSTONE=y
>  CONFIG_COMMON_CLK_DEBUG=y
>  CONFIG_REMOTEPROC_USER=y
>  CONFIG_MEMORY=y
> diff --git a/recipes-kernel/linux/linux-keystone_3.6.6.bb b/recipes-kernel/linux/linux-keystone_3.8.4.bb
> similarity index 90%
> rename from recipes-kernel/linux/linux-keystone_3.6.6.bb
> rename to recipes-kernel/linux/linux-keystone_3.8.4.bb
> index 4dd5d15..31138c1 100644
> --- a/recipes-kernel/linux/linux-keystone_3.6.6.bb
> +++ b/recipes-kernel/linux/linux-keystone_3.8.4.bb
> @@ -7,7 +7,7 @@ MACHINE_KERNEL_PR_append = "a"
>  CORTEXA8FIXUP = "no"
>  
>  # The tree tends to rebase, use literal stable tags
> -SRCREV = "DEV.MCSDK-03.06.06.07"
> +SRCREV = "DEV.MCSDK-03.08.04.10"
>  
>  SRC_URI = "git://arago-project.org/git/projects/linux-keystone.git;protocol=git \
>             file://defconfig \
> -- 
> 1.7.10.4
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

