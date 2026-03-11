Return-Path: <s-sadik@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 969771125873
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 19:06:22 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4284.1773255973069576205
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Mar 2026 12:06:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=A2MIjGQo;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.64, mailfrom: s-sadik@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bx+N9qJtWnuhzt79/aeJS8ytZcb7Fuugs9teaGdAjHuRsQwkfLUJFG2tMgHoc/ry2AxU7w1PAiyHHmIfFPyg7nnIWvD7ysjRw+Eeo7XO3pL6cmGlU7zxyZc6RCZ6Mf7CnMMlxXA1HX/TgehkIc1z12Fe0WyhZ73dls7AeR/wsX+qCAN5ZQdJt55YosX0IjHLJ0BnEqfHrIedVQ5PwjDXWPbGBvFz7xxrJobKakG8TshjNDlUGEo7sDgEuWXbahTKtuz1XFEw3LmaaerrCDOq4u6O8uTcsiQSWQVR5O0hKdQuRbACp43lmlU1Fu5kHiKEz38zoh8jQS5mCH9rcRnJZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XldSEPXE0zM2mLx2ujDyY9BeDaskxTm3K+2Zz8mceA0=;
 b=eco0NoSHmVBMLE8N03Xgd+IqXTloY+o3g18eGnyTBTFnvZGg+Fv4QDofC1UA1I3i+A5O8s8UuqiIjmIkaoD/+hoFLQ37EPZcmzmjn41KSwrQ5SKL7FFCvZAybw9P++S6v3px0z+fwJ0BRVDmNH62VVA6Bbd0GvPO86w+PiymR1E0DnjykLvoUq16vIJk2niDLCw7zvc/gLVgMWWqXNI12m6AmQSFz7ngrot+f871wcqanBZPgDH3iTBofSXHoXBNI43jio43G610/hy/RUqeqiIELzY+bgR2JFf86qKhRfSCuzvOiVCbGsqifTuEqK2ectVMQQ6B/qVvl56gVe6Uhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XldSEPXE0zM2mLx2ujDyY9BeDaskxTm3K+2Zz8mceA0=;
 b=A2MIjGQoXgIJ+fV6SKl0H4S2TKSz6soqP1HaG2qItvkErhO5yM3V3Z0w9ByvRJ46e4okYci7VxzUmwzV63BnLnPCjcYtZpPiqE7YsreTDl8hjPjqXxNNVZat2iF/7uDWAmsdR+gyMD/3MRBMiiPAx+S0ty9B7t6SRNxg8wTFIBk=
