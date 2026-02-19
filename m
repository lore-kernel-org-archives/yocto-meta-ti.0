Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B91C531CC
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 19:55:36 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22770.1771530934037779395
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Feb 2026 11:55:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=KFMwnuwL;
 spf=pass (domain: list.ti.com, ip: 52.101.48.49, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c4ap90V3LH4yHRO5SVMU74gT+7hR383NBwaPBfgzXHSB2N0VlYx8JIlnFqXAyjexqnlykplPz1yLT5FF4kX85MRCdGqfV1LMH4iKe7+AXP2my1FM6CJ6jwMwwhmituFb0655USPUPYTdRjyZczASZb2KCkI274PRZvFta74r2g3IRicfolJKRRBdqNItUoYd6/7inueM51IelnXh5TOnNxAvCNpLsuz0zK1M0B0P3JkaC1aR2TRdoStOARQ7YcUTu/vEk1kJ6WQvbzNsq/IlmyV7FpZA8eI3UFLtb3Afu/PEUqophg1TEpKj7kiMjEa73PnZdfQAeU3q9qUmzumNOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QVWLTHX03uVEIfbIG4R/Q1WijBTiE7dXwUwDsGlj9ko=;
 b=DfT8tpDQah6PhF659YVT93ZZmehCpkbUGq2KsYevqlgSvUxcpUm67IOxxWv6oU5dkkpcrZv1XRiWeG0hlQRk4SaOUFvVlvTNnA3CBjXUa26zOjJZOV4rvsb75GyPpD6UrVLnxMe/OobJfR6M2q0berzAL+B7fsMllp5AXsNs8BjhoKzVXBxqQjO8+dTQp9YU5OBwgmpxgWESYoWO8yR6IdcCf7Lumghyvfxc64iQwf4kp1Grv3zs/GfcVkDq7wv9pYOpo9ymNVTMR4Dbp5hQ3VSoN0NiaNFb7Qe+IxK8xooJV80UlLOHAR7ZubqKgn7Cl0P8Dk84QQ1rmkK56T4vBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QVWLTHX03uVEIfbIG4R/Q1WijBTiE7dXwUwDsGlj9ko=;
 b=KFMwnuwLMWcTdYcjbNQfAT/y4rPdvw4uDWxJc0OS93mwPo1HKOf7yx5304IZZU3QL5XaT91mfBxZelH7B4WiFraVJDgu0aRnM4VbFKoNU2yj9jOcsW6Dj91HrI55Pk8qLjpRNUATdUnTyl+5A9UG9AqyoPHKOzQRi1yYq0WRKMMS4p1dQXgHQWJGvD6Gokwa1YLN0ijlnmMA7DBm/ysQdomaCGQGc64NWzA/ndpjifZFe/hlC/JfLS+qcNKG1oc5NQ3Oxg0QFlA9TgNOyVYm+Bw6MejFXfQ9TRysfaLEx7KtRfs9nqFCXFWMpGZImTR9CWJ2OmIa8QbDr3/jRaOTXg==
Received: from BYAPR07CA0057.namprd07.prod.outlook.com (2603:10b6:a03:60::34)
 by PH8PR10MB997766.namprd10.prod.outlook.com (2603:10b6:510:39f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Thu, 19 Feb
 2026 19:55:32 +0000
Received: from BY1PEPF0001AE17.namprd04.prod.outlook.com
 (2603:10b6:a03:60:cafe::8f) by BYAPR07CA0057.outlook.office365.com
 (2603:10b6:a03:60::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.16 via Frontend Transport; Thu,
 19 Feb 2026 19:55:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BY1PEPF0001AE17.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 19 Feb 2026 19:55:31 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Feb
 2026 13:55:31 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Feb
 2026 13:55:31 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Feb 2026 13:55:31 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61JJtVRN3061363;
	Thu, 19 Feb 2026 13:55:31 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 042DE142E1F; Thu, 19 Feb 2026 13:55:31 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] conf: j722s: Add usbdfu tie-test-builds config
Date: Thu, 19 Feb 2026 13:55:30 -0600
Message-ID: <20260219195530.28943-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260219195203.4121217-1-reatmon@ti.com>
References: <20260219195203.4121217-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE17:EE_|PH8PR10MB997766:EE_
X-MS-Office365-Filtering-Correlation-Id: 37199aaf-fd01-4263-a383-08de6ff0d6bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Z7ROQ7jb9Byx6ZyuDAd7pAxDbqNzMSlHXnTRw5Tnrfi7sMrYTWxxgDjTWtf7?=
 =?us-ascii?Q?C/NXAYZgOPcHHKk5M4OYsvlB7bNdavm34J+tGGorDf3zyMfgLAHrn2RTNHyV?=
 =?us-ascii?Q?0oLVdNAe2DUxS4mQF2RhD26fslf8jyYsMwkbvMCPvbbu3W9w/d/QHoagaOX2?=
 =?us-ascii?Q?inw9BGV3V8Rq76XsJO/Gtw3kXGQoKobtftJO+5reK+F0/T6LrBM3mQLmHDu/?=
 =?us-ascii?Q?ii6rTo6W1YW6wpbV1MmQK4bD/rxTYsrevcbB1+UWswmm6H2u1o46wwKafWw2?=
 =?us-ascii?Q?I/0OJ7QJ9MLuyxGZbWWGBfdisEJFpTnu1QNK9fZpAO/jn02DQJ9ZB8u4xA+6?=
 =?us-ascii?Q?wwlEtWlV1AqMxc0L6p/NksXWoj+LpwOjTqLqZXEhD33UJBfZFINLazC4y/WH?=
 =?us-ascii?Q?Tvc/nDAlKbhBRlS86HEcM5b2V0JKKC6Oh09THB/i8z80vsszs/N6XTS6AEvU?=
 =?us-ascii?Q?6x34REWHF0ZeFbJbQmVb/vCmhIOpAN4BaDi5m8P5ol/3w8SuCxOLLaBWY5WY?=
 =?us-ascii?Q?Wn4ygEds0jns72sPeFk+WgYm/2DCsnWsLco8Dw5Q1E2o58xRviaZrh2vlPkG?=
 =?us-ascii?Q?jy1Ht0NTwLvPB3JlqRPPUBO8TE1H+hOTEovCHzqpXLdtpqJR+ImelexPPLY/?=
 =?us-ascii?Q?/MW8Q4/NDJoooSWZ/3804sTa/JesdMbtgMUckDynHMNG5KEY5Cm54GaqDV9V?=
 =?us-ascii?Q?eiQZCD0bLVdVtQ3NjqqLpeMy+Th8JVZV4op6yNKCJHNC1ZmRUHP5QLsjPT2g?=
 =?us-ascii?Q?Y10JBnjfngJLj/doAv92L7zq/sRdqzSsUYWX2O39Rqel/FhQ08URYTQHyoeJ?=
 =?us-ascii?Q?9OZsUjljSOFNl5gzkYaIKbvwuaycIDv2TVM+Kk5H5UCY30DcfZKPUY7dRAZr?=
 =?us-ascii?Q?6mNj6TSKwokhXo2RE3DdqYiQrNQu11fHf0x68csTnB/kSqqn/HrcQr4acnyz?=
 =?us-ascii?Q?0cM4YlFO04LJ9LNJxdzKqKD9ZL0gkPUjqdmqq9EMjfVZx31498AmANnz0MEe?=
 =?us-ascii?Q?K2LjnFLHGdv90in5+3GbSRjf5/RQa1xzKbfzxdgxUCt0OLSVvqPoIQsaami7?=
 =?us-ascii?Q?m0dAuHMZW9OKuSvYo+WYxajSfhOUe9mWxNykireN+oAe6DoapBJcExaT/c++?=
 =?us-ascii?Q?x1nRu3mrNiIFZ4KbpjLZ9ud3qSLN14nRlpebNoJFd1yu8haLgyAqFFJL1eJx?=
 =?us-ascii?Q?rgAu5UAtnTMf1VgPDptQrpOh+oCcpOKup/6+OOpvL/0Xvw2YnFs8u/Vnw9cy?=
 =?us-ascii?Q?D4MD5dWPmRkyPjmcOFADZLzRM5Kfovg48JoV9uIo1EMSkKN+IB7O0cxuWcxS?=
 =?us-ascii?Q?Htr467bRuYI6NRRSVnseqDdr+DEiwOxGbN8w1MqIKJyODFk35LxfTfmuK32Z?=
 =?us-ascii?Q?x0vAt3DkUc2lXxlMOGD1Ek7OLI1vG5f5Ee8U0B1iceb4EyrB54tSwznk1Js9?=
 =?us-ascii?Q?QnRFTcSchA5que7d/hIpKVQuYhi4KziiuOjKymdFAzXe+IAjtspeI07693Mr?=
 =?us-ascii?Q?3cA52BfSvAqWL5zgQY3RqcBLB451JNUnoy9wKTremD8kPXHNJuvog9ya9gh7?=
 =?us-ascii?Q?r5D4akLNkjVe3tTsgfBNL8J5bsCO9a7NmEAQ5knZJYtowRJHOklwOAPVBmba?=
 =?us-ascii?Q?kQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	9SHuYXovleDUHDVgAm9p/sqvd/ptCfy+2Ke9KzX5qS8xGDHF0rukQPjta3ZEaYft9yvzWbpfzpx3cBVs66k20iXZgeS6tsay/UhnnyAHa2hulA7+x01hOFZqIqFkzAabtuAMFSWsWAyxm/b3W/UNMlmAilgGMdXBCca5+dVz14nLLRzbq41ht+hd2pIAesP/ufy+HdKVjVmpJOblHtfBk5bQ16+KQXXm8y5hYciNt/3/r45JpX3nSPFddbArcmsbAArnF7RXHEm091GQvSi9swpreAuIF+AYkHqDBLy8ce+kQSaGFYacpkZrMnaanNgnwYGxKBbfxexHLKN4e8qnfQBp3vK7RupieC2hYA8S/+/eSLkrvix8A2tQyX37tAMrcL7r8hUkaEf9EuGCiXbaSMBE68dVcV6hnMrnijNUjOSmzJss9GV0/rLHxYOO9lgt
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 19:55:31.7376
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37199aaf-fd01-4263-a383-08de6ff0d6bb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF0001AE17.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB997766
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Feb 2026 19:55:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19555

meta-ti / na / 20260219195203.4121217-1-reatmon

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
WARN - [meta-ti][master][PATCH] conf: j722s: Add usbdfu tie-test-builds con=
fig
    WARN: Commit message does not include file/recipe name: conf: j722s: Ad=
d usbdfu tie-test-builds config. (COMMIT-MESSAGE-2)
        patch
   =20
    WARN: Commit message should not include directory path to recipe: conf:=
 j722s: Add usbdfu tie-test-builds config.
              conf (COMMIT-MESSAGE-3)
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
- Patch Series: [meta-ti][master][PATCH] conf: j722s: Add usbdfu tie-test-b=
uilds config
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Thu, 19 Feb 2026 13:52:03 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 246b6bb123a6e21f3f0308fc4d9e40794=
ca6de57

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master-ltsprep.202602181811
- Commit SHA: ee9f5e1dfe817fc192908d420d840668b7aa7100

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
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        found.patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




