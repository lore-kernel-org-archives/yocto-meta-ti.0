Return-Path: <a-dubey@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D95B5C61DFD
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 07:48:34 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7151.1788335310786874114
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 02 Sep 2026 00:48:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=KV8CzF+7;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=k9lKhuNM;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: a-dubey@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6826Tvqx287510
	for <meta-ti@lists.yoctoproject.org>; Wed, 2 Sep 2026 02:48:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=V/hknHuDZtupeofPZJ2ymHgVupUGFMMdMLF051n3p
	dg=; b=KV8CzF+7K/DHP4uBdWyzrph+s1l6fDATgkxykn5+FGrfQGMzPNrG3E5Vd
	S3DifFb0i3xNC9eFHtvHw4Ul5OH+0ADq8jTwwRn7YNSq5ycTYhDQ+nPYpoH/dZOg
	NfHazCVzqy1yHPc4cfg/doZvQeFXxU2NmQJlsToKzrMCUCsw8ropxO2RH++aXvjH
	zwoGjcvcn/6zfos4A2QG/A7yLSZaX+bMGWrx5mQ9B0ySNEFGCo79DC7hKhY2eJga
	EdkqMUcVslOZQz79ndpILW890AZhw9nC0PxCOnoZSpfgChDQDLrvXtr2Y3EVbhQU
	mP9vpgAzyJrCOIX/sMkquu2SND+aA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011027.outbound.protection.outlook.com [40.93.194.27])
	by m0384305.ppops.net (PPS) with ESMTPS id 4ge7cgahfj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Wed, 02 Sep 2026 02:48:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XBLdPtWO/RPuh8A0RNJUK8KMxoA0+ZNwQ8gvUnqoYC5krRF3eFgHNk+refUPsitxj2PT65Ngw2eYQdpoZt1SkQHlLwhAfCquF8OeIduksKiOgWw5rbcZ2+9v7rCxjhXM5BOp48wceu7uoeFkUENX2DGooApb39xnHLDx9AgFBEsL28FQ7IvmxrFPtmPSotuqByCoe4aRp8eEsDlO5l00OkOa0DZGz10B2AvOzZV6/QrVtMK/iBrsh6DKpXPr38Y0Jm45QJGimvA/zsTyvN3nXhSvfu68X3sTprlynhspIv02iyeKfQ006KqHHbFyYh2bOYNVEI+ceUD7gJAxmZVhpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V/hknHuDZtupeofPZJ2ymHgVupUGFMMdMLF051n3pdg=;
 b=e7GLbZWd2Z0AIzLsinR8ufFqSxl0/8Rs+Sy/IOiGOqtM8LnH8+7PCWeatt+jyrqfxfqIiEra+XStCmMeeAg9gjPHzrSZgQIjcdEa/0iVV5XaNwiDgzs6eBH2QEEgiuwfTc1UX3GvvkltYQx8BwskkNWK1z7N5U7o6Kgmawp4Q/rHOVoROo2bOXQA046EsVBFvWm6sHelKTBHsIvavUlkan78oQu+1Rqg91gV4dorgY2HgPOcLszio3LIqcjJXz7wp7KmIxXA2DnceGw/SCWgBcsWUJmd2laYBSlkS5I2bA9xmO8d59tADNrSwwk+uk7MViUoVPir2wx6I14ILLVYqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/hknHuDZtupeofPZJ2ymHgVupUGFMMdMLF051n3pdg=;
 b=k9lKhuNMW0OXj9fF3t460xMZNGqkAy77oxRCikZR5jJW+b8MVsO/F5diQUy7oiDPzEYMdQ9iS/vk8wj/LbyPow/j1qaZEKtYAQznbn/h3EdWu9P/YAMjvETra20UEdeVX1U3w57eIjqpwqpVPhd7fkKnxtYWs9pyTYLc/v/+h+o=
