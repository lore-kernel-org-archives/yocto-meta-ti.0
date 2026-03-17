Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8999F33813
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 08:30:38 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.36])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71379.1773736234595063295
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 01:30:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=h9HSmmZ3;
 spf=pass (domain: list.ti.com, ip: 40.93.196.36, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wHTxBthJlPC44TrUSBswzLTQKtj0g2w/ceVuf2r9aXtu3AjOdLs2/d+E/ByH/7eob/Tuc8LQUTWGzGG43AlflYrSAemNvo3i69w58gJ6rZ6byZzHtbrNFQ7Z3QKJIC3O1qepZUsEIwHS+ZDrQyDxMkKfQWZXKSmdrCadkgggvxtxmk/ZYQFJKNzXkEdH92s7S0OGBynUyd59Zh2CeaiqTpKmxr90YQml0YxO9NjgKLCpDV4HzMcRngbnUwYIhzi7h/B0mTIpF38ei5US5Bkg3ThqRNd8krGYHJed/7/Su66c5qEtdGeRL1AxeZfhOxGWJHx4uiFxprPVSR+oOykTow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KuTLmPDhxuNFKp7bTYEzQFVkBPIG17G1Sn9juG7CtE8=;
 b=AnTREt3V7Mvl132IOcBZVA4CZCd26u4sqbWE809wsSx/VJ5VLS+d6RRcnEJYUfhkHluCylm2uDL58q2ATJnJCOBBOlKimxncWfHBL6UckZPv692G5zevc2apr6U7pMzC/RG5rwGIo2GpOkGEar4618TVYFqjyrtqh/AXaXGVr70yKkuRHRysBrCSicuAbChCjoVywV6aVd1CY8Y8AHemBIgIRHL+4wUkOJr4E5y+wOYtpu3djEqv68ajEpRMfkfZIhCjFyOeGkRuQFNBQMI4eCdKeGNZgPf9ypSKbF+AJ8Mlg+9zN0ucPyuiSlCYjvM0/097T3dohrJ5dT7AUCItrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KuTLmPDhxuNFKp7bTYEzQFVkBPIG17G1Sn9juG7CtE8=;
 b=h9HSmmZ3ANM0h6T+1RQADOHVbqS8/tVrITgeXM8DlMyrabC4aHANIbE/JYDXgaeCU6UVuEcX3lY/0/HY8wUMHZ+ovKlwGtDOpiKNThHbUAHJ96tpop5H4zGgkhoPON24VPNvX/bE1FQOOPyiV8a7lqkSUKugj16VKwv3RTWoi+dBZvGHI0v+pO6fmdahmckrc9uCZFKG9qSZGSXSJ/9xZlwTEpfinrd56syFezzUfQkXxMvRE2clSZcuifoAlufmUtJknHkQDTeoFfh0Y7/6oEKjqQOG158yANTxIyrdLQ+7kompHdgPPfm8w4gKwoqoBsnRjBsEzRNgG6baeg6+Gw==
Received: from DM6PR08CA0026.namprd08.prod.outlook.com (2603:10b6:5:80::39) by
 IA1PR10MB7216.namprd10.prod.outlook.com (2603:10b6:208:3f0::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19; Tue, 17 Mar 2026 08:30:31 +0000
Received: from CY4PEPF0000EDD2.namprd03.prod.outlook.com
 (2603:10b6:5:80:cafe::5e) by DM6PR08CA0026.outlook.office365.com
 (2603:10b6:5:80::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 08:30:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000EDD2.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 08:30:30 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 03:30:27 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 03:30:27 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 03:30:27 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62H8URcS2463007;
	Tue, 17 Mar 2026 03:30:27 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id B15559ACF4; Tue, 17 Mar 2026 03:30:27 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Leon Anavi <leon.anavi@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-beagle][PATCH] u-boot-bb.org-2025.10+git: Fix PocketBeagle
Date: Tue, 17 Mar 2026 03:30:27 -0500
Message-ID: <20260317083027.3633961-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260317082433.1640889-1-leon.anavi@konsulko.com>
References: <20260317082433.1640889-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD2:EE_|IA1PR10MB7216:EE_
X-MS-Office365-Filtering-Correlation-Id: c4c95c1c-1990-49b8-a950-08de83ff734a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|13003099007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	n8dut+DjM0Qw1fuKzG8qQLv1M8ebZcKrJeDJNNXKSEoNq91aWGO1UciHai+X6DlMFgvs00/RXv309lO/apTjKUkDQAxenaZjwz4Jo96PPwVSPXl9djdl5e+aXSEJ8qt5nlIduw9aFJVqEYkdooMMjeqNSrM2DyKzK8Gva8BS106quTg62BfqnaDiuGaMEHevtpzTEumRcOBpAz5icwu+sY9spr2G8LugvrnINcXnNAvZgCsDU96qfWBTe2tF7juPkuKEJFy1YRCyeqhjD5cP70WxWG8yb7nvk3wBv8IyoGn4C3QuAjPoEAuO86dDVQCZldsxSUtDPOT8+dGHuvcAR67pUA6zA/7rac0ZWZvk48PwT+rBWIupz1/VpabbaneWWUDQKTOpeJLTTJu45EszRVsnKEfPSTgnNQHFIoEiuIDcwwDiClllPPqBAer4gnnS4mCilc4nHpbR634I2c/09bc2/dvLNo9iknpuZTYRwMdhFcBw7AxTn0A82Bwh10SFDG7VWvD+bni+qFDBA12VrzLCB04zk5L38h/Vx2bxe2sTvzZQJi6jfAJVm7UFIlCeJrgeXPD/L6vuthklq2JdjAPjk8MdK9PH6a5SmG3i2xLc7hmjFt5MnzJwE7ja/nq2zJo+7nW2K3c46TKaxlpuA6+BA7ZpkKejPP3v+r/he14c1RVnm1887niWTs9MKjlOmEvKsgD9sUn03hRL9r/Q0FAY1M0T9TkIpFpR/dUF3jGBX4Qxcva5O6H99QRUPJzugmUUhsKxaaKiM0E7PV56uw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(13003099007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	q+n5HMhYbD8lrE+mSIIo9zgOJEHfCOJz6fXt0AXGPUFfsLm/pki7ebLt8TjUQ72et5c97ONxHTNk1/4+nk1P5eOzUcmSNvUS0+2JX7LXd6/SK4VIcpXJfdLSGNbGCefmFg30uNNQyiF5YoQsQRIK1J6GnjaxVOyBm8Hnnq8U0CgCuIN+MKG+QRKWLDfs4vo5sPMVEaiqJ5Ka5kOqScbaYncxPorM0L6nZAhwXoJzyksCAmSmsMjUlprDnFbLkV4/sPMa/Vqz7PB/qtNx+d8ZHmdWpztI4ql4i/McEc0y9sd7VlAXiVM7ABR4tiMLLa9/9/PdNK5nUt1jqjpFtafM+eOV9LZc0KfuhsX0VKYmBWJ2Kg7xoEDfZIjE16ZPlhf/pVBfF+o6kyb0vqseQ0ozerXOnrkrLRjAJTTD0D9A6gDvgv4XDLiCvNtyUFu8sTFV
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 08:30:30.6564
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4c95c1c-1990-49b8-a950-08de83ff734a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EDD2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7216
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Mar 2026 08:30:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19731

meta-ti / na / 20260317082433.1640889-1-leon.anavi

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
WARN - [meta-beagle][PATCH] u-boot-bb.org-2025.10+git: Fix PocketBeagle
    WARN: Missing branches specifier [master/scarthgap/XXXXX]. (META-2)
        patch:55
            Subject: [meta-beagle][PATCH] u-boot-bb.org-2025.10+git: Fix Po=
cketBeagle
   =20
    WARN: Commit message does not include file/recipe name: u-boot-bb.org-2=
025.10+git: Fix PocketBeagle. (COMMIT-MESSAGE-2)
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
- Patch Series: [meta-beagle][PATCH] u-boot-bb.org-2025.10+git: Fix PocketB=
eagle
- Submitter: From: Leon Anavi <leon.anavi@konsulko.com>
+From: Leon Anavi <leon.anavi@konsulko.com>
- Date: Date: Tue, 17 Mar 2026 10:24:33 +0200
+Date: Mon, 16 Mar 2026 18:34:58 +0000
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: a657ca462dd6ad895033da46802891232=
f8e3840

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: 00d3d9ec970580d296870c0886bd6836c3caca0d

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
        meta-beagle/recipes-bsp/u-boot/u-boot-bb.org-2025.10+git/0001-arm-d=
ts-am335x-pocketbeagle-Add-tick-timer.patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




