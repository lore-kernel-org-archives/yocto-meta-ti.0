Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF0DCD5BD1
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 17:34:30 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.711.1780421664995996124
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 02 Jun 2026 10:34:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E5B2140BEC;
	Tue,  2 Jun 2026 17:34:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CfeOyLJN6l_B; Tue,  2 Jun 2026 17:34:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5A72640A3D;
	Tue,  2 Jun 2026 17:34:15 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 83AF117E6A7; Tue,  2 Jun 2026 13:34:14 -0400 (EDT)
Date: Tue, 2 Jun 2026 13:34:14 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: m-shah@ti.com, meta-ti@lists.yoctoproject.org, nm@ti.com,
	u-kumar1@ti.com, s-vadapalli@ti.com, a-limaye@ti.com,
	gehariprasath@ti.com, denys@konsulko.com
Subject: Re: [meta-ti][master/wrynose][PATCH 2/2] initramfs: Add netsetup
 module for DHCP network configuration
Message-ID: <20260602173414.GD23325@denix.org>
References: <20260602104810.1068959-1-m-shah@ti.com>
 <20260602104810.1068959-3-m-shah@ti.com>
 <20260602134755.GC23325@denix.org>
 <7302e93b-5df9-4d75-8329-30b180c51804@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7302e93b-5df9-4d75-8329-30b180c51804@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 02 Jun 2026 17:34:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19951

