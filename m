Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE5DCD6E57
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 00:49:13 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (BN8PR05CU002.outbound.protection.outlook.com [52.101.57.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10024.1780447749695731606
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 02 Jun 2026 17:49:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=fJGLvuYV;
 spf=pass (domain: list.ti.com, ip: 52.101.57.28, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VsLAFAWn2ztcUlrtUA04vG0rb2+KoZ0ndo/YjVLqyzk6aejmOoz9VQ3zOacahk8vxVi+Nu38TS9PBUaaZnDUPOdJ/IRYDF24M3OittxnYhzIjSTixCryC8W4LdRvghzjkSpWPsI/f4yN+eCdrjyqULRCMOtXtCdeKW7oQq1kI5fYZTlx0SAUdA34W6Li2BuzAPTf/sZRkyiYYJ3AFQWBLgkz92cLfvOuDeBRfKbqk1/jnNBdqJniWjYqaKSEDwB+FWwQ18gKgFSWHPmjemm9hGacmV4z3WLKoe0Uh63MZj7KVrE10KtTcHNobb11Y5LQq7/XoxAKHLct8RzDJ1MMEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t8ia9O6tT6mgbazyQDZFX+MzK42N0q9oiyL+zMsu19M=;
 b=sU9e/7viPmHI02o62DTPv9ZiO9WqHfpSYX0yPZNYkFswCZyz5Y/T75wf2RyNRbQIrYtz3rujD9Wx/lmersWtjTB8RWZkTeTJYlz9xbbOQetq0w80FuoY3d7250htYPJmMepUmYhSLhP1qavNr8AE0dQZLmIDG/ipU7aYmVMZ9f4aJzwuXQTo3uPMiGQAPVolgzYZ3HrT8FghyP4qKMfxvlq1LsGB7dle2M3ODSo1Z2UegsFl1gZQqBI/yGjCdkG2VJeco59Y9xOX9ZP4//VdmfdILmq5CHItCuUSXYuPAMde2FPipRGPol0AK4SF+F+5tKbq6jjQ8PxLWlG25eEb/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t8ia9O6tT6mgbazyQDZFX+MzK42N0q9oiyL+zMsu19M=;
 b=fJGLvuYVwxFlKXb/o+LKh9YqMW8gfd2xyXbG9UWFNCuH0nmUK5kqqjlekEzNe7t7m0CeCwl+8Pq8iC9UsfhGefobmQxpS7pkROx6jgRC5HthdBr38hFGNIi8/r3zflIY8KATySh75fRVlnDmPj8Vgmm9V892f1MDpjnMJI5Bh8wI5TDy4Mm3WJyJgcjNG0s8qOglMW7jVTQcMT9r3C4FnQzPWw95DGQoO96XNaDcxqv6dnWw4Blw8DokmD5a3L8RUXiiNjOk9uFAxcLbBXJvxGD+EiYrWtJPFi512lLdyMvbaLu+q+wTggaZb/mvv/zP2YBqNGxMAufhdtUDSh0KjQ==
Received: from CH0PR03CA0380.namprd03.prod.outlook.com (2603:10b6:610:119::8)
 by DS4PPFD91C619EF.namprd10.prod.outlook.com (2603:10b6:f:fc00::d4e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 00:49:07 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:119:cafe::6a) by CH0PR03CA0380.outlook.office365.com
 (2603:10b6:610:119::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 00:49:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Wed, 3 Jun 2026 00:49:05 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 2 Jun
 2026 19:48:56 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 2 Jun
 2026 19:48:56 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 2 Jun 2026 19:48:56 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6530musE353607;
	Tue, 2 Jun 2026 19:48:56 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 3EC8E9ACF4; Tue,  2 Jun 2026 19:48:56 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, "Denys Dmytriyenko (TI)"
	<denys@konsulko.com>
Subject: Re: [master/wrynose/scarthgap][PATCH] meta-beagle: linux-bb.org: upgrade 6.12.43 -> 6.12.57
Date: Tue, 2 Jun 2026 19:48:56 -0500
Message-ID: <20260603004856.1298710-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260603002844.2413801-1-denis@denix.org>
References: <20260603002844.2413801-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|DS4PPFD91C619EF:EE_
X-MS-Office365-Filtering-Correlation-Id: 72e2ef6d-07b0-4e37-9f60-08dec109ea1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	NMRYVbDAQA+XgCwMfyRLRNYtMIsqj3vFY1zJ7e/CjjwWYWm3yvRIw0JMV0cJdN724jwEcOGFIy5Ee+ULhIZrVU3Kfj4sYmmh9OrNSWV/bF/GA5g5cV90Hc8MgILsIa/s8uLDJ+g4hgl00cNrcmS/3HcMEl5NbYCzfXgi1rTiXjs/gWi6CKbbFeXQvYV5ztwzBF7kIiwIFtM74F2KyZj9wuOr0FbMN4BMa+Vd/Lxawhi/bmkp6y0gCF33LA0STI8BlxsxFv1+SlA2/+Dv06wwNct7vU09MkNDfK2RdYJE2V4Y3e4V3byku/G/vOnjti5AyS/8aNDExeGwCN+xvs4BAOBAXTa4GTnAZtvJrog2iowyBj9bAMd7iYeqmEI2joGGy773LAIfFgTsDkXoXCVMnAQSg1nMcZPSHthjNUb7SzN6dKaKJfmKjLmGepM2PKNfG0OrdAdxum5vVeq98LHr9Equr8z/hNi4KUT2yBe0sw9flrNbLZs44GUoWlzvalV1WREu8CqzhGVFBKkXQNPcKjD2Tbbk3tSH2Pt/zipMROj5+J8QY207gG29unBhClR7NAmf5nrRpXy+DVwZEbRUru1uyaFaZqFGCGNexypWmnLjrNn4VKdqdeMAqQGXAkrmFDiyyA52XGY2hVSB3vUXk4yQ6oxpq11LJSWuWpRlMBLjNYuDCB8uw4q8185kYR8PMzKNiBJ/TdzAqlcM+fjAsgzJ41DNEvBkbPZnmFrNAjo=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	+T21PYD+RNcp7WbkGtnxwn1okjnamGMCJ7uq9gUotPBL3hl3OXjcPPMg9cX0ClFxAWWM5yGlslQjX8qjLEPSxgdMYfDngXUR8NFC9yqOtwNWzvXXF+K7efS0V2r0Mv8OGApWj/XcotjldYSxHSYwMlW3FWPqQifGBRLzZCpsZkyG1g3QP0AcltoDC+NvYzg6mIE/I0LlUFcFfe5F/PNV/jiiKlUcxxCykTiHyNQUO3rBFXFjXw58a1fLP8bEyLExDPZM7XkSmiFBJPeoU1JARWSXJfOycYn6jCOYOb1lAML/GJDlPcSrM4pA820tUBkIHJMgIC3VfekH0l1EoX8viop0yDjlDtFob4QPNwN0Ioqplb7D+L5jcbuda6DUO3VXaYT2p2o7CsSQzdhkIqBlDGz7lJrMux5I1fGZFZgMU/twULfvKwOGNhAl3djZ6siw
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 00:49:05.8999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e2ef6d-07b0-4e37-9f60-08dec109ea1f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFD91C619EF
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 03 Jun 2026 00:49:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19955

meta-ti / na / 20260603002844.2413801-1-denis

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
WARN - [master/wrynose/scarthgap][PATCH] meta-beagle: linux-bb.org: upgrade=
 6.12.43 -> 6.12.57
    WARN: Commit message should not include directory path to recipe: meta-=
beagle: linux-bb.org: upgrade 6.12.43 -> 6.12.57.
              meta-beagle (COMMIT-MESSAGE-3)
        patch
   =20
    WARN: Missing Signed-off-by by sender in commit message. (SIGNED-OFF-BY=
-2)
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
- Patch Series: [master/wrynose/scarthgap][PATCH] meta-beagle: linux-bb.org=
: upgrade 6.12.43 -> 6.12.57
- Submitter: From: Denys Dmytriyenko <denis@denix.org>
From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
- Date: Date: Tue,  2 Jun 2026 20:28:44 -0400
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 47c5f035d274bcb750251f0f1e299cb9c=
5178c57

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: weston: fix assert firing when subsurfaces have no views
- Commit SHA: 1fb5f1718d4673b2a9c794f83e9e5e4769c39d23

Patches
----------------------------------------
All patches applied

wrynose
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [master/wrynose/scarthgap][PATCH] meta-beagle: linux-bb.org=
: upgrade 6.12.43 -> 6.12.57
- Submitter: From: Denys Dmytriyenko <denis@denix.org>
From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
- Date: Date: Tue,  2 Jun 2026 20:28:44 -0400
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 47c5f035d274bcb750251f0f1e299cb9c=
5178c57

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: weston: fix assert firing when subsurfaces have no views
- Commit SHA: ae9f90cf0baf823a20d10b5e4e3c6af465dabe98

Patches
----------------------------------------
All patches applied

scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [master/wrynose/scarthgap][PATCH] meta-beagle: linux-bb.org=
: upgrade 6.12.43 -> 6.12.57
- Submitter: From: Denys Dmytriyenko <denis@denix.org>
From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
- Date: Date: Tue,  2 Jun 2026 20:28:44 -0400
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 47c5f035d274bcb750251f0f1e299cb9c=
5178c57

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202604020811
- Commit SHA: edac88403004bb712bf1711ce83750dc26c7fee3

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

wrynose
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS

scarthgap
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

wrynose - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed

scarthgap - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




