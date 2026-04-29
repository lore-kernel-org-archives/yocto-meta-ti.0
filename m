Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F730CD13DE
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 16:44:47 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.60])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.830.1777481081388830476
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 09:44:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=OTAzEk/l;
 spf=pass (domain: ti.com, ip: 40.93.201.60, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lQE5JBBYGq46/nZMYJnpDOlt4pkM12vhh5ibXwleJQrfJV+0FaQQU3xMbCvNskNSU1oO7XrQQpZG21qzzK2Jzxz//1A2ZRG93zSbUZ+f1CTd1SHr2b1y/HNCooA0Kl4X7JiBhwyoVSJtF5gcQe7y6z1qI95NKnMRq5U2SJZR6EFmGYkRaKbJ7NBxpA/7dAYlzOlfxdH7liKLNiMLPI5YTu25QWEcBeyqj8B9A6s6S8RPSqghQY6lBw9JC9QRB54YCaDgbC5GF7WzM5qJwS7AwqrP04CmLW4akfgZOpIUmDiJmyyvsh8g9CzT2JqxlLHLtUjnf8QPXL4cD0bx/ZPxYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqRQ2hJqWeOJ6kiczivLGCFe32tACdXmOBTKbIBXa7Q=;
 b=UqM9mWfHqV+FmuK2VU2WOe20P0Ho+rsVQUQJDaTK+ebkD47eudjzmEEl0Pv9ZR+hAlWi1mbs7pzxrF8qocwiIKoSYylU5Q/w5nqR/l7C5pRlgwvNRi1OCiTRSW8e+TL1NciBiN8SdNDl+GjZ4sm1nEPd17y32R8OSQHtWeM364NBTof/Att9iJc8HmHA0zMibBerCffODYboWLs0U5DDc82skugCK63uGwN4NnHCsANDBDbP/MxKQeDvIhtwga0i6jr7jkzLRxUk4dt8HKD6AGfWz7ro+vgAY/BE4a8IhHWfAhNGyLd2Z3Q4Ga5hG42ZqN/vNwoYHC2sOicvjuKLgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqRQ2hJqWeOJ6kiczivLGCFe32tACdXmOBTKbIBXa7Q=;
 b=OTAzEk/lKrb3rF+15lECmSEj79FJjrwKCUHhkAhwCaj9xpNm6dj5a8RoWYH9kPl+coxtNDz0TSVtFZLn1tbmenx5Y56cDz94rf+2+BCKioPeqHhp/3mqjj6u/IkTqZQiJA3xVH96cJodRXWh82wqRBIHUmrsarOuRt3CNCe9WDo=
Received: from DS0PR17CA0024.namprd17.prod.outlook.com (2603:10b6:8:191::29)
 by DS0PR10MB8077.namprd10.prod.outlook.com (2603:10b6:8:1f9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.27; Wed, 29 Apr
 2026 16:44:37 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:8:191:cafe::f) by DS0PR17CA0024.outlook.office365.com
 (2603:10b6:8:191::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 16:44:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 16:44:33 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 11:44:32 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 11:44:32 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 11:44:32 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TGiWb33719610;
	Wed, 29 Apr 2026 11:44:32 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wI81Y-00000006oNX-2VP9;
	Wed, 29 Apr 2026 11:44:32 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v3 01/12] meta-ti-test: Create layout for new layer
Date: Wed, 29 Apr 2026 11:44:21 -0500
Message-ID: <20260429164432.1623594-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|DS0PR10MB8077:EE_
X-MS-Office365-Filtering-Correlation-Id: 50954272-5b47-4a1a-313c-08dea60e975f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	7LQBkA5iYkXLPcpuqaPBx5GtUG23UqSxYqSzXNYV566q1MiW4Wk1onFA4SgaGQ38njBm7+OsxARh+MuaCSyakKDpArhfyMaswi8dt1FOovduzTfR+OB6gbUMiua6Zp55Vm13IF68BMyhOdPotABbXKFCUvi1AS7Yaa+wGCp28C/Yeyk32MVZToxaPPWfBTVLFGDxf0dtrxH8w/CiMqgE55gRN9FllC6e/aAyoT2xBEgOyL7iM3x+aPz3/ISwNXNojlmBWMXIPenH/3P81VjCKCyBxVemDdZxZ2GCzEd6Y+krDOS13Z+1wnUgxfGBv+hTcmSXo+1MlWxkbVKSdO5m8ywXwHL1dboe8bnL8Q4JzwqRifRfWdm+cqSpEjGYiEZYyStegC+83VRpIcOojyrnBAj10aPDSGVRPYu3Irvmzz+Bjvsdtj7vh0DKGqd98idtsU23UVAIzlLq6mgGxWGiG5HUNiUrSqlzVeSjJEm3SMY9c3DzUmuw30IBeJ2KoKptflj70ZHuD3e3oPOaomithwXpy0+DBGl1MtAa4LtqCewBj/e0Eoo8KM8RIyK+4eAynmOiTIVAMZG6oDGG5JRbTMCg2EdAgXw2JFzA4OVaVMpAoc1Yjb3g0SyqFw+p9YQHA2C+4TvTyk6JGwpXeInmTupW5/bIeJPNvR7tNU3y5lLbbHX9Mh2u0XSLthI5fX/dwGdnUiGNf0z1TqLXtj29lg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ycLTfzuES+VJOpKHPVssuNTnGhvRt4T/lCaUV1tHpjHPxkJ3kWSUChKEcFjhwRPzItv95oTmkt2v2g1zcag4dk8Rf1v3NNohz6SZu7jN+xxEeam5hKFkh5RERtr50K8fcwPUsdCk0IAtbn2AKA5FYEuXRzTBJwdu5YU4Fmnx+wozmU1ltODiL6/HcQRUFEgJhXCeZpi/79I2sVLvfTQDU+cd65bnUm6pjQ+dS8NQ/jYy8dDetV8jvPwLivfyQeVWcvQEN5UgLUKQd4anaaEimw1IvnmYSVJ75yY9spCx9Adk02nGpnvVwZAYtgmfDSyzoYsfG8QPeO7ewnRJY/sn1FVfp2eZy0+7dk5RrKSeWMpsBA+Gr9rcJQ5F9EPXhxAISKuPjY6WdneEwJU/K/GrcaWTQvR6KGujRO6gjOCof/bEqOMw/WJ+e5lVFt4lb5YG
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 16:44:33.1677
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50954272-5b47-4a1a-313c-08dea60e975f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8077
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Apr 2026 16:44:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19908

We are moving the meta-arago-test layer to meta-ti-test.  This is the
first commit that creates the layer directory structure.  Follow on
patches will import all of the various recipes.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v3: No changes.
v2: No changes.

 {meta-beagle =3D> meta-ti-test}/COPYING.MIT |  0
 meta-ti-test/README                       | 34 +++++++++++++++++++++++
 {meta-beagle =3D> meta-ti-test}/SECURITY    |  0
 meta-ti-test/conf/layer.conf              | 32 +++++++++++++++++++++
 4 files changed, 66 insertions(+)
 copy {meta-beagle =3D> meta-ti-test}/COPYING.MIT (100%)
 create mode 100644 meta-ti-test/README
 copy {meta-beagle =3D> meta-ti-test}/SECURITY (100%)
 create mode 100644 meta-ti-test/conf/layer.conf

diff --git a/meta-beagle/COPYING.MIT b/meta-ti-test/COPYING.MIT
similarity index 100%
copy from meta-beagle/COPYING.MIT
copy to meta-ti-test/COPYING.MIT
diff --git a/meta-ti-test/README b/meta-ti-test/README
new file mode 100644
index 00000000..e3a41e79
--- /dev/null
+++ b/meta-ti-test/README
@@ -0,0 +1,34 @@
+meta-ti-test provides an additional packagegroup ti-test and some of the r=
ecipes that go into that group
+
+This layer works with the latest Yocto Project release (currently 2.2+) an=
d tracks
+the stable/maintenance branches (currently "master") of the corresponding =
layers:
+
+URI: git://git.openembedded.org/openembedded-core
+branch: master
+revision: HEAD
+layers: meta
+
+URI: git://git.yoctoproject.org/meta-ti
+branch: master
+revision: HEAD
+layers: meta-ti-bsp, meta-ti-extras
+
+URI: git://git.yoctoproject.org/meta-arm
+branch: master
+revision: HEAD
+layers: meta-arm, meta-arm-toolchain
+
+URI: git://git.openembedded.org/meta-openembedded
+branch: master
+revision: HEAD
+layers: meta-oe, meta-networking, meta-python
+
+Send pull requests, patches, comments or questions to:
+meta-ti@lists.yoctoproject.org
+
+Please note - meta-ti mailing list requires subscription for posting:
+https://lists.yoctoproject.org/g/meta-ti
+
+Layer maintainers:
+Ryan Eatmon <reatmon@ti.com>
+Denys Dmytriyenko <denys@konsulko.com>
diff --git a/meta-beagle/SECURITY b/meta-ti-test/SECURITY
similarity index 100%
copy from meta-beagle/SECURITY
copy to meta-ti-test/SECURITY
diff --git a/meta-ti-test/conf/layer.conf b/meta-ti-test/conf/layer.conf
new file mode 100644
index 00000000..1997f0b4
--- /dev/null
+++ b/meta-ti-test/conf/layer.conf
@@ -0,0 +1,32 @@
+# We have a conf and classes directory, append to BBPATH
+BBPATH .=3D ":${LAYERDIR}"
+
+# We have a recipes directory, add to BBFILES
+BBFILES +=3D "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappen=
d"
+
+BBFILE_COLLECTIONS +=3D "meta-ti-test"
+BBFILE_PATTERN_meta-ti-test :=3D "^${LAYERDIR}/"
+BBFILE_PRIORITY_meta-ti-test =3D "10"
+
+LAYERSERIES_COMPAT_meta-ti-test =3D "whinlatter wrynose"
+
+# Set a variable to get to the top of the metadata location
+TITESTBASE :=3D '${@os.path.normpath("${LAYERDIR}/")}'
+
+LICENSE_PATH +=3D "${LAYERDIR}/licenses"
+
+LAYERDEPENDS_meta-ti-test =3D " \
+    core \
+    openembedded-layer \
+    networking-layer \
+    filesystems-layer \
+    meta-python \
+"
+
+BBFILES_DYNAMIC +=3D " \
+"
+
+# Codecs in ffmpeg with questionable patent status are not included by
+# default.  As this entire layer is purely optional for testing purposes o=
nly
+# and not meant to be shipped, add support for the ffmpeg commercial licen=
se.
+LICENSE_FLAGS_ACCEPTED:append:ti-soc =3D " commercial_ffmpeg"
--=20
2.43.0


