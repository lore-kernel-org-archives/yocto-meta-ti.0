Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBCD1C7619A
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 19:50:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.24866.1681242596913122621
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Apr 2023 12:49:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1E37A40C90;
	Tue, 11 Apr 2023 19:49:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UfwK3pew5IN8; Tue, 11 Apr 2023 19:49:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EA66A40C13;
	Tue, 11 Apr 2023 19:49:53 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2B7A81637FE; Tue, 11 Apr 2023 15:49:16 -0400 (EDT)
Date: Tue, 11 Apr 2023 15:49:16 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH v2 2/5] linux-ti-mainline:
 Remove ti-upstream-tools
Message-ID: <20230411194916.GX9226@denix.org>
References: <20230411174037.32244-1-afd@ti.com>
 <20230411174037.32244-2-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411174037.32244-2-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Apr 2023 19:50:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16355

On Tue, Apr 11, 2023 at 12:40:34PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> Mainline should test the mainline kernel as it is, not with out-of-tree
> changes like new DTB/DTBOs. Use only upstream DTB/DTBOs. As that was the
> last thing provided by ti-upstream-tools, remove it here.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  .../recipes-kernel/linux/linux-ti-mainline_git.bb     | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
> index 7d948a85..d0f1b4e2 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
> @@ -1,5 +1,5 @@
>  SECTION = "kernel"
> -SUMMARY = "Mainline Linux kernel for TI devices (with ti-upstream-tools)"
> +SUMMARY = "Mainline Linux kernel for TI devices"
>  LICENSE = "GPL-2.0-only"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
>  
> @@ -15,9 +15,6 @@ KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
>  
>  S = "${WORKDIR}/git"
>  
> -BRANCH = "master"
> -TOOLS_BRANCH = "master"
> -
>  # 5.15 Mainline version
>  SRCREV = "8bb7eca972ad531c9b149c0a51ab43a417385813"
>  PV = "5.15+git${SRCPV}"
> @@ -28,12 +25,11 @@ PR = "${MACHINE_KERNEL_PR}"
>  
>  KERNEL_GIT_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git"
>  KERNEL_GIT_PROTOCOL = "https"
> +KERNEL_GIT_BRANCH = "master"
>  SRC_URI += " \
> -    ${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH};name=linux \
> -    git://git.ti.com/git/ti-linux-kernel/ti-upstream-tools.git;branch=${TOOLS_BRANCH};protocol=${KERNEL_GIT_PROTOCOL};name=ti-upstream-tools;destsuffix=git/ti-upstream-tools \
> +	${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${KERNEL_GIT_BRANCH};name=linux \
>  "
>  
> -SRCREV_ti-upstream-tools = "0f60697843bba6f8d721b14da92b1652563ccb95"
>  SRCREV_FORMAT = "linux"

Remove SRCREV_FORMAT that is used for multi-SCM recipes, as well as 
";name=linux" from SRC_URI above.


>  DEFCONFIG_NAME = "multi_v7_defconfig"
> @@ -43,7 +39,6 @@ KERNEL_CONFIG_COMMAND = "oe_runmake -C ${S} O=${B} ${DEFCONFIG_NAME}"
>  
>  kernel_do_compile:append() {
>  	oe_runmake dtbs CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}

Are you keeping "make dtbs" to build ALL DTBs from the kernel? Same story as 
with patch #5 for linux-ti-next - KERNEL_DEVICETREE has a list of upstreamed 
DTBs that will be built automatically, so above line can also be removed.
(though j784s4-evm has an empty KERNEL_DEVICETREE - nothing got upstreamed?)


> -	oe_runmake -C ${S}/ti-upstream-tools LINUX=${S} DTC=${B}/scripts/dtc/dtc O=${B} CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
>  }
>  
>  do_shared_workdir:prepend() {
> -- 
> 2.39.2

