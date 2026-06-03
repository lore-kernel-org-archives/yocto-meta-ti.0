Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90968CD6E69
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 07:30:09 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.60])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14493.1780471801951263457
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 00:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=AOmSrm0C;
 spf=pass (domain: ti.com, ip: 40.107.201.60, mailfrom: m-shah@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W1a2eWblOOBWi5A4zTmO/FbSXZl17cZm4RasOmPeRN9oFYIFIm7toUmMjU3dWMBoh3gw5vtZwNvDXguVCW94z9EVkcKoWx+6Tc6/rAAERVFPXRir31zd7hm37Vne6BIppCNLGcZsCFVuhe1bkVtIj4PWScRIJf8jUlKiWKVZdV8apWpUUiHH1SXB/xMu4C7auVoFwu3kBh6OiyBUfBU/uifahRoRm5VhVxydGbOKb7L9i67tMyUkZlPHBx2vO5FvLeAprJKk1V8mng9VpmZDXz8wrJoQeSKiiiHBHY76IMslqeZKNfh5v464sQkCk4TBxZUL0mKpF7McCdkxw0TucQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nwgmVJYa2TWx33yNKWeYRHxZEMQwKUYITlhcOlnDRU0=;
 b=JRpIC877vYdt28h1KgE2pG8tYu9RHsvBmIlcCmCLJC4Yhk8ScC2B4914XiAfp4lwz81qh1bB+iRwvvSwDbbm2jh3wGIbUe0qaguMrEJeeCn+AaXYp9fwREIK7dNzG4BPjvunUWpzllvBKzZC66T0vdS1iIwL7wvaxqcTIu3OVZiRACXORxZG+w6Eu9OGJPGNswkvwYEgQ8uQsv7Wl2pc8+m6GNjnOxGI/rZUEcZ63vBX1R/fZ3+rX2eSjcWYpJ2ryfXptCf193QsREiCF+KMtda8FvE4Spvw6bLtNqivMedsCMvxQUazYZynZtadtnZt68XQUlYkyIRPr4nJZgT7AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwgmVJYa2TWx33yNKWeYRHxZEMQwKUYITlhcOlnDRU0=;
 b=AOmSrm0CjMJoJwkXC5l+DlT9YLJLoi8kldUdHF2eNWHOf9GZvuSfUbg18/NqNCS5tdlyP4PdoG8rMWwgESEEXWRhkEtr6PR6w7jO9X5q/yyh+mAsaxOuFy7pEd9z/qiNYF+ZnasHphc+qNHh9bpJ+w03wHE8dMjq9GVwvDuOEFs=
Received: from IA4P221CA0004.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:559::12)
 by SJ0PR10MB4687.namprd10.prod.outlook.com (2603:10b6:a03:2d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 07:29:59 +0000
Received: from BL6PEPF00022573.namprd02.prod.outlook.com
 (2603:10b6:208:559:cafe::51) by IA4P221CA0004.outlook.office365.com
 (2603:10b6:208:559::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 07:29:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF00022573.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Wed, 3 Jun 2026 07:29:57 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 02:29:39 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 02:29:39 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 3 Jun 2026 02:29:39 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6537TWbW737025;
	Wed, 3 Jun 2026 02:29:36 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <nm@ti.com>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>,
	<a-limaye@ti.com>, <m-shah@ti.com>, <gehariprasath@ti.com>,
	<denys@konsulko.com>
Subject: [meta-ti][master/wrynose][PATCH v2 1/2] k3.inc: Add CPSW modules to initramfs for bsp-next NFS boot
Date: Wed, 3 Jun 2026 12:59:31 +0530
Message-ID: <20260603072932.1273938-2-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260603072932.1273938-1-m-shah@ti.com>
References: <20260603072932.1273938-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022573:EE_|SJ0PR10MB4687:EE_
X-MS-Office365-Filtering-Correlation-Id: a7798ebf-4b55-4b2f-259b-08dec141ea4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	hT8VOjW6bBW+lmRYWoQZyQGtLUa/gnrBAKG8rnvG1od6YNb3INndMgnJws/7prhBG5T6GNIBjvkfrKyehlMGLOFUxNootMmq/sx0IaZEu6HnyrzXhrJBj20s+1mYMf+tvQpDFa5+6PciyyVxpyMpZ0nORCYIUg2j8LgY+bMgj/rbMfYwliQt9D8pX9CVnitssw4y2/k6bvGcsfiRyYIZUhQAV713MsbSQapoHNhPNSEXmvE0DIe0FRzBmr8+TpL8uviX3m4AQStHBwDUnmBo9IK0m197MER5+s/+EEhKWBEPku4jl9vwtdhLhOlOUt3P/mq/GxTwP7fOkfYcKCae65GYNYYweiP8Pjuu67vi4/iMPz2im/TkozHVmAkeyXWIUEMe0Xely7DcSJNoOB+mjuYpj1aZSE+q8pktI/tHusVs3mpryX/bVrB/ZCQMzsq4Xg2UYkfabK40ztWC2FWTZb5MG7NSI5nAS0cvmuR+uZZZVwy/+LeRuP5Iht9qJ7nf2EQIlyknfoNQoo15WBsruyLA43F+pz5ul21QDKvqsHvtOmU+cAf+CVlHcq7UjLMCaR1sYY84UHKrKcgWYajFV6bVZmpmEQzaB+ENRawh7V0stA8OtnGOcieYRG1V1ywewKkUVS/s1CacB6ezoCu29wKrLhJM05b6NAtuiYkU+EKXqA3N7qNZmtjTHZTtaEi9MmL7T5x9dhZDvl78lum2BOfsAESDQyfsO8cU9YOUw6o=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	+t881KN66K1rYRQoK7cBeqipcK83CE091z2ThpeLWwBICG0bQtNzd4FU5sFcy2+Y/e8cysxvAGJb4eGnCTggqG0Wftkgh5GqH08u3UIgmYcyl8IUKkPQq7yF8t1GysR/fwobpYEGbRO8VuFrcdjWMpNbZfo9j2wfr8sU8BSnRpI0oBvWKDx608AiwKDtE7R5Z1DFqZthWn26zgogxXQuSaGqBYQNFN2ecHFAFBnEcvlIjQeT/TJ85bioVFJWEzfoM7hUqHxEfdJliOx9hg04af0AcS4eRVqIdbwj8hgCKiTyxj3ocmUklajvA5n57nT60t4BO4M8R9aL0Vr9tvUd6QtHFYlGY0z6DwXoRq2s4bIUdO+CF5sCSHEk0uMkrylyfnEVjmQfBwpB2cRWfrJRi5k+9XT/q1TJlgsXFsEkbQFFe+FTasJYEj+tMEMfbkz6
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 07:29:57.9842
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7798ebf-4b55-4b2f-259b-08dec141ea4b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00022573.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4687
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 03 Jun 2026 07:30:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19959

AM65_CPSW_NUSS and its dependencies changed from built-in to loadable
modules in linux-next. Add them to TI_CORE_INITRAMFS_KERNEL_MODULES so
NFS boot continues to work on K3 platforms with the bsp-next kernel.

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 meta-ti-bsp/conf/machine/include/k3.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/mac=
hine/include/k3.inc
index 6833789c..726c071f 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -61,3 +61,9 @@ FALCON_INCLUDE =3D ""
 FALCON_INCLUDE:ti-falcon =3D "conf/machine/include/ti-falcon.inc"
=20
 require ${FALCON_INCLUDE}
+
+# AM65_CPSW_NUSS and its direct Kconfig dependencies became loadable modul=
es
+# in linux-next (post 7.1). Include them in the initramfs so NFS boot work=
s.
+# TI staging kernels (6.6/6.12/6.18) still have CPSW built-in (=3Dy).
+
+TI_CORE_INITRAMFS_KERNEL_MODULES:append:bsp-next =3D " kernel-module-ti-am=
65-cpsw-nuss kernel-module-k3-cppi-desc-pool kernel-module-davinci-mdio ker=
nel-module-ti-cpsw-ale kernel-module-ti-cpsw-sl kernel-module-phylink kerne=
l-module-mdio-bitbang kernel-module-phy-gmii-sel"
--=20
2.34.1