Received: from SJ0PR13CA0161.namprd13.prod.outlook.com (2603:10b6:a03:2c7::16)
 by IA1PR10MB6781.namprd10.prod.outlook.com (2603:10b6:208:42b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 07:48:24 +0000
Received: from BY1PEPF000264B0.namprd02.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::af) by SJ0PR13CA0161.outlook.office365.com
 (2603:10b6:a03:2c7::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 07:48:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BY1PEPF000264B0.mail.protection.outlook.com (10.167.242.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 07:48:23 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 02:48:14 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 02:48:14 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 2 Sep 2026 02:48:14 -0500
Received: from [10.24.50.31] (lalit-ti-241.dhcp.ti.com [10.24.50.31])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6827mCV03351285;
	Wed, 2 Sep 2026 02:48:13 -0500
Message-ID: <d19e9d2e-a47a-4db3-8a6f-0f337f08ba84@ti.com>
Date: Wed, 2 Sep 2026 13:18:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master][PATCH 1/3] dm-verity-upstream: Add dynamic layer for
 meta-security dm-verity
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <denys@ti.com>, <m-shah@ti.com>, <a-limaye@ti.com>
References: <20260825063713.51497-1-a-dubey@ti.com>
Content-Language: en-US
From: Atharv Dubey <a-dubey@ti.com>
In-Reply-To: <20260825063713.51497-1-a-dubey@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B0:EE_|IA1PR10MB6781:EE_
X-MS-Office365-Filtering-Correlation-Id: 6485f094-ab9f-4197-1bbd-08df08c690f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700016|23010399003|82310400026|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	N98WyMTNlhSatsAa5H3oklRhG9yrzbyn92Feo8Nuw5Hu+ZmPHdAEBGrUGfC0BfpQVLJvlyNMB7YBJvpaJxPU/Pn7VDHiGC6V82QtchgYY4sHJpIgCkGkQLan4hHlee26mC2MMQZoFE7uNysWuxzKVnG+jrUEq3BC+tfvpzNVR01ZZNi8NlhWFi91TBHWb72P8iL9RJjvdRndH8i2ZatBMA0130qPos/D9tLEMF9wGQG9uJw6F7SGZUJpWPTNsHOjhXCB1GyBuo3ExMSNne7Kji2HrehYJxHAPkQoYKwWSB3fQqdQSpPiBUL/e+3X5qT2mR9PjFyQxs3abXDok57yCQs6map2oUSa+KDO+AhW4Z/q9ETa5HJsEmaCBsNG4zQu9njpmVvpGsFVuZ+eOnrKSVVg5nvUE8YWPat6ckQlNT2LfaP7PuZHsJ6TX2oYLMIwN6J5M7Np2C5FXf2TUkh3UERJm1tNX+L1RQcFWBXNZziq/tOFF8/2dp2prHiIdkHG/UB2EPB/J8nzaxrrkMrvEQWbpXrDkWtEq08P62I3pbWjSC1JPf8jMBmLGTu9LNuPPsQ+pqMdO5qmAuhILXln1mrsJEZ6s7JAOEWVRMN+6R3Dk7T4MAbc7H17T/1hYIivEvD1mQVSEa9zTKE42O6G5HtbcCitNgsEIkSxsMuh4eQZH14LI4UF9o8q8tzBZPRpcp8hvrfDfUPX6QGrNK45Fw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(23010399003)(82310400026)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	MPUcJp+bbNdiNaQGdafSsx8O+D0hPUHr5rXq0EHqCjjg+3kHBzodZLLHdnypLOlZFjtiuP3b142H/uRE1ZFrtN28V/QabiSfzG2ass6znmTXW69UIAQykA+JXgaRXKGVp2reCgE+OyWSotblvbq9hkQH0DnPi8t9XBG9nDKbdYwfoSWDBI1XW1coueM72a8S/YsScMkBplRjZp42j7rB9rw3RPWRdW5dsxU/QqaTyVH/mlNtB8Bmg8stGVvDdjCnctAzNx6CHgvz4g+dhfNRUIjA2hFfy4OGjOJ8Vb6fXH2EjLjegstqkucSPkg4hdjNDG6/CDWyHOqXN28i401EfdfhFigDOdjzDJzBSz2mKYPKpGeWD3YDOkO67dy0S011wwbZTf7mQSaU3VBNOahknmSXU6Fy17DLytsXIaXFM99eBDWRBFylUCrJmTRU1Bgn
X-Exchange-RoutingPolicyChecked: 
	kRL5ES6kCKI1SRCf7S58AWSn1yqK9pvfcwjx47B6Ox0cmD626ls/6bYHXxFXACxZkbfdqjOJV6rrIpFK/Nns8J+PL6jVusbu+msc/S7ZgUvv+SijrxOryQhLCUornJKXzRrspoztEbimHeJEsk32Fok5TtzoarTP+PxMt05aE3FsJ1bGHkMRUWkkh/SWafOUcldQWFLlTRbKDfRD1vBPPJ98fuygbvhLQ0CNnyBr865B1NjPKVCpI5Sz6yryVzb97ef6gzhAO3Bhi3fLOttaA6olvtXmoVhDTtyxE5pcXDW+2mlBSWiqsSAG+S9wVJXUFQ6/HJ4ze45WzaZsOmE3Uw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 07:48:23.7115
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6485f094-ab9f-4197-1bbd-08df08c690f6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF000264B0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6781
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA2OCBTYWx0ZWRfX8x/qY+UG+xzu
 8cga82DLIDC9aRYCmYlhB585/mFRL09aUr5C34s23MKIU1QqOHeBX+SjCJ3pui7AYVEzO3RNRpJ
 gjn6E4p4tLWA24RsU/dYM6VNJxNYUrw=
X-Authority-Analysis: v=2.4 cv=Ka3idwYD c=1 sm=1 tr=0 ts=6a97d4ce cx=c_pps
 a=1puOLNWm8QjqX9uS9MZT0g==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8
 a=RdZSrJuIY3TQ4SsO9XIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: fx7es6UUN3WvVm2tc0CJKrvFYRGSVUaT
X-Proofpoint-GUID: fx7es6UUN3WvVm2tc0CJKrvFYRGSVUaT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA2OCBTYWx0ZWRfXwX9X3sQxpzB9
 Kh40g399F6RMuoy4CktbQq1rFYCuP2PtNXe8mfuSYoOuRgLG0ladtgRjx3ebOt5+XkMUgPRxbVO
 Tc02yqTCCko9PeHOAiNaXbf2YgpsIEWhCZrlyAiEYyTO+Nk6VzWbIreCkpp2G+KAgiw8aJr13Nd
 Uo++ThZ4qqg/dVYnJT6nhKhWTJQYU6XKVB085xWdAoJ4fwuielAip3I7ETLGassUYmGBLKGxdXc
 bk0yruLnKKfLv2+okzV/4p1hR2Xr4lWjl/3ofCk/9dAxu6PYrrBse6JTD8uxTyYHXPSA/mI6nZn
 hQvHRFaeRmOEfeTqE8enF9avCOYIn9iI+uK09u3sX28J+YFglcgT7uZuyQpHg0oblHDa3H28GWN
 dX7pC4DpBNC2dCow3pzQJby815cWy5KEjpiO9fSFE66ZUNeKKXubmNsoUry3xtIGSg3gXVkNW/q
 MGgZgUcoLhoPXT6kXHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020068
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 02 Sep 2026 07:48:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20321

On 25/08/26 12:07, Atharv Dubey wrote:

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
> ---
>   meta-ti-bsp/conf/layer.conf                     |  3 +++
>   meta-ti-bsp/conf/machine/include/k3.inc         | 10 ++++++++++
>   .../conf/include/dm-verity-upstream.inc         | 17 +++++++++++++++++
>   .../udev/files/dm-verity.ignorelist             |  1 +
>   .../recipes-core/udev/udev-extraconf_%.bbappend | 14 ++++++++++++++
>   meta-ti-bsp/files/wic/k3-verity.wks.in          |  5 +++++
>   6 files changed, 50 insertions(+)
>   create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc
>   create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/files/dm-verity.ignorelist
>   create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-extraconf_%.bbappend
>   create mode 100644 meta-ti-bsp/files/wic/k3-verity.wks.in
>
> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
> index 3cc54aa4..aca35cd3 100644
> --- a/meta-ti-bsp/conf/layer.conf
> +++ b/meta-ti-bsp/conf/layer.conf
> @@ -20,12 +20,15 @@ LAYERDEPENDS_meta-ti-bsp = " \
>   LAYERRECOMMENDS_meta-ti-bsp = " \
>       openembedded-layer \
>       tpm-layer \
> +    security \
>   "
>   
>   BBFILES_DYNAMIC += " \
>       openembedded-layer:${LAYERDIR}/dynamic-layers/openembedded-layer/recipes*/*/*.bbappend \
>       tpm-layer:${LAYERDIR}/dynamic-layers/tpm-layer/recipes*/*/*.bb \
>       tpm-layer:${LAYERDIR}/dynamic-layers/tpm-layer/recipes*/*/*.bbappend \
> +    security:${LAYERDIR}/dynamic-layers/security-layer/recipes*/*/*.bb \
> +    security:${LAYERDIR}/dynamic-layers/security-layer/recipes*/*/*.bbappend \
>   "
>   
>   SIGGEN_EXCLUDERECIPES_ABISAFE += " \
> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
> index 2ebbfb9e..e23e0ead 100644
> --- a/meta-ti-bsp/conf/machine/include/k3.inc
> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> @@ -64,3 +64,13 @@ FALCON_INCLUDE = ""
>   FALCON_INCLUDE:ti-falcon = "conf/machine/include/ti-falcon.inc"
>   
>   require ${FALCON_INCLUDE}
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
> +        install -m 0644 ${UNPACKDIR}/dm-verity.ignorelist ${D}${sysconfdir}/udev/mount.ignorelist.d/dm-verity
> +    fi
> +}
> +
> +FILES:${PN}-automount += "${sysconfdir}/udev/mount.ignorelist.d"
> diff --git a/meta-ti-bsp/files/wic/k3-verity.wks.in b/meta-ti-bsp/files/wic/k3-verity.wks.in
> new file mode 100644
> index 00000000..6ef2c57f
> --- /dev/null
> +++ b/meta-ti-bsp/files/wic/k3-verity.wks.in
> @@ -0,0 +1,5 @@
> +# Disk layout for a board that boots with dm-verity enabled.
> +
> +bootloader --timeout=3 --append="rootfstype=ext4 root=/dev/mmcblk1p2 ${TI_WKS_BOOTLOADER_APPEND}"
> +part --source bootimg-efi --sourceparams="loader=${EFI_PROVIDER},initrd=${DM_VERITY_INITRAMFS_IMAGE}-${MACHINE}.cpio.gz" --fstype=vfat --label boot --active --align 1024 --use-uuid --fixed-size 128M
> +part / --source rawcopy --sourceparams="file=${IMGDEPLOYDIR}/${DM_VERITY_IMAGE}-${MACHINE}${IMAGE_NAME_SUFFIX}.${DM_VERITY_IMAGE_TYPE}.verity" --align 1024

Hi All,

A Gentle Reminder for a review on the patches.

Regards,
Atharv


