Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD71C636D6
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 01:39:36 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1180.1677116374665324373
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Feb 2023 17:39:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9DBE640C2B;
	Thu, 23 Feb 2023 01:39:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gMmD3eSLXkBD; Thu, 23 Feb 2023 01:39:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7E9B440BD6;
	Thu, 23 Feb 2023 01:39:02 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 01D7B163764; Wed, 22 Feb 2023 20:38:26 -0500 (EST)
Date: Wed, 22 Feb 2023 20:38:26 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [master/kirkstone][PATCH 2/2] ti-sgx-ddk-um: use
 udev for userspace initialization
Message-ID: <20230223013826.GJ22689@denix.org>
References: <20221216130139.20841-1-matthias.schiffer@ew.tq-group.com>
 <20221216130139.20841-2-matthias.schiffer@ew.tq-group.com>
 <20221219210029.GU22689@denix.org>
 <38b94bc6ee2f585eddbe7461ecd1d02f4ced08ab.camel@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38b94bc6ee2f585eddbe7461ecd1d02f4ced08ab.camel@ew.tq-group.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 Feb 2023 01:39:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15924

So, testing the latest patch series, I started getting breakage on all SGX 
platforms:

WARNING: tisdk-default-image-1.0-r0 do_rootfs: ti-sgx-ddk-um.postinst returned 1, marking as unpacked only, configuration required on target.
ERROR: tisdk-default-image-1.0-r0 do_rootfs: Postinstall scriptlets of ['ti-sgx-ddk-um'] have failed. If the intention is to defer them to first boot,
then please place them into pkg_postinst_ontarget:${PN} ().
Deferring to first boot via 'exit 1' is no longer supported.
Details of the failure are in /OE/arago-kirkstone/build/arago-tmp-default-glibc/work/am335x_evm-oe-linux-gnueabi/tisdk-default-image/1.0-r0/temp/log.do_rootfs.
ERROR: Logfile of failure stored in: /OE/arago-kirkstone/build/arago-tmp-default-glibc/work/am335x_evm-oe-linux-gnueabi/tisdk-default-image/1.0-r0/temp/log.do_rootfs.156835
ERROR: Task (/OE/arago-kirkstone/sources/meta-arago/meta-arago-distro/recipes-core/images/tisdk-default-image.bb:do_rootfs) failed with exit code '1'


WARNING: tisdk-default-image-1.0-r0 do_rootfs: ti-sgx-ddk-um.postinst returned 1, marking as unpacked only, configuration required on target.
ERROR: tisdk-default-image-1.0-r0 do_rootfs: Postinstall scriptlets of ['ti-sgx-ddk-um'] have failed. If the intention is to defer them to first boot,
then please place them into pkg_postinst_ontarget:${PN} ().
Deferring to first boot via 'exit 1' is no longer supported.
Details of the failure are in /OE/arago-kirkstone/build/arago-tmp-default-glibc/work/am57xx_evm-oe-linux-gnueabi/tisdk-default-image/1.0-r0/temp/log.do_rootfs.
ERROR: Logfile of failure stored in: /OE/arago-kirkstone/build/arago-tmp-default-glibc/work/am57xx_evm-oe-linux-gnueabi/tisdk-default-image/1.0-r0/temp/log.do_rootfs.164346
ERROR: Task (/OE/arago-kirkstone/sources/meta-arago/meta-arago-distro/recipes-core/images/tisdk-default-image.bb:do_rootfs) failed with exit code '1'


