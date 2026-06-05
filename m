Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FFF9CD6E7C
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 19:03:39 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2395.1780686209923285401
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Jun 2026 12:03:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=sl8KXcjD;
 spf=pass (domain: criticallink.com, ip: 74.125.224.45, mailfrom: jcormier@criticallink.com)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-66049669d78so2285307d50.0
        for <meta-ti@lists.yoctoproject.org>; Fri, 05 Jun 2026 12:03:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780686209; cv=none;
        d=google.com; s=arc-20240605;
        b=Ufo0+zwAhQAd/S813Se4a1q+kG3Fhfor5k21f3TaANH+ehRcdGmG4WKmex92TIXpqu
         NgTNnXwVRY5OSuGhFix2nf3OtjV4PGwdviREBvy3P5ljWHgV26m07NnoOgmIKYiDfqxU
         XivA/f6VsuLx1gAQT0zhaWD+ZVlivt3wpwhNcYA9mqS42W+kEANhet3l6Y0l3hRDDTNX
         WDkv3n78SutcMh/fzEzGDmFWnqso5eeHkyrvidlN2Z/XrxJRRRMxuzjhHmu+vb37cccQ
         jbvqdneUyjSuRvoJv4x5Sh/ZUI7tDiO3ihN8ezv+gMac4mu+518RYpOfyVGUIByWdlZe
         LwVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/SqE+rGHhIAo5p+o/YkLxI4Zz5iOXQLQudHzWF2Lh3o=;
        fh=T16pXOTFK1LaFVgEaIf6NpCjxT2VK2asauvksukN9Fw=;
        b=RFmXogqKtzhnL74qL+Fllu7/rQQpxCkz+OsgDuG5heH1ecKeBxl1oWqMRpglKyHCxI
         Q8ylu10hxvorO1jHvdAODJTrljfzrDkqdMorAkkPC2kP45PG4ZQH+m8VnviHnCzF4V6q
         EwhQZzSRAEM/odIpdXYJunYcnSDbDLpkS9Y5t7Bk92T1K7NpU2FlvSk9eijNTwtavdJQ
         lGH40nrDEAkdNtrpOO25q31yxLaKFB64Sa8C8eJND7kGaBwL6LeK84FvjRmCARbPVzjh
         NBeP5gXwpml1erxco8iEruHN4ofO43TWos4bbFzyFlPcyItB/I5E3rlAeTScGZJv+4oD
         WDTQ==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1780686209; x=1781291009; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/SqE+rGHhIAo5p+o/YkLxI4Zz5iOXQLQudHzWF2Lh3o=;
        b=sl8KXcjDRvxwK7QpUWRwnE3aGEVGOE4WXjhpb5vAXI5ndkSrnwSx33lFeRVGCgMBA9
         Q1RM7xFyYeXYkXc9mBo1Plmgk2NXb/cOkvUKJ78AEuEeKW82+U+hpRfSvcPTpYpUzow6
         DXqO6ZFTci17FirIdTHTMJ6OK1z30B6YKi4evHJEl33MOIwEgMZ/1Wq5dMTslLvIjOBe
         /d02878enP0/dXLUEDqbo2c5wEH8m1+RBANg+0afvzU5qKrZVxP3XIEa78PWGoOjZNYL
         1hB+EilvW5kC0EjGy1tu6riArFTO12gt1NZpAPVPV+c8tLf5HMyZSj1rjnfymkZQIKRI
         e1kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780686209; x=1781291009;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/SqE+rGHhIAo5p+o/YkLxI4Zz5iOXQLQudHzWF2Lh3o=;
        b=qAymR5Jmd0/qAhQ9rpkpXZ/jxJzEAVp4Fl7Cb96BdWT5GvvuoX8AN7txADt/+svKXa
         NpmcNx16RM29AKWem0E2XCDltTs2BVkjCuvPVpETPZHZopVz98hWsRbLgVWYlo86ieGN
         OkX2dyH75TdxBAZwUSnukX4PIhjSA887I5I1f0PdggeavXdlT4i3bCpsjdrJbp+B5fED
         7xfaRsJ48iopkJpE8Im/vQgdNJC2UzSZHvQCUsjOI4W3yOoGfdb7TpbMe2B/5dMAGutK
         XghmGdV2Q0b/rZBSeliCMjgdbE+WZCLPTchtqLl33PIL8c7+ExXY1v4rih/Tno1lDlN0
         FjAQ==
