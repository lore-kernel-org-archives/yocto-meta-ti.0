Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3975CD13D9
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 16:44:46 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.794.1777481080010520773
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 09:44:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=n52Dv2eu;
 spf=pass (domain: ti.com, ip: 40.93.198.31, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kI7cs4xn/CeDe3QkT4l+g01hiP4Iac1+NBX6oMP79L3i3szdmjOLRuDBs1dyZqtWmVLD0igbzIiedjZqtV7Hse7lINHk4hdU/eGrHgMDdbRaSXnAeVrP3mk/4jR9d+1idbtkn1CZsjSz51FGgbdRc0ja/kB7X8w83321EQNpoAI+aV/6BirMQMhIHMayFziXyf5p4CtPLJ3QOQg6PYKxVOfCEqzpshfbRlsTODD/0ssaco8RQZPvIzOGgXof1qtVgF4ZgUljpLx3hwA+ksm0K9imYVCipiwnAyNp7JHUWgPUnJrWYZT8MxwivMZO3m+FA9qBKWOVTVkW/pZ+YD073Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jo2MK6+0pcXdvDzUdeqw86zkY7l4dEKNvQLNuPwtwQY=;
 b=wHuB0vF4lmXx5Et9Al2Fn1jM2c2mru6jDmp/jIDO+UaEivthkzj2Y3slBRqXuJs+QmTx3Sip6u6g9RQ+On/6C0SdvR/1MWlNWaL5JzzJDC0h0WvLKPjDP41ygezpizNW5H0vngd1YSdK6JESN07082sQ7nS8k6AfUULxUOg4eBE95JFj8twVBeS77yRiZ+syP6nn0jJbk1moG7Fei8aLfaEXd0yQS1K+mecQSEWEq3WhkKT+tsDbAgrgfotn5eUd3fs0Z7lRCntrH34ndJw1jzMllMAny6TpX4HLyUGB8ES6BcEMP1Pin6YhrthTIVxw5rTh6tVrVVNc7cZyZOs2FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jo2MK6+0pcXdvDzUdeqw86zkY7l4dEKNvQLNuPwtwQY=;
 b=n52Dv2euuGdwBOn3mN+QkyQbvexHbNfANgck1PA4BzLXDnj0pS6ibrTT7KvmLNyO/99pn53tVYRhKCCtj157Yzrnkk/8bJbWzKSQHnvyEyyxNdW4L+YivP0FGlUIojuUXlcUzLQZQiDU8gljQNJpBbmQnod1l+XwXj8PUH8cRoI=
Received: from BN9PR03CA0722.namprd03.prod.outlook.com (2603:10b6:408:110::7)
 by SA1PR10MB997760.namprd10.prod.outlook.com (2603:10b6:806:4bf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.28; Wed, 29 Apr
 2026 16:44:36 +0000
Received: from BN2PEPF000044AB.namprd04.prod.outlook.com
 (2603:10b6:408:110:cafe::fd) by BN9PR03CA0722.outlook.office365.com
 (2603:10b6:408:110::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 16:44:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF000044AB.mail.protection.outlook.com (10.167.243.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 16:44:35 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 11:44:32 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 11:44:32 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 11:44:32 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TGiWkp3719613;
	Wed, 29 Apr 2026 11:44:32 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wI81Y-00000006oNe-2jzA;
	Wed, 29 Apr 2026 11:44:32 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v3 03/12] meta-ti-test: Import the recipes-bsp recipes
Date: Wed, 29 Apr 2026 11:44:23 -0500
Message-ID: <20260429164432.1623594-3-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429164432.1623594-1-reatmon@ti.com>
References: <20260429164432.1623594-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AB:EE_|SA1PR10MB997760:EE_
X-MS-Office365-Filtering-Correlation-Id: c3980e16-7c23-4199-7497-08dea60e9907
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	QnFcfKfJMIXGMdQLrUL3VBMKPXukFMLVME828tHqS4ZaPQH8O2A2S5zwwTO1qEdwUNKVcrwM4GAOSKBY7LinoAG67TKJT618eY6l73kgPY9AUQyehMZUGqRtqD4180N5ZfI1nQVBYWAZTx3A6KLTfjKaOYcFsijIt+jXXelCfW1lUiScegvs9QHLuIQNsTF7unOWWhvyb5S3AnHCBZVXcy7p2R9mPRLPa0gUUnYsY7Nkk74qVdapwLku95kZpDkUcSGonD1iPI+pKHjt8MkY71njXyVFobTsh+pt6yFYmFwhjp68YoT9ZgSVOA03MozGtfULXPtTeold659iPDxHrBQngzuE3zsiQWDnhMJvR4/x+KCBJvx6fmXDw2l2CR2TOisDuUF7p92IQkQAZAeajVBhMa3bZ7QnvnkIMTRRcMv7h3kAVSBOK1VTQK5sDHfty7CH5nFKcxYTy4kQTLUajMLP4fzY3q93EsZzkX5ZEa2GvWDUGFBuObPPOrTfdip9b0i01WkJoudoL6qyhWr9ep2zu1Y9p8hc6+2ljVl686/VNb72mfQirYLuPGYFPARV+p4S+DVHfHt+QJnAHtDn90uQy5c1MQGB0bENHwK0JITnVBthMc+16BRERiPgHKydfZPovCfr7VardSGgtmr2zWL2+aXhcwaYgmLS/RIk67Zpus2ldFcra1vn0YjTKSoVfc3RSQmGo7RBlNqiljiHGOD7o1dRyJgLq9ytC5ndU0wIEv2S/6zdOQzZdXqHuqGM7f0l5Uyar7MWRRbP1/2vGw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	JbI/M4HNovHTBFM+IdazkSqIL115ypQ9a/vc50AKqNkyMs5cZW479Nmzd116gI/biweNsdhtbv+kSLWtHl4q+jIkglREtri75FeyHKEDrAjAf3bXaKp1Lj24DkwCN0pFMAQ1fipmu/RQ76enrk7UGoodUGmnohuVbUZqNqxt8qottzO2fhV9b8MYX8eCZW5hNS0w9fTgInaRAYqJcj7JxjOFromuj2UMMC2AZLJNsmLKEvr9wquuetdGmRXA+vAXn65Pgh4Qms5+TwJx84CB2pU+fApYKZxjUGYhUb4MjeT0V2qe9YpK8epErxfiLLvlQsF5UF70um4UCfV+SC2LmMTh0/KKhpj/k3vKdLhnFemEprXaDWcJbVPJSAlM7ZAJ5JCc+4rSBwuDAfqKAqBVK+8ZHApoSp3PZvhfiunkLaXXPuPSyr2d85wQ/fvNjebt
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 16:44:35.9155
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3980e16-7c23-4199-7497-08dea60e9907
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044AB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997760
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Apr 2026 16:44:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19906

We are moving the meta-arago-test layer to meta-ti-test.  This commit
imports all of the recipes under recipes-bsp.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v3: No changes.
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


