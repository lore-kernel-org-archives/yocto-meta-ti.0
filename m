Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0BAC10A3D96
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 15:06:33 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49753.1774537586982658392
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Mar 2026 08:06:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Fl8VM3qb;
 spf=pass (domain: list.ti.com, ip: 40.93.194.46, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J3lZoCO0tr2iqyiPt9vvADuUB66cNnDmelFXU0oXDYNtPdT0z8oj0sTCkWIrPaqcH4xfyA/DH2BFYdLKbFgxtGjL/mxr4I+AdZTVx8cC04N0IJV7K1sx72DmZWOonr28c3MUp3oPultfDBoY4UjjZnjwO3oKEbkBS90BArzK3CWWAtdXjZupQlPGJjV/HergkWJJdpuJAyh3Oh8+T6qA4lYCq18HwK8kAReMs6nWD4wchcOLQNfBw8a6BIZLd/QL9VkfeRPOkVzMLp60kpVSsJmeb0y/rUqMwTH/m9i2w9E5/JD0CK4m6cnzXpT/7Tz24oSep9mx5NOd4DnLAJ7sPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oOTjZ0h96aCXnL60rZ50I4PipbMldkikLixRRpK3j6c=;
 b=qQevp+3FNCyTkwRHqBz+ZzbJ1vDoT33GTB/qDGsa6eX6EaO/v0OZjR4rtvpwPmwjB3FAVy07NZwoOPt8aX4kM8mJob5b9JjrvIKkHss7qL5Kn7KxABjMtvB2Q2p9amaW/DVC7r2CTktkFkpnwtN9Et5vthwyIA2/eHnW+1ZaFPzy7nYut7Gc5l3wSYylRpTGCOk5xYFSViURuXhT7b9lHPKNXie5iWXZsnVS3BVLYhJ0edrs+/g30krndvBpa8EZ0uyenbof33z22axPPTT/10UnkktWKHNyVDOMHFZ+uMIBL+iW9n7n6T1lyVoWKpCl9DAbiIcASatxQEBskly/mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oOTjZ0h96aCXnL60rZ50I4PipbMldkikLixRRpK3j6c=;
 b=Fl8VM3qbBUd/b3ICwgxj2oiNMP3Jz1a0nswlfaq19CKcF/RF9qcp9zFRrzWUKlVNwli7j5zu030hT+VzwVLeNzpUCM2zJNhgYjQDm8nOiVlqNh9PKOl/ZIbns+bmnHAMyD3WdW8MNFjEW9C/cDzBbI7FAM0LYPCwo1Bj37vSmQ5KdBR2e8/6A+unNz+DO/gFrT7jTuQWHWPjFyo2qijAc9ZKxaMOhJ9HvpL45BrV/ho09dEX4TfT51k6UW0mvOKeMWHA4P1YxdZjKv5v2iELDws+Mjcq14IBrv33D5GLftQyScRVL7YPBV0exluCh3vpOOC9hamSYL8QTmq0pIa2YQ==
Received: from SA9PR13CA0110.namprd13.prod.outlook.com (2603:10b6:806:24::25)
 by SJ0PR10MB5890.namprd10.prod.outlook.com (2603:10b6:a03:3ef::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Thu, 26 Mar
 2026 15:06:23 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:806:24:cafe::10) by SA9PR13CA0110.outlook.office365.com
 (2603:10b6:806:24::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21 via Frontend Transport; Thu,
 26 Mar 2026 15:06:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Thu, 26 Mar 2026 15:06:22 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 10:06:20 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 10:06:20 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Mar 2026 10:06:20 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62QF6K7h3704989;
	Thu, 26 Mar 2026 10:06:20 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id F3849142E1F; Thu, 26 Mar 2026 10:06:19 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Anshul Dalal <anshuld@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <vigneshr@ti.com>,
	<denys@konsulko.com>, <reatmon@ti.com>
Subject: Re: [meta-ti][master][PATCH v2] conf: machine: am62lxx-evm: fix fitImage address for 128MiB
Date: Thu, 26 Mar 2026 10:06:19 -0500
Message-ID: <20260326150619.272615-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260326150324.3689647-1-anshuld@ti.com>
References: <20260326150324.3689647-1-anshuld@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|SJ0PR10MB5890:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f8b85b8-c4e0-49f8-7051-08de8b493e46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|13003099007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	B24s7nNVkCOiGTn97SLKlql1wcpEa4KqFQVJSNK3FrLGA1HjLvcRZ4s/BJFC1W/1vjFvRqpsROs5EnEUeod7KZkaTqr8ZSCnSaj4N7N2nprcnliJxYNwTe/Obk8bb/z7uYK1c1bUTZpLvEe3zUSSzItqBaUxtYVpWkTx9Z06JK5ZA5Y54h7eh7APm6Ab26Ij/zQameL8lF6aErS5XM2aEeCBIDZKS0thyBkvD/ZtVzexcFVQ53IWpklTsbtaKJcvx9iSsu4QRJSl+gFJMy/atcONjYrRm1ARiPMobffg/N9CM5t7QNXh1DEaFy6DGvMSqzwKRZClzPBa9MY7QDlj7DcH0jv+Y96XMwwtY5oHffpAvqQD1Y6xLZSsUJY6hipJNqOHBJjD3dgAia2cRKsQJlfrjjlIYDSJGHEsy+C5nPpmvPW0+cZyddD19j4WZ3rOGGUNSblvi+4aET9AZe3/xg0fdSEhL1ZZrirM28gUHPM6U78KJHanIxQm4ctiILmW+MPfKewbjfCqDoVpuXhi0jr2gZL8oQkrzoMGe/g/hyIt2m4vH7v07ApsWxsbHHgkCjnM78vxr+Bx8at3MvVij27Fl8DLJ1DPMazyPf0tVbvYSfo8uwT7HHAeIGllUt2U/rGT6gqtOEiuU0WIlOIYvNzyI+K/urgiYBizxA4tGbNy/4nRKzg+wZN0CVOWlbBUAS1JsGxQBEjNF6oa3ZLG5fTMCYniC7TW4gKWXXTRwj+LI4Bl4XFHhI2rdDgs/MUpB84/OgotS3P2dRDampOyDA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(13003099007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	hpRkhCuM/3ntnv70izGRGl6NwyskU11sIP5INXSFuGX56i+kHIUuTnzj+Fsch36AvbdyjRYg1F06xe2EIWJHhj0qnjmKEBvUmOCHTN+zzUFYSkUw5LwEd0lkiMHkWBYGsIe3m0VjbTpMg/lu88iaFiAzNtPFk46xF/jUbfQ3+sFUjo5sBWl6TWscNySVglSYVxTVgkmX0wwIGMgxDRX1IVVrsudonlfVYvFzAOw+pEmi5hcE6dTKrfKlzgp3wCAYr8wntSAUwWG5XbZQE1saXsZTau9cFqsLUBJLustXqMVWKITjC2pNuAfpWBklMNC+35UveTgdk/xK24yMcy0SMYkx/lmk/hILXIauoA3BVnvWw7uLJHdLm+XgMxUIJhInt9P7kEK3I/pIo42+g5J5sS+VO7WIWmQ/kbNZ9JckFGfm11yQljypHfAjIzJRofMW
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 15:06:22.6169
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f8b85b8-c4e0-49f8-7051-08de8b493e46
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5890
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Mar 2026 15:06:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19828

meta-ti / na / 20260326150324.3689647-1-anshuld

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
WARN - [meta-ti][master][PATCH v2] conf: machine: am62lxx-evm: fix fitImage=
 address for 128MiB
    WARN: Commit message should not include directory path to recipe: conf:=
 machine: am62lxx-evm: fix fitImage address for 128MiB.
              machine
              conf (COMMIT-MESSAGE-3)
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
- Patch Series: [meta-ti][master][PATCH v2] conf: machine: am62lxx-evm: fix=
 fitImage address for 128MiB
- Submitter: From: Anshul Dalal <anshuld@ti.com>
- Date: Date: Thu, 26 Mar 2026 20:33:22 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 0cec12bcfa8ab05fb756ebe35c9cd3690=
10f848b

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: 361f0c1251514c964c412af69b28d6061119ba56

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
        meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/ti-core-i=
nitramfs.bbappend
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




