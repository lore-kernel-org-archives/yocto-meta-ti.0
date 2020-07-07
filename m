Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.21167.1594142165529442868
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Jul 2020 10:16:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=QFFFKEDS;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: denys@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 067HG4wC068383
	for <meta-ti@lists.yoctoproject.org>; Tue, 7 Jul 2020 12:16:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1594142164;
	bh=lp1Gd1WffjG69yyEJi3cxmQlaxPSgMLeEkoZnRdHrE4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=QFFFKEDSR8AzpINVTmWuvZhS9u0yLCA8oGPxKLFoHbG9zwNr91V50Njaqwc1Xei/5
	 ZrldqnUaQMiXzmiMVS6+8pfh2jc4XBSBpv9v3HXDpBysp4csS2qasMahuSM1OtA2F6
	 tKAiH61gZj0p2jB2pK+K3rSZwzrCNpI/eTwLsCIA=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 067HG4gV053434
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 7 Jul 2020 12:16:04 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 7 Jul
 2020 12:16:04 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 7 Jul 2020 12:16:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 067HG3ch026666;
	Tue, 7 Jul 2020 12:16:04 -0500
Date: Tue, 7 Jul 2020 13:16:03 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Murali Karicheri <m-karicheri2@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] prueth-hsr/prp: add hsr/prp firmware recipe for version 2.15.23
Message-ID: <20200707171603.GH22569@beryl>
References: <20200706215958.1520-1-m-karicheri2@ti.com>
 <20200707161714.GA22569@beryl>
 <98b71962-1b6e-ccb0-e49f-67df58a0796b@ti.com>
 <20200707164050.GB22569@beryl>
 <06b776cc-5e09-b3eb-d612-5a4cce9ca397@ti.com>
MIME-Version: 1.0
In-Reply-To: <06b776cc-5e09-b3eb-d612-5a4cce9ca397@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jul 07, 2020 at 12:47:30PM -0400, Murali Karicheri wrote:
> Denys,
> 
> On 7/7/20 12:40 PM, Denys Dmytriyenko wrote:
> >On Tue, Jul 07, 2020 at 12:29:53PM -0400, Murali Karicheri wrote:
> >>Denys,
> >>
> >>On 7/7/20 12:17 PM, Denys Dmytriyenko wrote:
> >>>Thank you, everything looks fine. Could you please replace DESCRIPTION with
> >>>SUMMARY? Thanks.
> >>>
> Is there any other recipe needed to get this into the file system or
> this is it?
> 
> I would be sending a iproute2 recipe update as well. Would need a file
> system with these two in next few days.

You'd need to add it to a correspinding packagegroup in meta-arago.

Denys


