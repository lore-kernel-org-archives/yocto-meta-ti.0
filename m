Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B6C4FF8875
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 19:46:12 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.3])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4672.1777491966046344552
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 12:46:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=nV935SXn;
 spf=pass (domain: list.ti.com, ip: 52.101.201.3, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YyDFlJ4H00ComPidvYHVsvUbQQMRBZLrmLq0RvEiT553lPu7Q/7bpmdBGD5Buo+7xwepUlxHETGzn6GySx96/YWbiFay8Fcr6kW7gRSWrR2sJK7TGPAigZ3+ADeV2zIWMTxcQbophYU/+l2OJID/jHQI1/f/dmK4CG7NVFFfx0ZNf2OfSVs8d5D2Bx5Oe966XfPb+1ojW3dSvv0OdxicirI1qmfWB6wjkfsXZ1jlK1rEcU5N1ApCiL+hLiqoF4KtGm6d42vdTol6/2T7vF8O3zva5x0ku9GkTeGl2a+4NHH4mSH6xvmsHatqS9f5P4agQF6JWUv3mFU21hZ57+ssDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=roCc9iab+i/cwQBn7VzgtaukDSW8l74UOQZsTYLpWx0=;
 b=Q52ChWoGFh4u0rZIgvLZAmv/MIFa60+OiukOALPZxZl7APKN12F7ZaezwNvo6LwN9T1vgnjshLzdyv4rxy+HD+I1sPYwpJnj+2eneZCPDmk/xsPOzoU5jiUle15Omw4FMgiw5MAWNLFMaPlDrP6VFM3u42WfgBbir4iyNiH5oR/9yCGykRRC7PmCJ0NrbMvUlLHe6VWYrrI+c4NpFUcD3OESmCNnN5ZwJaAnGdX4EDcGqwvd8INlih4YG8MyOzQeXSslrTJrDnQQJ9wjPuuw7gEMBiDU/JylzYmbPxHFDJq+bcG1FGzHmSH2YBrUcyTC0KmH1KZ/0HH5jXAnZFht3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=roCc9iab+i/cwQBn7VzgtaukDSW8l74UOQZsTYLpWx0=;
 b=nV935SXn4ZKp1pCVUUQ3c3g31ennC0ri2qJTaP1mGeBV8KJnBx2yL0FgCYxu8+D9EOQMoiY4Z1IlAgupXnrMKEcN+ljPXwgfza/XYYybNG8jaX8sSK3OujxImGOIc9W5OV7615Oqmct6UkJWwaKvihk3Mx/cCKLnMzGUBA2nUL3mi2GSAYpDT9GY8PHdb9qyxgVPRrrjSzpuSaAKtsic8Dpql2zq8nxzeKJpEP/pDhnnRdQwSl1lzfOtXsOyRu2FaU/7jJLepNSR5jQmuIpEIecfZw1Kox//gFoUIYYteyXXnmBmluXA2MLzXEEMy5Duk7T/upAAfO1wWw5qk0OI4Q==
Received: from CY8P220CA0036.NAMP220.PROD.OUTLOOK.COM (2603:10b6:930:47::8) by
 MN2PR10MB4173.namprd10.prod.outlook.com (2603:10b6:208:1d1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Wed, 29 Apr
 2026 19:46:03 +0000
Received: from CH2PEPF0000013E.namprd02.prod.outlook.com
 (2603:10b6:930:47:cafe::9a) by CY8P220CA0036.outlook.office365.com
 (2603:10b6:930:47::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 19:46:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF0000013E.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 19:46:02 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 14:45:30 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 14:45:30 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 14:45:30 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TJjUkt1475560;
	Wed, 29 Apr 2026 14:45:30 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 107BA9ACF4; Wed, 29 Apr 2026 14:45:30 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202604291207
Date: Wed, 29 Apr 2026 14:45:30 -0500
Message-ID: <20260429194530.3369027-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260429194047.1126134-1-lcpdbld@list.ti.com>
References: <20260429194047.1126134-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013E:EE_|MN2PR10MB4173:EE_
X-MS-Office365-Filtering-Correlation-Id: d17cca6a-7415-4714-8a69-08dea627f1c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	lFrNwqRM+1oFiJNWNXE5MgEpjOkmNWklhI040RhoQkGMk0VDDUS21MnNtCDs6C183AD0KkZTyoRZMMvfQjTE4bJUpzuW9ULzV4BLEEpt00tqdpAVz398FrCpo8yDTW8CN3pcvBBuZgv7eJ1FVKu9HMtwYIcLZcPa0HVAlTvkgYhJLBzwqChVvkFhWbphC3fWZG6Sy0dgczV7QchIQKURGWROaGIvP52W2MMm4PIord1ionezg1fO/54LiOI2xXCHQou3pogmTjtlkg69oEJCcu68ZdXisvHp8U0XQzWp6Qo3gskLBSbbhBtA/MizqH0koJVwJOu9nO7BauCkLIkPt0pRV9B0UV5tlm2WSB2m2K1EVKKLyBbrKNEIhId2o8AbI4tRmoaErUcmZoH/+UBK/xdo6FTjoUPBsC4XuoNu0jKESBrZbIVJTg+5GF9Tp0mkuBO8iLvXsdEc/5iy5HhPTwuPN9w3FpGDlkAji6NfMzHxbMxIAW7dsDjYApLFz9POO1wmOJBTnehzhwgDeFCRSxB7lCtWEgMB6dZDX7+1Lu98Gv4chPgndUmSAqkLTk8khVArEwbnOkatXa65mYtg+PU1UW5OOKDgIQltq1rDHMbN/t65cyeXl2LJ7spTWo+UAjP33SmhDv9gKiPFitil9+7uK6JJ0gyi1KsxRX1VpObkIhxGnRiMDetFmGSzIxaXtPMtxzYEiHljds7ZMRGWS06NP8XS+cQYXEQ0IwEpBdc=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	w/7WHKWyd5ykwWgf9qREZeUZ8okMxY3ysvWc6SoXExpIdrPNnBMo2kJNX7+3WSZQwe3Wkbeb/z3vjyyLYEVvl/xbZDqxWv1gb+gz1mOsvjWToNlklfh+KSQ//wU+Rm4xkB3Gz68XsLJw65E4cXxgNft8bCT19o94LSzm6HFWHrIJM7vvr6BqcGBIoAfqV8pGPvwk9mk4KTSlHmryOkeOiboTQ9mK3m7cKMmhAU4u5riliE/2bAJgHc7IAun2jsy1FBh6eCKd0BlMPBSmwK22pZ7pIoSKPd+R7fp7GDFylDLJMqEoKQDXmNkVyKrW2TyG6/yO4hU+q1KadzoVrjt4nwi9SN+60qr8s4ImSJDJXuXsDX+IM8xAHykMZcUM1Myc6B/Jm64177N7kdUxmYxqSZvzFNuLAluuHVYStMgVHCA4YGaOpBokUkPjpB856cEM
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 19:46:02.2105
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d17cca6a-7415-4714-8a69-08dea627f1c0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000013E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4173
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Apr 2026 19:46:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19919

meta-ti / na / 20260429194047.1126134-1-lcpdbld

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
604291207
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Wed, 29 Apr 2026 14:40:47 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: ad23dd86b8bc59d8c30890b5b026ccd79=
2cd4fc9

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: d0182336cb69ca7a76da2f138a7c33737f036853

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
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-include-mk-Fix-i=
nstalling-subdirs.patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




