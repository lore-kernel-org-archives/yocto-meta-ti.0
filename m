Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C948FA0C32
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 05:55:05 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.35])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12550.1776232497083899322
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 14 Apr 2026 22:54:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=ASyyY7s8;
 spf=pass (domain: list.ti.com, ip: 52.101.43.35, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lgF8Y02mLU/JZV62Gmx2N4QolMVUyD5HAstTYijGyEtT4Tk1amFfqqRpPazBbBTd1dU/WQ4so0C1KsDP3oqpF0X31skXYU2CKTX/egHUdgw5r0CR44JaWQn5yl6O8LBfioosu9S9/sYjlUyJxegoRdutvNBuHsgwq6p94UqfPq0VjUUhDn9AFHThjvmVsyK/T3mojBQIq8tZAfZl6OC2pIFkBNt2iwCQ5bnT2qXmnSBi0/VQRcHp/I4NX67Z+tXNYTA+bTDqCyj2umLWAp1i4SvmgtOMV1gE1EAUdnCAjTqcQXaYVG2C7PLB+1Xydbd9ZskvwVdnsFP2E50MtVo6Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZLuDiBH2+YoHNKYugrKGRNVStxljLPFlGffJ+bwssZs=;
 b=sFTR7MrAq4sS8457CpK1p7KzyQEXpQk4P8SlxSy/j7hkllFnRNswz/TEMJVdVN/UkJPwMfeFjuKe1rwqAYMb6yKv5ZMJkdm3FxeeNJGTGAqAH5xNIU49nhlChUNNQKKRoVrzVfd5lpTwxQxF3VsgGD5taDf5Pul3ezACgiqYEZIFclQ5jgGEgv7Fs5ESRNDjnjL0o1gzLmqnNKsu1on4M/L5/VJAr/nDlYV2FvgGvDkI/qvTKTbeGXw6q7a5IrKnAj+/VuaBpDsJrH4XNaRctDqeaRqolLveG1G/d2ygY1qxpjif9GzCMqfHXDFafDbbYIhK2Eh7R4ixeCDWwF2cZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZLuDiBH2+YoHNKYugrKGRNVStxljLPFlGffJ+bwssZs=;
 b=ASyyY7s8bSjOs1nB5TS5tGj6FGuH2YFYf0Z8jk8839V5JuUWS9c12j7kM6erBqo6qxlPfHxUYTwKkbHG+FO4LI5ablZ3GbHd5zluSWkk6fEtHhU6ijuBXTtTnxqidxBDLV1Be9jaUXIfhuH4GMa+1ahmL0QmMWz9dBffX0MFcUGBUzYe2+6JDIfFmn3VZle9IEWxk2M2znI3WZ0qRkED88tOgs8UQKxNvVehdQvtYorFdLjhZS+J2HYp8eI/TYADisWZflTnOcIFXkMGEc4oQpF2tOtcPUWmUSE0AXutQ+eYmK4gDPYX0A7zno4JdjNKKlp/z4LL0ougcA9K5zTRXg==
Received: from BL0PR02CA0027.namprd02.prod.outlook.com (2603:10b6:207:3c::40)
 by SN7PR10MB7031.namprd10.prod.outlook.com (2603:10b6:806:347::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 05:54:55 +0000
Received: from BL02EPF0001A0FE.namprd03.prod.outlook.com
 (2603:10b6:207:3c:cafe::71) by BL0PR02CA0027.outlook.office365.com
 (2603:10b6:207:3c::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.50 via Frontend Transport; Wed,
 15 Apr 2026 05:54:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF0001A0FE.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 15 Apr 2026 05:54:54 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Apr
 2026 00:54:54 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Apr
 2026 00:54:53 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Apr 2026 00:54:53 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63F5sriv1521218;
	Wed, 15 Apr 2026 00:54:53 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id B43D29ACF4; Wed, 15 Apr 2026 00:54:53 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] u-boot-ti-mainline: Update to version: v2026.04
Date: Wed, 15 Apr 2026 00:54:53 -0500
Message-ID: <20260415055453.3521236-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260415054124.2434086-1-lcpdbld@list.ti.com>
References: <20260415054124.2434086-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FE:EE_|SN7PR10MB7031:EE_
X-MS-Office365-Filtering-Correlation-Id: c76482e1-0e79-49c7-79a9-08de9ab3847f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	GE4NDrgTPPnaMdjNcqoz63ssZKq31fzzwLAeXNZNBeVZzHJG8d+/i6HbxsFFmFgL7FQ72AxpS/EDrv5+e6g0I1PdjTPUSLERHPSP3FSq3mlnyKtHSGhVKTTgPcOrrm/ToLrIGkhu+UxtSdkp7mZuPZ1bY7PkVhoeGSmWqpR5MFtKNBXumVaD8VUFLomGedXAFhRvpHBm7hYZapJhIlXOTyCsjlBxCZaiYg3bTINM9wIIJ66f/SPrig+Ry5lw6GiF+MV2eCAPlR4QPKLtXUrnUD3PkPcxGH5o+OHLs6Nwi7NxyykbKOgs/RZRIplkUKV8qnA5urKJfg3+DyMzPRJGMV3SSuGpM7XEtwbwn0X5d1MtRQA8KSfYyWKLA4IKF3Qf2SN09chTUov86lR/RmR0+DXYEFUIqwMuvZW8XirRy6yIH5gRukmUH3wUTgtjva09dj5YZzbLDOtN4KMomTcwo3Pwfq9llAPrkBOaZxx94951VhOW90WT2oLrLLwlCOoLlOY7r13NoqGgmsaCkedcsCFnZVaqIu/EwEsTvg90BgoQ+bbBVyMzzcpEcA24JgJgg6047czuAxKhikAS0knQk9WyAc4xWMVpmnp58x9UctU57UonoAkyVq6J/m+z2HOlBj4XANWiubT407rRJbqo1wm4tIOw1m3a/Auk2IuBlka7OWkfMPUBFmperIrdudsoobBYCFTzPSYBrtSC4ajePuVImciL4a7SHshktgh2IDPb4GGkgx3Zv0ZAY4prASiyljQXZKzDA3zZqr7aOtJeLA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	xtl2lxJDYJ3fLOPBYeJGEiRPicMoAkZp0Wu7Y8gjg1V/pLZjQnbEh0UQzyxGscOxqa/ox+Nm5mxu5PBcEeKyyBTU50xY3xtCX877KsD0xvCnlVj9nmidTuqRBc5GREHBnHAk/kLNdJJFHC77GptnYZ5bl7i4hUM7U2Tp7jdnILDWfeYRECTHAuu15mVLP/bG0pYhvZXQvdAi4hI3OHxQoqmk/c956vmCfoCqPKAsEYghA5iORC4LHJP5EX+PPW32S6QFwh8LIoVRWUbLyYQwN3lESpoWV8f9rz4PvWgxXD1UeoAiycu/BPxBCn5QPrsngXCHmHDvNcjnaLJKRKICb2n0q2qIVlzdO/9AGD5mXQOHEV3ze47+hPUPnC/yXPqaFPqmZZ50oy5/GsWNdUqygqzxIqdBpe8l1tK2S1nT/etOkw+wbRo5pXCZM7VAfRCk
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 05:54:54.4796
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c76482e1-0e79-49c7-79a9-08de9ab3847f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A0FE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7031
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Apr 2026 05:55:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19844

meta-ti / na / 20260415054124.2434086-1-lcpdbld

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
- Patch Series: [meta-ti][master][PATCH] u-boot-ti-mainline: Update to vers=
ion: v2026.04
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Wed, 15 Apr 2026 00:41:24 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 49758309f10f6d5c8ffe5fa4b19de9fb7=
fe7c82f

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: 184758af4e6c34169d229c75fe94e8886ac3d7e5

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