> Regards,
> 
> Murali
> >>
> >>You mean the below right? Once you confirm I will spin v2 and send it.
> >>
> >>Thanks
> >>
> >>>Denys
> >>>
> >>>
> >>>On Mon, Jul 06, 2020 at 05:59:58PM -0400, Murali Karicheri wrote:
> >>>>This patch adds recipe for hsr/prp firmware on am3/4/5 SoCs. The binary
> >>>>files are located on ti-linux-firmware.git. This is a forward port of
> >>>>the recipe from processor sdk 6.3
> >>>>
> >>>>Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> >>>>Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
> >>>>---
> >>>>  recipes-bsp/pruhsr-fw/pruhsr-fw_git.bb | 36 +++++++++++++++++++++++++
> >>>>  recipes-bsp/pruprp-fw/pruprp-fw_git.bb | 37 ++++++++++++++++++++++++++
> >>>>  2 files changed, 73 insertions(+)
> >>>>  create mode 100644 recipes-bsp/pruhsr-fw/pruhsr-fw_git.bb
> >>>>  create mode 100644 recipes-bsp/pruprp-fw/pruprp-fw_git.bb
> >>>>
> >>>>diff --git a/recipes-bsp/pruhsr-fw/pruhsr-fw_git.bb b/recipes-bsp/pruhsr-fw/pruhsr-fw_git.bb
> >>>>new file mode 100644
> >>>>index 000000000000..fd6665f29d17
> >>>>--- /dev/null
> >>>>+++ b/recipes-bsp/pruhsr-fw/pruhsr-fw_git.bb
> >>>>@@ -0,0 +1,36 @@
> >>>>+DESCRIPTION = "PRU HSR firmware for AM57xx"
> >>
> >>SUMMARY = "PRU HSR firmware for AM57xx"
> >
> >Correct.
> >
> >
> >>>>+
> >>>>+LICENSE = "TI-TFL"
> >>>>+LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
> >>>>+
> >>>>+PV = "2.15.23"
> >>>>+PE = "1"
> >>>>+PR = "r0"
> >>>>+
> >>>>+COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
> >>>>+
> >>>>+PACKAGE_ARCH = "${MACHINE_ARCH}"
> >>>>+
> >>>>+SRCREV = "313e20f312a286bc07b97ef9aca70ef3ce96af29"
> >>>>+BRANCH ?= "ti-linux-firmware"
> >>>>+
> >>>>+SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
> >>>>+
> >>>>+S = "${WORKDIR}/git"
> >>>>+
> >>>>+TARGET = ""
> >>>>+TARGET_ti33x = "am335x-pru0-pruhsr-fw.elf am335x-pru1-pruhsr-fw.elf"
> >>>>+TARGET_ti43x = "am437x-pru0-pruhsr-fw.elf am437x-pru1-pruhsr-fw.elf"
> >>>>+TARGET_am57xx-evm = "am57xx-pru0-pruhsr-fw.elf am57xx-pru1-pruhsr-fw.elf"
> >>>>+TARGET_am57xx-hs-evm = "am57xx-pru0-pruhsr-fw.elf am57xx-pru1-pruhsr-fw.elf"
> >>>>+
> >>>>+do_install() {
> >>>>+	install -d ${D}${base_libdir}/firmware/ti-pruss
> >>>>+	for f in ${TARGET}; do
> >>>>+		install -m 0644 ${S}/ti-pruss/$f ${D}${base_libdir}/firmware/ti-pruss/$f
> >>>>+	done
> >>>>+}
> >>>>+
> >>>>+FILES_${PN} = "${base_libdir}/firmware"
> >>>>+
> >>>>+INSANE_SKIP_${PN} = "arch"
> >>>>diff --git a/recipes-bsp/pruprp-fw/pruprp-fw_git.bb b/recipes-bsp/pruprp-fw/pruprp-fw_git.bb
> >>>>new file mode 100644
> >>>>index 000000000000..0b9991a5a0a3
> >>>>--- /dev/null
> >>>>+++ b/recipes-bsp/pruprp-fw/pruprp-fw_git.bb
> >>>>@@ -0,0 +1,37 @@
> >>>>+DESCRIPTION = "PRU PRP firmware for AM57xx"
> >>
> >>SUMMARY = "PRU PRP firmware for AM57xx"
> >>
> >>>>+
> >>>>+LICENSE = "TI-TFL"
> >>>>+LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
> >>>>+
> >>>>+PV = "2.15.23"
> >>>>+PE = "1"
> >>>>+PR = "r0"
> >>>>+
> >>>>+COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
> >>>>+
> >>>>+PACKAGE_ARCH = "${MACHINE_ARCH}"
> >>>>+
> >>>>+SRCREV = "313e20f312a286bc07b97ef9aca70ef3ce96af29"
> >>>>+BRANCH ?= "ti-linux-firmware"
> >>>>+
> >>>>+SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
> >>>>+
> >>>>+S = "${WORKDIR}/git"
> >>>>+
> >>>>+TARGET = ""
> >>>>+TARGET_ti33x = "am335x-pru0-pruprp-fw.elf am335x-pru1-pruprp-fw.elf"
> >>>>+TARGET_ti43x = "am437x-pru0-pruprp-fw.elf am437x-pru1-pruprp-fw.elf"
> >>>>+TARGET_am57xx-evm = "am57xx-pru0-pruprp-fw.elf am57xx-pru1-pruprp-fw.elf"
> >>>>+TARGET_am57xx-hs-evm = "am57xx-pru0-pruprp-fw.elf am57xx-pru1-pruprp-fw.elf"
> >>>>+
> >>>>+
> >>>>+do_install() {
> >>>>+	install -d ${D}${base_libdir}/firmware/ti-pruss
> >>>>+	for f in ${TARGET}; do
> >>>>+		install -m 0644 ${S}/ti-pruss/$f ${D}${base_libdir}/firmware/ti-pruss/$f
> >>>>+	done
> >>>>+}
> >>>>+
> >>>>+FILES_${PN} = "${base_libdir}/firmware"
> >>>>+
> >>>>+INSANE_SKIP_${PN} = "arch"
> >>>>-- 
> >>>>2.17.1
> >>>>
> >>
> >>-- 
> >>Murali Karicheri
> >>Texas Instruments
> 
> -- 
> Murali Karicheri
> Texas Instruments
