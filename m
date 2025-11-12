Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4412CD37B2
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 19:40:22 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.55])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6410.1762976421387756626
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Nov 2025 11:40:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=CPQl+6CF;
 spf=pass (domain: list.ti.com, ip: 52.101.62.55, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wuTj9htVQEzhFUY6wVWaeHeAUfc1klWhsCxWHW+lCC7paudTqTNADOlJmlIjVPkGUI3G0qwirt+cxhureQqv3DUaECX899EmF4/dds8ZeKsriHCTvBUzndb/qzyMdh7/qv4IF1nt9cWbtxM3Kt7CkrybHCEzLgC9oS32SaroQyZ0h/PUtaNrfQ2uH8UYqYtZio/AQXfTAIZzSlwNb2x/soFPTzK+sl4NFVyqaI1kHHODvce247/hS4fa+s9i1gfZL7Zil7wqPfx2syqmFvVPwNgkZmUJZXRvyoDITvkZhs0ziGdSzFUXRrWQofcerLt6YLicm+KY+ghiWp/FwPt2Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCPR9eU3ctMoQDncvpeZy+PcvOWxVXWdGOT8CZ6Y50U=;
 b=MWck0VCADL2MySkeSJSQ7EfW8wnQ0rPrdRBAI+RduIVFNwsHT8B/ub9n08elqWUpTFfkFnVirdUcmQ2rtQ5KB4KjJUTrIts86FrBw+e9oJqlaFVJizrrJ2M9nt+RuzkWRyDXmYXrZDiVOfF5WGRgWjmymGSrABlkFH4xvL88Dcb+zq1ASFYTysHPFs3LNJQv1uVLdTHp9NMwTp43tqtQt0s5H4Mtthg8TtnFw54ERu8DgA4iv/4uxj94YLgrgfWrNbTZCHRhOyzuZU/F5rYLp6+Gs/7UmDiYoQvgphj3uL4N0yAHXjTyC7ehOOcVDPGBuMlbGDM2ZUESrCQUQq7o2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCPR9eU3ctMoQDncvpeZy+PcvOWxVXWdGOT8CZ6Y50U=;
 b=CPQl+6CFu60xkEcaISD0bxntm9HqPK1QLKUpmlZYGhfT/IcoksVKsKjwMf6uDl/fGerStlT/Ie9BHsgKXRpMXDUxsE0XlikcYfqz2tKkOgMuaTRt82P07p/5OlGP9IC+Ivu6goMToVywMMY4PfmylL9rvS11mfIzE1zkAKd0tic/RYcPdRvvb90jkvXVYGgEH+k27BsBgFoY8+cfgoSSIYoImHySEPtZpiCnkdHeD0ZDShn5L2ihGd5Q4/Xu+dDo6Ax5QJZZvoh4b2XsvYaG1uT/ksV4lDBQ7bcnJIsDkqu7ZaNiv5JgF2OxDcoFRnAL6pSKpzPUbSNTufiwFN9dAg==
Received: from DM6PR21CA0016.namprd21.prod.outlook.com (2603:10b6:5:174::26)
 by IA1PR10MB7417.namprd10.prod.outlook.com (2603:10b6:208:448::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 19:40:17 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:5:174:cafe::c6) by DM6PR21CA0016.outlook.office365.com
 (2603:10b6:5:174::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.6 via Frontend Transport; Wed,
 12 Nov 2025 19:40:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS2PEPF0000343B.mail.protection.outlook.com (10.167.18.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 19:40:16 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 13:40:12 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 13:40:12 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 12 Nov 2025 13:40:12 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ACJeCT33200872;
	Wed, 12 Nov 2025 13:40:12 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 9E0F1138B5A; Wed, 12 Nov 2025 13:40:12 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Antonios Christidis <a-christidis@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <rs@ti.com>
Subject: Re: [meta-ti][scarthgap][PATCH v3] ti-img-rogue-*: Migrate GPU driver version 24.2 -> 25.2
Date: Wed, 12 Nov 2025 13:40:12 -0600
Message-ID: <20251112194012.244626-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251112193739.3664379-1-a-christidis@ti.com>
References: <20251112193739.3664379-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|IA1PR10MB7417:EE_
X-MS-Office365-Filtering-Correlation-Id: f032b990-ae5d-4c92-d793-08de22234dfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?m+tLiXS5SONXTj+jtTzbTzM7tcflUgu51b7OsFC7uN7w4B8s46YbDzuG+rsi?=
 =?us-ascii?Q?QuCBC3uovBKJPYQfeQFYKpwpUzseRlHdflFcTu+3VA+JxLoNFPI/n5cERG9I?=
 =?us-ascii?Q?3nO7bm9NopkQn3xrc+rZEYOrtxmyRG2PrNU+3jYcf1Dwv2mbwRWDNtx9uyB/?=
 =?us-ascii?Q?SLmOvm4mkqwinWC1FR80xD0NVdEjiSNUqjXUApITbDEkVtTCEwt6zgDYxmqR?=
 =?us-ascii?Q?M9jw1aDJD10CSHR8VzTZrgT7MaA1tXBtG6j80tWc85To+R2VxlFCFlmWpSRP?=
 =?us-ascii?Q?YJYfllwXElzj7PPx7CQ4AB6oTtXyQPmOqbDRU3zxAMPz67IxEoGmsdb3qpTL?=
 =?us-ascii?Q?0bzFlUnBW76JWrHL9HiKKe0J8tBzML1LwwHx3Yf7EDDmCGQ3JOobp0TpeXNb?=
 =?us-ascii?Q?Ib3p8RPuIMruG8RaSBXOu6Lmp3zw9+Uu3YHPhDJWUdYM2R/lNmjs7YPjkH5j?=
 =?us-ascii?Q?5c33lmbr2y4HWspchP2oxMeMAJwPQ4l0+23RwlksLE1wuL545mvfzddeGp24?=
 =?us-ascii?Q?Vgmu2fCH0+8Lhf0fUWbtitZAGRQCOrtQ3ETC4sL/OLcXs/52RvTkyLQLDg0f?=
 =?us-ascii?Q?R2fWJ2mSB3dxEv5fzg8F2erYAgBL4VX9QsD2ZqlbqzxsNlY4CaJnDYhPzczC?=
 =?us-ascii?Q?M8CO0glUF9VEsGs/38q/JSLd3Zv9qRS5gI3Z622sfeq6ULVu/n7EVfa9PUNO?=
 =?us-ascii?Q?8mfJYTYrLEKpkOvb+4pfsWBsVXQYIWUsEDWgudwt4Bwaqo925ynqLrVrhtui?=
 =?us-ascii?Q?BhJIyc6nAxIYOm5CZpvEw/G24uvqHBSnPr0yxDrniGbCwIfSRLimL246FTOp?=
 =?us-ascii?Q?VsP4O00qdmLZgS293j4yL44/sDLen2S3GQZJfrYqOJO12T2vsJrTYzZzGEQo?=
 =?us-ascii?Q?qD4fq9Oa/DmWcIxHEiyl2x4DPXgbmmp0Rw9+OPdmrX4r8sKerAEPyjtAfP9V?=
 =?us-ascii?Q?oMZvOu0lTCao5cu7QVEkt+qFbrfjsLds9sTu3tXcEkVNV1AIauSNLxMa6G1x?=
 =?us-ascii?Q?EB3Y1qC/erZn31DEVpRv5ebrjc8Z+VGqMEJ5i5mkRb0tTbbIMBc1Qv80g6vh?=
 =?us-ascii?Q?HkoCPJ6qFDv1jSANZZbQ1Jfjw2WfxPyTVLdCQtjp8gMbupmVDFgrCYwWrElO?=
 =?us-ascii?Q?KCy5QHrILbnhFolvTuIUcusxU3ul4u+d8HHbB/oOxBZNhteoxk/nWvk15cgJ?=
 =?us-ascii?Q?qHYbcmGeg+N9yffVLOj6GHtGAc0OBzqk8xRf9cjmdORMmq1gkI4M7VGUzRYs?=
 =?us-ascii?Q?+m6NLAuT3fVE5HOP6qg9oyC/1jdV6aLLxWOKjG8HnO3FexmKvwPpQyHZV3kS?=
 =?us-ascii?Q?VMrqCvmVrgA+0ldUDccUTbmdg6KB1qtbcAwAi6F9t3AtTiBs8x1dMrxq5znU?=
 =?us-ascii?Q?7yD+KL31sRnRk/PqQR5l6WWXr6nm6QR8kX3AFXXgdKo/KXF2n+SKUcPJtn+r?=
 =?us-ascii?Q?GpavPsqDBzwt2fDOCqCMbfSW8dKVJsBq862gQVueEi5jHuZgZYUgfkeGuKpC?=
 =?us-ascii?Q?DOP6hIswMgviJ9mAAJYxK8M0unGl5E5z1pTTv8pWU8P9Fns/kg+An9ZAuoPp?=
 =?us-ascii?Q?EuIOMTpdYxj6mrdwWGI=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 19:40:16.0238
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f032b990-ae5d-4c92-d793-08de22234dfa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7417
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Nov 2025 19:40:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19256

meta-ti / na / 20251112193739.3664379-1-a-christidis

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
WARN - [meta-ti][scarthgap][PATCH v3] ti-img-rogue-*: Migrate GPU driver ve=
rsion 24.2 -> 25.2
    WARN: Commit message does not include file/recipe name: ti-img-rogue-*:=
 Migrate GPU driver version 24.2 -> 25.2. (COMMIT-MESSAGE-2)
        patch



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH v3] ti-img-rogue-*: Migrate GPU =
driver version 24.2 -> 25.2
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Wed, 12 Nov 2025 13:37:39 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 993320811146f616c5c0e67e989605696=
06c8a04

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202511070802
- Commit SHA: 5b095d968eb225b72e44dc164683aa9157ec2b93

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
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS




