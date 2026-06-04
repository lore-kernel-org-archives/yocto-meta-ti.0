Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3CC2CD6E75
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 22:42:33 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3077.1780612949564076868
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Jun 2026 15:42:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7AF6A40CE3;
	Thu,  4 Jun 2026 22:42:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mAclhnFwhHH1; Thu,  4 Jun 2026 22:42:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DE59040CE2;
	Thu,  4 Jun 2026 22:42:19 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0E4D817E913; Thu,  4 Jun 2026 18:42:19 -0400 (EDT)
Date: Thu, 4 Jun 2026 18:42:19 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: m-shah@ti.com
Cc: meta-ti@lists.yoctoproject.org, reatmon@ti.com, nm@ti.com,
	u-kumar1@ti.com, s-vadapalli@ti.com, a-limaye@ti.com,
	gehariprasath@ti.com, denys@konsulko.com
Subject: Re: [meta-ti][master/wrynose][PATCH v2 2/2] initramfs: Add
 initramfs-module-netsetup recipe for DHCP network configuration
Message-ID: <20260604224219.GF23325@denix.org>
References: <20260603072932.1273938-1-m-shah@ti.com>
 <20260603072932.1273938-3-m-shah@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603072932.1273938-3-m-shah@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 04 Jun 2026 22:42:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19976

On Wed, Jun 03, 2026 at 12:59:32PM +0530, Moteen Shah via lists.yoctoproject.org wrote:
> Add a standalone initramfs-module-netsetup recipe that installs 83-netsetup,
> an initramfs-framework module that configures the network interface via DHCP
> before the NFS root mount. Needed when the Ethernet driver is a loadable
> module and the deferred probe chain requires time to settle after udev loads
> the modules. Add initramfs-module-netsetup to packagegroup-ti-core-initramfs
> to pull it into the initramfs image.

Thanks for re-doing the patch - it's much better now. Please see a couple of 
minor comments below.


> Signed-off-by: Moteen Shah <m-shah@ti.com>
> ---
>  .../initramfs-module-netsetup/83-netsetup     | 54 +++++++++++++++++++
>  .../initramfs-module-netsetup_1.0.bb          | 24 +++++++++
>  .../packagegroup-ti-core-initramfs.bb         |  1 +
>  3 files changed, 79 insertions(+)
>  create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-netsetup
>  create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb
> 
> diff --git a/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-netsetup b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-netsetup
> new file mode 100644
> index 00000000..b71bc3b3
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-netsetup
> @@ -0,0 +1,54 @@
> +#!/bin/sh
> +# Configure network via DHCP before NFS root mount. Polls for an Ethernet
> +# interface with sleep 1 per iteration to allow the Ethernet driver deferred
> +# probe chain to settle after udev loads the modules.
> +
> +netsetup_enabled() {
> +    [ "${bootparam_root}" = "/dev/nfs" ] || return 1
> +    return 0
> +}
> +
> +netsetup_run() {
> +    local iface timeout devtype
> +
> +    # Extract interface from ip= kernel param (format: client:server:gw:mask:host:device:autoconf)
> +    iface=""
> +    case "${bootparam_ip}" in
> +        dhcp|on|any|"")
> +            ;;
> +        *)
> +            iface=$(echo "${bootparam_ip}" | cut -d: -f6)
> +            ;;
> +    esac
> +
> +    udevadm trigger --action=add --subsystem-match=net
> +    udevadm settle --timeout=10
> +
> +    # Poll up to 60 seconds for an Ethernet interface (ARPHRD_ETHER = type 1).
> +    msg "netsetup: waiting for ethernet interface..."
> +    timeout=60
> +    while [ "${timeout}" -gt 0 ]; do
> +        if [ -n "${iface}" ] && [ -d "/sys/class/net/${iface}" ]; then
> +            break
> +        fi
> +        for dev in /sys/class/net/*; do
> +            [ -f "${dev}/type" ] || continue
> +            devtype=$(cat "${dev}/type")
> +            [ "${devtype}" = "1" ] || continue
> +            iface=$(basename "${dev}")
> +            break
> +        done
> +        [ -n "${iface}" ] && [ -d "/sys/class/net/${iface}" ] && break
> +        sleep 1
> +        timeout=$((timeout - 1))
> +    done
> +
> +    if [ -z "${iface}" ] || [ ! -d "/sys/class/net/${iface}" ]; then
> +        msg "netsetup: no ethernet interface found after 60s, skipping DHCP"
> +        return
> +    fi
> +
> +    msg "netsetup: configuring ${iface} via DHCP"
> +
> +    dhcpcd --waitip "${iface}"
> +}
> diff --git a/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb
> new file mode 100644
> index 00000000..a4565a25
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb
> @@ -0,0 +1,24 @@
> +SUMMARY = "initramfs support for DHCP network configuration before NFS root mount"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +
> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

This is not needed for a standalone recipe. I know it is also in the luks-ftpm 
recipe I mentioned as an example - it just snuck in unnoticed and not very 
critical.


> +SRC_URI = "file://83-netsetup"
> +
> +S = "${UNPACKDIR}"
> +
> +do_install() {
> +    install -d ${D}/init.d
> +    install -m 0755 ${UNPACKDIR}/83-netsetup ${D}/init.d/83-netsetup
> +}
> +
> +FILES:${PN} = "/init.d/83-netsetup"
> +
> +RDEPENDS:${PN} = "\
> +    initramfs-framework-base \
> +    dhcpcd \
> +"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"

Unlike luks-ftpm, this component is not machine-specific AFAICS, so it should 
not be setting it's package arch to be machine-specific.


> diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> index a9eff847..2e68366d 100644
> --- a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> +++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> @@ -19,6 +19,7 @@ RDEPENDS:${PN} += "\
>      base-files \
>      base-passwd \
>      initramfs-framework-base \
> +    initramfs-module-netsetup \
>      initramfs-module-udev \
>      initramfs-module-nfsrootfs \
>      nfs-utils-mount \
> -- 
> 2.34.1

