Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F4BFD45EE
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 20:13:35 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.10])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54709.1772050414803118497
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Feb 2026 12:13:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=jOA9ybWq;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.209.10, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VthHd81dQWaHPO8xAtLpwK17jU6CpcMwJMNatRnQmvvGnIfJ3ZKkib1G//wzzJeJ7WwPXAPQa9ClTsl9KQqkXvYE42TjCbfC0K/8QnQpsiB1t5LuRxG//8OD58m9cwUfcGO7d6u2c4RTg1UHvSuohZu+INJ4Ozx2BPS17jS1nXY/GqB2QLJRPzOvIRV/bZF2mWvml/SvtQk8peCTa8hGuItLeB0BTRAx6zhbQ500tQocBkIkUlEllHE2cr+PeYKXHYVH44pLKUTEI8JYFJcMSjnRXI83wWbJ4FTqV8GUjnwTJAHOt7Xr7h/pHw2I/ZA/OEAUte27zlx4Ru47TXKOYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zcx+i2A3JxfWXKgSwy5Y26bwsUAQxQvBe6F/LXgIHiM=;
 b=rSJXf7ZHwincIKyjMMnU4WGZe8f2+YY9plDGiSLx8Q9XG/4B9Tp14Utc1HushKG3+JyNOI6lcLwroVYrzXrCMefEP/IglYdZgzU4jZNGdDrSWI78ZMkwEp9ZD3SPM9oM3Mw9aipPvg4fTUMtL8F5vxFEyjmgGSP7TzOYFpDyfdu5jKbD77aGHq9VPK96Hd8S1zzLCgYgITojEHsWqZG0DJhXN1IRFWVkNUB42bRHUFQJT8eNPlGTQIYLh1vRQHLrqXZIPMJXuGRChH9MlNcPWgvef3Qd6dyUM0iN24Ju1V14EQ7n2m5hEhWTcgWSpH7BMqxrhuf9fLpW0D3F+jqNwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zcx+i2A3JxfWXKgSwy5Y26bwsUAQxQvBe6F/LXgIHiM=;
 b=jOA9ybWqGVAyVbVl8uSS89gYE24KNVGIm5ODR87hwP70VWPhm5tScgNqbp1f8GVMYhN95n6Mj2VVR0mqBPOEohHH6/R+om6CtYdL3xBAxk3lsNGxrAUzMH2rMXjI2tAezFvDSattCYrsihaCtLksuYSBf/nJZ/6O+0UOUh4jyY0=
Received: from SJ0PR05CA0106.namprd05.prod.outlook.com (2603:10b6:a03:334::21)
 by CYYPR10MB7625.namprd10.prod.outlook.com (2603:10b6:930:c0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Wed, 25 Feb
 2026 20:13:27 +0000
Received: from SJ5PEPF000001F7.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::d) by SJ0PR05CA0106.outlook.office365.com
 (2603:10b6:a03:334::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.0 via Frontend Transport; Wed,
 25 Feb 2026 20:13:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001F7.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 20:13:26 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 14:13:10 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 14:13:10 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Feb 2026 14:13:10 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61PKDA0Z1061241;
	Wed, 25 Feb 2026 14:13:10 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vvLFu-0000000GMSX-0zL6;
	Wed, 25 Feb 2026 14:13:10 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] packagegroup-ti-core-initramfs: Add nfs-utils-mount
Date: Wed, 25 Feb 2026 14:13:10 -0600
Message-ID: <20260225201310.3899574-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F7:EE_|CYYPR10MB7625:EE_
X-MS-Office365-Filtering-Correlation-Id: 37e54af4-3cae-40cf-2ec9-08de74aa55cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34070700014|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	Wo8eGQkAHKMspZ6GMKvXM7O4SpYedfza6YAIbOr66FEVSxeDhA8w6GSxKUFPR6zXD12GngVx2byP82URBV0aoFNFMi82dLoEBDaW8x5wVat1HNZWOjpABNJg4hWAjjgvqH+xVdFSfM35hz48Do3jSdTFZ1cf6LSdvCloTXvyg+BxyPOazlS6C9h0YPaVMkFM3k6TrKtnEL8Ri6oyjbgM3uFMNgxgUkqhfmHvEs3shPXNWLACC4IYKuYzWuSG43tPwRhqj8/O+D/zXbTp/kC7PWM6h/9XJ1I8YUtekLvEmR6/nbBtX3GZb2maYsBzfhjQRQd2LQImEnnYsDs0xE7nW3p7B487xqqgxBRMwnA3ql1xENRHybwLMcQ8/d1iFFB59c2bi/Nmq/06Mhz3LDAWYIhuAC2tSeFNqLo7BGQXen/VbRZ4znahq7Cz4JuSe7DqaVPLDP2uEMG/M717VNr8/RqdZhnT3KZb/FIOpTpH8mGG0JJ+KMCWvX3k3XuboH2Bh4UR7jtLH3mfd8Enyh1FIzkC7C12SIUdTY4SimVTIlBEfFtqrXQjbm+x+Cl6SB9COA4Fiwu5xVIyBXJPmbY+/Jpkvq/rsLjPkWVzCtEWF5Q0LlMrZMyEFRPeCzuXx/eg49X0FCOKW2lEyeOioqK312Y3luFMC+FKK+iw4hZrshU7ZO2nCqZK8NGa4LEAvLwfyCYuqSvrPlVxeFo2pwsTW2bBS2vpEC6Naz1mqU7Zb49/UNxE3SWAUkFspyJSFJrmZXkM+c7puA8bMyfJ3fjobAwjYgxO2gWygSfYX19MPiHFU2rtJuKs7H76S2cav8UKzMr0GcVtKRaj4aoNS7f5kA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34070700014)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	3gAxKzDbNpqIYYLKuPjcduLzLgpnigu0CoC5ThMv8XneCcive/tOxbG6Y2WtHQdYx8i4za6EzixroO12EYgFTJB7lpxdV8LNjALqQj12hXUL/JX5IJle7suKaAzIqhscLlQFXR75B+ueQuCdVQG9BDSDRyKgdR8tGeuC1l/TDZs2Zg2N4lPvpXuHvaW5Gfz7xZG1SH4EIPCt/sST7maDBofLkHanTw2S88Ps7plofNh2sRFVqKIcWp52DnFgELFyQS6KYbxrCoLEQRr8ZKpQSv0OaAKDx9lsARH9DfXYZUyNUm9ZCmHwhYfzOnaW38S2Bo8gjfdXrtV6M4jE8XWmM09aTWvLs1dHNsFCHnLu9UvOqQLfPxCA+JijtdS+WFpU/ufpeG40Gma17PkuNUw1NqamUMYmhOWWGYep2G6GA0jLonCBMCAKWiXBjb1iw419
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 20:13:26.4576
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37e54af4-3cae-40cf-2ec9-08de74aa55cb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001F7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7625
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Feb 2026 20:13:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19608

When loading an initramfs, the kernel no longer provides functionality
for mounting the rootfs.  nfs-utils-mount is the minimal required
packages to provide the needed tooling for the kernel to mount the
rootfs over nfs when using an initramfs.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramf=
s.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
index 26b2718e..a9eff847 100644
--- a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
+++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
@@ -21,4 +21,5 @@ RDEPENDS:${PN} +=3D "\
     initramfs-framework-base \
     initramfs-module-udev \
     initramfs-module-nfsrootfs \
+    nfs-utils-mount \
 "
--=20
2.43.0


