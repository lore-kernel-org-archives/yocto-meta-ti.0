Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07562106F30A
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 09:01:21 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.16])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43834.1774515677971812730
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Mar 2026 02:01:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=kLZ8Uj2l;
 spf=pass (domain: list.ti.com, ip: 40.93.194.16, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cg61piwPkuCgtaPDVYs9U0m+S2a9DS2k9E2BVWfE4swlG1Z2qXMVYVOZXCDlJtYQojBfGKmm2Hf1YXejJQJrEs6d2rQpZtIsFRaqN6XW/Ifft+XdpTWWotN3L12ydCxGyxs5Y7X+8ZMU7HtkMm/2nS/Y8rx64D31faAAsQgdvmpUXmcL5HqrwHvKRqx/tEBjm8IKO8Qc3XILB8xT/WliMXdHTIVftCxHRJ6wpX5TnoH+c8RykWx7n+KWb07w4ftaH8SEPbqJ0qYgwAvcQitKQv73sAHibjndJORMoFbHvQWexWN3h1x9/k1SfNTmK0jSpWwb0o4YCNK+IKkXE35nBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oEI29A+5pFVhw4WLgnNs35YdqOVonT86icLg+O2J0jY=;
 b=mE/FvvR2uzmr1h6LzP/ZZcgWxDHQETBaLzdkW8WT64IeAR3vrE5B2bHttS/WofvtbKX6XT9kb0gatrAYV3jfP/7LibBL9if1+HhoyBomKaryvwxe2mVPfGYCV/7R7O5ERF6uzTdrvVHNXFsyt65O+eXtJS2m9Zdd0/P9ZqFC2TkGtl/Ier42A1VRQuZSxoLThnENqNB+J7+GqpScXALrZA4SJIVzjuz6eE/FtQYF0toZtAqGQrrtxYbTNaIULiConqNS+76wdYQNjfvjZRD+/7KcgUmpwSTWl6a6aU/N512YAJWIbMyMgBHiogHepGJKRmixj6kUufQViq+Iv2I/Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oEI29A+5pFVhw4WLgnNs35YdqOVonT86icLg+O2J0jY=;
 b=kLZ8Uj2lR5qp6SGUIYdKmXgtP6UDO53pwRTb0f2xgKdDz9s+JYfl8499SbdqfB/0KXNdbkhbTd+bV4mrfS/TYV9gw99L0fUJFDSi69nvf4EEvk8EQchY+6u2moyZL9MO+nb65pI4UETpNsI+QVptpN6Km1P61oUvwUekGBUuQ310MAPKwPDxIobgz8XT0HWBMEGjx2PMTSUgQ4WATG/PcqvIzjmjbt+YM4mmxdLOTPjlmRNk/NqIW/qK2aBzqdBQ+hJxlEeXz/JKgEK0Af9PvS+48uukTP9XvoLzibSbnoldVPSwCzEjo7+ZWNukPRvs/96wl0Yzsh37+Fv0tWraBg==
Received: from SA9PR13CA0001.namprd13.prod.outlook.com (2603:10b6:806:21::6)
 by PH8PR10MB6386.namprd10.prod.outlook.com (2603:10b6:510:1c1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 09:01:15 +0000
Received: from SN1PEPF0002BA51.namprd03.prod.outlook.com
 (2603:10b6:806:21:cafe::34) by SA9PR13CA0001.outlook.office365.com
 (2603:10b6:806:21::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.20 via Frontend Transport; Thu,
 26 Mar 2026 09:01:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF0002BA51.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Thu, 26 Mar 2026 09:01:14 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 04:00:49 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 04:00:48 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Mar 2026 04:00:48 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62Q90mQ33598729;
	Thu, 26 Mar 2026 04:00:48 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id B4FFD9ACF4; Thu, 26 Mar 2026 04:00:48 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Shiva Tripathi <s-tripathi1@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <rs@ti.com>,
	<jcormier@criticallink.com>, <praneeth@ti.com>, <kamlesh@ti.com>,
	<vishalm@ti.com>, <k-malarvizhi@ti.com>, <denis@denix.org>,
	<vigneshr@ti.com>, <afd@ti.com>
Subject: Re: [meta-ti][master][PATCH v9 0/3] Add LUKS encryption with fTPM support
Date: Thu, 26 Mar 2026 04:00:48 -0500
Message-ID: <20260326090048.2673180-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260326085623.864201-1-s-tripathi1@ti.com>
References: <20260326085623.864201-1-s-tripathi1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA51:EE_|PH8PR10MB6386:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cb6cca3-127f-4e94-d8dc-08de8b163bc3
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|13003099007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	MYcjvvKAhuAlSUAw3Rh/sjlnAlueTPz4iDT5TtT0M62Kox2B7JzgRLr/CuJoBPvk8fVllcXXRtSjJ/zQQU4FvoMcUYx7mID72Nrspez7NO9yW4hbxSnqR6W8DZhqP9pyOQxQHZn2zv6aX7ElJewMyHiH6ZbKjxAer+IOi+50XOrOzzzvdXggV4Gxk+B4ZHoaaXeDbeKjJ3p6NCHgHb+j8/4NxozZ2LuSHKV6sGph3t6YTJo04QwmTrSiTQykO5v1Os1g1N31WpdO2Qa/IVJUzwG04cEz5/Yt+qWvHhHaIeFNCwVhZeco7XRFXjsaN+jYSGEy0/Ml0d64FoxVHRlCl0QmK3z7+gyc1GnorE+0NjtPAEcQNsM4WIy7LCDibX0cAiCMG9osOGOs4yXmCxGTp4wUwv0jFhW4d01GsPmSRkdVPPDubCpFo5E4htXhARIEzcn/g2rIY47VJwkyVG57X9vwp5Rlfjxt46LJlZmL008i22wRhw1MMfw05iR0JAuTHlbHKvMxWD6TebTYOXyw/P2jht8R7mXL9pYlXNZ/5Xe+bSvSR2nV0HZYj48p2aBSKOhLVZIWrZF9vb6M68ZWQITTenZpirhX6cPgA2DL56odPKkxl0shOQ9zR73EuozIywIr2/f0kqNS7OIZNauIndpc7RbCY+z1oEg2H17RLj1Ku3MjlFT+0bi4Fc9eUCodUom6zeLPvBq/fjvR/L4qWVB7Q1ilxBRZ/7IaaqWiNmgkuPyzdrDEqz0oix6OUBuHPYpy5GehZituSTWCOzeDjg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(13003099007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	m5/4PEbzxU09hUzV6j+zGQgUQz31EKGtiAOUYwN+ZpHeDG7//e6qMHcPE965X/r9amVQjUh4pEPtEw2PkiO4+FxBNdT4pIGNUUWav/n5+wg6ZEPQckOnQ63t4W7EdTiCYJtaadcAHsds85uuLSKwP7q83f0A0oABp2XYi2fb1SZIvGg7IUzJ4clHQRt0GhDmYBdjkKVHyqMWncIO/M45u7aEQ88HB2T8ZB8p0B1dXtkRSUDfcrgucjE/i4M5aArY+2tr7RH/F8PcMv14SxO6bG88spNEbr0saUFl4AdZbV++Kwfxa7NjUw3Y0PyFrghmGUTbSWrP1VVuOnDQAmcztO7Ye8ZiHEHHEcO26n71vhOW9OTyH8Kqznel6HOQghIFobTwXgnnBNr+L6wIYwa1hvNv0Xx9oWSowZ64oLsGm2WbYo0SINfypsRV8kgGcGus
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 09:01:14.1062
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cb6cca3-127f-4e94-d8dc-08de8b163bc3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002BA51.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6386
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Mar 2026 09:01:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19823

meta-ti / na / 20260326085623.864201-1-s-tripathi1

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
WARN - [meta-ti][master][PATCH v9 1/3] linux-ti-staging: Add LUKS encryptio=
n config
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH v9 2/3] initramfs-module-luks-ftpm: Add fTPM=
 support
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH v9 3/3] conf: Enable dynamic tpm-layer suppo=
rt for LUKS
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
- Patch Series: [meta-ti][master][PATCH v9 0/3] Add LUKS encryption with fT=
PM support
- Submitter: From: Shiva Tripathi <s-tripathi1@ti.com>
- Date: Date: Thu, 26 Mar 2026 14:26:20 +0530
- Num Patches: 3
- Mailing List (public inbox) Commit SHA: 4e46c85fdf319c9cac3f51939e403d07d=
4a2b74f

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202603251800
- Commit SHA: 2286b3bf27c822a14b2ee30d388758900a16b5bc

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




