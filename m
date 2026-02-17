Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A971E9A030
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 18:04:08 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.61])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18592.1771351441687874045
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Feb 2026 10:04:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=h4kwaDPM;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.61, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f6juFnETmc7kdFGYQkY2cEbPeStt/SzzjVoHq1g6q/oVi8mFTjiBhVQ8NJaKK2Wf6X4r3t5PjRxcXVHSZCPIzyHoH0ljVTFoAj3kJuhdk3cHRgSJMT0O9uLmCx1IDQK4ek7j77COpXet96jdvmfe+gnc2kEFnhkbvX++Uq4Rzkl1UzCFgfO1kaSxnL6ZKf4dIeK+XjLzRARTuMMpQGqQoBEdF0oDVH3e48WfCAdseVy1kHOKIQeA03tksAKUZOhQX0JUZpAbDAMf/f+10m577qEoJarApnfFUlfeWcCVfuTrIcL0oB/wlp/vJXFqGCdWN4H6z2xpYaEU2ojivE9ZCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u7fAMZhUMU/TFBWcOug42IyJUMZtrcNPBXwXmWsY/T0=;
 b=KGKuf87SUe9+AoVbjVoDnNcEmFgo/mf9jOJ+j32wd99Y8nR8VD9u1rvnc0EKhG9zPxyYA/5q155ASymPTYACbwmaK1vzIsRyatxkyo2aQ2mFop/f2B6vLxp/W03APfCE0zssDrpH+BMofzN9imkhBlNoMyF0X7idXuHPYb973FJNM+3Xfjw4sstvlJlcA3oq2G6XOxg0jYcpZHIEwuhN5MFXTc2xHJ5ERp4iNzz14ZYafQHPzK/TrTq2S0H43zRntA6qn7RGnSmyguD200ISXCk/SkriU/8zFRx0JrgoNvHh2waHJkbNjTbc9y/FCOEkrGEbD865W3SXQnpRMc6ctg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u7fAMZhUMU/TFBWcOug42IyJUMZtrcNPBXwXmWsY/T0=;
 b=h4kwaDPMxJEocyVEztDvWFwNMxAQqNlBQsGT1VX38NCmmyqVMl2qcBzXyKS43MKiUhwvq+3/e455SisY5Zv8+elq9r8R2WVvGd6m6h6wIy8eaWcE0j7TQ3KueeLHE1lLImuTZ4JpyMR3UZ7JQBeugkm0boK1Qa3ro8k+GIk46L4=
Received: from DS7P220CA0034.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:223::32) by
 DM3PPF5CC7476E1.namprd10.prod.outlook.com (2603:10b6:f:fc00::c2a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Tue, 17 Feb
 2026 18:03:56 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:8:223:cafe::6c) by DS7P220CA0034.outlook.office365.com
 (2603:10b6:8:223::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 18:03:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 18:03:54 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 12:03:43 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 12:03:43 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Feb 2026 12:03:43 -0600
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61HI3hmX3273142;
	Tue, 17 Feb 2026 12:03:43 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master][PATCH 2/3] ipumm-fw: Use prebuilt firmware from ti-linux-firmware repo
