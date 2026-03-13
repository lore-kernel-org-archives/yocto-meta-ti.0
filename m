Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39CFE105F7BC
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 15:24:05 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18448.1773415442732628227
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Mar 2026 08:24:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=KJKDRFQf;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.22, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F4I7CdCBqLn3pQvOGqq7vp1LCmmUs9/lRhtG7ZIu2253uUcmFLkjmNSb0oVUnVoaVOkfzFw3ZAMAc07LajigzBWNNK6qz7KwDNGcMdGwI4OMDUnaZuX5jKLuxrCJtGH5TsrdCiNmX8qiV6cY7Y3fVK82TG3JeNtA3Gl4zhI0krYKiVfDOSBah0Z1Vgzz9UqE37tx3hZ3yxGu7PXSMFEq/3vUEc12bDQu1ifypMgsCYfNuYEhXsPsPtzMQCU2iG2Hsr5MmOgYfs5zVnxSbGdBTeMHgSj1N1xCOvj6rLpkEHhVXumghhRzyfcPVa++lHiv9yBS5GV7HMZ/oeyp3s1ckQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2Ze+JLmyFsQSAbCpp1Xs8pS/vyswzjBQ11jFMLMt80=;
 b=gWcBOojB6QUnTVDe9MqaEX9Hhe0SXMHouS6i/WKET8RfW993TXGxDziq4qKZAxo9BPT0ZxkpYSAP/kTp7M2feLE2R563cX/NekGN98VH5jaOm06abDJ+Dl6/ZF19tbBz4/3w1l8b87kNk94R6U+uma181qJJZ0XpvuWj4h7arXodaM4CZkHddCUagDp/AaLxM+mahZNUntq17OfHibBm1HzrlSGXT4Iu3OXSt55HpW1E8f8GN7QQfjRjpKgDe23QXE+ie2kSg8wpXFE2VtV0gYYlzUk+2dPhBnf6u9b6lwt7cp9veABeTVKeapD0sxMupaSWGu2NWaqlOWHeUUWKlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2Ze+JLmyFsQSAbCpp1Xs8pS/vyswzjBQ11jFMLMt80=;
 b=KJKDRFQfLJB8TPmvJVyNg2aalBenkQNmzvnr59xLa2NWNDx1YahF6vwnil5rXpzYdgrnMnKgd7fi9QSDcyJL70eOlEIhwvSw4Yd/2zM7gZQr263eI/BbvtHUCpLeTE9z4/lJ+eNHfLYi63TyVbuHxUH6S6xQN9h2YPbojCrXh2g=
Received: from MN2PR08CA0002.namprd08.prod.outlook.com (2603:10b6:208:239::7)
 by CY8PR10MB6587.namprd10.prod.outlook.com (2603:10b6:930:58::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 15:24:00 +0000
Received: from BL6PEPF0001AB77.namprd02.prod.outlook.com
 (2603:10b6:208:239:cafe::23) by MN2PR08CA0002.outlook.office365.com
 (2603:10b6:208:239::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17 via Frontend Transport; Fri,
 13 Mar 2026 15:23:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF0001AB77.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 15:23:59 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 10:23:55 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 10:23:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 10:23:55 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62DFNtTG249250;
	Fri, 13 Mar 2026 10:23:55 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1w14Ml-0000000FbsO-22ZV;
	Fri, 13 Mar 2026 10:23:55 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] ti-linux-fw: Update BRANCH
Date: Fri, 13 Mar 2026 10:23:55 -0500
Message-ID: <20260313152355.3720509-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB77:EE_|CY8PR10MB6587:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e6d3f6c-0216-407e-ee1b-08de81148d12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	rSzhmdCG+XjdFEW2NNCWkXkiEnMpN9WuiPk1FBs6EJ5B2JwRslJGfLN/CVYVCSQYnzsmGD5vRQnusAhxBImVS34dgMLnhbUhj0dQ9GgOzDhe6EM9qG5ZKwqDprAXoKGodSSAsKs8lg76jgabByMwNDKZuyuzA75eXDt/nc6MBKzhoqnED3nlB0xkkL4LTzVejkTYdP8YZDRfmH4aLwhCx6sV8IQkBgmLQGYZ5Id0ah0wB8VtmTFQibTkqZHEuZPLe9YOrlKWImVqe15MTJluLKiyAG4GxAGiYGVb//muGjJBQXjNVJppykNUXCaAlKm1ClcLoLjTa+eWiCTk8kNWa8XZD1I7kR0wd9Wpi6AEn+4hepgMpVYcJZWAHv9cDK7m4J4yf43kMN12EhwUpUlguZXoZwfhEweuKFDqP5e+8fjtFCDLoRD2/QWVC9g0Y0LXRoHpOjsg8OKgZu67RHTNFnsVLarTcV4VhBjFucJvZG5jMwxhSvPm7owZUM7FVZPZ7827KfKe1x3fJg1LWNyzFHj0VewPR02RohrUgFFAr5eLHZEu9UAaAJptnhsUnDcSu9x8Ju2ckelq938L3J2MjhgC1eAcE3jtEGd3dS7g5WBWf8qMR6sLGkWbglIcpHgOTH8Fsrw0vU9MItbTBx+tuaf0V3deKXwHRIAMdeETYDXnB15Hr4mz78+E5Lb59aPrOIAzrFUfUocJB/OQ91L86bKwl3RU5V4mZ6Qt3AVcmV46mlcNxz5R7W5Zff3WI9Eq8vFpkzYANMLYWsLffx/xxA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	AC4JlDNFpZY4V7GD6z0DnSIpINaIA3GOUR6U26jK1/H+HmB4AWV7aAFWwDQsLrnoSVfxUNfb3gkbwD6fw6mYWvcmFBLOV139OQEYbQ5qHedMZKkR00MvXe7o24Pw2I1W/N3erbC3R6M3HPFEUZJ7GudJzaD1qArgclsN7ho+V2F30DLouOftU7EueXizhvniYOdVWjCN0nmY7gGXvX11ZU6cWGCHYlGKXXeTgjR+IBK6NyKRa/sq+Hij40EHAOOuZik7gGlMFiVk3Fzv8C3j4GTg8wcQTScLwB7Gb5Ycy/IMQl8C2ECIY+P88flcCckq25r8MIWT5C9I7k8AVrOrDGBpZDlKQgb1gHjwGA4I82QUzk/soAqSFoBXVkG0/roPswfRGm7MS4YnOuXnb3t6rk0hRrVVVD1psE1tZXfZYX6nXqrlcvIMNwBuBpYRxB/P
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 15:23:59.8195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e6d3f6c-0216-407e-ee1b-08de81148d12
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB77.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6587
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 13 Mar 2026 15:24:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19712

With the move to 6.18 it was decided to start branching the firmware
repository.  This just moves the branch to the 6.12 supported changes
for scarthgap.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-=
bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 51cd27b8..1c3ac858 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -25,7 +25,7 @@ PCM6240_FW_VERSION =3D "1.0.0.0"
 TI_LINUX_FW_SRCREV ?=3D "8ec0c42b8ccf2c9e8bebfd7c4e03d93fed555442"
 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
=20
-BRANCH ?=3D "ti-linux-firmware"
+BRANCH ?=3D "ti-linux-firmware-6.12.y"
=20
 TI_LINUX_FW_GIT_URI ?=3D "git://git.ti.com/git/processor-firmware/ti-linux=
-firmware.git"
 TI_LINUX_FW_GIT_PROTOCOL ?=3D "https"
--=20
2.43.0


