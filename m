Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58E3B107BCE3
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 20:05:11 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24979.1773432299994131087
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Mar 2026 13:05:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=LzJFrcS1;
 spf=pass (domain: list.ti.com, ip: 52.101.43.44, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gjb9nHvARFXLQPEeGw+t0Q1Ql0ul7ItUtGGTh7Lob9yEi2RHJICXc1ko6Yn3s0Sg+TehC1lqq2HQKUw33KGPsAXMzEupMjwTEqCiSuyUul7zFLZYEqSqRhdOsyp1ZLCCOHH4J0lCqBhCCiojQTgY1rzEC/5h7Wc8rcZpRCLnMzXQ4brCEXr+hvKagqGeYEsiPx4dMBxeux0BI54fh46zPFF3Ek/TWUlH+aSwqKggufpgjSAy0tM2Dn+PV3SLsQ7KnWbPTkCdES0bi2y89VzuHD+NBlu/9DWAMKiXMZhsD0rRz5059dKyCK/CVCMRHCMQbMcAv4Bp5Poi4wpg6/xfEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lMFkqar+YnpjVtjSPc0jR48XadEHMTGrA/l9tl4ct8U=;
 b=sbUkPhbVstwapPQ7GiowP33alakjQg1dl5fyno+Xxv3MwHf38afNpdDHHe2jspat+oHksRbswj2GI+2AY1koMbIyM3y9dZqCsH83Jph1dCzYx4qH2+H565yXhrVlnWy1FivK6T/G4HNwISocV8TUrxvYw3tX2vjpleQ8k6rA9inlexTrQz+CK+Mh6EnP119Q72UaJ7R7lsylZLesY0YRdNPP2O6oFo8wD7jMhgHxt3vdixcbDbTosuA55D3hrKkwKgMkHKORKYulQjGSByR3gptRxXQ8KEjlt8CguTSAe6VakcdKKgXxTl5FZm7Xcj+tkIP5Ly2IjzsnJsgOefGhkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMFkqar+YnpjVtjSPc0jR48XadEHMTGrA/l9tl4ct8U=;
 b=LzJFrcS1OH9/REAUtfyM8Pwlza/tw2CYK751KtwZ6NG3q9CmXnSg1EK3SUSj7oxWpJF0zf1v0sskzspIq/30n7/tzXHz8L6R+a+yXyZFyHKSrgf/nFfpssgZ9Hr1LF21wPGU8j6PWYiwO5F5V05oIdyqo23oLhBbrLqGkjRSGFBn5VUPzQJXxdDyFp3tj+UbTMVRwCK7+Ui6vlIwJW5vWte/LmaNa8V6/q0ofCIChUBLySbsuMXbpk9TVvYdFHvSEDagUi2bKGtzw/vFo/T3P/a2nRuSXIIFyAjPacq2yyf5QgvdeDf7r+M8M1w5U9yZ1Ddr5v+8I7K4obQMwlmiyg==
Received: from PH5P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::7)
 by PH0PR10MB997595.namprd10.prod.outlook.com (2603:10b6:510:381::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Fri, 13 Mar
 2026 20:04:58 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:510:34a:cafe::a) by PH5P220CA0006.outlook.office365.com
 (2603:10b6:510:34a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.16 via Frontend Transport; Fri,
 13 Mar 2026 20:04:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 20:04:56 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 15:04:42 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 15:04:42 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 15:04:42 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62DK4gYa2801417;
	Fri, 13 Mar 2026 15:04:42 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 6E8069ACF4; Fri, 13 Mar 2026 15:04:42 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: <rs@ti.com>
CC: <denis@denix.org>, <reatmon@ti.com>, <a-christidis@ti.com>,
	<meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] mesa-pvr: fix compilation errors with c23
Date: Fri, 13 Mar 2026 15:04:42 -0500
Message-ID: <20260313200442.1860167-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260313195202.4047234-1-rs@ti.com>
References: <20260313195202.4047234-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|PH0PR10MB997595:EE_
X-MS-Office365-Filtering-Correlation-Id: 2974515e-553b-4f35-0c13-08de813bcc97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	B+N1gKGA1k8Lllw0pE6xphG/cXe/B9zu9YUysEpF6f3BzCwz4klis6b35WukAjyCk20W9E3JZqOtcf2yHXLCQc38Bv4JRF1MZv2nLuSu75GTcYJgyz4qaSR97K+HVEs08V+GYfGkIv/rZx4GcAIw2z4Uy6F9lcismrTYdVnOqf2oKLV0yVBeJBE2TElBhX5tR0FUC/E9TQJUK/6f0Flvf3MvM9T+Fs3Arj9+l8Lvo80T1nlb2OvyCvOqkfowBrZjUbg8yQpN88E4SK/lxVotZc89aMKAioU6DnRaYxZIgM/rCyhM8/08CXUJ+nHgLVGuCaDX8TZO3b4ArS9DECDb7bkcIYIa/a2yO2cjcbb0DX8OvqNc7xWgNwfOQIxyN3i7o+yCndaLMtfS+5JlC8sr6hjF4ElMjuWSH8pXgI1+bvz+tNzL9P4iCdfxikQT3jr+Si9ach/n1kc0lpZZuJ5Z2aF5RfIadhAZsx66x8bdoajtQRtExKajV3jOmAYxGWenidUcEIDjyCze44E++WRE+VsLn8XYtotAPzuiuHIBwR9MGAhq1mXE0613/SeXn4uoTtyRIApiSInKfA+mM0O/Up5OvaoobyhoJAovvsntVU5oVjbRIJPf7zh5XtnJccb+jbNM2bGSyvwlT4mBxPY6vzECHiX1RfqOrSko3IpwmHBJxaz3i4xqrjVetGZMR1s8hpckZOSn8GKVp+0xLdi/6pWffeV+I9zyWyclsMbnNdDaFJUuZPQsCX0FJhC0YZ/y+iPjlA2gYx61SzluR4qSHA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	12DGM5ihZ7kB4ub8GBHZWpzmAqeckerMyPhlE0S23hSYuUItAIokS7LTxtiL+qoDHLCOBVlxz9YUtTH18SA/5Uye7kLUO7vC9t5duKMUSRNy5AxLBGJ+tA29+2Qo8aYmLCpXPvcDfCUnjw0y1OR+N/gAbhFX/CWVaiJPPdei2GY7fniNuMntKU+HZdvOcXtiQc0mbzV9QsJ4zouaqLMadZXi2B/TPs1EwBx1QRoeS2XQAnbuXOjUf95kWFmBf0mFXpaLO4wqha20piro1UxLLCjJOZaNoM3wXLVyYsZurICVhgffa0Ahp1f8SZaNa/1kKJnDubrvNZ9+d8jeV4TYKAAgLczTO2BMslcrxl0cTb6D6CjJP1+htMbaXJ84X9bDJk2hUQIGMfsKPD4YsPp1I79j7VIcN3TgNJGzWqgRS0p2GnaliXJu6EBAGMTOzejW
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 20:04:56.7737
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2974515e-553b-4f35-0c13-08de813bcc97
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB997595
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 13 Mar 2026 20:05:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19717

meta-ti / na / 20260313195202.4047234-1-rs

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
- Patch Series: [meta-ti][master][PATCH] mesa-pvr: fix compilation errors w=
ith c23
- Submitter: From: <rs@ti.com>
From: Randolph Sapp <rs@ti.com>
- Date: Date: Fri, 13 Mar 2026 14:52:02 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: f55d5271fedecdce9c59d7f08db1360b0=
aaec757

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: ffdd8641fbcf06897a5265225316c0767ee9e865

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




