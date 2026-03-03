Return-Path: <s-joshi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 424B1EC0463
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 09:42:37 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14592.1772530948177029697
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 01:42:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=eZIIwF1Y;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.46, mailfrom: s-joshi@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iFYXZj1MPQDuohQhAONKWQorJo8tTehBDB40x0vzkcGEK5GFcri3uXuuCD0tTz+d+PscL7bZ5Ie3BoPnTS7lBMXZh5ok4M3MncywRlUqyaNxHNvjuII9QwEbPWsYolYIwG94eWfXiOSzC7uPVT1z3T58xSldxm/4Lyoljbsc5qFzWain0gdufGgp7XW9tbq+x75PeCu4oELyvk2M5ggiomYEnIFVx8VGgC9H6DLIrSAnOLVlv6Jxi84V2nx/ejNK9t4eYGLdggO1SS3k1mgEZ8TpohWksVsRhIL8cRb19pi9sADuroDJrlgJ/XS8HSd0HwlSo0Cmm3O7Qv5tLQDYfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9FH4gc65Lh+P/SjrJzToVrhDdYORtbMFjRXuZoalB4=;
 b=PtU6qxxGO53m/ZLcsd5niRaWMWntVAXm21x2Sy7ln+HGFdwqIZYZESFBJ8coaIZccp6D5Pmnpg2+ztjsC0mbuJv2BBBk2z5Mq2ur4VB8E5XrOASTL0sA6KooaIIhPnD2zVES8FK1Flyt6UMq2enSc4UhxXU8/zJuYd8ahjVzuWpTwoMrqwNxDOiWBxVhGLLqDHn+6Z7B13fQqSbQUgIDJGrJA3dnJu7qsOSnR88AMc/kO5ZwFBbJJBSN45WSoyJw/FnrRGVmDyY4TIBctuxEXjoWlayRYpbU6fL/ZR54M+p6ReFccgjZtPh4lx2vfwkiKvp4vb3nxmIEh5txMGCZLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H9FH4gc65Lh+P/SjrJzToVrhDdYORtbMFjRXuZoalB4=;
 b=eZIIwF1Y3G5+/d2im7aKWBOWRwymAmIbv5hwlI+3sG169d9y6jckAkyhVK317QdLAP3DHWUBWIE0nsZ2STk2WKmCpTqZvS6dWtmk4wveoZfQdzUhkxo8coNeUjNA6bdlhssxWfvlee7oQnJ6dqBdRBLhpRak9jfvCe86cyNThwI=
