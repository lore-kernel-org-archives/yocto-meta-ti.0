Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.8946.1645503245187817047
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:14:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9CC6740AE9
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dYgl6Zjfk84v for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:14:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7BF2240C79
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:02 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 3AE30174772
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:14:02 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 07/17] meta-ti: move BIOS,XDC,XDAIS,CGT,DSP libs and components to meta-ti-extras
Date: Tue, 22 Feb 2022 04:13:51 +0000
Message-Id: <20220222041401.2840172-8-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041401.2840172-1-denis@denix.org>
References: <20220222041401.2840172-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

Legacy platforms AM3/4/5/J6 build components for multimedia acceleration =
and
other DSP showcasing using SYS/BIOS, XDC, XDAIS, CodeGen Tools and differ=
ent
DSP libraries. Move all of them to meta-ti-extras.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 {meta-ti-bsp =3D> meta-ti-extras}/licenses/Hewlett-Packard          | 0
 {meta-ti-bsp =3D> meta-ti-extras}/licenses/Patrick-Powell           | 0
 .../licenses/Thai-Open-Source-Software-Center                     | 0
 .../recipes-bsp/dspdce-fw/dspdce-fw_git.bb                        | 0
 .../recipes-bsp/dsptop/debugss-module-drv_git.bb                  | 0
 {meta-ti-bsp =3D> meta-ti-extras}/recipes-bsp/dsptop/dsptop.inc     | 0
 {meta-ti-bsp =3D> meta-ti-extras}/recipes-bsp/dsptop/dsptop_git.bb  | 0
 {meta-ti-bsp =3D> meta-ti-extras}/recipes-bsp/dsptop/libulm_git.bb  | 0
 .../recipes-bsp/ipumm-fw/ipumm-fw_git.bb                          | 0
 {meta-ti-bsp =3D> meta-ti-extras}/recipes-bsp/pru/pru-icss_git.bb   | 0
 .../recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb              | 0
 .../recipes-devtools/gdbc6x/gdbc6x.inc                            | 0
 .../gdbc6x/0001-libbfd.h-suppress-GCC9-Wstringop-truncation.patch | 0
 .../recipes-devtools/gdbc6x/gdbc6x/init                           | 0
 .../recipes-devtools/gdbc6x/gdbc6x_git.bb                         | 0
 .../recipes-devtools/gdbc6x/gdbserver-c6x_git.bb                  | 0
 .../recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb      | 0
 .../recipes-multimedia/libdce/libdce_3.00.14.00.bb                | 0
 {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/README                 | 0
 {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/bios/ti-sysbios.inc    | 0
 .../recipes-ti/bios/ti-sysbios_6.76.03.01.bb                      | 0
 .../recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb         | 0
 .../recipes-ti/ctoolslib/libaet_git.bb                            | 0
 .../recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-update.bb     | 0
 .../recipes-ti/devtools/ti-cg-xml_2.61.00.bb                      | 0
 .../recipes-ti/devtools/ti-cgt-arm_18.12.5.bb                     | 0
 .../recipes-ti/devtools/ti-cgt-pru_2.3.2.bb                       | 0
 {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/devtools/ti-cgt470.inc | 0
 .../recipes-ti/devtools/ti-cgt470_4.6.6.bb                        | 0
 .../recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb                      | 0
 .../recipes-ti/devtools/ti-cgt6x_8.3.2.bb                         | 0
 .../recipes-ti/devtools/ti-cgt7x_1.2.0.bb                         | 0
 .../recipes-ti/devtools/ti-xdctools-common.inc                    | 0
 .../recipes-ti/devtools/ti-xdctools-core.inc                      | 0
 .../recipes-ti/devtools/ti-xdctools.inc                           | 0
 .../recipes-ti/devtools/ti-xdctools_3.55.02.22.bb                 | 0
 .../recipes-ti/dsplib/dsplib-c64xp_git.bb                         | 0
 .../recipes-ti/dsplib/dsplib-c66x_git.bb                          | 0
 .../recipes-ti/dsplib/dsplib-c674x_git.bb                         | 0
 {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/dsplib/dsplib.inc      | 0
 .../recipes-ti/framework-components/ti-framework-components.inc   | 0
 .../framework-components/ti-framework-components_2.26.00.01.bb    | 0
 .../framework-components/ti-framework-components_3.40.02.07.bb    | 0
 {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/imglib/imglib-c66x.inc | 0
 .../recipes-ti/imglib/imglib-c66x_3.1.1.0.bb                      | 0
 .../recipes-ti/includes/ti-eula-unpack.inc                        | 0
 {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/includes/ti-paths.inc  | 0
 .../recipes-ti/includes/ti-staging.inc                            | 0
 {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/includes/ti-unpack.inc | 0
 ...001-examples-ClusterMgr-sys_errlist-has-been-deprecated-.patch | 0
 .../recipes-ti/ipc/ti-ipc-examples-linux_git.bb                   | 0
 .../recipes-ti/ipc/ti-ipc-examples.inc                            | 0
 .../recipes-ti/ipc/ti-ipc-examples_git.bb                         | 0
 {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/ipc/ti-ipc-rtos.inc    | 0
 {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/ipc/ti-ipc-rtos_git.bb | 0
 .../recipes-ti/mathlib/mathlib-c66x_git.bb                        | 0
 .../recipes-ti/mathlib/mathlib-c674x_git.bb                       | 0
 {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/mathlib/mathlib.inc    | 0
 .../recipes-ti/openmp-rtos/openmp-rtos_git.bb                     | 0
 {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/osal/ti-osal.inc       | 0
 .../recipes-ti/osal/ti-osal_1.24.00.09.bb                         | 0
 {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/swtools/swtools_git.bb | 0
 .../recipes-ti/uio-test-pruss/uio-test-pruss_git.bb               | 0
 {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/vlib/vlib-c66x.inc     | 0
 .../recipes-ti/vlib/vlib-c66x_3.2.1.0.bb                          | 0
 {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/xdais/ti-xdais.inc     | 0
 .../recipes-ti/xdais/ti-xdais_6.26.01.03.bb                       | 0
 .../recipes-ti/xdais/ti-xdais_7.24.00.04.bb                       | 0
 68 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-ti-bsp =3D> meta-ti-extras}/licenses/Hewlett-Packard (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/licenses/Patrick-Powell (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/licenses/Thai-Open-Source-Softw=
are-Center (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-bsp/dspdce-fw/dspdce-fw=
_git.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-bsp/dsptop/debugss-modu=
le-drv_git.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-bsp/dsptop/dsptop.inc (=
100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-bsp/dsptop/dsptop_git.b=
b (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-bsp/dsptop/libulm_git.b=
b (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-bsp/ipumm-fw/ipumm-fw_g=
it.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-bsp/pru/pru-icss_git.bb=
 (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-bsp/pru/ti-pru-sw-edma-=
driver_1.00.00.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-devtools/gdbc6x/gdbc6x.=
inc (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-devtools/gdbc6x/gdbc6x/=
0001-libbfd.h-suppress-GCC9-Wstringop-truncation.patch (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-devtools/gdbc6x/gdbc6x/=
init (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-devtools/gdbc6x/gdbc6x_=
git.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-devtools/gdbc6x/gdbserv=
er-c6x_git.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-devtools/gdbc6x/gdbserv=
erproxy-module-drv_git.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-multimedia/libdce/libdc=
e_3.00.14.00.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/README (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/bios/ti-sysbios.inc =
(100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/bios/ti-sysbios_6.76=
.03.01.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/codec-engine/ti-code=
c-engine_3.24.00.08.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/ctoolslib/libaet_git=
.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/devtools/gcc-arm-bar=
emetal_7-2018-q2-update.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/devtools/ti-cg-xml_2=
.61.00.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/devtools/ti-cgt-arm_=
18.12.5.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/devtools/ti-cgt-pru_=
2.3.2.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/devtools/ti-cgt470.i=
nc (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/devtools/ti-cgt470_4=
.6.6.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/devtools/ti-cgt6x-7_=
7.4.16.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/devtools/ti-cgt6x_8.=
3.2.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/devtools/ti-cgt7x_1.=
2.0.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/devtools/ti-xdctools=
-common.inc (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/devtools/ti-xdctools=
-core.inc (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/devtools/ti-xdctools=
.inc (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/devtools/ti-xdctools=
_3.55.02.22.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/dsplib/dsplib-c64xp_=
git.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/dsplib/dsplib-c66x_g=
it.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/dsplib/dsplib-c674x_=
git.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/dsplib/dsplib.inc (1=
00%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/framework-components=
/ti-framework-components.inc (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/framework-components=
/ti-framework-components_2.26.00.01.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/framework-components=
/ti-framework-components_3.40.02.07.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/imglib/imglib-c66x.i=
nc (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/imglib/imglib-c66x_3=
.1.1.0.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/includes/ti-eula-unp=
ack.inc (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/includes/ti-paths.in=
c (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/includes/ti-staging.=
inc (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/includes/ti-unpack.i=
nc (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/ipc/ti-ipc-examples-=
linux/0001-examples-ClusterMgr-sys_errlist-has-been-deprecated-.patch (10=
0%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/ipc/ti-ipc-examples-=
linux_git.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/ipc/ti-ipc-examples.=
inc (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/ipc/ti-ipc-examples_=
git.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/ipc/ti-ipc-rtos.inc =
(100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/ipc/ti-ipc-rtos_git.=
bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/mathlib/mathlib-c66x=
_git.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/mathlib/mathlib-c674=
x_git.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/mathlib/mathlib.inc =
(100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/openmp-rtos/openmp-r=
tos_git.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/osal/ti-osal.inc (10=
0%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/osal/ti-osal_1.24.00=
.09.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/swtools/swtools_git.=
bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/uio-test-pruss/uio-t=
est-pruss_git.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/vlib/vlib-c66x.inc (=
100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/vlib/vlib-c66x_3.2.1=
.0.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/xdais/ti-xdais.inc (=
100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/xdais/ti-xdais_6.26.=
01.03.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/xdais/ti-xdais_7.24.=
00.04.bb (100%)

diff --git a/meta-ti-bsp/licenses/Hewlett-Packard b/meta-ti-extras/licens=
es/Hewlett-Packard
similarity index 100%
rename from meta-ti-bsp/licenses/Hewlett-Packard
rename to meta-ti-extras/licenses/Hewlett-Packard
diff --git a/meta-ti-bsp/licenses/Patrick-Powell b/meta-ti-extras/license=
s/Patrick-Powell
similarity index 100%
rename from meta-ti-bsp/licenses/Patrick-Powell
rename to meta-ti-extras/licenses/Patrick-Powell
diff --git a/meta-ti-bsp/licenses/Thai-Open-Source-Software-Center b/meta=
-ti-extras/licenses/Thai-Open-Source-Software-Center
similarity index 100%
rename from meta-ti-bsp/licenses/Thai-Open-Source-Software-Center
rename to meta-ti-extras/licenses/Thai-Open-Source-Software-Center
diff --git a/meta-ti-bsp/recipes-bsp/dspdce-fw/dspdce-fw_git.bb b/meta-ti=
-extras/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
rename to meta-ti-extras/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
diff --git a/meta-ti-bsp/recipes-bsp/dsptop/debugss-module-drv_git.bb b/m=
eta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-bsp/dsptop/debugss-module-drv_git.bb
rename to meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb
diff --git a/meta-ti-bsp/recipes-bsp/dsptop/dsptop.inc b/meta-ti-extras/r=
ecipes-bsp/dsptop/dsptop.inc
similarity index 100%
rename from meta-ti-bsp/recipes-bsp/dsptop/dsptop.inc
rename to meta-ti-extras/recipes-bsp/dsptop/dsptop.inc
diff --git a/meta-ti-bsp/recipes-bsp/dsptop/dsptop_git.bb b/meta-ti-extra=
s/recipes-bsp/dsptop/dsptop_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-bsp/dsptop/dsptop_git.bb
rename to meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb
diff --git a/meta-ti-bsp/recipes-bsp/dsptop/libulm_git.bb b/meta-ti-extra=
s/recipes-bsp/dsptop/libulm_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-bsp/dsptop/libulm_git.bb
rename to meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb
diff --git a/meta-ti-bsp/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/meta-ti-e=
xtras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
rename to meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
diff --git a/meta-ti-bsp/recipes-bsp/pru/pru-icss_git.bb b/meta-ti-extras=
/recipes-bsp/pru/pru-icss_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-bsp/pru/pru-icss_git.bb
rename to meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
diff --git a/meta-ti-bsp/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb=
 b/meta-ti-extras/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb
similarity index 100%
rename from meta-ti-bsp/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb
rename to meta-ti-extras/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb
diff --git a/meta-ti-bsp/recipes-devtools/gdbc6x/gdbc6x.inc b/meta-ti-ext=
ras/recipes-devtools/gdbc6x/gdbc6x.inc
similarity index 100%
rename from meta-ti-bsp/recipes-devtools/gdbc6x/gdbc6x.inc
rename to meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x.inc
diff --git a/meta-ti-bsp/recipes-devtools/gdbc6x/gdbc6x/0001-libbfd.h-sup=
press-GCC9-Wstringop-truncation.patch b/meta-ti-extras/recipes-devtools/g=
dbc6x/gdbc6x/0001-libbfd.h-suppress-GCC9-Wstringop-truncation.patch
similarity index 100%
rename from meta-ti-bsp/recipes-devtools/gdbc6x/gdbc6x/0001-libbfd.h-supp=
ress-GCC9-Wstringop-truncation.patch
rename to meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x/0001-libbfd.h-sup=
press-GCC9-Wstringop-truncation.patch
diff --git a/meta-ti-bsp/recipes-devtools/gdbc6x/gdbc6x/init b/meta-ti-ex=
tras/recipes-devtools/gdbc6x/gdbc6x/init
similarity index 100%
rename from meta-ti-bsp/recipes-devtools/gdbc6x/gdbc6x/init
rename to meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x/init
diff --git a/meta-ti-bsp/recipes-devtools/gdbc6x/gdbc6x_git.bb b/meta-ti-=
extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-devtools/gdbc6x/gdbc6x_git.bb
rename to meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
diff --git a/meta-ti-bsp/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb b/m=
eta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
rename to meta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
diff --git a/meta-ti-bsp/recipes-devtools/gdbc6x/gdbserverproxy-module-dr=
v_git.bb b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-d=
rv_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-devtools/gdbc6x/gdbserverproxy-module-drv=
_git.bb
rename to meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-dr=
v_git.bb
diff --git a/meta-ti-bsp/recipes-multimedia/libdce/libdce_3.00.14.00.bb b=
/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.14.00.bb
similarity index 100%
rename from meta-ti-bsp/recipes-multimedia/libdce/libdce_3.00.14.00.bb
rename to meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.14.00.bb
diff --git a/meta-ti-bsp/recipes-ti/README b/meta-ti-extras/recipes-ti/RE=
ADME
similarity index 100%
rename from meta-ti-bsp/recipes-ti/README
rename to meta-ti-extras/recipes-ti/README
diff --git a/meta-ti-bsp/recipes-ti/bios/ti-sysbios.inc b/meta-ti-extras/=
recipes-ti/bios/ti-sysbios.inc
similarity index 100%
rename from meta-ti-bsp/recipes-ti/bios/ti-sysbios.inc
rename to meta-ti-extras/recipes-ti/bios/ti-sysbios.inc
diff --git a/meta-ti-bsp/recipes-ti/bios/ti-sysbios_6.76.03.01.bb b/meta-=
ti-extras/recipes-ti/bios/ti-sysbios_6.76.03.01.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/bios/ti-sysbios_6.76.03.01.bb
rename to meta-ti-extras/recipes-ti/bios/ti-sysbios_6.76.03.01.bb
diff --git a/meta-ti-bsp/recipes-ti/codec-engine/ti-codec-engine_3.24.00.=
08.bb b/meta-ti-extras/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08=
.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/codec-engine/ti-codec-engine_3.24.00.0=
8.bb
rename to meta-ti-extras/recipes-ti/codec-engine/ti-codec-engine_3.24.00.=
08.bb
diff --git a/meta-ti-bsp/recipes-ti/ctoolslib/libaet_git.bb b/meta-ti-ext=
ras/recipes-ti/ctoolslib/libaet_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/ctoolslib/libaet_git.bb
rename to meta-ti-extras/recipes-ti/ctoolslib/libaet_git.bb
diff --git a/meta-ti-bsp/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-=
update.bb b/meta-ti-extras/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q=
2-update.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-u=
pdate.bb
rename to meta-ti-extras/recipes-ti/devtools/gcc-arm-baremetal_7-2018-q2-=
update.bb
diff --git a/meta-ti-bsp/recipes-ti/devtools/ti-cg-xml_2.61.00.bb b/meta-=
ti-extras/recipes-ti/devtools/ti-cg-xml_2.61.00.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/devtools/ti-cg-xml_2.61.00.bb
rename to meta-ti-extras/recipes-ti/devtools/ti-cg-xml_2.61.00.bb
diff --git a/meta-ti-bsp/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb b/meta=
-ti-extras/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
rename to meta-ti-extras/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
diff --git a/meta-ti-bsp/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb b/meta-t=
i-extras/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb
rename to meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb
diff --git a/meta-ti-bsp/recipes-ti/devtools/ti-cgt470.inc b/meta-ti-extr=
as/recipes-ti/devtools/ti-cgt470.inc
similarity index 100%
rename from meta-ti-bsp/recipes-ti/devtools/ti-cgt470.inc
rename to meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc
diff --git a/meta-ti-bsp/recipes-ti/devtools/ti-cgt470_4.6.6.bb b/meta-ti=
-extras/recipes-ti/devtools/ti-cgt470_4.6.6.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/devtools/ti-cgt470_4.6.6.bb
rename to meta-ti-extras/recipes-ti/devtools/ti-cgt470_4.6.6.bb
diff --git a/meta-ti-bsp/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb b/meta-=
ti-extras/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb
rename to meta-ti-extras/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb
diff --git a/meta-ti-bsp/recipes-ti/devtools/ti-cgt6x_8.3.2.bb b/meta-ti-=
extras/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
rename to meta-ti-extras/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
diff --git a/meta-ti-bsp/recipes-ti/devtools/ti-cgt7x_1.2.0.bb b/meta-ti-=
extras/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
rename to meta-ti-extras/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
diff --git a/meta-ti-bsp/recipes-ti/devtools/ti-xdctools-common.inc b/met=
a-ti-extras/recipes-ti/devtools/ti-xdctools-common.inc
similarity index 100%
rename from meta-ti-bsp/recipes-ti/devtools/ti-xdctools-common.inc
rename to meta-ti-extras/recipes-ti/devtools/ti-xdctools-common.inc
diff --git a/meta-ti-bsp/recipes-ti/devtools/ti-xdctools-core.inc b/meta-=
ti-extras/recipes-ti/devtools/ti-xdctools-core.inc
similarity index 100%
rename from meta-ti-bsp/recipes-ti/devtools/ti-xdctools-core.inc
rename to meta-ti-extras/recipes-ti/devtools/ti-xdctools-core.inc
diff --git a/meta-ti-bsp/recipes-ti/devtools/ti-xdctools.inc b/meta-ti-ex=
tras/recipes-ti/devtools/ti-xdctools.inc
similarity index 100%
rename from meta-ti-bsp/recipes-ti/devtools/ti-xdctools.inc
rename to meta-ti-extras/recipes-ti/devtools/ti-xdctools.inc
diff --git a/meta-ti-bsp/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb b/=
meta-ti-extras/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb
rename to meta-ti-extras/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb
diff --git a/meta-ti-bsp/recipes-ti/dsplib/dsplib-c64xp_git.bb b/meta-ti-=
extras/recipes-ti/dsplib/dsplib-c64xp_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/dsplib/dsplib-c64xp_git.bb
rename to meta-ti-extras/recipes-ti/dsplib/dsplib-c64xp_git.bb
diff --git a/meta-ti-bsp/recipes-ti/dsplib/dsplib-c66x_git.bb b/meta-ti-e=
xtras/recipes-ti/dsplib/dsplib-c66x_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/dsplib/dsplib-c66x_git.bb
rename to meta-ti-extras/recipes-ti/dsplib/dsplib-c66x_git.bb
diff --git a/meta-ti-bsp/recipes-ti/dsplib/dsplib-c674x_git.bb b/meta-ti-=
extras/recipes-ti/dsplib/dsplib-c674x_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/dsplib/dsplib-c674x_git.bb
rename to meta-ti-extras/recipes-ti/dsplib/dsplib-c674x_git.bb
diff --git a/meta-ti-bsp/recipes-ti/dsplib/dsplib.inc b/meta-ti-extras/re=
cipes-ti/dsplib/dsplib.inc
similarity index 100%
rename from meta-ti-bsp/recipes-ti/dsplib/dsplib.inc
rename to meta-ti-extras/recipes-ti/dsplib/dsplib.inc
diff --git a/meta-ti-bsp/recipes-ti/framework-components/ti-framework-com=
ponents.inc b/meta-ti-extras/recipes-ti/framework-components/ti-framework=
-components.inc
similarity index 100%
rename from meta-ti-bsp/recipes-ti/framework-components/ti-framework-comp=
onents.inc
rename to meta-ti-extras/recipes-ti/framework-components/ti-framework-com=
ponents.inc
diff --git a/meta-ti-bsp/recipes-ti/framework-components/ti-framework-com=
ponents_2.26.00.01.bb b/meta-ti-extras/recipes-ti/framework-components/ti=
-framework-components_2.26.00.01.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/framework-components/ti-framework-comp=
onents_2.26.00.01.bb
rename to meta-ti-extras/recipes-ti/framework-components/ti-framework-com=
ponents_2.26.00.01.bb
diff --git a/meta-ti-bsp/recipes-ti/framework-components/ti-framework-com=
ponents_3.40.02.07.bb b/meta-ti-extras/recipes-ti/framework-components/ti=
-framework-components_3.40.02.07.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/framework-components/ti-framework-comp=
onents_3.40.02.07.bb
rename to meta-ti-extras/recipes-ti/framework-components/ti-framework-com=
ponents_3.40.02.07.bb
diff --git a/meta-ti-bsp/recipes-ti/imglib/imglib-c66x.inc b/meta-ti-extr=
as/recipes-ti/imglib/imglib-c66x.inc
similarity index 100%
rename from meta-ti-bsp/recipes-ti/imglib/imglib-c66x.inc
rename to meta-ti-extras/recipes-ti/imglib/imglib-c66x.inc
diff --git a/meta-ti-bsp/recipes-ti/imglib/imglib-c66x_3.1.1.0.bb b/meta-=
ti-extras/recipes-ti/imglib/imglib-c66x_3.1.1.0.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/imglib/imglib-c66x_3.1.1.0.bb
rename to meta-ti-extras/recipes-ti/imglib/imglib-c66x_3.1.1.0.bb
diff --git a/meta-ti-bsp/recipes-ti/includes/ti-eula-unpack.inc b/meta-ti=
-extras/recipes-ti/includes/ti-eula-unpack.inc
similarity index 100%
rename from meta-ti-bsp/recipes-ti/includes/ti-eula-unpack.inc
rename to meta-ti-extras/recipes-ti/includes/ti-eula-unpack.inc
diff --git a/meta-ti-bsp/recipes-ti/includes/ti-paths.inc b/meta-ti-extra=
s/recipes-ti/includes/ti-paths.inc
similarity index 100%
rename from meta-ti-bsp/recipes-ti/includes/ti-paths.inc
rename to meta-ti-extras/recipes-ti/includes/ti-paths.inc
diff --git a/meta-ti-bsp/recipes-ti/includes/ti-staging.inc b/meta-ti-ext=
ras/recipes-ti/includes/ti-staging.inc
similarity index 100%
rename from meta-ti-bsp/recipes-ti/includes/ti-staging.inc
rename to meta-ti-extras/recipes-ti/includes/ti-staging.inc
diff --git a/meta-ti-bsp/recipes-ti/includes/ti-unpack.inc b/meta-ti-extr=
as/recipes-ti/includes/ti-unpack.inc
similarity index 100%
rename from meta-ti-bsp/recipes-ti/includes/ti-unpack.inc
rename to meta-ti-extras/recipes-ti/includes/ti-unpack.inc
diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc-examples-linux/0001-exampl=
es-ClusterMgr-sys_errlist-has-been-deprecated-.patch b/meta-ti-extras/rec=
ipes-ti/ipc/ti-ipc-examples-linux/0001-examples-ClusterMgr-sys_errlist-ha=
s-been-deprecated-.patch
similarity index 100%
rename from meta-ti-bsp/recipes-ti/ipc/ti-ipc-examples-linux/0001-example=
s-ClusterMgr-sys_errlist-has-been-deprecated-.patch
rename to meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux/0001-exampl=
es-ClusterMgr-sys_errlist-has-been-deprecated-.patch
diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc-examples-linux_git.bb b/me=
ta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
rename to meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc-examples.inc b/meta-ti-ext=
ras/recipes-ti/ipc/ti-ipc-examples.inc
similarity index 100%
rename from meta-ti-bsp/recipes-ti/ipc/ti-ipc-examples.inc
rename to meta-ti-extras/recipes-ti/ipc/ti-ipc-examples.inc
diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc-examples_git.bb b/meta-ti-=
extras/recipes-ti/ipc/ti-ipc-examples_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/ipc/ti-ipc-examples_git.bb
rename to meta-ti-extras/recipes-ti/ipc/ti-ipc-examples_git.bb
diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc-rtos.inc b/meta-ti-extras/=
recipes-ti/ipc/ti-ipc-rtos.inc
similarity index 100%
rename from meta-ti-bsp/recipes-ti/ipc/ti-ipc-rtos.inc
rename to meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos.inc
diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc-rtos_git.bb b/meta-ti-extr=
as/recipes-ti/ipc/ti-ipc-rtos_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/ipc/ti-ipc-rtos_git.bb
rename to meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb
diff --git a/meta-ti-bsp/recipes-ti/mathlib/mathlib-c66x_git.bb b/meta-ti=
-extras/recipes-ti/mathlib/mathlib-c66x_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/mathlib/mathlib-c66x_git.bb
rename to meta-ti-extras/recipes-ti/mathlib/mathlib-c66x_git.bb
diff --git a/meta-ti-bsp/recipes-ti/mathlib/mathlib-c674x_git.bb b/meta-t=
i-extras/recipes-ti/mathlib/mathlib-c674x_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/mathlib/mathlib-c674x_git.bb
rename to meta-ti-extras/recipes-ti/mathlib/mathlib-c674x_git.bb
diff --git a/meta-ti-bsp/recipes-ti/mathlib/mathlib.inc b/meta-ti-extras/=
recipes-ti/mathlib/mathlib.inc
similarity index 100%
rename from meta-ti-bsp/recipes-ti/mathlib/mathlib.inc
rename to meta-ti-extras/recipes-ti/mathlib/mathlib.inc
diff --git a/meta-ti-bsp/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/meta=
-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/openmp-rtos/openmp-rtos_git.bb
rename to meta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb
diff --git a/meta-ti-bsp/recipes-ti/osal/ti-osal.inc b/meta-ti-extras/rec=
ipes-ti/osal/ti-osal.inc
similarity index 100%
rename from meta-ti-bsp/recipes-ti/osal/ti-osal.inc
rename to meta-ti-extras/recipes-ti/osal/ti-osal.inc
diff --git a/meta-ti-bsp/recipes-ti/osal/ti-osal_1.24.00.09.bb b/meta-ti-=
extras/recipes-ti/osal/ti-osal_1.24.00.09.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/osal/ti-osal_1.24.00.09.bb
rename to meta-ti-extras/recipes-ti/osal/ti-osal_1.24.00.09.bb
diff --git a/meta-ti-bsp/recipes-ti/swtools/swtools_git.bb b/meta-ti-extr=
as/recipes-ti/swtools/swtools_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/swtools/swtools_git.bb
rename to meta-ti-extras/recipes-ti/swtools/swtools_git.bb
diff --git a/meta-ti-bsp/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb =
b/meta-ti-extras/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
rename to meta-ti-extras/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
diff --git a/meta-ti-bsp/recipes-ti/vlib/vlib-c66x.inc b/meta-ti-extras/r=
ecipes-ti/vlib/vlib-c66x.inc
similarity index 100%
rename from meta-ti-bsp/recipes-ti/vlib/vlib-c66x.inc
rename to meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc
diff --git a/meta-ti-bsp/recipes-ti/vlib/vlib-c66x_3.2.1.0.bb b/meta-ti-e=
xtras/recipes-ti/vlib/vlib-c66x_3.2.1.0.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/vlib/vlib-c66x_3.2.1.0.bb
rename to meta-ti-extras/recipes-ti/vlib/vlib-c66x_3.2.1.0.bb
diff --git a/meta-ti-bsp/recipes-ti/xdais/ti-xdais.inc b/meta-ti-extras/r=
ecipes-ti/xdais/ti-xdais.inc
similarity index 100%
rename from meta-ti-bsp/recipes-ti/xdais/ti-xdais.inc
rename to meta-ti-extras/recipes-ti/xdais/ti-xdais.inc
diff --git a/meta-ti-bsp/recipes-ti/xdais/ti-xdais_6.26.01.03.bb b/meta-t=
i-extras/recipes-ti/xdais/ti-xdais_6.26.01.03.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/xdais/ti-xdais_6.26.01.03.bb
rename to meta-ti-extras/recipes-ti/xdais/ti-xdais_6.26.01.03.bb
diff --git a/meta-ti-bsp/recipes-ti/xdais/ti-xdais_7.24.00.04.bb b/meta-t=
i-extras/recipes-ti/xdais/ti-xdais_7.24.00.04.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/xdais/ti-xdais_7.24.00.04.bb
rename to meta-ti-extras/recipes-ti/xdais/ti-xdais_7.24.00.04.bb
--=20
2.25.1

