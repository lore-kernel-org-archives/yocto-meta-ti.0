Return-Path: <danishanwar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A5EBC43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 10:41:53 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5425.1783507305448911210
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Jul 2026 03:41:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=NXi/Zt5w;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=Q34FXV6H;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: danishanwar@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6688AdRH1800360
	for <meta-ti@lists.yoctoproject.org>; Wed, 8 Jul 2026 05:41:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=R7wVfX6s57NW6/ATP5667EW3zVU3itqLHZmOJtDYE
	aM=; b=NXi/Zt5wvs5mnqEbObbWFnKTg9defbhFJa/tpYW5s36YhGQYNJLmits3z
	GZM6kYkmxwSK3xMra5NQSz9EiMDseD4VUb/kGMgyHUlJ+V+T55RyC5YSfW8XvYsM
	egscfusff7ovatfSSiIuXD1kaM9GPz921seAfFh0uzPshRqY30TdncmAz3qIRtyk
	C4ziQ88gwkiIj3fWL9eeeWUTlO31Cjq8poKjDrQijY9kYG4hi0drexNW0mHIsYpx
	wzcT/6m4Klq7x428zU+dwQ00WU8HxEMNFTJfRaUmzM/WLcXjEh3MDv/vCjY3XYfJ
	I0d43tsM2s9EsJKSkFtGj0oOwcgtg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010035.outbound.protection.outlook.com [52.101.201.35])
	by m0380145.ppops.net (PPS) with ESMTPS id 4f9dpxjcaa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Wed, 08 Jul 2026 05:41:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JUzCly7+FuQOWiE5psSPIg3cAhm4kl77l5RDV6AoNoyTsdUvAZK7jYkng+sV7TcECvNUBLJao7/jLST9FZGvTZqdB+Hox1vGchILVAJ01aTPP6LUEOtrNoQltH6/itIZL+vKG4AkSKbekByeQRWBQVRji0qk/4KQov4Li8InDJH9W7gkWesoIu/8xXG+8uReM+xge2AWo3R97ib1tHxbLy/U9JZ378lRutRmU7sjZzZ9vbMb9yOMDoL8I/dICp2s6UqLo3zohbCT1N3kv5vDsKDHGaginPGL7rExJRzgBbw5wvaX+Mu1mW1DTCl6Nkbk5qybFdFVE/lb3VyOT+/ddg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R7wVfX6s57NW6/ATP5667EW3zVU3itqLHZmOJtDYEaM=;
 b=eSs9IvMng338lJOLYofkPKVKbP5wpaDHvmTaB7CDyb0jgRS9+i8IrEEdiIuWkgcnygtdVGCat1m2/Fq3Vx+HZRVcg37ZXyFkyInBv8DiSUZUn7zmz+epyV86Ie8nNMXbjyFapEVPL8HEUNXeSwtKROkPIjJyhyFbTglstKIpf+FQ1HsO6PEd0k4i75S8AgebzJSF8Ts/fydYNM37w7ohSLnQeQTmrAS7pt96qnAObgfbYbFP/Ccv/tFDNr34uFzdIKLUxKpm9oIILkqUzVYuaCwjn1l8btmvkPbnfZ+n/PCW7gy7b5xim9JcHRNCqDJe5NnOD+r2f5jMlxtNO/ZcoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7wVfX6s57NW6/ATP5667EW3zVU3itqLHZmOJtDYEaM=;
 b=Q34FXV6HJEiIUsf+NI/v4nDRgQxuBAMrPu0oFi1SuO8nJHDZN5tgSAa/jEkJJLDMXBH3gSXxzKZAOLXN6k8Iv56UMIVWPLc/ebOmI1qB1unmI2IiUOQtAILifSRevJl7pUggARPtIJlLJdPgag9y/oSsplYDFtv+gy/t90g7aMk=
