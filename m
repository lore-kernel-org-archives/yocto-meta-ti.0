Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B897DCD98C5
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 22:40:58 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33210.1781131248880480329
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 15:40:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=vTU0pRZK;
 spf=pass (domain: ti.com, ip: 40.93.195.42, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gZZWxCGYBTmWGeEQOlUTRU44yhW4Yn37ZtszURIKwWV9rQ61kP2ID+DbBNChLaE9G5dkhuu5xDBdTDb2BMI8Gju+VlumSprCuxSPlB7eNZrkvceWaMrCI7vaL0VE+1u5mz6IxJxWcR3p+B4JZbPu2pHKsUNBhGZj8dPC/4LHZ+Wi2MAchSiBUUj8RQrU+sYNOY7+6lFRNklfRVahhB1Wzv+qm99cJLaBY7DKF+ZXoEBq2OjNpXCqx83GzjmPeZ4T7tCJLAyVSp445VtclrCEo1jgYYhJ6GAu7b563WLkNvs/AAAIzh2b+1mPyqr7juY977KaAJ0svf0ckv5zdrSyzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=re4jRn55OMRsIywYAPKz/pP7Pp4PZz2Ohu3Iqcb3JfA=;
 b=hq5GylBXSg+yk5Cqtsn6E69SB7/Mo827QqdyzS1LvcwVxpL3LZlLxycHWoI656w8KTbi/09oiJ8QYk7Nc1cXy+1goF6p7McP7lyTncAegtveP0gs43X3xlo/h1j0r4GvG1lXkTRoN1jQIlQNq4s676+S16nBmJMLH24SpXU1OJKn1FTX3TsnFeXD+eTySXHlMUazvVkectnX677UEtHF6hTzKN3RTjZL8IB9dY0puICAuK3naNJSvaCW0T+Jfl9e7wghoPSZfEXY+DyUU9H6iauLsS+2RvntiqMhstAVEga8aPGYVtNG2PJdbLriASen8HkZIeVTDx9vN9lCQRK/qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=re4jRn55OMRsIywYAPKz/pP7Pp4PZz2Ohu3Iqcb3JfA=;
 b=vTU0pRZKssVjEyqBd8Mhk0r2jNLIzUAnmzlMeZSfb5syRAa/SioEOBWCBumVkUfQURAB9A79rVswcRg3ghjU33Uk1XPVzugrhYODiygJT85pbZo9QAFQILjT3AmHFc0Ve3+Ar6Rbf09L6mZq0lYN74WaU3ZMExxkCiT7h31v8m8=
Received: from PH5P220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::15)
 by IA3PR10MB8249.namprd10.prod.outlook.com (2603:10b6:208:571::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 22:40:43 +0000
Received: from CY4PEPF0000EDD5.namprd03.prod.outlook.com
 (2603:10b6:510:34a:cafe::36) by PH5P220CA0005.outlook.office365.com
 (2603:10b6:510:34a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.13 via Frontend Transport; Wed,
 10 Jun 2026 22:40:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000EDD5.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 22:40:42 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 10 Jun
 2026 17:40:41 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 10 Jun
 2026 17:40:41 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 10 Jun 2026 17:40:41 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.216])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65AMefQK609035;
	Wed, 10 Jun 2026 17:40:41 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][wrynose][PATCH] mesa-pvr: Migration from v24.0.1 -> v25.2.8
