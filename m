Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA981C4332F
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 19:26:46 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.421.1665689205246436264
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Oct 2022 12:26:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AD87940DD4;
	Thu, 13 Oct 2022 19:26:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ohyJn_8eNBuO; Thu, 13 Oct 2022 19:26:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 841A840DBD;
	Thu, 13 Oct 2022 19:26:42 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5227D174A39; Thu, 13 Oct 2022 15:26:40 -0400 (EDT)
Date: Thu, 13 Oct 2022 15:26:40 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH] trusted-firmware-a: work around RWX
 permission error on segment
Message-ID: <20221013192640.GK22689@denix.org>
References: <20221013182215.8751-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221013182215.8751-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Oct 2022 19:26:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15165

On Thu, Oct 13, 2022 at 01:22:15PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> Binutils 2.39 now warns when a segment has RXW permissions[1]:
> 
>   aarch64-none-elf-ld.bfd: warning: bl31.elf has a LOAD segment with RWX permissions
> 
> However, TF-A passes --fatal-warnings to LD, so this is a build failure.
> 
> There is a ticket filed upstream[2], so until that is resolved we can
> disable this warning.
> 
> [1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
> [2] https://developer.trustedfirmware.org/T996
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> 
> Adapted from the above patch[3] in meta-arm, but we cannot use that patch as
> we are on an older SRCREV and the Makefile has changed.
> 
> [3] https://git.yoctoproject.org/meta-arm/commit/meta-arm/recipes-bsp?id=977c5222d8c2f6f6c7e522e480a6e4cd40ba32d7
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  .../files/rwx-segments-ti.patch               | 45 +++++++++++++++++++
>  .../trusted-firmware-a_%.bbappend             |  3 ++
>  2 files changed, 48 insertions(+)
>  create mode 100644 meta-ti-bsp/recipes-bsp/trusted-firmware-a/files/rwx-segments-ti.patch
> 
> diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/files/rwx-segments-ti.patch b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/files/rwx-segments-ti.patch
> new file mode 100644
> index 00000000..826a4b32
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/files/rwx-segments-ti.patch
> @@ -0,0 +1,45 @@
> +Binutils 2.39 now warns when a segment has RXW permissions[1]:
> +
> +aarch64-none-elf-ld.bfd: warning: bl31.elf has a LOAD segment with RWX
> +permissions
> +
> +However, TF-A passes --fatal-warnings to LD, so this is a build failure.
> +
> +There is a ticket filed upstream[2], so until that is resolved just
> +remove --fatal-warnings.
> +
> +[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
> +[2] https://developer.trustedfirmware.org/T996
> +
> +Upstream-Status: Inappropriate
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +
> +
> +Adapted from the above patch in meta-arm, but we cannot use that patch as
> +we are on an older SRCREV and the Makefile has changed.
> +
> +Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> +
> +
> +diff --git a/Makefile b/Makefile
> +index 3941f8698..13bbac348 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -421,7 +421,7 @@ TF_LDFLAGS		+=	$(TF_LDFLAGS_$(ARCH))
> + # LD = gcc (used when GCC LTO is enabled)
> + else ifneq ($(findstring gcc,$(notdir $(LD))),)
> + # Pass ld options with Wl or Xlinker switches
> +-TF_LDFLAGS		+=	-Wl,--fatal-warnings -O1
> ++TF_LDFLAGS		+=	-O1
> + TF_LDFLAGS		+=	-Wl,--gc-sections
> + ifeq ($(ENABLE_LTO),1)
> + 	ifeq (${ARCH},aarch64)
> +@@ -439,7 +439,7 @@ TF_LDFLAGS		+=	$(subst --,-Xlinker --,$(TF_LDFLAGS_$(ARCH)))
> + 
> + # LD = gcc-ld (ld) or llvm-ld (ld.lld) or other
> + else
> +-TF_LDFLAGS		+=	--fatal-warnings -O1
> ++TF_LDFLAGS		+=	-O1
> + TF_LDFLAGS		+=	--gc-sections
> + # ld.lld doesn't recognize the errata flags,
> + # therefore don't add those in that case
> diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> index 14463846..146dbec4 100644
> --- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> +++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> @@ -6,6 +6,9 @@ TFA_BUILD_TARGET:k3 = "all"
>  TFA_INSTALL_TARGET:k3 = "bl31"
>  TFA_SPD:k3 = "opteed"
>  
> +SRC_URI:k3 += "file://rwx-segments-ti.patch"

You want SRC_URI:append:k3 here.


> +FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
> +
>  EXTRA_OEMAKE:append:k3 = "${@ ' K3_USART=' + d.getVar('TFA_K3_USART') if d.getVar('TFA_K3_USART') else ''}"
>  EXTRA_OEMAKE:append:k3 = "${@ ' K3_PM_SYSTEM_SUSPEND=' + d.getVar('TFA_K3_SYSTEM_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"
>  
> -- 
> 2.17.1

