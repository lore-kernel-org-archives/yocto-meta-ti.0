Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBCEACD6E7E
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 18:28:38 +0000 (UTC)
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1708.1780684108480799430
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Jun 2026 11:28:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=ekgXrhY8;
 spf=pass (domain: criticallink.com, ip: 74.125.224.46, mailfrom: jcormier@criticallink.com)
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6607048fa62so2376453d50.1
        for <meta-ti@lists.yoctoproject.org>; Fri, 05 Jun 2026 11:28:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780684107; cv=none;
        d=google.com; s=arc-20240605;
        b=aBg8wFUL7I1IWtldvSpLUai9eIjdCdK9+Tw91pvSDloyhwnx/ttJg6PNdX5YNrPxev
         /xf2kqadBljMPTzy4qA4Zubn66E03MwCZt0S0/Y8PREgsklqiK05LfxF4p0UpqvU3rPc
         aRGL02RZu/fiBvFL8ce420el5tMILxVXnOt1yVMMircJMzltDybQR/HmtO5dI4x8jjdY
         ha2s/d9myW1h5+1oQffevU4XcDbNFtLKT5qLm8SDFea6d3cUHuSHoM/xOdVYJbNxZheg
         YfzC5NpysKZi9Yu+34KVU7XObWiCEU4wFY1q5VwHAE506X0uza6pY31HkcpW8oo1eZnp
         oo6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=joyXMNGTTWZn4Lr0hXVwJYFa9FvkXUbiL5LifO3kz+s=;
        fh=LDxwcELlN9Zg1aJUJZt+oK5Zib/ytqJrymME92bsGag=;
        b=C1ij7TBneFvjG4QjtY4zlWBgT7Ju1eTYc79KXSQwo2VEjhf1l8D3T8hKYQxBtmySzx
         B+YRj3uWTSMqmgKkfh2rI/lRGotQ3v5cH+YteUu7bGzKBTUW3W/KI0zW7Ob49ZepNJ/c
         ScDdmqcQtMpEhz0yIDxING/sVSajA/xlgnuuxrkwSMDMMNfrTYKPTW76dQdhSMJxm0DA
         uf6tBVjfhRrOZcuQhpR6sYgG9eoul5jCIwTJt+2clw9shis2dcs2TX/KRFFiAg8xaD3m
         7weZY7nuf5WFpJDN7DDfoQRAsBJD7Lwi6Jnw2jQ8abJVYtdj4zfJOXh24fivM13P0+Ed
         ukFg==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1780684107; x=1781288907; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=joyXMNGTTWZn4Lr0hXVwJYFa9FvkXUbiL5LifO3kz+s=;
        b=ekgXrhY8bxLfiC62+zLu0FU89VM0fCYEiaUrelt0iUrQ5gUpB9oFEaRVj5eqGAMoJB
         a9yFpvxklpk542MZY7tmDop9e/H5K0UMRsX2qrRqqBFBFQqbGSjeZHJQwyrlB1ndtohc
         esWkhEjVZz9q5wvHcJTtQzzb6pHxaQYFlhvmicoRyMUH0B0SWrOezcWZGhebOohs7vIp
         HJHwUfPX3Z45r3MxjzwK3AA2U389ZhJQ1HP6tewQ5tng/cblwK0a1+rn1+MOsFtCROW8
         rmz0XFl4V4/XUbBCpHU5JKLzf7lstFzI8ggutzpDJUxcPS4MTcab/VtqM+RfW72DWwtb
         OKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780684107; x=1781288907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=joyXMNGTTWZn4Lr0hXVwJYFa9FvkXUbiL5LifO3kz+s=;
        b=FGxjiWObAHoAMFrKwzJrzvivLfyEzDQXYOJL62pcByyU8VJOluHaFoLGAhgGoZ2G8y
         HbI/rTOP6n9T0SdlKjfdyWixWIXsKTfnrqoPF0zg83S0nsz1eUvPSSkUhGcPj0KfxDSI
         KmjnlnYUb49UtNsy6se19QjybBi5Ir1tQoYYZKLXTChY2uDpzaSpn37nxkirq4J8xrBw
         NHgITqyq86BAM3VegZrlbEBB8vWtn7aQngKqqoHf9rkpJfb1QKEcBdAMl5RuYf/eWU21
         TXeL9aQAzT14DRGITWiPSyMzmSSp15PMe6JgbblRzxLFTFlxWxfWOFq0xf3bsS8pJGzK
         Eg/A==
X-Gm-Message-State: AOJu0YwS0nCPQsfIBELZQMhneo46yX+bKyG8c1qHJhmv1n6ZV2dQaZk1
	3/gje37hdNTI6y67zXaLDsHjpYgmprZAfhmWE+1zKf5nnHbDrEcQyCI8iRSIDh1Wg02TTpHEu7s
	Gpw1edRdYG4rDMCRMIa95+aQZMI2QtAWDLgVgjc9C
