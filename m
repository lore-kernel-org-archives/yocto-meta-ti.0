Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63744EEC2B3
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 00:07:46 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9267.1771891657122370194
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 16:07:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=UEpPF8XX;
 spf=pass (domain: list.ti.com, ip: 40.93.201.32, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T6bFx+5Erb1/puPjmOLiU1JLtSmR+v/DrS2xfYPCjNV4r5ra6Kut/DvOB49Uks9vjAW3K8gl7aPtcKU3oZxe20VH7GmFolvZJg1sJp+oNDEK9PVUJ/kqNcl2EHgxrbqa+CDH15lvzDKjrM7bG4kAXrkuYNnse/TvBawUed7MkIRIWk3Vzy/paSstem7U2ZR4uS1RNZx8BZ/v2fMgvXT5/G8kMl3HisvpgzeTuoQqZFXXMl1Ktq5v3GlzSgjIq5wrXF4HKEk9UGx12VJRwrDWxRrj3t5TM1nbtulCGC3TVeRHvruAhRF6j8tud/N61PTmcIVp597nwfs9vopq++fFTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0GjVLBrWutvOLurVnkyV60/eYXrFQanubFPo4uv4ebA=;
 b=UUU94vx7GIs/X8YMAMSbh4vfF7GTSn7jSf6C1ptgfKfke+aU+la+s5S+kicq21cg63FZWN6DwGBvUziy7TneK27dm6PRRjePytOg50YwBY8GugP55r6cobO9yLI/K9+ZLW5MNQLwrTdsd/IqZVItg0wICMqP8uH+lQPkbjpxhM8+146LW7adDtRnaZp1PkRsXsyOH8sWLT04KuU2U0TwAv6Bk6UXdg0BEVYg/PfFXaM2hi+6uRnW9JFwnvXpqMtNkLLUiV/vKTD2nhq9PxfnC5hSFO8PHhde4wMPrc7f+fKNmNqaWdYjguVn35PYLf8WTczg7YKaH5bKme6hix49GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0GjVLBrWutvOLurVnkyV60/eYXrFQanubFPo4uv4ebA=;
 b=UEpPF8XXHUKdqFTWNfg/p3Uv486AUfR+iwVwdp5gbrdw1wraJDJDkOw4TcCKneV+ll2cxpfX4d7ZU/VMkEbJ2kIwUA5lHTrHAYzO3er2bA3uslUhDz7t1KvyLXywB3aOErlYro6J+DRFvbwGqSiJXiLeZhTlZR87FZXePfwYcTjlBIxuscSn1OBbmTl3SrGc8pEwJwStF7hdaR6BLcpNBtK5WxQJdwZaCBZQ9C7brLkvdzIbUjvmVaa09g9RrjATzwU5r5rcstdt7UTgR/ufKD4LqVKlOnT0W2y3jvJfXHYskeQQxegaqbAhY/qvdbRBzHH0+dyRtYqEeDcCluQQKA==
Received: from MN0P222CA0003.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::13)
 by DM3PPF83BEC1808.namprd10.prod.outlook.com (2603:10b6:f:fc00::c33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Tue, 24 Feb
 2026 00:07:34 +0000
Received: from BL02EPF0001A106.namprd05.prod.outlook.com
 (2603:10b6:208:531:cafe::ec) by MN0P222CA0003.outlook.office365.com
 (2603:10b6:208:531::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Tue,
 24 Feb 2026 00:07:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF0001A106.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 00:07:32 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 18:07:31 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 18:07:30 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 18:07:30 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61O07U7M1715431;
	Mon, 23 Feb 2026 18:07:30 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id DDD4C138B5D; Mon, 23 Feb 2026 18:07:30 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: <rs@ti.com>
CC: <reatmon@ti.com>, <afd@ti.com>, <denys@konsulko.com>, <praneeth@ti.com>,
	<robertcnelson@gmail.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH 0/3] uniform beagle machine definitions
Date: Mon, 23 Feb 2026 18:07:30 -0600
Message-ID: <20260224000730.3417495-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260223235744.3928753-1-rs@ti.com>
References: <20260223235744.3928753-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A106:EE_|DM3PPF83BEC1808:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b3b017a-64c5-4333-f8bc-08de7338b4e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rQ1FspWpmVhezr+k6a23cU3Bwy3WttygDP7JVOHERhodijJVZzzp56xQ3/Sh?=
 =?us-ascii?Q?QeTPRXvwTZbBDR7ZWS+xawMetVINQ1L9yeiECpP4CQF5wx7SGRbzMtK4PogN?=
 =?us-ascii?Q?HRTI6ZAqVN3LHqiX/1e67gxaD+xl604kcGlpHcw+bZsDtBreNakMS/G6JP0L?=
 =?us-ascii?Q?e1i6+KsxrGv8wjq8kNvcvM4KJ/FWob/yicKJo12CWpS5N0CcKseSGJIusD04?=
 =?us-ascii?Q?kaHka6PsDCYAHU57E2oqn/omHD4VXGeCgngpb7qKrQCLvwlw/WDKZZq0L6Ig?=
 =?us-ascii?Q?qsfPPJpFPN5ZgFo2fBCO0YKdhx8Pf0UmLQW8Q/mmhLoqAE7Yu8kxyDqMKA+6?=
 =?us-ascii?Q?TW/Q2kJ8mN8mpNS6/Pkrb9IicKkupRnISenkBGg+2namznbWrUAfWYIoMDN4?=
 =?us-ascii?Q?/VBPsqHxGPyO1hJmsGSYs7g3deBJw8fB1gpgoi0YDLFlHwwW0xZ/v5pcUJ6I?=
 =?us-ascii?Q?FZzOxIFMnd3/GKSTXwyUMFueyvepV+AasRjuwb8yAbBbi6QgYGWcEnXmrTM8?=
 =?us-ascii?Q?iJLtimAkeafx8B1cp0Wmyhw/7F0WRrzeTWtj9DV9bsH2BiYZIdbB2HTzG9E4?=
 =?us-ascii?Q?woHsGg5p/+SrMfwe1fnhrEcveOB3ZJi7XAbsdm7reI28Ah8MCmfDCCqZByyV?=
 =?us-ascii?Q?5nOkB2UlCyTxwvzuQ9mEH3Y81EDruzdQP7xIf4Wu5CfCV+blj3zg6lRyI+pa?=
 =?us-ascii?Q?TX9Z/tJh43AmU5cQFWg6jzjQqnSPD0geldL7RwahnWVU6W7P+cwXUAfzzoDk?=
 =?us-ascii?Q?okWC42SOn8c8yPGIX+CJBqCom+c7OuOQvUYz9CU1zABo6TpMEfiiGuqocci2?=
 =?us-ascii?Q?fCArYE3V6Sh5qOZNOBz4xrA6m47ze1o7U9NQwcsRW9Pxc6fcmhUm2eyAFmAm?=
 =?us-ascii?Q?Vl7b/5e7HcNCnMHTof54JHkEO+H9Kw9nV1XB/g7nsIP6V0jrGlmbL7i0aQf5?=
 =?us-ascii?Q?sVu34WyK32wFTcyyVraJ7rm2O+vnz3XDpFJ//5o3GP1er40jzk89bIUJgph1?=
 =?us-ascii?Q?1TQHDeS3Tn+x3FWd7Kmp+Z3JNvPl34/rjHVnb0nF0yvSRlQXC8ddVTDlrRSo?=
 =?us-ascii?Q?kkacdD4Gl7eVliIEJ744qW8R0/CUJizW4KVgGyZktF6Lnuq4FXUeiEDQkgVH?=
 =?us-ascii?Q?2oLAfLgPGzuxBpwX+zXYhZXfXr+s6j/0E1dx82lpCksiBhFcJmaXarEu6qbN?=
 =?us-ascii?Q?Uq7VijL73PnHd6OTvc2dzjOn+QaF9NBwG3C4cmPGFVrwITLeYznWmChYqQuk?=
 =?us-ascii?Q?BhV5GQYL+T//Z+d3nhwsJiRFatxyb6vis++PMeBSjmbF32ICLVvRQ50X3q1s?=
 =?us-ascii?Q?f6R3V/AgyUavC5FtHD625OXLoPufKMc6+pfgmx9arby1TM1NboESQnx0wDzN?=
 =?us-ascii?Q?fUCKlQtkUzRpeQXS9hRkZj4aodM5dqb/Wyz7iykb9aj3M6hdz4F1c0BTybla?=
 =?us-ascii?Q?ugWHbwwfSUSFCIOdAw3F4OcKr9Mzxg8SmFjcJz1bv8I8+gD2d3pzliNoFIwN?=
 =?us-ascii?Q?m8NFuuvBPuBaOLmKaJRoiK3x/jVRIWUxALnrw0nDQFYasAE1tXFEfR/zFOFY?=
 =?us-ascii?Q?duv1SagNDKAafEkKWrzVDw1uqYFDg0knLWpNZf8WjNvBZ7lFg4akqSeEV/To?=
 =?us-ascii?Q?+q+XAoqtPYRgisFiPTWWJrctf+IOoW97FmCymx963b3ySR6hjXUYrAgnNUbm?=
 =?us-ascii?Q?+N3Fvw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	gWTzHCDWXoQNdYLHypfLwynTEGSgZv6ivzTLMeYn1/4ahvSJiTJ6T38LW+ZuK1Ncy/3nUkXjTYMj70xngOlK0UP6JnQHd1ak30BfBM3Lq4/r6+JbF89wULy13K7r2Sg/hGNpwja5VqgFKvVaOwfbc34GOrFO7ciEHrMPYnTj2QmoY49/gMERoiUxZSY4cKPej6odUk6LRFyiLyJVQDUatmWewXUkWhjFT80KsV9uLg3BIDMO0G82REgVHZgNItctK/NlhgWHB48UwqIDgNaev6vKx1tWTNSXXJHiK46aNufCcTxpOyApwK69Bb6l6cwvHtYO2jseoDZUIXA7BowsqBZ1OAVLn+3W7zySGokK8qedEYLSYNQ77uf9ZNbM95bU6kKG6Vz2JCME7ZEOy7Msn+ufv7DNLQppf3bCnl2/XvoDTiAszl0V08ofLlBzFiiG
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 00:07:32.2465
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b3b017a-64c5-4333-f8bc-08de7338b4e7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A106.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF83BEC1808
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 24 Feb 2026 00:07:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19582

meta-ti / na / 20260223235744.3928753-1-rs

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
WARN - [meta-ti][master][PATCH 1/3] meta-beagle: move all beagle board conf=
igurations
    WARN: Commit message does not include file/recipe name: meta-beagle: mo=
ve all beagle board configurations. (COMMIT-MESSAGE-2)
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
- Patch Series: [meta-ti][master][PATCH 0/3] uniform beagle machine definit=
ions
- Submitter: From: <rs@ti.com>
From: Randolph Sapp <rs@ti.com>
- Date: Date: Mon, 23 Feb 2026 17:57:41 -0600
- Num Patches: 3
- Mailing List (public inbox) Commit SHA: 95268f937c4ebc22963ca839fe28c6adf=
a2bd5dd

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: a980abde977f53015d747b5feb6f06cddcf01eb9

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