Date: Wed, 10 Jun 2026 17:40:41 -0500
Message-ID: <20260610224041.153148-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD5:EE_|IA3PR10MB8249:EE_
X-MS-Office365-Filtering-Correlation-Id: 9959c7af-1b24-41a3-2431-08dec7414dab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|376014|82310400026|56012099006|6133799003|3023799007|12006099003|18002099003|20052099010;
X-Microsoft-Antispam-Message-Info: 
	q5PTHSBwQMiWEIsyVIJJfnuyilwc4AKBVgEH9rtfggeHZRvPVAoqjg/K9CotOKL55E+Fanxrcn+TdAEUXMUplvL7sfuT1faLnhF7w+CETFuS/4YijhNQAV7w7gu700bzafYw5pmus4ril5c0BT5zIu677GyPyJ3wPjApPA9LrkJ1QTQRiLzktijhOpM04WpF4Zi3C8vTtVTRo06057F+TZFxGIw9xxnMMK+bxOD5ZNP58UkHXNbYRT+lsCqjtbYQ3ppfXGWbtZV/bQynnTm98NYLBJGx+23LZVm+zr4Mv5ExKhJLirrUGKwIqdFS5O7HufXSeAwBMS4w37cbIbk7oukr0MmpJU8FKud+O5iOEEknQXIbpdioW2OM3ZgJfgZrZnd0AQbtVQLwTnn8KMr2oEFxOc7FJKZnygaywPzwkWjA6s+TSR/rvUK/nXrP3eoLtHsHRAfrbiUCs8f6JQEbZqYOSDFAEjqUKZPrfplzyJdAn8eCItwHh1AnuNGtZsHOmc39B9phvDEXuw0H9jz775vbGz08Pq6eeD/XPFQXJcL0b2aYnX6qzmim8S2R1pQDjPcnZhlBmk7uab8OmbyZRYqS4u935ldnRd/APXdh7omjtlAC3Bagln4KAE/KtK4k9IfHq9dvNFAjkaRw4khY7q7Rq7QSJqzZ0QKUIgcotTM=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(376014)(82310400026)(56012099006)(6133799003)(3023799007)(12006099003)(18002099003)(20052099010);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	rUydTlYFTx14A/sNfPbmsNp5TAhlS/Lmx83pvRgiMTdcciORrVipYjmvw2CIKvMwlGHbkA5ajLJtU5NGaNB/K5EH8qrNBX3EXUFxL+W6OjY6gkBXtjsTZ3ZiKcnAyU7KV9DMqZ+OTyK11RsYr8DdGLE7i5T9K95A5S+BtTxdspzd1yUlQoUeol1k30+3SnjmdxD53C5PazDW775jushMMOxRMzwLqbdIyUkqp0cXsu1N24I/x98AZsJgnuCogncsOL4ymRAWU8rjBW/uGG5NeBqUbi6qDPO2wUrbm/LYMcagJ9gkRnjxWMvfo5tM2BRSJIJmzXNvzqsfldPwcOTqt2iCGc4lOYQxdzMlUrGAAIvUwKZG0RU/Wf9d2rSikFLNRwnIfU/zXlBzAlqr72cv1Nom1Tv+4Tos1j0YTw/E8COucwxjI0fIo7yxHpqz3r4s
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 22:40:42.1963
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9959c7af-1b24-41a3-2431-08dec7414dab
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EDD5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8249
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 10 Jun 2026 22:40:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20009

From: Antonios Christidis <a-christidis@ti.com>

Migrate to a new version of Mesa (v25.2.8) for only Rogue GPU devices.
The interface for SGX devices is not ready in the v25 fork. Due to
this, still keep all of the v24 recipes.

The right version of mesa will be picked up with the help of
BSP_MESA_PVR_VERSION and COMPATIBLE_MACHINE (set on a per recipe
basis).

Copy over the main inc (also version 25.2.8) file from oe-core to be
included in mesa-pvr v25.2.8 builds. This is the general flow that was
done for mesa-pvr v24.0.1.

Due to the way oe-core's v25.2.8 mesa.inc recipe works, expects the
recipe that inherits it to setup all the PACKAGECONFIG variable append
logic. This is different from the v24.0.1 flow, which has all of that
logic as part of the inc file. So for mesa-pvr set that logic within
the main recipe file.

In regards to patches, there are 3 points/sources: 1) oe-core v24
recipe patches 2) oe-core v25 recipe patches 3) TI exclusive ones that
are added on top of oe-core v24

Point 1 is already handled by the oe-core process. Regarding point 2
patches, one is already present within the src and the other is being
carried by the new recipe. The patches from point 3 are already
included in this version of mesa.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 meta-ti-bsp/conf/machine/include/ti-bsp.inc   |   5 +-
 .../mesa/{mesa-pvr.inc =3D> mesa-pvr-24.inc}    |   0
 ...sdetects-64bit-atomics-on-mips-clang.patch |  24 ++
 .../recipes-graphics/mesa/mesa-pvr-25.inc     | 356 ++++++++++++++++++
 .../recipes-graphics/mesa/mesa-pvr_24.0.1.bb  |   4 +-
 .../recipes-graphics/mesa/mesa-pvr_25.2.8.bb  |  60 +++
 6 files changed, 447 insertions(+), 2 deletions(-)
 rename meta-ti-bsp/recipes-graphics/mesa/{mesa-pvr.inc =3D> mesa-pvr-24.in=
c} (100%)
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.2.8/0001-=
meson-misdetects-64bit-atomics-on-mips-clang.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb

diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf=
/machine/include/ti-bsp.inc
index f7e2710c..38375ada 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -44,7 +44,10 @@ BSP_BOOTLOADER_VERSION:bsp-ti-6_18 =3D "2026.01%"
=20
 BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_18 =3D "ti-img-rogue-driver"
 BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_18 =3D "25%"
