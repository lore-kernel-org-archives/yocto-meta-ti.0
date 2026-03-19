Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD675108E1E5
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:45:36 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8292.1773917135320964858
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Mar 2026 03:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=ENiF/exf;
 spf=pass (domain: list.ti.com, ip: 40.93.198.9, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O3TzZJyM13tUqJMdXfmsER3v7Nm6TxQgq/ohqVMAYbq6sZceFYXTZv8+t0J0Vjw9uJB5mgyh6Abilq6cEpJPHzMUALfF4q70A+0z5M80RBPGE0SiIFlorIs79Wa3Lol4rq+o8A5hWIoiPbBqUjigoFwBRh/aiCVT9hTVrKduFN7gxy+A2GAC+B9DioaPPQohplFxwDMqpiwhBx3zkYFbABXLFQSMLI2L8OzztO/NPghXnN7uxXa2wSW3WapWkHanUYzswVHoZFWgGSFElkBt1aQSzWCWdAdQ5wK/E6ZtSSZYncZ3c4BYy/TA8pN7EboMt640yeuZJtZSPOzEHHvQsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OF+gqvaHlPpV+sXfdx7hikBh3qtk1wi7+UwTPJJDoQA=;
 b=AqIRSyiIAy0PfsnysOIRbK7TwoRD+rIy8IwTdtb0svjtZ7LYH5nwc9kmnn/2MXURgHmY60zOk1t2ZUh6C282ESf1WzMxitFKzHK8LUKg9hwxDuKeWHnW7myCjDA5SqHuPboqkm9L+vrMOAPJkvw9w/Lg0MOkqhaTLjm5CbyVOWQJZ9oMQIr9JqcMYxY3CxdUy0rN4gczyTrHNOjRJaFQAAVdAUOpr+zVDALtAaUeaLuiw/1PGlO0/uujO1SvOujMY4c/OizpgQEYxLBLzK0zqURy8EqkPnng8x4NpHzeVqfNt618CvRevkABOYVjJzl2Lbry7YzR5RSAnN2linEIMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OF+gqvaHlPpV+sXfdx7hikBh3qtk1wi7+UwTPJJDoQA=;
 b=ENiF/exfrTMew7BMNUsDYjcW7Yoa9t3cEz7v+BD4nYnbXZToDHojKrjkmmOEMhmc51mYoh/5mWXPqG+pu8xNAZVmqsavyZ1VEtkmMD7J4urlzFjae27rp8ITCwhNhBrmSWnOtS8LloFBHao2c9hr/GN/0YEPnFfs39tRsofedQvG8ULiV4AVWju4plv9Ie6k17Vx8WwlsnGmDBSizOMpn9xEv4lGUiC8qZcg7HWb80MtW3WBM+nRStnwIGV7e4CAPk7jQwfjcuMT4lhEdNBmI1GkrQqRDz6N4jG08T+sAdd5Y8CYVd/+YXqRZoFEU6ADmJN/qLW++I0o28VUgvU4Ow==
Received: from SA1P222CA0048.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2d0::23)
 by DS0PR10MB6919.namprd10.prod.outlook.com (2603:10b6:8:11c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 10:45:32 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:806:2d0:cafe::ae) by SA1P222CA0048.outlook.office365.com
 (2603:10b6:806:2d0::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.20 via Frontend Transport; Thu,
 19 Mar 2026 10:45:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 10:45:31 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 05:45:31 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 05:45:30 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Mar 2026 05:45:30 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62JAjUQh2443462;
	Thu, 19 Mar 2026 05:45:30 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id B8C50136F37; Thu, 19 Mar 2026 05:45:30 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Shiva Tripathi <s-tripathi1@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <rs@ti.com>,
	<jcormier@criticallink.com>, <praneeth@ti.com>, <kamlesh@ti.com>,
	<vishalm@ti.com>, <k-malarvizhi@ti.com>, <denis@denix.org>,
	<vigneshr@ti.com>, <afd@ti.com>
Subject: Re: [meta-ti][master][PATCH v7 0/3] Add LUKS encryption with fTPM support
Date: Thu, 19 Mar 2026 05:45:30 -0500
Message-ID: <20260319104530.2934205-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260319103533.2431033-1-s-tripathi1@ti.com>
References: <20260319103533.2431033-1-s-tripathi1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|DS0PR10MB6919:EE_
X-MS-Office365-Filtering-Correlation-Id: e7062a6c-d16f-4615-cfa7-08de85a4a48d
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|13003099007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	+ft1SPRF9AvTsoBlHgDmLEkOFwetIMUR+61vsZRnMYDsW6V88ld0227zrnTpRFGavYQUVN0Cb8k3pbrM6yirpBtVtAyEjY2Q6uW/B9vro4t/viQH8gxwu5IGpkFnAzgEhBHRvwiK5C3eGvoQ5iAE5+hiSdn5+5WWbRUsnauubUCZ3VSH1IY6Ogh4fdmrnG4jSM0Oh8kWzoTlCF05xi/owR809KtEmtcoCMyyeJHX6B4mVDN/EBRajyGRiieuo4dZfhfO0MPk7RQOWdNBG24OAJkeZDYRCQxUK87X569tXuKuQteigvqQMrVB8QZJgSO1CunQLxaBtWeRqnVxoJ6FoXAKL982cK/ovVQNNQ9PHSoWrbyBlHp03KY+8Uj1u6R8snQd2YzKSYtakze6wk/t07+NJYJBUpJuVw/y+cX7bbiZAZOyaME0MG8mc4ZevrVZMbeSkLzExVSDK4bE4Z+RRP0d8+/9johSxJMMrLeMSA0nkH8M8SGu5qgzNmf7jXYXz9lpP1p2sq8BwsiYkGA1YGpEKWuZmtXvPCLcazlNLCENnI52+ERNYckGoPKza4vggCSqSUiEYLtCD4M4VtM/xPmOL/zj6qS9aKloIWN9YqbL6zv9OY0M51ub/q46VxfD5oDLNisalsF7FYsXV4SEymXX8bpJsaf0+e8tFqExq65+EOzZC+kfFi6cbxTx5H3ocb1IRtwk2AbLKAHipByGGtosLoypGuy7TFpWo7mFpDkdmBc/tTBBgDVUybCopHWv2Ov1uGNZmtVKFCqoOQykwQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(13003099007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	khQ/3kKfbhlbcoUtIpBvwU89fxZlkFps+FPSHVk4RtakWSRg/DPhDBOxbyMjCZvKz/YpQeuSpEFsnSg+Q1ZoZt9ClpN7j3Q16psPWAlBPQAkk3/Xh9nRPyTE/44Jtko90CpNRwjBWTyBYQOy9Ufst6SwPu1Vu8VM0ZC17GLfdaA8sVgLAPhqM/VBYXNhmQYHHwjaOR/6k9DX2BRLhIEVqrD9OlSs6I0LD3r55rnrpzmDpDK4V00UIOW257g6z+f4h2W1x/P62uWJNtjvg6R+d+PAxACsT/U/jvz4TjvP4NxS9dDksqotlOyi9ieiynUTxxzgsFgZoJ9W056yibbPin5rH/DvvoWlfkUVFxKzrdgQbCkBZiApPitfCP3yJJpjNGJ2+I7J/evt+cGF3YfdQ9E49wSU0XlGribeASPYzPXXQjESTt7HaouIQIWWDFHX
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 10:45:31.4265
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7062a6c-d16f-4615-cfa7-08de85a4a48d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6919
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Mar 2026 10:45:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19777

meta-ti / na / 20260319103533.2431033-1-s-tripathi1

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
WARN - [meta-ti][master][PATCH v7 1/3] linux-ti-staging: Add LUKS encryptio=
n config
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH v7 2/3] initramfs-module-luks-ftpm: Add fTPM=
 support
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH v7 3/3] conf: Enable dynamic security layer =
for LUKS
    WARN: Revised patch missing a comment. (REVISION-1)
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
- Patch Series: [meta-ti][master][PATCH v7 0/3] Add LUKS encryption with fT=
PM support
- Submitter: From: Shiva Tripathi <s-tripathi1@ti.com>
- Date: Date: Thu, 19 Mar 2026 16:05:30 +0530
- Num Patches: 3
- Mailing List (public inbox) Commit SHA: 509e15023c33e5c515959e07bb3a4376a=
b769e89

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: 1ce070a6b1f8bb797c65b51a7968ffe0348ba053

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
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-ti-bsp/dynamic-layers/security/recipes-ti/initramfs/packagegro=
up-ti-core-initramfs.bbappend
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




