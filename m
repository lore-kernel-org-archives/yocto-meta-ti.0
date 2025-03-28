Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51A88C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 17:32:30 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.146.1743183141302106920
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 28 Mar 2025 10:32:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 88AD040C83;
	Fri, 28 Mar 2025 17:32:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sOittLaVbtmX; Fri, 28 Mar 2025 17:32:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 35D8340BA8;
	Fri, 28 Mar 2025 17:32:13 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9695116475A; Fri, 28 Mar 2025 13:32:12 -0400 (EDT)
Date: Fri, 28 Mar 2025 13:32:12 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Beleswar Prasad Padhi <b-padhi@ti.com>
Cc: reatmon@ti.com, denys@konsulko.com, a-limaye@ti.com, afd@ti.com,
	u-kumar1@ti.com, meta-ti@lists.yoctoproject.org,
	"Anna, Suman" <s-anna@ti.com>
Subject: Re: [meta-ti] [master/scarthgap][PATCH] ti-hsm-fw: Add a recipe to
 export prebuilt HSM firmware
Message-ID: <20250328173212.GX23729@denix.org>
References: <20250327092323.1726839-1-b-padhi@ti.com>
 <20250327184520.GW23729@denix.org>
 <c9858c09-a8e0-4965-8574-3de234d290d2@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9858c09-a8e0-4965-8574-3de234d290d2@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 28 Mar 2025 17:32:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18436

On Fri, Mar 28, 2025 at 10:20:08AM +0530, Beleswar Prasad Padhi wrote:
> Hi Denys,
> 
> On 28/03/25 00:15, Denys Dmytriyenko wrote:
> >On Thu, Mar 27, 2025 at 02:53:23PM +0530, Beleswar Padhi via lists.yoctoproject.org wrote:
> >>Add a recipe to deploy the HSM firmware to the DEPLOYDIR, to be picked
> >>up by the tisdk-core-bundle for the prebuilt binaries directory.

The commit message says the firmware only needs to be deployed for packaging 
into the SDK bundle.


> >>Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> >>---
> >>  .../recipes-bsp/ti-hsm-fw/ti-hsm-fw_git.bb    | 28 +++++++++++++++++++
> >>  .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |  1 +
> >>  meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  |  4 +++
> >>  3 files changed, 33 insertions(+)
> >>  create mode 100644 meta-ti-bsp/recipes-bsp/ti-hsm-fw/ti-hsm-fw_git.bb
> >>
> >>diff --git a/meta-ti-bsp/recipes-bsp/ti-hsm-fw/ti-hsm-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-hsm-fw/ti-hsm-fw_git.bb
> >>new file mode 100644
> >>index 00000000..8b225421
> >>--- /dev/null
> >>+++ b/meta-ti-bsp/recipes-bsp/ti-hsm-fw/ti-hsm-fw_git.bb
> >>@@ -0,0 +1,28 @@
> >>+SUMMARY = "TI HSM Firmware"
> >>+
> >>+inherit deploy
> >>+
> >>+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> >>+
> >>+PACKAGE_ARCH = "${MACHINE_ARCH}"
> >>+
> >>+PV = "${TI_HSM_FW_VERSION}"
> >>+PR = "${INC_PR}.0"
> >>+
> >>+SYSFW_SOC ?= "*"
> >>+SYSFW_SOC:j721s2 = "j721s2"
> >>+SYSFW_SOC:j784s4 = "j784s4"
> >This variable is normally set by k3r5 machine configs and used for a different
> >purpose.
> >
> >Re-using it here for another purpose may be confusing, should a new variable
> >be used instead?
> 
> 
> Sure we can have something like HSM_FW_SOC or so.
> 
> >
> >Also, if the firmware is only applicable to j721s2 and j784s4, should there be
> >a corresponding COMPATIBLE_MACHINE?
> 
> 
> I put this ti-hsm-fw recipe as a depedency in the u-boot-ti.inc file
> for j721s2 and j784s4 boards. Does that not serve the same purpose
> as COMPATIBLE_MACHINE? Or am I missing something?

Not exactly the same - see below.


> >>+HSM_BINARY = "hsm-demo-firmware-${SYSFW_SOC}*.bin"
> >What would happen if this gets pulled by other non compatible platforms and
> >SYSFW_SOC is set to * above?
> 
> 
> This should not be pulled by other platforms since we have the
> dependency in u-boot-ti.inc (correct me if I am wrong). If it does
> though, all the available HSM demo firmwares will be copied to that
> non-compatible platform.

So, I was trying to understand how it is supposed to be used and how do you 
prevent incorrect usage. E.g. if someone accidentally pulls this package 
either directly or indirectly, what should be the behavior?

1. If you set COMPATIBLE_MACHINE in the recipe, any use by incompatible 
platform will result in a build failure

2. Alternatively, you could get corresponding FW images deployed and packaged 
for compatible platforms, but deploy/package nothing for incompatible ones 
w/o hard failure - in that case you want to avoid wildcards in the path/name 
and maybe do a conditional copy/install, in other places we sometimes do a 
"for" loop so it can be empty...

3. Or, as Andrew suggested, just package all FW images regardless of the 
platform and let build/runtime logic sort them out


> >>+do_install() {
> >>+	install -d ${D}${nonarch_base_libdir}/firmware/ti-hsm
> >>+	install -m 644 ${S}/ti-hsm/${HSM_BINARY} ${D}${nonarch_base_libdir}/firmware/ti-hsm
> >>+}

Here you intall the FW images into the rootfs to be used by the system, 
presumably the kernel?


> >>+do_deploy() {
> >>+	install -d ${DEPLOYDIR}/ti-hsm
> >>+	install -m 644 ${S}/ti-hsm/${HSM_BINARY} ${DEPLOYDIR}/ti-hsm
> >>+}

Here you deploy them for SDK bundle (and U-boot packaging)


> >>+addtask deploy before do_build after do_compile
> >>diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> >>index 0d912625..4e9c385c 100644
> >>--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> >>+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> >>@@ -16,6 +16,7 @@ IMG_DEC_FW_VERSION = "1.0"
> >>  CNM_WAVE521_FW_VERSION = "1.0.7"
> >>  TI_DM_FW_VERSION = "11.00.09"
> >>  TI_SYSFW_VERSION = "11.00.07"
> >>+TI_HSM_FW_VERSION = "11.00.09"
> >>  TI_LINUX_FW_SRCREV ?= "27003b6bff61a55dd1fff2cc777e5e07b092b1f7"
> >>  SRCREV = "${TI_LINUX_FW_SRCREV}"
> >>diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> >>index 41d4abdd..8a800193 100644
> >>--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> >>+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> >>@@ -40,6 +40,10 @@ DEPENDS += "python3-pyelftools-native python3-pyyaml-native python3-jsonschema-n
> >>  DEPENDS:append:k3 = " ti-sci-fw"
> >>  DEPENDS:append:k3r5 = " ti-sci-fw"
> >>+# HSM Firmware is only applicable for J721S2 & J784S4 devices
> >>+DEPENDS:append:j721s2 = " ti-hsm-fw"
> >>+DEPENDS:append:j784s4 = " ti-hsm-fw"
> >Why are these DEPENDS in U-boot? Is the firmware being packaged there?
> 
> 
> Yes this firmware is packaged inside U-Boot (tispl.bin FIT image)
> and hence is a build time dependency.

First of all, that's not what the commit message above says.

Second, if they get packaged into tispl.bin FIT image, why do you need to 
install them into the rootfs under /lib/firmware/ti-hsm?

From the recipe it's not obvious and someone will try to add ti-hsm-fw package 
to the image...

-- 
Denys

