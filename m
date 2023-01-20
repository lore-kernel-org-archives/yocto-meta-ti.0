Return-Path: <matthias.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67724C05027
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 09:41:57 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web10.70585.1674207715399367244
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 20 Jan 2023 01:41:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=E5zEBgfc;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: matthias.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674207715; x=1705743715;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=r7uEn4G5ZbtEZQp9N0b9ggOZy/rnkNVgdXvzypJen70=;
  b=E5zEBgfcxLCECDhIrH8cmdlCqgh4GxwkBciJhQkWkoxK8RMay6l1MddC
   Z5ZgmGBpS6a70ArmWDFVbB1I+vroZ+AB4P/quQK/71p8Wg7BaUzicKtee
   LQjB0FrtmEKWbbnvnGaUBtu9d5hwiM3g4AzRKvlnJD+aeS9RuAG8Ya+Gv
   1ifNGdhqrGjEVOJl+SDFKG6boQNnoOtUgRrLcGzapcZyEe4Ypsn9ZXXf0
   EuBWZAe0joLSIDu0D9Q+ntcVthGX4EcjmB84X6wtsXmbzzmNzWOubdDqL
   4614X5H60M2SUpZ+gy8I9VRAuRE7L8129gexCGOO49o2yl9qAKZAe8Emb
   g==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669071600"; 
   d="scan'208";a="28554218"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 20 Jan 2023 10:41:52 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 20 Jan 2023 10:41:52 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Fri, 20 Jan 2023 10:41:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674207712; x=1705743712;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=r7uEn4G5ZbtEZQp9N0b9ggOZy/rnkNVgdXvzypJen70=;
  b=J1qUMbt4en/L+D6aRK2aEgcNvZaSaW6AToa96TXTtXSWCftKNB9pbrTq
   nFw2ZBesXBJv6kfvcm6FLO++96UanTRmTh14sziBj/SCEWCF+4R+08Hbi
   Eg3r2oQFyZCbNC2i/k3uqBFZnin/MU+I1+rtwuGPi3Epola1tJn0rDvpl
   ts2x9Wq3yLE8b4cRbs3+x29cDooeAovgXI09kgKxweyoom5lbSDv8QYBD
   hhPVc9JksV/Z7i030acPdWxxKVSWw+klzJjc7NsugPQQQn49DAL8CX755
   /k0Lq6WtKdnE66vrLXgLLdjPVjv+4AhXltOtVMCcwWCkaCobCvmgxJyxA
   g==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669071600"; 
   d="scan'208";a="28554217"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 20 Jan 2023 10:41:52 +0100
Received: from [192.168.2.129] (SCHIFFERM-M2.tq-net.de [10.121.49.14])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 34E73280056;
	Fri, 20 Jan 2023 10:41:52 +0100 (CET)
Message-ID: <ae9222a5ae92c93a2352738927ab25d92f3e841e.camel@ew.tq-group.com>
Subject: Re: [meta-ti] [master/kirkstone][PATCH v2 2/2] ti-sgx-ddk-um: use
 udev for userspace initialization
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org
Date: Fri, 20 Jan 2023 10:41:50 +0100
In-Reply-To: <20230119221726.GM22689@denix.org>
References: <20230119102952.8161-1-matthias.schiffer@ew.tq-group.com>
	 <20230119102952.8161-2-matthias.schiffer@ew.tq-group.com>
	 <20230119221726.GM22689@denix.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 20 Jan 2023 09:41:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15609

On Thu, 2023-01-19 at 17:17 -0500, Denys Dmytriyenko wrote:
> On Thu, Jan 19, 2023 at 11:29:52AM +0100, Matthias Schiffer wrote:
> > The ti-sgx-ddk driver requires an additional userspace initialization
> > step after the kernel module has probed the device. Without this
> > initialization, no EGL context can be created and Weston etc. will fail=
 to
> > start.
> >=20
> > The driver package contains an init script, but this does not work on p=
ure
> > systemd-based systems without sysvinit compat support (as provided by t=
he
> > systemd-compat-units package). Introduce an enabled-by-default
> > PACKAGECONFIG that installs a udev rule instead to run the init command
> > automatically when the driver is loaded, solving the issue without
> > depending on a specific init system. On builds without udev, this
> > PACKAGECONFIG can be disabled, reverting to the old init script-based
> > solution.
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
>=20
> Quick question - does this also apply to Rogue graphics recipe in=20
> ti-img-rogue-umlibs recipe?

We don't have any boards that use ti-img-rogue-umlibs for now at TQ,
but looking at the initscript, there are a few differences - in
particular, nothing in the initscript calls a driver-specific userspace
tool.

What the initscript does differs between the dunfell and kirkstone
branches - on dunfell, it doesn't only load the kernel module, but also
starts Weston.

On the recently added kirkstone branch, this was reduced to only load
the kernel module. So if the kernel modules correctly specifies its
aliases (which I think it does), udev should already load it by itself,
making the initscript entirely redundant on kirkstone-based systems
with udev.

In conclusion, ti-img-rogue-umlibs should already work out-of-the-box
on pure systemd systems. As a minor optimization, the recipe could be
adjusted to remove the initscript when DISTRO_FEATURES doesn't have
sysvinit, to avoid installing the unused script.


>=20
>=20
> > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> > ---
> >=20
> > v2: applied review suggestions:
> > - Removed 'local' shell directive from recipe
> > - Improved commit description
> >=20
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
> > index bd88d14d..bc56e705 100644
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
> > +    without_sysvinit=3D${@bb.utils.contains('DISTRO_FEATURES', 'sysvin=
it', 'false', 'true', d)}
> > +    with_udev=3D${@bb.utils.contains('PACKAGECONFIG', 'udev', 'true', =
'false', d)}
> > +
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
> > +
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
> >=20


