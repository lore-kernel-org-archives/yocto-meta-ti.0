Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.19885.1594138636797850850
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Jul 2020 09:17:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ELFj0BhW;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: denys@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 067GHFEX093507
	for <meta-ti@lists.yoctoproject.org>; Tue, 7 Jul 2020 11:17:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1594138635;
	bh=KSvQVdJs5jhIuo2JOkZdL12l2hawZxwoSEBG9aiOG/A=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ELFj0BhWyAh5VL5Ns0Ar8NEJx5ZgP+SVJB6lyyQdL8E8I5XbfWZ0/Tj92j7HlNJbR
	 j6v7usQCkENYsuwo2bOnV+rQaySMXuAbPLz3fnvax2cXj3iA3t5N9XG+58S5PqeFzT
	 xwHR6ujJvHl5qN/K0bbhb6uHtjfCZT1zseexl1Cs=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 067GHF0H091835
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 7 Jul 2020 11:17:15 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 7 Jul
 2020 11:17:15 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 7 Jul 2020 11:17:15 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 067GHF6l047551;
	Tue, 7 Jul 2020 11:17:15 -0500
Date: Tue, 7 Jul 2020 12:17:15 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Murali Karicheri <m-karicheri2@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] prueth-hsr/prp: add hsr/prp firmware recipe for version 2.15.23
Message-ID: <20200707161714.GA22569@beryl>
References: <20200706215958.1520-1-m-karicheri2@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200706215958.1520-1-m-karicheri2@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thank you, everything looks fine. Could you please replace DESCRIPTION with 
SUMMARY? Thanks.

Denys


On Mon, Jul 06, 2020 at 05:59:58PM -0400, Murali Karicheri wrote:
> This patch adds recipe for hsr/prp firmware on am3/4/5 SoCs. The binary
> files are located on ti-linux-firmware.git. This is a forward port of
> the recipe from processor sdk 6.3
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
> ---
>  recipes-bsp/pruhsr-fw/pruhsr-fw_git.bb | 36 +++++++++++++++++++++++++
>  recipes-bsp/pruprp-fw/pruprp-fw_git.bb | 37 ++++++++++++++++++++++++++
>  2 files changed, 73 insertions(+)
>  create mode 100644 recipes-bsp/pruhsr-fw/pruhsr-fw_git.bb
>  create mode 100644 recipes-bsp/pruprp-fw/pruprp-fw_git.bb
> 
> diff --git a/recipes-bsp/pruhsr-fw/pruhsr-fw_git.bb b/recipes-bsp/pruhsr-fw/pruhsr-fw_git.bb
> new file mode 100644
> index 000000000000..fd6665f29d17
> --- /dev/null
> +++ b/recipes-bsp/pruhsr-fw/pruhsr-fw_git.bb
> @@ -0,0 +1,36 @@
> +DESCRIPTION = "PRU HSR firmware for AM57xx"
> +
> +LICENSE = "TI-TFL"
> +LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
> +
> +PV = "2.15.23"
> +PE = "1"
> +PR = "r0"
> +
> +COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +SRCREV = "313e20f312a286bc07b97ef9aca70ef3ce96af29"
> +BRANCH ?= "ti-linux-firmware"
> +
> +SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
> +
> +S = "${WORKDIR}/git"
> +
> +TARGET = ""
> +TARGET_ti33x = "am335x-pru0-pruhsr-fw.elf am335x-pru1-pruhsr-fw.elf"
> +TARGET_ti43x = "am437x-pru0-pruhsr-fw.elf am437x-pru1-pruhsr-fw.elf"
> +TARGET_am57xx-evm = "am57xx-pru0-pruhsr-fw.elf am57xx-pru1-pruhsr-fw.elf"
> +TARGET_am57xx-hs-evm = "am57xx-pru0-pruhsr-fw.elf am57xx-pru1-pruhsr-fw.elf"
> +
> +do_install() {
> +	install -d ${D}${base_libdir}/firmware/ti-pruss
> +	for f in ${TARGET}; do
> +		install -m 0644 ${S}/ti-pruss/$f ${D}${base_libdir}/firmware/ti-pruss/$f
> +	done
> +}
> +
> +FILES_${PN} = "${base_libdir}/firmware"
> +
> +INSANE_SKIP_${PN} = "arch"
> diff --git a/recipes-bsp/pruprp-fw/pruprp-fw_git.bb b/recipes-bsp/pruprp-fw/pruprp-fw_git.bb
> new file mode 100644
> index 000000000000..0b9991a5a0a3
> --- /dev/null
> +++ b/recipes-bsp/pruprp-fw/pruprp-fw_git.bb
> @@ -0,0 +1,37 @@
> +DESCRIPTION = "PRU PRP firmware for AM57xx"
> +
> +LICENSE = "TI-TFL"
> +LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
> +
> +PV = "2.15.23"
> +PE = "1"
> +PR = "r0"
> +
> +COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +SRCREV = "313e20f312a286bc07b97ef9aca70ef3ce96af29"
> +BRANCH ?= "ti-linux-firmware"
> +
> +SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
> +
> +S = "${WORKDIR}/git"
> +
> +TARGET = ""
> +TARGET_ti33x = "am335x-pru0-pruprp-fw.elf am335x-pru1-pruprp-fw.elf"
> +TARGET_ti43x = "am437x-pru0-pruprp-fw.elf am437x-pru1-pruprp-fw.elf"
> +TARGET_am57xx-evm = "am57xx-pru0-pruprp-fw.elf am57xx-pru1-pruprp-fw.elf"
> +TARGET_am57xx-hs-evm = "am57xx-pru0-pruprp-fw.elf am57xx-pru1-pruprp-fw.elf"
> +
> +
> +do_install() {
> +	install -d ${D}${base_libdir}/firmware/ti-pruss
> +	for f in ${TARGET}; do
> +		install -m 0644 ${S}/ti-pruss/$f ${D}${base_libdir}/firmware/ti-pruss/$f
> +	done
> +}
> +
> +FILES_${PN} = "${base_libdir}/firmware"
> +
> +INSANE_SKIP_${PN} = "arch"
> -- 
> 2.17.1
> 
