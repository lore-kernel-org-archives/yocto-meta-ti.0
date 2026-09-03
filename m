Return-Path: <y-hegde@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD82C624A4
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 08:38:09 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3106.1788424684811461088
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 03 Sep 2026 01:38:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=c+WbE36o;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=UvapEJoL;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: y-hegde@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6835j7vY2921716
	for <meta-ti@lists.yoctoproject.org>; Thu, 3 Sep 2026 03:38:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=Ti0buCo6luEOtXR
	qLJ+dz1OVjop5GzPClec419GUkxA=; b=c+WbE36o1WktiddsZAPa4PtdrG/lAh9
	Tt2Ta0zo9Qvw2pGdulw74QbNBoL2WXLwAsfLZQThCFRFeMnhC6gTIxngi4eZ+tQb
	mxMb1uc44dSH5UMp0wdUcBOrNvng+oTUzddQyyVEGMXJ1heGgV5zWlvmE5sakT+C
	g/5StfFntp2+govwFV+pIGt4DzgHzEDYfyv3dUFGyN1ogkxJxDXVjMcJkoTXAZdJ
	/ZESQ159PHvP4hCCGhdQl/wBa5KHwYlk4sxqqCZ0eHjDx+baSlKHmAlOIOlqDYlB
	sZvWFMeOI/41TlGis2cvAzLxPyZew/kpvFAXyzYiFIf9NYaG0NDKqrQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013012.outbound.protection.outlook.com [40.93.201.12])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gf0jv1pd4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Thu, 03 Sep 2026 03:38:04 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ty/Ne/xmLXi3c4ZL8pDq9V8revf5b3vHM/ozS6yCRSMMXrT9tZLdgsdCU0+XouZQIaajyAXWtFBKLbD6duZ0SuDi9zPApcouc3T4sxnPr9nYuzJQchw1aapKjZbHaSxcza7MsxKwIIrsBjrIWnsYWDv6oXDjZE6uU3UlSsoxjx36rdEN3CWnsN5YSlJfb7A1LFwVvNc92dK7DVneZ7mdRtaL582zEId7t5uTXXj2Xy+cc79JtTxAQ0MLHIiQSxlLqVY+wQZZJoPHDs6q7AYz/FCNj5AKz+PpjvcNZsIE8sa/WdfgxJA2C1xC9xBYgbWa90yVrhDwFgYnSvQrYbsDFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ti0buCo6luEOtXRqLJ+dz1OVjop5GzPClec419GUkxA=;
 b=Nf7yeCRu7BEuFZMpYDm1hFnD0+IbHZp9bT7N97fkgs+fc8EAAFbOFjTR2B9fh21K4WbWsTmIwAcASayPeEEIOQ9y99cPpNRb7UeQSHdFDZb37B97Fmlv7jOR9rNr4klxxs+n6pIJoH8KP1xvO2I3YjgmNZ1xVoemwGPxYrM1VQbf+mOPWt2Pl4g5VLl1WZEnwwWYxcpbv/ROHQnjx5g8w46CXzeHYKItRBmjsjvEuAwpjgTjQYgMkFBx9/G7mX9NTpzJmHzBvlB7r2ilB1jDSqpTChYqSER+/WNLE2zjZK2QklV9mEyv26Sg/aznOdVDmXfOPKjFA9PL+muMWIhHAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ti0buCo6luEOtXRqLJ+dz1OVjop5GzPClec419GUkxA=;
 b=UvapEJoLQUBSCfK9o2vLl0rVU/XMfq+VjoNT3MyqoesUsFr8Apqm/fY6Vf/4IGUFNz8sG5j+xF2I9Ai5/4jEHCy8kK4QmfLxzUuh6WGgUyfst8GzJtOoHoB55cgu0Gvdm6qwq1bHvWtdpzzGdcnfdMry3IMXxZ+hnHZ6DYOITII=
