Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9499A105A583
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 11:04:19 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.14])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18721.1773313457198191176
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Mar 2026 04:04:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=G4PsIDpI;
 spf=pass (domain: list.ti.com, ip: 40.107.200.14, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KrOg8Ic7S2Y3eWle3UhvhqY4/v9K08MbHEQBwu8CMDuk08Pm/kaC5L5EdyBL9go89Hl4hw1LRtssFyJsSvvEJqpvYg/UZfKpR5RxSQJMagsqGaT/y5h1WDB6u09ATekAvdiDmfa6SUj0WePOVaak2NBo9fh/jl/c/1VGj2MtG+liX17ZSiRPrTZEss8ah4BUD/8336moWh9reKdH87ggWGJVqNfyParC7iX56QDmW41RwZEJKrgYAXUtShrDtJ/+LfXSAN/tacwXAvpfFzTn6wXEbrn69q2ogr+hPX64dV/IfgL5TMlc6wFGVnMq+7I43fkOYgQmTbvNc2X/M8sWfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mNKPim0xo88t6ckQb3pQNoCUtZcx6hOyRcAx5jujBnI=;
 b=YPc9wQz3xTT9HbMDlcTuQcGfs+4e8WU6CVld/CrY4qKtzOQrFJisVfIJOrbd+fmO3y3CYuaGIxIWLX6Mx1M4RL5zJEKIou+E92eLJaHl/0VqMlOoumYaH5i8Q8Cp4dMSOyq2I7sZnlKJ5cKxRGd64dGCL0/L0Bg2TG1yqqYV0TI4SFzpnt+jyJQ9RchJHyDApepJcaBpMdPkR5QzzJRTrw5ilHyXbm01ZmxMluzcogW23z2pkMmbciQZmEkL+vdTskGCmVaZWZnhIzdThfnksvV1q4NLnEqqIs2MBz/QMTJcZv0bwaZjyrOfubS/OJFKPiM5lukWUVhDU4Bp+tvaSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mNKPim0xo88t6ckQb3pQNoCUtZcx6hOyRcAx5jujBnI=;
 b=G4PsIDpIDj6XiKrqOtnRLZUg117pIQk3DZaJlfKJ19+hLVxB+sVCccVpalMTVifLnQh/4iFvnRCoJRlyY1LMvA9Q/0tupsL3EDt3D578kh3tDG5YNR8PmP6yOhwZU4/sA0HJ83mqPjrCjHEepKMQl712XVYc9vCTR8RDvQfuJd/2hMmoM2+78FCczQj/Ufaga+N96rTC72jcpWkTkDadrO7Qch7X8UQt9iHUu7h6jWuNAFLfwQcmHWmI0ZQ26B2pchFHxVt1T3tBQ1aKfVNdOcHgkHatmyTvB2CmBE3EGnJq9b0P5Oc3YgUReuUfWj/PDu2qKdCxEG1xVLzwFjql7A==
Received: from SJ0PR03CA0243.namprd03.prod.outlook.com (2603:10b6:a03:3a0::8)
 by SJ0PR10MB5567.namprd10.prod.outlook.com (2603:10b6:a03:3dd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 11:04:13 +0000
Received: from CO1PEPF000066EA.namprd05.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::12) by SJ0PR03CA0243.outlook.office365.com
 (2603:10b6:a03:3a0::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.29 via Frontend Transport; Thu,
 12 Mar 2026 11:04:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000066EA.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 11:04:13 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 06:04:09 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 06:04:09 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Mar 2026 06:04:09 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62CB49182700313;
	Thu, 12 Mar 2026 06:04:09 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 4E33C142E1D; Thu, 12 Mar 2026 06:04:09 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <denis@denix.org>, <reatmon@ti.com>,
	<j-sahu@ti.com>, <v-singh1@ti.com>, <c-shilwant@ti.com>
Subject: Re: [master][PATCH] recipes-ti: ti-librpmsg-dma: Update branch and disable example build
Date: Thu, 12 Mar 2026 06:04:09 -0500
Message-ID: <20260312110409.3623632-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260312105155.270295-1-p-bhagat@ti.com>
References: <20260312105155.270295-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EA:EE_|SJ0PR10MB5567:EE_
X-MS-Office365-Filtering-Correlation-Id: f83b531c-d231-4067-5170-08de80271862
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	donySVUDRdlm8jAr3LMwpOm4+0UbnD3D3R1elwSaiOVEvzECDqG5uzW3utwvQG7p1hH0NMupMyXEfjyJXdC2pIvcd1h2ZkTpiAAo/QC3kiO9AXIvZPPUgwhZ3thJ/u9EWHlnE2xWZEt/Ccpb3+wzEekbbo9rnsBQ4BfUzB+yHcIXTxkIMUGwKQo2w9NqmVLxkNjA6nSrRrf3u1IuPb+ZTBoet+JDSeDsfAaa97YV3Ib7NiMWbb+yMpAEjM0BNshLFRg6+to5eojMbTkNBSyjJaiXm6/KT16hdPQngKPESvbGQanBpDEFRlQvDd2875TJbkYmpMLq9uhXFVwwghcGiuDt06yWCfMTg8+kAsrhJuHFj23n7hSgnfv1YoNUbdb1zTpL/DA6hifg+F/5pANocX3EZaxfzsA4kvXP+9qZFgQk/rBzECQ+CILHBkFVNoTNnWHxrAUOUmIsF+FJRsOHCgQ6rlHe0yApD4bDiATUNtNgvPvAftTeGg918UwhnS2vkIcPWx9MwyjwgiAXWtQWaNgvJBlW7wJ3amHIC2I4G2+vWg/L96xGDSZ3+Ltn/WeXQce2LByZ/IHW6UuVFUgyeiWPce8nBjHRLJ75atF5GmiNl0zeMTye2FbuA0iTNaYj/wVQUw092KxhWlEIa/6JyeAEkKx9isnVEV4BI1/1AXvi2ROWzYuuiyF/dyzWI/kVXAVUF+Op/NVz+UEtJj5NzmLC0/nZPFstpQqk+oK/925gGyY3SQ+gBI4H6QTE7gY3hlrDPHuGai0lUMMtusUW0w==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	fVv8NXzgOkf3/7S1YK6/Y41bhrImSXH0htjTVz/s0oWIjqhnVPEOchzHOzpnBHwP61gDNqaWC091IZ+Qy6KC9skAWnfnchAQXgFwATBAd776iSZ0iVIk8kyu9kQ/t/Lavxc2xKqDUAYLFjeVrWCxejcSVicnmSXN7WAm3ij8qd+adjmxfNQZo7o9oxadlnUKzneLbvd5C7gCq58CMnIkpTVrFdrZg0sUGlI/D5221Y1jAgePeGVCxAu6Sx3HNy2lFlC3csw8CQ7iimZ7nWQHVfvBioQWw89badcVM3lEhYecBL4PX1OEKBXa0hi2aYhbsNf23IoCOpy1lFxAmQuYiPEjMM3Kn+6a4+Kyc4L0nGSfvKygNw8NjU8KnbriYFlei+YkaKHzz8YD9Tx3ZfVtmwdihNA0tLZXWOrs6Umb0m480QG7xDpfbiw9NWhAzSvu
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 11:04:13.3026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f83b531c-d231-4067-5170-08de80271862
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000066EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5567
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 12 Mar 2026 11:04:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19711

meta-ti / na / 20260312105155.270295-1-p-bhagat

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
WARN - [master][PATCH] recipes-ti: ti-librpmsg-dma: Update branch and disab=
le example build
    WARN: Commit message should not include directory path to recipe: recip=
es-ti: ti-librpmsg-dma: Update branch and disable example build.
              recipes-ti (COMMIT-MESSAGE-3)
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
- Patch Series: [master][PATCH] recipes-ti: ti-librpmsg-dma: Update branch =
and disable example build
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
- Date: Date: Thu, 12 Mar 2026 16:21:55 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 8c4876f07624585fef1d35962c4d3d9b2=
69e5b54

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: 2976bdb6413a80438ce1fe7d4056105f6385f019

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




