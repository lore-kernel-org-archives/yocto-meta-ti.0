Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0744DF9937A
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 11:27:24 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.37])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17211.1776943640549020733
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 23 Apr 2026 04:27:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=ofEFQZfP;
 spf=pass (domain: list.ti.com, ip: 52.101.52.37, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NLfa4zFKmsIWpCE4wAA7je8128ONsry4vSpv1/RMghZfiz5nPWeiwgkGbXzNU7DPrNOK7GtfYaOJL2Px3Qn9l+/BfbkAY0Pfnc1xDqucmxokrpwZUYv8IuoM1xdx6Iupsu5EH1hbV+9NvVIysiEv9eqZdPu5JrcPaGsmG3C/wKzmo7NP2GWtQXKtctdkG0TYAxiD5glG3QCtf3pyTcobAb7NcVvUeKHvY61l6qG4JMQnxNiBfzcxV2K16sTqXQXjqoEokirNQZcuvQINZg+7w+1AhdgNKoOP4yvt97Ni/lRw3VQS6UqvaJwKgBBrGHpDi1m4Xo5e10feyn1dfz49dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ACBqSFx6aopvOeZFdIoHFBRRSIKsttMqxb5HYlWTMoA=;
 b=GmLUtTHdL9rz6JbPVjbXLHOzKpk1DHiXr28eG6L+5VGRnt74L4Dh2CgbnIhwBXraRmXyWeYHs77UwUsFVTgkmmBwq8ir8TEOzkLZzHZ9zJCYFkDDWX45BQYR4YxXhZJ5rjvODB7gjjy62egv3+/qlqjgE9/rl4sfM5DTrym8yzrTs/b9BMDQ0AeDGW9RdLhHN2um5RAys2jfkafWK6Mc5I9VxzalDEl+tBFX9+NuRzS3+PLxQmxQbCvau1wfk2fsL2FKqMCyfmLPQMIOKnpVANs/lAjtt9o6MgqvjIrtcGYXy2QE3UViFlHLtgHVqz8peoHziEwIVgGIMmuOnkTegA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ACBqSFx6aopvOeZFdIoHFBRRSIKsttMqxb5HYlWTMoA=;
 b=ofEFQZfPn2c7/NhGeAxcmRwFBn66YwDlbd+xovoGT1WiUwutXsxpTGE7iCJqKDNW56cXPQyv0AeCDahfoWMH7EWFD2/N4yJAC/S5WSD+KgjHHas7n9SVtxUn5fhtA5oWCRCmZ+G5KQwavynNJnG9/59BBIBpxcGRizKNnk6ok80h+J4u6f4RBX3GkRJMxBUH8NUeHeedsQ85q215EcjCCbOcptw9bruwLqsm2hzGw/wmCluCjcjRsbqEmeFx/5EYoGzbltuIhC2eQv2N/6msCEM8bm+BvqkBdMkoPP+nKWechzsk2g6t7OA9QHXjzjNqSXBxIwT9p9S041EdQYgqiw==
Received: from MW3PR05CA0003.namprd05.prod.outlook.com (2603:10b6:303:2b::8)
 by SJ2PR10MB7758.namprd10.prod.outlook.com (2603:10b6:a03:56f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Thu, 23 Apr
 2026 11:27:15 +0000
Received: from SJ5PEPF000001D0.namprd05.prod.outlook.com
 (2603:10b6:303:2b:cafe::49) by MW3PR05CA0003.outlook.office365.com
 (2603:10b6:303:2b::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.21 via Frontend Transport; Thu,
 23 Apr 2026 11:27:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001D0.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 23 Apr 2026 11:27:14 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 06:27:14 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 06:27:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Apr 2026 06:27:13 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63NBRD763953626;
	Thu, 23 Apr 2026 06:27:13 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id CBBFC9ACF4; Thu, 23 Apr 2026 06:27:13 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202604230400
Date: Thu, 23 Apr 2026 06:27:13 -0500
Message-ID: <20260423112713.3654280-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260423111325.1686044-1-lcpdbld@list.ti.com>
References: <20260423111325.1686044-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D0:EE_|SJ2PR10MB7758:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b6a14a1-5d20-475c-360d-08dea12b450e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	M1PoaR7c8rw2hd/mkIA6rhbcSwfro3HTQN36ORpApXZhp+rBy6uyryWMcrnLh3mRS/dZKL56kuuJYsQAtp03wbp6DXJcpwlvGIIDUGQcQ6xBRZeKhBQ7+A88RDGE+BkkVzNhSMTYEboNS9ts9GgG6F9+cFvSR+TBYU58PamEqiMf5G4GBWwqpmqPKHWCZl5TXKacQtoFNF4I3xCZMP1COzbG9FYkC6TeD37QdUFypEdXXuv9n7anba+iNbR4msPhAAqOrGaQS1COTpaFpQTXHfchejLMWqQsEmfQPuQeOvI9sUPGg98z8URCNp0bGNT6JOqtjbjTss0KXNc8Lt3G4tka/bE9E0aXq6mbwFDv0eXwm8gUl1O4CjktMDyBzz3eT2fhdDPaBKdZ0jvtn3Gsd7JKpqOxnSoLvbVJYULdG5dnfTZBr9FdD9F/FoaqPtAgR/YG8PFPY6GIKay/mDM4SfHFmIV0i3sQcYFNdiJqQEnQlRKnQY/FEJHH+SRtpOU6ZeoycbHoVrr/WBWMxiewW8daImQRpyVUpQ8tYw7GJmUgEhw+tBEXe4E5FJluHCtlhjX9OoWvrjz9MVBu/076Ecbg1a+clBzSUm51LnCi7j6gLgdYr1eG/ywDckaMKUANuFhODq2UBl4pBEjVXHdO1g5oy00TQkKxXROTcmg45jvElFfkI1DjuB11A1IgelokVOYZTOt+qoj52fHb7EC+IkUm6P2cs4SPRJ6x1iUpBhcwB5bU7u65+WscnTFtjoxkPiCo7jvUYQd+wCM3i4mqNg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	6r/MupB7ndDGAXY2ba/AbaOUugwhShOuebOgCujwu4UEWT8aNwkJvXzlGS4YU7c1asi4QuFwGApzvQbehgxo505X7Z60JJCZf3twXq2JLk97qz3jKgIftsnk8/QdH/yaBQpf1CqSoUVYfybp86UhiVymIa+or81FU3Wcm/Qg4we9hA2S9s4C3f5q/Wy+eUv7vdsTmC1SkPNLgwJwP0LHwgviI9kglAVzYsEcEjagr9df2veFfmiFUQGXapgsB8c52rjzpNBSuApATUucqQocu+jTPycRascLwlCmT4Nk4kIdS8Shg8AzP0iJqxvK33zUr6PYR/cB4vVwHmEwNvIwb2/TY4E1Fce3WuHf6ei1Dl8/rT3orUXkAkDGOAk76wI3PbGP+Os8Mum3ygaQdodUgvAfGjQw5RqjihbxrRtr8ryRen+KwLlHZ8BkuVSjk/kg
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 11:27:14.6119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b6a14a1-5d20-475c-360d-08dea12b450e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001D0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7758
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 Apr 2026 11:27:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19876

meta-ti / na / 20260423111325.1686044-1-lcpdbld

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
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202=
604230400
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 23 Apr 2026 06:13:25 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: eb785b65da8c750a488d2e1d5a4347f23=
94732f8

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Yogesh Hegde <y-hegde@ti.com>
- Commit Subject: am62lxx-evm: Override serial console to ttyS0 only
- Commit SHA: 285e74bf5d6ae2e6b3744d777b6f8bb4a1afa0c5

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