-BSP_MESA_PVR_VERSION:bsp-ti-6_18 =3D "24%"
+
+#Only two valid versions are 24.0.1 & 25.2.8.
+#V24 is meant for SGX cores, V25 is meant for Rogue
+BSP_MESA_PVR_VERSION:bsp-ti-6_18: =3D "2%"
=20
 # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 # ti-6_12
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc b/meta-ti-bsp/r=
ecipes-graphics/mesa/mesa-pvr-24.inc
similarity index 100%
rename from meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc
rename to meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.2.8/0001-meson-m=
isdetects-64bit-atomics-on-mips-clang.patch b/meta-ti-bsp/recipes-graphics/=
mesa/mesa-pvr-25.2.8/0001-meson-misdetects-64bit-atomics-on-mips-clang.patc=
h
new file mode 100644
index 00000000..baa98a0d
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.2.8/0001-meson-misdetec=
ts-64bit-atomics-on-mips-clang.patch
@@ -0,0 +1,24 @@
+From 02cc21800fe29f566add525e63f619c0536d6e7b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 13 Jan 2020 15:23:47 -0800
+Subject: [PATCH] meson misdetects 64bit atomics on mips/clang
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/util/u_atomic.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/util/u_atomic.c b/src/util/u_atomic.c
+index 5a5eab4..e499516 100644
+--- a/src/util/u_atomic.c
++++ b/src/util/u_atomic.c
+@@ -21,7 +21,7 @@
+  * IN THE SOFTWARE.
+  */
+=20
+-#if defined(MISSING_64BIT_ATOMICS) && defined(HAVE_PTHREAD)
++#if !defined(__clang__) && defined(MISSING_64BIT_ATOMICS) && defined(HAVE=
_PTHREAD)
+=20
+ #include <stdint.h>
+ #include <pthread.h>
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc b/meta-ti-bs=
p/recipes-graphics/mesa/mesa-pvr-25.inc
new file mode 100644
index 00000000..5c6beff1
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
@@ -0,0 +1,356 @@
+# Copy from oe-core, commit sha:2c0c7c3e5b71, branch Whinlatter.
+SUMMARY =3D "A free implementation of the OpenGL API"
+DESCRIPTION =3D "Mesa is an open-source implementation of the OpenGL speci=
fication - \
+a system for rendering interactive 3D graphics.  \
+A variety of device drivers allows Mesa to be used in many different envir=
onments \
+ranging from software emulation to complete hardware acceleration for mode=
rn GPUs. \
+Mesa is used as part of the overall Direct Rendering Infrastructure and X.=
org \
+environment."
+
+HOMEPAGE =3D "http://mesa3d.org"
+BUGTRACKER =3D "https://bugs.freedesktop.org"
+SECTION =3D "x11"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3Dffe678546d4337b732cfd1=
2262e6af11"
+
+PE =3D "2"
+
+SRC_URI =3D "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
+           file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch =
\
+           file://0001-freedreno-don-t-encode-build-path-into-binaries.pat=
ch \
+"
+
+SRC_URI[sha256sum] =3D "097842f3e49d996868b38688db87b006f7d4541e93ce86d2f3=
41d8b3e7be7c93"
+PV =3D "25.2.8"
+
+UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
+
+#Remove this, since it points to mesa and not mesa-pvr
+#S =3D "${UNPACKDIR}/mesa-${PV}"
+
+#because we cannot rely on the fact that all apps will use pkgconfig,
+#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
+do_install:append() {
+  # sed can't find EGL/eglplatform.h as it doesn't get installed when glvn=
d enabled.
+  # So, check if EGL/eglplatform.h exists before running sed.
+  if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)} && =
[ -f ${D}${includedir}/EGL/eglplatform.h ]; then
+      sed -i -e 's/^#elif defined(__unix__) && defined(EGL_NO_X11)$/#elif =
defined(__unix__) \&\& defined(EGL_NO_X11) || ${@bb.utils.contains('PACKAGE=
CONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
+  fi
+  # These are ICDs, apps are not supposed to link against them
+  if ${@bb.utils.contains('PACKAGECONFIG', 'glvnd', 'true', 'false', d)} ;=
 then
+      rm -f ${D}${libdir}/libEGL_mesa.so ${D}${libdir}/libGLX_mesa.so
+  fi
+}
+
+DEPENDS =3D "expat makedepend-native flex-native bison-native libxml2-nati=
ve zlib chrpath-replacement-native python3-mako-native gettext-native pytho=
n3-pyyaml-native"
+EXTRANATIVEPATH +=3D "chrpath-native"
+
+inherit meson pkgconfig python3native gettext features_check rust
+
+ANY_OF_DISTRO_FEATURES =3D "opencl opengl vulkan"
+
+PLATFORMS ??=3D "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)}"
+
+# set the MESA_BUILD_TYPE to either 'release' (default) or 'debug'
+# by default the upstream mesa sources build a debug release
+# here we assume the user will want a release build by default
+MESA_BUILD_TYPE ?=3D "release"
+def check_buildtype(d):
+    _buildtype =3D d.getVar('MESA_BUILD_TYPE')
+    if _buildtype not in ['release', 'debug']:
+        bb.fatal("unknown build type (%s), please set MESA_BUILD_TYPE to e=
ither 'release' or 'debug'" % _buildtype)
+    if _buildtype =3D=3D 'debug':
+        return 'debugoptimized'
+    return 'plain'
+MESON_BUILDTYPE =3D "${@check_buildtype(d)}"
+
+EXTRA_OEMESON =3D " \
+    -Dglx-read-only-text=3Dtrue \
+    -Dplatforms=3D'${@",".join("${PLATFORMS}".split())}' \
+"
+
+def strip_comma(s):
+    return s.strip(',')
+
+# skip all Rust dependencies if we are not building OpenCL"
+INHIBIT_DEFAULT_RUST_DEPS =3D "${@bb.utils.contains('PACKAGECONFIG', 'open=
cl', '', '1', d)}"
+
+# "egl" requires "opengl"
+PACKAGECONFIG[egl] =3D "-Degl=3Denabled, -Degl=3Ddisabled"
+
+# "gbm" requires "opengl"
+PACKAGECONFIG[gbm] =3D "-Dgbm=3Denabled,-Dgbm=3Ddisabled"
+
+# "gles" requires "opengl"
+PACKAGECONFIG[gles] =3D "-Dgles1=3Denabled -Dgles2=3Denabled, -Dgles1=3Ddi=
sabled -Dgles2=3Ddisabled"
+
+PACKAGECONFIG[glvnd] =3D "-Dglvnd=3Denabled, -Dglvnd=3Ddisabled, libglvnd"
+
+PACKAGECONFIG[opengl] =3D "-Dopengl=3Dtrue, -Dopengl=3Dfalse"
+
+# "opencl" also requires libclc and gallium-llvm to be present in PKGCONFI=
G!
+# Be sure to enable them both for the target and for the native build.
+PACKAGECONFIG[opencl] =3D "-Dgallium-rusticl=3Dtrue -Dmesa-clc-bundle-head=
ers=3Denabled, -Dgallium-rusticl=3Dfalse, bindgen-cli-native clang"
+
+X11_DEPS =3D "xorgproto virtual/libx11 libxext libxxf86vm libxdamage libxf=
ixes xrandr xorgproto libxshmfence"
+# "x11" requires "opengl"
+PACKAGECONFIG[x11] =3D ",-Dglx=3Ddisabled,${X11_DEPS}"
+PACKAGECONFIG[wayland] =3D ",,wayland-native wayland libdrm wayland-protoc=
ols"
+
+# Entries for GPU vendors.
+# Some of the drivers might have extra dependencies (libclc, gallium-llvm)=
.
+# Check them in the individual driver settings in VULKAN_DRIVERS and
+# GALLIUMDRIVERS.
+PACKAGECONFIG[amd] =3D ""
+PACKAGECONFIG[asahi] =3D ""
+PACKAGECONFIG[broadcom] =3D ""
+PACKAGECONFIG[etnaviv] =3D ",,python3-pycparser-native"
+PACKAGECONFIG[freedreno] =3D ""
+PACKAGECONFIG[imagination] =3D "-Dimagination-srv=3Dtrue,-Dimagination-srv=
=3Dfalse"
+PACKAGECONFIG[intel] =3D ""
+PACKAGECONFIG[lima] =3D ""
+PACKAGECONFIG[nouveau] =3D ""
+PACKAGECONFIG[panfrost] =3D ""
+PACKAGECONFIG[svga] =3D ""
+PACKAGECONFIG[tegra] =3D ""
+PACKAGECONFIG[v3d] =3D ""
+PACKAGECONFIG[vc4] =3D ""
+PACKAGECONFIG[virgl] =3D ""
+PACKAGECONFIG[zink] =3D ""
+
+
+VULKAN_DRIVERS_SWRAST =3D ",swrast"
+# Crashes on x32
+VULKAN_DRIVERS_SWRAST:x86-x32 =3D ""
+
+# keep sorted by the driver name (rather than PKGCONFIG)
+VULKAN_DRIVERS =3D ""
+VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'amd gallium-ll=
vm', ',amd', '', d)}"
+VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'asahi libclc g=
allium-llvm', ',asahi', '', d)}"
+VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',b=
roadcom', '', d)}"
+VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',=
freedreno', '', d)}"
+VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'imagination', =
',imagination-experimental', '', d)}"
+VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc g=
allium-llvm', ',intel', '', d)}"
+VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm',=
 '${VULKAN_DRIVERS_SWRAST}', '', d)}"
+VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libcl=
c', ',panfrost', '', d)}"
+
+PACKAGECONFIG[vulkan] =3D "-Dvulkan-drivers=3D${@strip_comma('${VULKAN_DRI=
VERS}')}, -Dvulkan-drivers=3D'',glslang-native vulkan-loader vulkan-headers=
"
+PACKAGECONFIG[vulkan-beta] =3D "-Dvulkan-beta=3Dtrue,-Dvulkan-beta=3Dfalse=
"
+
+# mesa development and testing tools support, per driver
+
+# keep sorted by the driver name (rather than PKGCONFIG)
+TOOLS =3D ""
+TOOLS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'asahi', ',asahi', '', d=
)}"
+TOOLS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '=
', d)}"
+TOOLS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno=
', '', d)}"
+TOOLS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagina=
tion', '', d)}"
+TOOLS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}=
"
+TOOLS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost',=
 '', d)}"
+
+# dependencies for tools.
+TOOLS_DEPS =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ' ncurs=
es libxml2 ', '', d)}"
+
+# the fdperf tool requires libconfig (a part of meta-oe) so it needs speci=
al
+# treatment in addition to the usual 'freedreno tools'.
+PACKAGECONFIG[freedreno-fdperf] =3D ",,libconfig"
+
+PACKAGECONFIG[tools] =3D "-Dtools=3D${@strip_comma('${TOOLS}')}, -Dtools=
=3D'', ${TOOLS_DEPS}"
+PACKAGECONFIG[xmlconfig] =3D "-Dxmlconfig=3Denabled, -Dxmlconfig=3Ddisable=
d, expat"
+
+GALLIUMDRIVERS_LLVMPIPE =3D ",llvmpipe"
+GALLIUMDRIVERS_SOFTPIPE =3D ",softpipe"
+# gallium softpipe and llvmpipe was found to crash Xorg on startup in x32 =
qemu
+GALLIUMDRIVERS_LLVMPIPE:x86-x32 =3D ""
+GALLIUMDRIVERS_SOFTPIPE:x86-x32 =3D ""
+
+# keep sorted by the driver name (rather than PKGCONFIG)
+GALLIUMDRIVERS =3D ""
+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'asahi libclc g=
allium-llvm', ',asahi', '', d)}"
+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',croc=
us', '', d)}"
+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',et=
naviv', '', d)}"
+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',=
freedreno', '', d)}"
+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',i915=
', '', d)}"
+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc g=
allium-llvm', ',iris', '', d)}"
+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima'=
, '', d)}"
+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm',=
 '${GALLIUMDRIVERS_LLVMPIPE}', '', d)}"
+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'nouveau galliu=
m-llvm', ',nouveau', '', d)}"
+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libcl=
c', ',panfrost', '', d)}"
+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'amd gallium-ll=
vm', ',r300', '', d)}"
+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'amd', ',r600',=
 '', d)}"
+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'amd gallium-ll=
vm', ',radeonsi', '', d)}"
+GALLIUMDRIVERS .=3D "${GALLIUMDRIVERS_SOFTPIPE}"
+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'svga gallium-l=
lvm', ',svga', '', d)}"
+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'tegra', ',tegr=
a', '', d)}"
+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'virgl', ',virg=
l', '', d)}"
+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'vc4', ',vc4', =
'', d)}"
+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'v3d', ',v3d', =
'', d)}"
+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'zink', ',zink'=
, '', d)}"
+
+PACKAGECONFIG[gallium] =3D "-Dgallium-drivers=3D${@strip_comma('${GALLIUMD=
RIVERS}')}, -Dgallium-drivers=3D'', libdrm"
+PACKAGECONFIG[gallium-llvm] =3D "-Dllvm=3Denabled -Dshared-llvm=3Denabled,=
 -Dllvm=3Ddisabled, llvm llvm-native elfutils"
+
+MESA_CLC =3D "system"
+MESA_CLC:class-native =3D "enabled"
+INSTALL_MESA_CLC =3D "false"
+INSTALL_MESA_CLC:class-native =3D "true"
+MESA_NATIVE =3D "mesa-native"
+MESA_NATIVE:class-native =3D ""
+
+PACKAGECONFIG[libclc] =3D "-Dmesa-clc=3D${MESA_CLC} -Dinstall-mesa-clc=3D$=
{INSTALL_MESA_CLC} -Dmesa-clc-bundle-headers=3Denabled,,libclc spirv-tools =
spirv-llvm-translator ${MESA_NATIVE}"
+PACKAGECONFIG[va] =3D "-Dgallium-va=3Denabled,-Dgallium-va=3Ddisabled,libv=
a-initial"
+PACKAGECONFIG[vdpau] =3D "-Dgallium-vdpau=3Denabled,-Dgallium-vdpau=3Ddisa=
bled,libvdpau"
+
+PACKAGECONFIG[perfetto] =3D "-Dperfetto=3Dtrue,-Dperfetto=3Dfalse,libperfe=
tto"
+
+PACKAGECONFIG[unwind] =3D "-Dlibunwind=3Denabled,-Dlibunwind=3Ddisabled,li=
bunwind"
+
+PACKAGECONFIG[lmsensors] =3D "-Dlmsensors=3Denabled,-Dlmsensors=3Ddisabled=
,lmsensors"
+
+VIDEO_CODECS ?=3D "${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'commerc=
ial', 'all', 'all_free', d)}"
+PACKAGECONFIG[video-codecs] =3D "-Dvideo-codecs=3D${VIDEO_CODECS}, -Dvideo=
-codecs=3D''"
+
+PACKAGECONFIG[teflon] =3D "-Dteflon=3Dtrue, -Dteflon=3Dfalse"
+
+# llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
+FULL_OPTIMIZATION:append =3D " -fno-omit-frame-pointer"
+
+CFLAGS:append:armv5 =3D " -DMISSING_64BIT_ATOMICS"
+CFLAGS:append:armv6 =3D " -DMISSING_64BIT_ATOMICS"
+
+# Remove the mesa dependency on mesa-dev, as mesa is empty
+DEV_PKG_DEPENDENCY =3D ""
+
+# Provide virtual names to allow selecting preferred rproviders
+RPROVIDES:mesa-vulkan-drivers +=3D "virtual-vulkan-icd"
+RPROVIDES:libopencl-mesa +=3D "virtual-opencl-icd"
+
+# GLES2 and GLES3 implementations are packaged in a single library in libg=
les2-mesa.
+# Add a dependency so the GLES3 dev package is associated with its impleme=
ntation.
+RPROVIDES:libgles2-mesa +=3D "libgles3-mesa"
+RPROVIDES:libgles2-mesa-dev +=3D "libgles3-mesa-dev"
+
+RDEPENDS:libopencl-mesa +=3D "${@bb.utils.contains('PACKAGECONFIG', 'openc=
l', 'libclc', '', d)}"
+
+PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
+             libgallium \
+             libgl-mesa libgl-mesa-dev \
+             libglx-mesa libglx-mesa-dev \
+             libglapi libglapi-dev \
+             libgbm libgbm-dev \
+             libgles1-mesa libgles1-mesa-dev \
+             libgles2-mesa libgles2-mesa-dev \
+             libopencl-mesa \
+             libteflon \
+             mesa-megadriver mesa-vulkan-drivers \
+             mesa-vdpau-drivers mesa-tools \
+            "
+
+# For the packages that make up the OpenGL interfaces, inject variables so=
 that
