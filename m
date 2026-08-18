Return-Path: <gehariprasath@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53BAEC5DF74
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 03:24:18 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1452.1787023456333111882
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Aug 2026 20:24:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=iYGB6Vqe;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=RhP+WQjY;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: gehariprasath@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67I3HBjq2632394;
	Mon, 17 Aug 2026 22:24:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ul6Gi+kaMVTgSHLO5jsVgMqzJbhsJ6E5BfqngbyLT
	r8=; b=iYGB6VqeshbL5uXLmTFW3mu0qkWFWREvLZIZGLBH677YnI4hrwXvNCanb
	LOvBFRBMV2ScPmbJt0fj+Q6BrmhaVPW6kls8Vo6vYK2aEV0YXASBtQO7p67eT7Fk
	u1tsY4tsRvBO3zdpzo0EGKbcBVTr+Xn5S+H8HIsGY7KG5JpwjtewcAzMkeg9tHuf
	XIgWu7ufD/RSNVn/xZimH0m+Of8Shi+6BVD1ZIwiiH9acr9OTZiYR4BgfNo+tsjZ
	ZBXGw9vrZ6izz/fvYLYbmCirMzBf8GRtmpVIoBRc0QTDAfn49ICwnxPmZXPUZSt2
	2RTic4SoXJRKQoYnouwo7ZJsWGjIQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013021.outbound.protection.outlook.com [40.107.201.21])
	by m0380145.ppops.net (PPS) with ESMTPS id 4g4fbvr0yy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 17 Aug 2026 22:24:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y5EdmVBQQqpNMEzBvg/IWLqNgDzIOMc3HAYnN8l5/w1UhCqSs7VWZaa6he64WpoI+NmnEOM+F+JBzEQ+yg5tLOi5urDCAPq7y5pvJLyx0NDKbFOqBNYq21n8wCYxCVSVsPGmSM/c6G+Y7Al5ySZJuRwpIBJPz6eU5xq1dOitj0Rxx//stmxflnM45N0+EF5MbRJziVn4VAcpFZySfQELRmcixslLfb2q6CYNuLezrgqGgMTXT37eM78dzl8Vq5y2IhWNShrIXqtnoI2+x6V+tml5iteRa3nfEtcx3JaE05J46E6aNO91Hvqx5vP5OXIvWYr8i0rOvCz01ENPc3XJ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ul6Gi+kaMVTgSHLO5jsVgMqzJbhsJ6E5BfqngbyLTr8=;
 b=TZX5eQKiczQyNxT/JJSQMn+Ai5zpbJvpnnJ2+Kk7QLrC0rKOYX0sLzi9s7KkAnE7xN1X9Ul5P4vC8CQE7vrZsOb/yo3zeEj/w1U9rz8C2DPnD9o8HLvz744XrXhaBzo1PdnUl3XQBnZlXycwebtb9S0MaqvRrVm1VEC6RxFr+8bYHD0EhGVcu+sDe5ups4qr5xHPhrZEsXOZb6Ra1t9xYeZzNhBbPGyiZXEoWOAqFt1oYsuClcI2M7V/jcWr9Jv2d+TCKuuVvV5EpSzduaA/KoU5FwQXVg6FmzlMR96z77I0nOH0xXbuva53bSBQYHL/mKZtbMXDnCp9hTQ+2g9foQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ul6Gi+kaMVTgSHLO5jsVgMqzJbhsJ6E5BfqngbyLTr8=;
 b=RhP+WQjYAOay6e919G3j1OUwWJzFjZgGW1ydcic2T/z+DHxH4FWqd+iUJHbPtp/TD1n4uZBtH/BP29zO1Z+W2AIUEh8PFfUmfP167afNshQJQ9wOsVdoT2uhIbnFx6eBeCyHjUiAwsZi++mBAe9/qKiJOW8RsKv7bbcrrZsyuzM=
