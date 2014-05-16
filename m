Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C15F1E00BA1; Fri, 16 May 2014 12:31:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from devils.ext.ti.com (unknown [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B3F0AE006EC
	for <meta-ti@yoctoproject.org>; Fri, 16 May 2014 12:31:20 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4GJVJ6E006696
	for <meta-ti@yoctoproject.org>; Fri, 16 May 2014 14:31:19 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4GJVJTw017610
	for <meta-ti@yoctoproject.org>; Fri, 16 May 2014 14:31:19 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 16 May 2014 14:31:19 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4GJVJqj027873;
	Fri, 16 May 2014 14:31:19 -0500
Date: Fri, 16 May 2014 15:31:19 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <hzhang@ti.com>
Message-ID: <20140516193118.GJ18053@edge>
References: <1400268148-24770-1-git-send-email-hzhang@ti.com>
MIME-Version: 1.0
In-Reply-To: <1400268148-24770-1-git-send-email-hzhang@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 3/3] keystone: k2e-evm config: add k2e-evm machine config
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
X-List-Received-Date: Fri, 16 May 2014 19:31:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, May 16, 2014 at 03:22:28PM -0400, hzhang@ti.com wrote:
> From: Hao Zhang <hzhang@ti.com>
> 
> Add a new k2e-evm machine config for Keystone II SoC family.
> 
> Signed-off-by: Hao Zhang <hzhang@ti.com>
> ---
>  conf/machine/{k2hk-evm.conf => k2e-evm.conf} |    8 ++++----
>  recipes-bsp/boot-monitor/boot-monitor_git.bb |    2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
>  copy conf/machine/{k2hk-evm.conf => k2e-evm.conf} (79%)

Ok, this one is much better to review! Not sure why #2 wasn't done like this.

I mostly like it. Still the same comment about COMPATIBLE_MACHINE below for 
the boot-monitor.


> diff --git a/conf/machine/k2hk-evm.conf b/conf/machine/k2e-evm.conf
> similarity index 79%
> copy from conf/machine/k2hk-evm.conf
> copy to conf/machine/k2e-evm.conf
> index 2885335..551587f 100644
> --- a/conf/machine/k2hk-evm.conf
> +++ b/conf/machine/k2e-evm.conf
> @@ -1,12 +1,12 @@
>  #@TYPE: Machine
> -#@NAME: Keystone 2 machine
> -#@DESCRIPTION: Machine configuration for the TI Keystone 2
> +#@NAME: Keystone 2 K2E machine
> +#@DESCRIPTION: Machine configuration for the TI Keystone 2 K2E EVM
>  
>  require conf/machine/include/keystone.inc
>  
> -UBOOT_MACHINE = "k2hk_evm_config"
> +UBOOT_MACHINE = "k2e_evm_config"
>  
> -BOOT_MONITOR_MAKE_TARGET = "k2hk"
> +BOOT_MONITOR_MAKE_TARGET = "k2e"
>  
>  IMAGE_FSTYPES += "ubi tar.gz cpio"
>  
> diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
> index 0761d83..b3aa806 100644
> --- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
> +++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
> @@ -8,7 +8,7 @@ BOOT_MONITOR_IMAGE  ?= "skern-${MACHINE}.bin"
>  
>  LIC_FILES_CHKSUM = "file://COPYING;md5=25fe219a6febf6e5bb45beda1b2eb315"
>  
> -COMPATIBLE_MACHINE = "k2hk-evm|k2l-evm"
> +COMPATIBLE_MACHINE = "k2hk-evm|k2l-evm|k2e-evm"

Why can't use use the SOC family here:
COMPATIBLE_MACHINE = "keystone"


>  SRC_URI = "git://git.ti.com/keystone-linux/boot-monitor.git;protocol=git;branch=${BRANCH}"
>  
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

