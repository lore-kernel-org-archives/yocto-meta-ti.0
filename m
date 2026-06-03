Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42058CD6E60
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 15:49:01 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23731.1780501733483689005
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 08:48:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=W/rdUFlw;
 spf=pass (domain: ti.com, ip: 40.107.208.68, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fcpe9GoeyiMMfKbXgAZw005Z8GPyjLZ7aVkaDHpGNeRjBMdkpSmmKe25huurzh9t2stc2GneC1Qh+S0cq6/M9AHrQjTAUeAHLY66gjeK807f2Xe8eyCVnA2Tt4D48obZEBgK2KWQTPhH4JB8pYLnewch4R/I4H93gDa3MjIgJDNC46eNS/OPZhGoWL/mJ8Sj88OmxYMS6IwqwqgnrrO6oRA1nIDe62eYfHJImU14UIc9S+NpYr+/zKVZOeKcKWGCU2yBjhEF++O+Hh02lmRiDJsWjLB4cdLdy5mOSjzlcyLwQDegCchNW+7pgoOQN1CKUn5+lXL95DBP3Ini0KowhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y1J28R7grLi6rGSmSLaluGCVMhtYAnBuFkwkXTnMaNA=;
 b=JhafRaTyAq0XqwDQxTXnIawtU8Y5RxFiAqJdMzVrzR4kT/upSnr+Jpht7dQO5brZQnnSEDSH0DGAEMex3mtWG1xTEC6tAD2E6TQ2ixpLem5DbwaaKHTyHtQptjg0WVbAh7HuBqa8r2pfC3pBL1paMLNJ2XSyxkhqN6/PKh3XdGyYh/wkPqjg/PfO80wS0PJfufpmWPlOYpE3FJXQEywKZ7iY6ras4Lt+ufXU2Cro6H1wWcWTG8+ZaJdGkM3KXHjSGNg3rhjElNhDkPrvcUNX3ygQ7r4Mp/wFrK2w4hJpKDB0iIwdmb0WFumjSYaCjuP/lV63qwxCiN/F/dph4ax2cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y1J28R7grLi6rGSmSLaluGCVMhtYAnBuFkwkXTnMaNA=;
 b=W/rdUFlwn/Bik11Fmf3FIrdCuicw0F5879UO51sF5DRoEnhRyvxWDGAANZnZlf4bfJIXZjVzL9Zuwv0rk69JwPqrdux844fCPfDhgbkmPxa5oidme0ZvbX+oIaTqxjgqbYnw84Zhwm3qMGgyRCW+9byiJ/g8tUspU3jUHuOb0k8=
Received: from BL1P221CA0033.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:5b5::14)
 by SJ1PR10MB5906.namprd10.prod.outlook.com (2603:10b6:a03:48b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Wed, 3 Jun 2026
 15:48:47 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:208:5b5:cafe::7b) by BL1P221CA0033.outlook.office365.com
 (2603:10b6:208:5b5::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 15:48:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB51.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Wed, 3 Jun 2026 15:48:46 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 10:48:17 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 10:48:17 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 3 Jun 2026 10:48:17 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.216])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 653FmGto1510286;
	Wed, 3 Jun 2026 10:48:16 -0500
