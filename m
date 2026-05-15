Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EAFDCD4851
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 06:48:06 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29437.1778827681895089373
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 14 May 2026 23:48:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Yiufwnud;
 spf=pass (domain: list.ti.com, ip: 40.107.208.21, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MD1A+5LT2r16p6DvSTkEt5DQWL5WB8M+FuUTOflYm/wnXdBzSBsU9pS5xDTEIVhS34uR7FSAeLCfqB0v0DFBiUOZojhFdzrlWtNkVPNxVS6Sbiy+NXJsXEw9BEm357UrvjXd8QQrETOOElRhe5GwTtRpfYdbkM61vNJhCoCfvf2cAio+lQvcclNCuyV9DtboPGxfKIS6SWp9lw5VWAcC3w8DJ51CTDDFCHPdZbOVCIBzaRLMbq8J+WXxeLicBJeWPR1mF2CERkfhIBezRWtTZk/o4SXCYS1kl6TH/j683b2/kYHdFFBivL7J9iOtBTfxvz+Qrw7mNbga8AMl30b4og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gg1niPvn+aXW4MN3fhTmdP9EAstUy0Sd1K7tBmaVqO8=;
 b=yiL/RBSwDpa6DompLVIbce0MxW4uPsY1IA/Uxl7qFqxcUsbGQSuQ+6s0zGjifVy/HzV8A7OhXKXHbNv6E4GYf68Z64yUdIwEq30ylTLe06cZTyigvYnDzS12c+wJnp5zqwf4S0fDvd+C4FUElXgsZgTj/8s3Er9ctAAZ31Qg9dChR1AG42XWiPOfadUaVsBa5mUuHdApre9y3X2hQOkRLdQWrJke7vrJ59CMgGxKvEctM8uUWBtu4tAHOzTMJJRkT4/ldHWwHpQRJqH80aybsDVvfrXVZd8k8cMCbiiykKe6J5/7xfRqwG2beSVRrXxDedFuMtxFWLOjc+/jn542HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gg1niPvn+aXW4MN3fhTmdP9EAstUy0Sd1K7tBmaVqO8=;
 b=YiufwnudPxVF2eu+EVn0FgXyw++v770eF4T0VcYqi3HudbjF+VUR0Jo+EnmzhAYqrKSs/McXArBlXMYRuqDB9/Fx7RGimgxc5EAP/j5jXwhXjR4uXp2OHXNblWb2n2DnPwbHMHS//joYiUUEqOI4jDKEwYma+QQSSzsTQhxlJIkwpZVPM7yqZcEL4ier+CkBjZjyqqDcvTi0rrhE6tvAr4PdeG/JwFKtNTBid1Sdi9Ha9J+Jf57M3pCp4bK0kyakuEDSwylHKLKiNTdcy5Hoytt8E0BAvYzI8Yu8KNIjbQhMpktyqrOAZ7L9nVKPVc76LxAr9RVDvqE1VVQQ+Ojkew==
Received: from BYAPR02CA0009.namprd02.prod.outlook.com (2603:10b6:a02:ee::22)
 by DM4PR10MB6886.namprd10.prod.outlook.com (2603:10b6:8:102::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.13; Fri, 15 May
 2026 06:48:00 +0000
Received: from CO1PEPF00012E60.namprd05.prod.outlook.com
 (2603:10b6:a02:ee:cafe::6c) by BYAPR02CA0009.outlook.office365.com
 (2603:10b6:a02:ee::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.19 via Frontend Transport; Fri, 15
 May 2026 06:47:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF00012E60.mail.protection.outlook.com (10.167.249.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Fri, 15 May 2026 06:47:59 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 15 May
 2026 01:47:58 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 15 May
 2026 01:47:57 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 15 May 2026 01:47:58 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64F6lw1F3898346;
	Fri, 15 May 2026 01:47:58 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 68F03138B5A; Fri, 15 May 2026 01:47:58 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Suhaas Joshi <s-joshi@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <kamlesh@ti.com>, <k-malarvizhi@ti.com>,
	<s-tripathi1@ti.com>, <praneeth@ti.com>, <m-chawdhry@ti.com>,
	<vishalm@ti.com>
Subject: Re: [meta-ti][master][PATCH] meta-ti: optee: Update to 4.10.0 tag
Date: Fri, 15 May 2026 01:47:58 -0500
Message-ID: <20260515064758.1254435-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260515062818.1468076-1-s-joshi@ti.com>
References: <20260515062818.1468076-1-s-joshi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E60:EE_|DM4PR10MB6886:EE_
X-MS-Office365-Filtering-Correlation-Id: a80bfd6f-361a-45e4-993a-08deb24de72d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	I0GnqDg6LLc5cUmbMYLP1h+auzdtfRFz0T1I6GgiryPChFvDdpqRc9Ze2YpTSI6Qnr4hbAoJFqZ8nE16uwDgV5UuIEasvDxqwNH6gJydLWYiJdCj1yyyFMZtYn5fg/QR3VNnEY7jSpbWY0JDPFzFowxXXO0wFuFyk4Q5H8gc2GtvF4IOpw3rChsq8ATwPdQJgzs8rLEqm6VswltJtxj4bJlbBmf7UHBE2INAirIcrHsR3N9Y98zqNQn7kPy79NK5UlAvoIgiTd1n0ZrdChEUA2M1DgmMhZOePePM3uxoM8qgwZsDhUczJa5DDfbRxvYXPlIzgGj+ygkBZTqfEXxQFQXMBNAfZ+LeamBE4gDgR7uEXg43khMgBAteiYs54xa9OyMWaeYB9ja2+j7uiC6Y064Of9Nx5waPEMGOwwPwlC1aYtA1KiEdD8J8bIfkbYjQvqdPrCZrJjzdJDx6uXgVvIMoDOdx0WhHUPqxjSWZittOlfMqBtK5h6Dl6qNZlH5yZnPatmdrwOTMOxqxv6YqAl8bbTuCH/LlR8anHSdH8NYrIguRWEgV+Z4o1ZxUesoWb16mXZfl4BUVOFHStA+9MsEsBPeWiGdwoK8ZJeWixOzXqBDqjysB2+XiElzu9b6GVA5bxi1wJ8v6xuecRze1P6tl3dGoXb1EjlfJBmfUYxTTNVduO8uhTh4uMAfuoFxNBkH0Gd/y8Dry9lMae234gbz1sLcp8w8zuIMJhCKS9Z4=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	hvZK9YZrQWkVPcKHta13f2Rane52V9TbW+dfSbS6EhQB6V7j5zeizEaAwasNjV66/hLSN3JRCj/P9Mjy3fIco+Tf+MtecVsWM13TIiyA8v0cnfbWnPvHCI2hjKb1uFO5IwXGmZxKL0O8FIenP8Ce/KI0QKAIxyZUQzAyeV0UP2uNvcF7ERpdcTLysTs+ia8FO3WIcpfsPdSbjdgu6r3bCbiQ5KVCeZHp/Af11InZdXwyZYluK+G18v+evfnZ+3CiNiQQrd96l9WiVfxh8O3GElze+W56tc5xlFPNrq5i9cvrbj/9j1kWRVXj7pgVz0VjhoO3F2FkSKL2uK2oKE9gDYNgqsEtg9JKs/tqA/r+uFjC1X3Jc//MDU+ljBaQF1/1jJmZZhoEd03/cUPlg/0/Yzf8VzPT8MvCFjWU3NlaD/bn+AX9eHJri7oBLRc9np+6
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 06:47:59.2620
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a80bfd6f-361a-45e4-993a-08deb24de72d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E60.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6886
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 15 May 2026 06:48:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19934

meta-ti / na / 20260515062818.1468076-1-s-joshi

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
- Patch Series: [meta-ti][master][PATCH] meta-ti: optee: Update to 4.10.0 t=
ag
- Submitter: From: Suhaas Joshi <s-joshi@ti.com>
- Date: Date: Fri, 15 May 2026 11:58:18 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: aef2376a581255e085b6a59ec2cbe123b=
1a395cd

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: 05245301896b2a6678843bac546c1120b2fc302a

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




