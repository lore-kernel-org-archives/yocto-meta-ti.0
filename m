Return-Path: <y-hegde@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1953EC79FB9
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 05:44:21 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7244.1789019057173280089
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 09 Sep 2026 22:44:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=C0OIBw48;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=qMfZ2T/p;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: y-hegde@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68A5FYda2299988;
	Thu, 10 Sep 2026 00:44:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=FbHF6NiiotcMVDl
	Uoo2PDyqcsDR2VyIAacaQLOQIi0U=; b=C0OIBw483I0s0p1XKGhI1Be85ckHhL9
	xTS36c534aSf7ca/cnRjL4MVe+MGwq6Aan2NbDxNr8JuWET8FlTItWuJuTOwEU2f
	bpyvzeWpBu1s6MC92cqpIsRw1cLDhZixDXJWO9SuCcGWlVPsCyRIjH5DP9RGs+O0
	DWakxugZ3QOK7BzA7u3ukzA3gsOuBVqEshjIGZOTURcIiPx/WWYxvcZawN7Vw5yJ
	6vHe6zNMlaTsfS2tQMiTcbxYOhRtHrsTHaEsqiZZF+vQVjNoDqrhqBWyu8+vNP9x
	p9vZla88o4myw1dlBm5rORlI6Y9FzQO7+t5PEirm9Vq1n7NhvrVOaqA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010028.outbound.protection.outlook.com [52.101.85.28])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gkcxeu77a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 10 Sep 2026 00:44:15 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jyUdjDAKomzsTkG1USUHN4WfQyoN6IM+plPf02f6DWfMzdlx8PwlBTVicSAJbBm4FzIH8YeoE7x7fuhCndMxjXwTmDEkQrgZFeBbtAF3PPySjyDq7ON3o3s7YV5bGFj9d6/wLHwuWJp/S3yoDUD4BSy7i41Lj7zliFBsKtcEmWipgnLcyYroBv2umVFnc+uhREvH34gTW83vtSwg0OQ29X0//VxAcIZPEbeq4fXXAawvK/KJw5k9zlkMpHhR9e/tmgQ8q/EGQ6c6jCoMOfwSNJbXLpor0hUjdIRdrR/vGHYH3dOB9bfdLEwAo3Xjq8WO4TvKMQ1O3U1L6pWffFSH2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FbHF6NiiotcMVDlUoo2PDyqcsDR2VyIAacaQLOQIi0U=;
 b=nM+4bFsjOBqfu4A18zEctjXdTt7EoRp+rdQq2oQf/06DQJULFbIUbQpx26q6bwFOwhT/GISz3WBlF1iWRZvwd1IxtwKauj41jC4pxyNHoS615B9H3pJh3ypgKg/fdlPfzb/f7l7b70xqS0XBiZ2e/7G5oBIymWwQhu2OcyzBayoEz9I191jptBZU5vNxRy8t9CQfQF4mPsA+axEZO3YzIprci9ivibxmiRLbtr7OosyZFqX+0hgR8jA27U1Hr5ZzXbB/OY9hkRmFmUjxc6/iqFxjPieyLbn/NJH1t5P+IjY0JREI+EJ25AKLmzkWZRdfUs2WOd4UFsYASxEpSz/E4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FbHF6NiiotcMVDlUoo2PDyqcsDR2VyIAacaQLOQIi0U=;
 b=qMfZ2T/pNC6ijVY8XB7C2R6uQEN28+8ETeY4KPJX/6slC9ZJ1L5iqihiCWzSLdn1J0R1QjAbh6vtguKZiNuacKckxj4SQ1BKsaQfezOY+PZaHZjBGTyK4xUQwghM+uQ1IgxxJaIaWPS4MHONmowprWvmqqrBpccb8gSaaN85FnM=
