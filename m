Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9575.1794571894451501737
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Nov 2026 04:11:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=ZUzjgZgo;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=VxwCWw12;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: afd@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6ADBxICW2612764;
	Fri, 13 Nov 2026 06:11:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=8EWEzIi2I0HLBTPR8HiHOo3a80Ph1HakgrwThNWN9
	F8=; b=ZUzjgZgozOr/wtJnmhwdhXllNves0jjkYibfioBpPlZOR0mddGJX5t6M/
	baGD3qyPxAm2NE5MsBck5PMz2/znt3QokI3Pzx9SuoDD8aVc1N04iv0q2LYckb0Z
	mrekoyPzMCj8JLfl86SD/UunawVVM4juz2iDO9xo+fN9otoQHHV3WKylhPRp0ASw
	T//d5Dz5xM6NnUWv+hrsYvfuR6h9Sg2+KGyT3e0oQsDTtCld4DyUF0vI1ys3RZWu
	tJu9ey3QVeUVZtHifS5ZvkoXHjJ+N/7BA4x6qpdBGDt8GzateBPQ4n6SDk2clas1
	sfZ2MHkMTGal+pEfHl6wdpZPqUSQg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011022.outbound.protection.outlook.com [52.101.52.22])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hwyum0kqp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 06:11:30 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P+L1WuhtPQvKvzKS8uscGOinvoiRsMwvJQewMrwedTUac96ryE9L7n31ZfCmehlRcDpF6y+bbx6Q2cxbgrEbxzG3Kj7beK1oSq5/RrMEe11soE2SIQsNpVK7BY8g45ajFYHqmNa7MmQXiMlEOvKzpzovB+OwthVb9YSxPzOzgoUdLlS6Ijb7Jx9WxvqHkfudBiLGHQLiuhNJYqUcMelFrhX6n3o7rOn/NimdXPuRNeOhA9YUWm2GYitdkUD2hTQwyoZpT2ANxRM0ZuKudrJ04RuQPLVpSEiyCo4GUZkJZI6ZlacAspm1mBIZsefgeF+oD80s3SKHEKyx2GajlcyU2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8EWEzIi2I0HLBTPR8HiHOo3a80Ph1HakgrwThNWN9F8=;
 b=O1NGed2e8WB/ShrTtNh7QjS5YVoaaVUS8pQPBIeR4pbNFAM9ED/VbEeMzMTB/LaNs+bxthk8Hy9rlA4+S9p86YFiNPUGAPHrnFBl2ED9G/rQc2Yr4AhyKUirUWAXbNx0q2Y2S8s2kPYQCgRHq9Grg1xw4Maz8hgEAnqI5V9t/amkaiYIfq58nqZHqEyr68AAVoMOouWxk13RwuzIRh4wHqpMh0PdjhKIKlr6+2gdNPl9xDJlxdo875xHHGcLo7gV85ruTLJDri5V8dVq94iHbbyb8rjumeWZfXooKErYqrP0auDFX0fijvv2CdQSQQnmbwnDJGzY6cfKgG4EK6JHbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8EWEzIi2I0HLBTPR8HiHOo3a80Ph1HakgrwThNWN9F8=;
 b=VxwCWw126EReATkmIIx9j/zhSlQr5Vtdo6ytJcSNA2gsaUeKhIreajb4X6dQR8bRvtI92lYiLKXnUClQjZhpbe3Js4J82wQnEJ4iV/RlMw0micJIiFFyBNymNk2N7KvWy/5RxAL4IwcSDik5OXBx4eHoQ1YQ0+mSeesvk9jibLs=
