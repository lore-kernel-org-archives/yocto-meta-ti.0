Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A829FCD342C
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 11:28:54 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16257.1778066924231876961
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 06 May 2026 04:28:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=RRGwUFq/;
 spf=pass (domain: list.ti.com, ip: 52.101.61.9, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EoWTDREqL8NgnvyhkX9doyhFR1ezTAtKvVYMNyfQiEOesMQBJLepYgDtSLXMWhRSSYIuiujwrKElY8nZFNzyCfukHS8DMZ1/UTLAYnH7CTc7N1x4p1eLEdgEL/HRaHQ0xnH21WHgAGVCEGu7M6VZ3B5XuqbSamJ+i7R6KiCKjkf1w3Ae6pDfWkB8Q9rkz+O7nWECj/EIY/gRNj1Ol2JRf6NfaqdvrS50LXTlVsN43n9QQFEfXXdD8L2fRYPZ45TzvWznzHMC7ge4LRFhw73DdsM0p5KZxZXaWBY+ht5zqmK38LagsJm3oeZvZoTamgGeK50OnMLHFKFCVbIX+2Zoew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CRrqN3A8aklmGs5C20+qiE6KmxCKjj58VJmBYwMobs=;
 b=qI6+hrAMCD1yO8126s6qBebTvx+NJKmgsZEQiH3YFgI5gZj97kxt0MKVvzvAV4ueVQOVghyGjSYjXSxp4ciHsqC/KoTmBtY6d7vB+eliaJVODAtTHypr563b3YGePHriXH5nbnzPE3PgJfH1yhICs0GYS5OQYt0CgbiQq9k5afIk5PtbskIOuipFW1Ho+sZssm0rMBv9NLFzqjyZ13u0yY7H+U/By2bOkvLGgygVw+rQ8A6lrjBG+HEq0dePvowXVOYNDhM3pp9tW+R/43hbE0qnjbZgmSNKWr/yaydmZPUNv/TAufD5fyy85LU0gW3qYGldDAKkigedDmwRCZ+s9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CRrqN3A8aklmGs5C20+qiE6KmxCKjj58VJmBYwMobs=;
 b=RRGwUFq/17uYOdDfcaMhNoDKji9t0171L8SX/if5ZahUVcLmNUw/kcPq7vf1dXwRg07QbgeIb0leeGObW4Ue5pmQ0O1ijO+KuyYtQjcCgJ6y72Tkpt4yRafQf7xRrwCr/Jl3XVWM0sYuEH6qaH4YMqKdADtE38VrOFUG5nKIQpAYyBRBEoCQ93pvgyVxCnEOMQDYrqt0k6rpKkPP3eDwBYjQnk1XSQiPalxqukmoPpBMwo6/0NcU70bKjdvsAkc+zeBn2dNDpUwMl0i9DgCsciweON2dUmN7jjii2nEUwo8RWsD7TQ2l0hhMm/6lMyauTkwFnVYu1JywukCwovpjuQ==
Received: from BN9PR03CA0445.namprd03.prod.outlook.com (2603:10b6:408:113::30)
 by SJ0PR10MB6302.namprd10.prod.outlook.com (2603:10b6:a03:44e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Wed, 6 May
 2026 11:28:40 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:408:113:cafe::c4) by BN9PR03CA0445.outlook.office365.com
 (2603:10b6:408:113::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.28 via Frontend Transport; Wed,
 6 May 2026 11:28:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Wed, 6 May 2026 11:28:38 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 06:28:37 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 06:28:37 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 6 May 2026 06:28:37 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 646BSbhm2929352;
	Wed, 6 May 2026 06:28:37 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 5BDE52A53; Wed,  6 May 2026 06:28:37 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202605060400
Date: Wed, 6 May 2026 06:28:37 -0500
Message-ID: <20260506112837.3729792-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260506110451.3782071-1-lcpdbld@list.ti.com>
References: <20260506110451.3782071-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC0:EE_|SJ0PR10MB6302:EE_
X-MS-Office365-Filtering-Correlation-Id: 9523644c-642c-4b68-5e2d-08deab629e4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	xxU6sXNLmeGVppH07MlfWIJnv0adwu/CDba4fXmtwsaqm7IllouyGqwNNbRXOBvgspnGMhZQmqfq/UvqXRZy3EW2jHtMR/gFVuaQ9y+83HFGtS7JgVDlJNXKlef1mAs2EUsaU3qbrkThOemsXq4Hu5GI7/ehzdS5AnilAdcmnpphhNQgTCxa66Rny9U6D4oLvljbr2LJGO1ggRRmwGq7rg5jklPuaYmHJV8WTfdzDUkGxt0gui9xCkTBzTHjlQqyOe5pQfKjEER2K3pVTVaEEvAkjneJSUQEzR4qgeiSIMZSgcy8KS1kYmmrkKdd+ASjjbBFJlxZAQbKh1YL1GkbLnD2GgMchsHdCxHlGxcLss3d/X9w+kQaRFC4hTW9O7mo75HZz49rFyiTem7eoZGhPGeZXBluIjnjwRtX0rR9RAdYUEGLaQHOdzfnowrA5Cse6pg56lIx7ERM1EpnKqvYI5lvGz59jaN3KjNNZaskor786AxpHK/NtDJ3aIuzORFXASCowfJO/ik2y3LLXLh1ExIEUn1dhDIfQY7FHbUJXaajYD7d19zOzWfAutlk63w5QdzcGi9VxBOCcttrmm0I8GGz8BgVgjA27k2cw2l1dSQuPo4HLiaSVLg1IZ058OihI73lClm+23b2wBeWbZt1wUzA8Aq0FMASpXZsuQjpbLXsQy0R1OVfYAEYfubPUdNc29AFPPJouXaptmQqH1r2O2SMUJYRAI5jpqR0deGBw0E=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	JueilCqKqiAPkv4OPETApcpFq+ZLUzYEE7PVxcPcDNg/LMh4D5Znnl5/dGosCDlGXSHo6gj38NjuBsC6R5edlIRB9v4VhcW7VdhZy7C4TIW6RCRFuS0GQ3mWtJ4nECQ9nZGoLpdaXiMQGp+fV6Poc30nZow0GJfMDU3VlQSnnFBJ2/sOkuY0tfMbTlYvmPaLoghzFkUKpFXXsNEryFD4fVn/g3aovL4zxRlZi0sy2gJNkP1gmjd3dIzKohFl2ATfO47Kt4ovkid2JuBGUtdtgUhDv+E7BT/MSI5Tqk31jnjpZtb4A0kGbj2FdWnaHoV2L3jXqbH+7qcvcI77IN4PHwtuaVk5IJLudKFUe872XUOXd9OCV7rWdEoSpKEnfNAUIZAiJAAevVZ2O9auATkveK9qpaIi4W2vsI3S6R97k6M6XHj1wVHTj+BJh4sHBoIl
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 11:28:38.2973
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9523644c-642c-4b68-5e2d-08deab629e4d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6302
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 06 May 2026 11:28:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19932

meta-ti / na / 20260506110451.3782071-1-lcpdbld

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
605060400
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Wed, 6 May 2026 06:04:51 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: f1101478e21b1a3eb2e575e289ceacaad=
17840d8

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: 1f3b347957f45e902a28147fed38414b6e5862f5

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




