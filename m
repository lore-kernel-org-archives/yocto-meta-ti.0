Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0BB2CCF9F8
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 08:55:34 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.39])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5353.1762332930162477565
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Nov 2025 00:55:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=uJhYRKOq;
 spf=pass (domain: list.ti.com, ip: 40.107.208.39, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lkDXdfCHvekrV+4wjbEhJ47JwSg6ttAOhMtQEu+t2KHl9kxVXBQT3BsBQMcbf3cxpmN1Qj+hYqRB/MY9RQGN+jNd2pycAfDrIR1fYmByy6PYTbmqqjzUKWEmNlmVjN3cnxv5eqCLbzpgNunpNrownZg1zd2cmhaTVFTXaSC5/5BJ0exLj3jNAoLpqhpYGQWSoz5D5iE+97C8AlmrnIjRlWqy1p3m4Yl9YtYQlSi0udyaG2TgcFeR9chBM08HxDzZF/7xpOdi/9+iaEagziFu5jXlKeNsqA3J3OsGC5b5LGSgZZVdIwTgi1y0eTPom9sdMy/iU5lDGIPLLD7Pn0DPLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yOKcvU+KR1ZsQqzaoe8JmGG0Z4V28cx/n/0oUPd8y9E=;
 b=vX/6n+Y/K/rcmhtVH/j/SFeogshzmmWP8jEISZa7yLr2zTMwaS6QH665Osk2lo+2jB8efhPeBF3WX0F8foERm39czrMW45ETPCzFbTABgnPhycRHGq5gIKk/FwtzeppJHRKBxUu7Iq5NxMtB/JZeEuTCP6wsrFUH8Eh4tciA1YILDvnNsxPUvtZbGgUIwjChJUks4YXf+8wVE6vPYPo01QmhJnHJyzWmhaHC4udtKxTf1uFT4sipv39f9nVtiGcASyp6o4MP6OGkbtsrvYsjTfvFS4uI0mjIYUPmlMsg7OYnnnw2ZXJu9xcXS27EsZG5b5RgeAz47xGk8S7W+Onrmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOKcvU+KR1ZsQqzaoe8JmGG0Z4V28cx/n/0oUPd8y9E=;
 b=uJhYRKOqJszO6Qy8W01G9T8LJvP4aSdtviBBsMEA+4SCGeloPcTgKmKJvBWT2ImmrUhF3v6jLgw5daTeILS2wpUFm/YIkNL8rgB5qTZyz/gY9Fb4j+32Nmrm5uv+iCgxpl/uM6xd1hlCeGDROte23hliSJDYwJwRQubfvsEJPl1WFqLiFAaKHIDFYQxCmYPqxmTVhkJY4LMd+S3KxI+c7doLzokwN4zxo3Do/1F/MKzhRtfjSmT1IpXrxAzoI5+eGA+kM9dLsU8w1tfsXdcChEF6/t+6GnphTW2S6uZgMPjEvp8KmL+MatK5oRTmHUpGDgwOBHSpi5TKhFRRnjxP7g==
Received: from CH3P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::13)
 by CO1PR10MB4673.namprd10.prod.outlook.com (2603:10b6:303:91::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 08:55:27 +0000
Received: from DS2PEPF00003444.namprd04.prod.outlook.com
 (2603:10b6:610:1e8:cafe::d9) by CH3P220CA0002.outlook.office365.com
 (2603:10b6:610:1e8::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.8 via Frontend Transport; Wed, 5
 Nov 2025 08:55:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS2PEPF00003444.mail.protection.outlook.com (10.167.17.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Wed, 5 Nov 2025 08:55:26 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 02:55:22 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 02:55:22 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 5 Nov 2025 02:55:22 -0600
Received: from fllvdckhpci032.itg.ti.com (fllvdckhpci032.itg.ti.com [10.64.72.43])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A58tMOf3396297;
	Wed, 5 Nov 2025 02:55:22 -0600
Received: by fllvdckhpci032.itg.ti.com (Postfix, from userid 60899)
	id 0954C1436E3; Wed,  5 Nov 2025 02:55:22 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Vishnu Singh <v-singh1@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <denis@denix.org>, <praneeth@ti.com>,
	<reatmon@ti.com>, <afd@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>,
	<j-sahu@ti.com>
Subject: Re: [master/scarthgap][PATCH v2] recipes-bsp: Add TI PCM6240 ADC firmware recipe
Date: Wed, 5 Nov 2025 02:55:22 -0600
Message-ID: <20251105085522.3627025-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251105085021.2030969-1-p-bhagat@ti.com>
References: <20251105085021.2030969-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|CO1PR10MB4673:EE_
X-MS-Office365-Filtering-Correlation-Id: d296d9da-0fc7-4d4f-7f12-08de1c491031
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|376014|82310400026|34020700016|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MdjYX6h6Mr4roV0yvPU9K1C79Qg9ROF4+fVrxs9H43zDYvQAGyCvFyMnDdEF?=
 =?us-ascii?Q?LhPIIoS/enojJka8joTbzgGFWye7fO1hPF7Tudma7RGtsPg7JW9NtAViKFxS?=
 =?us-ascii?Q?uTzuKo6PddJqL2pkvFkGpdJc+MP+rvzoSKSlkIA3qLkaf4Fv/YdtuBu629Z2?=
 =?us-ascii?Q?VhQ9T4YCghWk6M4QlAAtuMi8Z2iuz7LjhIXLrfO0qO/QO10rUy8QHMfHzRpd?=
 =?us-ascii?Q?ZDS556IPpFuUxL/88kHx4imP2Nfizh95z7QsQ8b41x0N1C8aQSVSVN/BpViI?=
 =?us-ascii?Q?ks/SliCvS5KA6U473qNt2eIGBjaEDPC/P4pp8eSWvl6bmNkj6q8PUwNi/ey9?=
 =?us-ascii?Q?eeV5xtnAdI0fcmrERAtkSI7jJ4dh9G7QwAi/Wt8VLdTfPofOXp9lvPssg0DM?=
 =?us-ascii?Q?exFFCeh74dMkEd50PiJ1l6kSAh3YbQqFm0J9SF/wGduBCMpUebnB0XP0yv3Y?=
 =?us-ascii?Q?9XgI5/ezAKvCorY28k1++bE4hgpIy2g2/lt8MjvbbsI4U5nKLLdGN5xgY5+7?=
 =?us-ascii?Q?A/eOJASwv9vL23QYqP1Mx5L2d/jIdhvCk1OdSNrJArf518plIMntts3aI4ZT?=
 =?us-ascii?Q?wW4HZIYZnUyibsG77jm+6oDG/B7nfp/+hhThUYsXmt8Q0DiL5UZAxttOs511?=
 =?us-ascii?Q?V8EVYOAWoZrHPThIE6w/JKpfOmvcthH6wfzzCGMT0C7pZReQd7NSUX5I2J0p?=
 =?us-ascii?Q?G9IWmp/9pRyQc2N4jGrslBev6gPTmtWooqAeWzimgGUzsEo+0KM3n5BPpr/p?=
 =?us-ascii?Q?5SnrnL4yjVnSmbSc7b39ycOWienudrkHXrhT5bbBKqvvW8jbGkr4gVMDYJV4?=
 =?us-ascii?Q?w7LHud2SC5avYsw5os7V5keg5oSkfeAP6ewpVfrqDeSsq5k7WSQfqZh2YVq6?=
 =?us-ascii?Q?rggJ5etXUS/Ix5eEeqfbuTmBEu/J+EEPJvudZt450clfYDdrEQRHvN/BR+ds?=
 =?us-ascii?Q?dGspqud/Kwn9atFOOXWT6JuF95fyRRunO1L1SxqoKkrhmKY/n61Z0HrjN7Lp?=
 =?us-ascii?Q?ohV7VDTjVkMUpKCFuX89Bc8HQUdpgfBc4JrZfChbL3mdxyOqAvfkxpo3+Mi0?=
 =?us-ascii?Q?7gkBYTHCKXjD+bV1o2XBelj9CS1XW0HfAelMr7iA3pNtSoXoILnlhjDGk9vO?=
 =?us-ascii?Q?t/vP9t1/4muhvQZeOsLnrY/YquVvfMeg8+Wdh5rjFXsRKgSNowuSsIosCp/X?=
 =?us-ascii?Q?B7mjsuuU/TjaChhB5a+Sx4iHBQmv740d6LEPzvI0PzTJNE1uZobb35MiCd8f?=
 =?us-ascii?Q?27mbuD+mUbNPmbvz08EGsCHDCPwauGEj3OdHwn3lADCtwE541eOKneH/bTRO?=
 =?us-ascii?Q?MRVn5l2RSVNokNQkUgUZlREJT5eRfkGwXqKba4eZeeLNooG+IzvGLe5wbk07?=
 =?us-ascii?Q?agoPJYucGOZH8W4Kv6+hZCrz2vuUMvKiRHzptyyBuR/Y9UjFIjYMAFUWyyFc?=
 =?us-ascii?Q?b2SBAHN5SVLDpgEo1itNZ180vsGQn36Gvy+YMfyELo+9zyNViQmiDyew3zlJ?=
 =?us-ascii?Q?fecSqv8Q/w67ZpOzzyg2eUcsQVKlQALjKiKECBH/XzK9w4tB253e0FGb7f+G?=
 =?us-ascii?Q?S5GHeywAnYLBt80kV5Q=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(34020700016)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 08:55:26.2418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d296d9da-0fc7-4d4f-7f12-08de1c491031
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4673
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Nov 2025 08:55:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19230

meta-ti / na / 20251105085021.2030969-1-p-bhagat

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
WARN - [master/scarthgap][PATCH v2] recipes-bsp: Add TI PCM6240 ADC firmwar=
e recipe
    WARN: Commit message does not include file/recipe name: recipes-bsp: Ad=
d TI PCM6240 ADC firmware recipe. (COMMIT-MESSAGE-2)
        patch
   =20
    WARN: Commit message should not include directory path to recipe: recip=
es-bsp: Add TI PCM6240 ADC firmware recipe.
              recipes-bsp: (COMMIT-MESSAGE-3)
        patch



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
- Patch Series: [master/scarthgap][PATCH v2] recipes-bsp: Add TI PCM6240 AD=
C firmware recipe
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
From: Vishnu Singh <v-singh1@ti.com>
- Date: Date: Wed, 5 Nov 2025 14:20:21 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: d31f2cb2fb90ec51206f2aa10ba3854c0=
f85566a

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202510310100
- Commit SHA: 39b81fac904906007772dba3100fa92da28a3c91

Patches
----------------------------------------
All patches applied

scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [master/scarthgap][PATCH v2] recipes-bsp: Add TI PCM6240 AD=
C firmware recipe
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
From: Vishnu Singh <v-singh1@ti.com>
- Date: Date: Wed, 5 Nov 2025 14:20:21 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: d31f2cb2fb90ec51206f2aa10ba3854c0=
f85566a

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202510291355
- Commit SHA: f7cd5f92135bd53a843b188bce559ec894425766

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

scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS




