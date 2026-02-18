Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC2A2E9A049
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 21:58:00 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.62])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.905.1771451878981541119
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Feb 2026 13:57:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=fZWzwUW9;
 spf=pass (domain: list.ti.com, ip: 40.107.201.62, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WASknJJ9hTdXkN1gBQd2cMdr5dgA97m+IeXU1sRJ+T3M1UvvaiPHTt/i2Dr0V47zTeEBsZ4SXx9ZEpQIqMgPV7L8KV9EQdB68nIsf9oT+mLcwdXSm+DACDby8y1g4ypF8YqmmBI6Q803R+dyrTfCaAstF8wJbnL08ijXKoBTUgv52goVswJP+CiwcO3p6kIelcV0NhDEUVC8BW0XePO72IqcxRwmr+men797fBM5AK5rLKw+UKecPQVXPQgv2SaDJmzPHiYJ4opV+xFrhpIR196y5ujwz8P/7LVjwhX3JfsnyTV7SNE7YSsPUvSOrceiz9yCXvfzfxRG84CPWR0dPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lgThh7NDY0iQf2mpAA9WipH8+VG/ogLnb9cdCteF8YI=;
 b=OonyYrRWoz0QYsxCRgwNY7cLMHZlI6e+R/R5yjrSFHMnfiS8CSfhMn/+It0hN1JkjbaZN3oHjME+CwuGKC/yT5d2i3/GJ2zRN13bysl7U0W2GvnDAkfZ1/zbHreR3R4RHQWIXcjBQWH6D85ARIS5GJhOnSvDK1Mbi3VP3KACQ3rDYhRRVrO/ZPkXoEmYq+oiJNWCb+nmTsHpE1ldc3doaUc8eWQnXgMXaEGgVSi2GpWFT8HGpYHnl+FaosdzxlnCaqNrXTHYebWm3hnHE9VBdEqN5iTr4wSspfPUZdDkra/IHiD8twyKK5O0RRSwMl+kkmHXHcyBvEoSpRmv7Zo3Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lgThh7NDY0iQf2mpAA9WipH8+VG/ogLnb9cdCteF8YI=;
 b=fZWzwUW9yRMQKxoin9/eGieaSGa1OW+h2qHyUE/6pUzXuDDIX+/wdd6VNE7igkMgQKtdt9Fpam0mZaX0ItrBiV/PTHh4jZL1bDYBOzYVjjcfeky5ZZBQobvWypb7MZ7/YkqeBGjdPmNZmTU5f0oZ+sR/8MsLfYDhVipptaH+p/bB4dCGg4gR3cZPwKYm2PYaXJZgOcL+FHfl4zfI8quLZEyrGL/EBKfkgikpEJX9TF7qh3eoz8x9EgHpsWhcI/gCiF8ww9sUuYXwds+eRiZXSL8tP266uqSAWZyg+vsjFPflJAxW96zJeEQz4l5o6hfBJ52vlT/jBxkNKJPmC1sRMA==
Received: from CH2PR14CA0045.namprd14.prod.outlook.com (2603:10b6:610:56::25)
 by SJ0PR10MB5786.namprd10.prod.outlook.com (2603:10b6:a03:3d7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 21:57:56 +0000
Received: from CH2PEPF00000141.namprd02.prod.outlook.com
 (2603:10b6:610:56:cafe::de) by CH2PR14CA0045.outlook.office365.com
 (2603:10b6:610:56::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.15 via Frontend Transport; Wed,
 18 Feb 2026 21:57:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF00000141.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 21:57:54 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 15:57:54 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 15:57:54 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Feb 2026 15:57:54 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61ILvs2H1534691;
	Wed, 18 Feb 2026 15:57:54 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 4F2B89ACF4; Wed, 18 Feb 2026 15:57:54 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: <a-christidis@ti.com>
CC: <denys@konsulko.com>, <reatmon@ti.com>, <rs@ti.com>,
	<meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH v2] ti-img-rogue-*: Migrate GPU driver version 25.2 -> 25.3
Date: Wed, 18 Feb 2026 15:57:54 -0600
Message-ID: <20260218215754.3399358-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260218214814.1345555-1-a-christidis@ti.com>
References: <20260218214814.1345555-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000141:EE_|SJ0PR10MB5786:EE_
X-MS-Office365-Filtering-Correlation-Id: b6a88a73-6eb2-43e3-c406-08de6f38c536
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mwxJbizqtk1HMUQk0BTT9Uhjun4AcwdAsYxuLrPQ38OVo1un9gECbpm3FPdq?=
 =?us-ascii?Q?bsltA067zZvhcd25ezB3PYG+TZkz7jSCvywDzoXzfW+2Ghvuukt//jc5EpRE?=
 =?us-ascii?Q?s3SpbIat2DwXfkeKGTYuSIkVvR2Hep7bbAy3AxkcANOCKGScKpInfgEV8PWh?=
 =?us-ascii?Q?OT1Rbdv8Cyw+ZmyYnS8vezQTxyLDmaD0kdO7qy4FkJgT/ba+SNMKKe4xmwoO?=
 =?us-ascii?Q?kDKKw6OUODHyRJgERs0A40Q5M4X8yHwuI/Jpgdq4ywg5F4E4FXlF58ugAoB4?=
 =?us-ascii?Q?GfiuEGjyIpD709u5RaH6GnfuQaY1V+Y3Hv7H6LX9OHi/XIBqhvstpdLVBE0p?=
 =?us-ascii?Q?yGRZv3LawWVlIu2UF/NliqEvivSfcSihlZlAB36551Q8a0AWhQ0M/3HWA8K4?=
 =?us-ascii?Q?MgK7ewALjdegt3az4x5NEVGKKz6WjqozNLY/4h108T/OtLmB/r474KRsleGF?=
 =?us-ascii?Q?td+wyD7t94qsCN3Mpg5y5ShsCQWSLwRVTvr9n3Bn5QLK9XqUqZnhYi0dPFLO?=
 =?us-ascii?Q?wTiLkCBLODeh5QVWlubSlmQat30HaAbhMfV7CSymPqmd0FiAhCLEunbqVuZr?=
 =?us-ascii?Q?KgsT8aFSMpDs7aaQYNWLsLvygVi1gXZavzZ2gvqhsZLCnHGyrRo83nP9MViY?=
 =?us-ascii?Q?Nx78mKYYxGYzhEWHSQxi6PjL7Uj3ScoDb8JoQXkybyMJKMGJ8bMBuFWUE8Mq?=
 =?us-ascii?Q?amcTSK+abtlS7pzmLRvQo/El7Fg0jnWW2ma9E7a49DFM3OhUAoMuJTjVp2HI?=
 =?us-ascii?Q?wkoYx61Yo5Dfgr2iyUyU0JTLq+g6y9tD/aAl86iEvDIy8cnZdQe2Pp6EPP8l?=
 =?us-ascii?Q?QZgVgIiahOLhk5PS1NgQdMJJj9oO+UgStQR3Sv2aK4hFn5PDSZYpHc4R30Sp?=
 =?us-ascii?Q?zlvjQaM5JwXGNAVvghq5yRmECauPwtmPX6inZDjsoSmULEfLFuZS1ZkDPppF?=
 =?us-ascii?Q?x5WKx9NGtXP9bHJEfVa19VgQ7OZslYhT00942JOwuoboZDFlORwcqX4KzeMj?=
 =?us-ascii?Q?osknEjMZxnih7B+Rv8fMUy+c4noyR8khRKVgN2AybuPj597oc4UKeI6PQjgw?=
 =?us-ascii?Q?NmbJuLVCmivRebGDOvCneUunEDh+nINsRtFFD3lgy0/UYZTIZf04buFkhVcH?=
 =?us-ascii?Q?vNgZOZNUT4tDdC+8DWblu3S8tk4Hk3hh93lRqxQhqUHEB9SNVZwltmvqSlVu?=
 =?us-ascii?Q?gixRuMxSEiq9F7pz18flH17u7jbK7cBpgiAvTV2NnWo4gkSPpK4qjV7Z9XVJ?=
 =?us-ascii?Q?faLN3wPNsoxilcHQkS3aQYpS72Jvx7JfWHpPS7sDuPkJ2GZXTl+EvWEfCRwo?=
 =?us-ascii?Q?Jl6A1Ca3R6sqmNSXl48FJ56bI8RZ0EuWmAF0eIH+vXxo59ZekFWErAL3dvna?=
 =?us-ascii?Q?RLAAEaAIXuaEKGoEDdt9C/fs4U7+F4me+ZU92VYHGdSIpw40bsRa+XV2XR+K?=
 =?us-ascii?Q?k/LJjGNAytTgBINhZZluzy68Ng/ZdmSjWkilKOLiw92c+9yWM4Ux3Or06klt?=
 =?us-ascii?Q?JLxeiPcLxiric0RQkulfcHrxUIK6UodM/Czto+Ia3qqEaYzSjpxry7rUR7wZ?=
 =?us-ascii?Q?9vuZOX7fFWYNznDc5t2EJoQW61wHAuR8wkWnpLNt4yVHm39KY0GcJnh+HRyh?=
 =?us-ascii?Q?K9jpjqfnDNSkZX6SW66U58D0BLCRheh+MzdaGcE2LzHJ?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	DSz8vfZzJCar6nT3/LUjGSYXqE3Mq8wLb0oCj/Q/SGIs3CrxvOMZWVoukLMD/B6AFTyIcAIKorFazqiT7T27uxiFEYDEE4DbvMg4lDS2KHUJgNIlNsBK2AhwcvyguSjog3MOwYvW9vQkmiZJGvR9/miVQx6EbRCzhUUvej0XyHngqHoTFB0QBwsTrzbMCsew1AwYI4tdC6WzEqE37223F4iD84nl3q55K1kQK/HOxjbGofw8gfA3DYcFseQHnqgtDM146HxZiCDHCCp1N6lwv+FgdYsXmyHFSh7IdXWZ5hpDVRJbsQzvAGOBbnC4XmbkvD9vW+jq4IduQzzF4YadsvioWYY6/jLcCWmTJmYvV8RSRjgTdsCFKoHMbBgUAsLHoDxRc/bNyTzHUiQQ+vD4hWCeiLLlhIRV00313KRLa7OUVeNxtw1x98cvcBfQl3vE
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 21:57:54.9764
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6a88a73-6eb2-43e3-c406-08de6f38c536
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000141.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5786
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 18 Feb 2026 21:58:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19547

meta-ti / na / 20260218214814.1345555-1-a-christidis

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
- Patch Series: [meta-ti][master][PATCH v2] ti-img-rogue-*: Migrate GPU dri=
ver version 25.2 -> 25.3
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Wed, 18 Feb 2026 15:48:14 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 9335a3d03fc2d6e568d8763dec8e46e26=
abc05d1

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Hari Nagalla <hnagalla@ti.com>
- Commit Subject: ipc: ti-rpmsg-char: Update library to 0.6.11
- Commit SHA: d7ca6a5d0381a9e2524fefee36963f960ab70c00

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




