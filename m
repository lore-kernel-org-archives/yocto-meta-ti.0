Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A9CECD8C92
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 13:51:09 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.55154.1780926659819829018
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 08 Jun 2026 06:51:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=SvCHDBbK;
 spf=pass (domain: criticallink.com, ip: 74.125.224.45, mailfrom: jcormier@criticallink.com)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-660456349d9so4177519d50.3
        for <meta-ti@lists.yoctoproject.org>; Mon, 08 Jun 2026 06:50:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780926659; cv=none;
        d=google.com; s=arc-20240605;
        b=BXYvciger5rmAWgictpLPRww5KEPGGNm6ukhGK0vR4UtsMMKzL7qRewf/o0Rwcwohu
         1cMQ84iXCpspANlfQkf40RmMEw4/7CuvE8QAzEvRebIfyxMRDpmsAQ11+X/iuBtatYEi
         rFj/iOEIFoebK4Op4H8DHKP1BO4/DrXoDNndtwflutklD4TebgYuInsGBqBZshNS9FhW
         Z6zU+MhaXmo7og2eLFXCsaj0qWgEX13dQOwGEOC9rxaRStjw325PfhbNjuO+9ILS6R2+
         AVt1Q7V03NkM6EjQzW10uTMUOflnXbh26q2goRz6d2OLP5DS7atUxsm4v7CltJzO2L9K
         GM7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/1eaSvmbDU16NdnngUVAgM2WKsVqwnlU83+FvIFt66U=;
        fh=XLNXxAdmmzSqoaRqHN5Q7KZsOQuRqHNBBHGlntQ5+og=;
        b=bVovFpKz3q0rqNkH6b9I7rFeYvDpMMyuDx4WjGedrEa6QyccggnzsxIPu/NQyBLeJk
         earV0c7+6GPKKo7b2qoskqfHvqQPTjAyY6U98ZN6vSsDaveW2PjVDhWWR/ZFS+DRFqva
         Fh2FCZyU9YS3smZHR3Uth9LtuHd8wR6lwtydCoMEioinks0sxSDIdRynGcuk1A1JGkar
         K2/5L2CzRMboL8QwYZLbKBCL/pW4zwu/DLiwymppCUYfLVvSch9vL1JFyVjAik9iOYY5
         QX+1QbsGtkgjbQwAEnpIuoqmMs4/B+xBxS4g/WANyQPRWsqxWTFxK4R/Q1HWMUn5YoJq
         6i0A==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1780926659; x=1781531459; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/1eaSvmbDU16NdnngUVAgM2WKsVqwnlU83+FvIFt66U=;
        b=SvCHDBbKdUWtA89xAExT1RPLWpQH/ZZHpJQL6dYS0HNmbOsXaBg4fLQCWX64qYENxx
         9PbAI8KpnTNDi7r6R+3O2VLR5gpxErlMegnpW2uWom2cOPmfxC7EpuYVzlh9tihBBYiC
         lX0milPMzGzBS6HAQOnlq6dAfX7p8qNQOTsiXji20d9AY20ZSOTdBNtXUYhvdr12xNlj
         CII/S10Mei6s+TN6/YN79kTTR50yd4EkcqG9qaMpxJI5r6Q3MOjGooAV9eZQMLDYYfP6
         SohNNQVFOxVLGYwEhMMj0gi9w0zqtMQmie3L4OFgyPPFewhL0xI3CDtYXbvd3ij9L+yd
         y8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780926659; x=1781531459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/1eaSvmbDU16NdnngUVAgM2WKsVqwnlU83+FvIFt66U=;
        b=GevSmb5wEGJ9eoYHOEPvt5E4jqNVLX57V/qEh43n67hg3q4Mge6koIRYm6fxcvFtYr
         M64MGvMuZx0Lj9VwDM3ztbs8eCABOP6NTk2ZE4v0aqG/jjg9ZLhda19ENi8EWfGOkjXK
         T3daFmwBNikDiMBupMXmFTxSktv8DCQtZg+3SvXBNHKOc0DUva2zPE5Ci/E+AjiiI1mJ
         qEIkthLfEyG7gI+vu08uq83Pw2ySI72nhk1MT/Lke8hx6GFFMxpgT1K0eGI8oGJW+6iO
         dAitP9qoKG2HLwk/vqFodOO3tIH9PNN6aEsk/9tHTZr8dEYbm7TEiCJQyJA2FKrtTCEl
         siaw==
