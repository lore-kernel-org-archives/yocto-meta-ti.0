Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C96C02193
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 19:08:59 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.124784.1738696133735640718
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 04 Feb 2025 11:08:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D057640C88;
	Tue,  4 Feb 2025 19:08:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qt9hWdaVcz_Y; Tue,  4 Feb 2025 19:08:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 980EE407E5;
	Tue,  4 Feb 2025 19:08:49 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4F8891641FB; Tue,  4 Feb 2025 14:08:49 -0500 (EST)
Date: Tue, 4 Feb 2025 14:08:49 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Andrew Davis <afd@ti.com>
Cc: c-shilwant@ti.com, meta-ti@lists.yoctoproject.org,
	Ryan Eatmon <reatmon@ti.com>
Subject: Re: [meta-ti][master/scarthgap][PATCH 2/3] meta-ti-bsp: Add
 Support for AM62L
Message-ID: <20250204190849.GI21608@denix.org>
References: <20250204134925.968150-1-c-shilwant@ti.com>
 <20250204134925.968150-3-c-shilwant@ti.com>
 <eb673423-a7e7-4d32-bf61-e1efad5e3f5a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb673423-a7e7-4d32-bf61-e1efad5e3f5a@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 04 Feb 2025 19:08:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18266

On Tue, Feb 04, 2025 at 10:42:46AM -0600, Andrew Davis wrote:
> On 2/4/25 7:49 AM, Chirag Shilwant via lists.yoctoproject.org wrote:
> >- Add machine configuration for am62lxx-evm
> >- Add TFA, OPTEE, firmware & u-boot overrides
> >
> >Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> >---
> >  meta-ti-bsp/conf/machine/am62lxx-evm.conf     | 16 ++++
> >  meta-ti-bsp/conf/machine/include/am62lxx.inc  | 14 ++++
> >  meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb  |  2 +
> >  .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    |  6 ++
> >  .../trusted-firmware-a-ti.inc                 |  3 +
> >  meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  | 21 ++++++
> >  .../Add-initial-support-for-AM62Lx-SoC.patch  | 75 +++++++++++++++++++
> >  .../optee/optee-os-ti-overrides.inc           |  1 +
> >  .../optee/optee-os_%.bbappend                 |  6 ++
> >  9 files changed, 144 insertions(+)
> >  create mode 100644 meta-ti-bsp/conf/machine/am62lxx-evm.conf
> >  create mode 100644 meta-ti-bsp/conf/machine/include/am62lxx.inc
> >  create mode 100644 meta-ti-bsp/recipes-security/optee/files/Add-initial-support-for-AM62Lx-SoC.patch

...

> >diff --git a/meta-ti-bsp/conf/machine/include/am62lxx.inc b/meta-ti-bsp/conf/machine/include/am62lxx.inc
> >new file mode 100644
> >index 00000000..94eadd4b
> >--- /dev/null
> >+++ b/meta-ti-bsp/conf/machine/include/am62lxx.inc
> >@@ -0,0 +1,14 @@
> >+require conf/machine/include/k3.inc
> >+SOC_FAMILY:append = ":am62lxx"
> >+
> >+MACHINE_FEATURES += "screen"
> >+
> >+# Default tiboot3.bin on AM62L is for HS-FS
> >+IMAGE_BOOT_FILES += "tiboot3-am62lx-hs-fs-evm.bin"
> >+
> >+TFA_BOARD = "am62l"
> >+TFA_K3_SYSTEM_SUSPEND = "1"
> >+
> >+OPTEEMACHINE = "k3-am62lx"
> >+
> >+SERIAL_CONSOLES = "115200;ttyS2"
> 
> Do the default SERIAL_CONSOLES in k3.inc not work?

Standard k3.inc defines ttyS0 and ttyS2 - I'm guessing this was overwritten 
here due to no R5 or to avoid re-spawning the gettty?


> >--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> >+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> >@@ -53,8 +53,10 @@ PLAT_SFX:am65xx = "am65xx"
> >  PLAT_SFX:am64xx = "am64xx"
> >  PLAT_SFX:am62xx = "am62xx"
> >  PLAT_SFX:am62axx = "am62axx"
> >+PLAT_SFX:am62lxx = "am62lxx"
> >  PLAT_SFX:am62pxx = "am62pxx"
> >+PACKAGECONFIG[ap-trusted-rom] = "BL1=${STAGING_DIR_HOST}/firmware/bl1.bin,,trusted-firmware-a"
> >  PACKAGECONFIG[atf] = "BL31=${STAGING_DIR_HOST}/firmware/bl31.bin,,trusted-firmware-a"
> >  PACKAGECONFIG[optee] = "TEE=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/bl32.bin,,optee-os"
> >  PACKAGECONFIG[dm] = "DM=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/ti-dm/${PLAT_SFX}/${DM_FIRMWARE},,ti-dm-fw"
> >@@ -68,6 +70,7 @@ PACKAGECONFIG:append:j722s = " dm"
> >  PACKAGECONFIG:append:j742s2 = " dm"
> >  PACKAGECONFIG:append:am62xx = " dm"
> >  PACKAGECONFIG:append:am62axx = " dm"
> >+PACKAGECONFIG:append:am62lxx = " ap-trusted-rom"
> >  PACKAGECONFIG:append:am62pxx = " dm"
> >  COMPATIBLE_MACHINE = "(ti-soc)"
> >@@ -226,6 +229,16 @@ uboot_deploy_config:append:k3r5 () {
> >  	done
> >  }
> >+uboot_deploy_config:append:am62lxx () {
> >+    for f in ${B}/${config}/tiboot3-*.bin; do
> >+                if [ -f "$f" ]; then
> 
> Seems to be some mixed tabs and spaces. That is already an issue in this
> file I see, but no reason to keep doing it. I would prefer tabs everywhere
> but not sure if there is a standard is in Yocto.

u-boot-ti.inc is an old file and received modifications over many years before 
there was any policy.

FTR, OE-Core official policy is to use tabs for shell code and 2-spcaes for 
Python code. But layer maintainers can adopt a slightly different policy that 
hopefully gets documented.

I'd suggest sticking to the OE-Core policy and I personally try to update 
indentation when I modify large chunks of code. But we haven't done any global 
cleanup for the same...

-- 
Denys