WARNING: tisdk-default-image-1.0-r0 do_rootfs: ti-sgx-ddk-um.postinst returned 1, marking as unpacked only, configuration required on target.
ERROR: tisdk-default-image-1.0-r0 do_rootfs: Postinstall scriptlets of ['ti-sgx-ddk-um'] have failed. If the intention is to defer them to first boot,
then please place them into pkg_postinst_ontarget:${PN} ().
Deferring to first boot via 'exit 1' is no longer supported.
Details of the failure are in /OE/arago-kirkstone/build/arago-tmp-default-glibc/work/am65xx_evm-oe-linux/tisdk-default-image/1.0-r0/temp/log.do_rootfs.
ERROR: Logfile of failure stored in: /OE/arago-kirkstone/build/arago-tmp-default-glibc/work/am65xx_evm-oe-linux/tisdk-default-image/1.0-r0/temp/log.do_rootfs.159785
ERROR: Task (/OE/arago-kirkstone/sources/meta-arago/meta-arago-distro/recipes-core/images/tisdk-default-image.bb:do_rootfs) failed with exit code '1'


Reverting this commit helps with the build:
https://git.yoctoproject.org/meta-ti/commit/?h=kirkstone&id=f50f55102f926ba58ea22339a98e4239370af6c6


So far I didn't have time to dig deeper, though it's not obvious right away...

-- 
Denys