Received: from SJ0PR05CA0009.namprd05.prod.outlook.com (2603:10b6:a03:33b::14)
 by PH3PPF81242B68D.namprd10.prod.outlook.com (2603:10b6:518:1::7b1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Wed, 8 Jul
 2026 10:41:42 +0000
Received: from SJ1PEPF00002316.namprd03.prod.outlook.com
 (2603:10b6:a03:33b:cafe::5f) by SJ0PR05CA0009.outlook.office365.com
 (2603:10b6:a03:33b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Wed, 8
 Jul 2026 10:41:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00002316.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 10:41:40 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 8 Jul
 2026 05:41:38 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 8 Jul
 2026 05:41:38 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 8 Jul 2026 05:41:38 -0500
Received: from [172.24.231.152] (danish-tpc.dhcp.ti.com [172.24.231.152])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 668AfaGj1987844;
	Wed, 8 Jul 2026 05:41:37 -0500
Message-ID: <e1dc0bd5-fb79-4f7d-87ca-025c34f97edd@ti.com>
Date: Wed, 8 Jul 2026 16:11:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH] meta-ti-bsp: Add pruprp-fw for AM64xx
To: <meta-ti@lists.yoctoproject.org>
CC: <j-rameshbabu@ti.com>, <reatmon@ti.com>
References: <20260708104003.1287599-1-danishanwar@ti.com>
Content-Language: en-US
From: MD Danish Anwar <danishanwar@ti.com>
In-Reply-To: <20260708104003.1287599-1-danishanwar@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002316:EE_|PH3PPF81242B68D:EE_
X-MS-Office365-Filtering-Correlation-Id: bfac5bbf-1d50-48d2-52dc-08dedcdd7e95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	VFF6cnXFoOz095tn5+DEjOeTQx/Ga4MovSDgK7ziA9zDxKgE5vgPS9Mr74s+yaqjnRNssZVlETZeSVSWiL26fCScuHy7fC/p59OnEh6j831dENQTEWsmJkcTScYsYKUSOGCxjQSpknHNQs4RW3KBATaldBhVt9sRNK48AaG/XmotxjkNuvi/S3b980fFU/DzJvhAiRYWjWKkVKx7sj2jjgpzghlkzPfLy2CPCVDsjlgJyazcRFsXN+TO3HurwsMLAG3PKrJeP72GMvpIIIgTx1GBX/eW2xJWAO/8ZPTll8aJQoMb85NNdR+U2yERLX9w7Lpo8DqsnUTQxwWrXQWUuKgjzEfEn7BzTz7SEfOPJIFs1d4j/Jq07omAl9Vi7752vt8USdSFnMZKbIl82FvEyzGnd13gwwrCkdDkYek2nPGwjEEsYslUJc0Va4qLrxED44X9gZqO8s9ZwZGDq8l2E8OiS3wvAOuSCZMJxsy6N2APrqcyfFMLpajZt+Fr8DefE/y1eu5mZn2P9u0vWp9v/xMOjxcd6QQTsvAyuiEw2wcMaZ4xoUgRsLV92fYG7jMhdCu55Jy1SFvl3qoVoqJhvhvNkNMQubEHpwTPWu5i7s2HozpC4cgh/cERVMskZDFhR6Zm2ue3hTh9qazi5bf+270uQk0i+kzTWCR6iy/hufKU9jyDZdM4nsz21rRLfrerwaFvk1+iCWRbdW8uwroqCA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	YUt+J75jehtjYaeFA011MRm8AlfRFwe0rDU2EppW3M5NAUHgKNCiWGmyKcbNSJM+JNZ9rAiy0uPQoZNnZvLLE2t+K4bTN0uL24tEgoU7St0IwtouRMKC/aJym59U7UB45GsLCOVkVokVOHMoFpWtjOcE1yM2fLtPHKi6E0l/YmcmXBgOb8WLsRpDAHXV+9kv/xzsZCNJbW7Se96s4mHcECWkp3BXF+P/isClWMqHKl1HW6shoPsTTbkGOL7KwuKwYrJWvygpf93MPv0e5afy0H9J42f+kDpMaE9kEjF2kAuG1AS/dxiUxAiCZZOu+mgrLlWfy0Y5UbKcJri00H5rtnxKXj+cl41GRF8PIV2Vi/P8Xo0SvnjjFohnGAnU7zsnrndcp+7yxXbmYDPd6DgZnS7grxLtJsps+xqk/TatV4WotlqG1I8WHZLZeHfmDrXM
X-Exchange-RoutingPolicyChecked: 
	PjeWtFSJiGQqYdkJckVIQxHa0/b1j9r3GmNybbKYQdoPQMrUtIlSF2X6VINupbe28AD5noZ1unAoTzc2fe4PH5+OeU8GzJwEF14ke660hl9LCxK61LkMbLJETCElWE/Xg6LDbXGTcs0vrWLl0elf/zNAPXtX5OjLAg9P17PBX4wYPjd/R+JKxpPTL7gJJYu5lVJPc2Yu6VcZUkAV1jD7UhMf7DCtOsVXFAeOB5nVmG7UJZLGyFibYeKNt8NOBzIzcpTr+OrqqwId5c1GnW8UAtuQz6cna32T0NsJIJZ3x59Hqy2RXA2FBYdWWrrCRLUa16WXDeIwRIG+ABYwq+hfyw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 10:41:40.1459
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfac5bbf-1d50-48d2-52dc-08dedcdd7e95
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002316.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF81242B68D
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEwMyBTYWx0ZWRfX6S+KndCNgb1D
 D0yFnh2x57gq69wt78Gwa3X7AQONGna0bGA9WcuoDeA930NeJSdBLRSJXLGiuCW16WbF5ZL/ZUJ
 ieef3gWZCLIae4VffGQxW/eph6clxF4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEwMyBTYWx0ZWRfX6RuFhbB+V0zR
 yg3lQ2yh3bgrKfFrPL6EOKVvLMy/1JhWsiaGA1Ugqh6rNRQpoqQe4GSkxKvwo7YQqV7c0BFFhTk
 24OuswtiNBSo+TGRDjU5Axuo5Gapg3dis+AGG+H8wghcQSOHQkBWOyR4ga/g1Rcyr4eQ/peVKuk
 ThWeOmjkIA1B4nQsQJaybW5myg/cg4KUWgqvHlbaE0+kXsp6xeW67aKItWcqZ3NV+NEE6X+9moj
 vQpn0G8B7dbkfq4b8CeXMvLjIkoACyJHk11DJQkGM9axkG7ZN/IPBWQmEF0dant15dLJAZaIeKl
 EOGqKWqAZA2BEvVpTQONw9B6/1JJaxSNHmd5qD3uaiicpk8OvNEjcgenCTX1tV6UkzoG11L5ASf
 yNG2STWyI6n6sRqg+VHxBvuVC6xOGz7vahpckOvmqmWXHI+Ph1RxV4dtlwz5lQ3Y0Z6KDxPfEOI
 Hwg1bz8atHMSwHGj8tw==
X-Proofpoint-ORIG-GUID: IveURbw_MPg9fLraRmfkw0ZE8cNSQFOb
X-Authority-Analysis: v=2.4 cv=CIoamxrD c=1 sm=1 tr=0 ts=6a4e2969 cx=c_pps
 a=gTn3qzDU66SAkKtIq75K5w==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=qmKAGz4UQIqg1e5hZz0A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: IveURbw_MPg9fLraRmfkw0ZE8cNSQFOb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080103
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Jul 2026 10:41:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20127

Please ignore this, sent by mistake.
Sorry for the noise.

On 08/07/26 4:10 pm, MD Danish Anwar wrote:
> AM64x supports PRP. Add pruprp-fw to AM64xx so that this can be packaged
> for AM64xx
> 
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> ---
>  meta-ti-bsp/conf/machine/include/am64xx.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
> index 33fc6240..aa2dd1ec 100644
> --- a/meta-ti-bsp/conf/machine/include/am64xx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
> @@ -28,6 +28,6 @@ TFA_BOARD = "lite"
>  
>  OPTEEMACHINE = "k3-am64x"
>  
> -MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "prueth-fw pruhsr-fw prusw-fw"
> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "prueth-fw pruhsr-fw prusw-fw pruprp-fw"
>  
>  TI_WKS_BOOTLOADER_APPEND = "console=ttyS2,115200n8"
> 
> base-commit: 9a30c7b97a979fa66cb22b2c2ce1d3b7d466ee24

-- 
Thanks and Regards,
Danish


