Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDE1DFCE07E
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 13:32:50 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.70038.1772112760897367080
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Feb 2026 05:32:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=mknFlaJj;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.62.53, mailfrom: p-bhagat@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k92x+a3vCjzA9pLSPUwwHh9nuw79RtnFVHgANIVbTj5lBKTbbPLVgRUdThhKVhwqjgBL99Iujir0Bd1b/PNDSSH7Wf6uWKACH8nNLJSIgMG2HJOlyztFjOOIoMj4M+9lt/3GcM8F7tXWZJnNzKj2Z18lIL2PN44K1kRtMNwZ5/3ZbY7pafVmCfM6awZn3hYzzqJsXuyJ/4oT3s2YGlMH6hHyaEXPjWbkdamo7GLXxq9J9OuAlEFrN6q8zz6GXp5zUkcsIOj7dye01Rxjjs+2d/pHrx/SEehWJu03qmTsT23iGlUac3K197WMIbl0UDbk052/Vvp/kv91wP4EcJrh0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZQwxT/djt2SHYiW3xpsDFYrG/M6kdFXqQP5dYPqkhE=;
 b=nN98KvBdVwD2KlYLkvqqrEkNugM/7ee2/nbSxh6ytAUVeX1hHZnbW9W4qX2Hiht36E7WKUykIfL4yUgB0fDxotD6WmwKs7emjkMJmmc+YJC38rRGqGvkgUFPbuSfJmyfXbJBv0SOZNXSAgBI/uGUsHJk5sPHP/bDzF5sd7tg4NYk9Y54PoTSvPYdFE9WRQhTJ2NtvgtTQFSkJm6I/sVo6GIo8wB08zI7Vl2ob8PFztaRvKKI39xWgMWycVy65Bqf0nBCkxBakdJliHvCPMcpYXz7ktBVLaZsSWu9g1jbzEFfRxBEv8J45bdXYORNV9xBzICq5+R+gyLniGEzUCZyKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZQwxT/djt2SHYiW3xpsDFYrG/M6kdFXqQP5dYPqkhE=;
 b=mknFlaJjDHnbkSCf7X6BrgEXdX9FH+7YPaJsy4gqoc3V2+4492WpwV8rWNr7c2LkHLD2FX1lNLSBv4mjECBl8eYivsDGUE1EmP7CPwKXf7hZhNpsfYiomwBVyphFa6eaAhApQD9skQdM9cQs3o9ZD+oBgDQk4EH+88wLuw/rfbY=
Received: from SJ0PR03CA0209.namprd03.prod.outlook.com (2603:10b6:a03:2ef::34)
 by PH8PR10MB6455.namprd10.prod.outlook.com (2603:10b6:510:22d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Thu, 26 Feb
 2026 13:32:38 +0000
Received: from MWH0EPF000C618A.namprd02.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::7) by SJ0PR03CA0209.outlook.office365.com
 (2603:10b6:a03:2ef::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Thu,
 26 Feb 2026 13:32:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MWH0EPF000C618A.mail.protection.outlook.com (10.167.249.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 13:32:36 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 07:32:32 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 07:32:32 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Feb 2026 07:32:32 -0600
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61QDWVwm2431187;
	Thu, 26 Feb 2026 07:32:32 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <v-singh1@ti.com>
Subject: [master][PATCH] conf: am62dxx-evm: Package k3-am62a7-sk-e3-max-opp overlay
Date: Thu, 26 Feb 2026 19:02:14 +0530
Message-ID: <20260226133214.540583-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618A:EE_|PH8PR10MB6455:EE_
X-MS-Office365-Filtering-Correlation-Id: 92b85d0b-ede4-4fbc-ab5c-08de753b8153
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|34020700016|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	TPWznTecw8F7ZxIxRgPSWspGYSXk73x/jda8fqUsDxLiCT4zirsZxvEIoYJwCej9CW7YHyibf+fMhXyTRfDI748StQuIjrZ6m84U/aDcl9Kk2VIQdQeWCATOI0YVgFm4sRHgShfMLp/psrDPLfriONhHfnvzKRv/ivjoofyGPbvlWH3j9N+MEZWiXpzgviSPE2H1QF103NH6cPsCO4pc545K03nIUX0XWivbTaksHJyNBKqxRcURJ8omcfPBxvzasiyL/kz614DTgt8t5aSk/921Hmn21uyLs7FEHAfMz93F/MJ+T9mczHEZZkwQTUJN8dQkVkkaMYuAUsNsGSgXpXpuVhnc1KozeR+O29khoc4hWJbpJcxYvK/2eeL080YmkSchg6eInvT8Vv4jOIzdPfKnwCBJYiO+s9dL+F5UHlGNsxQ7mcxQtEGbXPvqDsIlZ/OfpUO51vXIcD4mL5syPdg+qE/4ummjDD1kM4BULM8DR6VztKbsV9iRvTqf6XJ20IuIZdp7u8vGlSqhQ41uyaOGsqiEG2zioxRVpavhT499wvRt4YH/X82YOi5XKAeEugdiqGESX3PQCkIBieMHyBztNXTLY448gu4zVCnlPr0Chyn9iUTnpkOBdkPHrbkiDhmxBUadC2T2Jg8RZRwHC39r5Sx6If7VSwITOeMT0zPrlbXKhWdUhLJvedThIJY5KgDksPNqjVzoQbN4vlZRbR5c4dXRNiVm66DtT47R10bna+1c0rDQk1SrGW7iITU0mTvghqs9Qj5SsAZHg5Vz5AztwX13P+gVdWEQYWVSYE9F7ZHORthuw9045oTvDj7Ner9xiGw2JHkqH5gGKCsgpw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(34020700016)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	+yI3qqG1JOHtmIa8vqqzCBNUW0qzMTBOhFHtJOdWI90/ld8F5ep5X6UwOdIygVHBbq1Z/ieroFHNEmdmpf2rs25dSKat55Puwp91pLBxmoYHJUrTq2/sfrdmt4rF/1aI050XmHXegNNzoLFqn4DEjNA/Ucx9uWaDKrwKmQmuBu5bxDEZOtn4cC4o5K52Nv9DHFndxLgMzE6M1AH7w9cV6a4eNeuXa8NnEgjuVO/GZ+lukL841lDyvHBms4Hq+ujTsGnQtgNCwWlnXIuv9FXenwo93umL0U+Vm08OcYkfVr3h+FmR27Nkj0HFaozUH5s/q0FYcnCQGDl+d/1PlTaEqLL/SzmvDQY+5qUrNyE8tuPJqG7t3vFq0STjWWq75WvetHlNAUNpTxUmVyo/csf0AQqDp75MyfGjlKoSv45674QHqp0eCzxL98SL+frl48ke
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 13:32:36.5126
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92b85d0b-ede4-4fbc-ab5c-08de753b8153
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000C618A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6455
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Feb 2026 13:32:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19617

Package k3-am62a7-sk-e3-max-opp.dtbo for AM62D2-EVM to configure C7x DSP
to run at its maximum supported frequency of 1GHz.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 meta-ti-bsp/conf/machine/am62dxx-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/conf/machine/am62dxx-evm.conf b/meta-ti-bsp/conf/m=
achine/am62dxx-evm.conf
index d19d4790..ef9df2f7 100644
--- a/meta-ti-bsp/conf/machine/am62dxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
@@ -9,6 +9,7 @@ KERNEL_DEVICETREE_PREFIX =3D " \
     ti/k3-am62a7-sk-edgeai \
     ti/k3-am62x-sk \
     ti/k3-am62a7-sk-rpi-hdr-ehrpwm \
+    ti/k3-am62a7-sk-e3-max-opp \
 "
=20
 KERNEL_DEVICETREE =3D ""
--=20
2.34.1