Date: Tue, 17 Feb 2026 12:03:38 -0600
Message-ID: <20260217180339.128793-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260217180339.128793-1-afd@ti.com>
References: <20260217180339.128793-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|DM3PPF5CC7476E1:EE_
X-MS-Office365-Filtering-Correlation-Id: 81026656-13fd-4f12-5075-08de6e4eea3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GiDVLtZ40sXiduZPbE6cxt2Q437zuKX9wkISTJxVTC3Qw4Le5wiguN+QHJ1u?=
 =?us-ascii?Q?F/V6qGQT6TktM8/pMdHz2lp9oB3iiYTau4JeFX89XWrnJWDHv2hlO/eJalFr?=
 =?us-ascii?Q?Y+dwBGULl5/xmuXL3va3jOQZkoq1ux0ZwmTK4ZP5btaeq/Xwiny2V4FStFuE?=
 =?us-ascii?Q?ExgLS6sx0I8w2cHiMSFlAg7nsdeZlLmeYZDYceNCYZmkK9cqgbjdm7KgU9AL?=
 =?us-ascii?Q?cf/PCoKxLgBH4p35XU2u4GTY2vMY4RMQzwp+V2zsWmbgLDU6euUOpIuWayFF?=
 =?us-ascii?Q?ImwU+GlI2Hol0OLSAwdn7D1xS2jeOqD7VUFBwVVP0RrioC5oM5wYBBWnrA1C?=
 =?us-ascii?Q?KSWHbMvJhw6a7OSBUdCNbWRBkleEE+QbQIEILGBpm7RJ49juBMYpWI6t7QVE?=
 =?us-ascii?Q?yYfZj2QRBRD7j6ZZiPhO0rhinJLoUGrrSaXA/+si3jBoI72H2M7lNXQuImAx?=
 =?us-ascii?Q?PeGbhzVATsBmznimE7gDRvG1TvNyTzn5MZVZv5NUDkF+PWjoAgX5Kjywp3BM?=
 =?us-ascii?Q?E2cFGL/WbYvgZiy/9Kqwrp00ZDsSfIktXJNQFyHODs4U+/kv+03m/+56zgDc?=
 =?us-ascii?Q?RkxZqIUFaCwlj3AeQnOXfXa7F7KBICaLwLViLjnx0y69kHQcqTUYKcVhnzxV?=
 =?us-ascii?Q?zJYTE/QG/3iklp4AUOTGh2FHc89PpPThqYK08sSN4QUvfkf3CO/rrdcksjfx?=
 =?us-ascii?Q?+vgsndiyT6awdMsDHAaagodssb8EwO+x59q0ghoZSDJ076oxYIeUh8a3R4wT?=
 =?us-ascii?Q?YeWKhG+8iZJmxoq8XD9FWzBg++gsauOZDxAWySbXVEL3Iy/5b4G5skU7Exin?=
 =?us-ascii?Q?32aCXROq1uShAxQMf2vBxm3mxrqgbxZCgIKHGgYRWS5FKzfiRZqs6ZsFQtKD?=
 =?us-ascii?Q?D4R7dEX32Qr4SwuvOE2Z3mQqS8mZMruIZui1q2P5ykoT1eC89RQbC3qM+Bv+?=
 =?us-ascii?Q?SsTLQpnwWHrp/xYrvEbqTtynBDqkMafEZF4sZOYO7jf6tUeQc+pPzSEv7L8c?=
 =?us-ascii?Q?dHuBp63DkpsY9pdnfqhuijMa/NjMMitYpx4tkh2rB5t5E0UMqPQGYEP6c4eh?=
 =?us-ascii?Q?TWRYiuGZOiNauOgetLhBjMp3T1Tm0YWF2ixfPs1HPegkn685bYK3t3/safs2?=
 =?us-ascii?Q?5olSNx0K8SBDQ5N2EQy1TXf7Tb+57ud0cVp+NMy1tfznmYFx7hqkRuk16pve?=
 =?us-ascii?Q?6dgWZhNx0kogMy22OzsAyiu5ZCwTUMCVd5ekACklte3qdIHYLkfbbvwmpNZw?=
 =?us-ascii?Q?acW6CRbhR4xRcIXyeKUldw0qT0zJmJqG1yi0n/48JkWP5l7vxCO0IifMzB6p?=
 =?us-ascii?Q?GNUB7A164WBP53iWc02TOVa7dEyTCfCj+gpuz+fzav84C7cB+7nGfvViYOL8?=
 =?us-ascii?Q?XafKi9gIeRhwJ+ulagYAM+xNcw6xsIOoJWPlsd3dh8NsT8+Nm74XiQ35sX9K?=
 =?us-ascii?Q?FHYixhaIPaBnPOeuXC+VOcviELvjOUqBogtGJyy5t5xbQLi+AbXSxYZ7lFNY?=
 =?us-ascii?Q?JtBfqJ0V7SstVmViosnX+vA+sT/ralF6DIuLEhEHY3bIBFFiOkAik4j1KL1S?=
 =?us-ascii?Q?+i+K8R+HxPK0e1stpNkPrGV8cnjZFOOMgh2V8yPCOhQRjPPrzFcGhpm7uZ5G?=
 =?us-ascii?Q?XlKQCn1ZONWoBb85Q7BIoCnXagTiVX3W4EDPvYP5S7r5Zowdu1tpZ08ee0tp?=
 =?us-ascii?Q?XGKIiw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	uNxdLhefWCDsotlmbk5F5ggC0cG4atEXhOnALVXC1qSjxi4rLVwAstYLw0UgF7oRz6qxXj98p6Yu3tWvFOAiPnmeGxqbSFOChZptNTB7KNMeNURFIqYdvu6G2Ld9UeRxDgCgKIUsIFz5sziMoUKQIdsdOoH4ZqanWFyShmlzK6RYgHXUcQelPRVf9g6DFtHl7Qki7/cmgUdqXTuCTN0Rffj6DfjQjiWLdkeh0n5p03Qzzh5bVItgUVptrdkAMmIEYC9+Rz+2WlPZJCmxrX34zNQqPQH9asDptX3s14c5WXEZU9bLJb5zF07uXwftWe/virO9LVunkOlaLl7eBsOjLr34/1Ef51UkMwskVpNoDjX2Jq21uM7YwOAe+nZotYM+N02DYLpfYnBfbv8HW6mMLzqRiJaROsmThuCStnFrqvHefB1TeRUNYokvB02zj5tx
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 18:03:54.8651
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81026656-13fd-4f12-5075-08de6e4eea3e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF5CC7476E1
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Feb 2026 18:04:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19533

