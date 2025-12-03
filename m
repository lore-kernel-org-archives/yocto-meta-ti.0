Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D1EAD12D75
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 15:15:07 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.1])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17631.1764774901049946047
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 03 Dec 2025 07:15:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=BZ+zXpXk;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.209.1, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XohYZto1T/8AH+VXZiBe7k2RBpJKvN+ukDfsqwV3sO1tDz1WmpP1wv4uKQphVd3Y6Krs5W2MS88qKPCPeoLQzveToa+3Fk1NdBdJ0S76ZZge6pMa2olcpfWBwjjjMwnYoy1XpiTo8Q3cGaTtZdnO54NGA/ecqUWiDPcEM6Pg62WCpjMmgDIcmR/NTx7mto6BnOyny+hzeuFYDvYGgSo09DyiDpagftGthMNFNiAGa58Q4mElKc0PrsrZmI9reMhS7OhONkiggcdmE3OhYCY6iJ+eqlFxTkdqy8DGyc1AJgFgkm1WapMZIdhtW14LYWyg/Ly0e2+udDbax9jxPprfgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpz4kJECgtjYrzMepXolw6RQmTw+blatyFLV+TKMtcw=;
 b=CoaeSm5UvrxvKVBZCHLYNnxZpKy2Si51goQQAkyO6Jxsdt90GliCBDpX/dn+Z6IDPwx9AlpimvE1o74FKDnKVBZMPAOZq3KS7asv8dRHci15pJpCRvEj9LSLV41C656bt6nnwouXrYNMoodQUJaIHAzz60WDQCbSvCHBwjG64qmefcTzg5jd6Fw2d0oU90aBqqnwrBO8uA8LhKTakLJf8rdj5AMYOo0jL7ye/uT1+UwIyLPSftjZxHwr8Ga+wp9/zyBz7AEfHBkPBcb6+I/4vywNm4TcbQZ7heVcBY0HuZtaFH+eaKvXCT5sidHgd/3UTx9yXWBtMkRCkEQtKSDHkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpz4kJECgtjYrzMepXolw6RQmTw+blatyFLV+TKMtcw=;
 b=BZ+zXpXk72xjKyzIgqtyb+5p0GA3srfwwsdU/OyIDVvDIHOytzLEslOlPHLYcCJtnx0cf73MRllg+oDTaOVYZY30tuMi0wzZzz30kyN0a1WYbEdEk9T2WTSmTKah7NX3Zc9mOCvcLC68BWEkkhFMhPyzYQvpVdfAuNUoZ+mX8jI=
