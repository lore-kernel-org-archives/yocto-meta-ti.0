Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F8C41099B38
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 19:15:57 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20909.1774034156118838207
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 20 Mar 2026 12:15:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=phzprvGR;
 spf=pass (domain: list.ti.com, ip: 40.107.208.30, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UXOuvvADLALtp6NKRvuzvB6X2QmswjAxpeFz7Ys/CSLR+zKbM9C3Fz4PEwl5BlO2goIyKNOg3jS//k8lo3tIDTe40qJJr6i/t1uCgG3kamRwAzoXuNhapDdld65kd/nu87YskiqgebJa34VLWqEcWVpcgvizYymLM8QksdDxm8RbopJzXcGB66faE1R14FoGks4NTmdBzyGCi5mZzf0QF3uYqiubJnyhaKubWG0DveVPnChii3pKIpOsaHO02uh5Q7tVb85IzFyqe96QltRKYTw2Tcb/LC2MP54WijUmzZmFBskxyvHcO4R/pvx3DXnT1RaFqu/FBrOqvaZAzkzcnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hsb3wjgYVScrHupHwjeuGRVVUOPiM5Q83OBDXdup3+E=;
 b=YPlZUwnspnWZ6Dx1E1PH8g6yd+CYK2ydHnfet69MFoM6GvLAUAV7Ej2sdYhGdz85tPVgJS7UdgLL7mRsoZ2WjeeHEIOxmENctVOrhVAMyKb5T8U27KXQ4K9azSY/z8lG/HkWSNSMUDsEtVgEDJXLt+Lxq0Thy14KkkEs7cNr5QQjJ9jRyN2dfkuIppDIGj1UEqHWVRn5EV5SD8aoUqSroubwkUlhpqpR3FWMVCAX7GWVS9pYFtYU5SUFnRKBkPkNpservW+O30NLxOf3sz/sC3XPtueUuU16A0uwJG2R17Zx7EExVGDy7i29OYrjPMw00ncjyHriA1VQkXjob6WaQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hsb3wjgYVScrHupHwjeuGRVVUOPiM5Q83OBDXdup3+E=;
 b=phzprvGRaHDdi9wFLOplYAOgdoqR8GbCNjXDbiZOjVX2oKzrWkJac5YWfVa7jbUiNwMAD8Veap8fWjCWPsQr4CV1wR3hI79Pfo4NC/Jb1AH8kpsjlIJ95KzcwLN8o1SLGL2JoGD/Vz0CjVIEd7Vx64xbRF+Yl2jyY96TmQFE/8MRR8x/64UZSk7vj2BdvTpRXUmgkrhDTWiWoFwRMPYOn5h1SzeykC765q4YZXBk068hDvCxkHmR7o0jgEq0s0zOPnaMRfD9jabFeE16Xu0VCi8xU7dj4fVMBtXJDG0ue01zjtj33uSlNYVmOC/7PSkw695EW5SV4368Vt4/1WLkCQ==
Received: from SJ0PR13CA0191.namprd13.prod.outlook.com (2603:10b6:a03:2c3::16)
 by BN0PR10MB5047.namprd10.prod.outlook.com (2603:10b6:408:12a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Fri, 20 Mar
 2026 19:15:54 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::5d) by SJ0PR13CA0191.outlook.office365.com
 (2603:10b6:a03:2c3::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.23 via Frontend Transport; Fri,
 20 Mar 2026 19:15:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Fri, 20 Mar 2026 19:15:53 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Mar
 2026 14:15:50 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Mar
 2026 14:15:50 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 20 Mar 2026 14:15:50 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62KJFoPK1759302;
	Fri, 20 Mar 2026 14:15:50 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id F1200142E25; Fri, 20 Mar 2026 14:15:49 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] am65xx-evm-k3r5.conf: Fix defconfig for the main build
Date: Fri, 20 Mar 2026 14:15:49 -0500
Message-ID: <20260320191549.1704137-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260320191259.2509582-1-reatmon@ti.com>
References: <20260320191259.2509582-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C5:EE_|BN0PR10MB5047:EE_
X-MS-Office365-Filtering-Correlation-Id: b9d79ccc-e584-4d63-2125-08de86b51b4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	MLY53Mfb+5Cxhs+jYgUmZQZqEv3FCdSapqvGRMbzB9RoJZu+LeZ3dwglUUhkE3v6CF6IHb3kMyp+YqdYFF+dXugNSDqhYPmwtCOzIs0gaz5bGQny89lqq72cdxnkz1pFQTwJmmbdcSKT6SKqFeFU3xQDbvvZ+FCdu62N64Q3n+KRkVTLiREpKrqI8+Bb3MdkQ8LPgdem7xiAqJUoYNjg2fqQrVS7KXEIsINsL5fChPN0/FpfIORqN9ZtEywpDbR9Tplvu51nIV+yWVwweRN89tojyDhUvHnO02I1xC7kdia8lSmUEhP3AHAzzmUu2cec2gTWvjkkh4qZyV0svnYK/mQ++CvGZrVvPytnaJR0wjm/1dXn+qpGvKw4/VzomeWqPLu9m7AQ3qXJ2KignOBvnsE1P95qBhqJdMy0g4nkF9PzXcCETr9hYssHIuTiiLw2ayOLmu8NAFEaC+TKV0gjqFhkdw8U8Z07yQ+skJbQh9+Y4NF8a7mm64XCO0NjBlOXZLqOknHzsSmVLpAaRbVgIxrCbK1Nni+OXA1y/HklQQDjjX+QFeW6LuMQH2+NN/SFlq5V30md1AbujP/Rmq6pY7E3ii2dW7SHE8bdGC2HuiDA1daPrvFVsUFr1gnzSfHRAQjoe8xRQ5CCSXdVm7fOS5IX7fvPEYsaiJzLyJiuEBOqRUlo/GezFi88IGeqJP29J28OM+PH1FYh5n4g6AdPb7iVqqXEu2F6/7bLRYEZuk7fEe06DIXwzmWTCK8Bt63AfVoV8OMD/KoJ/D2NqAEgLw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	XQTcxg5JzvQTV2Q04neojTtcVZhM0NRM6p7hXKSn3zW7yAXvqiGAZCj57LHmti6KHlrT3g9A+VpfyprxP/oN8BkrEMPpEi/UpsJwOI7eggLW79fErCzmyYIHoHP7ggBJJEQJv2PAvdSfTrdjP3WwplCrMK53hR/aHJ6Z9/+yY5XEplMDqmVp2lWDfBqMIQP+TlcXtOwGWnImYkcSjlXuY0SpTFhpAyC3v27K/81C03wmudveLNDWpwDEIK1lbhSK8e/Zmsz29W9px0ssQvb1jdL5CaNdzmlT8GtoVnvki9N0eJO8JpzMezaDlKJzFPK1pI9fU8huLu0gxX8VtCiZsZXQDmNHRJX49vKZY0MW+DMk9QwPzygIusNozJo4/sABOKeDUqhAB5pDRVZ7UObBmFQDEOSHT/PyOOdI4fVAFu73gjGkQmTwtLB9LikPppWg
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 19:15:53.7112
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9d79ccc-e584-4d63-2125-08de86b51b4e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000026C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5047
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 20 Mar 2026 19:15:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19799

meta-ti / na / 20260320191259.2509582-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH] am65xx-evm-k3r5.conf: Fix defconfi=
g for the main build
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Fri, 20 Mar 2026 14:12:59 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 50954dd0b50d5ce7ed03821aa2343b17e=
1325742

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: am65xx-evm-k3r5.conf: Fix defconfig for the main build
- Commit SHA: 4f9268b107d1904120d5b3bf9ce33ca3b476504e

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