From: <a-christidis@ti.com>
To: <denys@konsulko.com>, <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/wrynose][PATCH v2] ti-img-rogue-*: Migrate GPU driver version
Date: Wed, 3 Jun 2026 10:48:16 -0500
Message-ID: <20260603154816.3066421-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|SJ1PR10MB5906:EE_
X-MS-Office365-Filtering-Correlation-Id: 20a56cb8-338d-4d60-78d2-08dec18798de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|3023799007|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	pEIF6fubzZoLDh4xYqtDC46167fEjktSZRW49f0hbk44XEgHreVBmP0BGVzeKoLc0gfaeLxb392efi5MzdBq9w5hDt00gZKWBxEmrcMSgrCKbjjMVXJGXdRPjCs1ZmCWaofQYctaumcnT/B7v+4J0W05d/IqEteILRVBiSgVBbtmPZGnsY5jK83KPURQutMgpwSLRhSJcV37FG8LF0jnoMJtHcv5gYy329SikOGCXgIZoEZckoBwqYoWBPuBGI0MaiDIwbBBZ74qL8GL+Veg/DYvbetB4u2EMwin8qnZeSB/QP6o4vd5Y3nCosTUnquMPuI2kK0yE89Fq6xyYg+NhSv04pFcdHXbwWhqXb9OaUiyZHbE48Fy0piW+NU8N7TVLyy6Hb52+L++ukymK//GjLEqPLAlhECTv03Kn/tT4crr/J7UCKhol9nylhtvxdBW4P0SB+74ILea+qEo/SataeB1WHinHvDJdC+J34kpXl0Jd/ozQy87BUYS9ft5uePvS+/jHLYiOdx+FVIubrWZOiFGapkQOf7lsb/lEmgxqD/OtapxVS7PH6XfBPrEccefStfiNl0jddLmuE6Abtj1Utpsvu/L6kDzAB+3oZvxRV2+JRFzpOnENrKln7lVZj3jSyx0tJXFRoVUdXE2U9QmksifJR+AKkEZ0hK75axlQUpC6DsdMaTFuHM0XgF1736w+FMq8BTLDN4MZeQ7RCNikB0h6I27GLlfUe2vrkUAl+4=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(3023799007)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0vvBxQzDVwfjGBvYc6DGQJKUMbW1Jv1NWR+UJ7yoG62D+TZl9wKH8gOASFS3IKfCRsFhVVEgafMj40pD70kWwQ48pXmhD//cbMTJHPm2EIAvxnb95s3+2/vKKx5kk0NcMhH3CtSOeOP0hXakFHYcteH/Ve/zSo62WLYLu6tb8UHlNdJlQwoMzIE5tp+MzOzaKMFf6PBlnHQbdQFU1wRjosRjNryhv8K8neaQZlTujl3qkp/XyurUAuxG51zWfYjafwICfNgb8f9qqnv55WYbQW2HOIkUmOQUg4piGrG5bO8D4DoXZWOJtS3eXFc6DKsK21nWwsD/I+z+wRIi16E4nTZe3602Dj5Xg4tKSXStC+JrEB9p/uaoIjrGiaVOGIcEIbAAEvs8xU/hqbEg5l0wJyH022ne2t+/FtVmgE2P9A+i92gzPmEMB7u9NK08yhfN
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 15:48:46.1389
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20a56cb8-338d-4d60-78d2-08dec18798de
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB5906
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 03 Jun 2026 15:49:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19964

From: Antonios Christidis <a-christidis@ti.com>

New recipes for GPU DDK 26.1. Update BSP configuration files with new
preferred recipe versions.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
v2:=20
- No need to delete the old 25.3 DDK recipes as that would break
  compatibility with previous LTS kernels (6.6, 6.12).

 meta-ti-bsp/conf/machine/include/ti-bsp.inc   |   2 +-
 .../ti-img-rogue-driver_26.1.6967606.bb       |  44 +++++
 .../ti-img-rogue-umlibs_26.1.6967606.bb       | 152 ++++++++++++++++++
 3 files changed, 197 insertions(+), 1 deletion(-)
 create mode 100644 meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-dr=
iver_26.1.6967606.bb
 create mode 100644 meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogu=
e-umlibs_26.1.6967606.bb

diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf=
/machine/include/ti-bsp.inc
index f7e2710c..a48c4f07 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -43,7 +43,7 @@ BSP_BOOTLOADER_PROVIDER:bsp-ti-6_18 =3D "u-boot-ti-stagin=
g"
 BSP_BOOTLOADER_VERSION:bsp-ti-6_18 =3D "2026.01%"
=20
 BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_18 =3D "ti-img-rogue-driver"
-BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_18 =3D "25%"
+BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_18 =3D "26%"
 BSP_MESA_PVR_VERSION:bsp-ti-6_18 =3D "24%"
=20
 # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_26=
