Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 835C5EB64D7
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 16:44:43 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3558.1687365877596380182
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Jun 2023 09:44:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 967EF40C62;
	Wed, 21 Jun 2023 16:44:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vb3eCMbmzuaG; Wed, 21 Jun 2023 16:44:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5618E40C3E;
	Wed, 21 Jun 2023 16:44:32 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7AEDD163B29; Wed, 21 Jun 2023 12:44:31 -0400 (EDT)
Date: Wed, 21 Jun 2023 12:44:31 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: reatmon@ti.com, Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH v2] pruhsr-fw: SR2.0: Add
 new firmware
Message-ID: <20230621164431.GM1518@denix.org>
References: <20230620221555.4561-1-reatmon@ti.com>
 <addccf44-0b38-4acc-8b86-e412b33c03a5@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <addccf44-0b38-4acc-8b86-e412b33c03a5@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 21 Jun 2023 16:44:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16760

On Wed, Jun 21, 2023 at 09:59:53AM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> On 6/20/23 5:15 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> >We need to package up new HSR firmware for am65x-sr2.  Add dependencies
> >for them on the correct platforms.
> >
> >Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >---
> >v2: Names of firmware were changed to match existing filenames.
> >
> >  .../pruhsr-fw/pruhsr-fw_am65x-sr2_git.bb      | 34 +++++++++++++++++++
> >  .../recipes-kernel/linux/kernel-rdepends.inc  |  4 +--
> >  2 files changed, 36 insertions(+), 2 deletions(-)
> >  create mode 100644 meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_am65x-sr2_git.bb
> >
> >diff --git a/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_am65x-sr2_git.bb b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_am65x-sr2_git.bb
> >new file mode 100644
> >index 00000000..c31af832
> >--- /dev/null
> >+++ b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_am65x-sr2_git.bb
> >@@ -0,0 +1,34 @@
> >+SUMMARY = "PRU HSR firmware for AM65xx SR2.0"
> >+
> >+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> >+
> >+PV = "${PRUETH_FW_AM65X_SR2_VERSION}"
> >+PR = "${INC_PR}.0"
> >+
> >+CLEANBROKEN = "1"
> >+
> >+COMPATIBLE_MACHINE = "am65xx-evm|am64xx"
> >+
> >+PACKAGE_ARCH = "${MACHINE_ARCH}"
> 
> Is this needed? I don't think the package changes based on machine here.

Good question. It can be both ways with own pros and cons:

1. Don't make it machine-specific. Either one of am64 or am65 will build the 
package once and it will be Aarch64-generic. So, same package with the same 
binaries inside can be used on am64 and am65. But COMPATIBLE_MACHINE is a 
build-time guard, so nothing prevents installing this Aarch64-generic package 
on other platforms - will that work? would there be adverse effects?

2. Make it machine-specific (as it is now) - it will be built/packaged twice, 
separate for am64 and am65, and no other platform will be allowed to build it 
due to COMPATIBLE_MACHINE. Moreover, at run-time, no other platform will be 
allowed to even install either of the packages, since they are specific to 
each of those 2 platforms.

So, you decide which way is the best option in this case...


> >+S = "${WORKDIR}/git"
> >+
> >+TARGET = " \
> >+    am65x-sr2-pru0-pruhsr-fw.elf \
> >+    am65x-sr2-pru1-pruhsr-fw.elf \
> >+    am65x-sr2-rtu0-pruhsr-fw.elf \
> >+    am65x-sr2-rtu1-pruhsr-fw.elf \
> >+    am65x-sr2-txpru0-pruhsr-fw.elf \
> >+    am65x-sr2-txpru1-pruhsr-fw.elf \
> >+"
> >+
> >+do_install() {
> >+	install -d ${D}${nonarch_base_libdir}/firmware/ti-pruss
> >+	for f in ${TARGET}; do
> >+		install -m 0644 ${S}/ti-pruss/$f ${D}${nonarch_base_libdir}/firmware/ti-pruss/$f
> >+	done
> >+}
> >+
> >+FILES:${PN} = "${nonarch_base_libdir}/firmware"
> >+
> >+INSANE_SKIP:${PN} = "arch"
> >diff --git a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
> >index d2dcc3e5..7c8f3171 100644
> >--- a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
> >+++ b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
> >@@ -16,8 +16,8 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am57xx = " prueth-fw prusw-fw pruhsr
> >  RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti43x = " prueth-fw pruhsr-fw pruprp-fw"
> >  RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti33x = " prueth-fw pruhsr-fw pruprp-fw"
> >  RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx = " prueth-fw-am65x"
> >-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx-evm = " prueth-fw-am65x-sr2 prusw-fw-am65x-sr2"
> >-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am64xx = " prueth-fw-am65x-sr2"
> >+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx-evm = " prueth-fw-am65x-sr2 pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
> >+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am64xx = " prueth-fw-am65x-sr2 pruhsr-fw-am65x-sr2"
> >  # Add run-time dependency for Cadence MHDP firmware to the rootfs
> >  RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721e = " cadence-mhdp-fw"

