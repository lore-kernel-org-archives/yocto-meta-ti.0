Return-Path: <s-joshi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB991FC5931
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 11:23:09 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67823.1772104981521745173
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Feb 2026 03:23:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=o+BXUcpv;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.194.56, mailfrom: s-joshi@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kg7+tHqWJ0aoeBIPb7rs0+/0+E1jGjzHbMN7rtRUcw7aCzKopxn5sBE2qVSgMJCQRVymdoOyXXuuGHGJ4kZ0kRl+BA1pkHo1yZxN1k78VRKUs3/119TEn0y1qI8eYqaGF1BkcDYH8sVYf/rr1r8AhaMSgz01L5p97U541jXUtbtDgphwFIr134j84ga+LHcTMPXlpsGZalCvGdBePiSS5VNbfmMpEF8VwppcY0rENSu6uOrfVTxM3ZzWJ7f74bhHgdSDbYi6J0ydEE3GzsM2712mBAadLR35xfAE3xCLqjZzpVG3djd2NDlMXybL20kKIP0XRp9DcNv/SnxT14Ue2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7vg1hL1/98sUuJmiI+77ul1rSm6piT/f8YH2DkEZJ4=;
 b=QmqG9hvzwjoeBS4MJh4S71Fx1pWu6kt4P011bsrjlnvsRjjz3jQsEvRDN5GJqv5/SiteIR8YN5hZY1j/eyloJLf1yMDh5192Vp2wp6GpUANuHLIw5ElAHQVx6XrloMsXyX5ZWSceUjU0YGi1EgezTVvzDhutT5zfJ/xqAdhVE/+B3BqeSV3jHHEhhwnz2DJ02Dv3f+FsmX0iybvqp4FO13U5HggP86VQXPjsz28L2isJPCl32WdpryiqOKddriD9M20T1Ze7sBu1uctJOFlT+ndx0h9VCCJPdFiuHkEUmJaEIkmCdNTp+4rSD7x6mtzj8bE9WrtYDE4XKoMTmjKW7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7vg1hL1/98sUuJmiI+77ul1rSm6piT/f8YH2DkEZJ4=;
 b=o+BXUcpvFnhN0vmTobXh185mUnT8wBtBXBsCsOESpjywhFKNwf8QDv1sMkq1tMHEXLOf1gQ9MwppNWteUxO1mXX7EwycDd4VshNOGC3EoHCK4hL3RDNE//fVgFtg8MJ5Wu5OsYyJvQv/uA00exD0wzLfJb2mgteLciOje37xk8E=
