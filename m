Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C52BECD9BD
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 02:35:39 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.10])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2607.1770345329422274959
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Feb 2026 18:35:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=sSrLp3+c;
 spf=pass (domain: list.ti.com, ip: 52.101.46.10, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ETUG6uiTH+aWnK0658sEgi8Rr7dbYLVbiFDD11bhXXnEZt4HQfghqPwC27wQTXyOpgK/XUfXgEyrQHtE9otbPnrhnm9mdKfc/SyNu4UGzDHmc7L0PYIu8xtyKeOqUf1tR44MwpYqPcxjAjZm+ICeIZ025/yjOLqAwoVgkO+jpKCSBMjkRqd3uOi8UFeBZ5YapGkCjgxfBiNWuLp+r1MXHuqFP0PBeGxQPxQmBQKnZW/M5hx80nVUKoJS9doEdai4Tgp3RMP9dSxIq/JQe/XZSvB8AopuqfRUerw/Vbqv2rg4MSJytVV7Mgh6rVXA/6KiYvgEsOZZp0yy5e8DsDcOQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o82Owe89AwAsWprGos4f8Ye3xfJ6L0FbJ7t7/OveVbU=;
 b=lfSD3Cr0R2T+caQhDSsuzwJ9054V8u7cIYL3Vmh79/qIaItVQTpQIqeoebBDNqLpUb8LQU9jUZnjOZdzUiTM+xIdc4GJodeO1T9EfSuRs1MAoTSRgYGNvoDUCbSbwhmU1fEhDfxvyw6SA5S8zS7fPM8HIfpt4qLI8cBsoDw26JUMJolLejlT+pujzKEnIUVqsA6RAfI2uDCpghBk8LWuWTDWuknuapsVf1Isy7a8P3fR5NL8ng84gkPmaTCTkBZxV541QDewkf1SbSPjhCGnOXSWjiYMFRZcu4V64u7gjPtobWK2PkOJk79w5MHMaVJ3MYWkguM3OAkX2ePhS3d/Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o82Owe89AwAsWprGos4f8Ye3xfJ6L0FbJ7t7/OveVbU=;
 b=sSrLp3+c39MSMmwVz/MnGqMnWaRb4XuOVn/Mm2JRa/pGR2pLbOJR3Zvp4kzB2ECLWvLi/SfuewDU6kDalnKfTsDFJE3nCdHgC5lmvu6cDic1CmIR2yKInFxIZzN3GpK3dY85rr+JyIu+c+lVbGzurYBswZ6Kzvkjr3OkYwoSMng4UmdA6d74RpCQ6VQDivdcnamzM2zuYY3rhQtbwAC1y03NaC7wCkWiZzPxYUnBE6M+XWdPX7lnApiu7R3cJ+HCjTO+f/R9eoyL7jVH4GTfnUYBYS1wyoc2kehH8Evw13nmMr5m15w0uiDcweZzx1Nj4L9oIvKfQUE2FiWmXclr/g==
Received: from BN8PR04CA0058.namprd04.prod.outlook.com (2603:10b6:408:d4::32)
 by DS4PPFA043F25E4.namprd10.prod.outlook.com (2603:10b6:f:fc00::d39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Fri, 6 Feb
 2026 02:35:27 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:408:d4:cafe::92) by BN8PR04CA0058.outlook.office365.com
 (2603:10b6:408:d4::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Fri,
 6 Feb 2026 02:35:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 02:35:27 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 20:35:26 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 20:35:26 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Feb 2026 20:35:26 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6162ZQBI1056859;
	Thu, 5 Feb 2026 20:35:26 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 127562A68; Thu,  5 Feb 2026 20:35:26 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master-ltsprep.202602051800
Date: Thu, 5 Feb 2026 20:35:26 -0600
Message-ID: <20260206023526.1046465-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|DS4PPFA043F25E4:EE_
X-MS-Office365-Filtering-Correlation-Id: 67d35915-c324-449b-559e-08de65286349
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?S2XaYACe5WUAKClHxEX6gi7rWHvN46ZFiBG3wq/DPdHMZdIEjiFiVN5Uu+ih?=
 =?us-ascii?Q?7vkv8x1mNiacklP878Ns0kFo6utjUZISCzHc91aedWNX9h30JDYHDHUgoHn/?=
 =?us-ascii?Q?GjwBdZEz8Gf4R19XXSGErs2vamDJm45ZRYEpw6FK/LUj0OtXo4Qf4TE56U74?=
 =?us-ascii?Q?8TBmOAzS9Hb7XJ3/OK203rznOEGbRGtxX5p4cVYHo+GZrCKXwAF/wyxPANf8?=
 =?us-ascii?Q?dx55wRyG5N/FegCbZd2AUOlyRLdQrkBYW1LRM/vBoVKYGaWzsLdWw3bvyYSR?=
 =?us-ascii?Q?ejBIj6xPUTb2rCC5NIvChCUO0f9sZW42w90GyzlSwb15WSq5MzuFAe14nJqb?=
 =?us-ascii?Q?F4mWRfggadvN9I4UDIqOCT7i7wGPQCVTWj2WSwAYsiaqI7Pq0w0E4WQeQwl7?=
 =?us-ascii?Q?eUbv5w4XxpPizINtWi+vp6bPUFvjOHJALD94nYVRPi6c9Mzm4BaV/Ynn91qN?=
 =?us-ascii?Q?vCDapPJw7jh0nSouDqHVfOjC8KY6azQQ6rZzn+UpxQzNWwJBHe9OsYjNHYDK?=
 =?us-ascii?Q?muQ7XWWXmtHZWFG8YHUu1HnQ9yZng/HN2zvtflnO6++Rz2ZGRUagPpBXcd4M?=
 =?us-ascii?Q?H4Y5CF4ObgQXR0tqMQFuS1xm2ojf5uzSTGUgsPEvYVi4KplQa5Pr3bRdBQfz?=
 =?us-ascii?Q?9PUx3mXiNvBsI6xiAJM3DWl5QdZmUW7HxqCNr+7PXIlFtyp31O/DBmmNz6F4?=
 =?us-ascii?Q?exUSzwXwRNSIQaMkJwJKVJ+UqwojUBJWVuhxElTqI5uh1/H0cx5peZPS1HUo?=
 =?us-ascii?Q?Uh5/CS/UJR9EY1ZER13kyNwmYI8eoeMYXvN1sjiVDLLUjCdxTmp9A0gDQevz?=
 =?us-ascii?Q?S79YKtgrDxFe2iIj2r+abx70dk+wUqqpbNdGbBtwijXhfGr2dQeX2R6RziIM?=
 =?us-ascii?Q?gAhuOa8YjvueUnHwFluy6S+2OX4tuxTZivLLM8qohSRYjdv1qswchzUdHn20?=
 =?us-ascii?Q?X3I3C93yXcFek0p0PoQHGX5iBRiHzlxpzUYQcxN3ulLXujH7oifgRTZlqZhP?=
 =?us-ascii?Q?HMPdOMSu/PYIty5iXKyAABYMqCsaY38kqZLPnp/DxgIfyKziEDwnqUOHpR6b?=
 =?us-ascii?Q?bCx0Rx3FURXoGmGwgUU0+QaH9V8DhgEPA0JwnfjgS63zt+IyRi/0mX7ZxM+H?=
 =?us-ascii?Q?i0aPovgIfe0wIv//XdNVRkqQ6TUZDlfY48paspeN3IQS468eZTaefCdRrGC0?=
 =?us-ascii?Q?JH4dJTj6Kce0C1/tRT8KJKqjR1ydwUu/GG3Pdr2/UtskhvyeYCxchjnmKV0s?=
 =?us-ascii?Q?fP29wUv/F50I82k1NlqmzL8EZe/5jhKb2wpyOmpdHjM9+c3CEqDNuYP1Uib6?=
 =?us-ascii?Q?VS8BIrsvGs3NwAYPKrAZ15AAD1YS05aNwQR+NnNiGqJGVlZ3wXBvpgv7yo0l?=
 =?us-ascii?Q?kqHE8ezWL+bO3qASGNa5rfxX3ostQiK6J2R5G2tn4L9aQGat0vmjXzrdSzZh?=
 =?us-ascii?Q?+djHbiqM9XKbm6oZpRURIcmfg+CVD8ZM4Qcln4NeeqYVsMJ89OAM6H7inxK5?=
 =?us-ascii?Q?U0w3WneNE3eHXiM0txYQffY6+nRVcfx2kzuu7USVGu5aUF/uuGz0VTz07VXU?=
 =?us-ascii?Q?p/1daHpfVag+11IsMKrfx+mbQdJqpGBk8HHKsosDZ9oMLx+jSpn6e1fI9+p9?=
 =?us-ascii?Q?ddlBTwXqFCXQGy6k0nRF7o/FOL8lNNzIqvKvIDvL1JrzpSOuQWuRyZFW8Wu2?=
 =?us-ascii?Q?gNIqsQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	QXEWS8Za7ZKWJ2XJ0fc7JFH5VoDd+GEhbfgXK1o2yrHpGNWJp7VMX+tdF8VGeFbgsQCB+2rY2v/gDwlR4WN66d2T4/mA7+Z5ngiJqwj/qwqCu0kZG5cOCOmrsWFBhRLmLg6Oh9LOkf7xcQ3slUI0kGPxora/wvgy4l0e0RztTqMNeQ6fLrAsNVkQj34uLribmFpRbdeYhJrW9noB5EJ8wAVXzLZyc/0R+wmV2FeCBoyionjH44VvI/DojZLbHVOtjqYKQ6S+++imhrzFhU/PiMGmbk+z1VEuL/1CqI2tv1/cXSjw4WjL+NXWU/8WvjdbigMMGAVly6bnvRRsC3Lwel4R0d2bLAE3PogFm9BSiar3dn1V53hOHTIZM5siheBPGX376a/o7A/UwP7HrH0luWVMrizNK4Zfz3RKGMYzMQ4rHKJF/JEtA0VrwixfHe3U
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 02:35:27.0873
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67d35915-c324-449b-559e-08de65286349
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFA043F25E4
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 06 Feb 2026 02:35:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19462

Updated the value(s) for:
  atf: SRCREV_tfa:am62lxx
  u-boot-ti-staging_2026.01: SRCREV_uboot
  linux-ti-staging_6.18: PV,SRCREV

Changelogs:
  u-boot-ti-staging_2026.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3D0456d31970eeef8678fd20a6683d1acd9fc8da4a..7db1482473e9a95=
62061c6f89e6d3cd86a17e616
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3D33b7bd36f11719837307a92818393608faafbc10..e36172c=
9eb8513198f33eee06b8cff28c6556e11

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc  | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb   | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb     | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.i=
nc
index d933dc43..804a3981 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -10,7 +10,7 @@ SRC_URI_TRUSTED_FIRMWARE_A =3D "git://git.trustedfirmware=
.org/TF-A/trusted-firmwar
 SRCBRANCH =3D "master"
=20
 LIC_FILES_CHKSUM:am62lxx =3D "file://docs/license.rst;md5=3D1118e32884721c=
0be33267bd7ae11130"
-SRCREV_tfa:am62lxx =3D "40660e2a494f3fe38a40525bc9b9bf9d55e84d11"
+SRCREV_tfa:am62lxx =3D "d071d093b94852473ae6ae26336f125e107a964f"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx =3D "git://github.com/TexasInstruments/=
arm-trusted-firmware.git;protocol=3Dhttps"
 SRCBRANCH:am62lxx =3D "ti-master"
=20
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index ee36a50a..75302049 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -4,6 +4,6 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2026.01"
=20
-SRCREV_uboot =3D "0456d31970eeef8678fd20a6683d1acd9fc8da4a"
+SRCREV_uboot =3D "7db1482473e9a9562061c6f89e6d3cd86a17e616"
=20
 DEFAULT_PREFERENCE =3D "-1"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index 0565b03e..d51f4329 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -22,8 +22,8 @@ S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
=20
 BRANCH ?=3D "ti-linux-6.18.y"
=20
-SRCREV ?=3D "33b7bd36f11719837307a92818393608faafbc10"
-PV =3D "6.18.7+git"
+SRCREV ?=3D "e36172c9eb8513198f33eee06b8cff28c6556e11"
+PV =3D "6.18.8+git"
=20
 KERNEL_REPRODUCIBILITY_PATCHES =3D " \
     file://0001-perf-python-Fix-compile-for-32bit-platforms.patch \
--=20
2.43.5


