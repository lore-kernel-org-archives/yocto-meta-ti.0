Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA0461088E52
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 22:54:44 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.71])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27633.1773874475368057528
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Mar 2026 15:54:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=s29swzk9;
 spf=pass (domain: list.ti.com, ip: 40.107.200.71, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJnpo3A91YGxdlgwp3v61n392koK6HMZxfU/vxE8Rz6t7BxqFAbOk+X3zOiCNpvm4MBeebrxIxRLPMgO8WmawPvjiLgwluz3AEhxu9cVNeYYQjO2XI8bXv8AqkUKgpDpeJq8Zuzcf8Yez+2oTqduYY2tc03zpd6EtVs/yi6sMJpDkFN4CHrSaKsWk3EPBSU5++j0rzIWIqCjnNKrcLvTKNVm4HPMgfa40mMv0GvUXw11wPit3badjkwnHZVIbkhIfw3kWdTuGUmeVbj1mWNwr9RfEAqwla0kEPMcy7jwCwKgqJkFLzIdT6CCw3jiQPj8pC5r2AdBuP+fYKBviw3rYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LpZwmOURj43F5RhzykeZ8I+6pwh1PiZY16WK6QLSEUs=;
 b=SXN7B/HMJWSYoouItiyiHQ3imvpmG2TwbgoIVl1A83Ftt/7dqIf0aZoCvyCsGO8dNQ0usOsro/Phx0ofYblfPMEZR5CdlBGJhXAUMqiwUSr3bGGb3+OQPdgOlmOu7QqEpAj7D1rT9+gWqBHziOTDF/j+0yl+KXZq4v4tn1Z7qTiBF6IRmNufLtl6LrZrZjsOV5ImSvrK/2PPKXGAKpo3lb2GtFOAY3AF2/iYg/OexCwQPifjVELytRqrNLjq4fxSzJ/H/MSy6U9UE41kuF1XyKySMhd3lOY/aYhDpeCzc5kH8RtteSVtHxH6hHR50u2zLHdojjTgNHB/EBVzIUeZBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LpZwmOURj43F5RhzykeZ8I+6pwh1PiZY16WK6QLSEUs=;
 b=s29swzk9i+0FKd7Cl+U80hqchkco/A+E24O3jxeZQFiZPFvXY24Gs9rzlnt/qnzSQPT+IAbBkl6+D6vxMHqvpAzJIUZpHbvjm6rp5jUmbLqxxaapYNq1DiNXr/P49LmJRcUWvqubLhhNrP8HrZJuvx5GxM6vnaP6qTjzZOBpwc5a+KpV0UL1UPq5QbX70wVD5X0cJ5JWoJmRXRt1nyu+3h3guB7Ys0TAIAyCH595i8YNg1p46EzZUf71tDcGtpxE4SUuKTJiIxJMvRokQNcwypMbaFK4aAvtXpxuqaNmMhtm1gHBh4CqDM23MbDLrVNhyX+o4C1Dx55QoEhrWbmB7Q==
Received: from MN0PR03CA0010.namprd03.prod.outlook.com (2603:10b6:208:52f::7)
 by CY5PR10MB6071.namprd10.prod.outlook.com (2603:10b6:930:39::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 22:54:30 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:208:52f:cafe::a5) by MN0PR03CA0010.outlook.office365.com
 (2603:10b6:208:52f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 22:54:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.0 via Frontend Transport; Wed, 18 Mar 2026 22:54:28 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 17:54:27 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 17:54:27 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Mar 2026 17:54:27 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62IMsRNt4161590;
	Wed, 18 Mar 2026 17:54:27 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 84538138B5A; Wed, 18 Mar 2026 17:54:27 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: <rs@ti.com>
CC: <reatmon@ti.com>, <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] k3: set console parameter to KERNEL_CONSOLE
Date: Wed, 18 Mar 2026 17:54:27 -0500
Message-ID: <20260318225427.802247-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260318223927.922722-1-rs@ti.com>
References: <20260318223927.922722-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|CY5PR10MB6071:EE_
X-MS-Office365-Filtering-Correlation-Id: e5688b0c-83ad-40f4-16a7-08de85414fb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	faXksxpdoLCeTTb0yIhZMlCsTm5mTSWcX7NcneOThAwZQYIQyMJtev7CDMHbvPB+58gGJT4P1vHNEd5gTrJm270DMqhuKPPf5Y9FTJFj2PltPPsFHob10XpRBgNLA3edHzllaGT/AwtIQvwulduvjNK+IkxXuOxx7Uvuts/JxEMghEWdmzklCpyL7OOzZja8N6p83DFK5iZuBjhIBVLXPMaqX4SzwcrxKx1o4aTqKCKOAei+tbhS/J0xWg9g4CXf0xeDR9KL5OEtoWYiul1Xz59FR/oHn1sO3WSnQ3t0hqvjdnccR+uevY9tDTm/Vbep4hf16kxCszFzwJJ1GYiz2xOEC9c2510OjCLPsXha6+IwerFbLzJpDBAafZS5pAytPhpcS2m3XougMJX7i5ZVWngIgWx8d7+IqVwLw5iZ1bQmErQMs0LyjKcsD3f/HYV3GcioaAukOTn+FRsx3ulKcLfqFVBpDxFRB1DNoHnyRNBtrPNxq2VS3QbBaQtWjlFvpC2pRGArxP0gSK0x8P0TjMRZ1c4TvlCyYyvLnLUdI510qmHbwpEFHZCnlIGMf8GqktuDuSfQet/keNXcakObr52/LfsTu13b6wox4La3I4kkPDqQyiAAJBVCeQ8yl0m1Pv9T93Jdz3FrSBdk1/N682OOgTt6CF0dI60RUHW4BW+F2bWjpFU0I92OzbMQqnsR8AtO3NtOw+dOy1tN7LKfSuZfTA1AvEI/NVCSoxOHSDmEygrG9Dz44R+S99cp3KtCP6fBnCdruI/PD/s++oFdOg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	WcEtjbDGaAfYhwY8O/RlYEwGb/q1t2V2oIWP75Fa39X1BDiXmphG9KXW7YvnmDNBk9xlHDGtcUO+0HAD23OrIKx0/0TCXvIV+2I46M4flTQFxiQbxIqRJzqGhgP71gM9/lG3/wEaHISnS26LBaZ07K0Owwoi76Zg6IxtUoG1kkZUN4tT4IauKt9U9fC3aBhFhpATPFscvTR/NIDVWiRYrzyYUqlCK1TmITW4kWX85Ca4OjwPdThvXGXe5iQ0BqQywDC1Xgz2eqisJBdtUZfTyQwIQscSiJlOWxekq5lWf3j8C62J2gUzShdOEJmMi7XQEGuIK0Hz4tbCBqUKbG3GO00+qXYBmoHkAlaTtSf+Dj3YHTZbFUbjw1NPPqTxjUwivvXxaqBkseJkC3SNltqS38h4/1raRhjcsE0vHyGyFTSP1CGBlxNNRoPzjUP/fMWi
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 22:54:28.8679
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5688b0c-83ad-40f4-16a7-08de85414fb5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6071
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 18 Mar 2026 22:54:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19769

meta-ti / na / 20260318223927.922722-1-rs

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
- Patch Series: [meta-ti][master][PATCH] k3: set console parameter to KERNE=
L_CONSOLE
- Submitter: From: <rs@ti.com>
From: Randolph Sapp <rs@ti.com>
- Date: Date: Wed, 18 Mar 2026 17:39:27 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 330f67a332c77d80ea4f453eec2f012c1=
01225f3

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




