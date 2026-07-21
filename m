Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0B00C4452B
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 21:50:35 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34763.1784670614674965536
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Jul 2026 14:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AB7DF40BA7;
	Tue, 21 Jul 2026 21:50:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tak6VAuagVbv; Tue, 21 Jul 2026 21:50:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0E04840031;
	Tue, 21 Jul 2026 21:50:03 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4079F176A01; Tue, 21 Jul 2026 17:50:03 -0400 (EDT)
Date: Tue, 21 Jul 2026 17:50:03 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: m-shah@ti.com
Cc: meta-ti@lists.yoctoproject.org, reatmon@ti.com, nm@ti.com,
	u-kumar1@ti.com, s-vadapalli@ti.com, a-limaye@ti.com,
	gehariprasath@ti.com, denys@konsulko.com, jcormier@criticallink.com
Subject: Re: [meta-ti][master/wrynose][PATCH v5] initramfs: Add
 initramfs-module-netsetup recipe for NFS boot
Message-ID: <20260721215003.GT10186@denix.org>
References: <18C306C8423CAEB2.1068600@lists.yoctoproject.org>
 <24a74406-68f9-4974-9bc5-cd4d2897377d@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24a74406-68f9-4974-9bc5-cd4d2897377d@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Jul 2026 21:50:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20186

On Fri, Jul 17, 2026 at 02:16:23PM +0530, Moteen Shah via lists.yoctoproject.org wrote:
> Hey all,
> 
> On 17/07/26 14:05, Moteen Shah via lists.yoctoproject.org wrote:
> >Add a standalone initramfs-module-netsetup recipe that installs
> >83-netsetup, an initramfs-framework module that configures the network
> >interface via DHCP before the NFS root mount. The recipe's RDEPENDS
> >pulls in CPSW and its dependencies, so the kernel modules and DHCP
> >client are only included when NFS boot support is needed.
> >
> >Include initramfs-module-netsetup in packagegroup-ti-core-initramfs
> >gated on :bsp-next, where AM65_CPSW_NUSS became a loadable module.
> >TI staging kernels (6.6/6.12/6.18) still have CPSW built-in (=y).
> >
> >Signed-off-by: Moteen Shah <m-shah@ti.com>
> >---
> >Changes in v5:
> >- Scope CPSW modules and netsetup inclusion to :k3:bsp-next to avoid
> >   breaking legacy non-K3 platforms building with bsp-next (Denys)
> >- Restore PACKAGE_ARCH = "${MACHINE_ARCH}" since recipe has
> >   K3-specific RDEPENDS (Denys)
> >
> >  .../initramfs-module-netsetup/83-netsetup     | 54 +++++++++++++++++++
> >  .../initramfs-module-netsetup_1.0.bb          | 32 +++++++++++
> >  .../packagegroup-ti-core-initramfs.bb         |  2 +
> >  3 files changed, 88 insertions(+)
> >  create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-netsetup
> >  create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb
> >
> >diff --git a/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-netsetup b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-netsetup
> >new file mode 100644
> >index 00000000..8e76bac4
> >--- /dev/null
> >+++ b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-netsetup
> >@@ -0,0 +1,54 @@
> >+#!/bin/sh
> >+# Configure network via DHCP before NFS root mount. Polls for an Ethernet
> >+# interface with sleep 1 per iteration to allow the Ethernet driver deferred
> >+# probe chain to settle after udev loads the modules.
> >+
> >+netsetup_enabled() {
> >+    [ "${bootparam_root}" = "/dev/nfs" ] || return 1
> >+    return 0
> >+}
> >+
> >+netsetup_run() {
> >+    local iface timeout devtype
> >+
> >+    # Extract interface from ip= kernel param (format: client:server:gw:mask:host:device:autoconf)
> >+    iface=""
> >+    case "${bootparam_ip}" in
> >+        dhcp|on|any|"")
> >+            ;;
> >+        *)
> >+            iface=$(echo "${bootparam_ip}" | cut -d: -f6)
> >+            ;;
> >+    esac
> >+
> >+    udevadm trigger --action=add --subsystem-match=net
> >+    udevadm settle --timeout=10
> >+
> >+    # Poll up to 60 seconds for an Ethernet interface (ARPHRD_ETHER = type 1).
> >+    msg "netsetup: waiting for ethernet interface..."
> >+    timeout=60
> >+    while [ "${timeout}" -gt 0 ]; do
> >+        if [ -n "${iface}" ] && [ -d "/sys/class/net/${iface}" ]; then
> >+            break
> >+        fi
> >+        for dev in /sys/class/net/*; do
> >+            [ -f "${dev}/type" ] || continue
> >+            devtype=$(cat "${dev}/type")
> >+            [ "${devtype}" = "1" ] || continue
> >+            iface=$(basename "${dev}")
> >+            break
> >+        done
> >+        [ -n "${iface}" ] && [ -d "/sys/class/net/${iface}" ] && break
> >+        sleep 1
> >+        timeout=$((timeout - 1))
> >+    done
> >+
> >+    if [ -z "${iface}" ] || [ ! -d "/sys/class/net/${iface}" ]; then
> >+        msg "netsetup: no ethernet interface found after 60s, skipping DHCP"
> >+        return
> >+    fi
> >+
> >+    msg "netsetup: configuring ${iface} via DHCP"
> >+
> >+    udhcpc -q -i "${iface}"
> >+}
> >diff --git a/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb
> >new file mode 100644
> >index 00000000..03925497
> >--- /dev/null
> >+++ b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb
> >@@ -0,0 +1,32 @@
> >+SUMMARY = "initramfs support for DHCP network configuration before NFS root mount"
> >+
> >+LICENSE = "MIT"
> >+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> >+
> >+SRC_URI = "file://83-netsetup"
> >+
> >+S = "${UNPACKDIR}"
> >+
> >+do_install() {
> >+    install -d ${D}/init.d
> >+    install -m 0755 ${UNPACKDIR}/83-netsetup ${D}/init.d/83-netsetup
> >+}
> >+
> >+FILES:${PN} = "/init.d/83-netsetup"
> >+
> >+RDEPENDS:${PN} = "\
> >+    initramfs-framework-base \
> >+"
> >+
> >+RDEPENDS:${PN}:append:k3:bsp-next = " \
> >+    kernel-module-ti-am65-cpsw-nuss \
> >+    kernel-module-k3-cppi-desc-pool \
> >+    kernel-module-davinci-mdio \
> >+    kernel-module-ti-cpsw-ale \
> >+    kernel-module-ti-cpsw-sl \
> >+    kernel-module-phylink \
> >+    kernel-module-mdio-bitbang \
> >+    kernel-module-phy-gmii-sel \
> >+"
> >+
> >+PACKAGE_ARCH = "${MACHINE_ARCH}"
> >diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> >index a9eff847..537d1f5a 100644
> >--- a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> >+++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> >@@ -23,3 +23,5 @@ RDEPENDS:${PN} += "\
> >      initramfs-module-nfsrootfs \
> >      nfs-utils-mount \
> >  "
> >+
> >+RDEPENDS:${PN}:append:k3:bsp-next = " initramfs-module-netsetup"
> >
> >
> >
> Please ignore this patch as the previous version is already merged.

Since v4 already got merged, you need to send the changes between v4 and v5 as 
a separate patch, thanks.

-- 
Denys