Received: from BN9PR03CA0678.namprd03.prod.outlook.com (2603:10b6:408:10e::23)
 by BY5PR10MB4241.namprd10.prod.outlook.com (2603:10b6:a03:208::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Thu, 10 Sep
 2026 05:44:11 +0000
Received: from BN2PEPF0000A98E.namprd04.prod.outlook.com
 (2603:10b6:408:10e:cafe::9e) by BN9PR03CA0678.outlook.office365.com
 (2603:10b6:408:10e::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Thu, 10
 Sep 2026 05:44:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF0000A98E.mail.protection.outlook.com (10.167.248.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 05:44:10 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 10 Sep
 2026 00:43:59 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 10 Sep
 2026 00:43:58 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 10 Sep 2026 00:43:58 -0500
Received: from localhost (uda1250336.dhcp.ti.com [10.24.51.123])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68A5hvVT2699128;
	Thu, 10 Sep 2026 00:43:58 -0500
Date: Thu, 10 Sep 2026 11:13:57 +0530
From: Yogesh Hegde <y-hegde@ti.com>
To: <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH v2 5/5] mesa-pvr: Fix for building with
 new LLVM version
Message-ID: <20260910054357.4bjj5omzbgn7ci3k@uda1250336>
References: <20260910015454.2933250-1-reatmon@ti.com>
 <20260910015454.2933250-5-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260910015454.2933250-5-reatmon@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A98E:EE_|BY5PR10MB4241:EE_
X-MS-Office365-Filtering-Correlation-Id: cf85b466-2ece-4ad9-28b7-08df0efe8a02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|23010399003|1800799024|36860700016|10067099003|4143699003|3023799007|22082099003|18002099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	5T09HyWg6ijYpXO7XVnITm5H6u/nKdSyNmRBka3jUAPlXyvgwmsye1UH24eqBJi7cJZa5LgZ0PTcdGibbagpLXYwDCUggBmx7PDBZ3Siq25X16T4m0+HgOvhgyi3JMKra/NjQs7W9qT0TkEGQZ2aQ3NMnBAD6tWep30WfOHiSObQjuEFK+VgH+n8UosBY4jZANELhJJoF1FraiT4/irH9UcmUjvnCdd1Y3fTAmk2q+2FZPsU+Hy8R9H2zyUmBbxAdiCNYYEQQ0eYPLg/0MGFUijKBlL5ApwbYGDsRh+GfuvzVrlA6Mnwcjx7tQSdmm/vczigS6n2wVBUo5qOGgpYjCUNY9qzAj+aHVCcEvKBi5c7ecEeM8Fdl5S4Ey3ND1tze3g+e6VHmt+s4FkfmdLJDIN+nxxpnUkTp9YlLAbziceP+Bd1IgN9m/AqxxgJ/VmP3XFMDugowj7zq/8SIiyxQl2ChTBFVPEzNbstxt30zmo1d4N3lNadhj+wur2215DkITt1AxGmLXkRhNWesUd3RYe0eEsZHXi3W9gRWi3EbrsB5s+tH6iMM5rBRG0cVigfRK2F5cgDkmgZnlG1cg60JaPbZSpFvGF9FwCJjvjAhuKRBom8H6wWzsPK/0XShg/+WXyW4DBR1gDR3Uut4juwUg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(1800799024)(36860700016)(10067099003)(4143699003)(3023799007)(22082099003)(18002099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Z3CgX4SDYXAvvHU6ijzd52C5mSpvkvYbmdaTERdaB2RChyo9/xT39zxRX6UQo+wwyJk9bt8LJWfhPaTiAibsMCA5W5qD5nFloca5Cm4D/GvKc1+TXo7f2HOxTfyRP7jIfv9ioE1Ae3GwE1SFbLE2yRsJQ/0OM0bjRKgZgRBqm77TMW94juxH/XSTwuCDv9gp3B60ND5YeaWBenzu96N3JSDkyFg7WwN+JKK0bQyL/1vBGfp0oR49xoGRIEE0CK9occNUcd6XfM/nyQaj6fglg9zZe63qb/wp7ZOvrBUoAzewoSEYNlaOX/hf0tM/vJ4YNVt3M8wqApKJ4EjO0t7/Ka8Z1SdX9mNFj08vaGVhDEMTjXs3e51Iy4/uA06QBQAq+J/vpVqdh7S1as/xrvvdNo5uJFMGAfrFWln0WUnhMjjhptQyRm8yHWVtvvsqexZg
X-Exchange-RoutingPolicyChecked: 
	ohm1PFFRGFERJHVBu/FJqpaCpdM3fcGYGQDQ4fXEX8HucLLUhx1s8fNhBq5eoiB5B+fEluIrrsATap9HeSkrYFpCeHWuBXHbzpxjEJcAQESnZt1GH1yYF4vvUOT5HBueNtBrOXUdWAU9D8rN+qzz0A8jVCz8BDABt+DeeUICiNdtbPu8HwRADhvhKKYp50u4naOCjXD3pWGeXyrZXzUdo4kwrQIgUdW77gZKjrKe2TQG/t04+IF4y5JgCjGYliKV1Y79Rqm/OG4e7moNoG0Yr2KDuBmFcn6uISyfnRXPUuQRY8WNuB5C7gNP9jzAhTcNdECTKL4szstdCxv1XbLmhA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 05:44:10.8643
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf85b466-2ece-4ad9-28b7-08df0efe8a02
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF0000A98E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4241
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA2MCBTYWx0ZWRfX1ZQH46v4zCpD
 98dNkwe2T3ZHS+FaH+qqmz1ono8H6du0Wi3ZM1Lp15Dk4udpCNqREgFskWQK1wttaEyhP2Wmdjj
 3A7myJoM4LUVi15X7zQean7qyWXG7J8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA2MCBTYWx0ZWRfXwYQbwLUNEqxh
 WR3xeyCHa0pcIkd8xp+MfkyqAwMOeBNz7gmjiqqOrJgZoxM9G2we9oMloYoM2KrGVDLIc4qYfxz
 /fcLDdhTbhWkzLLtKpR8b88FjEPcqoflsnBRph5peWNBuTnfdepOH58/Z02R0Ag2U2GuuOWu7AH
 1MVsYHek3vLIxRhTNmesb/K8elFvX/xXZvkMMunK5BK9GpQ2cUTBue7Cp3a82zlzLMUH/zlrrG7
 j3DssPxNsmnOYdDqE7IZVEAlgHBZLBgogk8XSoQL4xcqTD25n9iAtOtBV9av8GGshCrClp6ZUPM
 cQJs5nqipoZTSf0psLWsqyFWddP81FHREwAJc9tjpf8UFjEkt9NBr9gNSBGpqy+Zry4/k3xXGY8
 wJ+My7GKGHWHJKgjhU7yTEzsheZo6DTD8SL+JSEHqA/0Al91amtoOgNX/xOwqSGhvmNMRavPuX3
 4sRTkBboSJNV69wXlCQ==
X-Proofpoint-GUID: xfJgQ-sBsEMnXvxZnv3GbJmm7HsVP4am
X-Authority-Analysis: v=2.4 cv=F8fC5ahN c=1 sm=1 tr=0 ts=6aa243af cx=c_pps
 a=mniIB+Hk/8HPdz+5sH7poA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=Q4-j1AaZAAAA:8
 a=e5mUnYsNAAAA:8 a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=n7Gf2nL6AAAA:8 a=cVptBsFffTQxZ3O1ueMA:9 a=CjuIK1q_8ugA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=Vxmtnl_E_bksehYqCbjh:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=mHLeZRWHYWOIOYBL6xkx:22
X-Proofpoint-ORIG-GUID: xfJgQ-sBsEMnXvxZnv3GbJmm7HsVP4am
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100060
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 10 Sep 2026 05:44:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20366

Hi Ryan, 

On 20:54-20260909, Ryan Eatmon via lists.yoctoproject.org wrote:
> A recnet version change [1] caused a build failure.  Backport a patch

Typo in recent.

> from the mesa repo to address it [2].
> 
> [1] https://git.openembedded.org/openembedded-core/commit/?id=d1575787a815fbe1ca60b20664665f92a95b2264
> [2] https://gitlab.freedesktop.org/mesa/mesa/-/commit/f958ad11955638758c19170d9df4d67bf1ff8bcb
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
> v2; No change.
> 
>  .../0001-clc-fix-build-with-LLVM13.patch      | 45 +++++++++++++++++++
>  .../recipes-graphics/mesa/mesa-pvr_25.2.8.bb  |  4 +-
>  2 files changed, 48 insertions(+), 1 deletion(-)
>  create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.2.8/0001-clc-fix-build-with-LLVM13.patch
> 
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.2.8/0001-clc-fix-build-with-LLVM13.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.2.8/0001-clc-fix-build-with-LLVM13.patch
> new file mode 100644
> index 00000000..77bd993a
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.2.8/0001-clc-fix-build-with-LLVM13.patch
> @@ -0,0 +1,45 @@
> +From f958ad11955638758c19170d9df4d67bf1ff8bcb Mon Sep 17 00:00:00 2001
> +From: Lone_Wolf <lone_wolf@klaas-de-kat.nl>
> +Date: Wed, 13 May 2026 22:54:45 +0200
> +Subject: [PATCH] clc: fix build with LLVM23 (TargetRegistry::lookupTarget)
> +
> +See https://github.com/llvm/llvm-project/commit/d50631faad3003e73589528c83d3bbbad7ba72f1
> +
> +Closes: https://gitlab.freedesktop.org/mesa/mesa/-/work_items/15471
> +Cc: mesa-stable
> +Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/41558>
> +
> +Upstream-Status: Inappropriate [OE-specific]
> +
> +---
> + src/compiler/clc/clc_helpers.cpp | 11 +++++------
> + 1 file changed, 5 insertions(+), 6 deletions(-)
> +
> +diff --git a/src/compiler/clc/clc_helpers.cpp b/src/compiler/clc/clc_helpers.cpp
> +index 66d4af43a36a..e5c3d158b290 100644
> +--- a/src/compiler/clc/clc_helpers.cpp
> ++++ b/src/compiler/clc/clc_helpers.cpp
> +@@ -1186,15 +1186,14 @@ llvm_mod_to_spirv(std::unique_ptr<::llvm::Module> mod,
> +    if (args->use_llvm_spirv_target) {
> +       const char *triple = args->address_bits == 32 ? "spirv-unknown-unknown" : "spirv64-unknown-unknown";
> +       std::string error_msg("");
> +-      auto target = TargetRegistry::lookupTarget(triple, error_msg);
> +-      if (target) {
> +-         auto TM = target->createTargetMachine(
> + #if LLVM_VERSION_MAJOR >= 21
> +-            llvm::Triple(triple),
> ++      auto temp_triple = llvm::Triple(triple);
> + #else
> +-            triple,
> ++      auto temp_triple = triple;
> + #endif
> +-            "", "", {}, std::nullopt, std::nullopt,
> ++      auto target = TargetRegistry::lookupTarget(temp_triple, error_msg);
> ++      if (target) {
> ++         auto TM = target->createTargetMachine(temp_triple, "", "", {}, std::nullopt, std::nullopt,
> + #if LLVM_VERSION_MAJOR >= 18
> +             ::llvm::CodeGenOptLevel::None
> + #else
> +-- 
> +GitLab
> +
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb
> index 03b0b9bf..cd622864 100644
> --- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb
> +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb
> @@ -11,7 +11,9 @@ LIC_FILES_CHKSUM = "file://docs/license.rst;md5=ffe678546d4337b732cfd12262e6af11
>  BRANCH = "powervr/${PV}"
>  
>  SRC_URI = "git://github.com/TexasInstruments/mesa.git;protocol=https;branch=${BRANCH} \
> -           file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch"
> +           file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
> +           file://0001-clc-fix-build-with-LLVM13.patch \
> +           "
>  
>  SRCREV = "7b6e8de7b0acdaff684f1109c6acb575644a93ea"
>  PV = "25.2.8"
> -- 
> 2.43.0
> 
-- Yogesh

