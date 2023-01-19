Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1DEAC004D4
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 22:17:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.59797.1674166667156479203
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Jan 2023 14:17:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1759840C90;
	Thu, 19 Jan 2023 22:17:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KFKZVuDsr6T6; Thu, 19 Jan 2023 22:17:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E86DC40C2B;
	Thu, 19 Jan 2023 22:17:44 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 54E05163701; Thu, 19 Jan 2023 17:17:26 -0500 (EST)
Date: Thu, 19 Jan 2023 17:17:26 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [master/kirkstone][PATCH v2 2/2] ti-sgx-ddk-um: use
 udev for userspace initialization
Message-ID: <20230119221726.GM22689@denix.org>
References: <20230119102952.8161-1-matthias.schiffer@ew.tq-group.com>
 <20230119102952.8161-2-matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119102952.8161-2-matthias.schiffer@ew.tq-group.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Jan 2023 22:17:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15600

On Thu, Jan 19, 2023 at 11:29:52AM +0100, Matthias Schiffer wrote:
> The ti-sgx-ddk driver requires an additional userspace initialization
> step after the kernel module has probed the device. Without this
> initialization, no EGL context can be created and Weston etc. will fail to
> start.
> 
> The driver package contains an init script, but this does not work on pure
> systemd-based systems without sysvinit compat support (as provided by the
> systemd-compat-units package). Introduce an enabled-by-default
> PACKAGECONFIG that installs a udev rule instead to run the init command
> automatically when the driver is loaded, solving the issue without
> depending on a specific init system. On builds without udev, this
> PACKAGECONFIG can be disabled, reverting to the old init script-based
> solution.
> 
> udev reports several events when the pvrsrvkm module is loaded:
> 
> - add event for the kernel module
> - add events for two DRM devices
> - bind event for the GPU platform device
> 
> The DRM devices aren't nice to match on, and the kernel module add is
> too early to run `pvrsrvctl --start`, so we trigger on the platform
> device bind.
> 
> Tested with Weston 9.0.0 on the AM65x-based TQ-Systems MBa65xx.

Quick question - does this also apply to Rogue graphics recipe in 
ti-img-rogue-umlibs recipe?


> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
> 
> v2: applied review suggestions:
> - Removed 'local' shell directive from recipe
> - Improved commit description
> 
>  .../libgles/ti-sgx-ddk-um/pvrsrvkm.rules      |  1 +
>  .../libgles/ti-sgx-ddk-um_1.17.4948957.bb     | 23 ++++++++++++++++++-
>  2 files changed, 23 insertions(+), 1 deletion(-)
>  create mode 100644 meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um/pvrsrvkm.rules
> 
> diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um/pvrsrvkm.rules b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um/pvrsrvkm.rules
> new file mode 100644
> index 00000000..e49fd9b8
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um/pvrsrvkm.rules
> @@ -0,0 +1 @@
> +SUBSYSTEM=="platform", ACTION=="bind", ENV{DRIVER}=="pvrsrvkm", RUN+="/usr/bin/pvrsrvctl --start --no-module"
> diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> index bd88d14d..bc56e705 100644
> --- a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> +++ b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> @@ -14,7 +14,10 @@ PR = "r37"
>  
>  BRANCH = "ti-img-sgx/dunfell/${PV}"
>  
> -SRC_URI = "git://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git;protocol=https;branch=${BRANCH}"
> +SRC_URI = " \
> +    git://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git;protocol=https;branch=${BRANCH} \
> +    file://pvrsrvkm.rules \
> +"
>  SRCREV = "742cf38aba13e1ba1a910cf1f036a1a212c263b6"
>  
>  TARGET_PRODUCT:omap-a15 = "jacinto6evm"
> @@ -27,6 +30,9 @@ INITSCRIPT_PARAMS = "defaults 8"
>  
>  inherit update-rc.d
>  
> +PACKAGECONFIG ??= "udev"
> +PACKAGECONFIG[udev] = ",,,udev"
> +
>  PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 virtual/libgbm"
>  
>  DEPENDS += "libdrm udev wayland wayland-protocols libffi expat"
> @@ -56,6 +62,20 @@ do_install () {
>      oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT}
>      ln -sf libGLESv2.so.2 ${D}${libdir}/libGLESv2.so.1
>  
> +    without_sysvinit=${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'false', 'true', d)}
> +    with_udev=${@bb.utils.contains('PACKAGECONFIG', 'udev', 'true', 'false', d)}
> +
> +    # Delete initscript if it is not needed or would conflict with the udev rules
> +    if $without_sysvinit || $with_udev; then
> +        rm -rf ${D}${sysconfdir}/init.d
> +        rmdir --ignore-fail-on-non-empty ${D}${sysconfdir}
> +    fi
> +
> +    if $with_udev; then
> +        install -m644 -D ${WORKDIR}/pvrsrvkm.rules \
> +            ${D}${nonarch_base_libdir}/udev/rules.d/80-pvrsrvkm.rules
> +    fi
> +
>      chown -R root:root ${D}
>  }
>  
> @@ -63,6 +83,7 @@ FILES:${PN} =  "${bindir}/*"
>  FILES:${PN} += " ${libdir}/*"
>  FILES:${PN} +=  "${includedir}/*"
>  FILES:${PN} +=  "${sysconfdir}/*"
> +FILES:${PN} += "${nonarch_base_libdir}/udev/rules.d"
>  
>  INSANE_SKIP:${PN} += "dev-so ldflags useless-rpaths"
>  INSANE_SKIP:${PN} += "already-stripped dev-deps"
> -- 
> 2.34.1
> 