Received: from MN2PR01CA0048.prod.exchangelabs.com (2603:10b6:208:23f::17) by
 IA0PR10MB6698.namprd10.prod.outlook.com (2603:10b6:208:442::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.14; Thu, 26 Feb 2026 11:22:58 +0000
Received: from BN2PEPF000044AC.namprd04.prod.outlook.com
 (2603:10b6:208:23f:cafe::fa) by MN2PR01CA0048.outlook.office365.com
 (2603:10b6:208:23f::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 11:22:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF000044AC.mail.protection.outlook.com (10.167.243.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 11:22:57 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 05:22:57 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 05:22:56 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Feb 2026 05:22:56 -0600
Received: from localhost (ula0507357.dhcp.ti.com [172.24.233.202])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61QBMtS02275864;
	Thu, 26 Feb 2026 05:22:56 -0600
From: Suhaas Joshi <s-joshi@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <kamlesh@ti.com>, <k-malarvizhi@ti.com>, <s-tripathi1@ti.com>,
	<vishalm@ti.com>, <praneeth@ti.com>, <m-chawdhry@ti.com>
Subject: [meta-ti][master][PATCH] optee: Update optee_os to integrate Firewall RNG changes
Date: Thu, 26 Feb 2026 16:52:49 +0530
Message-ID: <20260226112249.416567-1-s-joshi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AC:EE_|IA0PR10MB6698:EE_
X-MS-Office365-Filtering-Correlation-Id: 860bb73b-6901-48b5-9ed1-08de752964be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|34020700016|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	uygjCcu0FWxiyXENlwAP/zFBBewsZ0F65jWCTwO3ZxFK8eNWLO0jctNEb9uE6uWxqWxh2V4cuILkwrcvnynPBPfd1Koi2lbv2ZsLDnd/Op0EcwaHGWmbmQDlMiCY3sGg0z3pjS5+PZsEeWszQGKztCEJ2wXTiATEtspZGEP2NegHb2/KCNvVN2Srbu0AdnPVx4ZLpjFD+vvf8JUniGig//Gj57OV2hO0Eg9GY0f4cPIwEat8x/NAW2qLS8SgH5tPq4j6h7xOJg7mAyU0SjnUoX9T3Tn0F2Y/1FNSs27/Qj+lhSzFr71q8zjOYBXXJ5piZNDlzFwXqastbA+7ZSdzc7ZaCWYsASz1Fn73c9Pd9BchQ5XspVQAr7XdoK45o283Af8w4iPrIFlmRfU9bSu+ZBZqWqfhOQHQMFPw3f9n/KzWrUUcv8Ro/Ttc8xbKmd1hw1UzPni6pitbl3xraMl5Pdwa8rAnJNlwY8BVKaqLgOUvteuiwfXr0L1IcLkZsP0se2hKWtJdeCr0uDh0d6hR9BQBcmtbNTBNafxtImXhBUGMYAgfF0hblDMH/JKuV98L9R+ifKZBtpWSbPX5KjUeTzLqE1asgHwkK0eaC75SbcPMKQfBHYfrxb/0Noe4iECkhsL6kvmpMRODImooOY6sz2y6vvxTMY7S/dxPXdP+YMDJHKkB+orIN4pVt2pGOeyTaqtu/QTaka0kSOA/zj0oa+BDPHOOgl2C8RDI0F1RpzmBc4kq03SKUmquBhteD+oxPTP93ST/6OhjMDtsMIi5U17FUx+PN5VWKuUsRH6WmgkzhCDJGiIOGZ/lXj2yAPyl8hDPjkSWuLKgR9LsPigIIA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(34020700016)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	AfKESEcjmTGlHnGYQh1YKOVRZTMSrzCe5gSebo9TPljjhNuJ3NPEnvvkJ0uu1mRRSQbSd47CYOjwgMiBY5sm48t0XDo+unfIYoZOZ6L/MtLFJaDNrxzclwIXVJb4sARL1Jk/rR/KX36PkaF7Uph+Dl5sXX6Hv4gCdBKUnQsChpD52Ca/DjE853ckulM5dFT+uHzbbGVJ0S2qpg6e3xcbhBvWPavmWibVgWEUmJIuNSkQ+sdSsvmZis1rG2t/SbEhIsFb80Qegw4jXrOV7XJfsgy2+Z/tpDJ8Ed66gVWcGnaGtqDTYu7E03KKgojimTrzs3v2LYkaPBaRXU5r+CTtsevBtWqs8+KP8/RAD8qoiE7LneJiT7hnjNbgF561YTXcEuOpiERLBOw/wyRMRTyJ2xZUIA+44WH5Ex4S3lbqmVgcOIl5lfbRFAtm+HYKizGR
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 11:22:57.6399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 860bb73b-6901-48b5-9ed1-08de752964be
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044AC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6698
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Feb 2026 11:23:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19615

Recently, a few commits were merged beyond the 4.9.0 tag in optee_os. These
commits refactor some code in SA2UL, and add firewall configurations for RN=
G in
AM62L. Therefore, to integrate these changes in the SDK, update the optee_o=
s
SHA.

Signed-off-by: Suhaas Joshi <s-joshi@ti.com>
---
 meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc b/m=
eta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
index 8f75db04..759653e6 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
@@ -1,2 +1,2 @@
 PV =3D "4.9.0+git"
-SRCREV =3D "c2b0684fcd89929976a8726e6e3af922b48dd2c7"
+SRCREV =3D "3322f1326f141ef3f41ac7a1c1e08ca23a869fd4"
--=20
2.34.1


