Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD68F94CD0
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 06:37:30 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.11])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.72520.1776839845407283057
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Apr 2026 23:37:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Wpzr2DZr;
 spf=pass (domain: list.ti.com, ip: 40.93.196.11, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n+ubEk/9BoMjDhDczBB4pzS1K6iinGWbk8DbAZHfV+LcqX2myN0IeTWo9osfEUgDYSJ9L3GDrLm5Yn6/NCJxHLjqZgeWBRnpd9ts3dDH/BPqIdxCD1vp+O+zzkxDp0WODvEbnlaYEb4VkC14BRUrXvEjHT/mitAlgHalzDxFdAg5Z8B4ztwAw9rgyecylHY5wOzq7Msq7IpsinvCbzLIp8fWUdKcCK4gxA+QbCr2EQ05iAUbQCW/31d6+MmRNHoAf+RIFjP0XBynoRNCojGsUcHiSaKUmifSs2K6ZbPHDWxpOMdtiUXGglQrB1IbBFLmTfFASE7NIN28ylTnDlBhXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRZtvbLkuL91HX89QdtLf3tKLPjlgNor6fS3M5oQ1P8=;
 b=uavlyRSAmq/I3BsZUVnWnWabf+O9nftjed7aOMLqopj5t08qjK9ECMi2cpDq/++foL8C2hj+NVnTe8Ncor+05u2juZlaeZaR/AiK9Mm+rdNZlBqn3exUB+sxByvvMhi932bUXgsX7CkiFrXT7NCW2x3fO71eWn+B5qmemF+2E1sPhpreiXdePjKp3HvmFf5zpqqSS3wSmf5LTqci6Xp/T4j0lvGr0+0tfbEQzAViyoGNr8iuSl1jLFIl/UmFLQOJjX1KGcSQPZwngxcz/fZ0R5zL7oSyZCUFzcb7puwOG5pm9Ai0Tvb7ppFctE+k7Vcr9hZr6Z2U3oOwNtfcnSZfRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRZtvbLkuL91HX89QdtLf3tKLPjlgNor6fS3M5oQ1P8=;
 b=Wpzr2DZrIJwrWAi5GZo6VXm4geTi0TTHJVDvdd/55XPvqzv1Ba3Ijoo2uDCbdSz24GkJoe8JgAeV2uEsxJgVUDG/XcusHzz+ybv4WUGHHOcywfw0W0Ul6lFNQBGqfcJqYrQH3JTYisZByzEETz0tfn/sKHqVSdqR9U4Fjls1D1uSjrcxhrrETEMmWPO5pHnK0qwWo0nNYV7CfXcS42tJoxocX3MoRAzuzF98ndEJVHkeWtbM+3YLuvpVzzw8UUGpTrXZpVUPp/PwYr1GdIszMNbvRc/o5HN/Q2ILbxIxYIo61xlKKjaxxLiqpVCbxN/rYMUaHWEn9vVJTLRw9tZl8A==
Received: from CH0PR04CA0080.namprd04.prod.outlook.com (2603:10b6:610:74::25)
 by DS4PR10MB997573.namprd10.prod.outlook.com (2603:10b6:8:31a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Wed, 22 Apr
 2026 06:37:21 +0000
Received: from CH2PEPF0000013D.namprd02.prod.outlook.com
 (2603:10b6:610:74:cafe::9c) by CH0PR04CA0080.outlook.office365.com
 (2603:10b6:610:74::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Wed,
 22 Apr 2026 06:37:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH2PEPF0000013D.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 22 Apr 2026 06:37:20 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Apr
 2026 01:37:14 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Apr
 2026 01:37:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 22 Apr 2026 01:37:14 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63M6bECI1898991;
	Wed, 22 Apr 2026 01:37:14 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 1D6AE136F37; Wed, 22 Apr 2026 01:37:14 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Yogesh Hegde <y-hegde@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <prudhvi@ti.com>,
	<rs@ti.com>, <jm@ti.com>, <reatmon@ti.com>
Subject: Re: [master][PATCH] am62lxx-evm: Override serial console to ttyS0 only
Date: Wed, 22 Apr 2026 01:37:14 -0500
Message-ID: <20260422063714.2721497-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260422062227.4098420-1-y-hegde@ti.com>
References: <20260422062227.4098420-1-y-hegde@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013D:EE_|DS4PR10MB997573:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f8855bd-32ae-494d-1980-08dea0399aec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	AOz3xk/jdUCAcT1Qtqu3emfYeF+Uj1/fPjTnHdKU/dFp1WGZbCGJkgiADiHdhPJDl2921l+G1rpgUBu9Upcknhr5xctpJq4UClGmghUKD75ot+lzewNp/AZeMchTcbwjS6j8jagtL1aCMLN/pbsTPAtqFgIBVoJiSMjB/XCdPYrltqWBDikxhwwjpQdM6+q2vLg1leul3izZ+gim7ajuHuS57ckaBqtgOHma+5y/ricOnVom8SYLWRIuXFWvdC5+TulpwGTWIlm/ODEkxkgsE+obphUNGBqCVffzFHBsPB3YDNarB0mUU6f93K8nDAzolSobNNCIeVL7up9nZn5kI5iFRKdMh/7iPmeBl9ltPXYcqvnNkYltxXcl7l76IKGHZ01M9olGq9icwV6r2JkEH162rfTMRt/0rLxD8lQMcLcTfJnYoq9f0m/4hqM9liq4D2s/jtHfcAM6sSMzv1XH0FdjG+IVMUs3AM/i2qV6rpaV9NhaebblVL1/544ppR8O7mH4wbvHI8pAPenv464+Y2lR5yNkesqXY6dIcn39TkN+ZxUv2Z7NFXUdUin7pxbnLuKjP4ePyps5fB9zzQysCRoVngGpN518mSCnA+3W3xppZ8Gjg9OcODLPMBJEX4xKqtimUKaH9gM0c77X1OajCoBx7m95HqrKKoihPU4Gb/1sX9QtdqqHXpBM4GG95qOnbGWCOrcnXbHUxT/4eYhFRKRSDuuwoKDiWF0dLGoz7AEEjKM+FwC0lQ1wJmFeTvNNF1kyDImaoOZR7fVSvFayvg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	PnHUt52NERWC2KqM+jcY3cj8CncpLrm4zvf4eNwiB7DBsySpcwa8EZ7W5bKQyogS7cUo2qggXw36X1S996GH7rVXR979XNV7O0KeEqhBuhqVcuIQaEYXK5qlSa6mVG2K4mhyT2y75StmY0qdgHnYNj3tBJaYXZGZRGjcUCpcXQZif/tFzq8692E3htqXeVHwWezmU5TMa6H9X3+m7dpiNHWqTY4MgoWAh7WQdsvO2fcDrw5NbITWF+l9wY4GT30YjgeXH6bQcGJjQKz/8MNSPeGQJpUkgJ04TTWmXdHdQb6ugh3/YHzrs1aWXaKb922VGepDRpeP6hTLsf4f8B+6iy1Hkryxh+fLkM9Xx3WU75LKFswZ+V+NJ7vvhWN5qSseOSJxAHvh01M//YTFFq8ojCKsa1PLz885axe6JBpt4ko/5jDOxfrTn7Vou4ZYEqT2
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 06:37:20.4913
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f8855bd-32ae-494d-1980-08dea0399aec
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000013D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR10MB997573
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Apr 2026 06:37:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19863

meta-ti / na / 20260422062227.4098420-1-y-hegde

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
- Patch Series: [master][PATCH] am62lxx-evm: Override serial console to tty=
S0 only
- Submitter: From: Yogesh Hegde <y-hegde@ti.com>
- Date: Date: Wed, 22 Apr 2026 11:52:27 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 514614d5fc6b092410b41b1b9e5d86108=
35b3d31

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: f9937ef9d61a43800eab7b176fa89888721db064

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




