Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B8119E00BA1; Fri, 16 May 2014 12:56:03 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 11178E006EC
	for <meta-ti@yoctoproject.org>; Fri, 16 May 2014 12:56:02 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4GJu18u020837
	for <meta-ti@yoctoproject.org>; Fri, 16 May 2014 14:56:01 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4GJu1FW002951
	for <meta-ti@yoctoproject.org>; Fri, 16 May 2014 14:56:01 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 16 May 2014 14:56:01 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4GJu1Gg022495;
	Fri, 16 May 2014 14:56:01 -0500
Date: Fri, 16 May 2014 15:56:00 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Hao Zhang <hzhang@ti.com>
Message-ID: <20140516195600.GN18053@edge>
References: <1400268135-24694-1-git-send-email-hzhang@ti.com>
	<20140516193355.GK18053@edge> <537669BF.1000706@ti.com>
MIME-Version: 1.0
In-Reply-To: <537669BF.1000706@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/3] keystone: machine config: change machine config name from keystone-evm to k2hk-evm
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
X-List-Received-Date: Fri, 16 May 2014 19:56:03 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, May 16, 2014 at 03:40:47PM -0400, Hao Zhang wrote:
> On 5/16/2014 3:33 PM, Denys Dmytriyenko wrote:
> > On Fri, May 16, 2014 at 03:22:15PM -0400, hzhang@ti.com wrote:
> >> From: Hao Zhang <hzhang@ti.com>
> >>
> >> Keystone II SOC family has multiple devices and EVMs: k2hk, k2l
> >> and k2e, each EVM should have a separate machine config, and share
> >> the common keystone SOC family.
> > 
> > It's better. But I don't see you adding other machines to the kernel recipe. 
> > Is it correct?
> > 
> > 
> We have not pushed the Linux k2l/K2e changes to external git yet,
> internally we will add below append to meta-mcsdk:
> KERNEL_DEVICETREE_k2l-evm = "k2l-evm.dtb"
> KERNEL_DEVICETREE_k2e-evm = "k2e-evm.dtb"

Ok, do you plan on making those changes public? Otherwise nobody will be able 
to build those other 2 machines outside of your setup...


> >> Signed-off-by: Hao Zhang <hzhang@ti.com>
> >> ---
> >>  conf/machine/{keystone-evm.conf => k2hk-evm.conf} |    0
> >>  recipes-bsp/boot-monitor/boot-monitor_git.bb      |    2 +-
> >>  recipes-kernel/linux/linux-keystone-rt_3.10.bb    |    2 +-
> >>  recipes-kernel/linux/linux-keystone_3.10.bb       |    2 +-
> >>  4 files changed, 3 insertions(+), 3 deletions(-)
> >>  rename conf/machine/{keystone-evm.conf => k2hk-evm.conf} (100%)
> >>
> >> diff --git a/conf/machine/keystone-evm.conf b/conf/machine/k2hk-evm.conf
> >> similarity index 100%
> >> rename from conf/machine/keystone-evm.conf
> >> rename to conf/machine/k2hk-evm.conf
> >> diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
> >> index 7c5e9cf..0b559fa 100644
> >> --- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
> >> +++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
> >> @@ -9,7 +9,7 @@ BOOT_MONITOR_MAKE_TARGET  ?= "all"
> >>  
> >>  LIC_FILES_CHKSUM = "file://COPYING;md5=25fe219a6febf6e5bb45beda1b2eb315"
> >>  
> >> -COMPATIBLE_MACHINE = "keystone-evm"
> >> +COMPATIBLE_MACHINE = "k2hk-evm"
> >>  
> >>  SRC_URI = "git://git.ti.com/keystone-linux/boot-monitor.git;protocol=git;branch=${BRANCH}"
> >>  
> >> diff --git a/recipes-kernel/linux/linux-keystone-rt_3.10.bb b/recipes-kernel/linux/linux-keystone-rt_3.10.bb
> >> index cbd02d6..eb4bbd2 100644
> >> --- a/recipes-kernel/linux/linux-keystone-rt_3.10.bb
> >> +++ b/recipes-kernel/linux/linux-keystone-rt_3.10.bb
> >> @@ -13,7 +13,7 @@ require recipes-kernel/linux/setup-defconfig.inc
> >>  MACHINE_KERNEL_PR_append = "c+gitr${SRCPV}"
> >>  PR = "${MACHINE_KERNEL_PR}"
> >>  
> >> -KERNEL_DEVICETREE_keystone-evm = "k2hk-evm.dtb"
> >> +KERNEL_DEVICETREE_k2hk-evm = "k2hk-evm.dtb"
> >>  
> >>  KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
> >>  
> >> diff --git a/recipes-kernel/linux/linux-keystone_3.10.bb b/recipes-kernel/linux/linux-keystone_3.10.bb
> >> index 54cb86a..93b5481 100644
> >> --- a/recipes-kernel/linux/linux-keystone_3.10.bb
> >> +++ b/recipes-kernel/linux/linux-keystone_3.10.bb
> >> @@ -13,7 +13,7 @@ require recipes-kernel/linux/setup-defconfig.inc
> >>  MACHINE_KERNEL_PR_append = "c+gitr${SRCPV}"
> >>  PR = "${MACHINE_KERNEL_PR}"
> >>  
> >> -KERNEL_DEVICETREE_keystone-evm = "k2hk-evm.dtb"
> >> +KERNEL_DEVICETREE_k2hk-evm = "k2hk-evm.dtb"
> >>  
> >>  KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
> >>  
> >> -- 
> >> 1.7.9.5
> >>
> >> -- 
> >> _______________________________________________
> >> meta-ti mailing list
> >> meta-ti@yoctoproject.org
> >> https://lists.yoctoproject.org/listinfo/meta-ti
> 