Received: from CH0PR03CA0083.namprd03.prod.outlook.com (2603:10b6:610:cc::28)
 by SJ5PPFD020A49E6.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7d0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 08:37:59 +0000
Received: from BL02EPF0002992C.namprd02.prod.outlook.com (2603:10b6:610:cc::4)
 by CH0PR03CA0083.outlook.office365.com (2603:10b6:610:cc::28) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12
 via Frontend Transport; Thu, 3 Sep 2026 08:37:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF0002992C.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 08:37:57 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 03:37:12 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 03:37:12 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 3 Sep 2026 03:37:12 -0500
Received: from localhost (uda1250336.dhcp.ti.com [10.24.51.123])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6838bB4f2242731;
	Thu, 3 Sep 2026 03:37:11 -0500
Date: Thu, 3 Sep 2026 14:07:10 +0530
From: Yogesh Hegde <y-hegde@ti.com>
To: <a-dubey@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denys@ti.com>,
        <m-shah@ti.com>, <a-limaye@ti.com>
Subject: Re: [meta-ti] [master][PATCH 1/3] dm-verity-upstream: Add dynamic
 layer for meta-security dm-verity
Message-ID: <20260903083710.rvfivmg4s73rclyr@uda1250336>
References: <20260825063713.51497-1-a-dubey@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260825063713.51497-1-a-dubey@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992C:EE_|SJ5PPFD020A49E6:EE_
X-MS-Office365-Filtering-Correlation-Id: 1532101b-88c2-42b1-c9b7-08df0996a7da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|23010399003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	5P52yhO7zH+MIEmbcXDPYwp3YfBF8qhWeuPhUA6WhUKZdmPTRNMeXUmrSJMid9SyKT7yfrzS55YcJYHm2wSQbuP7KLBVob85JU6ZPuy8toTPyiessLU7G/i/sFpo6ve3qagQRxQGsr54FC7dR3zkOhH71P4+VDFEf6OxaICjRqLvbw0uH5ZHXFSe8IbGdlq9rs5u3fDFClTxmYtzWV196Urn6e+eQjwSPNVv4w7ptoQkbWwZMiabYlU1Y0pphFog9XD00b7HpaK3Q733he87b8IJJ1vmvj2ssoS0chNLTemB8SKDPYon1MRSFPmvxnRk/Z9+9oy37TaUY0lrMonZ+cnscyYiBTwfNgCqk4qq2iFVn7mI4USOrXhep3A9aAeqExLsxUDgn3ToX2k9KPBABgHzx6DfLI6Z5mYgIFHEM8IxJ2rIIzt2yWZlvA1K5mgnWfbp4ub24Kw3ImHLTXsRwtP5LCEWv2Mkm/arwxHv+Iqs0m1g/Td1sgnZ3+UolCWVofyVnqr3aIxLAWaIs4b5H2uE0Sjxy/YKaWdB+JkwdpM1N11nDYeG1AQ5ulF3q2mCIIC+d7r4h0MmRRYsxEb2I66EMTr2cSNViKvLaD7gGEL/sj2uVZDnl4ikKJbTaRNcE8Nms2/207cTc5orMIrbt1JVHalwvXP1RibVz32uGghnaSHLal0tq0ujDo31/05uZokrFVAdW/kjp/Znh2hi9w==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ytPoruMfYwYw8eVArC2FRIRYgFtSpY+0QFQOLunltCYqHVwsIWsDcn9YczKwrNjh+8/VtJev1W3ZgmgJ/XKB1uYcl2laGh5e3xySUZzQEaVpnEJFJ+Fw1sr3x/JKu05h0cCwZvdd6rSuWmBaczhc/ee4ZRv3e+PmpW0qVC1p0VebUjKMD8d33TPqm921uBxQR8qNgUHMgexP/juhFcNXomXkZ4VE1NaRSu2Up1Y3eUS1UVxZFfthpnqKJsfOi7aOtpI9OhrC0i/AQihTtMPURTIrjlWDg9L77h2jBp5Jao594vUwPp+H0ja49CtLmnQiB3dh3A75ELF+y1W+0cq1fdpA4g8ye2+4BMIFvWkbJedK1yuEcmwH3YXfkvx0yocGmsKhR9I21nDoaHDS8YLygVzGBB5vulZiuTWjmO2q9xpGr3/06LAF46JqUNUdNw5K
X-Exchange-RoutingPolicyChecked: 
	Oku2CEAg4s2aHVWY81b5QVpU9Ud0iOq5jTT4ETXf6u/mTRsYYfjI7qWIxYKfxNFgGiesVkxRj3xwcq1edLsBYR5bdLXANNMdiF2ZlKf/xwK8ALgtKyQ4JVRRi1D1dMsLx54RqcNmU15jO7A9t0XyogzAekEpXcyr+e+lpQxtW9YThphKVk5TwnDrIBKgEMbc43og67x81hB5jcOQsGDth2nFaMZNKsdbKnqePhfKQZKjNn7ms0bijIsSJoOi+XSyjh1GmdYjRqYV6OrxBwFHqDlKan2iJ3GFeWwMglDqpP4Tt7o2185nfI+XZrqb/QhzuUA9rVVwrovmDFYrTLqnfg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 08:37:57.4610
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1532101b-88c2-42b1-c9b7-08df0996a7da
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0002992C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFD020A49E6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3MyBTYWx0ZWRfXzWH5j6WBExJP
 3QvzZvuMiW0z0EOdn2HbMjPeOgQu251Au03knGqnH61J3L8ZrS+bQ+vzW6Q+McgF2XTg/6KjIFh
 ZG53SXvBRR1TBtE4zHjw48vgxqmNnJc=
