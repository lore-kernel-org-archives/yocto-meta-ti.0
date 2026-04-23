Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F7CFAD41B
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 05:55:48 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.26])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13448.1776923747788054869
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Apr 2026 22:55:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=i9DPMM1h;
 spf=pass (domain: list.ti.com, ip: 52.101.62.26, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hKPoYTJugqNDkJSSCHuCdQeGIthGKBVxY6jeGZJv5f1n87t+B4mxm6XtPaYXo6QhkHH8nsFZJSBx3Y9ei/uhpoX9/S04Gdl1uXG9Yyo0xMohKRl5Tfb7s5L/ZUJ91RtlPKC9RZpwd/jqvu1T+51VOzEpAX26dafCnRkKJQiXvmxttE9o87+lVeGDxX3rlgk2l/87XiyBKwYpikcRZPM0V0wlVI73Oa0hGOiNrcJ46zEZB6tbwUXnva3fGsWmV4SnH0D7IY3odH9qZApCUq7cI2cQX7k67kZv4d7nKqxWWKQu+mpRQHwqqiNjqWfxRXpHJER0o/6Cjhdkck6B0RQePQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NWrPxpLrdUeq0lu6ckvRZ7s4gw8gC6KCTrnNZXN+01E=;
 b=x1+65jd4Cr47rEwBoFn1c+X9Vq/41Rnvf+UwN1rPa4zG+8dJg7J3Cwo34CPSQW2U6PxJk7FVfINz4hL52JPCpLZv7MEYkh0u37+H8LoA84Xw6nYxFsuxMtJRaFAvHgYncQgUbH+4Ppq7sM/AaYvQTaXqjRoj+RgNjNpK7HVmkRQItODbn9vx1kaux68J5G4J/eq6DRX2UqoPp1MeM78dMeRoIrTLP+96L3pQz/1Paph6jyZA96wlAUj+ColyXVp99oDTQBJX1MPPuFxdIg3tIHnGjRpa5zlAQ8UmNBIiCuPYORGHxkck1R0H2WDGIJskZMFEyhLf8f+7ZclYigk/kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NWrPxpLrdUeq0lu6ckvRZ7s4gw8gC6KCTrnNZXN+01E=;
 b=i9DPMM1hxGZ2CP9/c6TjgheD+DNsD1EdziZ2FAq6OxSbJ/n2EF4e4g8yU/zoz8I1eBR1iy1D/i5Pju8Ot3CpYteR0NKCI2SFDtY1l3yjSykZJLf3RwYwMS8tpD0ixt5UDbXVab76VMaR8MW0R9+/LmV1r+KE3oMTOs2UFDZFLe8d5GPGty8Q/HiYBGSTidLvPInHXKGekyMow0NjbdFNXznnnufkFtLcuA/r0Rlirnyg9qOqJ91KHB8gq+cclB7JU6fkp++KU8q5L9cJV1gCi7BpWkW+rE5Q/rSS9ORXAq7j3PvCeajSFvNid/KWd6IHlPtmH910/K3Qi7AY7b3yMw==
Received: from BL1PR13CA0127.namprd13.prod.outlook.com (2603:10b6:208:2bb::12)
 by SA2PR10MB4604.namprd10.prod.outlook.com (2603:10b6:806:11c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Thu, 23 Apr
 2026 05:55:45 +0000
Received: from BL02EPF0001A106.namprd05.prod.outlook.com
 (2603:10b6:208:2bb:cafe::3f) by BL1PR13CA0127.outlook.office365.com
 (2603:10b6:208:2bb::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.20 via Frontend Transport; Thu,
 23 Apr 2026 05:55:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF0001A106.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 23 Apr 2026 05:55:43 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 00:55:33 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 00:55:33 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Apr 2026 00:55:33 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63N5tXJf266725;
	Thu, 23 Apr 2026 00:55:33 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 04A8C9ACF4; Thu, 23 Apr 2026 00:55:33 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Yogesh Hegde <y-hegde@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <prudhvi@ti.com>,
	<gehariprasath@ti.com>, <rs@ti.com>, <jm@ti.com>, <reatmon@ti.com>,
	<afd@ti.com>
Subject: Re: [master][PATCH v2] am62lxx: Override serial console to ttyS0 only
Date: Thu, 23 Apr 2026 00:55:32 -0500
Message-ID: <20260423055532.2280895-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260423053952.254126-1-y-hegde@ti.com>
References: <20260423053952.254126-1-y-hegde@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A106:EE_|SA2PR10MB4604:EE_
X-MS-Office365-Filtering-Correlation-Id: 6af25d4c-af73-4322-f3d5-08dea0fcf4d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	JtWm5pooiC3yzHUwOKZDu/3jgBidJzyJ5fqu+3RRXBtEKNHl03XStBRPPPSn0yGER0O0DQB2EVa01DXQ6NXIbQ2xq1/TooydgTHt4bapYOSbBYcGlN5FL8gbCXL/EyjxwwGSEi8jI+OQcqeeWZEX/Ot5hefRwmTwgytpWv1cqOfkq51eneQmDXsNCvYxuCA63VXMBcPnyPigO8sEP1hh4IjnRIQ6iLCttvoHXd9S06ugaDTds7Cuicqhe4kC0/MfLx1Wsc5R9vXRxOTht4wzVn5QJlmrxyTHrjJwyT6Aqe5EUDND2KvOYLxR+rc5gkus5bus4rkyqitc1OVOmGEFQxVefUOquLjS0NID4cZQ6G3qkosR97dOvaeO3+ZZOnpaEt2RFhu12OKrUt7JCMM8gsQ8QKvLkFqZJ4bX4tEftZ5SuMhYNVWa8LLgalrTL1vrCRkfjTeXIHRMvfZkoEd+IXtd/JlSV9HViFMVRD8XUnnB8pAMZSzkkO6uDyxrXyNn5fIT0nteJTCsj2fZnW6PbacHQAi97YN7h5bw1DWyHdetjOm1qetoCUDAFgvtoaff+US72vF644VE3DlYKcnT7qgkFmaJZmMdo/3xHotMAFYJb6v8cbw13Fw/3ADhJZ9TMCrZ27VPEsAuFiwDumb55yWRQ829a4IXLxsLL3sLvjCCpRVcQOJBGciG5vD9Aw+1aeQhOQSgUCJPvV+apBlGhDPbrFVUG3rIkzl6aPaOVTY=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	XeJr6RaftqEdOyqxFJHT4NYcLCZHNDgM0bBpN8JX0Xz/nTpqP6LtcExYjQmx/UrGA/0dvPoG3hoivgZXeJ+L7utWGxEDw9uKST7F87ecMhr2fjmuKfVuzRwiIWXp3QV4+kVnMAZoqrreggqSHEfxzNga4VwdmBmoSLP+UhSqvBBZiDFjucvwx8g1/wHTE0bXEzD1QxC6KZ7nc15tzrj2/NfN1Ae0r71zAtMUUl/YKd3+60TYuEEn8+6dku0PxNhJ1TGEGA2ejpmado1v77eHTBtQ32oC2pgu3mgjiIyGcTKsTA9cavZaGUMTfiaZAO7NrLHSpDIi9fB3oJhvfXxVrPXcOkcovtQewWbcIkp1QqmcLjkyLzu+EtmS6OD5KrdXHUAcYDAAKTwO6pqlnoaRk/WYdSpub+BCKyxvDVvQ+X/noZ51l8xCILdZuZaZRBpF
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 05:55:43.1531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6af25d4c-af73-4322-f3d5-08dea0fcf4d0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A106.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4604
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 Apr 2026 05:55:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19874

meta-ti / na / 20260423053952.254126-1-y-hegde

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
WARN - [master][PATCH v2] am62lxx: Override serial console to ttyS0 only
    WARN: Revised patch missing a comment. (REVISION-1)
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
- Patch Series: [master][PATCH v2] am62lxx: Override serial console to ttyS=
0 only
- Submitter: From: Yogesh Hegde <y-hegde@ti.com>
- Date: Date: Thu, 23 Apr 2026 11:09:52 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 2ec66f7586fc6255eb766912caa24aa2f=
0e13d3d

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




