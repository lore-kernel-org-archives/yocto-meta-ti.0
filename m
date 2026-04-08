Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0C4C10F996B
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 18:15:57 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.113050.1775672148832235050
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Apr 2026 11:15:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Wq69k6aG;
 spf=pass (domain: list.ti.com, ip: 40.107.200.22, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XO9I/DCkMQZyXmSOPZFMf5yvB42UEHCEUSWZ2WgJEgu1/R6i2RxoAnhx1FW7IkkyDbnomAEZZYy+cPAZRm2PganLQaH/5pDyI1EHoP1g+J0OK9OdZLWneFF0dmmI0E+YyYQCmK6nUt0LaAz1cbz4wQS8gdtle8WvWN7OmFnv5cQVQvrYOvN2FPwhpZ9XvDBAsyYW47ubeATduxy8+t+EJzQwnaV7m+is/Au4yO2GdAk0jfrjXvW8Jr0Dmktr331fsvghc7qJK8QpzWMPGZ61cNLzt+Eyw0Lc25zld5GEfJAqj5IjAjcv+sLGaFHQRGswar4pEVl+Nm04I9qdw6ZzmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/oD7dRvDkkHHG81ppWrBOZfMWcu+lOXcDIA+p5SVV4o=;
 b=f0EKS5IjK1PiXLncBn9Besql0ZoeoYAf8stn7ofC3i9MHXl7nJY9qiz0l6i9jT5tVArpNOsKr5TJ2bqek2UkTZNHBGBVNbcjKV7YuGR/pt1v/aUJ3xop6E3SsiHM9/v/u5kDq7zJ1hfcbuSVSNtVT8/kJjX/J24UXckQ+twn+lABM/1W5D8rSazb+DTWLgTF3oKXV/a/f2fKXyx8GF7t84oiFNaZ0ADvhGNGypk30sqj3sAOlqYnBfbvqHHsFyimuuOUA+splXTXLRRXcSDbuh8qQ0h+pT88GPhQ/e3soCoIIbVKlyM3HFyjksEs5+5ZsMPyvnXmXjQEVBVEo2JENw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oD7dRvDkkHHG81ppWrBOZfMWcu+lOXcDIA+p5SVV4o=;
 b=Wq69k6aGaQS9sa9yHFwyF3yf23M0fzXN4AajC2hbrpgR4nNl8zVhSXdzfSHRV4JmDqudf4YmgD+NASEyIYVfCSUONKUPV+eAeFhm5kfkQL3JYUlSt7v4lfVzYWEtLyBbrg+bBy5E3/lsPYNdeK4TIkHtY5aeWxy7iyK2uQklBXm2Tq7mGLg2K2hzU8WGvCafuiQeou29JO5YA3OYniP+rry0B8rHj4Og6oAzbunur+zxzCa4YRuJQGnJXJXrdm2Tl+Gs11nJEr0SBVrDKtigrEkWURTSzWGjhGxK1jm+uLWzjnsuJ/jp6jX+QzuUQnlSAVdy3IfmnuOGCaf+/D6ezA==
Received: from DS7P220CA0076.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:259::10) by
 IA1PR10MB7144.namprd10.prod.outlook.com (2603:10b6:208:3f0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 18:15:46 +0000
Received: from CH3PEPF00000017.namprd21.prod.outlook.com
 (2603:10b6:8:259:cafe::46) by DS7P220CA0076.outlook.office365.com
 (2603:10b6:8:259::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Wed,
 8 Apr 2026 18:15:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH3PEPF00000017.mail.protection.outlook.com (10.167.244.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9818.0 via Frontend Transport; Wed, 8 Apr 2026 18:15:45 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 8 Apr
 2026 13:15:36 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 8 Apr
 2026 13:15:36 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 8 Apr 2026 13:15:36 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 638IFad71337732;
	Wed, 8 Apr 2026 13:15:36 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 360939ACF4; Wed,  8 Apr 2026 13:15:36 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: <a-christidis@ti.com>
CC: <reatmon@ti.com>, <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] mesa-pvr: Add patch for gallium fix due to LLVM 22
Date: Wed, 8 Apr 2026 13:15:36 -0500
Message-ID: <20260408181536.2762213-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260408181402.836793-1-a-christidis@ti.com>
References: <20260408181402.836793-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000017:EE_|IA1PR10MB7144:EE_
X-MS-Office365-Filtering-Correlation-Id: 511fae7b-a0c4-4c41-c92f-08de959ada59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	41zj+PW3zHNz6vX0YK2ZEyELL6BPqAVp+lA9dnp91VropI2ey6D3+6itiS3vzJ7rRJZ0M4geynXswDOvSuB8PiQbmDNqUCt1i9fYq7qpuo5LLgCFQ+3fms3jL0FrbIiNS9+j6Z5gEpTEAXOQVdguaomFws5sHroHAMvtoLr8jrMqo/juPU/JPMfmQXtGOaKZ47LHBjLBgksKc8xMSrKO7aNAAUw3ghdA81SwJHTsU8+30s8ZkWGnpvsiJWdowYg6/ZSBXF3GOJI5mKX+9aZoz7Yuy4xrcPObvh7xzGdO91X/cuWxhNPKyUE4vWbeA6nE0/bqivlMzSw8oxYRaajOFZCs2U7SWLd4puLUYalO2q9CHy4nOiP+ypbAPjhOy1sARt4mYNqhxKIqGeGstLZNd9OlJlpfGRgRTshkGKv8agPEuguwPTRqk2NxVmu+i1yAwF/blX1AoWJg6LA25l0Jfs0TD/B9fw55Tkld5NjvmM9qNU9wrK8cndq37hjMgUY2p5eycQdcfchjYtapZx4yQYyEhSitRcp/mehIB7jGo33he/U8FRW/CBXQzhppPwUm/vgNMGVXreVWQOnbTtYo1EYkTgh7JBuLGr9iPLRqbpUFKk8aVS5gDwQ/78AwB1km7n7SLHGHM0yxljzMD717f8KOwpo/u/5PdTvRGe3xGS3Ur33gQTB2hL8vtjO4/7uCh2viXjIe/7BVwzeMIJxluEdOAd//MwHhUZc9C4RtTyI=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	iybka16JM9FptQvfyNx+jrlmyE124q4MisvNHgU4B2XsE8McklrK9eUzBuHDoyn52beYCsfvx/Iiabf/5hmhKZn2YHpiV6wxPCEvau4GugFO9+4DYstS2rnRgfrHjAlaSs/sGEWl4BEPoqjhoQORmveliZanYqxJZUSiRsrvVl0OemUw6QfcNExXy+wVQpB7TjcSDdjw3AD3bAKXXhe7B4PCRh8LVIDdHvdCO6jzkPDX4bmbBQVOCFGwouAtHmviw8NGODFpTqvqBjYgy1tg8s4V7iPzzlGxuaGxduAfEhs2EmKJoPG2U7hL/UCxeR7zmVlNfCU7I2+R7tpoTGNtco2b0uu+oLflA2jJcISqCModYEP2JSxBmFt3z6sgh2vR2U7O3d4TztnGOQoz/zu2T3zCoBstLNhmbe2GQcCbbnleaFFP1VwrUUD/pwxBTIG4
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 18:15:45.3027
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 511fae7b-a0c4-4c41-c92f-08de959ada59
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF00000017.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7144
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Apr 2026 18:15:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19837

meta-ti / na / 20260408181402.836793-1-a-christidis

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
- Patch Series: [meta-ti][master][PATCH] mesa-pvr: Add patch for gallium fi=
x due to LLVM 22
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
+From: Alessandro Astone <ales.astone@gmail.com>
- Date: Date: Wed, 8 Apr 2026 13:14:02 -0500
+Date: Sun, 1 Mar 2026 18:14:09 +0100
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 0e64f20017dea7eff3f248d10f0d253ae=
19fbc47

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: a5b6752fa181248acc46c4411cf76259e4a07e63

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




