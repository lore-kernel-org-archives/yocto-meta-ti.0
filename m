Return-Path: <matthias.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 358B5C10F1E
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 09:10:52 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web10.46198.1671527447181107496
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 20 Dec 2022 01:10:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=kGXy7Y4M;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: matthias.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1671527447; x=1703063447;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=LNLqlcRkvTLPJLhUKKsma6csUEivMH4RTBrh47dgjjQ=;
  b=kGXy7Y4MZg6GgwNmIB/gDLM/2AhMdqCrn1sG5geX/tdQu1XxBMfuH+qO
   OjKz81UPtRNiHLrM0pNFwTCH6xy31dpYd/W9mv9vov8s/TGWuywviD4d4
   3D+tQWXlCvOf7NnPdBO7NCt+yH0SsfSdx9/4TnhmFqGnr41uDQzMMTnbj
   EhsM1Xm7OGUBaNA0N80R16VifDUbphpRpl28Qzy+hZxFxat5BpuKqaDdN
   +QWkp2pj1SP4sSU3mfjCBDTaAcHsIRbX2nGtBKR8sFrPQvPvgNiI+JhOI
   ccwv78/59D9Lt9qzWaYUYGSmnJCf3lPN9Ywfzuk5PX1SdXvPKIDUFM6km
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,259,1665439200"; 
   d="scan'208";a="28049214"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 20 Dec 2022 10:10:44 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 20 Dec 2022 10:10:44 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Tue, 20 Dec 2022 10:10:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1671527444; x=1703063444;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=LNLqlcRkvTLPJLhUKKsma6csUEivMH4RTBrh47dgjjQ=;
  b=ZOeQ3rVtPdNRFxQrdoFUj6zVrXYJjGedSs7Dlo8h3qGh5PF/CpTmrJ/H
   4TTfb2L0O2sw+ljJKnXQkTI9GHTa311rlqY8vOdV6bm7rRumDSpobsoHO
   ltG2oHluAz1KX3C6013/249kIoBPEhl1H1xWOvPdKl2NbnUhkP3oZTI6D
   pxTvMQA/E95I9P6IImSkxPoynJWQ1hFCZ0n070sXqHv+UaIxk1tfVKTse
   pF3Mbd2X+p1IzTlniAoxjXDS1mzd7ehRdptVnJCPO95c2GP2rbL9bdmTz
   UrKPutjixqRsvy+FMDqSSpb4uwAwAsxc+lF1dzjpGI0cC8EzGnZRbV70v
   w==;
X-IronPort-AV: E=Sophos;i="5.96,259,1665439200"; 
   d="scan'208";a="28049212"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 20 Dec 2022 10:10:44 +0100
Received: from [192.168.2.129] (SCHIFFERM-M2.tq-net.de [10.121.49.14])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id A0E76280056;
	Tue, 20 Dec 2022 10:10:43 +0100 (CET)
Message-ID: <38b94bc6ee2f585eddbe7461ecd1d02f4ced08ab.camel@ew.tq-group.com>
Subject: Re: [meta-ti] [master/kirkstone][PATCH 2/2] ti-sgx-ddk-um: use udev
 for userspace initialization
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org
Date: Tue, 20 Dec 2022 10:10:41 +0100
In-Reply-To: <20221219210029.GU22689@denix.org>
References: <20221216130139.20841-1-matthias.schiffer@ew.tq-group.com>
	 <20221216130139.20841-2-matthias.schiffer@ew.tq-group.com>
	 <20221219210029.GU22689@denix.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 20 Dec 2022 09:10:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15494

On Mon, 2022-12-19 at 16:00 -0500, Denys Dmytriyenko wrote:
> On Fri, Dec 16, 2022 at 02:01:39PM +0100, Matthias Schiffer wrote:
> > The ti-sgx-ddk driver requires an additional userspace initialization
> > step after the kernel module has probed the device. Without this
> > initialization, no EGL context can be created and Weston etc. will fail=
 to
> > start.
> >=20
> > The driver package contains an init script, but this does not work on
> > systemd-based systems.
>=20
> Why? Please provide more details. Do you use systemd-compat-units?

Ah, we are not using systemd-compat-units. So this commit message
should be more specific and mention that this is about pure systemd
systems without SysVinit compat.

Given that /etc/init.d is empty except for "rc.pvr" in a simple Poky-
based setup with ti-sgx-ddk-um when "sysvinit" is not in
DISTRO_FEATURES, I understand that it is a good practice for packages
not to rely on systemd-compat-units.