Use a prebuilt version of this firmware from ti-linux-firmware. This
removes the need to build this locally.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-bsp/ipumm-fw/ipumm-fw_git.bb      | 55 ++-----------------
 1 file changed, 6 insertions(+), 49 deletions(-)

diff --git a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/meta-ti-=
extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
index 246255e3..c1fac30d 100644
--- a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
+++ b/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "Firmware for IPU to suppor Accelerated MM decode and encode"
 LICENSE =3D "TI-TSPA"
=20
-LIC_FILES_CHKSUM =3D "file://Texas_Instruments_ipumm_Manifest.pdf;md5=3D5c=
c572579f07af266ab57fc17d762c7f"
+LIC_FILES_CHKSUM =3D "file://${THISDIR}/../../licenses/TI-TFL;md5=3Da1b59c=
b7ba626b9dbbcbf00f3fbc438a"
=20
 COMPATIBLE_MACHINE =3D "am57xx"
=20
@@ -9,64 +9,21 @@ inherit features_check
=20
 REQUIRED_MACHINE_FEATURES =3D "mmip"
=20
-SRC_URI =3D "git://git.ti.com/git/ivimm/ipumm.git;protocol=3Dhttps;branch=
=3Dmaster"
-
-SRCREV =3D "df4c50aecc9aad7ab3eb1ca9ebacfe473fcad7c5"
+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
=20
 PV =3D "3.00.15.00"
-PR =3D "r7"
-
-require recipes-ti/includes/ti-paths.inc
+PR =3D "r8"
=20
 inherit update-alternatives
=20
-DEPENDS =3D "ti-xdctools-native ti-sysbios ti-codec-engine ti-framework-co=
mponents ti-xdais ti-cgt-arm-native ti-ipc-rtos"
-
-export HWVERSION =3D "ES10"
-export BIOSTOOLSROOT =3D "${STAGING_DIR_TARGET}/usr/share/ti"
-
-export XDCVERSION =3D "ti-xdctools-tree"
-export BIOSVERSION =3D "ti-sysbios-tree"
-export IPCVERSION =3D "ti-ipc-tree"
-export CEVERSION =3D "ti-codec-engine-tree"
-export FCVERSION =3D "ti-framework-components-tree"
-export XDAISVERSION =3D "ti-xdais-tree"
-
-export TMS470CGTOOLPATH =3D "${M4_TOOLCHAIN_INSTALL_DIR}"
-export IPCSRC =3D "${STAGING_DIR_TARGET}/usr/share/ti/ti-ipc-tree"
-
-EXTRA_OEMAKE +=3D "XDCDIST_TREE=3D${STAGING_DIR_NATIVE}/usr/share/ti/${XDC=
VERSION}"
-
-do_configure() {
-    oe_runmake unconfig
-    oe_runmake vayu_smp_config
-}
-
-do_compile() {
-    oe_runmake
-}
-
 TARGET =3D "dra7-ipu2-fw.xem4"
-TARGET_MAP =3D "platform/ti/dce/baseimage/package/cfg/out/ipu/release/ipu.=
xem4.map"
=20
 do_install() {
-    install -d ${D}${nonarch_base_libdir}/firmware
-    install -m 0644 ${S}/${TARGET} ${D}${nonarch_base_libdir}/firmware/${T=
ARGET}.${BPN}
-    install -m 0644 ${S}/${TARGET_MAP} ${D}${nonarch_base_libdir}/firmware=
/${TARGET}.map
+    install -d ${D}${nonarch_base_libdir}/firmware/ti-ce-fw
+    install -m 0644 ${S}/ti-ce-fw/${TARGET} ${D}${nonarch_base_libdir}/fir=
mware/ti-ce-fw/${TARGET}
 }
=20
 ALTERNATIVE:${PN} =3D "dra7-ipu2-fw.xem4"
 ALTERNATIVE_LINK_NAME[dra7-ipu2-fw.xem4] =3D "${nonarch_base_libdir}/firmw=
are/${TARGET}"
-ALTERNATIVE_TARGET[dra7-ipu2-fw.xem4] =3D "${nonarch_base_libdir}/firmware=
/${TARGET}.${BPN}"
+ALTERNATIVE_TARGET[dra7-ipu2-fw.xem4] =3D "${nonarch_base_libdir}/firmware=
/ti-ce-fw/${TARGET}"
 ALTERNATIVE_PRIORITY =3D "20"
-
-FILES:${PN} +=3D "${nonarch_base_libdir}/firmware/*"
-
-# Disable the "buildpaths" check while we figure out how we are
-# going to address this issue.
-#
-# The ti-cgt-arm compiler is a custom TI compiler.  It does not
-# currently support reproducible builds and is provided via a
-# binary blob download that we cannot patch in the recipe to address
-# the issue.
-INSANE_SKIP:${PN} +=3D "buildpaths"
--=20
2.39.2