Received: from CH0PR03CA0006.namprd03.prod.outlook.com (2603:10b6:610:b0::11)
 by CH3PR10MB7611.namprd10.prod.outlook.com (2603:10b6:610:176::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Fri, 13 Nov
 2026 12:11:24 +0000
Received: from CH01EPF000BE94F.namprd02.prod.outlook.com
 (2603:10b6:610:b0:cafe::82) by CH0PR03CA0006.outlook.office365.com
 (2603:10b6:610:b0::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri,
 13 Nov 2026 12:11:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH01EPF000BE94F.mail.protection.outlook.com (10.167.244.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 13 Nov 2026 12:11:22 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 16:54:59 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 16:54:59 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 12 Nov 2026 16:54:58 -0600
Received: from [10.249.37.26] ([10.249.37.26])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ACMswnY1757032;
	Thu, 12 Nov 2026 16:54:58 -0600
Message-ID: <b5cb59c8-2e08-44b2-9271-b3766085772f@ti.com>
Date: Thu, 12 Nov 2026 16:54:58 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/wrynose][PATCH] ti-sgx-ddk-*: version bump to
 support wrynose
To: <rs@ti.com>, <denis@denix.org>, <reatmon@ti.com>, <detheridge@ti.com>,
        <praneeth@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20261112223746.1226911-1-rs@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20261112223746.1226911-1-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH01EPF000BE94F:EE_|CH3PR10MB7611:EE_
X-MS-Office365-Filtering-Correlation-Id: 734b3509-b657-4bdc-ce2a-08df417f3b85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|23010399003|18002099003|22082099003|6133799003|3023799007|10067099003|56012099006|261028144727099003|261026121527099003|261102130727099003|261022113327099003|261022105027099003|261021121427099003|261026140227099003|261009223027099003|261021123027099003|261022075727099003|261021135927099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: FsJIMz+e8d4v9c/2ILT9E+EaMuNNc0iY8z+4pkVa5n9ASFHgpwSCwXBEJquHcgn9b3c5M2R+p52BUehUCK6CxVasAKlQo8MrCZKUY5oSRYrLUBWyJAxFE5aZoquj0QLot/3KCBt+xky2BaivFJg5wFtK6T7FeOL++AEOuBVHdYKMKQXRZkExrof5nV3td8I0iVRKO18FiEM/Vf3AFjPiVMzf1kMnAD4fQoxFkXEX5UydJT1acD9DMWClyk2KgWEQHPpcflDdjiwW0KQgl6c9OdATZan9HHBUSj1WLzf3+WrFoJ+vv6nnwNd1ndFN+8+vgvw4cbYHYIz/Xm1kM4tqY/h5Svi6ZooSJT2cOAi++318s8/g6k6S8UuKhH0wGAFp8/0dwK7sQvbCfY9JXLn69qt2f0JRe8hhl8byz9RJYAops1PoZabmuNHrAOJqGDpahtdRnh9OEyZms8b+GmDuDhNLRUzV3ivPkFGD3aDmbqsP+S76Y42oNVeBxcCwweDSYHnc7OIbh67dcls2TPDgHYu5CF37pnDt9td+PTH3B86VgA+JKyv8IVzBH4WPyih8m2wcTHzHq6kLsBDgpyxwDofVHhCL+ld9IHXoXneUsN1EH2UXSGl4Fg+ro2MR1A+OjqjdncYgOLA6NIaurs+xHsEpuZ/3I4V0DSXuAtqwyen0f+xEv5r+qXg1T0J/4GfEmvr3OsZtfrBZJqGlZV04Xg==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(6133799003)(3023799007)(10067099003)(56012099006)(261028144727099003)(261026121527099003)(261102130727099003)(261022113327099003)(261022105027099003)(261021121427099003)(261026140227099003)(261009223027099003)(261021123027099003)(261022075727099003)(261021135927099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: JpKTZy5l6SE0Uq0PYeOOzdjYHAktY+IGEtbEXfw6kbArA4tQAcjyzLV3ybCDy9inewUi8iZHtWh6B/pTned8NQWSBoaRn7qR7khLJmA0CqfBKvsHRxPVh/qyyTj+H0zyzeECaqImhBYm1021mL2IZkpDD9vOa5uTDKB0h/nS+TX9TW0C6s9TqXaXCC3BFJ7CwRQ2rGwviTCtGY3YTZwq4DOBM9lGChQSzm3P3uVfIIXJzWzWbVFRnbE3VD6p6tZ3LNC25EMhyOWHdNiLjd68CPZPygw2ts86do77Ill5tZXMcf+t57RKFvrlwMwIMlCAJ9JhlsAXNDjvD575N2wkThX7e5NmF4MwzdG4UofxwV0tupl9cRr/DaE681Wa1sdgKCjPYEJ/1E200Ok2eJmi7niNz4XLVq8r6EaSkl06F9ZLybSJ6VkSORcdGhACnh3L
X-Exchange-RoutingPolicyChecked: 4oupz2EvPagr/KPtWpLZbO0EH7obrAm5oc4+OMytXbMcB+9/xIA+R3PYxkAEYpJcule6NWS4Oejd5uFS3gyhoyeg9yVngk4Jrb+DADeW2U9C8AeHC4M/PZbPCFrl/c6V+jf7jsLf1gUfzRKd1lcerg1gPvKr3HdW4uqS4/0dfg2vXV8YYFlbRsSLbfyl1WT9TJcSCnWJyB7GKek/rjFXgBCdlgiPn+RSvKFOFqrkLTRdrpYyb2t4s5yGNzv+r1c7wlF3tiTs2ely8ia2O50ew6aGgRg0jfVFywHctAEyEb22P7jbvMyoUsWt/1OcNirbWubB+1dh/YHulL/0Ut1Maw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 12:11:22.4291
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 734b3509-b657-4bdc-ce2a-08df417f3b85
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH01EPF000BE94F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7611
X-Authority-Analysis: v=2.4 cv=D67SufRj c=1 sm=1 tr=0 ts=6af6fe72 cx=c_pps
 a=3RjCkzAZQHL7PUncwJf+GQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=O_n7OeDgjyF21q_Tmw0A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfX8sCdVoyvyDTL
 uMnzY1+tbyVHfL3mXiRIBwPt3JhxVxLLxvi0KcO+MFxuDExvycW7Ex+GHs3G7h08vZsv3rGcgvX
 aHh/yKajk4EZyA/ozN+g9wuOXvSdlmU=
X-Proofpoint-ORIG-GUID: 52-7O8U9MrLZFiuPghzuI2YAwgm8B2to
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfXzBjEHt9u0M2D
 Uw0cpdcu6Ied/INMnXITLPe6juNh9HrqHfqUGyDJamPDAuWYWhCZzdE6yNK7qz8t2H2WUsRgYCw
 Mxp1YHjffVyjb4BnJDvne8F528ynsUqOWAbyN6thOcoVuStk50ntSHyyjzOcQo6uc89PUyp54Us
 l/aJO5ZVKbOHC9SU8/aOcNycgalfgP8gOaONoCx+Qkwde7b5PEILAHd310kXGchA4ZFmM5vTqYn
 SCf8Ur5jfrYgUwGMBrgjvuzAHaA1esE/FJfW36J3Ju+3O4X74gOlFOE/kD8ExbCtZxUTFfLLM/u
 aZ/RbJLwEOxef7V3lo1/Vykn/CJGU6unQ4FPB84bkdLGPLtrKmwh0ovkanDrVsiftv6YCI3TjFZ
 F8trq6GMyPAElTMHnIuWDkYJRI1lthjLWry14qpjRAKQJJI4mRei6PfB9wSnVLBzKXtrHPOnSzR
 0QJEEYAfBnD73nXlhig==
X-Proofpoint-GUID: 52-7O8U9MrLZFiuPghzuI2YAwgm8B2to
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130048
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Fri, 13 Nov 2026 12:11:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20534

On 11/12/26 4:37 PM, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Bump the SGX graphics packages to include support for kernel 6.18 and
> mesa 25.2.8.
> 
> This include initial experimental support for a unified dri interface.
> This deprecates the old mesa interface added for the "sgx" gallium shim.
> 
> This allows SGX devices to use the "pvr" gallium shim currently being
> used by the rogue proprietary driver. It also adds some experimental EGL
> features to accommodate the increased requirements for that interface.
> 
> EGL blit operations are present, but testing is currently limited.
> 
> Prime buffer import and export functionality is partially advertised, as
> required for the mesa pipe loader interface and EGL wayland. The
> functionality provided for these features is currently the bare minimum
> for context initialization. Expect some incompatibility.
> 
> This is the initial version, so you may see some issues depending on the
> application. Please report those issues if they are not covered below.
> 
> Known issues:
>   - Multisampling support is currently disabled as it does not currently
>     work (debug in progress)
>   - A hardware recovery may be seen when initially interacting with the
>     device (debug pending)
>   - DRM EGL format negotiations may fail in some applications with tilcdc
>     (low priority / technical limitation)
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   meta-ti-bsp/conf/machine/include/ti-bsp.inc                     | 2 ++
>   .../recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb   | 2 +-
>   meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb            | 2 +-
>   meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb            | 2 +-
>   .../powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb                | 2 +-
>   5 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> index bf90d1da8a12..d9f59159037a 100644
> --- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> @@ -42,6 +42,8 @@ BSP_KERNEL_VERSION:bsp-ti-6_18 = "6.18%"
>   BSP_BOOTLOADER_PROVIDER:bsp-ti-6_18 = "u-boot-ti-staging"
>   BSP_BOOTLOADER_VERSION:bsp-ti-6_18 = "2026.01%"
>   
> +BSP_SGX_DRIVER_PROVIDER:bsp-ti-6_18 = "ti-sgx-ddk-km"
> +BSP_SGX_DRIVER_VERSION:bsp-ti-6_18 = "1.17%"
>   BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_18 = "ti-img-rogue-driver"
>   BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_18 = "26%"
>   BSP_MESA_PVR_VERSION:bsp-ti-6_18 = "25%"
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> index 343f09de3d86..934e663849bd 100644
> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> @@ -17,7 +17,7 @@ BRANCH = "${PV}/mesa/k6.1"
>   
>   SRC_URI = "git://git.ti.com/git/graphics/omap5-sgx-ddk-linux.git;protocol=https;branch=${BRANCH}"
>   
> -SRCREV = "9ae0fa4998b1c624408945e062bf8fb0ea7efb9d"
> +SRCREV = "cfcc733d3d59f3287574fd4909e2cd4cd9346f3f"
>   
>   TARGET_PRODUCT:ti33x = "ti335x_linux"
>   TARGET_PRODUCT:ti43x = "ti437x_linux"
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
> index 2c20a538b2cf..f5dc5301e757 100644
> --- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
> +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
> @@ -29,7 +29,7 @@ PR = "r1"
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
>   GALLIUMDRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', ',pvr', '', d)}"
> -GALLIUMDRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', ',sgx', '', d)}"
> +GALLIUMDRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', ',pvr', '', d)}"
>   
>   VULKAN_DRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', ',pvr', '', d)}"
>   
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb
> index 03b0b9bfc886..1b53ac39d55e 100644
> --- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb
> +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb
> @@ -20,7 +20,7 @@ PR = "r1"
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
>   GALLIUMDRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', ',pvr', '', d)}"
> -GALLIUMDRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', ',sgx', '', d)}"
> +GALLIUMDRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', ',pvr', '', d)}"

Could we just do:

GALLIUMDRIVERS:append = "pvr"

now that everyone who includes this will want the "pvr" driver?

Andrew

>   
>   VULKAN_DRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', ',pvr', '', d)}"
>   
> diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
> index c4cc5f10ef3b..bd0656a3cb7e 100644
> --- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
> +++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
> @@ -13,7 +13,7 @@ BRANCH = "${PV}/mesa/glibc-2.35"
>   SRC_URI = " \
>       git://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git;protocol=https;branch=${BRANCH} \
>   "
> -SRCREV = "84a396a4fb379f10931421e489ac8a199d6a9f2c"
> +SRCREV = "f52f27edce0e961be46eb4426dd030a6ab17ad16"
>   
>   INITSCRIPT_NAME = "rc.pvr"
>   INITSCRIPT_PARAMS = "defaults 8"

