Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F9CFD45EE
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 20:16:15 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.58])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54388.1772050570498124482
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Feb 2026 12:16:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=NbKXkubg;
 spf=pass (domain: list.ti.com, ip: 52.101.201.58, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gy4kT11RU2oZIB3BiJdNDe7Xi5xClnBmuw+ZhbpI8Ex2T6RQj8XfBOYWNl6bRMEeIVrMBrQYqjxkGHbpEY2vfFRH4q8gUIEWh1J5ie622Khm0T2HAb3UIP3U4UHTbQqE/DytDge51tLj7cN6/roZQ3V0O2p0I43GsbrhvvN77lH4GE4gO3KsQN2EnwcM+WM4URke1KwqL76Xsx3ONNn/QyX34oYTIYVD9VAP+dM/PqVhac3O77e9wqtPskpCUSAtokxd8BNmbdluXIZOqBLRL/uuxcNYhARrLHB9OXPkUsaRPfLUpHNxdjfH6itgiHNeoXeccHy8IYkRJf2RRnAlfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EwvGBZDNTeDc2KfTdjP1tY2zK/b87EF115Pv1g2TwbU=;
 b=jUG9MyNLAKhQWe42kN+lVkwgagUl12ow+fStgOwDfyrtxLu5K4p2LQrxtQutCFdRHaPGrD1MCIcnRAFg2GP7PqKtmNwhvMUKhkGissf/Tr7FpbJOHhVONaYhEYljrspFb+kmGS7C6rD0QulYS25TRfjkPzQ7rRscTbHe/XqrO5u5oo3OcKt7TNKDuf9hoJSIqUQPCvoS1yHyZ7L/pzZHv0bNPd13mZt0GameDDRnYp0ULUpKqm/gCy3bB9tMIJkU1o1aHMTm9oLW4cLbderbh1+/MFS0Jh9EugdCTmL3GpGEUAI232wuDBvQOj9a0E+x+EZkL1b1J2lVHu87/ceM0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwvGBZDNTeDc2KfTdjP1tY2zK/b87EF115Pv1g2TwbU=;
 b=NbKXkubg5lGCjAz9XxuDnojVm0EtqtJRc6VGIeiekEGsSIYPNpe1cYMM39fmwwAXNllRhzrOHl98lfMIoO4XbskJQzrk2vDWTYmpf4McRJzU1Tk8SlZq8lw9mMnAdvG9IiqcqpB4K9zXIHuuYQmo8jxd1HlSAfNojbzwFGI1lekW3LOQe8t/PxJg7y9HZBFcXD4JZdP4nHRyb6XEHI3JAbq+ae1MSidqGS72A+4qQ2HfB7exXm8RUfv6d2RY/nVAQCTnO9JcHa3xIY9xd898UN08TikK4x1iOdLM40Bet8vqZ/zKPNmKgoltK/hMNxEotZEVXlWvD9QXEM6apO1Dew==
Received: from MN0PR03CA0013.namprd03.prod.outlook.com (2603:10b6:208:52f::24)
 by CH0PR10MB5161.namprd10.prod.outlook.com (2603:10b6:610:c3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 20:16:08 +0000
Received: from BL6PEPF00022573.namprd02.prod.outlook.com
 (2603:10b6:208:52f:cafe::1f) by MN0PR03CA0013.outlook.office365.com
 (2603:10b6:208:52f::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.24 via Frontend Transport; Wed,
 25 Feb 2026 20:16:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF00022573.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 20:16:05 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 14:15:58 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 14:15:58 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Feb 2026 14:15:58 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61PKFwg4570507;
	Wed, 25 Feb 2026 14:15:58 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id B3A97142E1D; Wed, 25 Feb 2026 14:15:58 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] ti-bsp: Make ti-6_18 the default BSP
Date: Wed, 25 Feb 2026 14:15:58 -0600
Message-ID: <20260225201558.385030-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260225201315.3899608-1-reatmon@ti.com>
References: <20260225201315.3899608-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022573:EE_|CH0PR10MB5161:EE_
X-MS-Office365-Filtering-Correlation-Id: dc33e999-df77-4ad5-c4f6-08de74aab4d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|34070700014;
X-Microsoft-Antispam-Message-Info: 
	W/eVrWQ2WEEUrY1CxR1uCTf3Q29Y49FoLlX0130wsoFHRCsjT0IWgTF7hKq9kpGaI8ZjJNkwjXxIGEwRrpQkwlzYs9tIVcDaIkYL5UPKU8i0lfJqgmND0+1Pvt3FbEVLV2N2kQcjmPcn3o+5NaE4MMs+cGfzqMO/eBSzhIqDtUmYUNLgwJAw5kpTBPA7QANEoMEJfm9Y2YTY2h/wP3Rr+XAkzcmVGMkd7e10T++eJqCnOvlYft5Lfj2Ld6rm0KVrUywJC2LGMt5d+xEzi4mrw5jwZL/ritSZB9lrAQebFbpaOI1F4t1mY9aHeR6+RLOy0IVgVk76bIpiZtPofdyvvrtTQJl1dLYbwO+jeq/eX/upIocV9o7PEm+EQBklB4+w0K3i9wB+tutyp1ehPUv1wqGuWeuRvIiYtlZL+eZh4ZkkXplovjH5BnZuWc54pJGrvqSFDXHmgpyYfwJJDhfplvDrQWDUSRLxU1ibhlJNDvOZNrze8kX09ciEvu+yPghfaBdEItCN/f8AttXzAqPqiGjmIfPtZtgH4trNRGHsEFbAgkunLm/zIjfwKaJDJr239WhGKhqb3ASkbcbwEjSeD3/w3UEFKmfSk1rPAljj9nEsNZD5Mv6ZLbl+fLOvSJiAngpGDZTHdIyBu51POPMmsbPa4pkcY+sro1Io6vV5kGam4zJRNk8d3DPGAk6d8rBJzDRhxRmz5f3JlMQP5+X5dGEDIpOk3XRlDmbQgZJIzuh1eS0FPYuC7oDvF21iAPwa0qC5yGbNZI7gast8ZA94SOs2I5T5VKMqzifxuG/np54/ePtZDMYS2m7lUSUw9q871QcqQpoUINVTXA0tHONZ+g==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(34070700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ZAO3BWvJDKajJY0P2/WgEiEiJF8og3CkZd2UuPaDn+x8HOGSmiDe8J7umcA6auTrAzC7DG0L+6XCxs0p2wl91EVygVEsmTSRLh/khYJjHwBxvPsNGHckF/pv4yplzq4VjNVKZ/L87RtfZKx8ob/PLaeeKOy0ijwzvRhIaeQLoLd931VJ3l1t2yOIji1Tcjb7LEEmr1FozlXulLspGb+nEGqOOFYGnHXCnGqKB9kLz0RGjDFrMTuqe4nRZ07w+MeHmBcsnk0kDBCqVAfDwvfTLqLEWpKkJQtYC2rloBtJV7TNjxscCTooG6MKcCYS3I+lKag2QEGQTfYrL5ly7o5MARD5IlrlSOSr2FclI8U6USzrjQbFc5ptU4Twh5LGAljFn2IkOY9Gf7CqibUHrnCVSAf9edZmus6sKMD5KUwOWIVH5zchXac6BZ/ed9rCiBSi
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 20:16:05.8997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc33e999-df77-4ad5-c4f6-08de74aab4d4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00022573.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5161
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Feb 2026 20:16:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19609

meta-ti / na / 20260225201315.3899608-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH] ti-bsp: Make ti-6_18 the default B=
SP
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 25 Feb 2026 14:13:15 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 2b9d8bc2d745e76b513020406fff904ec=
a3c9da1

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




