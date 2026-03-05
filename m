Return-Path: <s-tripathi1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EF63EF8FE4
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 17:23:14 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49787.1772731392785791116
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 09:23:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=cvVI5mmH;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.56.18, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x8mY+YAaqDKlYA4QWymm/he0KHGXbhv7iT9N8SsJiAokaPOjIZxWNh/PxRsHmHepwxTgOiuR77LJ6zyRVIpoptPHORtx4B7F/tAPpF0Zjp16Wxp+dsCVIzJO4mZptH/jNVlSahNVJOLMNDix5luL9K3oVliIfrcHzCmiUuj+gyeSS8LTlQleomQXaf440g+Ef/bcf0Hj9qeC7MXfIfloABClypnxUoDLal1if/CFRW7FYS9ziXQwKVtE5481ld363NSx3mHrJMq4QMQeOyEMVUhDFKpHBIRTyqQmz5BrsySManx1RkxmIl+dZIcfNkvs2+6mQ1dPcDm8OKQ3eP78IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHWZp+RfQoQhhk6gDEFyNsTjqPfrzNTxxKJzEQNDfUA=;
 b=Z8GYYABHBj5qDDRNnDD6rF6nnL+MYxyUjkua2aaAKA9+//C6AeIMTABcvBIwz+Bp16WmyzdY3//KBQ3BCy8HCYZ0JAU1s0l63HbUuah8WwaLxxUYqKifav90UbTxDFFucDFU/hihRnPjp3dMJo/jy44DuxnbxcgqgZQ0TLfOEL1lrGweUo4m6OiD62+upFaVR8WJ1TllDco7GB9m24fgDATpAbIadwN+FoDxsNl0l0iB2OgZsc7bhFje/Jr6gM157ua8fQaJRB85O5wPEMrx7pjf9Ru01NLXPYn1pJyGWl78o331h9jbYglYIejsao93uQYDX3ni6CyrKZxF6sSjUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WHWZp+RfQoQhhk6gDEFyNsTjqPfrzNTxxKJzEQNDfUA=;
 b=cvVI5mmHNpRb88fNAtLktl1oc4zFJgUNCIYYYqLpeIdbwMq4ULFLuwmQN1mmrxjR7dQU+dt1a+Pp/9XTOhlhNpms0uYDfwZBaACKA0d7U9faJsn4uKIu85mFRRMnNNzqzSIrXniis3jyuSJsEAm3DAP8F63k1vizppZfujxxFlU=