X-Gm-Gg: Acq92OHsOfJanIHmkWzrEB+aszR4gSGzM3V1jLzSAIUOiWa9X04Qk/R5Xbv1NxbU3ul
	ShscW2GhkvYnpq6+RjkCJWCIHLQ6k7elPKw6thy41L82NE1NwlUE2bSwawuXHOlBS9yNQj+0Yu3
	ewTkJ3FxMUZ3t+072jG1v5mn+OqTmikZ5ZKyjxa84uua58Pq/r1/2apa08OvibXSjzrSBi1BS85
	3hseIob/H7dqF0fAI+e+EwyKhVS0CQhMObyEHJFP0WyvFbM6fGMxgbA9rL4e34Rsh4Njo15mXIN
	bgweX21vUqm9jzT0
X-Received: by 2002:a53:ac87:0:b0:661:1307:3d49 with SMTP id
 956f58d0204a3-66113074155mr2314357d50.7.1780684107336; Fri, 05 Jun 2026
 11:28:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260605121720.1850683-1-m-shah@ti.com>
In-Reply-To: <20260605121720.1850683-1-m-shah@ti.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Fri, 5 Jun 2026 14:28:15 -0400
X-Gm-Features: AVHnY4LjxZEg18D5yOZrJRgRqG0qvvKxcN2ggLtwN8pjMTQ88Rx_Nr8gdrqfGF4
Message-ID: <CADL8D3bs2LrmFjLmKu+WwJ-RiEKHcwkjJmrtC4OJgwWLigLxkw@mail.gmail.com>
Subject: Re: [meta-ti][master/wrynose][PATCH v3] initramfs: Add
 initramfs-module-netsetup recipe for NFS boot
To: m-shah@ti.com
Cc: meta-ti@lists.yoctoproject.org, reatmon@ti.com, nm@ti.com, u-kumar1@ti.com, 
	s-vadapalli@ti.com, a-limaye@ti.com, gehariprasath@ti.com, denys@konsulko.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 05 Jun 2026 18:28:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19981

