Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F252DFEA811
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 06:42:30 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.24])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16488.1774420933111307811
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 Mar 2026 23:42:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=FQNiTF9T;
 spf=pass (domain: list.ti.com, ip: 40.107.201.24, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TpYAKT8tNxbZeJR7MwgATyXrC9n8lHob5Z4wDGMuzOpTXg7bgilLdAciG8nytoNP3uMscizaA3bQowEy3ozDcd/m9F4hkwm72n+r+hwNvzAEKAprJnYO3HFqSgWErvC4wk24dQOStADU/oB3+VwlWBXdCnKTx3LC7AuMPk8L1/Wc9t0SYpE6LPGpWX5J7k7nnDfHW9H/ujBlbmh2pCBu5ske4pvjuKJ7m8eoH19yLAQdrXVsEtwl0NXkj77LRdEa96Lw1mgHviCJnpeUgZRBcUIwcs62UdlipqlyKhI5G78lId7z6rk8JafuP/5IKT7UosYkUIpghemURyd9c3fSuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3oZ9/KdcEtawp53Ss5373RZcGQd71dx3aVwZvo6GBU=;
 b=TZu9P9wNLnybPIlc8/XJnhD+z4hJxLjB6CWy6O8sEJ7TiOkFaMvifZFAd2mvgk5afohzghl98rXfyW4tWZVN4j5ylmkKYvXefsSCsYToLdIPxe7EVZQnI96QLBWVC/a+58pTW29hrlU9yQrsc9vVK6HwNJc1ADRcahdhTQMTjq3eE6FfgUWNhb9a2qFX9lWZw6i1H78/nn9SBUNj2CaJv0GT/S+N9KmzuoGOaVoQwd3R9cL+QXHYIIlB1hV3K4/KkV29ZTeTXaTrLuJttgyhbJCVcDHhDy6Srdr8m4CXWU/51c7hwJNTKocw+WrNuE3a8ahzxgoo/rc/N2k9eoE1mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3oZ9/KdcEtawp53Ss5373RZcGQd71dx3aVwZvo6GBU=;
 b=FQNiTF9ThIegtCQ4tMI8AngSpU8TVcAZ6JbXMvyNJYmb7b2d3yiFICJNen9LMiI+Q8BWjn/L61t0Y3Ri4rXflCr7sUvhSxCmI5By5sbsyU9ONdBA+WihS02OOGcz9oeGBbGHNsKOWtRpuq8dkKPFkTVyG5wP7g2s2RESk23b8Sc1mXRiGyIFBGVtXYSxVoxwxwiJR0WvAowMlYaWaOrXtSYchhLDWQ/f6kcta8GdY8HZ9Oy79eS2fPSwIyxCRXvSZCMmA9v9R7R8kQ2XrNKLbwQMbDNnzmyKUHM0EYojoLwANbRx3YHNNPVCPaZiiyn6prmCBR0C6jrpTrXcmEK8Mg==
Received: from BN0PR03CA0058.namprd03.prod.outlook.com (2603:10b6:408:e7::33)
 by CY5PR10MB5940.namprd10.prod.outlook.com (2603:10b6:930:2b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 06:42:11 +0000
Received: from BN3PEPF0000B374.namprd21.prod.outlook.com
 (2603:10b6:408:e7:cafe::c8) by BN0PR03CA0058.outlook.office365.com
 (2603:10b6:408:e7::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.32 via Frontend Transport; Wed,
 25 Mar 2026 06:41:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF0000B374.mail.protection.outlook.com (10.167.243.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.0 via Frontend Transport; Wed, 25 Mar 2026 06:42:09 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 01:42:05 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 01:42:05 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Mar 2026 01:42:05 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62P6g5OD2379759;
	Wed, 25 Mar 2026 01:42:05 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 7413F9ACF4; Wed, 25 Mar 2026 01:42:05 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Moteen Shah <m-shah@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <praneeth@ti.com>,
	<vigneshr@ti.com>, <anshuld@ti.com>, <gehariprasath@ti.com>,
	<denys@konsulko.com>
Subject: Re: [PATCH] packagegroup-ti-core-initramfs: Remove runtime managers from initramfs image
Date: Wed, 25 Mar 2026 01:42:05 -0500
Message-ID: <20260325064205.2932390-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260325062856.2664785-1-m-shah@ti.com>
References: <20260325062856.2664785-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B374:EE_|CY5PR10MB5940:EE_
X-MS-Office365-Filtering-Correlation-Id: 239790e4-0a8f-4399-ff24-08de8a39a362
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	qML+r7mRre37Xwlwd8mtFoScGzEWgzpEThGRwZHaPMZJojtB8TfjKeH9LObgb8o3ni21VieZgFLXTlk35MpMrbV66BI/TvyMN47Y22xisOTlIsEUC/rG4wkV1XR7CLgk+FwkRgz3IjR3utG2dbJKjvdqkzIXlfoU/lKsMOng/CXaV6tFOHkqkplNH5WcrG4cbukrHF+zL3xuO8hu0UbHmzwDaKOD8t5v+8RYuVCtHAbbtKPVhApkDgu3t6LxMEiTAn7TzE6aTS313k89bZbU4mx8lyINFUTjBjHs05hbR03orkoutyLK7bDbxmyOmSrwpQkvWLRb4qdPQN3+i0F/AwSRm4W4VC9wgUFGZxPP1ArEhmJQd02ldxKvMvLvFKQreUQz+iC7ZOIigUuOwU7rrkw1NK8MlibWTBXNp8VghWXOnwVWzl7L7Dkp1DKM5s/jmUv4yWYjUdxlDUFzs7OGzB0aCiBsgaS7h0a1UcdlPkxdrfZJkYdcr4GqE1MwK/0ByUiayKYoMb82OkDE+GAD56tUEnOiWVDXln7Q0Leh3uSWiTjtoqePDYBYGpNADhCR2/2TnVXWEljzKkw2jx71pqgyUjCtPmh+q9BoA11h9SV2S4ERjkVsVCXVGZUTumr3rwC5Uq3iksNuJy3IOReX8yrT8bDRFXd+X7iSCHNlIZsl6eqrFP6+yiNSR9yoOViN7fUv61pBXsjPw+cqTd7xPWOHJ6YxBhQG9dsGas7DS7MjdSf1WqzxyYma7Tj3t8HWB1KgiRMN5rpB7253Wy+FvA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	6heNA+vDRSobMz2KS55L5uRaJI7LCK9onrUpviNLTZkpIcx5TzvkPlb5yy6d0qYWsYArJmQvfo18fQCCiolXI+UbMsvMtVPY8uAO53/WpR1obwJFaYf7zCVAKS96ZtoJCD2sm+ijc1m80U8hMZEpBfmM0UHgm9DytKhVe4RoWqngnMAhDa2+xsa3dt7JawUT82GsZ3iU31SH3RC2eErjeRh4WB6MzoNxx+RbElBUQ4fteNbowiLkpyG+j4KHlkzN3chEo1h/VRP0Oh9TCR7WDcwSTmTItwj9nIND/uTDsjBpYWs4qW0wJ5Sm006ra8R+hXGgQmYaGF6d/C+F3CHr5YBGGYxPZtRby9TIS0Mv4qgugj7bHVA3zShM+5NVuR8SQO4wRGjV4zUS4LnZNetHqV8cD3/yu7vFKEIb6RNo52MrfnwYkvhfL2vqE/XNiB1z
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 06:42:09.0981
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 239790e4-0a8f-4399-ff24-08de8a39a362
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B374.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB5940
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Mar 2026 06:42:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19814

meta-ti / na / 20260325062856.2664785-1-m-shah

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
WARN - [PATCH] packagegroup-ti-core-initramfs: Remove runtime managers from=
 initramfs image
    WARN: Missing branches specifier [master/scarthgap/XXXXX]. (META-2)
        patch:68
            Subject: [PATCH] packagegroup-ti-core-initramfs: Remove runtime=
 managers from initramfs image
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
- Patch Series: [PATCH] packagegroup-ti-core-initramfs: Remove runtime mana=
gers from initramfs image
- Submitter: From: Moteen Shah <m-shah@ti.com>
- Date: Date: Wed, 25 Mar 2026 11:58:56 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: c301a37918de41350fb9280a6f2d8e525=
8d17d21

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Shiva Tripathi <s-tripathi1@ti.com>
- Commit Subject: conf: Enable dynamic tpm-layer support for LUKS
- Commit SHA: 9e86280d686586ae0328a44cbcc2ff45e71fdfca

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




