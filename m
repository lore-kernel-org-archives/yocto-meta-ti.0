Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.20407.1594140052811178366
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Jul 2020 09:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=zC6cTUTO;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: denys@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 067Gepg7082811
	for <meta-ti@lists.yoctoproject.org>; Tue, 7 Jul 2020 11:40:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1594140051;
	bh=kGOq8zDLkDpIwUNrccwoT8yVNq8H4fkHOsTU96J8qIA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=zC6cTUTO3luzaOaMApXVTSVinmyaTgTPIYiYHfmInCstXL51ASIwcDw3jIo5s4wtM
	 KgcMUVeDpW+qq8gxDWDHSZUoLkMLyDlIua5XrJ0Z1v7D8B51gIQ97JKe6LvJxL9NkS
	 rw3FAsg8OC5uAwRCeekT/lVRocrn2PRx0jG/Ygp4=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 067GepNb127711
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 7 Jul 2020 11:40:51 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 7 Jul
 2020 11:40:51 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 7 Jul 2020 11:40:51 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 067GepKI100515;
	Tue, 7 Jul 2020 11:40:51 -0500
Date: Tue, 7 Jul 2020 12:40:50 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Murali Karicheri <m-karicheri2@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] prueth-hsr/prp: add hsr/prp firmware recipe for version 2.15.23
Message-ID: <20200707164050.GB22569@beryl>
References: <20200706215958.1520-1-m-karicheri2@ti.com>
 <20200707161714.GA22569@beryl>
 <98b71962-1b6e-ccb0-e49f-67df58a0796b@ti.com>
MIME-Version: 1.0
In-Reply-To: <98b71962-1b6e-ccb0-e49f-67df58a0796b@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jul 07, 2020 at 12:29:53PM -0400, Murali Karicheri wrote:
> Denys,
> 
> On 7/7/20 12:17 PM, Denys Dmytriyenko wrote:
> >Thank you, everything looks fine. Could you please replace DESCRIPTION with
> >SUMMARY? Thanks.
> >
> 
> You mean the below right? Once you confirm I will spin v2 and send it.
> 
> Thanks
> 
> >Denys
> >
> >
> >On Mon, Jul 06, 2020 at 05:59:58PM -0400, Murali Karicheri wrote:
> >>This patch adds recipe for hsr/prp firmware on am3/4/5 SoCs. The binary
> >>files are located on ti-linux-firmware.git. This is a forward port of
> >>the recipe from processor sdk 6.3
> >>
> >>Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> >>Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
> >>---
> >>  recipes-bsp/pruhsr-fw/pruhsr-fw_git.bb | 36 +++++++++++++++++++++++++
> >>  recipes-bsp/pruprp-fw/pruprp-fw_git.bb | 37 ++++++++++++++++++++++++++
> >>  2 files changed, 73 insertions(+)
> >>  create mode 100644 recipes-bsp/pruhsr-fw/pruhsr-fw_git.bb
> >>  create mode 100644 recipes-bsp/pruprp-fw/pruprp-fw_git.bb
> >>
> >>diff --git a/recipes-bsp/pruhsr-fw/pruhsr-fw_git.bb b/recipes-bsp/pruhsr-fw/pruhsr-fw_git.bb
> >>new file mode 100644
> >>index 000000000000..fd6665f29d17
> >>--- /dev/null
> >>+++ b/recipes-bsp/pruhsr-fw/pruhsr-fw_git.bb
> >>@@ -0,0 +1,36 @@
> >>+DESCRIPTION = "PRU HSR firmware for AM57xx"
> 
> SUMMARY = "PRU HSR firmware for AM57xx"

Correct.


> >>+
> >>+LICENSE = "TI-TFL"
> >>+LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
> >>+
> >>+PV = "2.15.23"
> >>+PE = "1"
> >>+PR = "r0"
> >>+
> >>+COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
> >>+
> >>+PACKAGE_ARCH = "${MACHINE_ARCH}"
> >>+
> >>+SRCREV = "313e20f312a286bc07b97ef9aca70ef3ce96af29"
> >>+BRANCH ?= "ti-linux-firmware"
> >>+
> >>+SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
> >>+
> >>+S = "${WORKDIR}/git"
> >>+
> >>+TARGET = ""
> >>+TARGET_ti33x = "am335x-pru0-pruhsr-fw.elf am335x-pru1-pruhsr-fw.elf"
> >>+TARGET_ti43x = "am437x-pru0-pruhsr-fw.elf am437x-pru1-pruhsr-fw.elf"
> >>+TARGET_am57xx-evm = "am57xx-pru0-pruhsr-fw.elf am57xx-pru1-pruhsr-fw.elf"
> >>+TARGET_am57xx-hs-evm = "am57xx-pru0-pruhsr-fw.elf am57xx-pru1-pruhsr-fw.elf"
> >>+
> >>+do_install() {
> >>+	install -d ${D}${base_libdir}/firmware/ti-pruss
> >>+	for f in ${TARGET}; do
> >>+		install -m 0644 ${S}/ti-pruss/$f ${D}${base_libdir}/firmware/ti-pruss/$f
> >>+	done
> >>+}
> >>+
> >>+FILES_${PN} = "${base_libdir}/firmware"
> >>+
> >>+INSANE_SKIP_${PN} = "arch"
> >>diff --git a/recipes-bsp/pruprp-fw/pruprp-fw_git.bb b/recipes-bsp/pruprp-fw/pruprp-fw_git.bb
> >>new file mode 100644
> >>index 000000000000..0b9991a5a0a3
> >>--- /dev/null
> >>+++ b/recipes-bsp/pruprp-fw/pruprp-fw_git.bb
> >>@@ -0,0 +1,37 @@
> >>+DESCRIPTION = "PRU PRP firmware for AM57xx"
> 
> SUMMARY = "PRU PRP firmware for AM57xx"
> 
> >>+
> >>+LICENSE = "TI-TFL"
> >>+LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
> >>+
> >>+PV = "2.15.23"
> >>+PE = "1"
> >>+PR = "r0"
> >>+
> >>+COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
> >>+
> >>+PACKAGE_ARCH = "${MACHINE_ARCH}"
> >>+
> >>+SRCREV = "313e20f312a286bc07b97ef9aca70ef3ce96af29"
> >>+BRANCH ?= "ti-linux-firmware"
> >>+
> >>+SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
> >>+
> >>+S = "${WORKDIR}/git"
> >>+
> >>+TARGET = ""
> >>+TARGET_ti33x = "am335x-pru0-pruprp-fw.elf am335x-pru1-pruprp-fw.elf"
> >>+TARGET_ti43x = "am437x-pru0-pruprp-fw.elf am437x-pru1-pruprp-fw.elf"
> >>+TARGET_am57xx-evm = "am57xx-pru0-pruprp-fw.elf am57xx-pru1-pruprp-fw.elf"
> >>+TARGET_am57xx-hs-evm = "am57xx-pru0-pruprp-fw.elf am57xx-pru1-pruprp-fw.elf"
> >>+
> >>+
> >>+do_install() {
> >>+	install -d ${D}${base_libdir}/firmware/ti-pruss
> >>+	for f in ${TARGET}; do
> >>+		install -m 0644 ${S}/ti-pruss/$f ${D}${base_libdir}/firmware/ti-pruss/$f
> >>+	done
> >>+}
> >>+
> >>+FILES_${PN} = "${base_libdir}/firmware"
> >>+
> >>+INSANE_SKIP_${PN} = "arch"
> >>-- 
> >>2.17.1
> >>
> 
> -- 
> Murali Karicheri
> Texas Instruments
