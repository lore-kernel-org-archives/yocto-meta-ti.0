Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.15876.1634675942000031382
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 19 Oct 2021 13:39:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 86CFB40C4E;
	Tue, 19 Oct 2021 20:39:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dzEjR6e5lGd3; Tue, 19 Oct 2021 20:39:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 56D1440BE6;
	Tue, 19 Oct 2021 20:38:58 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 07903174698; Tue, 19 Oct 2021 16:38:58 -0400 (EDT)
Date: Tue, 19 Oct 2021 16:38:57 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: yogeshs@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/dunfell][PATCH v2] ti-linux-fw: Support common inc for all firmware
Message-ID: <20211019203857.GS10132@denix.org>
References: <20211019131951.18210-1-yogeshs@ti.com>
MIME-Version: 1.0
In-Reply-To: <20211019131951.18210-1-yogeshs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 19, 2021 at 01:19:51PM +0000, Yogesh Siraswar via lists.yoctoproject.org wrote:
> Change to support common INC for all firmware
> This will help with:
> 1) Eliminating requirement to change multiple recipes for firmware
> update
> 2) This will help support AUTOREV

This is a good first step in the right direction!
In the future, should probably consider folding it all the way to 
linux-firmware recipe... There are some considerations there though.


> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb  | 11 ++++-------
>  recipes-bsp/goodix-fw/goodix-fw_git.bb              | 11 ++++-------
>  recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb          | 12 +++---------
>  recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb          | 12 +++---------
>  recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb    | 11 +++--------
>  recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb        | 11 +++--------
>  recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb           | 10 ++--------
>  recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb          | 10 ++--------
>  recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb          | 10 ++--------
>  recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb              | 10 ++--------
>  recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb        | 11 ++++-------
>  recipes-bsp/serdes-fw/serdes-fw_git.bb              | 10 ++++------
>  .../ti-sci-fw.inc => ti-linux-fw/ti-linux-fw.inc}   | 13 +++++++++++--
>  recipes-bsp/ti-sci-fw/ti-sci-fw-source_git.bb       |  2 +-
>  recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb              |  4 ++--
>  recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb          |  2 +-
>  16 files changed, 51 insertions(+), 99 deletions(-)
>  rename recipes-bsp/{ti-sci-fw/ti-sci-fw.inc => ti-linux-fw/ti-linux-fw.inc} (75%)
> 
> diff --git a/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb b/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
> index 6d857f7f..5cbbceb6 100644
> --- a/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
> +++ b/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
> @@ -1,10 +1,12 @@
>  SUMMARY = "Cadence MHDP DP bridge firmware"
>  
> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> +
>  LICENSE = "BSD-3-Clause | Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENCE.cadence;md5=009f46816f6956cfb75ede13d3e1cee0"
>  
> -PV = "1.2.17"
> -PR = "r0"
> +PV = "${CADENCE_MHDP_FW_VERSION}"
> +PR = "${INC_PR}.0"
>  
>  CLEANBROKEN = "1"
>  
> @@ -12,11 +14,6 @@ COMPATIBLE_MACHINE = "j7"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -SRCREV = "7bad9a69a343e01056ece5ce6da4d4060c42f6bc"
> -BRANCH ?= "ti-linux-firmware"
> -
> -SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
> -
>  S = "${WORKDIR}/git"
>  TARGET = "mhdp8546.bin"
>  
> diff --git a/recipes-bsp/goodix-fw/goodix-fw_git.bb b/recipes-bsp/goodix-fw/goodix-fw_git.bb
> index 0a9f3ff9..da3ae6e3 100644
> --- a/recipes-bsp/goodix-fw/goodix-fw_git.bb
> +++ b/recipes-bsp/goodix-fw/goodix-fw_git.bb
> @@ -1,10 +1,12 @@
>  DESCRIPTION = "Goodix GT9271 config firmware"
>  
> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> +
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://LICENCE.Spectrum-GT9271;md5=2a6de6be7af1fe46370c684daf27c852"
>  
> -PV = "1.0.0.0"
> -PR = "r0"
> +PV = "${GOODIX_FW_VERSION}"
> +PR = "${INC_PR}.0"
>  
>  CLEANBROKEN = "1"
>  
> @@ -12,11 +14,6 @@ COMPATIBLE_MACHINE = "dra7xx"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -SRCREV = "f1a8d1d0131f83bd1a775cde7075eb67c070892c"
> -BRANCH ?= "ti-linux-firmware"
> -
> -SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
> -
>  S = "${WORKDIR}/git"
>  ORIGIN = "DRA71x-RevA-GT9271_SpecDig_Config.bin"
>  TARGET = "goodix_9271_cfg.bin"
> diff --git a/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb b/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb
> index fe7fa2b2..5d4b6d96 100644
> --- a/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb
> +++ b/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb
> @@ -1,10 +1,9 @@
>  DESCRIPTION = "NETCP PA firmware for Keystone"
>  
> -LICENSE = "TI-TFL"
> -LIC_FILES_CHKSUM = "file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c"
> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>  
> -PV = "3.0.2.3"
> -PR = "r1"
> +PV = "${NETCP_PA_FW_VERSION}"
> +PR = "${INC_PR}.1"
>  
>  CLEANBROKEN = "1"
>  
> @@ -12,11 +11,6 @@ COMPATIBLE_MACHINE = "k2hk|k2l|k2e"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -SRCREV = "953ab647b0b6af411965242ecd919b1cb0e570d6"
> -BRANCH ?= "ti-linux-firmware"
> -
> -SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
> -
>  S = "${WORKDIR}/git"
>  
>  FWBASENAME = " \
> diff --git a/recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb b/recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb
> index 56373a73..c4674505 100644
> --- a/recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb
> +++ b/recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb
> @@ -1,10 +1,9 @@
>  DESCRIPTION = "NETCP SA firmware for Keystone"
>  
> -LICENSE = "TI-TFL"
> -LIC_FILES_CHKSUM = "file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c"
> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>  
> -PV = "1.0.0"
> -PR = "r0"
> +PV = "${NETCP_SA_FW_VERSION}"
> +PR = "${INC_PR}.0"
>  
>  CLEANBROKEN = "1"
>  
> @@ -12,11 +11,6 @@ COMPATIBLE_MACHINE = "keystone"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -SRCREV = "588f602a21c62f90b1f4318b881c80a1e711317a"
> -BRANCH ?= "ti-linux-firmware"
> -
> -SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
> -
>  S = "${WORKDIR}/git"
>  
>  TARGET = "sa_mci.fw"
> diff --git a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
> index 67e8cd07..4094aa27 100644
> --- a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
> +++ b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
> @@ -1,9 +1,9 @@
>  SUMMARY = "PRU Ethernet firmware for AM65xx SR2.0"
>  
> -LICENSE = "TI-TFL"
> -LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>  
> -PV = "02.02.09.03"
> +PV = "${PRUETH_FW_AM65x_SR2_VERSION}"
> +PR = "${INC_PR}.0"
>  
>  CLEANBROKEN = "1"
>  
> @@ -11,11 +11,6 @@ COMPATIBLE_MACHINE = "am65xx-evm|am64xx-evm"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -SRCREV = "f3d2c7cafc906adc9a2f4543aa2fee556483545d"
> -BRANCH ?= "ti-linux-firmware"
> -
> -SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
> -
>  S = "${WORKDIR}/git"
>  
>  TARGET = " \
> diff --git a/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb b/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
> index d447df33..246b872e 100644
> --- a/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
> +++ b/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
> @@ -1,9 +1,9 @@
>  SUMMARY = "PRU Ethernet firmware for AM65x SR1.0"
>  
> -LICENSE = "TI-TFL"
> -LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>  
> -PV = "08.00.00.20"
> +PV = "${PRUETH_FW_AM65x_SR2_VERSION}"
> +PR = "${INC_PR}.0"
>  
>  CLEANBROKEN = "1"
>  
> @@ -11,11 +11,6 @@ COMPATIBLE_MACHINE = "am65xx"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -SRCREV = "517b0cd8d8d80e91f1f7d80f035e6af041c39726"
> -BRANCH ?= "ti-linux-firmware"
> -
> -SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
> -
>  S = "${WORKDIR}/git"
>  
>  TARGET = " \
> diff --git a/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb b/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
> index c392673e..f7336fb1 100644
> --- a/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
> +++ b/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
> @@ -1,9 +1,8 @@
>  SUMMARY = "PRU Ethernet firmware for AM57xx, AM437x and AM335x"
>  
> -LICENSE = "TI-TFL"
> -LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>  
> -PR = "r0"
> +PR = "${INC_PR}.0"
>  
>  CLEANBROKEN = "1"
>  
> @@ -11,11 +10,6 @@ COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -SRCREV = "11fecaf08eeed27f2a834c9911edb8a5fb2a23b1"
> -BRANCH ?= "ti-linux-firmware"
> -
> -SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
> -
>  S = "${WORKDIR}/git"
>  
>  TARGET = ""
> diff --git a/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb b/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb
> index 2616373e..507a500b 100644
> --- a/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb
> +++ b/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb
> @@ -1,10 +1,9 @@
>  SUMMARY = "PRU HSR firmware for AM335x/AM437x/AM57xx"
>  
> -LICENSE = "TI-TFL"
> -LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>  
>  PE = "1"
> -PR = "r0"
> +PR = "${INC_PR}.0"
>  
>  CLEANBROKEN = "1"
>  
> @@ -12,11 +11,6 @@ COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -SRCREV = "0038ff0ecda8dae83c65d454c85776c6a4ef8e63"
> -BRANCH ?= "ti-linux-firmware"
> -
> -SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
> -
>  S = "${WORKDIR}/git"
>  
>  TARGET = ""
> diff --git a/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb b/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
> index e71bc00a..ba203948 100644
> --- a/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
> +++ b/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
> @@ -1,10 +1,9 @@
>  SUMMARY = "PRU PRP firmware for AM335x/AM437x/AM57xx"
>  
> -LICENSE = "TI-TFL"
> -LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>  
>  PE = "1"
> -PR = "r0"
> +PR = "${INC_PR}.0"
>  
>  CLEANBROKEN = "1"
>  
> @@ -12,11 +11,6 @@ COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -SRCREV = "0038ff0ecda8dae83c65d454c85776c6a4ef8e63"
> -BRANCH ?= "ti-linux-firmware"
> -
> -SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
> -
>  S = "${WORKDIR}/git"
>  
>  TARGET = ""
> diff --git a/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb b/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
> index 3f5ef7e7..ec0a15f4 100644
> --- a/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
> +++ b/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
> @@ -1,9 +1,8 @@
>  SUMMARY = "PRU Switch firmware for AM57xx, AM437x and AM335x"
>  
> -LICENSE = "TI-TFL"
> -LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>  
> -PR = "r0"
> +PR = "${INC_PR}.0"
>  
>  CLEANBROKEN = "1"
>  
> @@ -11,11 +10,6 @@ COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -SRCREV = "dccfb2328354be2933a5a179b528ec8a18b92d3a"
> -BRANCH ?= "ti-linux-firmware"
> -
> -SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
> -
>  S = "${WORKDIR}/git"
>  
>  TARGET = ""
> diff --git a/recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb b/recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb
> index cd207826..4ce9a967 100644
> --- a/recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb
> +++ b/recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb
> @@ -1,10 +1,12 @@
>  DESCRIPTION = "QMSS PDSP firmware"
>  
> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> +
>  LICENSE = "TI-TFL"
>  LIC_FILES_CHKSUM = "file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c"
>  
> -PV = "1.0.0.9"
> -PR = "r1"
> +PV = "${QMSS_PDSP_FW_VERSION}"
> +PR = "${INC_PR}.1"
>  
>  CLEANBROKEN = "1"
>  
> @@ -12,11 +14,6 @@ COMPATIBLE_MACHINE = "keystone"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -SRCREV = "778668c4bb5fe59870e549a4a2820b9f7f90e89e"
> -BRANCH ?= "ti-linux-firmware"
> -
> -SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
> -
>  S = "${WORKDIR}/git"
>  ORIGIN = "ks2_qmss_pdsp_acc48_k2_le_1_0_0_9.bin"
>  TARGET = "ks2_qmss_pdsp_acc48.bin"
> diff --git a/recipes-bsp/serdes-fw/serdes-fw_git.bb b/recipes-bsp/serdes-fw/serdes-fw_git.bb
> index 66271788..f9685721 100644
> --- a/recipes-bsp/serdes-fw/serdes-fw_git.bb
> +++ b/recipes-bsp/serdes-fw/serdes-fw_git.bb
> @@ -1,9 +1,12 @@
>  DESCRIPTION = "SerDes firmware for Keystone PCIe and 1/10GigE"
>  
> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> +
>  LICENSE = "TI-TFL"
>  LIC_FILES_CHKSUM = "file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c"
>  
> -PV = "3.3.0.2c"
> +PV = "${SERDES_FW_VERSION}"
> +PR = "${INC_PR}.0"
>  
>  CLEANBROKEN = "1"
>  
> @@ -11,11 +14,6 @@ COMPATIBLE_MACHINE = "keystone"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -SRCREV = "8d861bd8f8f792df60b6873989ff208766fbebae"
> -BRANCH ?= "ti-linux-firmware"
> -
> -SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
> -
>  S = "${WORKDIR}/git"
>  TARGET = "ks2_pcie_serdes.bin ks2_gbe_serdes.bin ks2_xgbe_serdes.bin"
>  
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> similarity index 75%
> rename from recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> rename to recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> index 9ce9f6c8..a910af2c 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> +++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> @@ -4,9 +4,18 @@ LICENSE = "TI-TFL"
>  LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
>  
>  PV = "2021.05"
> -INC_PR = "r0"
> -# RTOS firmware version
> +INC_PR = "r1"
> +
> +# Firmware versions
>  CORESDK_RTOS_VERSION = "08.00.00.32"
> +SERDES_FW_VERSION = "3.3.0.2c"
> +NETCP_SA_FW_VERSION = "1.0.0"
> +NETCP_PA_FW_VERSION = "3.0.2.3"
> +QMSS_PDSP_FW_VERSION = "1.0.0.9"
> +PRUETH_FW_AM65X_VERSION = "08.00.00.20"
> +PRUETH_FW_AM65x_SR2_VERSION = "02.02.09.03"
> +GOODIX_FW_VERSION = "1.0.0.0"
> +CADENCE_MHDP_FW_VERSION = "1.2.17"
>  
>  SRCREV = "793309716bce2e443f798dd5c5f0d8dd310970c0"
>  BRANCH ?= "ti-linux-firmware"
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw-source_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw-source_git.bb
> index 063e72d7..e539c84f 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw-source_git.bb
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw-source_git.bb
> @@ -2,7 +2,7 @@
>  # Let's take a page from gcc-source as a common recipe for all gcc stages,
>  # but also to provide a single package for MAINMACHINE of all multiconfigs
>  
> -require recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>  
>  SUMMARY += "- sources"
>  
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> index 87fdec68..ca56e1de 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> @@ -1,11 +1,11 @@
> -require recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>  
>  DEPENDS = "openssl-native u-boot-mkimage-native dtc-native"
>  DEPENDS_append_j7200-evm-k3r5 = " virtual/bootloader"
>  DEPENDS_append_am64xx-evm-k3r5 = " virtual/bootloader"
>  
>  CLEANBROKEN = "1"
> -PR = "r1"
> +PR = "${INC_PR}.0"
>  
>  # Loaded by R5F core
>  COMPATIBLE_MACHINE = "k3r5"
> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> index 43de1ec2..d8ac2ee0 100644
> --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -19,7 +19,7 @@ PLAT_SFX_am65xx = "am65xx"
>  PLAT_SFX_am64xx = "am64xx"
>  
>  FILESEXTRAPATHS_prepend := "${METATIBASE}/recipes-bsp/ti-sci-fw/files/:"
> -require recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>  
>  CORESDK_RTOS_VERSION ?= "08.00.00.26"
>  PV = "${CORESDK_RTOS_VERSION}"
> -- 
> 2.17.1
> 