Received: from BN8PR04CA0057.namprd04.prod.outlook.com (2603:10b6:408:d4::31)
 by LV8PR10MB7822.namprd10.prod.outlook.com (2603:10b6:408:1e8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 15:14:56 +0000
Received: from MN1PEPF0000ECD8.namprd02.prod.outlook.com
 (2603:10b6:408:d4:cafe::49) by BN8PR04CA0057.outlook.office365.com
 (2603:10b6:408:d4::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Wed, 3
 Dec 2025 15:14:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MN1PEPF0000ECD8.mail.protection.outlook.com (10.167.242.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Wed, 3 Dec 2025 15:14:54 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 3 Dec
 2025 09:14:49 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 3 Dec
 2025 09:14:49 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 3 Dec 2025 09:14:49 -0600
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B3FEmU3011667;
	Wed, 3 Dec 2025 09:14:48 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master][PATCH 1/2] linux-ti-staging: Remove unused EXTRA_DTC_ARGS from kernel args
Date: Wed, 3 Dec 2025 09:14:45 -0600
Message-ID: <20251203151446.3889979-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD8:EE_|LV8PR10MB7822:EE_
X-MS-Office365-Filtering-Correlation-Id: adce1f31-675a-4249-eeb1-08de327eb6f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?J86TDkFXj8JMJC+uvYXK/GO+Relx3KrljjeFDBjVCKb7pXqTRXt+Zubi4jL3?=
 =?us-ascii?Q?3MVasfjBdu2X4LWuluNQVS7Ecx/ldHsQGxCpA9lf41MVWy4H+YS72GrxPGLy?=
 =?us-ascii?Q?YWIaaRYwNjSiMp1BZpF3VrZh6RepAa3kIqBoozk0PW5QbzPwKEkpoDFkKdW1?=
 =?us-ascii?Q?BPUw354mfTlwze+u7tUntajiIKDhst38yxDxn42ODO/g31BEbKn/KMd6sTRK?=
 =?us-ascii?Q?BpMiD6dd7KvtHeL4N9F3Fd/XMigfHRxa3sZx1kqFDYunGPdRGnfVn1OoCm40?=
 =?us-ascii?Q?eFDXlj6IIAzITjL/I0TTssAIj+ZCzg3obXvvj+ZQfLyjq5dYCG51tMIxdX2A?=
 =?us-ascii?Q?Yedof9ZJ3JokkFCQ4oTnfSPgkwwoz3QjUyvX85JepryIXRWAJgeiYHnJeHhF?=
 =?us-ascii?Q?ZzdEOnuY9Jd2EJu1ru1bB3AS5JP3mq8x4ke64A6ou+pEHuj+kf7Nl0Vx9ioq?=
 =?us-ascii?Q?oS0bJ6C2WtqtfzKgZxRP28gZI0yi2zUll0g6BCJ4rYKsgQbD9BdooVYx6NSK?=
 =?us-ascii?Q?5rGeI8LF5BmlgIHbGKW6m+oakFmdUMfyvRu5mrmTv+vfP/QKwFSsDJGf9Pj4?=
 =?us-ascii?Q?mcUX9CrZ5clA+WtI0c+UIlXF371yGG1iqU03ioK229wvg0KItHFfIgfMGp3A?=
 =?us-ascii?Q?gzgU9Koa0vMvV4QZEqZi8mJWMgAcGCHx+bdi2wWaTKWGNFiJWbbHbdO45uR0?=
 =?us-ascii?Q?L3NjU64F1uXbSM1oq3+jKIo6oU/zseemCIKX9PRkU+kzjl4gTlXssVWPPiX/?=
 =?us-ascii?Q?T0k7RE4epRS7Q2YU/Lsy1PWGdW/AxPEdQTh8pfspZ2kFqw3ZEVD4hkt9fNfx?=
 =?us-ascii?Q?IpRbxYArMalD9BLmTy4qvMHXBxmypgWcmDYsCX86FaFttHqM5gyHiSG7hlbs?=
 =?us-ascii?Q?TSzpGGzMg5EEjCPgKIIW906XjYur0jLrJFxjP+3tZ8dGuxkVLYHyZptb6m5i?=
 =?us-ascii?Q?W8Iw1NmJOq0fIH6D7wjeOOgnFWmwifruLl8l08wd2aRQCm6lrGFQTGmBhx1L?=
 =?us-ascii?Q?BIXZ/cSaN9FWfTDQm+oKTegamOxSl+YOr93rLaIxSNROIxn94ocIf0FuLjRn?=
 =?us-ascii?Q?rvbQu9hna0iqtCYarlCI03nSteFMTEcc5mQCzej8sbU+4J2jVI9ilvy6mLnc?=
 =?us-ascii?Q?xLwznQEbu3nCk8nw698JG3C+dKhsCnWImh2OlixDKvgUvRssqO9KTGoPpa25?=
 =?us-ascii?Q?vulHoXJPO8j5wOIFJDV2iJLQ1lA0N20dwPSfjN9siOTNGSge1peQaCaFvZ5t?=
 =?us-ascii?Q?GPEwWdwvU0c1V0r9MtO9Zj73BxuPdcvcLXpJEc7g7/LjhrFISKXmq6GhqWso?=
 =?us-ascii?Q?QG6TY1dAsBZTEBjbd8eF/+/ag1wYEcOA5fJbl4j0CHYGgjfn9SPPStPt3uAG?=
 =?us-ascii?Q?+USDGd50Q5qkpD+ClLIuTlMaQt+TWqsPuUtxV+CA5k37xsvDz4dVP5Kp7ty9?=
 =?us-ascii?Q?MjYjEJOj5gAu88+zAeb9kabRa3xfQOIk4CIBygGzuJGaWKVvXNvLrRzochLg?=
 =?us-ascii?Q?oKKvug2nfYIgU2cMfuhO6bQ3ozFq4u/E0IBwOZCvRO56pEpTL4UMpfs+ynoP?=
 =?us-ascii?Q?yHm9DDL1mT62WV+aBeE=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 15:14:54.8853
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adce1f31-675a-4249-eeb1-08de327eb6f5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000ECD8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7822
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 03 Dec 2025 15:15:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19325

This is no longer used anywhere, drop it out.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb | 3 +--
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb  | 3 +--
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
index 92fb1e6c..180a5d92 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -9,7 +9,7 @@ inherit ${KERNEL_BASE_CLASS}
=20
 DEPENDS +=3D "gmp-native libmpc-native"
=20
-KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT} ${EXTRA_DTC_ARGS}"
+KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT}"
=20
 S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
=20
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index ba1e6ed6..4dfdc42d 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -15,8 +15,7 @@ DEPENDS +=3D "gmp-native libmpc-native"
 # Look in the generic major.minor directory for files
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-6.12:"
=20
-KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT} \
-		      ${EXTRA_DTC_ARGS}"
+KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT}"
=20
 S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
=20
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb b/met=
a-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
index b6d882d8..9acc95c8 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
@@ -15,8 +15,7 @@ DEPENDS +=3D "gmp-native libmpc-native"
 # Look in the generic major.minor directory for files
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-6.6:"
=20
-KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT} \
-		      ${EXTRA_DTC_ARGS}"
+KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT}"
=20
 S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
=20
--=20
2.39.2