Received: from SA9P221CA0002.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:25::7) by
 PH7PR10MB5771.namprd10.prod.outlook.com (2603:10b6:510:127::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 17:23:10 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:806:25:cafe::ae) by SA9P221CA0002.outlook.office365.com
 (2603:10b6:806:25::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Thu,
 5 Mar 2026 17:22:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 17:23:09 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 11:22:29 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 11:22:29 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 11:22:29 -0600
Received: from HP-Z2-Tower-G9.dhcp.ti.com (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625HMP5j2744974;
	Thu, 5 Mar 2026 11:22:26 -0600
From: Shiva Tripathi <s-tripathi1@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <rs@ti.com>, <jcormier@criticallink.com>,
	<praneeth@ti.com>, <kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>,
	<denis@denix.org>, <vigneshr@ti.com>, <s-tripathi1@ti.com>
Subject: [meta-ti][master][PATCH v4 3/3] ti-core-initramfs: Add luks-encryption trigger
Date: Thu, 5 Mar 2026 22:52:23 +0530
Message-ID: <20260305172223.3684445-1-s-tripathi1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|PH7PR10MB5771:EE_
X-MS-Office365-Filtering-Correlation-Id: 923f3812-be2d-43fa-ccf4-08de7adbdf0e
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|36860700016|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	U/ADJB7t2UFIJY1PsRXusszHpzTR/+snRhSHE0Pi56SM1BdGW/iLHZrGMDYgqTEY1bCHd9WI6Tz3KQA38kh/zIJdkmROTVRWsXPkvTWHpDHO+uP04JpKHXOl7v+RKo7Ib7SxaGV8IFF1FLnJdcxpLABJ4bFjCwDwC9tIqOHrHQWWYZ52WJfgQU0Gfy/QEtW0xQn+EbpXBamIrTkxJpLXLjgLXr7rpkkxl5mAH3Pzxr0XJI2vFsx3LhE0j+We5fijEcw1NHF/H109qVLY/V13bH4dmtYuOk5Me0WpOAS94eXjERpGK1MbckrJ+zstATohChBJQ1vQX4YqQl60rj9zQ/c3J4QkYq4sYZMpzzxSZFIiQPXuldZpmnE6Fc8v9GDpbEtwarMHfFCl8ANEsinoBi6QTx0cX7oTmE7OtcV+e+Aux1uzGz/hZyrYod2VyUfNlec/sRAZ47rxR1hy2EpvqR2SZ0O5lKvC7mw7dhl68t+SNkyCk9zXxj2DZU9qoSDQ00EP+yMxWC3iUmMl6R1QA3dII8qkYObqTHieWjCYV+zM6NAoC2KgveIMY6FiI82RFG9fY+9MohA38J4zxbjCEYMVdfFfOqc0I//I/fQAElnAAQ89E+l3OTsoOm3V5/TBAERDQmcE2AfyAjpF+95bLK9nmGglbMGszUANt9QO0D5PzFEcQhE3iXe0oC+JOdQxhv3zMDNjCMj7vlq9IWezpp6zmbJICjMVNU7HU76CJFM/CO9aAfiAqoZXrikDzHcMQHB9o4568j9+IRI7Ec1jCg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(34020700016)(36860700016)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	2Hau+UFwEyeQ06XwPlVG9RRGm38JCUJQbQa3+tT8FrpvwDBleO3bdYeLJP+hZEZZ7nKb8ajntg5KoyTBaz5tvJ8WK+U8OkDeAmxYvBqQcZjh/HQTtjjVMXVAacs1MAyS53xmXjkzbmsf5+EgwpYO++JcFFpPOTZRGy2A8aHwjTUg8uboOLUn9wohWL+sZrLEMa5T/IzhbHG2W6HggfFNdXnOfoddLssghXwcC8lHZSungMmknTMRuVI4D9/fqaPY/kiOUOywHB/6xLm1hMgxih8KAimnWjb3Wbv6AaX0DQAWxwz4yH7dM0LFdq61povEPxGQqHpYdD5G/OHybT8aEFcj1UhABMUwFEIh3Sr6klHKGHsT9Z/H8Ds6Ob2KO26U29j86lf5pQPlS+q8oYRvlNUp4N1Q3vPDfvp33fPSMytRgnzNS9sRmLofON7fYmed
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 17:23:09.1194
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 923f3812-be2d-43fa-ccf4-08de7adbdf0e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5771
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 Mar 2026 17:23:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19657

Add luks-encryption MACHINE_FEATURES check as an additional condition
to enable ti-core-initramfs generation. This follows the same pattern
as TI_CORE_INITRAMFS_KERNEL_MODULES and TI_CORE_INITRAMFS_EXTRA_INSTALL,
allowing LUKS-encrypted rootfs support to trigger initramfs creation
automatically.

Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
---
 meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc b/meta-=
ti-bsp/conf/machine/include/ti-core-initramfs.inc
index 9d3cc612..b874a197 100644
--- a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
@@ -5,7 +5,7 @@
 #   TI_CORE_INITRAMFS_ENABLED =3D "0"
 #
 #-------------------------------------------------------------------------=
-----
-TI_CORE_INITRAMFS_ENABLED ?=3D "${@ '1' if d.getVar('TI_CORE_INITRAMFS_KER=
NEL_MODULES') or d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') else '0'}"
+TI_CORE_INITRAMFS_ENABLED ?=3D "${@ '1' if d.getVar('TI_CORE_INITRAMFS_KER=
NEL_MODULES') or d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') or bb.utils.co=
ntains('MACHINE_FEATURES', 'luks-encryption', True, False, d) else '0'}"
=20
 TI_CORE_INITRAMFS_KERNEL_MODULES ?=3D ""
 TI_CORE_INITRAMFS_EXTRA_INSTALL ?=3D ""
--=20
2.34.1


