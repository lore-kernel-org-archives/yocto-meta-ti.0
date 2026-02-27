Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 625F7FD9E37
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 03:39:18 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87794.1772163554496108716
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Feb 2026 19:39:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=btHpLJfL;
 spf=pass (domain: list.ti.com, ip: 52.101.52.32, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lC+WbvWSbw8mS7ZVDR/yQvMCVrIOE3KVVE0T8tBAVOZTrayXnuqe+EH8IVL3QqX83WiGsaVlL3+pmg/zsn9aYPk48POzOyL3BGc/X7hJEflb70tMZNSDbPKdSOGDUuObsz1zLPzM4eNyIqGz1rddlKf/2hN2aX2lBPaIZxquO8NoMJGw5ywiJPZmuaOE7HRdJSs+wBlYC0biPs9xFLV9K25tWxq7oR2xjATJRw5kcV97jAmoAJ1jgqrU9LzlqZ1vnOH84h5xwmsw5O52+BaFNrHd5AXE7340wGzRjhqNm0JhCSpuUtIdnVvydmfwkQR2vfgCqhVhvynpu0lZlCLo7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LWVSr36/hdbMcUYSKCjrBZSZQVnY1+9rdGDFuzpZFFY=;
 b=GmCO25M1J+RyI1VuPaBPYuErFUOLtvw9yMUQawYV6YsAlbVIM+g8NVDQfE0VsqZJJmsbeFDVKdrw3yaSoXDTRcr30vbkluorgWbwY1D0RTQBvQlCBeZameIndW73O+ge79tNTen0sVhukhD8OMYuW0omngNHR045+bJxHbRQi7pKB2Y2yQAMMyBXVPA8H3rSrpOf+GJ/R6CRUAGVuGidddPGW/m2rqtI3B+BdzaPec+CbdAfeZaYFhzRHEGt57quYALZa6E/yAkDImjKyhq6tCgQ7AqYe86J8ZOltw6KBhxmFRxjTkvbSo2FEn2nUHoYikiwFJpgyw6M4ZcZYlzN2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWVSr36/hdbMcUYSKCjrBZSZQVnY1+9rdGDFuzpZFFY=;
 b=btHpLJfLl/0pj2Edtso5xwZ6qwZhYdW1OTp6wDlC8cZg1IZhWrzeJZQiUIumH+yr/wUJKAEoG//Uj9QfWvd15tc3zxV2HSN6tIJ0ZPkLz+upxagf3vPEuQlsL7PjL8CTfquQ0bkpnUi4R3PIpf0hvwhGx3da67ODjHR9/DTmQ6mhxOdfF2z4F3o+AdpqTEIiYUN9HHyDWMzml9jFK4bVq4wZipSxlRLNI8xrTCdsljAAZI0aWubgFlusb2z2Jp6yZVyOzkdKKHIWqBr1XcdJ74gINz/hGbg4/G7DupTPb4mMH9YX/YBML67qK7BWgFwYScIHgpnVrHYQhkO8ILResw==
Received: from SJ0PR13CA0166.namprd13.prod.outlook.com (2603:10b6:a03:2c7::21)
 by LV8PR10MB7968.namprd10.prod.outlook.com (2603:10b6:408:200::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Fri, 27 Feb
 2026 03:39:11 +0000
Received: from SJ1PEPF000023D6.namprd21.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::d4) by SJ0PR13CA0166.outlook.office365.com
 (2603:10b6:a03:2c7::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Fri,
 27 Feb 2026 03:39:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000023D6.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.0 via Frontend Transport; Fri, 27 Feb 2026 03:39:10 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 21:39:10 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 21:39:10 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Feb 2026 21:39:09 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61R3d9M52996472;
	Thu, 26 Feb 2026 21:39:09 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id AB5E5142E2D; Thu, 26 Feb 2026 21:39:09 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, "Denys Dmytriyenko (TI)"
	<denys@konsulko.com>
Subject: Re: [master][PATCH] beagle-bsp: unset TI_CORE_INITRAMFS_KERNEL_MODULES
Date: Thu, 26 Feb 2026 21:39:09 -0600
Message-ID: <20260227033909.3542131-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260227032318.30573-1-denis@denix.org>
References: <20260227032318.30573-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D6:EE_|LV8PR10MB7968:EE_
X-MS-Office365-Filtering-Correlation-Id: e87eaac9-e8a8-4481-0361-08de75b1c528
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|34020700016|82310400026;
X-Microsoft-Antispam-Message-Info: 
	X/lEqAJx80WhvUfn/ffV1Koo2oh/cD+RqHS3itB4xQ3dXMG3mQtySu4LUylhChCtlpPjV+F/BDLxr90oSEUp5rjeLmb/Q+cwOSlvgLZtjG/k29KXWP07JeKDMYAdSS87G5AZ7z1XFnVCOtT1jBQ8Um+3Ib2D4+8XIt6at8i707Q5vIVB1Sre2CALpPJJkRHfKuCGinpgJArTTNSmBxZEhyyklWnPUYiq1wjA76D7WMIYWlykwYjhu2rz1PMENa3Lj+UwcfNm1Lfk4R3Xpd1dXK4NhYY5g3HYhaQn1U2d3nvc/sMFaKk8N37pFGMcFS9IaDDQT4/ymFdyedFKEVDQ2DnReGnzwpnQ1g1zxWlrO9rigTnrrbHzDMs8bhi2GoTE98eb60uj1N1jw41xLE1B6CbYf5yo5qZZnL6/CsTILczoaKNSxuR8Ze8w4mnbIKcJTKW3JtDS8sDIob4i6BGijqxXvNxerOzdd+inhp0InCGWIVQtWlcLmkJetVVTAduDVC+hkHGvQOOZpPh6JTnKf5StDeolR7NH4UmspYc7cCGtUCD6wgNFFQqBCO3VQafhrX0YZAHhd/480oBRahYnjTqiTS4SNcWCzd8kZZuJZTfM3xbkEiYxZC0Q85yC26aKJYXHaZd3buVpR3BANlSTKf+slNxLg8jCY7D8yPrCq009VhQ0i9/fqZpy1E1KGV9w5WEUNzkgdyMmqM0qNqYnqGhYZ73TuE3ubq81uQO7Os9PjKBqUv4brB+ffyzREydP1egKaqSnckg7dZJ9ITcQ1dxkpAUqAhCwDQHGmSi9X/6Wi4TiO6fcPGVcdBwV5iKldWk+HE8SdZzMUx/2C+K8ng==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(34020700016)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	qlOYZaj9gLmHUdG6UkzMW5YtvZfV8/m6Tv64aNSryWK7Ju0bODjzjKH42yb83kQxtYmm5BEaOp9dqqTqvjfJmImLGza+v/56W1RBMcefkIqTwOEYzpo4uRu6pBotGSYzRxh8F/QF7eWI+M86gwCdNhdXoIDfdPeqhmXJc939b9T1OX41z4qtEMqtQS/0MSo2SKEhnGh4eVKv8nuOj6UJTUyLvEjt7p3cxU/QZh+LkiBtxoEIxHC0M1htSGn9ErlYlY+R59vgyo9Ai9YhBaY6fDmPEJCYx+QtMJeiLCth/PdnSxQv6vI2/OnQhAnJEqjM7/x4nJLu2A0nHBWXFQolfQSO4pZ/CCdhQNZAh+ZJOR74ylswfdgs11lr/MkJaxvXaoz0Z8502+qheEQRRmut/rqWIT9FgD/1wTNZwhYo1r/5a73VTochzf5ik48Q5C6z
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 03:39:10.9244
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e87eaac9-e8a8-4481-0361-08de75b1c528
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7968
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Feb 2026 03:39:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19620

meta-ti / na / 20260227032318.30573-1-denis

PRC Results: PASS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
WARN - [master][PATCH] beagle-bsp: unset TI_CORE_INITRAMFS_KERNEL_MODULES
    WARN: Missing Signed-off-by by sender in commit message. (SIGNED-OFF-BY=
-2)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [master][PATCH] beagle-bsp: unset TI_CORE_INITRAMFS_KERNEL_=
MODULES
- Submitter: From: Denys Dmytriyenko <denis@denix.org>
From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
- Date: Date: Thu, 26 Feb 2026 22:23:18 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: a660d5fcb589c1299ccbb42935a4090b7=
9e81180

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: beagleplay-ti: use the am62xx.inc
- Commit SHA: 00648b0fb6a925da4c40a97051433338107e1c55

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




