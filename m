Return-Path: <hnagalla@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 946C5E9A02C
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 19:23:42 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.6])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2299.1771442615011884880
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Feb 2026 11:23:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=Jmw8lJsi;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.6, mailfrom: hnagalla@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SUyaKIh+OgVEx6MhDt9dEUFo8QraGYFQ5uYOE+fxLWeydSDsGAW9aPCQ5cZEt1XB6xZYT3ti0v8NY9emc3HaDfN/8zVzCE4F2Jn0+p8Id2FrFAGq/j0tCZGK8eR+qomwoXBJSvyKtCFe4pntHhdxhjXmZj0Rt9S8uJQnNPguL6H3eQuA8Dz25JrmVIdi6/1gshWHSQ7k3TmKfZ2HaklmV1j5mMjylj3q5ns9T3AzCOL+MzNla+naWE8EaQ5EpX3yTfh7sDWWnxLk8WVxf9niJBhyuYxsxhPK6ZN95AYhwrufhL+vIgL6JkdgtphAoyKhQ9856kkmv4dtkklW1Gcp1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fw6cRTDiVBLaWPNzmh6uuFih+Iz67AZqai0b27VDPos=;
 b=NAj8QBVLm/4IQCXv6GiLrbpJ5wJclhoZ2nSoa6YqQYizkT0VhJGViaN1V3Ekjsk4Q7rOviIyhNJB13uW023xGm0yfFAfSqUgJhzug74FG2rXlkcDKBxeAdJ6SgdxQ0MCtpmYLVE3LGA7wihSY8pu9Cda9d5amjaB0gyBJWI8k4ur2mszNPYExMJbpws9G6poym+TgaL1YEnyMYbxYme9NeAhUE5aAr5OSc08SMdtWhSXP/HP0u79Yvd0E5DCxoDQIqyC/bcKCYEgYTFp4/ROB6tqA3thmPzz8QIFkXbeQ+UWgYqPrCY/I87GbksO1F44gWpRoTPAej2KU1hfO2djZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fw6cRTDiVBLaWPNzmh6uuFih+Iz67AZqai0b27VDPos=;
 b=Jmw8lJsiigzGEm6W19qL9GK109hAk4Pt2EU2ZgN1VN2QHp11pQgqORhox0PCWvlNtxDrgJzaeavAG19VcmBnMu0ZUZ7sglFOej0SAoF3O495iw9f/6F6o2vMCfokuslhsqC5crOj7MaehiJnIB4ZFYKbRTlgoTunmhPv1V19BCo=
