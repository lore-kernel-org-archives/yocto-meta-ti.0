Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA0DB1039883
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 20:05:04 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.16])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.105346.1772222702331499095
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 27 Feb 2026 12:05:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=r0WtDP4a;
 spf=pass (domain: list.ti.com, ip: 52.101.85.16, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FTLnvGtyTeiDtR6GVUTSgzZhQiP+5F/d+gs30B0buRTbD8fbMp7aID10LWc+8uASJ6wLv0BBOHObbMGFuJjUG7kr14o9pnBGDuKxf4wSU5NZeF5mY1EkOHu/mSoq0LQEiVAk1vtT1Qm4iH1uKQrBlebEDn5sBE3mHNsyKaHKv/kTLSs5VlbXXDowtwPMpZJJ3XKjl5GXELmjGsEt6OX45Zlake/NJaZE9L+ptKxfoMnuLRonm7zvVPlWXYkgNso8FgMHHI7XiM83nX+JrhO2cWJaFaJzze+2ekhvy4/SaH6APKcmu9Z5eB3rLB0BP/z9ROk/CWWM41iHJmz50ia5Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f8ZP+8B4nhj76W2nvHy0RG8uSqPTvzeQDPQTtpyJ3ek=;
 b=nFou+5rcuQnAOBlKF4fxugCPGUOFLRrPKJ1nJAJ6yZDJJ4vAWteIM3RU77lQM/uMc/HuTB+4CUzkDY0I17DZKei/GJaYnrqO1EGGAgq6hQtgW1XJQk6iSDA9kpHkGIhuq1NZYPaJqBTGK3LsMZlhpavcMmdpTgeBF9jp49O/QTaa1CtRk0cYzcJRIhqorNeDpeilozSbtoG/YsGzIKhb7E9eBBcRKb1xhGPKxJQE87wuFSZV5uslPVoJvPOlYykC8Jlf3Nc0Ir8RNytZLY07DdCdPnlw/oudpUnpzmNPZQH4l9JOl0VrJtPje/diH2PrpqtbwhiQDuTD39df58DUwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f8ZP+8B4nhj76W2nvHy0RG8uSqPTvzeQDPQTtpyJ3ek=;
 b=r0WtDP4a18nYBTAfLX0Eof7c1BMYqg09bRUcyicnTZz54vF3cxRPOHCbU5ciVAWvKVNVQo/RuHOVHlSJidzNc/qbrno0AdSTfe4P2FcTULdVeLNPTcPSJXpwxkVZZchgC/0k/8cqzG8XAezJ2oTGKTIS4IAVY0noyahxoXhNYLX0th76AaAbDH1tFJ6RvewrvwGhVaWeOUIdqtCv3ELO0H5sF7K486BosusaxjyhOxNpsG6CJmMMQZNo3ccu+Hp1AHXVM8kj0l0HVJSBgPAUSW56SOIxb0GO+Su+ZXLFHbf0AhRvNCM+rN6hcOkiPHtnN18dcqqHskwv8VxSRFbIeQ==
Received: from CH2PR03CA0026.namprd03.prod.outlook.com (2603:10b6:610:59::36)
 by DS0PR10MB6150.namprd10.prod.outlook.com (2603:10b6:8:c6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 20:04:57 +0000
Received: from DS2PEPF00003441.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::3a) by CH2PR03CA0026.outlook.office365.com
 (2603:10b6:610:59::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.27 via Frontend Transport; Fri,
 27 Feb 2026 20:04:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS2PEPF00003441.mail.protection.outlook.com (10.167.17.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Fri, 27 Feb 2026 20:04:56 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 27 Feb
 2026 14:04:56 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 27 Feb
 2026 14:04:56 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 27 Feb 2026 14:04:56 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61RK4tZ4617696;
	Fri, 27 Feb 2026 14:04:55 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id E3D279ACF4; Fri, 27 Feb 2026 14:04:55 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202602271140
Date: Fri, 27 Feb 2026 14:04:55 -0600
Message-ID: <20260227200455.142739-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260227195239.2256511-1-lcpdbld@list.ti.com>
References: <20260227195239.2256511-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003441:EE_|DS0PR10MB6150:EE_
X-MS-Office365-Filtering-Correlation-Id: d211e03b-234d-4a50-a54a-08de763b7ae7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	y3KttWK9mfhIkmJM8jtQj8crdlr56LeFuJbvvovkjAH3m9v/dMyAiSKQqYghc0MP9aA8U+a7kHJvgIHj/STBJOha10hqMnLKuOlkAjAdkuvXhh9tAHhM8Tu2wqitnIEsPvjOSAAmsgtH3WhL/qvGjoaFAUnGr4+mGAhtecrSPruSD+/0cWC8mdabLhdg4DyC3/lt8f6Emu7LGS9gN/dsL9hc6cPtzF05EFJeTUdJ3ruStNdnz8eO6pmMfi+vdIChPNhUdFEDNLvRUnOW/hsUUrHDKIDBYCrEdccYXKv3bb11SzJWsH7FOf4cmDZ1tezOWgjGNGs/lmbXUyx4cc7zDp4YSUzu/hpf4W2b0jaeaQAOSqLss+lySCpnV2CXsbH6l8e3IMCn5Q9271cJUFdlBsJiC2AuzpL2ig7Rqeh4QimKVl0ToWWia9jnGyTMVXldxIXbccFo4keZXYaNYlpvhK32Hra1wzc9kkkh722VKYF3kXYvLDF2c5IUG3RXF8Bl44QAOkAFBNgPgH9YHN2zhqD5nn/OVvZNCzxDuuqAu3EBRXoiHmQo5qQQ1Sw0svWuwUucVahD9DPRIg1a38s8MtzNecHnrxVHwV0Vul9uLobghRJo2PONPtg0J1dMwFg2GUYTLWoR+uQrPCV0HmX6hT5eIcrSHOjqlGrWunMamjM8fXKiiyBBlAtGID+wV8dZwajRB0pPVDrETspobCHniUE83AfsD3nEQ9fHfvS4ZFj4O0LfN+Z+rE5P7AatbFYNSt7sIWArRkCEBpxa69G0Nc2APSlEx5FB2CHvOm6yNiYznCG4BCAy2a4VSoM/n+/zMsmE6VNo13hTB27J4z4Qcw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	BrP0AVv3SH3nboMA/sgrB1Zes9KIGJWRvrh7UHtGsIG7ZXVderzStzoJ60UHgSTh32Rk5j6UrKdwXMnkNYsaLAMfpwMDwaGHeiIo337M65qB2nrCjttI2+7b4ae0z6IboZaTx69eINXgu/ls8AFnDTA/manS0DeweHuXLAW4se/sasViNFsshNhC7EVzB0gwOadQDpJdBuf0jPsqIx9oUekQltb0JZToNOFsXzGK6rHsr+3Bfr3/5YVhWo5Fap84534RvkCKaFPBIz1hza4QuMCnj+r6lPfGtYCrb9CSvjyIh8Njw6qy63SMGka0vYtyz/Rvt3IGJBBc5QpOHBwIHtY1wVavNm4NDa7HmbOXINM8Ql0+clKqo+tomdU62y0bXd3E7XL+QtBxKqE97UClU8Nw58Di8nya235wdEJsTKAkPFvGMEud2nYlCYcoXSag
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 20:04:56.9334
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d211e03b-234d-4a50-a54a-08de763b7ae7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003441.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6150
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Feb 2026 20:05:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19622

meta-ti / na / 20260227195239.2256511-1-lcpdbld

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
602271140
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 27 Feb 2026 13:52:39 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 609fef26e65c71689128552f1d611c9af=
773eeed

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: beagleplay-ti: use the am62xx.inc
- Commit SHA: 00648b0fb6a925da4c40a97051433338107e1c55

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