>=20
>=20
> > Introduce an enabled-by-default PACKAGECONFIG that
> > installs a udev rule instead to run the init command automatically when
> > the driver is loaded, solving the issue without depending on a specific
> > init system.
> >=20
> > udev reports several events when the pvrsrvkm module is loaded:
> >=20
> > - add event for the kernel module
> > - add events for two DRM devices
> > - bind event for the GPU platform device
> >=20
> > The DRM devices aren't nice to match on, and the kernel module add is
> > too early to run `pvrsrvctl --start`, so we trigger on the platform
> > device bind.
> >=20
> > Tested with Weston 9.0.0 on the AM65x-based TQ-Systems MBa65xx.
> >=20
> > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> > ---
> >  .../libgles/ti-sgx-ddk-um/pvrsrvkm.rules      |  1 +
> >  .../libgles/ti-sgx-ddk-um_1.17.4948957.bb     | 23 ++++++++++++++++++-
> >  2 files changed, 23 insertions(+), 1 deletion(-)
> >  create mode 100644 meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um/=
pvrsrvkm.rules
> >=20
> > diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um/pvrsrvk=
m.rules b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um/pvrsrvkm.rules
> > new file mode 100644
> > index 00000000..e49fd9b8
> > --- /dev/null
> > +++ b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um/pvrsrvkm.rules
> > @@ -0,0 +1 @@
> > +SUBSYSTEM=3D=3D"platform", ACTION=3D=3D"bind", ENV{DRIVER}=3D=3D"pvrsr=
vkm", RUN+=3D"/usr/bin/pvrsrvctl --start --no-module"
> > diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.49=
48957.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.=
bb
> > index bd88d14d..2a8a0466 100644
> > --- a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.b=
b
> > +++ b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.b=
b
> > @@ -14,7 +14,10 @@ PR =3D "r37"
> > =20
> >  BRANCH =3D "ti-img-sgx/dunfell/${PV}"
> > =20
> > -SRC_URI =3D "git://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git;=
protocol=3Dhttps;branch=3D${BRANCH}"
> > +SRC_URI =3D " \
> > +    git://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git;protocol=
=3Dhttps;branch=3D${BRANCH} \
> > +    file://pvrsrvkm.rules \
> > +"
> >  SRCREV =3D "742cf38aba13e1ba1a910cf1f036a1a212c263b6"
> > =20
> >  TARGET_PRODUCT:omap-a15 =3D "jacinto6evm"
> > @@ -27,6 +30,9 @@ INITSCRIPT_PARAMS =3D "defaults 8"
> > =20
> >  inherit update-rc.d
> > =20
> > +PACKAGECONFIG ??=3D "udev"
> > +PACKAGECONFIG[udev] =3D ",,,udev"
> > +
> >  PROVIDES +=3D "virtual/egl virtual/libgles1 virtual/libgles2 virtual/l=
ibgbm"
> > =20
> >  DEPENDS +=3D "libdrm udev wayland wayland-protocols libffi expat"
> > @@ -56,6 +62,20 @@ do_install () {
> >      oe_runmake install DESTDIR=3D${D} TARGET_PRODUCT=3D${TARGET_PRODUC=
T}
> >      ln -sf libGLESv2.so.2 ${D}${libdir}/libGLESv2.so.1
> > =20
> > +    local without_sysvinit=3D${@bb.utils.contains('DISTRO_FEATURES', '=
sysvinit', 'false', 'true', d)}
> > +    local with_udev=3D${@bb.utils.contains('PACKAGECONFIG', 'udev', 't=
rue', 'false', d)}
>=20
> While "local" is supported by dash and ash and is not a strictly bashism,=
 it's=20
> still not part of the POSIX spec and should be avoided in the recipes:
> https://www.shellcheck.net/wiki/SC3043

Makes sense. I was thrown off by seeing "local" used in a few recipes
in Poky, but keeping this POSIX-compatible seems like a good idea.

>=20
>=20
> > +    # Delete initscript if it is not needed or would conflict with the=
 udev rules
> > +    if $without_sysvinit || $with_udev; then
> > +        rm -rf ${D}${sysconfdir}/init.d
> > +        rmdir --ignore-fail-on-non-empty ${D}${sysconfdir}
> > +    fi
> > +
> > +    if $with_udev; then
> > +        install -m644 -D ${WORKDIR}/pvrsrvkm.rules \
> > +            ${D}${nonarch_base_libdir}/udev/rules.d/80-pvrsrvkm.rules
> > +    fi
>=20
> What happens when you use systemd with sysvinit PACKAGECONFIG that relies=
 on=20
> initscripts in init.d?

If the "udev" PACKAGECONFIG of ti-sgx-ddk-um is set, no initscript is
installed regardless of DISTRO_FEATURES, to avoid running pvrsrvctl
twice on such systems.

This configuration should work with any init system, as long as some
udev implementation (systemd udev or eudev) is running (which should be
ensured by the RRDEPENDS added by PACKAGECONFIG[udev]). udev will
automatically load the kernel module based on modaliases, and then the
rule will run pvrsrvctl.

To allow building a system without udev, the "udev" PACKAGECONFIG can
be disabled. If "sysvinit" is in DISTRO_FEATURES, "rc.pvr" will be
installed and everything works like it always has.

Setups without the "udev" PACKAGECONFIG *and* without "sysvinit"
DISTRO_FEATURES will not work out-of-the-box.

I decided to set the "udev" PACKAGECONFIG by default, as I consider it
the most elegant solution, and it is also required by default by Xorg
and Weston.


Regards,
Matthias


>=20
>=20
> >      chown -R root:root ${D}
> >  }
> > =20
> > @@ -63,6 +83,7 @@ FILES:${PN} =3D  "${bindir}/*"
> >  FILES:${PN} +=3D " ${libdir}/*"
> >  FILES:${PN} +=3D  "${includedir}/*"
> >  FILES:${PN} +=3D  "${sysconfdir}/*"
> > +FILES:${PN} +=3D "${nonarch_base_libdir}/udev/rules.d"
> > =20
> >  INSANE_SKIP:${PN} +=3D "dev-so ldflags useless-rpaths"
> >  INSANE_SKIP:${PN} +=3D "already-stripped dev-deps"
> > --=20
> > 2.34.1


