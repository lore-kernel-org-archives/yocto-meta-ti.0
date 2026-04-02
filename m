Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC4D6D6AB06
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 20:00:11 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5055.1775160008355978628
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 Apr 2026 13:00:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=uKR4V4yQ;
 spf=pass (domain: list.ti.com, ip: 52.101.56.48, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jwz85rGcUCXYUxyU6sEfrDIX3LeXDbGDQrreGsTFtLSCLoKefu3FvbQ9Flw7gzbarp2kv9cuoBbZIJ1fFnPJpSNI1Xeq+fwmw623TZWFqiwvrfkZHY0CYq923o9yvXF72BjdjuMQIUUA56hlqtLO7YF4ErNJT2A++mdBxNxzigrxX9avViPRTJnOj2IiDvrF+S2Vxnm45Z9o/S0XBpK0CL2LGlQkkUHwqKybY524q+F5S8G88UBN0iie0PlKVstLaoSvT8vDu3eNJ5z1DNA5RWNnT0oAbThV2cvnE1nhVh0zPN1MoprVPA8RkZb2tvhZk6x3P/Ae04/gL+C4cY60qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nux3pJgaRr71gOKyM9x7oesbnsgPwWjhn1UvnqbFS6w=;
 b=N3YWEVcefjPgSEyTTxDdRnBLw2hDyrmU0rveaBzALcujZcKgxRPFPqAZzfmn8F6TpO/6ywUXkMgNX+oh+ZfNdYh6lI5/QTevcVFJf5cwq/Cz+LLCkPF9YL4ft39fwfUWLOTiKOt015NAcGkpUGL3Ma1tRMuYtyLjLEj52IK69ocyDEjbvJGeOyZSOHl5OL6ZZMgW7lS3+nMITNdiKoJmRQ/vl4bOWfThrtHnfTaZIg8aNNrPcuylAejqjReEyJkreK5XLcVkJU1a8lwpr7s89/FShbdnd22/ZhvGyzvS921SGfBcdmOUrP0uOL671d+wM4iJxyNxfBKYBEhY4XN+fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nux3pJgaRr71gOKyM9x7oesbnsgPwWjhn1UvnqbFS6w=;
 b=uKR4V4yQrQnT9Dr3UJiyx2cCfERouTwFoM/IJbuZCznavCV8z+BXlvYwep3eMoM9HCyVIBUxrVAD+6W1eoPHIl2IgbOsKOtuao3xQY37iMTR7JI4sK/1vFdY2GySOqLYEPK6P86G7WjKDMObMHeFKX9Rm1ja5X7K4gR4nX3IEhceWe1bCFzsyvXkzrhBPxqF9ygtJpZIUzq10xMg15pxyskLmgeK5b5SLSzt7uMDcvDwDi6+7TgsTRyvBd80PzHvq62ThF4UGNv8fuDwQTK2/puNo/9Qr2VEuZlEA+cnfILCB/ik1/V4T7ElntlZxvGZalKAa0sGSb92wRIM9VaHAg==
Received: from CH0PR13CA0020.namprd13.prod.outlook.com (2603:10b6:610:b1::25)
 by BLAPR10MB4930.namprd10.prod.outlook.com (2603:10b6:208:323::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 2 Apr
 2026 20:00:04 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::f2) by CH0PR13CA0020.outlook.office365.com
 (2603:10b6:610:b1::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.18 via Frontend Transport; Thu,
 2 Apr 2026 20:00:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 2 Apr 2026 20:00:04 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Apr
 2026 14:59:33 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Apr
 2026 14:59:33 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 2 Apr 2026 14:59:33 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 632JxXEa3699822;
	Thu, 2 Apr 2026 14:59:33 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id E98062A67; Thu,  2 Apr 2026 14:59:32 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202604020811
Date: Thu, 2 Apr 2026 14:59:32 -0500
Message-ID: <20260402195932.2018318-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|BLAPR10MB4930:EE_
X-MS-Office365-Filtering-Correlation-Id: e7dee4ac-d083-400c-4237-08de90f26ec3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	4ITDgZlR6vhNb85f/X8aFjScrzVTvvQT7Xa4+fxdRLs9KeabqGoHxGEJ8Jloyvs6aRODfWRyr3yQn5RRn0u53+8xjaUdWAaq990UN4IyXAeDxhDuSYO5QKLmt3l7ev9A7+7ETeiqHgxbH84TgfNmaRKlX9WBR3tg0zBT4OkOQ3jJCowwQ0lq68EmjXumm3JgtGBo9ZLM1JuyVYBuoN1iC/lEbxwj1JzspzzQAoSV1Iylx9KN0kHQSnt0mwruL/qMhFC1PBO+Y5yfd3t9sA/90kAXjFoSPB8sRRFQOtsYCTjzGvMKVEzRicUFIH/bwpnrTQCiwUpECcp7PahbtBpjDsKL9q6EwKOZIsJ53RtftUzYGX8mB9STHCiRROJv2guZ+k6PgwLzBMbEaXqhPbuCmyTnAt7ETHttNIuHuhRbHP/VlfIeiAYlce4mkXymlRDkQGcby+v4QiahQ+ee+zFg+x2U+LGpzjMroyQfEaNhA78BPjfHCLVG12xlbp7iuJzNV4kLtWQevraatbuj/qk0WlD1cV9twRTxeYyQEfzdJYnc5xedDfWpTdRGr3Uzim5M34v3Gb5+BBX9WaWmFCbUM8LackKeCblt5OD9o1hre79oaR6kZbbSPbpyE7K4jHBsVzPqZ+NkXimU2a05qEXZdgIE8AbJ4mSshOefCPL1qid/EyXPcpGA1AG2xVwOG3Lvag9RHSSQDns13gTTqb7rvH4dX1X4crKs6xlfbqum+uRH5ZKmLEJFi15/IkTRgeg2Hrl6Y4Ct3u3dZrTrJFd9ig==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	mFBFi3zSrpDc8BeKTiGdi1yav5HhhSiCJq7oQkePV8UCHZJccETBW65xmQ2M+2zdTHz6dUcF8Hzy6sqWjmFviqhSKOaFxRp5H9j1ULP9JM4DwVEiqRzk98Gdy6n4XhMvbemKuXsYJ/y/vHs8opGlCXYiGdzMHHalFC/bbVpo2TD9zxmd3zsftINLsRUwDJ9L+wxXDbqoLfJys2ZtYx6IyJAQ2n4cIkobCLzFheCJLMrFvO562QVrZSPC5oZFPhWm3sPykiG9PjYh84mqMi73RwwyNUDuAGbSnI3lrQEF1EBOAVQ7uomS4gKMzaexW+4E4UFv0BaqMcCRRXXI/+jhXTEAjdtSw9RDz2qtCRyKx0+WBAGc3BSoknOKHuZaom1HPhJU+oqhG2+n4FFIzRnNrrAodfsqi+YHM/IDSb/H4hwEq2wrF3LPRub3RCrfElb8
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 20:00:04.6915
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7dee4ac-d083-400c-4237-08de90f26ec3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4930
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 02 Apr 2026 20:00:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19832

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware=
/log/?qt=3Drange&q=3Df323c31fcfa11b5097cc99f8340b909e8ed6b9fb..946606d906c6=
a07ff844c1e6f5451cbace08b96b

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-=
bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 21b3a155..44c0ddab 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -22,7 +22,7 @@ TI_PKA_FW_VERSION =3D "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION =3D "3.52.00.01"
 PCM6240_FW_VERSION =3D "1.0.0.0"
=20
-TI_LINUX_FW_SRCREV ?=3D "f323c31fcfa11b5097cc99f8340b909e8ed6b9fb"
+TI_LINUX_FW_SRCREV ?=3D "946606d906c6a07ff844c1e6f5451cbace08b96b"
 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
=20
 BRANCH ?=3D "ti-linux-firmware-6.12.y"
--=20
2.43.5