Received: from DS7P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:1ca::6) by
 SA2PR10MB4572.namprd10.prod.outlook.com (2603:10b6:806:f9::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.17; Tue, 18 Aug 2026 03:24:11 +0000
Received: from DS3PEPF000099E1.namprd04.prod.outlook.com
 (2603:10b6:8:1ca:cafe::9b) by DS7P220CA0001.outlook.office365.com
 (2603:10b6:8:1ca::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Tue,
 18 Aug 2026 03:24:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS3PEPF000099E1.mail.protection.outlook.com (10.167.17.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Tue, 18 Aug 2026 03:24:09 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 17 Aug
 2026 22:24:01 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 17 Aug
 2026 22:24:01 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 17 Aug 2026 22:24:01 -0500
Received: from [10.249.138.105] ([10.249.138.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67I3NwvK3823018;
	Mon, 17 Aug 2026 22:23:59 -0500
Message-ID: <1316e659-0bff-4569-a867-ee43b16423d8@ti.com>
Date: Tue, 18 Aug 2026 08:53:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master/wrynose][PATCH] ti-rpmsg-char: Bump up SRCREV
 to tip
To: <b-padhi@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
CC: <u-kumar1@ti.com>, <hnagalla@ti.com>, <afd@ti.com>
References: <20260814080612.982165-1-b-padhi@ti.com>
Content-Language: en-US
From: Hari Prasath G E <gehariprasath@ti.com>
In-Reply-To: <20260814080612.982165-1-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E1:EE_|SA2PR10MB4572:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ff5524a-cd57-4c6f-8ca8-08defcd82b26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|4022899009|82310400026|23010399003|36860700016|376014|13003099007|10067099003|56012099006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	QZWy0akgf8znyOkwh5ki2H13Kd79jkHDqBvuFV3i0tksQAEz57TA3MD/Lb80VKrg1ujeg5iICe24a2Xz+0f2ZPvEIU0Y1j8cjeRtJFR+GnyQ14x+f1K4hpD2kWOmIJbie3JbrYTH5/BomF0epEgZlvj5ZprX2UeL/DfGIw4rXbmsPxf4UHI56EtbfYukt24hhpCg/fZbQ974kbNZKObm4mhQXFU88t5Nqd5KZQ6eBvt1UPDarwdWywqsju/gssU47h7uT59CSr6SbZ1iYHUgQvzpmEvxSgwNt2yHn2PrHY3VEXcleM8WFqLH363Vx5mYvYzK/IopSOJ6BzmmalikNNbP84fDyuGVF7i1CX4PzoITEMVjX+sfqGG6Cze4yAx8KS+TGCxMNKWZa+Q5P54qeDrhGK4S7OLan/0Blc3pM4wYRJZiI+eQKzSl9gRZn9QaEjQ6zQeEHJvsQfmqtvGSww4PeshVG6mkpKiY80wkuIfktgz8cYMAa/etljRDL9sAwsBZQ7opkEmXn89UPb47cNWjr5k/sZYM422hFR7DTeVe7fqkFrEKupENeXDv02CA8cmmKRhEvA5TVAowFx1N2OoMkipovnF6MCai2ssbNQqcqpWUO1rPXhRX9yM5E1mnLt0UFZ8aR3dlMbBxLqeMYQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(82310400026)(23010399003)(36860700016)(376014)(13003099007)(10067099003)(56012099006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	BMx19P2QlE/rlWKK5wGIi3Hv3f+Pvrff4kSB+yGreRi7V056M2ymInPK3H//KZ7XpPSk31b7mvC2LNCHLbjq0u2xfr/Nbgms4NTK/lMjhhvI1zoPl/jtIRQxLA5TGAraAlsnmjeTaWlAlKMhUD4Vm0S989mXEtcdGRYUsPfWerx3NFUGUvR8IO9GBL3P9wpHOt9ebXxd4PWx5fW1OrnQ8J4iIyonlV2DKQjbf9m03OqlBaKCZ4kPkSs4r2++cTt609P/cMekU6iX42yhspHqvkDJp9q71zdPZWTqRTE1tPUGI6L/YNedhboE5FW24Gmt6QPUydsLaHAiiUPM7zPx0dJjFnqtIf2SZ5As1evoOxCHM/wAVJWM32ti/pSRq9hGkfL/f6zTaKje0AsQhqr7kRU51VCbRn+3F4924TyWsZ30R30/Azycm0GI3hUbMYow
X-Exchange-RoutingPolicyChecked: 
	k1n8S4Jhx6Vn77N8MBPAbhkvlztxZwPNGBhUjxG5yb5r+WqO0KICE5U5EITIfAJwUAN1GMt0Ivf7BOcgbvvUhstOiW2DrwLPZEJFEtiYM2BevM8chF/crcz3PJL6/67J6P0TiOKaruP6EBIm8KkMvqZ7dv6rASuK9b9SKZY7Qgddo1/L9PfrNKOHwFg9D8FeJJSvtgN3SpqWI0s0aSRjqJeWsM3kLPk8GdwohqrF34nkg0HUAfCe08oFFeW+8njLbKlyG0H88HupV4EpV9CEjWs27s5MNrO9lRjPRCNTPZpZrxoMOEWWbEeTgoBzLvicGYt7DNPwcNZ91JiJVC0D8w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 03:24:09.9019
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ff5524a-cd57-4c6f-8ca8-08defcd82b26
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4572
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAyMiBTYWx0ZWRfX+3Q+qHZ4PYJh
 bffYDaVc1NrtWVr9jq/N6wJBV7lbPlfFob09ezV4Wamj3q//oIY0+jeevgekYw93qrgojaGUosH
 wta6i502SePJf7WWWgAsVHlk9LC/Pjg=
X-Authority-Analysis: v=2.4 cv=LfYMLDfi c=1 sm=1 tr=0 ts=6a83d05e cx=c_pps
 a=L57JwnknqhavsmPomW3F8Q==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=LBcXfdmU3gMlFTNW8qcA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: 1u_p_5ugYyY_pER9j37AUG2y1zxKFNam
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAyMiBTYWx0ZWRfX2HYmpM2JDItm
 4IPtuZL5PWX13ZLu+OuI6XeLfvJwa9gl/9FWPu7oXirYEjGudYBt+ly2DoNQ0+G4Fj+AQuqygqc
 1q/0zNQnEGgW2++o3wfoOTEb8MjGlDtuL4IIVOMYq8si7QqxVBONvnk7frjLpoIXldJZi7KSHWH
 jpY2nlHz7lAE14vvDzjISBExYPtKzvCxEjd8BLsfS2uE7kWHRsKm+UbMsKSSjJTFliS5FiSmRKy
 /qQtSOOHjOZYq1p2FDI4LUbLvYeJMYNcql6mLUf6ULHUFWUJjSRH0c3jB2ukeoBSDBtmoQIfM8b
 fWJ2x0aJ/x9Fm43ZEg7BxqEZF6WB5xf6M4iTZx55Vd5iISmHKZMxWkUyFsWrym7ig4UJrLZT867
 Fa01WUbDfe1vnk3UZk+FEzTY5QZLHIlMpk0fYc20N7sPt3i812TLxPlD3J8L39id4vXxbEYEAHv
 iVQxRLncP8biLhlrMwQ==
X-Proofpoint-ORIG-GUID: 1u_p_5ugYyY_pER9j37AUG2y1zxKFNam
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180022
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 18 Aug 2026 03:24:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20270

On 8/14/2026 1:36 PM, Beleswar Padhi via lists.yoctoproject.org wrote:
> Bump up SRCREV of ti-rpmsg-char project to the tip. This allows existing
> applications to work seamlessly which require to know the allocated
> local endpoint address from Kernel.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>

Acked-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>

Ryan, we need this patch for Wrynose CI/CD promotion. Could you pls 
apply the same ?

Regards,
Hari

> ---
>   meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char_git.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char_git.bb b/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char_git.bb
> index a0043caf..15fe8062 100644
> --- a/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char_git.bb
> +++ b/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char_git.bb
> @@ -8,7 +8,7 @@ BRANCH = "master"
>   SRC_URI = "git://git.ti.com/git/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};branch=${BRANCH};"
>   
>   # 0.6.11 release
> -SRCREV = "e36103aac7d9f6d64125eb917d3c69022cb86e0b"
> +SRCREV = "b1e4d172f39081db81305fa50ccaafd3ef8ae3a6"
>   
>   PV = "0.6.11+git"
>   PR = "r0"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#20266): https://lists.yoctoproject.org/g/meta-ti/message/20266
> Mute This Topic: https://lists.yoctoproject.org/mt/120746061/10119719
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [gehariprasath@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


