Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 08764E0070F; Fri, 16 May 2014 12:01:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from arroyo.ext.ti.com (unknown [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 68920E00BA1
	for <meta-ti@yoctoproject.org>; Fri, 16 May 2014 12:00:52 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4GJ0pKG009249
	for <meta-ti@yoctoproject.org>; Fri, 16 May 2014 14:00:51 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4GJ0p1P029377
	for <meta-ti@yoctoproject.org>; Fri, 16 May 2014 14:00:51 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 16 May 2014 14:00:51 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4GJ0pV8008631;
	Fri, 16 May 2014 14:00:51 -0500
Date: Fri, 16 May 2014 15:00:51 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <hzhang@ti.com>
Message-ID: <20140516190051.GF18053@edge>
References: <1400259584-25188-1-git-send-email-hzhang@ti.com>
MIME-Version: 1.0
In-Reply-To: <1400259584-25188-1-git-send-email-hzhang@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] keystone: u-boot: rename tci6638 to k2hk evm config
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
X-List-Received-Date: Fri, 16 May 2014 19:01:11 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, May 16, 2014 at 12:59:44PM -0400, hzhang@ti.com wrote:
> From: Hao Zhang <hzhang@ti.com>

Ack.


> Rename U-boot "tci6638_evm_config" to "k2hk_evm_config" to align
> with DTB device name.
> ---
>  conf/machine/include/keystone.inc             |    2 +-
>  recipes-bsp/u-boot/u-boot-keystone_2013.01.bb |    6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/conf/machine/include/keystone.inc b/conf/machine/include/keystone.inc
> index b961ad3..63f069c 100644
> --- a/conf/machine/include/keystone.inc
> +++ b/conf/machine/include/keystone.inc
> @@ -12,7 +12,7 @@ MACHINE_KERNEL_PR = "r7"
>  
>  KERNEL_IMAGETYPE = "uImage"
>  
> -UBOOT_MACHINE = "tci6638_evm_config"
> +UBOOT_MACHINE = "k2hk_evm_config"
>  
>  UBOOT_ENTRYPOINT = "0x80008000"
>  UBOOT_LOADADDRESS = "0x80008000"
> diff --git a/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb b/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
> index 6717e62..5e5eb51 100644
> --- a/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
> +++ b/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
> @@ -4,10 +4,10 @@ DESCRIPTION = "u-boot bootloader for Multi-Core BU devices"
>  
>  COMPATIBLE_MACHINE = "keystone"
>  
> -PR = "r3+gitr${SRCPV}"
> +PR = "r4+gitr${SRCPV}"
>  
> -# Tag "K2_UBOOT_2013_01_14.03_02"
> -SRCREV = "0b9b4be2f3097b5bdc3b0ea7aa5e8f465097e365"
> +# Tag "K2_UBOOT_2013_01_14.05_16"
> +SRCREV = "fee500417b989fc9906d86e377b4d3d96033d54e"
>  BRANCH = "master"
>  
>  SRC_URI = "git://git.ti.com/keystone-linux/u-boot.git;protocol=git;branch=${BRANCH}"
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