On Fri, Jun 5, 2026 at 8:17=E2=80=AFAM Moteen Shah via lists.yoctoproject.o=
rg
<m-shah=3Dti.com@lists.yoctoproject.org> wrote:
>
> Add a standalone initramfs-module-netsetup recipe that installs
> 83-netsetup, an initramfs-framework module that configures the network
> interface via DHCP before the NFS root mount. The recipe's RDEPENDS
> pulls in CPSW and its dependencies, so the kernel modules and DHCP
> client are only included when NFS boot support is needed.
>
> Include initramfs-module-netsetup in packagegroup-ti-core-initramfs
> gated on :bsp-next, where AM65_CPSW_NUSS became a loadable module.
> TI staging kernels (6.6/6.12/6.18) still have CPSW built-in (=3Dy).
>
> Signed-off-by: Moteen Shah <m-shah@ti.com>
> ---
> Hi everyone,
> AM65_CPSW_NUSS and its dependencies changed from built-in (=3Dy) to
> loadable modules (=3Dm) in linux-next. This breaks NFS boot because the
> Ethernet driver is no longer available before the NFS root mount.
>
> Add a standalone initramfs-module-netsetup recipe that waits for the
> Ethernet interface to appear after udev loads the modules and then
> configures it via DHCP before the nfsrootfs module runs. The CPSW
> kernel modules are declared as RDEPENDS:append:bsp-next of the recipe
> so they are only pulled in for bsp-next kernels and only when NFS boot
> support is needed.
>
> Changes in v3:
> - Remove FILESEXTRAPATHS:prepend - redundant in a standalone recipe (Deny=
s)
> - Remove PACKAGE_ARCH =3D "${MACHINE_ARCH}" - script is not machine-speci=
fic (Denys)
> - Drop k3.inc patch; move CPSW modules into RDEPENDS:append:bsp-next of
>   the recipe, linking module inclusion to NFS boot recipe inclusion
> - Gate initramfs-module-netsetup on :bsp-next in packagegroup so staging
>   kernels (where CPSW is built-in =3Dy) are unaffected
>
>  .../initramfs-module-netsetup/83-netsetup     | 54 +++++++++++++++++++
>  .../initramfs-module-netsetup_1.0.bb          | 31 +++++++++++
>  .../packagegroup-ti-core-initramfs.bb         |  2 +
>  3 files changed, 87 insertions(+)
>  create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-net=
setup/83-netsetup
>  create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-net=
setup_1.0.bb
>
> diff --git a/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/8=
3-netsetup b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-=
netsetup
> new file mode 100644
> index 00000000..b71bc3b3
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-netse=
tup
> @@ -0,0 +1,54 @@
> +#!/bin/sh
> +# Configure network via DHCP before NFS root mount. Polls for an Etherne=
t
> +# interface with sleep 1 per iteration to allow the Ethernet driver defe=
rred
> +# probe chain to settle after udev loads the modules.
> +
> +netsetup_enabled() {
> +    [ "${bootparam_root}" =3D "/dev/nfs" ] || return 1
> +    return 0
> +}
> +
> +netsetup_run() {
> +    local iface timeout devtype
> +
> +    # Extract interface from ip=3D kernel param (format: client:server:g=
w:mask:host:device:autoconf)
> +    iface=3D""
> +    case "${bootparam_ip}" in
> +        dhcp|on|any|"")
> +            ;;
> +        *)
> +            iface=3D$(echo "${bootparam_ip}" | cut -d: -f6)
> +            ;;
> +    esac
> +
> +    udevadm trigger --action=3Dadd --subsystem-match=3Dnet
> +    udevadm settle --timeout=3D10
> +
> +    # Poll up to 60 seconds for an Ethernet interface (ARPHRD_ETHER =3D =
type 1).
> +    msg "netsetup: waiting for ethernet interface..."
> +    timeout=3D60
> +    while [ "${timeout}" -gt 0 ]; do
> +        if [ -n "${iface}" ] && [ -d "/sys/class/net/${iface}" ]; then
> +            break
> +        fi
> +        for dev in /sys/class/net/*; do
> +            [ -f "${dev}/type" ] || continue
> +            devtype=3D$(cat "${dev}/type")
> +            [ "${devtype}" =3D "1" ] || continue
> +            iface=3D$(basename "${dev}")
> +            break
> +        done
> +        [ -n "${iface}" ] && [ -d "/sys/class/net/${iface}" ] && break
> +        sleep 1
> +        timeout=3D$((timeout - 1))
> +    done
> +
> +    if [ -z "${iface}" ] || [ ! -d "/sys/class/net/${iface}" ]; then
> +        msg "netsetup: no ethernet interface found after 60s, skipping D=
HCP"
> +        return
> +    fi
> +
> +    msg "netsetup: configuring ${iface} via DHCP"
> +
> +    dhcpcd --waitip "${iface}"
> +}
> diff --git a/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1=
.0.bb b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb
> new file mode 100644
> index 00000000..cdb6116a
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb
> @@ -0,0 +1,31 @@
> +SUMMARY =3D "initramfs support for DHCP network configuration before NFS=
 root mount"
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
> +
> +SRC_URI =3D "file://83-netsetup"
> +
> +S =3D "${UNPACKDIR}"
> +
> +do_install() {
> +    install -d ${D}/init.d
> +    install -m 0755 ${UNPACKDIR}/83-netsetup ${D}/init.d/83-netsetup
> +}
> +
> +FILES:${PN} =3D "/init.d/83-netsetup"
> +
> +RDEPENDS:${PN} =3D "\
> +    initramfs-framework-base \
> +    dhcpcd \
Sorry, I didn't notice this earlier. Is there a reason not to use
busybox-udhcpc which is already included?

This adds two packages:
+dhcpcd aarch64 10.3.0-r0.0
+libudev1 aarch64 1:259.5-r0.arago7.0

And increased the size by 1.6MB on arago-wrynose
 +1,685,504  ti-core-initramfs.cpio
 +327,560  ti-core-initramfs.cpio.xz

> +"
> +
> +RDEPENDS:${PN}:append:bsp-next =3D " \
> +    kernel-module-ti-am65-cpsw-nuss \
> +    kernel-module-k3-cppi-desc-pool \
> +    kernel-module-davinci-mdio \
> +    kernel-module-ti-cpsw-ale \
> +    kernel-module-ti-cpsw-sl \
> +    kernel-module-phylink \
> +    kernel-module-mdio-bitbang \
> +    kernel-module-phy-gmii-sel \
> +"
> diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initra=
mfs.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> index a9eff847..b4e6adff 100644
> --- a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> +++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> @@ -23,3 +23,5 @@ RDEPENDS:${PN} +=3D "\
>      initramfs-module-nfsrootfs \
>      nfs-utils-mount \
>  "
> +
> +RDEPENDS:${PN}:append:bsp-next =3D " initramfs-module-netsetup"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19979): https://lists.yoctoproject.org/g/meta-ti/mess=
age/19979
> Mute This Topic: https://lists.yoctoproject.org/mt/119661032/7902621
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [jcormier@cri=
ticallink.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Jonathan Cormier
Senior Software Engineer

Office:  315.425.4045 x222

http://www.CriticalLink.com
6712 Brooklawn Parkway, Syracuse, NY 13211