X-Authority-Analysis: v=2.4 cv=J6eaKgnS c=1 sm=1 tr=0 ts=6a9931ec cx=c_pps
 a=4PCWzz9QFLYZoRw/GV/NtA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=geab_Az67AWxZZYMCiQA:9 a=CjuIK1q_8ugA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: hd4xiV8GqvyHtZhu3AyuhnAOTe_THT71
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3MyBTYWx0ZWRfX9mUlLdc2NAsD
 Q2qYawTl186e0AiV3cWuWG2Lu4EIMw1AYO+nN+VZSq7iPdfo9/xMMh4sQlVFVjPhqleWtG/UvqS
 TeDnFftj4fGH8X3GBre6GkNMAsUpl0I8Qy9otThoJKoc9rjXnfOayBtQkn2gnm4xET1gamX4Xp1
 hAXDpKwrbdmDrAvtQhnLooJ7xZpuXE0ARp+RQw+3h/67P5qJIdM2jNZDtKojVx+UKUIK8kinxC8
 w1EXPp0E6jsZMYUUs+sdxVTPPMc2R4Sj2x5jVkoCZPj0WIT0rUcclznzpgX9OtWFMmAqYPaj6Lv
 pDkg4jMtGO2N2jUht26arsK1+ApRzoeOVrMPx32BZadcY0DwN0F4+2f0lY1Rioy/J/1p9BbPSnS
 5elpi0lZBHYalz8qaLULfLgROh2JRGqsxXCEfOfEDiI38/Av29H1SRk3/+EYroUWBP1te75aVZ0
 Jwne3IpNmXyTpfjRffQ==
X-Proofpoint-ORIG-GUID: hd4xiV8GqvyHtZhu3AyuhnAOTe_THT71
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030073
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 03 Sep 2026 08:38:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20324