Received: from MN2PR18CA0021.namprd18.prod.outlook.com (2603:10b6:208:23c::26)
 by CY5PR10MB5988.namprd10.prod.outlook.com (2603:10b6:930:28::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 09:42:26 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:208:23c:cafe::1a) by MN2PR18CA0021.outlook.office365.com
 (2603:10b6:208:23c::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Tue,
 3 Mar 2026 09:42:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF0001AB4D.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 09:42:25 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 03:42:15 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 03:42:14 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 03:42:14 -0600
Received: from localhost (ula0507357.dhcp.ti.com [172.24.233.202])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6239gD7V2393066;
	Tue, 3 Mar 2026 03:42:14 -0600
From: Suhaas Joshi <s-joshi@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <kamlesh@ti.com>, <k-malarvizhi@ti.com>, <s-tripathi1@ti.com>,
	<vishalm@ti.com>, <praneeth@ti.com>, <m-chawdhry@ti.com>
Subject: [meta-ti][master][PATCH] meta-ti: optee: Update SHA in optee_os to integrate timeout increase
Date: Tue, 3 Mar 2026 15:11:18 +0530
Message-ID: <20260303094117.1650691-1-s-joshi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4D:EE_|CY5PR10MB5988:EE_
X-MS-Office365-Filtering-Correlation-Id: d0eedecd-d747-4df3-8e85-08de79092d4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|34020700016|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	tPVivsS0hXctUFwa15gQZWE6wCKnTnyNY0K5ENLhh5KkeB1iQ3EfVj0ey8U1SVPhhu8yabAf/V3ScfJBtJV8S23PFOLr+3vR37jofCXuCPOQP5Isw7zVpKPUn1vu/E6q/4OKofY/t4sMNJLjckUepRf8Wfk1m4VzQBJ0wI2TDc+UHz5n5s69zFttIbQhO+yX/TL1OO1c4ztJPTwpznSJI+FkYHlGvP7zb1Lo9kbXTxGeGW/ATZQnLGMDgwisml4JO3Z8DSmKYpRbld36Zkf3vtX6EZEtLhSbU2pxHG078ybRH73VL+7Uh1XwxX4UA8IM+Lm8KZSsBkCUu7cghSZZE6hIfgvmDMg9qM89bAEdRUK0yOv6aDUGe+f3wvB4DpurrL3fsf+0KU7l+yU9GlljFkZSuhTJxDavr5PzMHFI1pO51KXND1lAReWwbL4ETr5keUdNQBfZCbPdP9MAAp9D8nl5EYP8dxPTA4pjA5nUntYiqzsVI7ZcY+N3RBQmlrNdvy3lHK+/Nf7TVyPVMm/rXV+CTaiEUE2dFonDfcIsdH89FFqovqEJTWgt77eE3NaLDwE/hH8ahLJ2B3IHren2JbnICFsxDjI1mKYCWqtm5+X69/mOtm/SLxQCu412G5xL2CSGDWi4TTzT6AC+ibVTsrvfxZFwA/2E/B+RoYV6ZkbBHFbHfdgnlCs2Srq2OMLe1lrzwGwX7xCfNvjH3/LpI0gH1p1UbN7XQ3GAT0OK2bbZcOHSMKGAUt84GAZx4MexrakJTiy7hmhBrPPn4ywdnxxSA7APj9iq+kov7jVsw26ECvfh14By7KJEHMkBCaWr
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(34020700016)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	rTpcee9ElXcsYYy6OR6TOpjUa7tORsr09+xBYaUqrmLWOApMgcsEZ8eZSqdC7O0jIYNq9KgVry9u5gbWuVpDQBsdAiA1IpyIffhnZBJ5V3VOjAnFKENetM56t5CW1Ch4T8P/o8wKkDHE8Cm/mXPHg+3kzlVjZYfMZacUfmqRtx+REC4w9rRIgoxNfE7ITcUUA02+vvDVknnFKaMxO2L1pJCaSUejKFYDwwGwSJhpsaiBZowEoIPlGi7ZvQdUpTv1s4yzCnCJdbOnJ8cggIhVoGLh+9f+V5z9NGf67wBFmri77Ntkuk8DfHXIwHAYE0Rvt0htRMlXuVjI/np8R/u5Cn8eSsCDNoJY8LvW7rVS13ixHhrHk7zH/o0kGKHjjAL/XWLOms/0kSxPEywenXO7Lxhyqv9YSlr+L0ccRu03QdgWxhl+6CSfoPG+EMJjC9vV
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 09:42:25.3783
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0eedecd-d747-4df3-8e85-08de79092d4d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB5988
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 03 Mar 2026 09:42:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19635

optee_os has a driver for AM62L's mailbox. Recently it started timing
out waiting for a response from TIFS. It seems that the timeout we had
given was at the edge of what was acceptable, since unrelated changes to
rest of the boot chain were breaking it. So a patch was sent to optee_os
to fix this by increasing the timeout from 10ms to 1000ms.

Update the optee_os recipe's SHA to integrate this change into the SDK.

Signed-off-by: Suhaas Joshi <s-joshi@ti.com>
---
 meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc b/m=
eta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
index 759653e6..db18c696 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
@@ -1,2 +1,2 @@
 PV =3D "4.9.0+git"
-SRCREV =3D "3322f1326f141ef3f41ac7a1c1e08ca23a869fd4"
+SRCREV =3D "f2a7ad0638aeff5243593b33cc56ad064cae7615"
--=20
2.34.1