Received: from SJ0PR03CA0222.namprd03.prod.outlook.com (2603:10b6:a03:39f::17)
 by CO1PR10MB4577.namprd10.prod.outlook.com (2603:10b6:303:97::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Wed, 18 Feb
 2026 19:23:32 +0000
Received: from CO1PEPF00012E7D.namprd03.prod.outlook.com
 (2603:10b6:a03:39f:cafe::24) by SJ0PR03CA0222.outlook.office365.com
 (2603:10b6:a03:39f::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.14 via Frontend Transport; Wed,
 18 Feb 2026 19:23:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF00012E7D.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 19:23:29 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 13:23:29 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 13:23:28 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Feb 2026 13:23:28 -0600
Received: from localhost ([10.249.66.119])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61IJNSdk1354160;
	Wed, 18 Feb 2026 13:23:28 -0600
From: Hari Nagalla <hnagalla@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <nsaulnier@ti.com>, <b-padhi@ti.com>, Hari Nagalla
	<hnagalla@ti.com>
Subject: [master/scarthgap] ipc: ti-rpmsg-char: Update library to 0.6.11
Date: Wed, 18 Feb 2026 13:23:25 -0600
Message-ID: <20260218192325.12701-1-hnagalla@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7D:EE_|CO1PR10MB4577:EE_
X-MS-Office365-Filtering-Correlation-Id: 108e59a6-3d92-4180-419f-08de6f2332d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vIXrebjBDXZ2seyZ0v2NWZWQ4lbAccBiQnS3WExg7JXLGLqUlcLeGB+COwu0?=
 =?us-ascii?Q?L4pr42lorTsfyivf02TOSAFC/p9fKvy5lz3YWsKONu1/XRh+krRzF7/UN7N4?=
 =?us-ascii?Q?mZStD+RmiFmxHD1Kyf2SaKgcIbRtyS4BBHASR07aVNKEaCWMD/4TYpjMdo6r?=
 =?us-ascii?Q?mspwslu4oQjiJaCeajp/gNMbo6dT6hmh26W1qIlJRGGHxvOztoC6UMprQ+Qk?=
 =?us-ascii?Q?K4TLdkIMCGFpOJgMmdP/hmYH8T4pyXcXgBkyll3h/4bs8uOcLs8POjMfNK16?=
 =?us-ascii?Q?EhVLanx7SPYKMnKRftY7GY7+1f8syiwzyOWxMjxQmf4cjgQ2jAyUAbiGM+V6?=
 =?us-ascii?Q?jj0US98gwNdfpGWy4rw7zcxyAjjlxUXkdE/178QZ1vUEoSgHQHuCzqWF0i75?=
 =?us-ascii?Q?23F4Qn+EooojM+EG5tgQZeJNHGqhsQ0EJlZIz4sGoveqF+Ig43MQeiUEfTN3?=
 =?us-ascii?Q?MjvOOMp4g/l4z1l+xtS8v5oyU61+7F9Z5v4vL7F+n9Kh4a0Og/Pncmbikk2+?=
 =?us-ascii?Q?V/IrJ3s8femoZcKddOmLln4/7i6GXotQ5HNCSEiabd066Bk/1qSZQPHU9FsQ?=
 =?us-ascii?Q?lssaZAGm7USkViqXpwxBkxEuUuKBMJQ4kV7r4EuVDIqT9d7mS1WRmcW3RMG5?=
 =?us-ascii?Q?LGa1bMx3UTVZsYbVp2P0vtnFIicvVMz/lhiI1Kg1eouRdpLS6mD/so+9KeDv?=
 =?us-ascii?Q?/j0SE90j+YE74/77VGEfNCD8BPyj1vLXxKIknrKnIhGzUm/ZGFqpG/nAGbpb?=
 =?us-ascii?Q?utXPUgwpk7qhMRJIwx8XY9UNjFcFBFxeheYW4acXGfKqi53d7l2MBHSlYdWj?=
 =?us-ascii?Q?1HGzQdDE6hYhIie7V2reZcsk7NQdEZOBHWIzlldgO+PCNSZWujIePV/n3eOj?=
 =?us-ascii?Q?eEPghA/37fCx1+fnlNAYtofhXcRFokHqYdklAQYUwyNaK8HRVVfF/DCws+DQ?=
 =?us-ascii?Q?3r05BRl6MSCh3Mi+Nb11yqAOzILSzPxTfh+T+z75goIJYqi5W/XLzulencX3?=
 =?us-ascii?Q?ZbaEWe/4ZQ4j5tBjrG0TidHyUue/aVQ2eYKSUQzJOWobYw7uhY6Hul/ZZKS9?=
 =?us-ascii?Q?rAtcRwD4vF8u+iPw4wKvllATPlZCpUggOpa0qpqNVqR+LUovTLZ3MOx+PvN9?=
 =?us-ascii?Q?XAFDmJ42dk/RSe5D8+RlWbpYH/HlLkh48rwGo3/NBrkJN727zJtJDZEVF1TA?=
 =?us-ascii?Q?QS8BxMRS9xv3HbfucH5l8iJXF93MOexHm4NPVbAmurKYteT7efY2n+fIqG/D?=
 =?us-ascii?Q?BdFcY9fMPGgiKkuaVninzzHBcrRjinjdrG5+Wz2i/mz9aYD7mzSCsinP9wse?=
 =?us-ascii?Q?6Ys/YwFCdM2dzhPtSwGDYu7vgaxAXUwg0nHSofJPPaKa6WUQnLKJJmgiDfhy?=
 =?us-ascii?Q?klFuPI4aVZB/JqJpcmmE7zcMQedXCNGDcI9VpGKOh9oQOLqIUvxcCRCkYpgW?=
 =?us-ascii?Q?14KNxVAjM/ESL/GnKQT+sAyzLpIBFJPB4BBjhVjSjQ8Q+eiCESHasiHF/ooo?=
 =?us-ascii?Q?jxaaYQGTBHAtwODXXVpirkSLyKO8kpVuaggletL3igHAYMGs7GItuBn3Lflb?=
 =?us-ascii?Q?jh9x9Z42wMRLlLRFGAuGTHA8ortqAhopgFXwtBLTSVnGmE4H0MQBOwBhElKi?=
 =?us-ascii?Q?ZZ8zJiXGUh+toNl7i1gDaE/kyujngE0Qux62wMLqFUXu+efuCMuZavMb8E/O?=
 =?us-ascii?Q?aJLOiA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	saykxjpiU6vVokPyYo7O3La14n0Q1j3E5/Iv8Uf/1YhuJz0zWksjWLqOMEQ3hDvWPWh5JW7iwKH25zxu8yRXIbqy96JeQF+55XDQrVvgoZD0JsOuQpLl/+RN3RBM7L6m6X0yIbF3WrK3eWkncz1hd41BkkBJPrnPqj1QG91Sx2MoROSEN50Ql/sKkS8ZL6Vz6jddAIUflZHU9R9C/JZmbeLuXN7eori+1aJglUqsGu9lQtxo5UxHRCjflgcNpA46AQMCSfqm5J3ay6ZFi0ZKgYv5ONxaJt8DOaL1r6YjpGsvy5JqVFKEKYeYVrTW5gyi2KpRuZNydUiSQB/5mz7oy3tvgVaSImoidyIp6yzqhiAV/pJK9zc0PT30+jW7OGG0oP4E9tHeQEbqDpEbUcV/pePvDyKcDFjsz8UuFV6Vhtt5wIAOimCNt7wzBFRfjNXu
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 19:23:29.9282
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 108e59a6-3d92-4180-419f-08de6f2332d6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E7D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4577
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 18 Feb 2026 19:23:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19539

update ti-rpmsg-char library to 0.6.11

It brings the below fixes:
dd4783422bf  lib: Do not update local endpoint
f26e4a30ca7  example: benchmark: move latencies array to data section.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
---
 meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
index e8f0f8ba..f9fb0f25 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
@@ -7,9 +7,9 @@ PROTOCOL = "https"
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/git/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};branch=${BRANCH};"
 
-# 0.6.10 release
-SRCREV = "057b1a249261e26d00c501b59646957160ec815b"
+# 0.6.11 release
+SRCREV = "dd4783422bf4fbed1015bfaa51054e40057b4f04"
 
-PV = "0.6.10+git"
+PV = "0.6.11+git"
 
 COMPATIBLE_MACHINE = "^(k3)$"
-- 
2.34.1