On 12:07-20260825, Atharv Dubey via lists.yoctoproject.org wrote:
> Add an optional dynamic layer enabling dm-verity block-level integrity
> verification of the root filesystem for TI K3 platforms, using
> meta-security's stock dm-verity mechanism as-is.
> 
> dm-verity hashes the rootfs at build time; at boot, a dedicated
> initramfs loads the root hash and the kernel checks every block read
> against it. Wires DM_VERITY_IMAGE/WKS_FILE for the K3 boot chain,
> hooking do_image_wic instead of INITRAMFS_IMAGE to avoid a 3-way
> circular dependency through kernel-fit-image.bbclass.
> 
> DM_VERITY_IMAGE selects which image recipe gets verity-enabled
> (default arago-base-image, overridable in local.conf); all effects are
> scoped to PN == DM_VERITY_IMAGE, so building any other image type is
> unaffected. Only active when the "security" layer and dm-verity-upstream
> feature are enabled.
> 
> Signed-off-by: Atharv Dubey <a-dubey@ti.com>

Hi Athrav, Thanks for the patch

> ---
>  meta-ti-bsp/conf/layer.conf                     |  3 +++
>  meta-ti-bsp/conf/machine/include/k3.inc         | 10 ++++++++++
>  .../conf/include/dm-verity-upstream.inc         | 17 +++++++++++++++++
>  .../udev/files/dm-verity.ignorelist             |  1 +
>  .../recipes-core/udev/udev-extraconf_%.bbappend | 14 ++++++++++++++
>  meta-ti-bsp/files/wic/k3-verity.wks.in          |  5 +++++
>  6 files changed, 50 insertions(+)
>  create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc
>  create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/files/dm-verity.ignorelist
>  create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-extraconf_%.bbappend
>  create mode 100644 meta-ti-bsp/files/wic/k3-verity.wks.in
> 
> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
> index 3cc54aa4..aca35cd3 100644
> --- a/meta-ti-bsp/conf/layer.conf
> +++ b/meta-ti-bsp/conf/layer.conf
> @@ -20,12 +20,15 @@ LAYERDEPENDS_meta-ti-bsp = " \
>  LAYERRECOMMENDS_meta-ti-bsp = " \
>      openembedded-layer \
>      tpm-layer \
> +    security \
>  "
>  
>  BBFILES_DYNAMIC += " \
>      openembedded-layer:${LAYERDIR}/dynamic-layers/openembedded-layer/recipes*/*/*.bbappend \
>      tpm-layer:${LAYERDIR}/dynamic-layers/tpm-layer/recipes*/*/*.bb \
>      tpm-layer:${LAYERDIR}/dynamic-layers/tpm-layer/recipes*/*/*.bbappend \
> +    security:${LAYERDIR}/dynamic-layers/security-layer/recipes*/*/*.bb \
> +    security:${LAYERDIR}/dynamic-layers/security-layer/recipes*/*/*.bbappend \
>  "
>  
>  SIGGEN_EXCLUDERECIPES_ABISAFE += " \
> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
> index 2ebbfb9e..e23e0ead 100644
> --- a/meta-ti-bsp/conf/machine/include/k3.inc
> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> @@ -64,3 +64,13 @@ FALCON_INCLUDE = ""
>  FALCON_INCLUDE:ti-falcon = "conf/machine/include/ti-falcon.inc"
>  
>  require ${FALCON_INCLUDE}
> +
> +# Upstream dm-verity path: meta-security's own dm-verity-img.bbclass +
> +# dm-verity-image-initramfs, used as-is (build-time hashing). Only active
> +# when the security layer is present and this feature is explicitly
> +# requested -- see dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc
> +DISTRO_FEATURES[validitems] += "dm-verity-upstream"
> +
> +DM_VERITY_UPSTREAM_INCLUDE = "${@bb.utils.contains('DISTRO_FEATURES', 'dm-verity-upstream', 'dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc', '', d)}"
> +
> +require ${DM_VERITY_UPSTREAM_INCLUDE}
> diff --git a/meta-ti-bsp/dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc b/meta-ti-bsp/dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc
> new file mode 100644
> index 00000000..4de9e2fb
> --- /dev/null
> +++ b/meta-ti-bsp/dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc
> @@ -0,0 +1,17 @@
> +# Enables dm-verity to check the rootfs for tampering on TI K3 boards.
> +DM_VERITY_IMAGE ?= "arago-base-image"
> +DM_VERITY_IMAGE_TYPE = "ext4"
> +IMAGE_CLASSES += "dm-verity-img"
> +
> +DM_VERITY_INITRAMFS_IMAGE = "dm-verity-image-initramfs"
> +
> +python () {
> +    if d.getVar('PN') != d.getVar('DM_VERITY_IMAGE'):
> +        return
> +
> +    d.setVar('WKS_FILE', 'k3-verity.wks.in')
> +    d.appendVar('EXTRA_IMAGE_FEATURES', ' read-only-rootfs')
> +    d.appendVar('WICVARS', ' DM_VERITY_IMAGE DM_VERITY_IMAGE_TYPE IMAGE_NAME_SUFFIX IMGDEPLOYDIR')
> +    d.appendVarFlag('do_image_wic', 'depends', ' %s:do_image_complete' % d.getVar('DM_VERITY_INITRAMFS_IMAGE'))
> +    d.appendVar('IMAGE_BOOT_FILES', ' %s-%s.cpio.gz' % (d.getVar('DM_VERITY_INITRAMFS_IMAGE'), d.getVar('MACHINE')))
> +}
> diff --git a/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/files/dm-verity.ignorelist b/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/files/dm-verity.ignorelist
> new file mode 100644
> index 00000000..5af878c9
> --- /dev/null
> +++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/files/dm-verity.ignorelist
> @@ -0,0 +1 @@
> +/dev/mmcblk1p2
> diff --git a/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-extraconf_%.bbappend b/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-extraconf_%.bbappend
> new file mode 100644
> index 00000000..3940a24d
> --- /dev/null
> +++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-extraconf_%.bbappend
> @@ -0,0 +1,14 @@
> +# Under dm-verity, the raw root partition looks unmounted to udev's
> +# auto-mount check, so it tries to mount it a second time on its own,
> +# outside of dm-verity's protection. This tells it to skip that partition.
> +FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
> +
> +SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'dm-verity-upstream', 'file://dm-verity.ignorelist', '', d)}"
> +
> +do_install:append() {
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'dm-verity-upstream', 'true', 'false', d)}; then

Add `install -d ${D}${sysconfdir}/udev/mount.ignorelist.d` before
installing the file. 

> +        install -m 0644 ${UNPACKDIR}/dm-verity.ignorelist ${D}${sysconfdir}/udev/mount.ignorelist.d/dm-verity
> +    fi
> +}
> +
> +FILES:${PN}-automount += "${sysconfdir}/udev/mount.ignorelist.d"

FILES variable just adds the folder here (misses the dm-verity file) it should be 
`FILES:${PN}-automount += "${sysconfdir}/udev/mount.ignorelist.d/dm-verity"`

> diff --git a/meta-ti-bsp/files/wic/k3-verity.wks.in b/meta-ti-bsp/files/wic/k3-verity.wks.in
> new file mode 100644
> index 00000000..6ef2c57f
> --- /dev/null
> +++ b/meta-ti-bsp/files/wic/k3-verity.wks.in
> @@ -0,0 +1,5 @@
> +# Disk layout for a board that boots with dm-verity enabled.
> +
> +bootloader --timeout=3 --append="rootfstype=ext4 root=/dev/mmcblk1p2 ${TI_WKS_BOOTLOADER_APPEND}"

root variable should not be hardcoded to `/dev/mmcblk1p2`, not all
machines will use the same partition numbering. Better to use uuid. 

> +part --source bootimg-efi --sourceparams="loader=${EFI_PROVIDER},initrd=${DM_VERITY_INITRAMFS_IMAGE}-${MACHINE}.cpio.gz" --fstype=vfat --label boot --active --align 1024 --use-uuid --fixed-size 128M
> +part / --source rawcopy --sourceparams="file=${IMGDEPLOYDIR}/${DM_VERITY_IMAGE}-${MACHINE}${IMAGE_NAME_SUFFIX}.${DM_VERITY_IMAGE_TYPE}.verity" --align 1024

-- Yogesh 