Received: from MN0PR03CA0010.namprd03.prod.outlook.com (2603:10b6:208:52f::7)
 by MN2PR10MB4206.namprd10.prod.outlook.com (2603:10b6:208:1df::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Wed, 11 Mar
 2026 19:06:10 +0000
Received: from BL6PEPF0001AB53.namprd02.prod.outlook.com
 (2603:10b6:208:52f:cafe::43) by MN0PR03CA0010.outlook.office365.com
 (2603:10b6:208:52f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.26 via Frontend Transport; Wed,
 11 Mar 2026 19:06:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF0001AB53.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 19:06:10 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 14:06:08 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 14:06:08 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 11 Mar 2026 14:06:08 -0500
Received: from sadik-PC.dhcp.ti.com (sadik-pc.dhcp.ti.com [172.24.233.244])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62BJ5kpw896192;
	Wed, 11 Mar 2026 14:06:06 -0500
From: Mahammed Sadik Shaik <s-sadik@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Prudhvi Veeramachaneni <prudhvi@ti.com>,
	Mahammed Sadik Shaik <s-sadik@ti.com>
Subject: [master][PATCH v4 2/3] jailhouse-inmate: Inhibit debug package split
Date: Thu, 12 Mar 2026 00:35:36 +0530
Message-ID: <20260311190537.3340422-3-s-sadik@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260311190537.3340422-1-s-sadik@ti.com>
References: <20260311190537.3340422-1-s-sadik@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB53:EE_|MN2PR10MB4206:EE_
X-MS-Office365-Filtering-Correlation-Id: b3dd363f-3b99-4468-a612-08de7fa141d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	SmZ4NdKjlmhnLjlcl2vWWlhmJL/p4DO7pP1mQrOA8imPMx9K+/lv9TEhP5x6R1O92SIx71BTPo5xd+zFqFR6EH4sFAMVqeUaUOzYg4IVN2YUOligiMamvqCklq/d1qIyzb2v2w7KvJ8TOSArr+MyhSu3N1Abu72v+ycHocetAhtJlswa/WBEA6csFBsih2HPJgr/qakVe0v0viDYDE2Tgj6PCpzsg1Ha0Q6HoHcayUq2qKS3sU/DiYCEbG9yUZnQ8yMheJrb4aMcTituUmclmTZVFjA3SKcIaQh6OBe7hqy8aJcUI8jXXjnxlLJVm3XCo2P6LHXzQ1FL7rSa+MT9e9NRd9WL1QxTqIw8ezgrS7mcqQVBHCZY67/OF3yHCoEhMEWz4dJ0AjGiSF46rdaVX1Vusiz8CHszSMN4Wb1yf0SpsoukydIIr8lEff7DEa5ob+OAISJ6nCcwTeWHaTRNMdQpQs2EBN5g2slif8wnUfJTIjShZ6zYPgFSY2Btk71peanNh4H9uUr8QwekB/yWsNA0ZbjEJwBcLHW3Kk4RKG8LzKMqBn8ukW61XQAYxZvbbs4x/vs5ejfmLAdbda9gyqu37qqBClc75Mt1l2VnEgT3DywFM8nlN3hukBVCMZe11zpTdw1mAtThCdcCQtJ0nsL5ecVYVaR1maV4gzBu9jc0Oseu9x+/B8p+VbZvWlCFtuYZrN9EPIqtKwdY2fZNm9dEZ11ekjULROVhq3G5pkPrXJuI5fddmVeGlB8dOIokaXbybzb0sMEEFIPlBkNz7g==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	CbymA7gHWyews2+0Gucx3BnEsR2wFVLJaB+v8PLlORdNNd7SkabDI5Rc2x8EUiwb1UhmHKnnBC/6J2MygVcfAKq4c+tKEtYqe8T0/18WG8gZr9R4m1lH8PuZbvw6AdwvRBggKc4J1d18SaxswjAIgWbPP+KVHa2QjdgDus35GfBnvVK+DRBsu62Z4gRBZT+NilW5aFoeRZ+x8FuUp4xmyGkKR5/us2FtqfR9DlimotkrZybO2hsSuB3EFGdcwqNEigcEBwi/yxh/Yrk0yaTqeQY85mS/RA2GmWUaGIrnW9AoZLTvCEeCzSzDhsi+gFYBLTAdnG66gso5ZC6mrSQagAptgWpyvH3z7GEbspbH202kKCf+sH9WgMstbmle4uU1Ialg9O/+BgkjHiIsX7chywwW033mN22h1Jwas3ovAoaVZi+YBFM/vFG9bE3ph6Bs
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 19:06:10.3006
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3dd363f-3b99-4468-a612-08de7fa141d5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB53.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4206
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 11 Mar 2026 19:06:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19706

Inmate binaries are bare-metal applications without standard debug
symbols that can be meaningfully split. Inhibit debug package
creation to avoid unnecessary packaging overhead and potential
QA warnings.

Signed-off-by: Mahammed Sadik Shaik <s-sadik@ti.com>
---
 meta-ti-extras/recipes-ti/jailhouse/jailhouse-inmate.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-ti-extras/recipes-ti/jailhouse/jailhouse-inmate.bb b/meta=
-ti-extras/recipes-ti/jailhouse/jailhouse-inmate.bb
index 39654a53..c6b3b85b 100644
--- a/meta-ti-extras/recipes-ti/jailhouse/jailhouse-inmate.bb
+++ b/meta-ti-extras/recipes-ti/jailhouse/jailhouse-inmate.bb
@@ -1,5 +1,8 @@
 require ti-jailhouse.inc
=20
+# Inmate binaries are bare-metal; no debug package needed
+INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
+
 do_install() {
=20
 	install -d ${D}${bindir}
--=20
2.34.1


