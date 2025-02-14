Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 558F1C02198
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 23:33:22 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.34704.1739575999339445922
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 14 Feb 2025 15:33:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id ABDB640DE2;
	Fri, 14 Feb 2025 23:33:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jnE3waw1DGeB; Fri, 14 Feb 2025 23:33:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 70BA540D82;
	Fri, 14 Feb 2025 23:33:14 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 363CF16423E; Fri, 14 Feb 2025 18:33:14 -0500 (EST)
Date: Fri, 14 Feb 2025 18:33:14 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: jm@ti.com, denys@konsulko.com, reatmon@ti.com,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][scarthgap][PATCH] HACK: conf: machine: am64x: Use
 new sdimage efti wks template
Message-ID: <20250214233314.GW21608@denix.org>
References: <20250211231115.139972-1-jm@ti.com>
 <1240a4e9-215c-406e-baca-020c7faeaa5e@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1240a4e9-215c-406e-baca-020c7faeaa5e@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 14 Feb 2025 23:33:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18320

On Wed, Feb 12, 2025 at 01:42:08PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> On 2/11/25 5:11 PM, Mendez, Judith via lists.yoctoproject.org wrote:
> >Currently am64x boards are failing SD card boot since standard
> >boot is the current boot method for the boards. With standard
> >boot, the grub shell is invoked and the grub.cfg used to pass
> >kernel parameters to Linux. Normally we would like to use grub
> >class to modify the kernel parameters passed to Linux but
> >since this is not currently working with SERIAL_CONSOLES nor
> >GRUB_OPTS, lets make a template that includes our own custom
> 
> Why do SERIAL_CONSOLES nor GRUB_OPTS work here? Should explain
> that in this message.
> 
> Looks like there is a comment that this needs fixed[0]. Since it
> affects you now, might be good to go fix this upstream.
> 
> For now, this seems like a GRUB issue.

Andrew,

> Why do we use GRUB again,

Might want to ask Nishanth for specific details, but this was part of 
the "generic distro boot" support and EFI boot on K3:

https://git.yoctoproject.org/meta-ti/commit/?id=993d80764de4d7c2b181d4262d18e950f86c3467
https://git.yoctoproject.org/meta-ti/commit/?id=f2d9882e175db1832a90378a01f72d3c3b3f2264


> isn't one bootloader enough?.. uboot-extlinux-config.bbclass
> doesn't seem to have this issue, and the resulting extlinux.conf
> can be used directly by U-Boot (or used by GRUB if we really want
> to have a middle layer bootloader that only ends up breaking FIT,
> DT overlays, rproc loading, security, etc..)
> 
> <rant>
> GRUB makes no sense on embedded, and it never did as we don't
> have an x86 legacy BIOS, the only reason anyone still uses GRUB.
> systemd-boot and efistub are the future for EFI capable systems
> like ours. Simple, better security, and already available in
> Yocto, let's switch already..
> </rant>
> 
> Andrew
> 
> [0] https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/grub-efi-cfg.bbclass#n22
> 
> >console= and let am64x conf use this.
> >
> >Signed-off-by: Judith Mendez <jm@ti.com>
> >---
> >  meta-ti-bsp/conf/machine/include/am64xx.inc  | 2 ++
> >  meta-ti-bsp/wic/sdimage-2part-efi-csl.wks.in | 8 ++++++++
> >  2 files changed, 10 insertions(+)
> >  create mode 100644 meta-ti-bsp/wic/sdimage-2part-efi-csl.wks.in
> >
> >diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
> >index 49e996c8..be65aa6e 100644
> >--- a/meta-ti-bsp/conf/machine/include/am64xx.inc
> >+++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
> >@@ -34,3 +34,5 @@ TFA_BOARD = "lite"
> >  OPTEEMACHINE = "k3-am64x"
> >  MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "prueth-fw pruhsr-fw prusw-fw"
> >+
> >+WKS_FILE = "${@bb.utils.contains("MACHINE_FEATURES", "efi", "sdimage-2part-efi-csl.wks.in", "sdimage-2part.wks", d)}"
> >diff --git a/meta-ti-bsp/wic/sdimage-2part-efi-csl.wks.in b/meta-ti-bsp/wic/sdimage-2part-efi-csl.wks.in
> >new file mode 100644
> >index 00000000..6dc69a17
> >--- /dev/null
> >+++ b/meta-ti-bsp/wic/sdimage-2part-efi-csl.wks.in
> >@@ -0,0 +1,8 @@
> >+# short-description: Create SD card image with 2 partitions and EFI support
> >+# long-description: Creates a partitioned SD card image for TI platforms that
> >+# supports EFI.  Boot files are located in the first vfat partition with extra
> >+# reserved space.  We cannot use a GPT here.
> >+
> >+bootloader --timeout=5 --append="rootfstype=ext4 console=ttyS2,115200n8"
> >+part --source bootimg-efi --sourceparams="loader=${EFI_PROVIDER}" --fstype=vfat --label boot --active --align 1024 --use-uuid --fixed-size 128M
> >+part / --source rootfs --fstype=ext4 --label root --align 1024 --use-uuid

