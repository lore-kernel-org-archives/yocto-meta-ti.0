Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90189FD45EF
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 20:16:25 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.55])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54394.1772050581336089769
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Feb 2026 12:16:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=es9JsojU;
 spf=pass (domain: list.ti.com, ip: 52.101.52.55, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H6hRbpvUBWdIrzsF/DLAyYNhjKJgabDHWFPAUXPiRidXl1KbUOQTYci69rnR6h5rxte7c1RR+rE0Ta4nl8Vf5uPHwOSv4lv8laMob6+NuCsZ6IyNIuv/sklCLev1OcFBbTwX6o6u/rrT439/2Q4c4Z4elb5LyV/vKDdgajUWH+wLkTxXGOuWTOAUa+1lwXUA3e4Sd8eM6l1QYZ2ORndisa98zjNy/bVw1K46VcvkDk9KyHJ6/0pYHB46OnjefTt/pefS71P/Eouygb23L7kwx9cpJR66TpuZLARb8MRBm21CyRupPXIL+eMhkTbq59tDaZj8dkBNbr84PNetYayyig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49FqYCFWeqDRD+0Y2wQBQVjr/qB/wI/eOQzHx/yPvPA=;
 b=CKWeUH7b1IQqCthqq5MJjkQeoSAqFVDqlGiWzujImtEuzrEyLFXzXoA8did+W7Xonitsxopatr+SFjXDFqUxbFz5sz8XHiTJ63Nk+SC02Fe6Ru3viDXSSafeeYQidM9n4TxVuyl6dS1k1f8TkroJxTnLszczPms4ZrMLAHryRv/PExKTj7YSNmBK6GPEDh/WztJAm0gLeTlob6Ij+Z57/qtKH7EtI/WuUl8UoV20+P9xfiOAVRuzCgrN0zHyQOsAdnIrhSj3PkQx8Dd25b2IaaPkVe47K5cw+s7Z+qs97cRlyZq0X7z6f2R/dndOUjpMHaC/Guv+l6pCY6/lwn5IyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49FqYCFWeqDRD+0Y2wQBQVjr/qB/wI/eOQzHx/yPvPA=;
 b=es9JsojUnXuFyTgyuxvD4Q4KwXF03aS6se69ND/4U0QINiT1/+pakGGCxit3e3wsBMDhhEZDD90OuJPeEKZ/fzAARSNMCFZcFxdLfOGgRgPlWINvo10syRTZErpYSQc2IwBucJJeAjuWGZHn1IYZq+GeU4EJT3Fz5cwaHIQvvego90KKJH6yFK0XtEd/yiw83C6Oepdep7acmf6DdTsBDuYVD7jQ4baKKygmgfhmZT1aw1pj7ySH8P85QEy1g4pHMGx8sr/TJ0cgrvlu4NXwGwa05c1Cv4CDlYsya3N2o5b79Hl9If7K6Mtt+qaXXRz2k5FkXT42BPR3/Nm96fb7Zw==
Received: from SJ0PR05CA0110.namprd05.prod.outlook.com (2603:10b6:a03:334::25)
 by BN0PR10MB5032.namprd10.prod.outlook.com (2603:10b6:408:122::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 20:16:17 +0000
Received: from SJ1PEPF000023D1.namprd02.prod.outlook.com
 (2603:10b6:a03:334:cafe::b2) by SJ0PR05CA0110.outlook.office365.com
 (2603:10b6:a03:334::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Wed,
 25 Feb 2026 20:16:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000023D1.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 20:16:15 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 14:15:58 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 14:15:58 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Feb 2026 14:15:58 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61PKFw6o1362137;
	Wed, 25 Feb 2026 14:15:58 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id A5F8F142E1D; Wed, 25 Feb 2026 14:15:58 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] packagegroup-ti-core-initramfs: Add nfs-utils-mount
Date: Wed, 25 Feb 2026 14:15:58 -0600
Message-ID: <20260225201558.384990-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260225201310.3899574-1-reatmon@ti.com>
References: <20260225201310.3899574-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D1:EE_|BN0PR10MB5032:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c7b3cc6-45c3-4751-3234-08de74aaba8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34070700014|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	yq57Z/ZNT8XGQjboeA173rAy3Rl13MIZ58+jMGuvIXE/i0n6SZLSrdxJNRcoPJcUtXXVyIExDPQoYarOjAJQ5rQgL2b736IxNBK19dA5GdBZj26Y/le1zEpY57GzcC3lxYFDjchQOm0OAXTumtzPeqW+OcWsKeL3AlTRMxsfkWAcpYk6w0n/0QIiCSPgFcykva4bb8xK7DAKmmd7DHWVK4BI06tEU27jWVEPafLUqqZA+gLeeTWeV5QLkh5tQ8xtuFIP+dEY8XPNsLOMaj12zTmAXAF2k7U8TCI0ZpqxnC09TTvBcyBHUB3bIvSh+Dki5oC9Umk8zXX21qNuAOKqv7SooQIOKHXfZQ1Os8794N++W8SCAhjqVazkYrT3MoutivxqHPn1LfuEhekBc7Gcu9LkMk7XFFkxv7P7LsfQ56NKyVOMMsTUGYJ8q20zU1a/rsZtgovmfb9Hg5JjYblYL2Qr9EWQDShnnewCbwAuS1+zsklzPUQHoNzjPi5gf3DAAOZ9dTaqGkRskVY3CEFEpbo3cDH0w0q31emeYOTbCWwRVIUj90x0HcI0bx8M7hE+3CcLrOhfN9iUBXeX7Sqa3WgLeOyS9AEoN+anlUQbbc/Dmj6KotjNLXSJwOY6nH6zQhwJUbM6YNSTCfCGC9xttUMQI/V03+5J/+KJqw5krsSoXrtZNJCJu1gBGWXX+zKCIYqXpvZ8oyv690qa4SvVBuION9+6WTBV1P4xym1HOaGKsAO1L7iX0+tX0TO8P6S7KwrYNvnmGsHPFZfjCpMTbbNU+0x1eRdyacIdOnyFB0SkEGuOxa5IuQ5zRBJKNy0ntayLaM3kJXS2DXkmeRJ++Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(34070700014)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	5heBJAt1hFW5NSFn7wq9i/CkhcItIxsJ1CZXpvImDKhohj2kOLwLSK/BhOSDggOPF2CRwVqfi2DjuCwZpVjDQ2C16kReG5z/To3RmrphP4L7vBPyJXwRsHiAMNAdWLZrVI3dJCdItK5r4eafSK/SWmZbM22i/mqBFGXVpMajHXomdZnZUXcHCBpAboHcQshPoRXaJ8cioYZ5e1xuq1V+keRmHXa9Z0F5Zf37QI2PteetKPpaPOlIFxXny1Pej2MY4186swJ3ypIb1K3OaPVVXP24tkX1spYqgoQ1vGa2VsFPzRAIsoOpA8Ee5AnNPDc+LGt9Eh04TC3W0Y5r53QTkx5KORGvGZIBVziTiTI8mZkw8ppekggeguW7ljsTlU+OyCH844ILhS8FN/AvOT6fAXMynwofYHN3tigv3hNNIooJyPw1oT7IdHJzt0D9rHiv
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 20:16:15.5086
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c7b3cc6-45c3-4751-3234-08de74aaba8f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5032
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Feb 2026 20:16:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19610

meta-ti / na / 20260225201310.3899574-1-reatmon

PRC Results: FAIL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
All patches passed



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
- Patch Series: [meta-ti][master][PATCH] packagegroup-ti-core-initramfs: Ad=
d nfs-utils-mount
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 25 Feb 2026 14:13:10 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: eb9af41628af76b06499990ab05f95a55=
857aed2

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master-ltsprep.202602191451
- Commit SHA: fdca2e3472893c7f21188327805b83c6a0b32850

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
FAIL
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-ti-bsp/recipes-kernel/linux/files/0001-vt-conmakehash-improve-=
reproducibility-for-v6.10.patch
   =20
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-ti-bsp/recipes-security/optee/optee-os/0001-plat-k3-drivers-Op=
en-TRNG-firewall-for-TIFS-on-all-k.patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




