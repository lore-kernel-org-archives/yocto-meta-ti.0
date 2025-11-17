Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6809ACE8D6B
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 21:23:33 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1443.1763414605344101007
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Nov 2025 13:23:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=EgQQOhI1;
 spf=pass (domain: list.ti.com, ip: 52.101.46.56, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vNAYJWXYgtUz2vebEXK4EjeexSeIXAHhtPOXzGQd5fgaXpGslxkQsB9rRDXZ2nGTyKjGNUG+NksxvkvHMjMFnqIOsGaE/u3jSk0efd1vETRkJVB3FSaY9/tpUI5XK4MdJty3U58tBuWwjIjO+Bc/LGvuIgWpzv7UJpPckr0VCg4KK2d0q4pbmOCGstQPkhJNMw1324odlnXDq4Q8AGVAbhToNaMEu0sKR8OmKmHp7huclqyX5u7D7+DR9qu7FGCNLjrtxolgqjrG4eV38ZbyUqv1ZkAuop0ML79bRTz8DrGyIq3DEVl3kzCR3Y74eDXpm8QEC3gDpaf4COFH5KpjCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JAUij/HcIPv2sjpka6k3zeCFnL+b5Tyy4F+axM73oqA=;
 b=II/8o+0vBAN4NsmeHtMl3MDekBxM4qNSLHnLo4BMi5croPxUPnGJHgl1jQWcyNIgWc3EDM53HRMcOGkp84nwPuc3c2m2N1Oe29xOmK7WLCLiXeiMHQJqqsEc27ibgOwDVj9LHb/C8kvTOEwup6JupYqL6zaA4sQNWEWTHxiFhZlAbaVpzVdS8CXIp/Z9wGdme/XTmvL5YEAfT+z+CBWmznoAUTylsQzeW8ZBkxAsJTWo1Lhn86nlKGFl/ytZo43upBrPG+KEd/CjJhiBj8/qkT8OYju/qRBwS/M5ueHK66BfhZRYG6DnXUAr4cvfo8UMOOrwVfhOzrjz924J1YNr0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JAUij/HcIPv2sjpka6k3zeCFnL+b5Tyy4F+axM73oqA=;
 b=EgQQOhI1XXQJxbpB7IclWOKo3pnfWKlqegJgtJzrnaGDCbZLki1iDPyr76L4FPNDSOl3vCvQh6kXs/UyXK8PvEAJG+FVOiGINiXhsjtjbN2FhRklXySSMcXl8t5901rtfQnuPP8CdenMNRkuLWIauBJJIDsk42ucxzGSPgLm98paXkqn4g+C9q7ENIRPxvkQ/wwiKQOkags6T04UhSo+Xj6t9mR5XdaUyG2/ybzxJHkBKEQTh55tkgI2pbmC/GmBaK0aSktspFgsCT+lSCO/M9Npjwp8jNUUquRmNmxpA5s+xBXUoJN64SGkQs9Z+5fdNhyzVKJU+IqhdMiTxDsw5g==
Received: from MW4PR03CA0029.namprd03.prod.outlook.com (2603:10b6:303:8f::34)
 by CH3PR10MB7677.namprd10.prod.outlook.com (2603:10b6:610:17a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 21:23:22 +0000
Received: from SJ1PEPF000023D3.namprd21.prod.outlook.com
 (2603:10b6:303:8f:cafe::3f) by MW4PR03CA0029.outlook.office365.com
 (2603:10b6:303:8f::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Mon,
 17 Nov 2025 21:23:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000023D3.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Mon, 17 Nov 2025 21:23:21 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 15:23:17 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 15:23:17 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 17 Nov 2025 15:23:17 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AHLNHK94075788;
	Mon, 17 Nov 2025 15:23:17 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 10D972A6B; Mon, 17 Nov 2025 15:23:17 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Antonios Christidis <a-christidis@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denys@konsulko.com>,
	<rs@ti.com>
Subject: Re: [meta-ti][master][PATCH] ti-img-rogue-*: Migrate GPU driver version 24.2 -> 25.2
Date: Mon, 17 Nov 2025 15:23:17 -0600
Message-ID: <20251117212317.2384857-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251117211517.785176-1-a-christidis@ti.com>
References: <20251117211517.785176-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D3:EE_|CH3PR10MB7677:EE_
X-MS-Office365-Filtering-Correlation-Id: 28588736-d1e6-42e2-3085-08de261f88ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|61400799027|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fqmVQLjSDzIxx8uPNtQHsMDWR0LKC5LaCLJhaezR5j4ucSH/xST89yl1teLT?=
 =?us-ascii?Q?DBRBcKWXcVsp0rw00FlD3Bupeg9afenhN9TAkViJhKky4scKoxmZho7u6+p5?=
 =?us-ascii?Q?3s9btar8VzAa+7iBhE4NyrUwo0pV0Z2ELf0EEmoF/Z91JnkKkzyoYDR51Yok?=
 =?us-ascii?Q?W/eKS1m8u9azVAhDPL4ATAo1aP8DNXmYaJQnPurYxzD6EljqZ+/cqJIsB994?=
 =?us-ascii?Q?zh4vpBLkhd8FbiQhhnHTZOxghcxX+ASwtUX3JpDEeW5AUF/7GlHFZhf1Rw+J?=
 =?us-ascii?Q?pqbQv0Ioir4i1aOjHI7q7fWOOVAPbtS+KOFUnP90uCR4k5bhuACcmHxjVgWp?=
 =?us-ascii?Q?5WUEcXewJBn29cP9FKtgfHXEfUpG7tnXvCFvShTHexn0VrPjN3cPA6PxUuwy?=
 =?us-ascii?Q?rjXJzeEctW1zxeWvaTRScSGYUUrAMQamg9mVaqxTBuubejWHdyhM7RR38L/Z?=
 =?us-ascii?Q?TxMH2l1M3TVeUNgoTRKFQy8mKq3JrvN3pM422BxVuEeGH3UdddRRVbN+p0YI?=
 =?us-ascii?Q?mwqvy6wgIsD6oLpYTkt4TKsgRhlSNpj8Lx/BzQWTHhElYMYu8qp0aciTwmTG?=
 =?us-ascii?Q?c2shsQ0zymzSqouQd3fmThmwOy7ViOdbjYXGeTRutGanP2BYSUM+VOSKlQ+v?=
 =?us-ascii?Q?kApn5MOaHK5xlZPcpdQ965mcaYGbStivhbBx9Rz8fzYeigubhRCcKUvRWGYw?=
 =?us-ascii?Q?aGaHrvC3CaLZwIeK9XFhA/OMyXcSd5Gwfz4xzovTSxH0BEq4cn70cv9SVZDK?=
 =?us-ascii?Q?V03qkekr40Ucc4EMnS38icfsQa0hJGZmiekrcNYAaiv8WJ9H/aBUZIfBBBOs?=
 =?us-ascii?Q?9iXWhj1Y0TDDB9XKAARUXLlvrr0jhVapDsRxUa4i9/stLRyOawPGNh1OapC+?=
 =?us-ascii?Q?HlVGerwv5ZI/mGGRcf+Hap9gnEnPuGM5s4EDR/Uo91mpN7EaaAacgrXel6cv?=
 =?us-ascii?Q?6bxnwjS9RiVazWgGND+0HY8mWDB++p/VoyIQ9Yskr8COcPmIZ4ND9Tb/20zm?=
 =?us-ascii?Q?a4ef7OVVKioo0twrnYWYvo8Ocfsrm594ihBSL8QxbdCBZYn3KSHSdWYBguYH?=
 =?us-ascii?Q?Y8RdkzC6SsAEu6UGCem8MNXXxwo0j2Ic/f3RsPnGb41V8EhGjE86zK1tr8pt?=
 =?us-ascii?Q?RWkKjMM7PN+0m16Ooda7dsR5YGgZ4VpaipSp7uhyYvfO36JuMBHWENWTQxCb?=
 =?us-ascii?Q?ZnF9lYL8JJNZahX4JkHXAfgsPPRCVCCDJvXd78zX0or94iIOuZ3T3b8V2A73?=
 =?us-ascii?Q?9lnXdxRD34QTezIYlRzPOS6iQ+vK+84FSvnZ6i36PSYeSWo92CwMaXN3wia9?=
 =?us-ascii?Q?24jJJc2xorowsW0687ZXsqcmUT+6WoGeLs7JgjNO8CzP4Uk6BKvOv1QXmKhh?=
 =?us-ascii?Q?d5z5bW5CoBtGeduA7177qPu45skBZZBlQPZhs1Atjn16i+KSuqmZIKGhT5qX?=
 =?us-ascii?Q?tzaSzFcD2LAyDF2NAAoc6Na+DQoidgnx7NlEjpL+xqlNyxbzbn6FDa16StN4?=
 =?us-ascii?Q?FbhVDgkpPdwRH/4GewZscLPYJhpWBsDHExwL7jRXR4f6zwhD2hB4GDe1Uxk2?=
 =?us-ascii?Q?c/6UMcHrFUh7y86UEMw=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 21:23:21.5022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28588736-d1e6-42e2-3085-08de261f88ed
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D3.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7677
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 17 Nov 2025 21:23:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19283

meta-ti / na / 20251117211517.785176-1-a-christidis

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
WARN - [meta-ti][master][PATCH] ti-img-rogue-*: Migrate GPU driver version =
24.2 -> 25.2
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
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][master][PATCH] ti-img-rogue-*: Migrate GPU driver=
 version 24.2 -> 25.2
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Mon, 17 Nov 2025 15:15:17 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: a6ba27e5e27e865365291b1d1b9a005dd=
449cb33

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: j784s4: Add k3_bist tie-test-builds config
- Commit SHA: 886e6a0587b1964665138f2173144f694d92c5c6

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
master -=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