.1.6967606.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver=
_26.1.6967606.bb
new file mode 100644
index 00000000..876c3e50
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_26.1.6967=
606.bb
@@ -0,0 +1,44 @@
+SUMMARY =3D  "Kernel drivers for the PowerVR Rogue GPU found in the TI SoC=
s"
+HOMEPAGE =3D "http://git.ti.com/graphics/ti-img-rogue-driver"
+LICENSE =3D "MIT | GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://README;beginline=3D14;endline=3D19;md5=3D0403=
c7dea01a2b8232261e805325fac2"
+
+inherit module
+
+PROVIDES =3D "virtual/gpudriver"
+
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+
+COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|j742s2|am62xx|am62pxx|j722s"
+
+DEPENDS =3D "virtual/kernel"
+
+BRANCH =3D "linuxws/wrynose/k6.18/${PV}"
+
+SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protoco=
l=3Dhttps;branch=3D${BRANCH}"
+
+SRCREV =3D "50e14e425cbac240b2da93fac0cfcc987a4959c3"
+
+
+TARGET_PRODUCT:j721e =3D "j721e_linux"
+TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
+TARGET_PRODUCT:j784s4 =3D "j784s4_linux"
+TARGET_PRODUCT:j742s2 =3D "j784s4_linux"
+TARGET_PRODUCT:am62xx =3D "am62_linux"
+TARGET_PRODUCT:am62pxx =3D "am62p_linux"
+TARGET_PRODUCT:j722s =3D "j722s_linux"
+PVR_BUILD =3D "release"
+PVR_WS =3D "lws-generic"
+
+EXTRA_OEMAKE +=3D 'KERNELDIR=3D"${KBUILD_OUTPUT}" BUILD=3D${PVR_BUILD} PVR=
_BUILD_DIR=3D${TARGET_PRODUCT} WINDOW_SYSTEM=3D${PVR_WS}'
+
+do_compile(){
+    unset CC
+    oe_runmake
+}
+
+do_install() {
+    make -C ${STAGING_KERNEL_DIR} M=3D${B}/binary_${TARGET_PRODUCT}_${PVR_=
WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=3D${D}${root_prefix=
} PREFIX=3D${STAGING_DIR_HOST} modules_install
+}
+
+RRECOMMENDS:${PN} +=3D "ti-img-rogue-umlibs"
diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlib=
s_26.1.6967606.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogu=
e-umlibs_26.1.6967606.bb
new file mode 100644
index 00000000..ff631c2d
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_26.1.=
6967606.bb
@@ -0,0 +1,152 @@
+SUMMARY =3D "Userspace libraries for PowerVR Rogue GPU on TI SoCs"
+HOMEPAGE =3D "http://git.ti.com/graphics/ti-img-rogue-umlibs"
+LICENSE =3D "TI-TFL"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7232b98c1c58f99e3baa03de5207e76=
f"
+
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|j742s2|am62xx|am62pxx|j722s"
+
+BRANCH =3D "linuxws/wrynose/k6.18/${PV}"
+SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protoco=
l=3Dhttps;branch=3D${BRANCH}"
+SRCREV =3D "a59e0e6b92dfee7aad046b839cf6ae644355b89d"
+
+TARGET_PRODUCT:j721e =3D "j721e_linux"
+TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
+TARGET_PRODUCT:j784s4 =3D "j784s4_linux"
+TARGET_PRODUCT:j742s2 =3D "j784s4_linux"
+TARGET_PRODUCT:am62xx =3D "am62_linux"
+TARGET_PRODUCT:am62pxx =3D "am62p_linux"
+TARGET_PRODUCT:j722s =3D "j722s_linux"
+PVR_BUILD =3D "release"
+PVR_WS =3D "lws-generic"
+
+RDEPENDS:${PN} =3D " \
+    libdrm \
+    ti-img-rogue-driver \
+    ${PN}-firmware \
+"
+
+PACKAGECONFIG ?=3D " \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'vulkan wayland', 'vulkan', ''=
, d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'opengl opencl', d)} \
+"
+
+PACKAGECONFIG[opengl] =3D ",,,,${GLES_PACKAGES}"
+PACKAGECONFIG[vulkan] =3D ",,,,${VULKAN_PACKAGES}"
+PACKAGECONFIG[opencl] =3D ",,,,${OPENCL_PACKAGES}"
+
+def get_file_list(package_list_var, d):
+    file_list =3D []
+    package_list =3D d.getVar(package_list_var)
+    prefix =3D f"{d.getVar('D')}/"
+    if package_list:
+        for package in package_list.split():
+            package_file_string =3D d.getVar(f"FILES:{package}")
+            if package_file_string:
+                for package_file in package_file_string.split():
+                    file_list.append(f"{prefix}{package_file}")
+    return " ".join(file_list)
+
+EXTRA_OEMAKE +=3D 'BUILD=3D${PVR_BUILD} TARGET_PRODUCT=3D${TARGET_PRODUCT}=
 WINDOW_SYSTEM=3D${PVR_WS}'