X-Forwarded-Encrypted: i=1; AFNElJ9lxNiwsXXV4NGaq41UDvSQtsyoggbiPr809xl9gpahmP+ksVnN1yqTrVj7Z0amyACYSiZ3MbOn@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YyIoaL48PQl1sEdAnePZyhAeAoLlqjydYtdTUIaybWCtLX5JOMT
	b7XoZj0cnQm2ZXIptylI0UGNBemro7759zdHuax9n0arlHwQXfQ4TRa1XN8Gra50OXrbq/nbv+l
	RZXCCNspNojYmLZM58hkp9VSqE5zRY91Kjmz+RGM0
X-Gm-Gg: Acq92OHD4xsv2PglVxhKxFmP3mCA8hHZNFQPaNZF+gwAv6GRPQJISk8NgRuH97Cq1+L
	86NcO6W16D9hO5D3IKN03HSUgvNR0DvBYzPYe0sG7sACur787FShlZ7dCxUl61UMDs9Q21X0YzF
	J8rfWUqu3X/c6vZpl++NXLZ7ZZfMLb78MeaKToTbTapPJ71Yf4xTorp4UUaIPSSv/ir1yC/CsJf
	tKMD46OrghtE5YeMslfe0J2lrZLyEP/0fypO+31XO+wpTyxJv7COxs/cZMTVfqwHnSRbaDBBahI
	WH022183I8eP9kCyVpl9kxOxKGg=
X-Received: by 2002:a05:690e:1381:b0:65d:7db3:5598 with SMTP id
 956f58d0204a3-66106e00e55mr4433317d50.1.1780686208823; Fri, 05 Jun 2026
 12:03:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260605121720.1850683-1-m-shah@ti.com> <18B642C341E11CFB.61226@lists.yoctoproject.org>
In-Reply-To: <18B642C341E11CFB.61226@lists.yoctoproject.org>
From: Jon Cormier <jcormier@criticallink.com>
Date: Fri, 5 Jun 2026 15:03:17 -0400
X-Gm-Features: AVHnY4LAO4JCyPL1MwVQu7N_JJ-V48bDqIOvx1u5stXo6p0ybPuYQE173BzZVk8
Message-ID: <CADL8D3b=QQz0UNLj0f0pdLkZdnc7fH6dwozPHWTH-QQAoy00tQ@mail.gmail.com>
Subject: Re: [meta-ti][master/wrynose][PATCH v3] initramfs: Add
 initramfs-module-netsetup recipe for NFS boot
To: jcormier@criticallink.com
Cc: m-shah@ti.com, meta-ti@lists.yoctoproject.org, reatmon@ti.com, nm@ti.com, 
	u-kumar1@ti.com, s-vadapalli@ti.com, a-limaye@ti.com, gehariprasath@ti.com, 
	denys@konsulko.com
Content-Type: multipart/alternative; boundary="000000000000ef03dd0653865021"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 05 Jun 2026 19:03:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19982

--000000000000ef03dd0653865021
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 5, 2026 at 2:28=E2=80=AFPM Jon Cormier via lists.yoctoproject.o=
rg
<jcormier=3Dcriticallink.com@lists.yoctoproject.org> wrote:

