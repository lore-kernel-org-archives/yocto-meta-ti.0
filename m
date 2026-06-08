Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C93F9CD8C8E
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 08:28:20 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49812.1780907292792575353
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 08 Jun 2026 01:28:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=nEyPZ8BY;
 spf=pass (domain: list.ti.com, ip: 40.93.195.21, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HUEH6sABFnV79kYqIZUCi4fz0MTcz/1Q6FmKtx6f0rZ6D1eqI6rmnbFRXoY/c2SLWIu70PJCVRAgHzkd3dTrhWXOCpouzZGTp8rq+YUO+fsv1V5D6/VPwz+rwHQP8lC/NLUET1ZxR9bHNW2IF4Q1B67ilJ3KVhc9exQLsndCSPOAZfnT8odfw8FwA+d0iUdF9w0394RjtoGkiDjbeXyWDjO8vxZdAvu7oMAaNlG+sfVNaIoIs5tvfwleplNHJ6Br/Z3kZ6nKMyM9hXcj+99yaVQVBmjVuJQVKHqUkf0fUCwCVVELJNOsFL1mnrCIMFlxudgHb7Nwt6WoEd/jOaMy4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=agSsc+eoj1awZ5QpoEjtH8EBt3mI9rouN9l2oxs0wsI=;
 b=X8ha2K4wRCbjXi0BbxID46ZsEG81Qt63uzCfiCulDQJHFF1YCU2LynbkVDoiHLx5R16sG0eyRzhdeVoSTHSUXWh9L95eqVx1xn72Ms8vhcZLXI34Jz1wWudUQJyJ+lBKGtwHOukUe+4YXcLlpQ1Aq3AmoaxkUpClOUSqLvxfu1JJrL6qBiT8yXuG3mcBzgW0+kh0gpKKHzoee0CO57NJ86LLPYX/L9J1vOIfO2nZQ+DCjo8odam6oKaJTFyuOuSvJ3aGhj1+Sz7E4JuMu3TL9GYlGTws8p3ydby8MrpDUNPtWlSQhgZeY1LjAj+8F6HZ+BVGdaQe9MoohI8zqBpnig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=agSsc+eoj1awZ5QpoEjtH8EBt3mI9rouN9l2oxs0wsI=;
 b=nEyPZ8BYjT9DaEA2j6tqd4Vt6SWmlZpYhD2rInW+29lNbsge+OGR71ZbMsdrdaH3DSfNOUW2VLoNlUYuqXEZNLoA1XlImY7SIcfJRvThQxaiif8NJPh+yQ5fx1FPniSTOV21x9ZYAtSVV8Qvb7QO07kxAdEP5dTVetDlo9Xt9yYh6TFYpGynsgr0/xuW8dOam+m+7UmzL/asg1fzlcOw0Px2J7unpUQptoYBv9s4eIW6kM8svWaXPuWr8WiZaTU2YhXmccL8fKdESgpNHqaZO0c95oydONG7na0WqzggyIGypehKi7PI0MuENovgHJyYKCKotH9EwpnCa3a1xEfS3Q==
Received: from CH2PR11CA0017.namprd11.prod.outlook.com (2603:10b6:610:54::27)
 by DM3PR10MB7910.namprd10.prod.outlook.com (2603:10b6:0:b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.13; Mon, 8 Jun 2026 08:28:09 +0000
Received: from CH1PEPF0000AD78.namprd04.prod.outlook.com
 (2603:10b6:610:54:cafe::3b) by CH2PR11CA0017.outlook.office365.com
 (2603:10b6:610:54::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.13 via Frontend Transport; Mon, 8
 Jun 2026 08:28:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000AD78.mail.protection.outlook.com (10.167.244.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Mon, 8 Jun 2026 08:28:08 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 8 Jun
 2026 03:28:08 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 8 Jun
 2026 03:28:08 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 8 Jun 2026 03:28:08 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6588S8DJ3891773;
	Mon, 8 Jun 2026 03:28:08 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id F334C13F52A; Mon,  8 Jun 2026 03:28:07 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Moteen Shah <m-shah@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <nm@ti.com>,
	<u-kumar1@ti.com>, <s-vadapalli@ti.com>, <a-limaye@ti.com>,
	<gehariprasath@ti.com>, <denys@konsulko.com>, <jcormier@criticallink.com>
Subject: Re: [meta-ti][master/wrynose][PATCH v4] initramfs: Add initramfs-module-netsetup recipe for NFS boot
Date: Mon, 8 Jun 2026 03:28:07 -0500
Message-ID: <20260608082807.630396-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260608080906.2266315-1-m-shah@ti.com>
References: <20260608080906.2266315-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD78:EE_|DM3PR10MB7910:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c444807-4fc7-4db2-9088-08dec537df24
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	vXqAPFfTGpvvc4kDle3d6JtlKsvJ9AmV4YbjCMOkJMf1GmVETBr+tPoBMhJUV36d1HOMq+F7+zs+mzAv8hcOhbe2t8MHWBcLAKVMsydF5HxtWfHBiKTsrk8bTndlGymuTS1bVfBjs3oriaSniLMDxRlcn62MTIqhrCp3Z3iJAFFtFNI+1awsrTPsXtqh6e5F6n7u1rGiccDcPN3h8FyRF76AmcZ9Wj4dAIyT/fPtbVzoG2BxRWSLfiDdk22HNmvCdLcRzrvOScobIJ5KkCX0G7LLhK2y0H+vYKltD0W7/vVO0Kc9RTu4uPMV2ALaoLek8ZUkjS5lQ9Ij8FM85Z5yerpmjNoPJXGtjt2/z9Np6JL+CStuQkZnvscPPk8KeE4VnBAtiF3ObSt6xm+oC/yDnik+x81EtQQKSKIjRzEe3BK/Wt30CnU6yQcwsItCVUaOEdsXNcmGNMjjPIh3B2ELV7lOIENyNDKBVLSfh2G8X14uUsNwCSWtg+c8Lweo/v5TsgKX7xz2qpgJO/kfuWuLaEdS3kbs2WMHkd1l5Y6XQ4VO9ljZo6rfnl1sMmOaq5VKr90NxJdzPZcvss5bYzgix0lD7y+La2t1Xc/wr3SYGHX8KUvQODPwyYoEuavPlgHGgPrS/5Th/HR+XpKatbVcGpZB35XWhAuBWFZDoeJL74CYtzEz5nijr2XohapDziBHde+YsWUEM5RwdbS2NS6G9VGvne9ZYcANp1fz+EfEI7o=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	qFdcn8MkqkiZaRdciuPBkTWgGnaN5narlO8nESK0HLLy74pYDxF2Lzh5OXLDBtrhEWCgd2M4pFASJ918TiClNgVmDumA6gGEwkaQxFJKh+doX5Id1P93cC256FCVJXViVY/dpvbl2Ay04emZVTT1l0EGFodKOG492fHh6lfhkP3qvogo7QbJp00vtcnXPX2o+abhPBv1WjehgXMLL8RDqcMvLImVuU4zVU5HKJ651TvObcykv/SiJVLpAl1McNtjI98ZjwyXe+GjrTWgvxh80Y5ch4gr4JXThE2g66ZzXBP9k9z1A9IdHkFJyU6tTYhhuDkNTvRPN1qksHVSITdTprcU/GYNHnDacj2wCeP0JqU2/pKeP1GrF1triP2XY3MeN6SPyVw5b3mGIx2YB4xzeu111Z1F9ghp3K4BJbKGdxxrGL6LBuGURrbRU4Cj9k1B
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 08:28:08.9874
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c444807-4fc7-4db2-9088-08dec537df24
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD78.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7910
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 08 Jun 2026 08:28:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19984

meta-ti / na / 20260608080906.2266315-1-m-shah

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
- Patch Series: [meta-ti][master/wrynose][PATCH v4] initramfs: Add initramf=
s-module-netsetup recipe for NFS boot
- Submitter: From: Moteen Shah <m-shah@ti.com>
- Date: Date: Mon, 8 Jun 2026 13:39:06 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 48a605771b7888daea86d80930c934c7b=
633fb66

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: Denys Dmytriyenko (TI) <denys@konsulko.com>
- Commit Subject: meta-beagle: linux-bb.org: upgrade 6.12.43 -> 6.12.57
- Commit SHA: dd0f9863bd65467d689ec895d96b386a034df660

Patches
----------------------------------------
All patches applied

wrynose
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH v4] initramfs: Add initramf=
s-module-netsetup recipe for NFS boot
- Submitter: From: Moteen Shah <m-shah@ti.com>
- Date: Date: Mon, 8 Jun 2026 13:39:06 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 48a605771b7888daea86d80930c934c7b=
633fb66

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.wrynose.202606071800
- Commit SHA: 80bb053a288775e710e3be959c47f0f9126d8d3e

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




