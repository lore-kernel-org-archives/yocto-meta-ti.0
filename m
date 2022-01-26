Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.21295.1643238559575157244
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 26 Jan 2022 15:09:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0B55840CC7;
	Wed, 26 Jan 2022 23:09:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uH2zKgsdvTvJ; Wed, 26 Jan 2022 23:09:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E138A40CB6;
	Wed, 26 Jan 2022 23:09:17 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id AA5EE17472D;
	Wed, 26 Jan 2022 18:09:16 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [RFC][master][PATCH 5/7] meta-ti: move BIOS,XDC,XDAIS,CGT,DSP libs and components to meta-ti-extras
Date: Wed, 26 Jan 2022 18:09:08 -0500
Message-Id: <1643238550-20765-6-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643238550-20765-1-git-send-email-denis@denix.org>
References: <1643238550-20765-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

Legacy platforms AM3/4/5/J6 build components for multimedia acceleration and
other DSP showcasing using SYS/BIOS, XDC, XDAIS, CodeGen Tools and different
DSP libraries. Move all of them to meta-ti-extras.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 {meta-ti-bsp => meta-ti-extras}/licenses/Hewlett-Packard                  | 0
 {meta-ti-bsp => meta-ti-extras}/licenses/Patrick-Powell                   | 0
 {meta-ti-bsp => meta-ti-extras}/licenses/Thai-Open-Source-Software-Center | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-bsp/dspdce-fw/dspdce-fw_git.bb    | 0
 .../recipes-bsp/dsptop/debugss-module-drv_git.bb                          | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-bsp/dsptop/dsptop.inc             | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-bsp/dsptop/dsptop_git.bb          | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-bsp/dsptop/libulm_git.bb          | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-bsp/ipumm-fw/ipumm-fw_git.bb      | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-bsp/pru/pru-icss_git.bb           | 0
 .../recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb                      | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-devtools/gdbc6x/gdbc6x.inc        | 0
 .../gdbc6x/gdbc6x/0001-libbfd.h-suppress-GCC9-Wstringop-truncation.patch  | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-devtools/gdbc6x/gdbc6x/init       | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-devtools/gdbc6x/gdbc6x_git.bb     | 0
 .../recipes-devtools/gdbc6x/gdbserver-c6x_git.bb                          | 0
 .../recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb              | 0
 .../recipes-multimedia/libdce/libdce_3.00.14.00.bb                        | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-ti/README                         | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-ti/bios/ti-sysbios.inc            | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-ti/bios/ti-sysbios_6.76.03.01.bb  | 0
 .../recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb                 | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-ti/ctoolslib/libaet_git.bb        | 0
 .../recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb             | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-ti/devtools/ti-cg-xml_2.61.00.bb  | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb   | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-ti/devtools/ti-cgt470.inc         | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-ti/devtools/ti-cgt470_4.6.6.bb    | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb  | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-ti/devtools/ti-cgt6x_8.3.2.bb     | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-ti/devtools/ti-cgt7x_1.2.0.bb     | 0
 .../recipes-ti/devtools/ti-xdctools-common.inc                            | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-ti/devtools/ti-xdctools-core.inc  | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-ti/devtools/ti-xdctools.inc       | 0
 .../recipes-ti/devtools/ti-xdctools_3.55.02.22.bb                         | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-ti/dsplib/dsplib-c64xp_git.bb     | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-ti/dsplib/dsplib-c66x_git.bb      | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-ti/dsplib/dsplib-c674x_git.bb     | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-ti/dsplib/dsplib.inc              | 0
 .../recipes-ti/framework-components/ti-framework-components.inc           | 0
 .../recipes-ti/framework-components/ti-framework-components_2.26.00.01.bb | 0
 .../recipes-ti/framework-components/ti-framework-components_3.40.02.07.bb | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-ti/imglib/imglib-c66x.inc         | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-ti/imglib/imglib-c66x_3.1.1.0.bb  | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-ti/includes/ti-eula-unpack.inc    | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-ti/includes/ti-paths.inc          | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-ti/includes/ti-staging.inc        | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-ti/includes/ti-unpack.inc         | 0
 .../0001-examples-ClusterMgr-sys_errlist-has-been-deprecated-.patch       | 0
 .../recipes-ti/ipc/ti-ipc-examples-linux_git.bb                           | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-ti/ipc/ti-ipc-examples.inc        | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-ti/ipc/ti-ipc-examples_git.bb     | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-ti/ipc/ti-ipc-rtos.inc            | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-ti/ipc/ti-ipc-rtos_git.bb         | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-ti/mathlib/mathlib-c66x_git.bb    | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-ti/mathlib/mathlib-c674x_git.bb   | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-ti/mathlib/mathlib.inc            | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-ti/openmp-rtos/openmp-rtos_git.bb | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-ti/osal/ti-osal.inc               | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-ti/osal/ti-osal_1.24.00.09.bb     | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-ti/swtools/swtools_git.bb         | 0
 .../recipes-ti/uio-test-pruss/uio-test-pruss_git.bb                       | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-ti/vlib/vlib-c66x.inc             | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-ti/vlib/vlib-c66x_3.2.1.0.bb      | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-ti/xdais/ti-xdais.inc             | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-ti/xdais/ti-xdais_6.26.01.03.bb   | 0
 {meta-ti-bsp => meta-ti-extras}/recipes-ti/xdais/ti-xdais_7.24.00.04.bb   | 0
 68 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-ti-bsp => meta-ti-extras}/licenses/Hewlett-Packard (100%)
 rename {meta-ti-bsp => meta-ti-extras}/licenses/Patrick-Powell (100%)
 rename {meta-ti-bsp => meta-ti-extras}/licenses/Thai-Open-Source-Software-Center (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-bsp/dspdce-fw/dspdce-fw_git.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-bsp/dsptop/debugss-module-drv_git.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-bsp/dsptop/dsptop.inc (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-bsp/dsptop/dsptop_git.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-bsp/dsptop/libulm_git.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-bsp/ipumm-fw/ipumm-fw_git.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-bsp/pru/pru-icss_git.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-devtools/gdbc6x/gdbc6x.inc (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-devtools/gdbc6x/gdbc6x/0001-libbfd.h-suppress-GCC9-Wstringop-truncation.patch (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-devtools/gdbc6x/gdbc6x/init (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-devtools/gdbc6x/gdbc6x_git.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-multimedia/libdce/libdce_3.00.14.00.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/README (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/bios/ti-sysbios.inc (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/bios/ti-sysbios_6.76.03.01.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/ctoolslib/libaet_git.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/devtools/ti-cg-xml_2.61.00.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/devtools/ti-cgt470.inc (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/devtools/ti-cgt470_4.6.6.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/devtools/ti-cgt6x_8.3.2.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/devtools/ti-cgt7x_1.2.0.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/devtools/ti-xdctools-common.inc (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/devtools/ti-xdctools-core.inc (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/devtools/ti-xdctools.inc (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/dsplib/dsplib-c64xp_git.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/dsplib/dsplib-c66x_git.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/dsplib/dsplib-c674x_git.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/dsplib/dsplib.inc (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/framework-components/ti-framework-components.inc (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/framework-components/ti-framework-components_2.26.00.01.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/framework-components/ti-framework-components_3.40.02.07.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/imglib/imglib-c66x.inc (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/imglib/imglib-c66x_3.1.1.0.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/includes/ti-eula-unpack.inc (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/includes/ti-paths.inc (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/includes/ti-staging.inc (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/includes/ti-unpack.inc (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/ipc/ti-ipc-examples-linux/0001-examples-ClusterMgr-sys_errlist-has-been-deprecated-.patch (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/ipc/ti-ipc-examples-linux_git.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/ipc/ti-ipc-examples.inc (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/ipc/ti-ipc-examples_git.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/ipc/ti-ipc-rtos.inc (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/ipc/ti-ipc-rtos_git.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/mathlib/mathlib-c66x_git.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/mathlib/mathlib-c674x_git.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/mathlib/mathlib.inc (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/openmp-rtos/openmp-rtos_git.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/osal/ti-osal.inc (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/osal/ti-osal_1.24.00.09.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/swtools/swtools_git.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/vlib/vlib-c66x.inc (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/vlib/vlib-c66x_3.2.1.0.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/xdais/ti-xdais.inc (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/xdais/ti-xdais_6.26.01.03.bb (100%)
 rename {meta-ti-bsp => meta-ti-extras}/recipes-ti/xdais/ti-xdais_7.24.00.04.bb (100%)

diff --git a/meta-ti-bsp/licenses/Hewlett-Packard b/meta-ti-extras/licenses/Hewlett-Packard
similarity index 100%
rename from meta-ti-bsp/licenses/Hewlett-Packard
rename to meta-ti-extras/licenses/Hewlett-Packard
diff --git a/meta-ti-bsp/licenses/Patrick-Powell b/meta-ti-extras/licenses/Patrick-Powell
similarity index 100%
rename from meta-ti-bsp/licenses/Patrick-Powell
rename to meta-ti-extras/licenses/Patrick-Powell
diff --git a/meta-ti-bsp/licenses/Thai-Open-Source-Software-Center b/meta-ti-extras/licenses/Thai-Open-Source-Software-Center
similarity index 100%
rename from meta-ti-bsp/licenses/Thai-Open-Source-Software-Center
rename to meta-ti-extras/licenses/Thai-Open-Source-Software-Center
diff --git a/meta-ti-bsp/recipes-bsp/dspdce-fw/dspdce-fw_git.bb b/meta-ti-extras/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
rename to meta-ti-extras/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
diff --git a/meta-ti-bsp/recipes-bsp/dsptop/debugss-module-drv_git.bb b/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-bsp/dsptop/debugss-module-drv_git.bb
rename to meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb
diff --git a/meta-ti-bsp/recipes-bsp/dsptop/dsptop.inc b/meta-ti-extras/recipes-bsp/dsptop/dsptop.inc
similarity index 100%
rename from meta-ti-bsp/recipes-bsp/dsptop/dsptop.inc
rename to meta-ti-extras/recipes-bsp/dsptop/dsptop.inc
diff --git a/meta-ti-bsp/recipes-bsp/dsptop/dsptop_git.bb b/meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-bsp/dsptop/dsptop_git.bb
rename to meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb
diff --git a/meta-ti-bsp/recipes-bsp/dsptop/libulm_git.bb b/meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-bsp/dsptop/libulm_git.bb
rename to meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb
diff --git a/meta-ti-bsp/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
rename to meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
diff --git a/meta-ti-bsp/recipes-bsp/pru/pru-icss_git.bb b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-bsp/pru/pru-icss_git.bb
rename to meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
diff --git a/meta-ti-bsp/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb b/meta-ti-extras/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb
similarity index 100%
rename from meta-ti-bsp/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb
rename to meta-ti-extras/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb
diff --git a/meta-ti-bsp/recipes-devtools/gdbc6x/gdbc6x.inc b/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x.inc
similarity index 100%
rename from meta-ti-bsp/recipes-devtools/gdbc6x/gdbc6x.inc
rename to meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x.inc
diff --git a/meta-ti-bsp/recipes-devtools/gdbc6x/gdbc6x/0001-libbfd.h-suppress-GCC9-Wstringop-truncation.patch b/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x/0001-libbfd.h-suppress-GCC9-Wstringop-truncation.patch
similarity index 100%
rename from meta-ti-bsp/recipes-devtools/gdbc6x/gdbc6x/0001-libbfd.h-suppress-GCC9-Wstringop-truncation.patch
rename to meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x/0001-libbfd.h-suppress-GCC9-Wstringop-truncation.patch
diff --git a/meta-ti-bsp/recipes-devtools/gdbc6x/gdbc6x/init b/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x/init
similarity index 100%
rename from meta-ti-bsp/recipes-devtools/gdbc6x/gdbc6x/init
rename to meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x/init
diff --git a/meta-ti-bsp/recipes-devtools/gdbc6x/gdbc6x_git.bb b/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-devtools/gdbc6x/gdbc6x_git.bb
rename to meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
diff --git a/meta-ti-bsp/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
rename to meta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
diff --git a/meta-ti-bsp/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
rename to meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
diff --git a/meta-ti-bsp/recipes-multimedia/libdce/libdce_3.00.14.00.bb b/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.14.00.bb
similarity index 100%
rename from meta-ti-bsp/recipes-multimedia/libdce/libdce_3.00.14.00.bb
rename to meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.14.00.bb
diff --git a/meta-ti-bsp/recipes-ti/README b/meta-ti-extras/recipes-ti/README
similarity index 100%
rename from meta-ti-bsp/recipes-ti/README
rename to meta-ti-extras/recipes-ti/README
diff --git a/meta-ti-bsp/recipes-ti/bios/ti-sysbios.inc b/meta-ti-extras/recipes-ti/bios/ti-sysbios.inc
similarity index 100%
rename from meta-ti-bsp/recipes-ti/bios/ti-sysbios.inc
rename to meta-ti-extras/recipes-ti/bios/ti-sysbios.inc
diff --git a/meta-ti-bsp/recipes-ti/bios/ti-sysbios_6.76.03.01.bb b/meta-ti-extras/recipes-ti/bios/ti-sysbios_6.76.03.01.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/bios/ti-sysbios_6.76.03.01.bb
rename to meta-ti-extras/recipes-ti/bios/ti-sysbios_6.76.03.01.bb
diff --git a/meta-ti-bsp/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb b/meta-ti-extras/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb
rename to meta-ti-extras/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb
diff --git a/meta-ti-bsp/recipes-ti/ctoolslib/libaet_git.bb b/meta-ti-extras/recipes-ti/ctoolslib/libaet_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/ctoolslib/libaet_git.bb
rename to meta-ti-extras/recipes-ti/ctoolslib/libaet_git.bb
diff --git a/meta-ti-bsp/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb b/meta-ti-extras/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb
rename to meta-ti-extras/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb
diff --git a/meta-ti-bsp/recipes-ti/devtools/ti-cg-xml_2.61.00.bb b/meta-ti-extras/recipes-ti/devtools/ti-cg-xml_2.61.00.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/devtools/ti-cg-xml_2.61.00.bb
rename to meta-ti-extras/recipes-ti/devtools/ti-cg-xml_2.61.00.bb
diff --git a/meta-ti-bsp/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb b/meta-ti-extras/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
rename to meta-ti-extras/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
diff --git a/meta-ti-bsp/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb b/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb
rename to meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb
diff --git a/meta-ti-bsp/recipes-ti/devtools/ti-cgt470.inc b/meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc
similarity index 100%
rename from meta-ti-bsp/recipes-ti/devtools/ti-cgt470.inc
rename to meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc
diff --git a/meta-ti-bsp/recipes-ti/devtools/ti-cgt470_4.6.6.bb b/meta-ti-extras/recipes-ti/devtools/ti-cgt470_4.6.6.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/devtools/ti-cgt470_4.6.6.bb
rename to meta-ti-extras/recipes-ti/devtools/ti-cgt470_4.6.6.bb
diff --git a/meta-ti-bsp/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb b/meta-ti-extras/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb
rename to meta-ti-extras/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb
diff --git a/meta-ti-bsp/recipes-ti/devtools/ti-cgt6x_8.3.2.bb b/meta-ti-extras/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
rename to meta-ti-extras/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
diff --git a/meta-ti-bsp/recipes-ti/devtools/ti-cgt7x_1.2.0.bb b/meta-ti-extras/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
rename to meta-ti-extras/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
diff --git a/meta-ti-bsp/recipes-ti/devtools/ti-xdctools-common.inc b/meta-ti-extras/recipes-ti/devtools/ti-xdctools-common.inc
similarity index 100%
rename from meta-ti-bsp/recipes-ti/devtools/ti-xdctools-common.inc
rename to meta-ti-extras/recipes-ti/devtools/ti-xdctools-common.inc
diff --git a/meta-ti-bsp/recipes-ti/devtools/ti-xdctools-core.inc b/meta-ti-extras/recipes-ti/devtools/ti-xdctools-core.inc
similarity index 100%
rename from meta-ti-bsp/recipes-ti/devtools/ti-xdctools-core.inc
rename to meta-ti-extras/recipes-ti/devtools/ti-xdctools-core.inc
diff --git a/meta-ti-bsp/recipes-ti/devtools/ti-xdctools.inc b/meta-ti-extras/recipes-ti/devtools/ti-xdctools.inc
similarity index 100%
rename from meta-ti-bsp/recipes-ti/devtools/ti-xdctools.inc
rename to meta-ti-extras/recipes-ti/devtools/ti-xdctools.inc
diff --git a/meta-ti-bsp/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb b/meta-ti-extras/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb
rename to meta-ti-extras/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb
diff --git a/meta-ti-bsp/recipes-ti/dsplib/dsplib-c64xp_git.bb b/meta-ti-extras/recipes-ti/dsplib/dsplib-c64xp_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/dsplib/dsplib-c64xp_git.bb
rename to meta-ti-extras/recipes-ti/dsplib/dsplib-c64xp_git.bb
diff --git a/meta-ti-bsp/recipes-ti/dsplib/dsplib-c66x_git.bb b/meta-ti-extras/recipes-ti/dsplib/dsplib-c66x_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/dsplib/dsplib-c66x_git.bb
rename to meta-ti-extras/recipes-ti/dsplib/dsplib-c66x_git.bb
diff --git a/meta-ti-bsp/recipes-ti/dsplib/dsplib-c674x_git.bb b/meta-ti-extras/recipes-ti/dsplib/dsplib-c674x_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/dsplib/dsplib-c674x_git.bb
rename to meta-ti-extras/recipes-ti/dsplib/dsplib-c674x_git.bb
diff --git a/meta-ti-bsp/recipes-ti/dsplib/dsplib.inc b/meta-ti-extras/recipes-ti/dsplib/dsplib.inc
similarity index 100%
rename from meta-ti-bsp/recipes-ti/dsplib/dsplib.inc
rename to meta-ti-extras/recipes-ti/dsplib/dsplib.inc
diff --git a/meta-ti-bsp/recipes-ti/framework-components/ti-framework-components.inc b/meta-ti-extras/recipes-ti/framework-components/ti-framework-components.inc
similarity index 100%
rename from meta-ti-bsp/recipes-ti/framework-components/ti-framework-components.inc
rename to meta-ti-extras/recipes-ti/framework-components/ti-framework-components.inc
diff --git a/meta-ti-bsp/recipes-ti/framework-components/ti-framework-components_2.26.00.01.bb b/meta-ti-extras/recipes-ti/framework-components/ti-framework-components_2.26.00.01.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/framework-components/ti-framework-components_2.26.00.01.bb
rename to meta-ti-extras/recipes-ti/framework-components/ti-framework-components_2.26.00.01.bb
diff --git a/meta-ti-bsp/recipes-ti/framework-components/ti-framework-components_3.40.02.07.bb b/meta-ti-extras/recipes-ti/framework-components/ti-framework-components_3.40.02.07.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/framework-components/ti-framework-components_3.40.02.07.bb
rename to meta-ti-extras/recipes-ti/framework-components/ti-framework-components_3.40.02.07.bb
diff --git a/meta-ti-bsp/recipes-ti/imglib/imglib-c66x.inc b/meta-ti-extras/recipes-ti/imglib/imglib-c66x.inc
similarity index 100%
rename from meta-ti-bsp/recipes-ti/imglib/imglib-c66x.inc
rename to meta-ti-extras/recipes-ti/imglib/imglib-c66x.inc
diff --git a/meta-ti-bsp/recipes-ti/imglib/imglib-c66x_3.1.1.0.bb b/meta-ti-extras/recipes-ti/imglib/imglib-c66x_3.1.1.0.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/imglib/imglib-c66x_3.1.1.0.bb
rename to meta-ti-extras/recipes-ti/imglib/imglib-c66x_3.1.1.0.bb
diff --git a/meta-ti-bsp/recipes-ti/includes/ti-eula-unpack.inc b/meta-ti-extras/recipes-ti/includes/ti-eula-unpack.inc
similarity index 100%
rename from meta-ti-bsp/recipes-ti/includes/ti-eula-unpack.inc
rename to meta-ti-extras/recipes-ti/includes/ti-eula-unpack.inc
diff --git a/meta-ti-bsp/recipes-ti/includes/ti-paths.inc b/meta-ti-extras/recipes-ti/includes/ti-paths.inc
similarity index 100%
rename from meta-ti-bsp/recipes-ti/includes/ti-paths.inc
rename to meta-ti-extras/recipes-ti/includes/ti-paths.inc
diff --git a/meta-ti-bsp/recipes-ti/includes/ti-staging.inc b/meta-ti-extras/recipes-ti/includes/ti-staging.inc
similarity index 100%
rename from meta-ti-bsp/recipes-ti/includes/ti-staging.inc
rename to meta-ti-extras/recipes-ti/includes/ti-staging.inc
diff --git a/meta-ti-bsp/recipes-ti/includes/ti-unpack.inc b/meta-ti-extras/recipes-ti/includes/ti-unpack.inc
similarity index 100%
rename from meta-ti-bsp/recipes-ti/includes/ti-unpack.inc
rename to meta-ti-extras/recipes-ti/includes/ti-unpack.inc
diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc-examples-linux/0001-examples-ClusterMgr-sys_errlist-has-been-deprecated-.patch b/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux/0001-examples-ClusterMgr-sys_errlist-has-been-deprecated-.patch
similarity index 100%
rename from meta-ti-bsp/recipes-ti/ipc/ti-ipc-examples-linux/0001-examples-ClusterMgr-sys_errlist-has-been-deprecated-.patch
rename to meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux/0001-examples-ClusterMgr-sys_errlist-has-been-deprecated-.patch
diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc-examples-linux_git.bb b/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
rename to meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc-examples.inc b/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples.inc
similarity index 100%
rename from meta-ti-bsp/recipes-ti/ipc/ti-ipc-examples.inc
rename to meta-ti-extras/recipes-ti/ipc/ti-ipc-examples.inc
diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc-examples_git.bb b/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/ipc/ti-ipc-examples_git.bb
rename to meta-ti-extras/recipes-ti/ipc/ti-ipc-examples_git.bb
diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc-rtos.inc b/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos.inc
similarity index 100%
rename from meta-ti-bsp/recipes-ti/ipc/ti-ipc-rtos.inc
rename to meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos.inc
diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc-rtos_git.bb b/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/ipc/ti-ipc-rtos_git.bb
rename to meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb
diff --git a/meta-ti-bsp/recipes-ti/mathlib/mathlib-c66x_git.bb b/meta-ti-extras/recipes-ti/mathlib/mathlib-c66x_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/mathlib/mathlib-c66x_git.bb
rename to meta-ti-extras/recipes-ti/mathlib/mathlib-c66x_git.bb
diff --git a/meta-ti-bsp/recipes-ti/mathlib/mathlib-c674x_git.bb b/meta-ti-extras/recipes-ti/mathlib/mathlib-c674x_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/mathlib/mathlib-c674x_git.bb
rename to meta-ti-extras/recipes-ti/mathlib/mathlib-c674x_git.bb
diff --git a/meta-ti-bsp/recipes-ti/mathlib/mathlib.inc b/meta-ti-extras/recipes-ti/mathlib/mathlib.inc
similarity index 100%
rename from meta-ti-bsp/recipes-ti/mathlib/mathlib.inc
rename to meta-ti-extras/recipes-ti/mathlib/mathlib.inc
diff --git a/meta-ti-bsp/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/meta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/openmp-rtos/openmp-rtos_git.bb
rename to meta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb
diff --git a/meta-ti-bsp/recipes-ti/osal/ti-osal.inc b/meta-ti-extras/recipes-ti/osal/ti-osal.inc
similarity index 100%
rename from meta-ti-bsp/recipes-ti/osal/ti-osal.inc
rename to meta-ti-extras/recipes-ti/osal/ti-osal.inc
diff --git a/meta-ti-bsp/recipes-ti/osal/ti-osal_1.24.00.09.bb b/meta-ti-extras/recipes-ti/osal/ti-osal_1.24.00.09.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/osal/ti-osal_1.24.00.09.bb
rename to meta-ti-extras/recipes-ti/osal/ti-osal_1.24.00.09.bb
diff --git a/meta-ti-bsp/recipes-ti/swtools/swtools_git.bb b/meta-ti-extras/recipes-ti/swtools/swtools_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/swtools/swtools_git.bb
rename to meta-ti-extras/recipes-ti/swtools/swtools_git.bb
diff --git a/meta-ti-bsp/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb b/meta-ti-extras/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
rename to meta-ti-extras/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
diff --git a/meta-ti-bsp/recipes-ti/vlib/vlib-c66x.inc b/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc
similarity index 100%
rename from meta-ti-bsp/recipes-ti/vlib/vlib-c66x.inc
rename to meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc
diff --git a/meta-ti-bsp/recipes-ti/vlib/vlib-c66x_3.2.1.0.bb b/meta-ti-extras/recipes-ti/vlib/vlib-c66x_3.2.1.0.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/vlib/vlib-c66x_3.2.1.0.bb
rename to meta-ti-extras/recipes-ti/vlib/vlib-c66x_3.2.1.0.bb
diff --git a/meta-ti-bsp/recipes-ti/xdais/ti-xdais.inc b/meta-ti-extras/recipes-ti/xdais/ti-xdais.inc
similarity index 100%
rename from meta-ti-bsp/recipes-ti/xdais/ti-xdais.inc
rename to meta-ti-extras/recipes-ti/xdais/ti-xdais.inc
diff --git a/meta-ti-bsp/recipes-ti/xdais/ti-xdais_6.26.01.03.bb b/meta-ti-extras/recipes-ti/xdais/ti-xdais_6.26.01.03.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/xdais/ti-xdais_6.26.01.03.bb
rename to meta-ti-extras/recipes-ti/xdais/ti-xdais_6.26.01.03.bb
diff --git a/meta-ti-bsp/recipes-ti/xdais/ti-xdais_7.24.00.04.bb b/meta-ti-extras/recipes-ti/xdais/ti-xdais_7.24.00.04.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/xdais/ti-xdais_7.24.00.04.bb
rename to meta-ti-extras/recipes-ti/xdais/ti-xdais_7.24.00.04.bb
-- 
2.7.4

