Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DDE9CCFA13
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 01:05:36 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1492.1762477522691914956
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Nov 2025 17:05:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Wga/sSTQ;
 spf=pass (domain: list.ti.com, ip: 40.93.198.12, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oyRor2I5hDAbvhmBUYBTVVbMgNpoK9QpPzn790VS2hj+oUUv1Fzz0RWkm3RTFDdnOIJ3JZco32tB2tFP7EL8EwAvQJNNJEqgDP6DXSgu+SpcYySSn9DHqm06CeeUFUrwBxrQgBHKkZtKdZ6HYTAiMkY5Mq+NdeJAtwhze+gZY92/6cRhD4mKTCKh9Lew+PWd8tcYCDKIHRoVzZbM6wSwUus2V4v8g0bzvPitOdcn/rl2oNId4bzRcJLY6R6/07vhAzW5WlRFg+KvdNPRgg+8MHEFBockOsiIjBBRGMtRdlOz1ltbbnOoOLKolL6I3hGbw6JB8P/6EKwIiXIZNkwHhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EiEGjbAr+3o7/rhlQ9Up7nNzXuPqNB51Kv3RuDFRkTo=;
 b=C+E7WpxCg5uiFFIK5+asGD2cVGW04kQlZFy9hznMdYzaAjFpkN1FOYX9rZnRO+xFQ1b65BSH2TtUp+4+xp+47iv9t8SGZ2yONpHcRvLnZSqrA8+ur+RkFXFajFUrjPYsjO1RhRWLZ1GZJ9GCEgdj80i7kek76Kp4FS98d6gFwJsYzwmdgtH27MLpH24QRXl+QS7EYnDwapx+kIWH5Peqta2RkqO/Sw0awAx36CGMSNiH52M+jm2JLGsmd56mhtnIYPHeB1+FsGlnRt2jPCR923eCUGPNozMnpXP4DqmKpow5wK7sCB/dRNZNnw1YNA1ebUH37rQ4zkrGvDccxEwLgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EiEGjbAr+3o7/rhlQ9Up7nNzXuPqNB51Kv3RuDFRkTo=;
 b=Wga/sSTQMBw7NcydCxuAGCa/4VluTwDB+4fuSmgWbYkTcjdqO+jyd8ueuuISXB7JVUtNhnABOylhpGIfoDvbMy8kRoRJM8Tvurt4siBf9mZgx6crvEVwdVMCkSY+vGPS2xpQqKUY0ogikkMoX5wW34VRgKjzwrGG+dL4vzLPW4dH0AszoG0xxQ0zbXzBp1QNmVSKshYNENFmgTtJ9jgATd879d24Pz2JiLzYe8XWhfZj/EnFcK1m6DR4jh6Bs1RUIIWtHtL3+bQB5bQT+kaW/UXbJ7J+6c2A3JEFpL8XBG0hygYuTNlYhBCD3m2bh/avr+EeZXbO1C8bK1goS5DXVg==
Received: from CH2PR07CA0064.namprd07.prod.outlook.com (2603:10b6:610:5b::38)
 by MN6PR10MB7421.namprd10.prod.outlook.com (2603:10b6:208:46e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 01:05:19 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:610:5b:cafe::85) by CH2PR07CA0064.outlook.office365.com
 (2603:10b6:610:5b::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.8 via Frontend Transport; Fri, 7
 Nov 2025 01:05:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Fri, 7 Nov 2025 01:05:19 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 19:05:17 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 19:05:16 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 6 Nov 2025 19:05:16 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A715GXe1569099;
	Thu, 6 Nov 2025 19:05:16 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id A4D0F9ACF4; Thu,  6 Nov 2025 19:05:16 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Randolph Sapp <rs@ti.com>
CC: <praneeth@ti.com>, <reatmon@ti.com>, <denis@denix.org>,
	<meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap/master][PATCH] layer: add github MIRRORS definitions
Date: Thu, 6 Nov 2025 19:05:16 -0600
Message-ID: <20251107010516.1336503-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251107010115.1974047-2-rs@ti.com>
References: <20251107010115.1974047-2-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|MN6PR10MB7421:EE_
X-MS-Office365-Filtering-Correlation-Id: 2126fb26-1c6f-4988-fcf0-08de1d99b87b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|82310400026|376014|34020700016|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7SbmQBIS1l1NaWG3yVZKXkQZbo2VirvxPBHgAqKhGKUL1dhLBwjJOPMFEqOG?=
 =?us-ascii?Q?tR+ruHHf3d5vQeTzoHBjpLHpkMyc6IEOPCHR6fWC8zVh+NGVR8++FlpPYbr9?=
 =?us-ascii?Q?Pvw+HQzLcznmvI/UxSty/qnU9MnEL0kDzq03J8y2mzldBaAMDLMkikHiHEH1?=
 =?us-ascii?Q?1o3jdASc0QuwAMaYgxs0mERPC7U6EyJzlWx3fgIbjXamW4OGE+4YAPyJ8ciP?=
 =?us-ascii?Q?OpNzZHq5OsIDgwFvcr6Uj17/dOCHqzwMPp0+ikKTM0YwTkYllPNXzhtP75ep?=
 =?us-ascii?Q?AB7RD8+87e0LBZjos4JL3oT8LXxs36EuXOlHOH9r/yh/Hp9EljtZL2SvIEOp?=
 =?us-ascii?Q?QaIEFRV4j4LWqLBAIQvlrcVtb909Wk7cg7kaA48EC89uAmOaPG5AJkxhgnKI?=
 =?us-ascii?Q?SLoAzFaDL5A17LSd9n3Avt/6yNaxkmCzNHhTuqTTb4VOuuKBeMCO6Oyuwblr?=
 =?us-ascii?Q?frxEsh88uyDXwQpKWKcTmTRFIvbBJtSLhSFY7dGuSS4u9vEe6dvDYT6lopm5?=
 =?us-ascii?Q?A5cDAEVtFXS1qyH3libU/1B7Jh08/2Xce1BPPctTkXS8Bu62et8o65DaSVUX?=
 =?us-ascii?Q?zQvSMqH+pzX34DKeEIfe10ZQTSQSknx7Bti/yshFUgs2Y5aorcFt686phxRd?=
 =?us-ascii?Q?ZJEcGkYR8HllLYttygxBZNkY5AYQYYNpQd6PbW/pAy4fzTGKSpHM4Ym1nQIh?=
 =?us-ascii?Q?QAcVEWwkgaCdhqXw7B0iqQiZGVqCymCPLVEc1wB+yrr/fsTys89N5mJT4uIi?=
 =?us-ascii?Q?VbCdutAAhZVXNP73YXzjm+RBhnyNMD8dnoKugJcQOnw6G4tJ2q2O4tl/Xl7A?=
 =?us-ascii?Q?TL2Aehm2wkSGdt9mic35ulj7mE7+FskCFY61qYqwIzcJ6tYbkHRYv5rktFo7?=
 =?us-ascii?Q?yB1EmVVIIJRdTFxOid+FiRk1Vk86q5GdglojT6rkYwb7OdbRSHbr8CTwMpwf?=
 =?us-ascii?Q?lGzcrWSp3PujzSV+w+uBdTYfAGH+gSuz8kgxIm3i1xCb57GkfJEpLJrWVztj?=
 =?us-ascii?Q?34h4YB8DumG+Wiq8C8JG96HEwkGzywze/V1BVlGiRaresqHK9QPwEWITSO5e?=
 =?us-ascii?Q?qwrS4xcLjPx8nwIB6yHdsZkXLqETalbRzSHFdF2z+5XJb0kHM6dhNbUpkT7A?=
 =?us-ascii?Q?bAnAqHL4MrECXdU7TRWmiggiz3qi6m/wnn9QZk3THBTONpPEa/NRr9vzsA3b?=
 =?us-ascii?Q?tF7wYRtPuN7UbinL3wSjAdL/mHEN5akETldPpUW/6BYtB+n/DeZdQZKSpbJf?=
 =?us-ascii?Q?da0bNYSeSabGOV2b5mw+/TQJG+fz/BCJNbZu+/wwaesk5iRsXw7WukzKiXdD?=
 =?us-ascii?Q?GDz8SXFiLQnVTvaLlNXOvoflP3MnNr/HLno/oCZyrDFjNebq1cteriya9Ps+?=
 =?us-ascii?Q?aXmVslA80G5ZKTFyKdziqALiu28WwVppWlJVOOD2gSPHMTmLRqu9iSJifEqx?=
 =?us-ascii?Q?wFDZ7oFHvRHJGwayXLm4HMVGjN7arSIhB6qqs5ibelQ9Dz44WUaV6h/Hdvcn?=
 =?us-ascii?Q?FP7vNCGNOxrrgR5X9ibk8THk8ScLz948JURVIF4z/oDgmzNEwlu9mLfHtDcQ?=
 =?us-ascii?Q?44qKcO4U2XLdNCxnLxU=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(34020700016)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 01:05:19.5218
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2126fb26-1c6f-4988-fcf0-08de1d99b87b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7421
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Nov 2025 01:05:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19234

meta-ti / na / 20251107010115.1974047-2-rs

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
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][scarthgap/master][PATCH] layer: add github MIRROR=
S definitions
- Submitter: From: <rs@ti.com>
From: Randolph Sapp <rs@ti.com>
- Date: Date: Thu, 6 Nov 2025 19:01:16 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 20f49577563b42818b14c485636e11765=
2dd7335

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Vishnu Singh <v-singh1@ti.com>
- Commit Subject: recipes-bsp: Add TI PCM6240 ADC firmware recipe
- Commit SHA: 92a0b3c1bc93bc8d62b5140b7e1d4a45c6f9e65b

Patches
----------------------------------------
All patches applied

master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][scarthgap/master][PATCH] layer: add github MIRROR=
S definitions
- Submitter: From: <rs@ti.com>
From: Randolph Sapp <rs@ti.com>
- Date: Date: Thu, 6 Nov 2025 19:01:16 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 20f49577563b42818b14c485636e11765=
2dd7335

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: j784s4: Add k3_bist tie-test-builds config
- Commit SHA: baccfb9302822df66ff0d9435a28be1a80d3865f

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
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS

master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
FAIL
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-ti-bsp/dynamic-layers/openembedded-layer/recipes-ti/initramfs/=
packagegroup-ti-core-initramfs.bbappend
   =20
   =20
    Code Summary
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   =20
    GUARD-1
    -------------------------------------------
      To maintain Yocto Compatibility, we need to add a guard around the
      .bbappend files for upstream recipes.  In the event that a layer
      is simply included in a build, it should not make changes to the
      recipe in a way that breaks the upstream recipe from doing what it
      sets out to do.  In order for our .bbappends to actually make
      changes, we need to gate them behind building something either the
      Arago distribution or building a TI machine.




