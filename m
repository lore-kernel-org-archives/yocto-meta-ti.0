Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68776FF887E
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 15:23:13 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13922.1777476189630094138
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 08:23:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=fu+EL/ef;
 spf=pass (domain: ti.com, ip: 52.101.62.18, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JNT80TgwovSJYTTBF3YGmyLLVVRGigiWDsfsBR8VEEVZKSCC224OweDCxg2Lty6sc10tuoclVyuMwxY5jA6fKdqO7QpE7I1pLO01wN5gDb87uFu5diDf25+2MuXr1EDz9+76E/7TmBpG9h3NLwdmUdD3PCbgCIyPK2NKEYGlo0MrzmInY8MtYBxS0jh3vxGSI/DOegwA4usGp9k1EK7MdhnwYTMfn14G11/KP7VU5Xh4kPl1fvjstYZHBbQ8EYENWjkov67AycFSI276b7O7LvfXydQbcooVi0SniScS057501XrRdzINNFnlt1jkHWbthrv0SX2Z3Wbgp1rkWDx+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UuLMChMzf9rzMDzExHP8pZbyqmrENV2Tc/JaFIYCSbI=;
 b=uU2DYYSSwXPU0I2ytY2yC8egtkweCJwzox8djAWtluR1v1G805ppvFrhrzOkGAhJ2wfaynZo6t3IxLA5ZjshQgR1tSvxufyWd+wDL52SSnydT7gHDaVcK1sZEBHK17d1xfu0tPFfyIB8LBMggMJ9k8aWwRK2SXocpAIGkmBRcxbg1C5XpLNRQiz90ykh6IXagA5SdedTNn6CBSO+IMKkZU/M8uIif/XJevqeYY78/gO+L/I1X3a0Bpnjh0vGpYboFjpQGEmR8GEOL0XCwNlSLBzLmiTxtuPnp9IjGWip5ZcbnXfIE4dZhuURLTiUrNeGkYBd0qCwGRUsc6WOE5xjwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UuLMChMzf9rzMDzExHP8pZbyqmrENV2Tc/JaFIYCSbI=;
 b=fu+EL/efwf0dBuA8lkV1NrOKbN55h7VlNv0qa9K+kWC6Sjws2YOneaPNg1SB3/4ZX0cC3E/j1DaqQpWiXnOny6m9MXUEFKZLsJkeTONjMDYI8FGdNnuA1wIeHAskIdIVCh0M3WwH6zx8N/UxGla4kc3IE/XqE4FSFAJrzBrEaVU=
Received: from MN0PR05CA0017.namprd05.prod.outlook.com (2603:10b6:208:52c::21)
 by DM3PPFA3FC49FBA.namprd10.prod.outlook.com (2603:10b6:f:fc00::c3d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 15:23:06 +0000
Received: from BL02EPF0001A100.namprd03.prod.outlook.com
 (2603:10b6:208:52c:cafe::3b) by MN0PR05CA0017.outlook.office365.com
 (2603:10b6:208:52c::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.20 via Frontend Transport; Wed,
 29 Apr 2026 15:23:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF0001A100.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 15:23:06 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:23:00 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:23:00 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 10:23:00 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TFN0oj3585459;
	Wed, 29 Apr 2026 10:23:00 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wI6ke-000000046sG-2aqB;
	Wed, 29 Apr 2026 10:23:00 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2 06/12] meta-ti-test: Import the recipes-extended recipes
Date: Wed, 29 Apr 2026 10:22:54 -0500
Message-ID: <20260429152300.979685-6-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429152300.979685-1-reatmon@ti.com>
References: <20260429152300.979685-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A100:EE_|DM3PPFA3FC49FBA:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ea47d43-874b-42ec-8ed9-08dea6033682
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	81TgZwjhS0MjM1SL/21+kLmW8nrbbr3EIs5IZzDZFvTwec6/Drz21k1P32wFbBQBNpE/ckOu+9bg5ch4vXdMeuRj39XjvtV+f1p4ZTTPgyWgBcQNSwQT/3APH0vcWeJtaN9ctPQPkULd7OSfgCodX0YGcbcZjrAOnr5di0YNtmLIfwBr1CpwRAgERdAG12DoXkNWSYJGOpzHSkmHkg6O3t1DhDVu6aHcxzogMvIt2FLHBbmJvw+YUcfPinutIxCbJa/6nywRNzrj0jQjoftOkGre34SDqwH4lqtELm8OQRWk7Ou1ieJ64qqyNzFIvaX6PS/i2DOMpmAtOIfNQiljwm8ovYdXMpLbHfqDp3HZhlO4ujN66xRC68a/z515EgnlN5pmNRTfcme1n8jRrat0+fCTwpxhQe4eH3tfMnL180lb+IfRyeIH2+0aWsQUzQEwvv4goEhXmEYOGT7KhledxlTiu2Txe0XcLFWXj40E4v7+xNidgNdejhVnqjlYj8v9ag4Xr/rnc/PhRCw893HW4XoEPQdNI3nUPKnJ+KPxsCK2jCwFVzdel9nvN7a/yHk/eJ5vzbVok9i7EH7NM4G+IAUaJGhqRnQD//t3kFRuB02r6O7j8FN4EnBuYGjebrYfqUn5DIbQF9HNy/4ELeuY3OQufOlFhpG/OwcHGjKMeaPPJACHWnslcGzVAorchpnxlPcOpp02RTwYjIn1PfXK1QOvXBRJMHPyegj/vgvUbIqjgGyaywsuX1DZrOPkV14LD+H+lKBXtiun1h8w3WbFiA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	BqxTsw1t7cTwg3eu3UFu+M4jxVM0+QueAzUurxT1BtSYnu1X2PZDDGICH+ZRJDvm5rlqwD/hSUW4JIBeDlIW8PO0IzKjPq3ZlxWu0AwsSgpuKYofJ/nuRQDVnkatH+vwi0vpNT7oNGXLIaVOXsZcDLB+h7fkNwvWnf327GYo0K7ZbGCwXQ5zYrbpUIZWGJCUteAn8gVWMyQ722QWMUrzfegTYLvBQZlvNvAuryiiGju6SsfinO+zLtsQobKfIqiR4Rf1C3L+OHJxS2CL59+s8YTfTmV+kDV3g/scmHvwRByjq1Cuk+H9hFJE+A2g7qNsFxfxMIHohLTkUw7pyxIOaDP8FCHUdgiQWnr1HpjisdAeVo8BqIDAoLroOzFAA2pUfHKACRBgLIe7tOGfD3jk6THIGXUiL0SrYMmSAT/vxiZC3dboWKzT12Ns69Sle7ZU
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 15:23:06.1594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea47d43-874b-42ec-8ed9-08dea6033682
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A100.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFA3FC49FBA
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Apr 2026 15:23:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19894

We are moving the meta-arago-test layer to meta-ti-test.  This commit
imports all of the recipes under recipes-extende.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: No changes.

 meta-ti-test/recipes-extended/bc/bc_%.bbappend | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 meta-ti-test/recipes-extended/bc/bc_%.bbappend

diff --git a/meta-ti-test/recipes-extended/bc/bc_%.bbappend b/meta-ti-test/=
recipes-extended/bc/bc_%.bbappend
new file mode 100644
index 00000000..29d90a9d
--- /dev/null
+++ b/meta-ti-test/recipes-extended/bc/bc_%.bbappend
@@ -0,0 +1,3 @@
+
+RM_WORK_EXCLUDE +=3D "${PN}"
+
--=20
2.43.0


