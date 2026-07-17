Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E66ABC4451B
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 14:10:15 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14420.1784297405907923024
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 17 Jul 2026 07:10:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=XhsrwqrF;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=hjJSmAWt;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE891a2673446;
	Fri, 17 Jul 2026 09:10:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=yADOpUKEJgBWmw+NRru+1mwZrrD53Aiu3+Ecr6tR5
	hY=; b=XhsrwqrF5neX/IrO/lUCLnFnRr74Jp4Elvaoby2/s9p6xu54XukJkk3ZF
	6P1z31Nf4hgjZADO8HGAq9s6IXeSKFGCPa9Qwgk0Eq7S8VKfA0l/LfvCmdBJnD+A
	owifB8I7VMF2+yfV0fG4zetKumXW7oP7LtU/AGoJYPCq4KroogyN9doAPqPrWUtj
	JFzH25x/TZLzfBScFlqzV/GhDsSoMzqGvg/md881CpdFnsn6zu//1PjHN5A6zdNM
	IOTPGBAwqpgVRzmyPsrincHiTMifRBoN37gKhiADkY1PGryeVUSwiR2AqFK65r46
	L5ys9+Nwgs6War1C7WpGWV/9hSB/A==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010041.outbound.protection.outlook.com [52.101.56.41])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4ffkc3gw4y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 09:10:04 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SnbCL1TLSymawysHa7/S+TSWwNqFDCsRYlQVgft9JJB4ZdYI91h9Cx7MzO+r5PYqFN4hWh4Vtt/CeqnIvWID0HI3xPpt8uavb0+GqVF3FCsO/iCGm0hPanrM1FNJZiE2tvzSWu3Z524VC0Hqp0gbabZ0wHBcQHM9Un7M7//c/+l4SYFWV4Mk+GxgAtI2n2GkDtb6ekgU1V3XQB6q7YKtIu6KyNdxV4mxUtJgDuRSyh8uY6fjPUaoTesoTo52Wpbg5sHSfDHRwbTFAhLhIxGopMbvutf421r4xaCPIU1DPzKHyuMfvZ3qIxE2OAio8by7zMzCIsL50PCSOR80VUrYHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yADOpUKEJgBWmw+NRru+1mwZrrD53Aiu3+Ecr6tR5hY=;
 b=u5Ar/REFo/xvLXNzNNX7Bqjw5uXs0mM7+hH3reIFJWZqOaggr2SHDma813bUzPPPqH9mgoOLx2UhJt7euchi6G0XHjTIo+ZjpZUjrS0ezXhScmQW0jr/VXXsDwdIsGh42gwJYnrh5X2b5oVOioi+FcLUuvHzjDtNfUe5dV9qgl3zBhhVjsQXGGa8t2XlSY8qq1SfvUzCq/NBcOGG45lQSfuvyjZGwi81z2buN49Sr8hd8s/22M8xd/jCLJ5/nd0V5XCoJ0Bkt2RsomxPkOWEVc4yN6ZXI+P8es5RwfWybLZKF26N58Ye7mpZTFFIgXpLC/FL3K5Jds8zVrcR3F36aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=prevas.dk smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yADOpUKEJgBWmw+NRru+1mwZrrD53Aiu3+Ecr6tR5hY=;
 b=hjJSmAWt2g+sjZ1fRP48EkXeglx1jta5komZtDVvCSggbeWWeGFjlG89PwgBj11jl1uhQoJaZ2hDNQF+8rAT2fUm+B2N37uDv7JM2ScrAuszwK4ouTLJ0kYo2acEv5fr5AHe16G2GPAwD0Pn13cYr5j9xQ3jH7UcFaLgU2qn8b0=
