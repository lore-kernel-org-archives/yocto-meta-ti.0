Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57E95CD13D2
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 15:09:33 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.70])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13586.1777475371434242399
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 08:09:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=SyRK7Fog;
 spf=pass (domain: ti.com, ip: 40.93.194.70, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dni0P1PA3Fj48SY+GWkME6FzG+ZIXmN3uPUmQlC3htC1HnUU5sT8G+NdwfvUN90rnnltcwXxmFsKV2O8R7iYiPEW5nifvd4fTpJANokXiRKiQYuCGdMubTOxsxjX3/ON56HBUHFCC0sAXrwRc2jk2B45kFMy3oyeALw4enn7KF8+A3see35dkYQUbWnuEkomxeVqzKlKRq1azwEfj+mrZtshz1CzQvr4DjYut++W9PBztrtdiObaGVPNrSabjY74ZRk0XzIotzfe0ZHeo+xveNABoS30ndms9vquYEhEsUUWC5BPtimpxEEOGMMyuXD+48h8okJpFoOZ1jzm4w9tCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=faz9EVb/Foc1JHrC6gECubccUSovWNa5d45ZxtKlayQ=;
 b=tXUQBKKmptkjVDehEbauyWd8dGkXv8NjiHmIV/Gch+ENUL2c44tt/wKZhAQy8kxULhHr6hDTS/9l/C+De3tm28UcokHE525bvPsBuKH1eerHqil57Y22W/GpkTkuN5tEA5A6Ocvg5hVxg1Udnr/IsDuxkWQEG7nVxe79M7F2+o0etZf5DRZgdzoDLiJPe1TmwBLKggoa6zBh4u0BjtpnVVjrAjgqueJTgMtsxsV2hyDaiKj43LgOhk1BSiDf8WEHCnKsZQE6CZp/nxK9rKBl748eBMYxRnEgm3CD6n8f7MSOVUadc8BHEJqYlXjii1ESF0Clv0f5zo5goAMcf3sxEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=faz9EVb/Foc1JHrC6gECubccUSovWNa5d45ZxtKlayQ=;
 b=SyRK7Fogp1wiuqZtuIw+XVDs0NUWNPCaaKGlor2xnAabhchi3ZiPxv50S0gMWdL4qY0NhGJnBwCkGm+hAK4wcqSflivcvTVJ1iaKDaAGDPgmPDubbSiqFbk/PLdhW9f558K0r+GuRk8w4ZkcuJW45P8k4zPSZ5R9c3y1PnQ9c9I=
Received: from BLAPR03CA0052.namprd03.prod.outlook.com (2603:10b6:208:32d::27)
 by MW4PR10MB5861.namprd10.prod.outlook.com (2603:10b6:303:180::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 15:09:27 +0000
Received: from BN3PEPF0000B06D.namprd21.prod.outlook.com
 (2603:10b6:208:32d:cafe::5d) by BLAPR03CA0052.outlook.office365.com
 (2603:10b6:208:32d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Wed,
 29 Apr 2026 15:09:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B06D.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.0 via Frontend Transport; Wed, 29 Apr 2026 15:09:25 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:09:20 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:09:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 10:09:20 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TF9KMH3565154;
	Wed, 29 Apr 2026 10:09:20 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wI6XQ-000000046V5-1NFD;
	Wed, 29 Apr 2026 10:09:20 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 03/12] meta-ti-test: Import the recipes-bsp recipes
Date: Wed, 29 Apr 2026 10:09:11 -0500
Message-ID: <20260429150920.978263-3-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429150920.978263-1-reatmon@ti.com>
References: <20260429150920.978263-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06D:EE_|MW4PR10MB5861:EE_
X-MS-Office365-Filtering-Correlation-Id: b963fb79-4626-4f18-ff3b-08dea6014d23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	4MpAz0Peci9cT8u1TzX0cWgWlHgXLE0ST9X3jU3AQ0dEZ2yWsvBt5m77SS8nHvOHeuQKhA0YxzIA22EhuBrkQCbb8V+IpMIZQMTKwaJupRu5zDcmNzHZoB3RBme1jr56e2RF/T/ROvzSgs6+2VIR9qUSh1c3G2wURlxAFdRV3MxLnzZdpITcM5IAxDw18q3EUhM7Z7Ix57mDhTdNE9/q34XJ4kLV/UGJp6bNUZNNpfm+huXEme/dDL3wMwkvZ6OWccSGkZq+F+dfLrB3jW/K1322TZQV4zlMfrmOO31jGxa3RoqmQ+y6gbBtp+8Tj+ophCePRAXNy091ARjdkUQ60DG3sEyqlaXoJoOoXcKI2TkO8XTEb4FTqWBKvsa9IkP50ACnEv5Ruxt52ZWwRUEzW9Xvo5PwSSjZzRy1CKvAe4vOeuiUOY8SJzgtAIBkzuv8P8tNHMgD8L3daurlUvvCVbzgbwtHMK00aSZcP9iNhpZVXRIOmKoNAZucIyDWxWICy0M/izf2MUQqBIJom8s3WOB2gvT2rjZ5M9pU3/nDFS6MSmjir6E8eac2oz2hKPh2aZava8CYsxAQIRXHWtYnlcoZIRuDH8SVsSH3MFMV8V9qpJph0sjBE+EbEPzfWo7v3VpjnheFRAmLyW7A+fny8AwL3DtWmuKHtnERWgBMvbLMChb/WvhdeWUukIlwpsTmWn6LSNK643DbmRiMVKFB6KVob52quYf79b00XEeBk4Y=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Umth5OkZQryuRGOnAPGM3jF4WvK+HlnGP9iu+3HSCGAO9YcKmNiwJEpyuMBTFrvebfiIRZSQKz6R4y/SCfTBH12ALV8Fthuy4C2ZeEhtUaRWEHXvm3ROhnMvCDToXSbaLBpdGNlJzjHbQayr3TEsRiA0MDR6TNlIa8i1c2bq3JN3S4khHwTRE+DCNppFlSyAVhgqwKVov6HsRA7W7LKR/0Cz3wcqjaflYSNWVinhExxLdwmBt/8AVztUvHfa362G5c+IzQ5RdwSm6zJRFY/psPMM/NKgmaza+zACWcf088hKIpfYPOMqmZ9bLq7p06WI80Doc+ibfglmc1wZkHLRUnWcByridJH26c+zuJTjzbrPHC4kUex3Y/RQfo0MLohDERsujW+BLA+usLG8Z5P6RKXCEc4Onyj1BWSbPiITXPNxGn+TxqrcViDZNVoMDPeP
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 15:09:25.1330
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b963fb79-4626-4f18-ff3b-08dea6014d23
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B06D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5861
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Apr 2026 15:09:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19884

We are moving the meta-arago-test layer to meta-ti-test.  This commit
imports all of the recipes under recipes-bsp.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...se-proper-definition-of-boolean-type.patch | 33 +++++++++++++++++++
 .../switch-config/switch-config_git.bb        | 27 +++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 meta-ti-test/recipes-bsp/switch-config/files/0001-Use-p=
roper-definition-of-boolean-type.patch
 create mode 100644 meta-ti-test/recipes-bsp/switch-config/switch-config_gi=
t.bb

diff --git a/meta-ti-test/recipes-bsp/switch-config/files/0001-Use-proper-d=
efinition-of-boolean-type.patch b/meta-ti-test/recipes-bsp/switch-config/fi=
les/0001-Use-proper-definition-of-boolean-type.patch
new file mode 100644
index 00000000..fe18b3b0
--- /dev/null
+++ b/meta-ti-test/recipes-bsp/switch-config/files/0001-Use-proper-definiti=
on-of-boolean-type.patch
@@ -0,0 +1,33 @@
+From 5190913c7a86cd36b91dc3a6ff4c1eb22ea6375e Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@konsulko.com>
+Date: Tue, 6 May 2025 12:52:14 -0400
+Subject: [PATCH] Use proper definition of boolean type
+
+Newer versions of GCC and C standard have bool as a built-in
+keyword - use a standard stdbool.h header to properly handle it.
+
+Upstream-Status: Inactive-Upstream
+
+Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
+---
+ switch-config.c | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/switch-config.c b/switch-config.c
+index d31a237..5b5db3a 100644
+--- a/switch-config.c
++++ b/switch-config.c
+@@ -13,10 +13,7 @@
+  * GNU General Public License for more details.
+  */
+
+-#define true 1
+-#define false 0
+-typedef int bool;
+-
++#include <stdbool.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <unistd.h>
+--
+2.25.1
diff --git a/meta-ti-test/recipes-bsp/switch-config/switch-config_git.bb b/=
meta-ti-test/recipes-bsp/switch-config/switch-config_git.bb
new file mode 100644
index 00000000..90834edb
--- /dev/null
+++ b/meta-ti-test/recipes-bsp/switch-config/switch-config_git.bb
@@ -0,0 +1,27 @@
+SUMMARY =3D "Ethernet Switch configuration management"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://switch-config.c;beginline=3D1;endline=3D14;md=
5=3D659ff9658cbaba3110b81804af60de75"
+
+PV =3D "2.0"
+PR =3D "r5"
+
+BRANCH ?=3D "v4.1"
+BRANCH:aarch64 ?=3D "am65x-v1.0"
+
+SRCREV =3D "412dce4e65cfe5af729be38fd1b4c1d59e9a8828"
+SRCREV:aarch64 =3D "0f52dcb3c4e3678e96427d546d6c2e1fabc2ad91"
+
+SRC_URI =3D "git://git.ti.com/git/switch-config/switch-config.git;protocol=
=3Dhttps;branch=3D${BRANCH}"
+
+SRC_URI +=3D "file://0001-Use-proper-definition-of-boolean-type.patch"
+
+EXTRA_OEMAKE =3D "CROSS_COMPILE=3D${TARGET_PREFIX} CC=3D"${CC}""
+
+do_configure() {
+	sed 's|-I$(KBUILD_OUTPUT)/usr/include|${TOOLCHAIN_OPTIONS} -I.|' -i ${S}/=
Makefile
+}
+
+do_install() {
+	install -d ${D}${bindir}/
+	install -c -m 755 ${S}/switch-config ${D}${bindir}/switch-config
+}
--=20
2.43.0