+# they don't get Debian-renamed (which would remove the -mesa suffix), and
+# RPROVIDEs/RCONFLICTs on the generic libgl name.
+python __anonymous() {
+    pkgconfig =3D (d.getVar('PACKAGECONFIG') or "").split()
+    mlprefix =3D d.getVar("MLPREFIX")
+    suffix =3D ""
+    if "-native" in d.getVar("PN"):
+        suffix =3D "-native"
+
+    for p in ("libegl", "libgl", "libglx", "libgles1", "libgles2", "libgle=
s3", "libopencl"):
+        fullp =3D mlprefix + p + "-mesa" + suffix
+        d.appendVar("RRECOMMENDS:" + fullp, " ${MLPREFIX}mesa-megadriver" =
+ suffix)
+
+    d.setVar("DEBIAN_NOAUTONAME:%slibopencl-mesa%s" % (mlprefix, suffix), =
"1")
+
+    if 'glvnd' in pkgconfig:
+        for p in ("libegl", "libglx"):
+            fullp =3D mlprefix + p + "-mesa" + suffix
+            d.appendVar("RPROVIDES:" + fullp, ' virtual-%s-icd' % p)
+    else:
+        for p in (("egl", "libegl", "libegl1"),
+                  ("opengl", "libgl", "libgl1"),
+                  ("gles", "libgles1", "libglesv1-cm1"),
+                  ("gles", "libgles2", "libglesv2-2", "libgles3")):
+            if not p[0] in pkgconfig:
+                continue
+            fullp =3D mlprefix + p[1] + "-mesa" + suffix
+            pkgs =3D " " + " ".join(mlprefix + x + suffix for x in p[1:])
+            d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
+            d.appendVar("RREPLACES:" + fullp, pkgs)
+            d.appendVar("RPROVIDES:" + fullp, pkgs)
+            d.appendVar("RCONFLICTS:" + fullp, pkgs)
+
+            # For -dev, the first element is both the Debian and original =
name
+            fullp =3D mlprefix + p[1] + "-mesa-dev" + suffix
+            pkgs =3D " " + mlprefix + p[1] + "-dev" + suffix
+            d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
+            d.appendVar("RREPLACES:" + fullp, pkgs)
+            d.appendVar("RPROVIDES:" + fullp, pkgs)
+            d.appendVar("RCONFLICTS:" + fullp, pkgs)
+}
+
+python mesa_populate_packages() {
+    pkgs =3D ['mesa', 'mesa-dev', 'mesa-dbg']
+    for pkg in pkgs:
+        d.setVar("RPROVIDES:%s" % pkg, pkg.replace("mesa", "mesa-dri", 1))
+        d.setVar("RCONFLICTS:%s" % pkg, pkg.replace("mesa", "mesa-dri", 1)=
)
+        d.setVar("RREPLACES:%s" % pkg, pkg.replace("mesa", "mesa-dri", 1))
+
+    import re
+    dri_drivers_root =3D oe.path.join(d.getVar('PKGD'), d.getVar('libdir')=
, "dri")
+    if os.path.isdir(dri_drivers_root):
+        dri_pkgs =3D sorted(os.listdir(dri_drivers_root))
+        lib_name =3D d.expand("${MLPREFIX}mesa-megadriver")
+        for p in dri_pkgs:
+            m =3D re.match(r'^(.*)_dri\.so$', p)
+            if m:
+                pkg_name =3D " ${MLPREFIX}mesa-driver-%s" % legitimize_pac=
kage_name(m.group(1))
+                d.appendVar("RPROVIDES:%s" % lib_name, pkg_name)
+                d.appendVar("RCONFLICTS:%s" % lib_name, pkg_name)
+                d.appendVar("RREPLACES:%s" % lib_name, pkg_name)
+}
+
+PACKAGESPLITFUNCS =3D+ "mesa_populate_packages"
+
+PACKAGES_DYNAMIC +=3D "^mesa-driver-.*"
+PACKAGES_DYNAMIC:class-native =3D "^mesa-driver-.*-native"
+
+FILES:mesa-megadriver =3D "${libdir}/dri/* ${datadir}/drirc.d"
+FILES:mesa-vulkan-drivers =3D "${libdir}/libvulkan_*.so ${libdir}/libpower=
vr_rogue.so ${datadir}/vulkan"
+FILES:${PN}-vdpau-drivers =3D "${libdir}/vdpau/*.so.*"
+FILES:libegl-mesa =3D "${libdir}/libEGL*.so.* ${datadir}/glvnd/egl_vendor.=
d"
+FILES:libgbm =3D "${libdir}/libgbm.so.* ${libdir}/gbm/*_gbm.so"
+FILES:libgallium =3D "${libdir}/libgallium-*.so"
+FILES:libgles1-mesa =3D "${libdir}/libGLESv1*.so.*"
+FILES:libgles2-mesa =3D "${libdir}/libGLESv2.so.*"
+FILES:libgl-mesa =3D "${libdir}/libGL.so.*"
+FILES:libglx-mesa =3D "${libdir}/libGLX*.so.*"
+FILES:libopencl-mesa =3D "${libdir}/lib*OpenCL.so* ${sysconfdir}/OpenCL/ve=
ndors/*.icd"
+FILES:libglapi =3D "${libdir}/libglapi.so.*"
+
+FILES:${PN}-dev =3D "${libdir}/pkgconfig/dri.pc ${includedir}/GL/internal/=
dri_interface.h ${includedir}/vulkan ${libdir}/vdpau/*.so"
+FILES:libegl-mesa-dev =3D "${libdir}/libEGL*.* ${includedir}/EGL ${include=
dir}/KHR ${libdir}/pkgconfig/egl.pc"
+FILES:libgbm-dev =3D "${libdir}/libgbm.* ${libdir}/pkgconfig/gbm.pc ${incl=
udedir}/gbm.h ${includedir}/gbm_backend_abi.h"
+FILES:libgl-mesa-dev =3D "${libdir}/libGL.* ${includedir}/GL/*.h ${libdir}=
/pkgconfig/gl.pc ${libdir}/pkgconfig/glx.pc"
+FILES:libglapi-dev =3D "${libdir}/libglapi.*"
+FILES:libgles1-mesa-dev =3D "${libdir}/libGLESv1*.* ${includedir}/GLES ${l=
ibdir}/pkgconfig/glesv1*.pc"
+FILES:libgles2-mesa-dev =3D "${libdir}/libGLESv2.* ${includedir}/GLES2 ${i=
ncludedir}/GLES3 ${libdir}/pkgconfig/glesv2.pc"
+FILES:libteflon =3D "${libdir}/libteflon.so"
+# catch all to get all the tools and data
+FILES:${PN}-tools =3D "${bindir} ${datadir}"
+ALLOW_EMPTY:${PN}-tools =3D "1"
+
+# All DRI drivers are symlinks to libdril_dri.so
+INSANE_SKIP:${PN}-megadriver +=3D "dev-so"
+
+# OpenCL ICDs package also ship correspondig .so files, there is no -dev p=
ackage
+INSANE_SKIP:libopencl-mesa +=3D "dev-so"
+
+# Fix upgrade path from mesa to mesa-megadriver
+RREPLACES:mesa-megadriver =3D "mesa"
+RCONFLICTS:mesa-megadriver =3D "mesa"
+RPROVIDES:mesa-megadriver =3D "mesa"
+
+# As of May 2025 it is known that LTO breaks Mesa, for example:
+# https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/34318
+LTO =3D ""
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb b/meta-ti=
-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
index 8ec06800..3e81eef6 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
@@ -2,10 +2,12 @@
 # upstream yet. This allows us to build the shims we need without complete=
ly
 # clobbering mesa.
=20
-require recipes-graphics/mesa/mesa-pvr.inc
+require recipes-graphics/mesa/mesa-pvr-24.inc
=20
 SUMMARY +=3D " (with PowerVR for TI parts)"
=20
+COMPATIBLE_MACHINE =3D "ti33x|ti43x|am57xx|am65xx"
+
 LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D63779ec98d78d823a9dc53=
3a0735ef10"
=20
 BRANCH =3D "powervr/${PV}"
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb b/meta-ti=
-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb
new file mode 100644
index 00000000..49925e60
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb
@@ -0,0 +1,60 @@
+# PowerVR Graphics require several patches that have not made their way
+# upstream yet. This allows us to build the shims we need without complete=
ly
+# clobbering mesa.
+
+require recipes-graphics/mesa/mesa-pvr-25.inc
+
+SUMMARY +=3D " (with PowerVR for TI parts)"
+
+COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|j742s2|am62xx|am62pxx|j722s"
+
+LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3Dffe678546d4337b732cfd1=
2262e6af11"
+
+BRANCH =3D "powervr/${PV}"
+
+SRC_URI =3D "git://github.com/TexasInstruments/mesa.git;protocol=3Dhttps;b=
ranch=3D${BRANCH} \
+           file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch"
+
+SRCREV =3D "ffdef450e1f954af21768371506e013c19f5fe49"
+PV =3D "25.2.8"
+PR =3D "r1"
+
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+
+GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PREFERRED_PROVIDER_virtua=
l/gpudriver', 'ti-img-rogue-driver', ',pvr', '', d)}"
+GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PREFERRED_PROVIDER_virtua=
l/gpudriver', 'ti-sgx-ddk-km', ',sgx', '', d)}"
+
+VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PREFERRED_PROVIDER_virtua=
l/gpudriver', 'ti-img-rogue-driver', ',pvr', '', d)}"
+
+PACKAGECONFIG =3D " \
+        gallium \
+        video-codecs \
+        ${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan wayland glvnd', =
d)} \
+        ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles=
 gbm virgl', '', d)} \
+        ${@bb.utils.contains('DISTRO_FEATURES', 'opencl', 'opencl libclc g=
allium-llvm', '', d)} \
+        ${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'zink', '', d)} =
\
+        xmlconfig \
+"
+
+GLPROVIDES =3D " \
+    ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '', d=
)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'gles', 'virtual/libgles1 virtua=
l/libgles2 virtual/libgles3', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'virtual/egl', '', d)} \
+"
+PROVIDES =3D " \
+    ${@bb.utils.contains('PACKAGECONFIG', 'glvnd', '', d.getVar('GLPROVIDE=
S'), d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'virtual/libgbm', '', d)}=
 \
+    virtual/mesa \
+"
+
+BBCLASSEXTEND =3D "native nativesdk"
+
+do_install:append () {
+    # remove pvr custom pkgconfig
+    rm -rf ${D}${datadir}/pkgconfig
+}
+
+FILES:${PN}-dev +=3D "${datadir}/mesa/wayland-drm.xml"
+FILES:mesa-vulkan-drivers +=3D "${libdir}/libpvr_mesa_wsi.so"
+
+RRECOMMENDS:mesa-megadriver:append:class-target =3D " ${@d.getVar('PREFERR=
ED_PROVIDER_virtual/gpudriver')}"
--=20
2.34.1


