Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE35C71157
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 17:42:13 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.25988.1750182128326180867
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Jun 2025 10:42:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id ABA0340C3E;
	Tue, 17 Jun 2025 17:42:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IyZnYdBZbmRV; Tue, 17 Jun 2025 17:42:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3478440A0B;
	Tue, 17 Jun 2025 17:42:00 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id DEDA516A59B; Tue, 17 Jun 2025 13:41:59 -0400 (EDT)
Date: Tue, 17 Jun 2025 13:41:59 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Bajjuri, Praneeth" <praneeth@ti.com>
Cc: Paresh Bhagat <p-bhagat@ti.com>, meta-ti@lists.yoctoproject.org,
	reatmon@ti.com, v-singh1@ti.com, c-shilwant@ti.com, khasim@ti.com,
	afd@ti.com
Subject: Re: [scarthgap][PATCH] recipes-bsp: Add TI TAD5212 DAC firmware
 recipe
Message-ID: <20250617174159.GH18383@denix.org>
References: <20250617101904.3686160-1-p-bhagat@ti.com>
 <1cfb1871-ca94-4c7e-af20-f2f5c5889176@ti.com>
 <20250617173711.GG18383@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617173711.GG18383@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Jun 2025 17:42:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18648

On Tue, Jun 17, 2025 at 01:37:11PM -0400, Denys Dmytriyenko wrote:
> On Tue, Jun 17, 2025 at 12:10:37PM -0500, Bajjuri, Praneeth wrote:
> > 
> > 
> > On 6/17/2025 5:19 AM, Paresh Bhagat wrote:
> > >From: Vishnu Singh <v-singh1@ti.com>
> > >
> > >Add TAD5212 DAC firmware images for am62dxx-evm to support two DAC
> > >configurations:
> > >- TAD5212_01.bin: Configures 1 DAC with stereo channel in i2s mode.
> > >- TAD5212_04.bin: Configures 4 DAC with each having stereo channel
> > >		  support in i2s mode.
> > >
> > >Signed-off-by: Vishnu Singh <v-singh1@ti.com>
> > >Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> > >---
> > >
> > >This patch depends on new DAC firmware patch on ti-linux-firmware.
> > >
> > >Boot logs
> > >https://gist.github.com/paresh-bhagat12/e4e2a7a1291d0f2d7acd0971bf2ed539
> > >
> > >
> > >  meta-ti-bsp/conf/machine/include/am62dxx.inc  |  2 ++
> > >  .../recipes-bsp/ti-dac-fw/ti-dac-fw.bb        | 20 +++++++++++++++++++
> > >  .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |  1 +
> > >  3 files changed, 23 insertions(+)
> > >  create mode 100644 meta-ti-bsp/recipes-bsp/ti-dac-fw/ti-dac-fw.bb
> > >
> > >diff --git a/meta-ti-bsp/conf/machine/include/am62dxx.inc b/meta-ti-bsp/conf/machine/include/am62dxx.inc
> > >index ac4e8e17..3c60acb1 100644
> > >--- a/meta-ti-bsp/conf/machine/include/am62dxx.inc
> > >+++ b/meta-ti-bsp/conf/machine/include/am62dxx.inc
> > >@@ -13,3 +13,5 @@ IMAGE_BOOT_FILES += "tiboot3-am62dx-hs-evm.bin"
> > >  TFA_BOARD = "lite"
> > >  OPTEEMACHINE = "k3-am62x"
> > >+
> > >+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "ti-dac-fw"
> > >diff --git a/meta-ti-bsp/recipes-bsp/ti-dac-fw/ti-dac-fw.bb b/meta-ti-bsp/recipes-bsp/ti-dac-fw/ti-dac-fw.bb
> > >new file mode 100644
> > >index 00000000..7d333b9e
> > >--- /dev/null
> > >+++ b/meta-ti-bsp/recipes-bsp/ti-dac-fw/ti-dac-fw.bb
> > >@@ -0,0 +1,20 @@
> > >+DESCRIPTION = "TI DAC TAD5212 config prebuild binary firmware"
> > >+
> > >+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> > >+
> > >+LICENSE = "TI-TFL"
> > >+LIC_FILES_CHKSUM = "file://${THISDIR}/../../licenses/TI-TFL;md5=a1b59cb7ba626b9dbbcbf00f3fbc438a"
> > 
> > not the correct license file.
> > update to match https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/commit/?h=ti-linux-firmware-next&id=ef1e9d0dd2c3ba0af102cea0edb7044a12c8fb5b
> > 
> > TI-TSPA
> 
> Praneeth,
> 
> TI-TSPA was replaced by TI-TFL back in 2014.
> 
> And LICENSE.ti in ti-linux-firmware repo seems to be the TI-TFL license:
> https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/tree/LICENSE.ti?h=ti-linux-firmware-next&id=ef1e9d0dd2c3ba0af102cea0edb7044a12c8fb5b
> 
> Which matches the TI-TFL license in meta-ti:
> https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/licenses/TI-TFL
> 
> For the reference, here's the old TI-TSPA license:
> https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/licenses/TI-TSPA
> 
> And here's the commit that refers to deprecating TI-TSPA in favor of TI-TFL:
> https://git.yoctoproject.org/meta-ti/commit/?id=0442fa03bc07bd70376522c290c1af254f7e77d4

Though, recipes-bsp/ti-linux-fw/ti-linux-fw.inc already specifies TI-TFL and 
points to LICENSE.ti file, so I guess Praneeth didn't mean TI-TSPA, but rather 
to use the LICENSE.ti file from ti-linux-firmware repo...


> > >+
> > >+PV = "${TAD5212_FW_VERSION}"
> > >+PR = "${INC_PR}.0"
> > >+
> > >+COMPATIBLE_MACHINE = "am62dxx"
> > >+
> > >+TAD5212_1DEV = "TAD5212_01.bin"
> > >+TAD5212_4DEV = "TAD5212_04.bin"
> > >+
> > >+do_install() {
> > >+	install -d ${D}${nonarch_base_libdir}/firmware
> > >+	install -m 0644 ${S}/ti/tad5212/${TAD5212_1DEV} ${D}${nonarch_base_libdir}/firmware/
> > >+	install -m 0644 ${S}/ti/tad5212/${TAD5212_4DEV} ${D}${nonarch_base_libdir}/firmware/
> > >+}
> > >diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> > >index d1dd9df3..08cd0b30 100644
> > >--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> > >+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> > >@@ -17,6 +17,7 @@ CNM_WAVE521_FW_VERSION = "1.0.8"
> > >  TI_DM_FW_VERSION = "11.00.09"
> > >  TI_SYSFW_VERSION = "11.01.00"
> > >  TI_HSM_DEMO_FW_VERSION = "11.00.09"
> > >+TAD5212_FW_VERSION = "1.0.0.0"
> > >  TI_LINUX_FW_SRCREV ?= "a37c82f0e25e0e3c99fdf03f1d57f7b08314a2bc"
> > >  SRCREV = "${TI_LINUX_FW_SRCREV}"

