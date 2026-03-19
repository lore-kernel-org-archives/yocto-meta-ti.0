Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE651091930
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 23:01:05 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.36])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1233.1773961256594453783
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Mar 2026 16:00:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Ykr+EcZl;
 spf=pass (domain: list.ti.com, ip: 52.101.85.36, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nny5SV08sLLzrgxsvUZFtdiWTpf7fKuDzbEsZT1xCU4bCKUYZy/WSkPy/4dPR6WPoF+d40Ve5ZCV73DP6RqmW+iEKlPecXxdPi6VY4XvMBHm1MfDImwDzAg5q1+Sjm5XK2NAq6IuqJd0M+xbeL6iOeEYa6I+430dg/9tQNnDqBD6+OvFQSiTIg6oLi1j3L2foIJluiqivSJonIGDZ21wCDiNdRRbfQSq+/8qz+6dAe7f2W16voyqipN535t0sTkCFyXmy81FzUORbvgdbqCBp+PTJOUdPPVW2vtCAIzd9fI8V1J34nsACV0KDtoLPnATnAq7QS4cWS8Iol1jPhPFeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3T1kiWn4FcRLeyHR3vMrpHwC4HbjdwFgUpXzb3fE4GU=;
 b=DWvtacGhC3tXByHmjehlXNDQMofvgxm251YaIscpaKEx9xneFYCtgrha+lq4boGPVBQ5VdRqp05dFsf7E6BzXdjVfUtjVBY8/uBIvOyTjRnQKaEU+4KVq4CGYsRyGSBY7gW/JF8MhPZSDnMD6DKSq1ft/tONOPpAc544pfGgIL5PfvvHEXXLvb0Y+gM6oeVKbjEAcpnAed7G/7ohIfTMkjrE2pcB6prPotEP2JWuWpE4V1vBw80pvHOXcafCdltFL9jfS6YYtxehgc4IId7Qaiexte/4dWnHLIgHgPRHzzrzEmd0bwO7bLVqkS7bBs7bZ5rDUymdTsqvCVAkWJBMVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3T1kiWn4FcRLeyHR3vMrpHwC4HbjdwFgUpXzb3fE4GU=;
 b=Ykr+EcZlVBrHHQKbZAuOzhJay/S/cWgHqnqclkbXE1G4yW0Q71V7NNyFiBOCZMG1QrmbBCCOsCyQ2KWtaKnBS+VyqlnAcN1sx+34ulqTG6wK7dKOxTg05PjGQWllXuZzn5Nz7EEBkAZqWhXXcoYs7uDGQJ9daJ9fup35YTBC3VT25p43y6poel/zzy44lV3rt9xfHzcGlRt1s89E2pkE7oafhhmVwSpOeVsKBVWytJwCQnLK31jKdmvujBsdsBbTyx4DDajwTe1LgSWyaKMv4ISG0HfFgtUb4PuFe3l+eTT7sXPFYXLoVBSYJibenTDeSNid1lf5Y1pSh97HGR9gBg==
Received: from SN6PR16CA0063.namprd16.prod.outlook.com (2603:10b6:805:ca::40)
 by SJ0PR10MB4559.namprd10.prod.outlook.com (2603:10b6:a03:2d0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Thu, 19 Mar
 2026 23:00:54 +0000
Received: from SA2PEPF00003AE7.namprd02.prod.outlook.com
 (2603:10b6:805:ca:cafe::45) by SN6PR16CA0063.outlook.office365.com
 (2603:10b6:805:ca::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Thu,
 19 Mar 2026 23:00:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SA2PEPF00003AE7.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 23:00:52 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 18:00:29 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 18:00:29 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Mar 2026 18:00:29 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62JN0Tbt1017413;
	Thu, 19 Mar 2026 18:00:29 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 805E09ACF4; Thu, 19 Mar 2026 18:00:29 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202603191530
Date: Thu, 19 Mar 2026 18:00:29 -0500
Message-ID: <20260319230029.3923306-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260319225815.455989-1-lcpdbld@list.ti.com>
References: <20260319225815.455989-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE7:EE_|SJ0PR10MB4559:EE_
X-MS-Office365-Filtering-Correlation-Id: 66805006-8835-4cd9-0cfa-08de860b5ec8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	i48+V9xqRumSk6qYbhqARtajZdLZS/Q6kWS+6r9x3sonBpFnX6hLPPZbLO0PfHCdOigZdkh8lrrk6SdzURErxUAAQl1lJvbsD21YgDTU1mbZYJOKl7SjhFVRAw6k5wZnaN9afSM+LPamvH2mdu7amwrSxTW/on9EzUJaw1NwLHF8AD3bB/RVKALYZYKuCW385TdlomYSd0ASkIscLhBdGK4dYSPfwvXhsZ88L3vKfSUx9KcjIwfJSRg6K0qfxEBE3M+77hJ9KWamSAUFi1DiAP2h0zbYdTcTkCuBDMxggnYY5sj84rHB/Pg8FyIVNrjKOtDPfGz6urNor7qX/Q2K9GXID2h5xRCeuUqgmeSaB4zPghgjrC71ILs1+KlLIBBN06erW8ONlkHW6OqQmJUAxWEfF/sTD5qf0Yhl5P1Wqg0QTH0j60iAUNQ++nqebkMCpCJz1c0fJvsRpsZaO8Bj+zRBpZ7TQiTf+m8fW8bLJvj4Fthh74GbO3xuUjU+73lnkofU6l3GYW6crFAZzqdaw0fJ1MpdKz7EGms8tqHADtfWLtU+Ioy4IAXwcqgKYhnGqPSnsBwY6S1NIFW1/5D+ajzj5QDW4PFDQvzaFhbr96K16EjiEewaT63peedfVrC9z5a5ebkIsgm2eRav+ZaRQm2m+RzcKhMTBkI666EcJKcRrS48mZ8Vcv2ZnrFq6q+X/LODXOvzfc76GCk2Ii8d9ZzmMdNASDRENty4pMpKFKLfzMF9xomlR1Pk5WgUOYhmeY7gCr/U07HxtDZD4083NQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	hcXCdSccJ+AOzqNGlo8d0MLZgtbfBC9lKlimehtaEb05QRyCIqArkVZotAnrcVF5tvJKFIYbWUIIcMEvz5LDlykICjb5guHp1ERqyRRV7Jt1kZKjFvxOQoD9KzOidpLLCQ2hgSYKGT+k91DjtFcI/50FKJlBYHA5fHjmGPwAqQTSPNwT8s3ULtDZMK5kZgjo619QSL4L3OQ7MpEZu9dGWpuTPiClOhazMHQQu6bBEAQqKKvJKn6EcrCEXXvJOt/65Bds4rk+xoXphVw1rxzM5QkdDCIr1OcQZS1YFboy9/1g8w6tmvR30qTCVXqNbs2h6raXdMnO2tWGjxSGpZeA2G7mEBdrEuvY+rqIjk7JFNHsKsy2Bg+ysqktTIhDaZb15Z8YhEjUhr35rexh+ZP1pTtY+XSUCccO+ZyPsAw0k9/QIIsX1WNWX8wdDTIsatjV
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 23:00:52.5703
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66805006-8835-4cd9-0cfa-08de860b5ec8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003AE7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4559
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Mar 2026 23:01:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19794

meta-ti / na / 20260319225815.455989-1-lcpdbld

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
603191530
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 19 Mar 2026 17:58:15 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 250826d129b00c0626abae2561984d564=
d00e2c4

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Shiva Tripathi <s-tripathi1@ti.com>
- Commit Subject: conf: Enable dynamic tpm-layer support for LUKS
- Commit SHA: c4fc80ccd76ed65a98cedc0b77a64e576b691320

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
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/packagegr=
oup-ti-core-initramfs.bbappend
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