+
+do_configure[noexec] =3D "1"
+do_compile[noexec] =3D "1"
+do_install() {
+    oe_runmake 'DESTDIR=3D${D}' install
+    if ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'false', 'true', d)=
}; then
+        for file in ${@get_file_list('GLES_PACKAGES',  d)}; do
+            rm -rf ${file}
+        done
+    fi
+    if ${@bb.utils.contains('PACKAGECONFIG', 'vulkan', 'false', 'true', d)=
}; then
+        for file in ${@get_file_list('VULKAN_PACKAGES', d)}; do
+            rm -rf ${file}
+        done
+    fi
+    if ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'false', 'true', d)=
}; then
+        for file in ${@get_file_list('OPENCL_PACKAGES', d)}; do
+            rm -rf ${file}
+        done
+    fi
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'true', 'false'=
, d)}; then
+        if [ -e ${D}/lib/firmware ]; then
+            mv ${D}/lib/firmware ${D}${nonarch_base_libdir}
+        fi
+    fi
+
+    # clean up any empty directories
+    find "${D}" -empty -type d -delete
+
+    # fix permissions
+    chown -R root:root "${D}"
+}
+
+GLES_PACKAGES =3D "libgles1-rogue libgles2-rogue libgles3-rogue"
+VULKAN_PACKAGES =3D "libvk-rogue"
+OPENCL_PACKAGES =3D "libopencl-rogue libopencl-rogue-tools"
+
+PACKAGES =3D " \
+    ${@bb.utils.contains('PACKAGECONFIG', 'opengl', d.getVar('GLES_PACKAGE=
S'), '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'vulkan', d.getVar('VULKAN_PACKA=
GES'), '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'opencl', d.getVar('OPENCL_PACKA=
GES'), '', d)} \
+    ${PN}-tools \
+    ${PN}-firmware \
+    ${PN} \
+"
+
+# Inject variables so that packages don't get Debian-renamed (which would
+# remove the -rogue suffix), but don't RPROVIDEs/RCONFLICTs on the generic
+# libgl name to prevent colliding with swrast libs
+python __anonymous() {
+    suffix =3D ""
+    if "-native" in d.getVar("PN"):
+        suffix =3D "-native"
+    for p in (("vulkan", "libvk",),
+              ("gles", "libgles1", "libglesv1-cm1"),
+              ("gles", "libgles2", "libglesv2-2"),
+              ("gles", "libgles3",),
+              ("opencl", "libopencl",)):
+        mlprefix =3D d.getVar("MLPREFIX")
+        fullp =3D mlprefix + p[1] + "-rogue" + suffix
+        mlprefix =3D d.getVar("MLPREFIX")
+        pkgs =3D " " + " ".join(mlprefix + x + suffix for x in p[1:])
+        d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
+        d.setVar("INSANE_SKIP:" + fullp, "dev-so ldflags")
+        d.appendVar("RRECOMMENDS:" + fullp, " ${MLPREFIX}ti-img-rogue-umli=
bs" + suffix)
+}
+
+# gles specific shared objects
+FILES:libgles1-rogue =3D "${libdir}/libGLESv1*.so*"
+FILES:libgles2-rogue =3D "${libdir}/libGLESv2*.so*"
+RDEPENDS:libgles1-rogue +=3D "mesa-megadriver"
+RDEPENDS:libgles2-rogue +=3D "mesa-megadriver"
+
+# vulkan specific shared objects and configs
+FILES:libvk-rogue =3D "${libdir}/libVK_IMG.so* ${datadir}/vulkan"
+RDEPENDS:libvk-rogue +=3D "vulkan-loader wayland libdrm"
+
+# opencl specific shared objects and configs
+FILES:libopencl-rogue =3D "${libdir}/libPVROCL.so* ${sysconfdir}/OpenCL"
+RDEPENDS:libopencl-rogue +=3D "opencl-icd-loader"
+RRECOMMENDS:libopencl-rogue +=3D "libopencl-rogue-tools"
+FILES:libopencl-rogue-tools +=3D "${bindir}/ocl*"
+DEBIAN_NOAUTONAME:libopencl-rogue-tools =3D "1"
+INSANE_SKIP:libopencl-rogue-tools =3D "ldflags"
+
+# optional tools and tests
+FILES:${PN}-tools =3D "${bindir}/"
+RDEPENDS:${PN}-tools =3D "python3-core libdrm ${PN}"
+INSANE_SKIP:${PN}-tools =3D "ldflags"
+
+# required firmware
+FILES:${PN}-firmware =3D "${base_libdir}/firmware/*"
+INSANE_SKIP:${PN}-firmware +=3D "arch"
+
+# common libraries
+FILES:${PN} =3D "${libdir}"
+
+RRECOMMENDS:${PN} +=3D " \
+    ${PN}-tools \
+"
+
+INSANE_SKIP:${PN} +=3D "already-stripped dev-so ldflags"
--=20
2.34.1