X-Gm-Message-State: AOJu0YxCP4v+g+k+Oa4yH78jeGiCNMG0pAZcyUpHBXyDyatkw8DKl5eu
	1YVU5qi1nohBKLDL3DitqzYLqKr1FNr1qzTOUcgIaqPyc/qIGiJ096uVGAGTHEjWbQtbYxo6TmV
	85C76FHgpgtbuqA8z15VPrc3t45Q4a70HUA1URSt9
X-Gm-Gg: Acq92OGZ1wGS1veY1UMBao4mgYRPjewtr+JUffUfvBNbu2ePwA83hYnsgKG/HGnz/1t
	VNTxWvFaMN8GuaLjaPh6GAgx4ckG6cElkwSKSK4EvHzSE46isRXdbU9cJHeBXB1iGotsnyI6E2B
	dDL5YwcFehhSgRnRRWTWTOxIeeTbQBKh34uv+5bHAO7JRtrvSVZLYPOT+IRefP4qSvH7x2XIwCI
	3XFmdW8ue8fBLtoEpXjg0YXqylk/8xTQh6ENSKM9q1msml2m6zo2CywKIOqqwsaKw2YshVhd5A7
	HcvWWExLaA3DHPx4wklC+BVUpn4=
X-Received: by 2002:a05:690e:120a:b0:661:37ed:6461 with SMTP id
 956f58d0204a3-66137ed65dbmr3516953d50.1.1780926658688; Mon, 08 Jun 2026
 06:50:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260608080906.2266315-1-m-shah@ti.com>
In-Reply-To: <20260608080906.2266315-1-m-shah@ti.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Mon, 8 Jun 2026 09:50:47 -0400
X-Gm-Features: AVVi8CfcuHWObImZF2hDAcrsheT-A16j_ZUgoXcTYqMgBWNC9AOh4FDLTgygpwA
Message-ID: <CADL8D3YYg15d_qgNak8m6EyxtVqHbNFTJJzmZDmma5DLTmkOcg@mail.gmail.com>
Subject: Re: [meta-ti][master/wrynose][PATCH v4] initramfs: Add
 initramfs-module-netsetup recipe for NFS boot
To: Moteen Shah <m-shah@ti.com>
Cc: meta-ti@lists.yoctoproject.org, reatmon@ti.com, nm@ti.com, u-kumar1@ti.com, 
	s-vadapalli@ti.com, a-limaye@ti.com, gehariprasath@ti.com, denys@konsulko.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 08 Jun 2026 13:51:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19985

Thanks, looks good


On Mon, Jun 8, 2026 at 4:09=E2=80=AFAM Moteen Shah <m-shah@ti.com> wrote:
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
>
> Hello all,
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
> Changes in v4:
> - Switch from dhcpcd to udhcpc -q (busybox, already in initramfs);
>   -q exits after obtaining lease so no background service survives
>   switch-root (Jonathan)
> - Drop dhcpcd from RDEPENDS (Jonathan)
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
> Bootlogs: https://gist.github.com/Jamm02/2d078c20f0062394b0b7d09da7ee0a57
>
>  .../initramfs-module-netsetup/83-netsetup     | 54 +++++++++++++++++++
>  .../initramfs-module-netsetup_1.0.bb          | 30 +++++++++++
>  .../packagegroup-ti-core-initramfs.bb         |  2 +
>  3 files changed, 86 insertions(+)
>  create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-net=
setup/83-netsetup
>  create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-net=
setup_1.0.bb
>
> diff --git a/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/8=
3-netsetup b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-=
netsetup
> new file mode 100644
> index 00000000..8e76bac4
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
> +    udhcpc -q -i "${iface}"
> +}
> diff --git a/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1=
.0.bb b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb
> new file mode 100644
> index 00000000..ec04ea9d
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb
> @@ -0,0 +1,30 @@
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


--=20
Jonathan Cormier
Senior Software Engineer

Office:  315.425.4045 x222

http://www.CriticalLink.com
6712 Brooklawn Parkway, Syracuse, NY 13211