On Tue, Jun 02, 2026 at 09:59:15AM -0500, Ryan Eatmon wrote:
> 
> 
> On 6/2/2026 8:47 AM, Denys Dmytriyenko wrote:
> >On Tue, Jun 02, 2026 at 04:18:10PM +0530, Moteen Shah via lists.yoctoproject.org wrote:
> >>Add 83-netsetup, an initramfs-framework module that configures the
> >>network interface via DHCP before the NFS root mount. Needed when the
> >>Ethernet driver is a loadable module and the deferred probe chain
> >>requires time to settle after udev loads the modules. Also add dhcpcd
> >>to packagegroup-ti-core-initramfs to support DHCP configuration.
> >>
> >>Signed-off-by: Moteen Shah <m-shah@ti.com>
> >>---
> >>  .../initramfs-framework/83-netsetup           | 54 +++++++++++++++++++
> >>  .../initramfs-framework_%.bbappend            | 15 ++++++
> >>  .../packagegroup-ti-core-initramfs.bb         |  2 +
> >>  3 files changed, 71 insertions(+)
> >>  create mode 100644 meta-ti-bsp/recipes-core/initramfs-scripts/initramfs-framework/83-netsetup
> >>  create mode 100644 meta-ti-bsp/recipes-core/initramfs-scripts/initramfs-framework_%.bbappend
> >>
> >>diff --git a/meta-ti-bsp/recipes-core/initramfs-scripts/initramfs-framework/83-netsetup b/meta-ti-bsp/recipes-core/initramfs-scripts/initramfs-framework/83-netsetup
> >>new file mode 100644
> >>index 00000000..b71bc3b3
> >>--- /dev/null
> >>+++ b/meta-ti-bsp/recipes-core/initramfs-scripts/initramfs-framework/83-netsetup
> >>@@ -0,0 +1,54 @@
> >>+#!/bin/sh
> >>+# Configure network via DHCP before NFS root mount. Polls for an Ethernet
> >>+# interface with sleep 1 per iteration to allow the Ethernet driver deferred
> >>+# probe chain to settle after udev loads the modules.
> >>+
> >>+netsetup_enabled() {
> >>+    [ "${bootparam_root}" = "/dev/nfs" ] || return 1
> >>+    return 0
> >>+}
> >>+
> >>+netsetup_run() {
> >>+    local iface timeout devtype
> >>+
> >>+    # Extract interface from ip= kernel param (format: client:server:gw:mask:host:device:autoconf)
> >>+    iface=""
> >>+    case "${bootparam_ip}" in
> >>+        dhcp|on|any|"")
> >>+            ;;
> >>+        *)
> >>+            iface=$(echo "${bootparam_ip}" | cut -d: -f6)
> >>+            ;;
> >>+    esac
> >>+
> >>+    udevadm trigger --action=add --subsystem-match=net
> >>+    udevadm settle --timeout=10
> >>+
> >>+    # Poll up to 60 seconds for an Ethernet interface (ARPHRD_ETHER = type 1).
> >>+    msg "netsetup: waiting for ethernet interface..."
> >>+    timeout=60
> >>+    while [ "${timeout}" -gt 0 ]; do
> >>+        if [ -n "${iface}" ] && [ -d "/sys/class/net/${iface}" ]; then
> >>+            break
> >>+        fi
> >>+        for dev in /sys/class/net/*; do
> >>+            [ -f "${dev}/type" ] || continue
> >>+            devtype=$(cat "${dev}/type")
> >>+            [ "${devtype}" = "1" ] || continue
> >>+            iface=$(basename "${dev}")
> >>+            break
> >>+        done
> >>+        [ -n "${iface}" ] && [ -d "/sys/class/net/${iface}" ] && break
> >>+        sleep 1
> >>+        timeout=$((timeout - 1))
> >>+    done
> >>+
> >>+    if [ -z "${iface}" ] || [ ! -d "/sys/class/net/${iface}" ]; then
> >>+        msg "netsetup: no ethernet interface found after 60s, skipping DHCP"
> >>+        return
> >>+    fi
> >>+
> >>+    msg "netsetup: configuring ${iface} via DHCP"
> >>+
> >>+    dhcpcd --waitip "${iface}"
> >>+}
> >>diff --git a/meta-ti-bsp/recipes-core/initramfs-scripts/initramfs-framework_%.bbappend b/meta-ti-bsp/recipes-core/initramfs-scripts/initramfs-framework_%.bbappend
> >>new file mode 100644
> >>index 00000000..c8955689
> >>--- /dev/null
> >>+++ b/meta-ti-bsp/recipes-core/initramfs-scripts/initramfs-framework_%.bbappend
> >>@@ -0,0 +1,15 @@
> >>+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
> >>+
> >>+SUMMARY:initramfs-module-netsetup = "initramfs support for DHCP network setup before NFS root mount"
> >
> >This should probably be a standalone initramfs-module* recipe, instead of a
> >bbappend.
> 
> Agreed.  It's a little confusing to add a subpackage like that.  We
> should create a new recipe and depend on that name to pull in this
> one file.  The name you chose was fine, just move it out of the
> bbappend.

There are numerous examples of existing initramfs-module-* recipes that 
extend initramfs-framework functionality, e.g.:
https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb

And don't forget about our own such recipe for LUKS with fTPM:
https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/initramfs-module-luks-ftpm_1.0.bb


> >>+SRC_URI:append = " file://83-netsetup"
> >>+
> >>+PACKAGES =+ "initramfs-module-netsetup"
> >>+
> >>+RDEPENDS:initramfs-module-netsetup = "${PN}-base"
> >>+
> >>+FILES:initramfs-module-netsetup = "/init.d/83-netsetup"
> >>+
> >>+do_install:append() {
> >>+    install -m 0755 ${UNPACKDIR}/83-netsetup ${D}/init.d/83-netsetup
> >>+}
> >>diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> >>index a9eff847..ede0639d 100644
> >>--- a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> >>+++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> >>@@ -18,6 +18,8 @@ RDEPENDS:${PN} += "\
> >>      netbase \
> >>      base-files \
> >>      base-passwd \
> >>+    dhcpcd \
> >>+    initramfs-module-netsetup \
> >>      initramfs-framework-base \
> >>      initramfs-module-udev \
> >>      initramfs-module-nfsrootfs \
> >>-- 
> >>2.34.1

