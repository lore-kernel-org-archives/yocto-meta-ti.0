Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 371DECCF9E3
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 09:05:47 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.60])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13390.1762851940513592815
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Nov 2025 01:05:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=JTi6jRp9;
 spf=pass (domain: list.ti.com, ip: 52.101.48.60, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NuyShC2s/T+HlRevKdlW/ve5veKDOHS2plNpz1GxTM8dX5IchTaO89qg/Vg7JteTm2GGTEIeiGRg+ivU40L+JjD4Rr1tQfcFffOfwHJs/0voFq2wHUhYsDVyw64ozhKcQlhhQjQvsgWrYXq5TNabEWr1aQacpWBIX/BJlc7s50GnD294T9g2TcIOlpnJHQgrZ8PkKGX653USUnKSrTj0aYGye+BFHMZMECGYFJhGDlBX65Qz9JhMrWMpOaCrFexghEEa71RcLV7fi6eX3Zy3TD+V2MJf0UxgvV23BgAm7cMct4elwsfw5vFukpb/CLssZmla6dW6xMWa05pUNY2E+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5bkpE0tvtD1Aa4rRHC+g9HK+EYVxfUGhjf5Z+mf4hxI=;
 b=tItQumy6WT+dkbKXMo0ClTDco5fsXCsRJWhnu2suwgmiQoXx+HN9yHxDdRU2wj4e8nK/CHWLtDQoBEngjZXyLpmLn6MIa7+erxRWGm+xFEd0eZ3E8l8jf9JNnv6hxAAoOEMXj2J98wA+J+b41D512Mxnic0Kof+yRl/qMftyzqcK2fbkqgYIoHJN3Pw+E6Zy9Jwl9jA49IUU56uPuttqf0hiUjqXjiuB2GBWGGKdHj85oLIaZVqagB81XZsVsX134bRJVB9bL96pNAeAkBVOLq76767qtrLmUHop1eow3bZ3O6b5ewoFLa/aixqNYwVtLXgDNl5QG543Mi5lwZJ4gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5bkpE0tvtD1Aa4rRHC+g9HK+EYVxfUGhjf5Z+mf4hxI=;
 b=JTi6jRp9maD5cYx7atArzBJQyQzbCZSVIAgAzA/9VoM+7yLaIbqDDv0NzR8JzQFnjMmz6ESn+o1cPDtBFQul4nyNbafCHT2jOHmZmKdjTmZmNeOyGHfvIYdZPjlvDrEbGQGCqzI4CeApSFcrQnD5Rc0TU8h+G4E+odhz+p3u+A6K74LL6i+FT8c5eo3tE3WHJ/nBZRwuV495f3fu5ohig9FrRu3zVPzhjjjaeWtOSv4/Dzq3ro1fThc0h68axYi0ZvDVcMpUh6C2WeEOZxbJNoIWa7xljtocm1LNuKExhuhc0cMVyG86SJZa8e9SOKMNPIsLTuXJQRtTNURoLnHpsQ==
Received: from SJ0PR05CA0203.namprd05.prod.outlook.com (2603:10b6:a03:330::28)
 by DS4PR10MB997574.namprd10.prod.outlook.com (2603:10b6:8:31f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 09:05:37 +0000
Received: from SJ5PEPF000001C9.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::77) by SJ0PR05CA0203.outlook.office365.com
 (2603:10b6:a03:330::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Tue,
 11 Nov 2025 09:05:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001C9.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 09:05:36 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 03:05:33 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 03:05:33 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 11 Nov 2025 03:05:33 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AB95WCd660825;
	Tue, 11 Nov 2025 03:05:32 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id DED4A9ACF4; Tue, 11 Nov 2025 03:05:32 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202511110100
Date: Tue, 11 Nov 2025 03:05:32 -0600
Message-ID: <20251111090532.653301-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251111090023.3949505-1-lcpdbld@list.ti.com>
References: <20251111090023.3949505-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C9:EE_|DS4PR10MB997574:EE_
X-MS-Office365-Filtering-Correlation-Id: 320480a8-c269-4732-c20f-08de21017aa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EszUugpGycrAUIeNe0ADKsAUeG4bfssnVKblYbqQxhh7VvpVCqaVyAnsr4Av?=
 =?us-ascii?Q?hgX4b3zaH/IU1HnGSQL4IMe4DmrntksJEDjrD3kpKkiQE9S4uwKtsl+mksr5?=
 =?us-ascii?Q?tkcpNHeGE5iiGxNAczUSNHh7h3WS54lRhuMo8nHlvZJ/BpSd7m7u2MHGncpN?=
 =?us-ascii?Q?6wvT97bskifGovGsUEa0j8CjNrgjZl3GK0ikRlwSmngImSBGjxHFLCogqO1d?=
 =?us-ascii?Q?+cJivAo0g3PE00aNM9MypFU7hzCI0LIZfNH6OyirDqdXF+e0TQO/OauTPZSl?=
 =?us-ascii?Q?PiBbtIqh8MSq3mlAB/e+0/xwiq6z3xt9tc+Cuon32FQiqBzKoOXztonUT0oo?=
 =?us-ascii?Q?PHpfvOfkWpc7NRlhK1JGeDllDHob0vM5x8uY6C74FE/VRCRh6QwK3UKBC8qB?=
 =?us-ascii?Q?5MieUtJXhScgwU985MQA7RqyW0m/TmwJhi3WPKxT6PeLgNGDXhJt9WDdBkN6?=
 =?us-ascii?Q?yimk13In4icExN/WxvhZ+cXBsR39bfnHYUZ+a7NjPLYQRYOJhQZVUQjZbwVP?=
 =?us-ascii?Q?dR0LuakP28AFCjwPW3h95lbuC9T++CuXJsTB+Cr6UMwcauTJSeoSAKrQOk8s?=
 =?us-ascii?Q?mkiqtQQ1eDI5243KK0VR5XvYhZgs1CcYkpBH0D6zEQWDOi9AJ2VAKukLUWK6?=
 =?us-ascii?Q?tLPD6uOirTCkRgHHHhE7VTrXVWd08w6fIZllmz+2YgtqbMpEd4JRSRlQU5Ta?=
 =?us-ascii?Q?OCcX5FbnqSMLQqFoa+utNnKV1MrIeGyY7kjFBXgCgy5a+M3NW3eNwE6CH2jq?=
 =?us-ascii?Q?NocDDe1CCxGACm+TmFBJXkuRWqt3mp45lWzDiiJL4Aldqq7dv7ZgeN7bE+7x?=
 =?us-ascii?Q?MsTtMewbBjk5HzFefZCYxxd9Fvto++wwCyZT+bXi3XCnUZTDmwW/n8xtmyCw?=
 =?us-ascii?Q?0eTDOY8jjXxmK8jc1yk6hsucYtDPvEcepe2e0nZFRIvjUA1tRlCPf+eHp6EA?=
 =?us-ascii?Q?JMFTa8esvgEa43tqETXczyRLaap60O+PUr4+t0yqLIEClEZ60yfWdV3MsiPF?=
 =?us-ascii?Q?3akCh8q2Zdsf4osV3z+ZmWBEHjwYhyBTHc/BAdzdU38PoMQ8DMqmoNNPTa4i?=
 =?us-ascii?Q?U5PZ3kk9VOmJIkzatBLAe8GQEsBKHsCdU6xgPtBDVSOUaPIZPghzs5cq/CxX?=
 =?us-ascii?Q?L2TsSa6yGinU5c8iXgKrBNimq3axP5AWmcR0EOLUXtL9vlZMyyE6XWczdvf2?=
 =?us-ascii?Q?+ymtKlb/n8bncjs4CTmFVh+V2/RZhidbnpS/IHCIkTcixnQRONzRM+M9fBAE?=
 =?us-ascii?Q?GJ4prGgcCimdYLYANqaGv6GMAyJCJKocOiORok/1yUMuwsEYNp3O+7FIRJ1g?=
 =?us-ascii?Q?JeylEJBKVkXln7IQ4Fj26QNVPhFzgCNXpoI81ZlxobqXqAA7Ww2hkEoqYcKo?=
 =?us-ascii?Q?mjcELfMfPykO436wbhyFspDDYok5ZjEyTPiZJBiewmL4o4bfXDsV6tUHmcKD?=
 =?us-ascii?Q?K9X3TIOhINLc0wQ895MjBdEvpcciiJYN7jipImR9CVg1/0XqksfwVRKznDEH?=
 =?us-ascii?Q?/rJdcYepmDdUfPotWHklwvh4z+hcBTAEPqeJm5FWHdopcOSfaW2dqKdRLg0q?=
 =?us-ascii?Q?WH6vjoo72FVl8RKNJhs=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 09:05:36.7990
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 320480a8-c269-4732-c20f-08de21017aa3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001C9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR10MB997574
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Nov 2025 09:05:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19244

meta-ti / na / 20251111090023.3949505-1-lcpdbld

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
WARN - [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202511110100
    WARN: Commit message does not include file/recipe name: CI/CD Auto-Merg=
er: cicd.master.202511110100. (COMMIT-MESSAGE-2)
        patch



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202=
511110100
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Tue, 11 Nov 2025 03:00:23 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: c742d8787718f1d55568333765c50b710=
2522254

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202511110100
- Commit SHA: 7cff97509da2af8957c491aa9f7581c9bce442b8

Patches
----------------------------------------
FAIL - [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202511110100
    error: patch failed: meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.in=
c:15
    error: meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc: patch does =
not apply
    error: patch failed: meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted=
-firmware-a-ti.inc:8
    error: meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti=
.inc: patch does not apply
    error: patch failed: meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2=
025.01.bb:6
    error: meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb: pat=
ch does not apply
    error: patch failed: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-=
rt_6.12.bb:10
    error: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb: pa=
tch does not apply
    error: patch failed: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_=
6.12.bb:22
    error: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb: patch=
 does not apply
    Applying: CI/CD Auto-Merger: cicd.master.202511110100
    Patch failed at 0001 CI/CD Auto-Merger: cicd.master.202511110100