Received: from BN9PR03CA0746.namprd03.prod.outlook.com (2603:10b6:408:110::31)
 by BN0PR10MB5031.namprd10.prod.outlook.com (2603:10b6:408:117::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Fri, 17 Jul
 2026 14:09:57 +0000
Received: from BN3PEPF0000B078.namprd04.prod.outlook.com
 (2603:10b6:408:110:cafe::9f) by BN9PR03CA0746.outlook.office365.com
 (2603:10b6:408:110::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.13 via Frontend Transport; Fri,
 17 Jul 2026 14:09:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN3PEPF0000B078.mail.protection.outlook.com (10.167.243.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Fri, 17 Jul 2026 14:09:56 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 17 Jul
 2026 09:09:55 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 17 Jul
 2026 09:09:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 17 Jul 2026 09:09:55 -0500
Received: from [10.249.65.118] ([10.249.65.118])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66HE9twc3356658;
	Fri, 17 Jul 2026 09:09:55 -0500
Message-ID: <742aca9a-705f-4b52-89c4-c028eca51825@ti.com>
Date: Fri, 17 Jul 2026 09:09:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [PATCH] mesa-pvr: correct INSANE_SKIP for
 mesa-megadriver
To: <rasmus.villemoes@prevas.dk>, <meta-ti@lists.yoctoproject.org>
CC: Rasmus Villemoes <ravi@prevas.dk>
References: <20260717124847.2123825-1-ravi@prevas.dk>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260717124847.2123825-1-ravi@prevas.dk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B078:EE_|BN0PR10MB5031:EE_
X-MS-Office365-Filtering-Correlation-Id: d057357b-b328-4c07-d5b5-08dee40d14f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|4022899009|23010399003|3023799007|56012099006|13003099007|6133799003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	Ixb+ZBRBCJ7HyqqCvUIPXJl+kHcBiyklfGtFbDiimdcgqWNxtV6pa2vg4OsgjFvqq2CIsaiVUohRTepO3Tow4xcGAaquUBXVWGyvpVr9q4njBA9bzlxnx5wvPdO/YfTCr4CgFCgb3mirgslPY+IdA1fTqXtxaM3+ou6asECPGndvVAFTMWVowOBuSVb3agVaED8qSGX9Q+4AFuinj8ye4RcagmpljT7gi/BJGVmObvcvaB72ixqgjghO3CQJrI2T9WIZ2ClzmIWB3TD/yJ7Cprin9KuVphO32cwOrdAnlkF2MGNtSxbfV/HtpDeFQrnekdt+/enasHqm79FK7ybkv687MbaoYaK71SMZaTkT0leUNuwuoI8CUDxQhf+5CV1iz4p55/UTDJ7MRmtI0/1wJKOiv6f247MVGxY8xPU2ZB9m34fGiM0ve4AM26lc9xQH5MHmeQkRrmXOHe4hA3MuMtCJ4vMw8sDyQUaHYs4ZjWaGXlfr6ZvHfW35w7uUkKlgUEcjFSJ2rDxw1rn/AqfQJL2+okXod4Eja8+G892Of6IsoUfDcAf2/stH5VX3304sPKjNzkxjfrQE9DrBP28u8E5ICuXRSTXMJc2ccs6uTjobhxf3vwIiCU+mO56ZOR/TiHdeXw3rSDt4BjojUvDj+g==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(4022899009)(23010399003)(3023799007)(56012099006)(13003099007)(6133799003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	zU4zgq8f6eKHDNSWnQClDjN9JBCdPVc/4qKirFffzkDYha2GlyEaQ48/4TR3STD4349CFjDHyvRht8DDlbsPpQjcL3+PrUhuemCUzzCQp1RV1iNVTxSBwwBPn71kNcC6ogKOHAnir6Y7qrhGRlHtICA14wAww34KPCTqxF0Tl5XS4JZd3En3O0sjbG+8bYYy4BJBqSAqo1diLhJYKEMGmRUunx7K+owbXhDaUnUH3nvRKwOyi5vD6mV/hKnMWSHJ5GBo5MmHkoE6KMfHwy/ZxJn9KUl2MSxLsyQpvL35bCRl8Gf4KjYDsCnOuWn7AzCH9OKizaBkg9VtpUzaTOtzt4g6iiFnb/ZMULGqXrhN5FlwQtnm8hmdnSY1GAPUhaewTEWf5tWiPlkKLywSC+QmRwRhSin1NV5LFgPMqAZErhxXgg/Qiq0pc5vZEl4m6Yck
X-Exchange-RoutingPolicyChecked: 
	APVTAce5SN/8hFBrRA3AocF/vovkL82qyo5fZdMFS2cO4LAwgRFH3AI0UBzM3D8lR6Yv8IGxwZKCq21SDgfLst1tphHbFEcqQZN2blQs/tqHqmGhfkDxrZGOcmjXIb2yDbxA9XpjgZzkar1pubtpC9OMJSuk/ok8namvP9Avn/zWe9WMTAgAveFeTgmRQIHluhbB1G39eX0SFiXSiW716JSFTaze84mECFi8zTy0L0Wu2OV4wck4K/IVpogPA/y1V+4yGGQ7jPYp998fImDI9zG8JijjRbnzlzi4jXvHKo7ccoX+0JxE5hIU77SpHpGE6+FJPU5tWIm1e8xd2qvVzA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 14:09:56.9721
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d057357b-b328-4c07-d5b5-08dee40d14f9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B078.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5031
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE0MyBTYWx0ZWRfX/0GN5+kufeWk
 DLY1VjlAcwrYkhGW+ZuLf1cept7fC9+73GhJavI6+/7u1B0bEybVISP5spAupt5Fn05lIO+bU9i
 l7Ts916dFRBrRO0ATBzeoUQGJcg7ba8=
X-Proofpoint-GUID: qKFehIgZaJHUwMgE5TF6pjz9ufg4wB6M
X-Authority-Analysis: v=2.4 cv=M7F97Sws c=1 sm=1 tr=0 ts=6a5a37bc cx=c_pps
 a=XYu8HXWfxIrayFrXgJv6cg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=iGHA9ds3AAAA:8
 a=sozttTNsAAAA:8 a=mOvODd0uDVzzqOkC87EA:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: qKFehIgZaJHUwMgE5TF6pjz9ufg4wB6M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE0MyBTYWx0ZWRfX7XUu+WVziZpX
 ijHA4r7pcmAfEc5Lc8wJQVYekhocy2axSj+LbTGKnXHXo02fwvqfHihKyombhWuXdNzRHiNsGRs
 J8VHaYtnhw1G7IbUrC2PPS2nJeB7WK3IunMeGTIDjEPKSPLEqsmJNb3cExE1EFZA8kqt0wEIlPk
 ZddB98Rw6e1LWfyOFELhCFGEKjX1dFt9MAt9RxugIso32OqOTwTaFv6ELeIVCu5tgs+Vr+homNH
 mpmLU+eikajhss2uKrNF0wO983wMlkxiJpRgMwq670P6TiMhyNHq6mG7dqz8XvoRHTkkoF6KxJu
 ZKDXuRJ8R26ZqhGGvh0NXIkM9BCKXH/imuFC9gFUCeR7cbVOLsyyJHAT0+TLC+TN+KH6lD8mwpg
 iOma69YHlSeh1OG5azEyO7BqWZ+D+NzbenayKbxyoYPQ8PvgSzmFNQnU1iWdQlTh5aRuWb7N//w
 FIdn7z936y0mEU1Ky5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170143
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 17 Jul 2026 14:10:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20162



On 7/17/2026 7:48 AM, Rasmus Villemoes via lists.yoctoproject.org wrote:
> In the original file this was copied from, $PN == mesa. But in this
> context, $PN == mesa-pvr, while the PACKAGES and FILES logic still
> explicitly refers to the mesa-megadriver package. Hence the build
> fails
> 

Good catch.  I wonder why we are not seeing these QA errors in our 
builds.  Are you turning something special on?


> ERROR: mesa-pvr-2_25.2.8-r1 do_package_qa: QA Issue: non -dev/-dbg/nativesdk- package mesa-megadriver contains symlink .so '/usr/lib/dri/swrast_dri.so' [dev-so]
> ERROR: mesa-pvr-2_25.2.8-r1 do_package_qa: QA Issue: non -dev/-dbg/nativesdk- package mesa-megadriver contains symlink .so '/usr/lib/dri/virtio_gpu_dri.so' [dev-so]
> ERROR: mesa-pvr-2_25.2.8-r1 do_package_qa: QA Issue: non -dev/-dbg/nativesdk- package mesa-megadriver contains symlink .so '/usr/lib/dri/kms_swrast_dri.so' [dev-so]
> ERROR: mesa-pvr-2_25.2.8-r1 do_package_qa: QA Issue: non -dev/-dbg/nativesdk- package mesa-megadriver contains symlink .so '/usr/lib/dri/zink_dri.so' [dev-so]
> ERROR: mesa-pvr-2_25.2.8-r1 do_package_qa: Fatal QA errors were found, failing task.
> ERROR: Logfile of failure stored in: [...]/mesa-pvr/25.2.8/temp/log.do_package_qa.3911784
> ERROR: Task ([...]/meta-ti/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb:do_package_qa) failed with exit code '1'
> 
> Spell the package override correctly for the INSANE_SKIP suppression
> to have effect.
> 
> Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
> ---
>   meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
> index 71e9895b..2ec48c48 100644
> --- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
> +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
> @@ -331,7 +331,7 @@ FILES:${PN}-tools = "${bindir} ${datadir}"
>   ALLOW_EMPTY:${PN}-tools = "1"
>   
>   # All DRI drivers are symlinks to libdril_dri.so
> -INSANE_SKIP:${PN}-megadriver += "dev-so"
> +INSANE_SKIP:mesa-megadriver += "dev-so"
>   
>   # OpenCL ICDs package also ship correspondig .so files, there is no -dev package
>   INSANE_SKIP:libopencl-mesa += "dev-so"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#20158): https://lists.yoctoproject.org/g/meta-ti/message/20158
> Mute This Topic: https://lists.yoctoproject.org/mt/120313933/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