On Tue, Dec 20, 2022 at 10:10:41AM +0100, Matthias Schiffer wrote:
> On Mon, 2022-12-19 at 16:00 -0500, Denys Dmytriyenko wrote:
> > On Fri, Dec 16, 2022 at 02:01:39PM +0100, Matthias Schiffer wrote:
> > > The ti-sgx-ddk driver requires an additional userspace initialization
> > > step after the kernel module has probed the device. Without this
> > > initialization, no EGL context can be created and Weston etc. will fail to
> > > start.
> > > 
> > > The driver package contains an init script, but this does not work on
> > > systemd-based systems.
> > 
> > Why? Please provide more details. Do you use systemd-compat-units?
> 
> Ah, we are not using systemd-compat-units. So this commit message
> should be more specific and mention that this is about pure systemd
> systems without SysVinit compat.
> 
> Given that /etc/init.d is empty except for "rc.pvr" in a simple Poky-
> based setup with ti-sgx-ddk-um when "sysvinit" is not in
> DISTRO_FEATURES, I understand that it is a good practice for packages
> not to rely on systemd-compat-units.
> 
> > 
> > 
> > > Introduce an enabled-by-default PACKAGECONFIG that
> > > installs a udev rule instead to run the init command automatically when
> > > the driver is loaded, solving the issue without depending on a specific
> > > init system.
> > > 
> > > udev reports several events when the pvrsrvkm module is loaded:
> > > 
> > > - add event for the kernel module
> > > - add events for two DRM devices
> > > - bind event for the GPU platform device
> > > 
> > > The DRM devices aren't nice to match on, and the kernel module add is
> > > too early to run `pvrsrvctl --start`, so we trigger on the platform
> > > device bind.
> > > 
> > > Tested with Weston 9.0.0 on the AM65x-based TQ-Systems MBa65xx.
> > > 
> > > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> > > ---
> > >  .../libgles/ti-sgx-ddk-um/pvrsrvkm.rules      |  1 +
> > >  .../libgles/ti-sgx-ddk-um_1.17.4948957.bb     | 23 ++++++++++++++++++-
> > >  2 files changed, 23 insertions(+), 1 deletion(-)
> > >  create mode 100644 meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um/pvrsrvkm.rules
> > > 
> > > diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um/pvrsrvkm.rules b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um/pvrsrvkm.rules
> > > new file mode 100644
> > > index 00000000..e49fd9b8
> > > --- /dev/null
> > > +++ b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um/pvrsrvkm.rules
> > > @@ -0,0 +1 @@
> > > +SUBSYSTEM=="platform", ACTION=="bind", ENV{DRIVER}=="pvrsrvkm", RUN+="/usr/bin/pvrsrvctl --start --no-module"
> > > diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> > > index bd88d14d..2a8a0466 100644
> > > --- a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> > > +++ b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> > > @@ -14,7 +14,10 @@ PR = "r37"
> > >  
> > >  BRANCH = "ti-img-sgx/dunfell/${PV}"
> > >  
> > > -SRC_URI = "git://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git;protocol=https;branch=${BRANCH}"
> > > +SRC_URI = " \
> > > +    git://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git;protocol=https;branch=${BRANCH} \
> > > +    file://pvrsrvkm.rules \
> > > +"
> > >  SRCREV = "742cf38aba13e1ba1a910cf1f036a1a212c263b6"
> > >  
> > >  TARGET_PRODUCT:omap-a15 = "jacinto6evm"
> > > @@ -27,6 +30,9 @@ INITSCRIPT_PARAMS = "defaults 8"
> > >  
> > >  inherit update-rc.d
> > >  
> > > +PACKAGECONFIG ??= "udev"
> > > +PACKAGECONFIG[udev] = ",,,udev"
> > > +
> > >  PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 virtual/libgbm"
> > >  
> > >  DEPENDS += "libdrm udev wayland wayland-protocols libffi expat"
> > > @@ -56,6 +62,20 @@ do_install () {
> > >      oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT}
> > >      ln -sf libGLESv2.so.2 ${D}${libdir}/libGLESv2.so.1
> > >  
> > > +    local without_sysvinit=${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'false', 'true', d)}
> > > +    local with_udev=${@bb.utils.contains('PACKAGECONFIG', 'udev', 'true', 'false', d)}
> > 
> > While "local" is supported by dash and ash and is not a strictly bashism, it's 
> > still not part of the POSIX spec and should be avoided in the recipes:
> > https://www.shellcheck.net/wiki/SC3043
> 
> Makes sense. I was thrown off by seeing "local" used in a few recipes
> in Poky, but keeping this POSIX-compatible seems like a good idea.
> 
> > 
> > 
> > > +    # Delete initscript if it is not needed or would conflict with the udev rules
> > > +    if $without_sysvinit || $with_udev; then
> > > +        rm -rf ${D}${sysconfdir}/init.d
> > > +        rmdir --ignore-fail-on-non-empty ${D}${sysconfdir}
> > > +    fi
> > > +
> > > +    if $with_udev; then
> > > +        install -m644 -D ${WORKDIR}/pvrsrvkm.rules \
> > > +            ${D}${nonarch_base_libdir}/udev/rules.d/80-pvrsrvkm.rules
> > > +    fi
> > 
> > What happens when you use systemd with sysvinit PACKAGECONFIG that relies on 
> > initscripts in init.d?
> 
> If the "udev" PACKAGECONFIG of ti-sgx-ddk-um is set, no initscript is
> installed regardless of DISTRO_FEATURES, to avoid running pvrsrvctl
> twice on such systems.
> 
> This configuration should work with any init system, as long as some
> udev implementation (systemd udev or eudev) is running (which should be
> ensured by the RRDEPENDS added by PACKAGECONFIG[udev]). udev will
> automatically load the kernel module based on modaliases, and then the
> rule will run pvrsrvctl.
> 
> To allow building a system without udev, the "udev" PACKAGECONFIG can
> be disabled. If "sysvinit" is in DISTRO_FEATURES, "rc.pvr" will be
> installed and everything works like it always has.
> 
> Setups without the "udev" PACKAGECONFIG *and* without "sysvinit"
> DISTRO_FEATURES will not work out-of-the-box.
> 
> I decided to set the "udev" PACKAGECONFIG by default, as I consider it
> the most elegant solution, and it is also required by default by Xorg
> and Weston.
> 
> 
> Regards,
> Matthias
> 
> 
> > 
> > 
> > >      chown -R root:root ${D}
> > >  }
> > >  
> > > @@ -63,6 +83,7 @@ FILES:${PN} =  "${bindir}/*"
> > >  FILES:${PN} += " ${libdir}/*"
> > >  FILES:${PN} +=  "${includedir}/*"
> > >  FILES:${PN} +=  "${sysconfdir}/*"
> > > +FILES:${PN} += "${nonarch_base_libdir}/udev/rules.d"
> > >  
> > >  INSANE_SKIP:${PN} += "dev-so ldflags useless-rpaths"
> > >  INSANE_SKIP:${PN} += "already-stripped dev-deps"
> > > -- 
> > > 2.34.1

