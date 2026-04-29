Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87F93CD13DA
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 15:23:13 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13924.1777476191637295576
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 08:23:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=YAAR32AW;
 spf=pass (domain: ti.com, ip: 52.101.53.51, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pMFdk/9RgQMheHLzSsThUv5Bb28prlEPQ9yYuFfKZJy4zfG6UoKHdCZduomQfQiqzSGKQvEVOUEERWcM+BK86vYD5jKNcvk8Q69y18ezqhSGOwXGPRQULWsv8VgrAw7qT1UCbQtsMo1Plat4WCDicUN9A/Zmi23/0rsoiczNgnXUqwvsCM81Q4F/6E303VgQ8YRvw3zLXNcyAPZbZ/VHD9yRkVvVs+37n3xPgjFf3i6Rfvzaf5esR77PJpx6ZaFXRlqmnJW7iJFEd7wLaeqyNQ/njP4g8WXtLzhuV2LjVX1hp7JJK2MmNn959fZqo4y7QXL+TcyFr9tugoMUfTDLFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9Omttyof/bY1P+K5yBxyTgw8i1oFwm66/r0Oq17++o=;
 b=BMfVJLN70+GivQ/ykz+Rx8ZZCSL0UKzobNia/FccqU/mXl7Yy+JAiH2PDuytNxOWNSf85Lc9Zp3szXe87e4yLPohJYg+53UrsLD20QmSt8HeGf87JIqWURnlSo4/K9GmAzgo1cFF0DC7cZBAuhNY4cNk/FsonCaGFXJT0gPXaNkccEFgewoo9zc7VAI+PlrQjI8v/PLPXgQRUubIoxE122jFwUe/mRX+g/HOfGfmcvXb9kaZMmZ3v4TS5u8QXZ4aaB71fzfQWACy7saWT3rZRtkG66YVXkvb7FwpjwvPOGMXUyqbnXHyOZFhzJ88uWG28uzq8yyt8q7ORuudCM5Tbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b9Omttyof/bY1P+K5yBxyTgw8i1oFwm66/r0Oq17++o=;
 b=YAAR32AWmG7RmKfKfprwlACAr9ESBHhknCRUY41c98QtwQCEEQJGBa8cIj0VK8dZ7WhbkLI0xDmE8rN0cidpO6gWmOm/lHlVa5zHaMo3v6wH4pkcYZJYYhr5PgZnJ/5n6Vj3V2nVC7fc9PiAZ9Ay5AOrtxfEoMUkeYxMJgVrZ/Y=
Received: from MN0PR05CA0009.namprd05.prod.outlook.com (2603:10b6:208:52c::29)
 by MW4PR10MB6348.namprd10.prod.outlook.com (2603:10b6:303:1ea::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 15:23:07 +0000
Received: from BL02EPF0001A100.namprd03.prod.outlook.com
 (2603:10b6:208:52c:cafe::ec) by MN0PR05CA0009.outlook.office365.com
 (2603:10b6:208:52c::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.5 via Frontend Transport; Wed,
 29 Apr 2026 15:23:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF0001A100.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 15:23:07 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:23:00 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:23:00 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 10:23:00 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TFN0wH3585452;
	Wed, 29 Apr 2026 10:23:00 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wI6ke-000000046s1-2JJR;
	Wed, 29 Apr 2026 10:23:00 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2 03/12] meta-ti-test: Import the recipes-bsp recipes
Date: Wed, 29 Apr 2026 10:22:51 -0500
Message-ID: <20260429152300.979685-3-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429152300.979685-1-reatmon@ti.com>
References: <20260429152300.979685-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A100:EE_|MW4PR10MB6348:EE_
X-MS-Office365-Filtering-Correlation-Id: 30492b2b-e4e9-4497-d594-08dea603370f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	J4YFV2r6Pe6lEIe/kAYWr53icUInVs52mIZP49REGQNrjJsJ+T+Baub2fCRzLX4vlx7HHsh41STEK8hsaNGd1digIrjHpX8M6+adI9E+52mqfHbRQsCUetBw5jPTDXEcUrF7q84sSQT0B1oL/SyJwRJRIUIzBUJnIgxHj74a3zaJrUQGq/LBC1F4H2JmqWe1+6xMcXsM1d2d0txZEnE/eHV4eWCjLB7gYR5olPQATPuv+puYMc18HO1yMI7X8SEYSLTGW6NKzqIU0cP7AcGD64Hj6IaK8BQD4AqcbPVoy7mVGbv1vnGC+weLX4g6014gCFXtWG4qE8TkABnr6iOMcPgUIfO06GHFH3EnXIK+zPGiYVg/WmCRmSI93uFaZnCGSwvc34YwLJi6whrg8eWr92eXetGQ3CT1XE0iMX2UjrALdpvhaZRImKZbbp2KKeNQ/ASK2rG5s010AFcF17toc8hxfoZt/qjvzHWeTYmE1jHH6L4hrA7AsizZj+YgEFlOCadqlo6eKssJcjb0Z0YN368hGfLwUyfymlX7z6KSpj5lXDx7PLTMraGrkvNZoXEYAE5I1s65pU/3cSbU6HZjPEuC8wJBmdhCBAW6zmqE4Y0jwSbOZCyUjWKbaeSJlUlX2RtyIfFos3h89VgzHVxHcW4ax4wTKYsextdSG2ciSlSvlq3LeTdILHUkmg9i2SFpJDlIpZTrHd96B9kO9Bn3CZjjiCmVa3hgNnJ86ZGFCRKyd8zczyT92OTqwHpgyMie4Q6jZVa9q+o/Ic70uVs1ag==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	+he9PdmM/oDs3bSnOpzvCoMu7o9vnUpBs4kIzDwLtKB1WkdYel8/7AwWpETSS1R0lekfxOyJY505Fgw2tWVdU1Ayg1QYb+KsaZUfgEPWLBAC/ZiqRmY/Ouuup3HemYN0eCweFc4u1SkCms+KouDVtvCQMFjNoQnxXOdok5c4rYZWWVOCwWk2SXce2EwfhQfFAlAHg+mlI8xeGZfYYlwzUoWP/WBo5cm0zo5d0Ve6LdbvEW23EaO/Lj1b+D43jXRcV7dMRVGqahrU11Fk47YCzNwLbLOuDUdNjEhGQq3i6xeS1XnSKH1GJTfW5wDKwmMLE2d0ubn0K1hVYLjgVKM6J6hLuleKuy+vUNBItIXnhkQuP1dS7RArZGi2tUFm2JqMTyscWSANJXAqbGUlJXZYe7VifOddQWZocJHhxmk5Sv2uPi7rkXI/oo7umvrx0Sma
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 15:23:07.0863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30492b2b-e4e9-4497-d594-08dea603370f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A100.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6348
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Apr 2026 15:23:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19896

We are moving the meta-arago-test layer to meta-ti-test.  This commit
imports all of the recipes under recipes-bsp.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: No changes.

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