> On Fri, Jun 5, 2026 at 8:17=E2=80=AFAM Moteen Shah via lists.yoctoproject=
.org
> <m-shah=3Dti.com@lists.yoctoproject.org> wrote:
> >
> > Add a standalone initramfs-module-netsetup recipe that installs
> > 83-netsetup, an initramfs-framework module that configures the network
> > interface via DHCP before the NFS root mount. The recipe's RDEPENDS
> > pulls in CPSW and its dependencies, so the kernel modules and DHCP
> > client are only included when NFS boot support is needed.
> >
> > Include initramfs-module-netsetup in packagegroup-ti-core-initramfs
> > gated on :bsp-next, where AM65_CPSW_NUSS became a loadable module.
> > TI staging kernels (6.6/6.12/6.18) still have CPSW built-in (=3Dy).
> >
> > Signed-off-by: Moteen Shah <m-shah@ti.com>
> > ---
> > Hi everyone,
> > AM65_CPSW_NUSS and its dependencies changed from built-in (=3Dy) to
> > loadable modules (=3Dm) in linux-next. This breaks NFS boot because the
> > Ethernet driver is no longer available before the NFS root mount.
> >
> > Add a standalone initramfs-module-netsetup recipe that waits for the
> > Ethernet interface to appear after udev loads the modules and then
> > configures it via DHCP before the nfsrootfs module runs. The CPSW
> > kernel modules are declared as RDEPENDS:append:bsp-next of the recipe
> > so they are only pulled in for bsp-next kernels and only when NFS boot
> > support is needed.
> >
> > Changes in v3:
> > - Remove FILESEXTRAPATHS:prepend - redundant in a standalone recipe
> (Denys)
> > - Remove PACKAGE_ARCH =3D "${MACHINE_ARCH}" - script is not
> machine-specific (Denys)
> > - Drop k3.inc patch; move CPSW modules into RDEPENDS:append:bsp-next of
> >   the recipe, linking module inclusion to NFS boot recipe inclusion
> > - Gate initramfs-module-netsetup on :bsp-next in packagegroup so stagin=
g
> >   kernels (where CPSW is built-in =3Dy) are unaffected
> >
> >  .../initramfs-module-netsetup/83-netsetup     | 54 +++++++++++++++++++
> >  .../initramfs-module-netsetup_1.0.bb          | 31 +++++++++++
> >  .../packagegroup-ti-core-initramfs.bb         |  2 +
> >  3 files changed, 87 insertions(+)
> >  create mode 100644
> meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-netsetup
> >  create mode 100644 meta-ti-bsp/recipes-ti/initramfs/
> initramfs-module-netsetup_1.0.bb
> >
> > diff --git
> a/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-netsetup
> b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-netsetup
> > new file mode 100644
> > index 00000000..b71bc3b3
> > --- /dev/null
> > +++
> b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-netsetup
> > @@ -0,0 +1,54 @@
> > +#!/bin/sh
> > +# Configure network via DHCP before NFS root mount. Polls for an
> Ethernet
> > +# interface with sleep 1 per iteration to allow the Ethernet driver
> deferred
> > +# probe chain to settle after udev loads the modules.
> > +
> > +netsetup_enabled() {
> > +    [ "${bootparam_root}" =3D "/dev/nfs" ] || return 1
> > +    return 0
> > +}
> > +
> > +netsetup_run() {
> > +    local iface timeout devtype
> > +
> > +    # Extract interface from ip=3D kernel param (format:
> client:server:gw:mask:host:device:autoconf)
> > +    iface=3D""
> > +    case "${bootparam_ip}" in
> > +        dhcp|on|any|"")
> > +            ;;
> > +        *)
> > +            iface=3D$(echo "${bootparam_ip}" | cut -d: -f6)
> > +            ;;
> > +    esac
> > +
> > +    udevadm trigger --action=3Dadd --subsystem-match=3Dnet
> > +    udevadm settle --timeout=3D10
> > +
> > +    # Poll up to 60 seconds for an Ethernet interface (ARPHRD_ETHER =
=3D
> type 1).
> > +    msg "netsetup: waiting for ethernet interface..."
> > +    timeout=3D60
> > +    while [ "${timeout}" -gt 0 ]; do
> > +        if [ -n "${iface}" ] && [ -d "/sys/class/net/${iface}" ]; then
> > +            break
> > +        fi
> > +        for dev in /sys/class/net/*; do
> > +            [ -f "${dev}/type" ] || continue
> > +            devtype=3D$(cat "${dev}/type")
> > +            [ "${devtype}" =3D "1" ] || continue
> > +            iface=3D$(basename "${dev}")
> > +            break
> > +        done
> > +        [ -n "${iface}" ] && [ -d "/sys/class/net/${iface}" ] && break
> > +        sleep 1
> > +        timeout=3D$((timeout - 1))
> > +    done
> > +
> > +    if [ -z "${iface}" ] || [ ! -d "/sys/class/net/${iface}" ]; then
> > +        msg "netsetup: no ethernet interface found after 60s, skipping
> DHCP"
> > +        return
> > +    fi
> > +
> > +    msg "netsetup: configuring ${iface} via DHCP"
> > +
> > +    dhcpcd --waitip "${iface}"
>
Additionally I believe this should have been executed as a oneshot, I.E. no
background service which won't survive the switch-root.
For dhcpcd --oneshot --waitip "${iface}"
For udhcpc -q -i "${iface}"

> > +}
> > diff --git a/meta-ti-bsp/recipes-ti/initramfs/
> initramfs-module-netsetup_1.0.bb b/meta-ti-bsp/recipes-ti/initramfs/
> initramfs-module-netsetup_1.0.bb
> > new file mode 100644
> > index 00000000..cdb6116a
> > --- /dev/null
> > +++ b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb
> > @@ -0,0 +1,31 @@
> > +SUMMARY =3D "initramfs support for DHCP network configuration before N=
FS
> root mount"
> > +
> > +LICENSE =3D "MIT"
> > +LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de204=
20"
> > +
> > +SRC_URI =3D "file://83-netsetup"
> > +
> > +S =3D "${UNPACKDIR}"
> > +
> > +do_install() {
> > +    install -d ${D}/init.d
> > +    install -m 0755 ${UNPACKDIR}/83-netsetup ${D}/init.d/83-netsetup
> > +}
> > +
> > +FILES:${PN} =3D "/init.d/83-netsetup"
> > +
> > +RDEPENDS:${PN} =3D "\
> > +    initramfs-framework-base \
> > +    dhcpcd \
> Sorry, I didn't notice this earlier. Is there a reason not to use
> busybox-udhcpc which is already included?
>
> This adds two packages:
> +dhcpcd aarch64 10.3.0-r0.0
> +libudev1 aarch64 1:259.5-r0.arago7.0
>
> And increased the size by 1.6MB on arago-wrynose
>  +1,685,504  ti-core-initramfs.cpio
>  +327,560  ti-core-initramfs.cpio.xz
>
> > +"
> > +
> > +RDEPENDS:${PN}:append:bsp-next =3D " \
> > +    kernel-module-ti-am65-cpsw-nuss \
> > +    kernel-module-k3-cppi-desc-pool \
> > +    kernel-module-davinci-mdio \
> > +    kernel-module-ti-cpsw-ale \
> > +    kernel-module-ti-cpsw-sl \
> > +    kernel-module-phylink \
> > +    kernel-module-mdio-bitbang \
> > +    kernel-module-phy-gmii-sel \
> > +"
> > diff --git a/meta-ti-bsp/recipes-ti/initramfs/
> packagegroup-ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/
> packagegroup-ti-core-initramfs.bb
> > index a9eff847..b4e6adff 100644
> > --- a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.b=
b
> > +++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.b=
b
> > @@ -23,3 +23,5 @@ RDEPENDS:${PN} +=3D "\
> >      initramfs-module-nfsrootfs \
> >      nfs-utils-mount \
> >  "
> > +
> > +RDEPENDS:${PN}:append:bsp-next =3D " initramfs-module-netsetup"
> > --
> > 2.34.1
> >
> >
> >
> >
>
>
> --
> Jonathan Cormier
> Senior Software Engineer
>
> Office:  315.425.4045 x222
>
> http://www.CriticalLink.com
> 6712 Brooklawn Parkway, Syracuse, NY 13211
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19981):
> https://lists.yoctoproject.org/g/meta-ti/message/19981
> Mute This Topic: https://lists.yoctoproject.org/mt/119661032/7902621
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [
> jcormier@criticallink.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Jonathan Cormier
Senior Software Engineer

Office:  315.425.4045 x222

http://www.CriticalLink.com <http://www.criticallink.com/>
6712 Brooklawn Parkway, Syracuse, NY 13211

--000000000000ef03dd0653865021
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 5, =
2026 at 2:28=E2=80=AFPM Jon Cormier via <a href=3D"http://lists.yoctoprojec=
t.org">lists.yoctoproject.org</a> &lt;jcormier=3D<a href=3D"mailto:critical=
link.com@lists.yoctoproject.org">criticallink.com@lists.yoctoproject.org</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
Fri, Jun 5, 2026 at 8:17=E2=80=AFAM Moteen Shah via <a href=3D"http://lists=
.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.=
org</a><br>
&lt;m-shah=3D<a href=3D"mailto:ti.com@lists.yoctoproject.org" target=3D"_bl=
ank">ti.com@lists.yoctoproject.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Add a standalone initramfs-module-netsetup recipe that installs<br>
&gt; 83-netsetup, an initramfs-framework module that configures the network=
<br>
&gt; interface via DHCP before the NFS root mount. The recipe&#39;s RDEPEND=
S<br>
&gt; pulls in CPSW and its dependencies, so the kernel modules and DHCP<br>
&gt; client are only included when NFS boot support is needed.<br>
&gt;<br>
&gt; Include initramfs-module-netsetup in packagegroup-ti-core-initramfs<br=
>
&gt; gated on :bsp-next, where AM65_CPSW_NUSS became a loadable module.<br>
&gt; TI staging kernels (6.6/6.12/6.18) still have CPSW built-in (=3Dy).<br=
>
&gt;<br>
&gt; Signed-off-by: Moteen Shah &lt;<a href=3D"mailto:m-shah@ti.com" target=
=3D"_blank">m-shah@ti.com</a>&gt;<br>
&gt; ---<br>
&gt; Hi everyone,<br>
&gt; AM65_CPSW_NUSS and its dependencies changed from built-in (=3Dy) to<br=
>
&gt; loadable modules (=3Dm) in linux-next. This breaks NFS boot because th=
e<br>
&gt; Ethernet driver is no longer available before the NFS root mount.<br>
&gt;<br>
&gt; Add a standalone initramfs-module-netsetup recipe that waits for the<b=
r>
&gt; Ethernet interface to appear after udev loads the modules and then<br>
&gt; configures it via DHCP before the nfsrootfs module runs. The CPSW<br>
&gt; kernel modules are declared as RDEPENDS:append:bsp-next of the recipe<=
br>
&gt; so they are only pulled in for bsp-next kernels and only when NFS boot=
<br>
&gt; support is needed.<br>
&gt;<br>
&gt; Changes in v3:<br>
&gt; - Remove FILESEXTRAPATHS:prepend - redundant in a standalone recipe (D=
enys)<br>
&gt; - Remove PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot; - script is not =
machine-specific (Denys)<br>
&gt; - Drop k3.inc patch; move CPSW modules into RDEPENDS:append:bsp-next o=
f<br>
&gt;=C2=A0 =C2=A0the recipe, linking module inclusion to NFS boot recipe in=
clusion<br>
&gt; - Gate initramfs-module-netsetup on :bsp-next in packagegroup so stagi=
ng<br>
&gt;=C2=A0 =C2=A0kernels (where CPSW is built-in =3Dy) are unaffected<br>
&gt;<br>
&gt;=C2=A0 .../initramfs-module-netsetup/83-netsetup=C2=A0 =C2=A0 =C2=A0| 5=
4 +++++++++++++++++++<br>
&gt;=C2=A0 .../<a href=3D"http://initramfs-module-netsetup_1.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">initramfs-module-netsetup_1.0.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 31 +++++++++++<br>
&gt;=C2=A0 .../<a href=3D"http://packagegroup-ti-core-initramfs.bb" rel=3D"=
noreferrer" target=3D"_blank">packagegroup-ti-core-initramfs.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +<br>
&gt;=C2=A0 3 files changed, 87 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-mo=
dule-netsetup/83-netsetup<br>
&gt;=C2=A0 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/<a href=3D"h=
ttp://initramfs-module-netsetup_1.0.bb" rel=3D"noreferrer" target=3D"_blank=
">initramfs-module-netsetup_1.0.bb</a><br>
&gt;<br>
&gt; diff --git a/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetu=
p/83-netsetup b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/=
83-netsetup<br>
&gt; new file mode 100644<br>
&gt; index 00000000..b71bc3b3<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-ne=
tsetup<br>
&gt; @@ -0,0 +1,54 @@<br>
&gt; +#!/bin/sh<br>
&gt; +# Configure network via DHCP before NFS root mount. Polls for an Ethe=
rnet<br>
&gt; +# interface with sleep 1 per iteration to allow the Ethernet driver d=
eferred<br>
&gt; +# probe chain to settle after udev loads the modules.<br>
&gt; +<br>
&gt; +netsetup_enabled() {<br>
&gt; +=C2=A0 =C2=A0 [ &quot;${bootparam_root}&quot; =3D &quot;/dev/nfs&quot=
; ] || return 1<br>
&gt; +=C2=A0 =C2=A0 return 0<br>
&gt; +}<br>
&gt; +<br>
&gt; +netsetup_run() {<br>
&gt; +=C2=A0 =C2=A0 local iface timeout devtype<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 # Extract interface from ip=3D kernel param (format: cl=
ient:server:gw:mask:host:device:autoconf)<br>
&gt; +=C2=A0 =C2=A0 iface=3D&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 case &quot;${bootparam_ip}&quot; in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 dhcp|on|any|&quot;&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iface=3D$(echo &quot;${boot=
param_ip}&quot; | cut -d: -f6)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; +=C2=A0 =C2=A0 esac<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 udevadm trigger --action=3Dadd --subsystem-match=3Dnet<=
br>
&gt; +=C2=A0 =C2=A0 udevadm settle --timeout=3D10<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 # Poll up to 60 seconds for an Ethernet interface (ARPH=
RD_ETHER =3D type 1).<br>
&gt; +=C2=A0 =C2=A0 msg &quot;netsetup: waiting for ethernet interface...&q=
uot;<br>
&gt; +=C2=A0 =C2=A0 timeout=3D60<br>
&gt; +=C2=A0 =C2=A0 while [ &quot;${timeout}&quot; -gt 0 ]; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n &quot;${iface}&quot; ] &amp;&amp;=
 [ -d &quot;/sys/class/net/${iface}&quot; ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for dev in /sys/class/net/*; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -f &quot;${dev}/type&quot=
; ] || continue<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 devtype=3D$(cat &quot;${dev=
}/type&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ &quot;${devtype}&quot; =
=3D &quot;1&quot; ] || continue<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iface=3D$(basename &quot;${=
dev}&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -n &quot;${iface}&quot; ] &amp;&amp; [ =
-d &quot;/sys/class/net/${iface}&quot; ] &amp;&amp; break<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sleep 1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 timeout=3D$((timeout - 1))<br>
&gt; +=C2=A0 =C2=A0 done<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if [ -z &quot;${iface}&quot; ] || [ ! -d &quot;/sys/cla=
ss/net/${iface}&quot; ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg &quot;netsetup: no ethernet interface=
 found after 60s, skipping DHCP&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 msg &quot;netsetup: configuring ${iface} via DHCP&quot;=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 dhcpcd --waitip &quot;${iface}&quot;<br></blockquote><d=
iv>Additionally I believe this should have been executed as a oneshot, I.E.=
 no background service which won&#39;t survive the switch-root.=C2=A0</div>=
<div>For dhcpcd --oneshot --waitip &quot;${iface}&quot;</div><div>For udhcp=
c -q -i &quot;${iface}&quot;</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt; +}<br>
&gt; diff --git a/meta-ti-bsp/recipes-ti/initramfs/<a href=3D"http://initra=
mfs-module-netsetup_1.0.bb" rel=3D"noreferrer" target=3D"_blank">initramfs-=
module-netsetup_1.0.bb</a> b/meta-ti-bsp/recipes-ti/initramfs/<a href=3D"ht=
tp://initramfs-module-netsetup_1.0.bb" rel=3D"noreferrer" target=3D"_blank"=
>initramfs-module-netsetup_1.0.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 00000000..cdb6116a<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-ti-bsp/recipes-ti/initramfs/<a href=3D"http://initramfs-mod=
ule-netsetup_1.0.bb" rel=3D"noreferrer" target=3D"_blank">initramfs-module-=
netsetup_1.0.bb</a><br>
&gt; @@ -0,0 +1,31 @@<br>
&gt; +SUMMARY =3D &quot;initramfs support for DHCP network configuration be=
fore NFS root mount&quot;<br>
&gt; +<br>
&gt; +LICENSE =3D &quot;MIT&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/meta/COPYING.MIT;md5=3D=
3da9cfbcb788c80a0384361b4de20420&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;file://83-netsetup&quot;<br>
&gt; +<br>
&gt; +S =3D &quot;${UNPACKDIR}&quot;<br>
&gt; +<br>
&gt; +do_install() {<br>
&gt; +=C2=A0 =C2=A0 install -d ${D}/init.d<br>
&gt; +=C2=A0 =C2=A0 install -m 0755 ${UNPACKDIR}/83-netsetup ${D}/init.d/83=
-netsetup<br>
&gt; +}<br>
&gt; +<br>
&gt; +FILES:${PN} =3D &quot;/init.d/83-netsetup&quot;<br>
&gt; +<br>
&gt; +RDEPENDS:${PN} =3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 initramfs-framework-base \<br>
&gt; +=C2=A0 =C2=A0 dhcpcd \<br>
Sorry, I didn&#39;t notice this earlier. Is there a reason not to use<br>
busybox-udhcpc which is already included?<br>
<br>
This adds two packages:<br>
+dhcpcd aarch64 10.3.0-r0.0<br>
+libudev1 aarch64 1:259.5-r0.arago7.0<br>
<br>
And increased the size by 1.6MB on arago-wrynose<br>
=C2=A0+1,685,504=C2=A0 ti-core-initramfs.cpio<br>
=C2=A0+327,560=C2=A0 ti-core-initramfs.cpio.xz<br>
<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +RDEPENDS:${PN}:append:bsp-next =3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 kernel-module-ti-am65-cpsw-nuss \<br>
&gt; +=C2=A0 =C2=A0 kernel-module-k3-cppi-desc-pool \<br>
&gt; +=C2=A0 =C2=A0 kernel-module-davinci-mdio \<br>
&gt; +=C2=A0 =C2=A0 kernel-module-ti-cpsw-ale \<br>
&gt; +=C2=A0 =C2=A0 kernel-module-ti-cpsw-sl \<br>
&gt; +=C2=A0 =C2=A0 kernel-module-phylink \<br>
&gt; +=C2=A0 =C2=A0 kernel-module-mdio-bitbang \<br>
&gt; +=C2=A0 =C2=A0 kernel-module-phy-gmii-sel \<br>
&gt; +&quot;<br>
&gt; diff --git a/meta-ti-bsp/recipes-ti/initramfs/<a href=3D"http://packag=
egroup-ti-core-initramfs.bb" rel=3D"noreferrer" target=3D"_blank">packagegr=
oup-ti-core-initramfs.bb</a> b/meta-ti-bsp/recipes-ti/initramfs/<a href=3D"=
http://packagegroup-ti-core-initramfs.bb" rel=3D"noreferrer" target=3D"_bla=
nk">packagegroup-ti-core-initramfs.bb</a><br>
&gt; index a9eff847..b4e6adff 100644<br>
&gt; --- a/meta-ti-bsp/recipes-ti/initramfs/<a href=3D"http://packagegroup-=
ti-core-initramfs.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-ti-=
core-initramfs.bb</a><br>
&gt; +++ b/meta-ti-bsp/recipes-ti/initramfs/<a href=3D"http://packagegroup-=
ti-core-initramfs.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-ti-=
core-initramfs.bb</a><br>
&gt; @@ -23,3 +23,5 @@ RDEPENDS:${PN} +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 initramfs-module-nfsrootfs \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 nfs-utils-mount \<br>
&gt;=C2=A0 &quot;<br>
&gt; +<br>
&gt; +RDEPENDS:${PN}:append:bsp-next =3D &quot; initramfs-module-netsetup&q=
uot;<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
-- <br>
Jonathan Cormier<br>
Senior Software Engineer<br>
<br>
Office:=C2=A0 315.425.4045 x222<br>
<br>
<a href=3D"http://www.CriticalLink.com" rel=3D"noreferrer" target=3D"_blank=
">http://www.CriticalLink.com</a><br>
6712 Brooklawn Parkway, Syracuse, NY 13211<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#19981): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/19981" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-ti/message/19981</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/119661032/790=
2621" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/119661032/7902621</a><br>
Group Owner: <a href=3D"mailto:meta-ti%2Bowner@lists.yoctoproject.org" targ=
et=3D"_blank">meta-ti+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-ti/unsub" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/meta-ti/=
unsub</a> [<a href=3D"mailto:jcormier@criticallink.com" target=3D"_blank">j=
cormier@criticallink.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><div><div><div><div><div><div><div>Jonathan Cormier<br>Senio=
r Software Engineer<br><br>Office: =C2=A0315.425.4045 x222</div><div><img s=
rc=3D"https://www.criticallink.com/wp-content/uploads/critical-link-logo-em=
ail.png"><br></div><div><div><a href=3D"http://www.criticallink.com/" targe=
t=3D"_blank">http://www.CriticalLink.com</a></div></div></div>6712 Brooklaw=
n Parkway, Syracuse, NY 13211 </div></div></div></div></div><br></div></div=
></div>

--000000000000ef03dd0653865021--

