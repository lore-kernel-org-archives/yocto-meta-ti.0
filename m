Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0173FC61DD3
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 17:35:38 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1822.1788197728845976027
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 31 Aug 2026 10:35:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=hmhPQnrQ;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=ANbi1+Wf;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67VFiw5V129354;
	Mon, 31 Aug 2026 12:35:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=HkULkLI4dwSiRULzQl8zN3z4Ud7Ozfi7XMW8By0PI
	fQ=; b=hmhPQnrQsenvkN0l9wRB+rqcX3DohL6CV4UOPf5GhpzNSqWLxhSafrsv8
	bRvkiueg/jPrElIyBEs3SAGWJ6G1LQTWxYwSYq00WfDdTGiBrGQAByqKS4jQd86V
	Wsp3kEZHkWBV6SVEeGjDh3Hhz504zlW450xZKNmGQ8aafEuc4i3MdsWZq126r0JW
	yX0cKfk8uVzoKWBOUmkL0QtJZxFQ2fp41oMoV5AlI8h7hsraZsKdmwqV2Kkx6Kuj
	Pb/5kBrYvDd6sYJM3cXUw+UpEq8GiHUiVCUrMyv7IDLFM8wdzRnzpNNpgiB9aq5p
	whILjUpfAoa6333nX0CR14wklARYg==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010029.outbound.protection.outlook.com [52.101.193.29])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gchcnf993-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 12:35:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=diHPG8aVvmBrvIQk4/jfRbRXTbmHMSaTqSog/oIaR9ESGhH82wOj4LRkCawitWmtePFtBnjHxPFKlaGCrOmrgg/R25oFTXOzDWhrMuopD4aIalxRt4QyPYwBbzm9XTvUAghZ4Wfy1goxJBjaEZk2+N/o/N4o9y+7SnvjHdMQBx8I75rT/iBaf+swqUH/yV9UFbRG7zoDd++Gn5iNZmfp2nygzPL6XB5iihOkMIEBrmLmjOdF6Yfd86HsJJaw/CLsxUsSVV9PknAvLRKE7FLgVL2t0pDgKOUfBTEbmnHNygm86/DTSoOL8V/EQQdBu6sZMqyXARb6qk3EYP1rGGpO8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HkULkLI4dwSiRULzQl8zN3z4Ud7Ozfi7XMW8By0PIfQ=;
 b=OE2dF/Ofk5a03rrMVAldXUY9nHVbLUjfQIbwR1rG6xDsA+c1FaM2jCrfkriRF6MJRcrUyEyLgaV3FInSReEDg0t4NJQe/fQVOy3c/JFKc2/a8UbscZwDoXDEEjq8BT9ONEq4sJukvKRfTtI1bBmiZvLN8nKLPO3CZpUvn45FYrrsdndO1YgRUnp3W39wLX8KBNgFLkDFAqagrpPuNn0/YVB1Yu9RXsQe3iPJsF0Gw5Hx0OLQ0OIMhSdwBSZbZuI4fX6sX5Rq8N0G0h/j69YA0Ki/qtEBjxrY11ftBIrw1eHj0gnt/vxZahNmVy4HYm6UlB9lauEwQ5lQI5x8YaaIMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HkULkLI4dwSiRULzQl8zN3z4Ud7Ozfi7XMW8By0PIfQ=;
 b=ANbi1+Wf/9BaITZLnHOKGiMXMvnS0UdmyXlPnQc3dL4Jp/5wxSPyT3DKaXN2wZAoyev+xD5AOB7gRBaWUcRAAs1touAQ/syxUOlIFNg96gB1tMC4DxJOh0gQv2SfOhJ97MEqI9ogd8HzTCQybFjJI7EYa20GakI9+1e95C4pucM=
Received: from BN9PR03CA0330.namprd03.prod.outlook.com (2603:10b6:408:112::35)
 by BN0PR10MB4984.namprd10.prod.outlook.com (2603:10b6:408:128::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Mon, 31 Aug
 2026 17:35:18 +0000
Received: from BN1PEPF00004681.namprd03.prod.outlook.com
 (2603:10b6:408:112:cafe::8b) by BN9PR03CA0330.outlook.office365.com
 (2603:10b6:408:112::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Mon,
 31 Aug 2026 17:35:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00004681.mail.protection.outlook.com (10.167.243.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Mon, 31 Aug 2026 17:35:17 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 31 Aug
 2026 12:34:44 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 31 Aug
 2026 12:34:44 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 31 Aug 2026 12:34:44 -0500
Received: from [10.249.32.236] ([10.249.32.236])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67VHYi3G1236239;
	Mon, 31 Aug 2026 12:34:44 -0500
Message-ID: <2d5c5795-f4c9-42d1-ac69-7b97384fd1c4@ti.com>
Date: Mon, 31 Aug 2026 12:34:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master/wrynose][PATCH v2] meta-ti-bsp: ti-rtos-fw: Set EdgeAI
 DSP firmware as default for am62dxx
To: Paresh Bhagat <p-bhagat@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <denis@denix.org>, <praneeth@ti.com>, <afd@ti.com>, <v-singh1@ti.com>,
        <p-deshmukh@ti.com>, <j-sahu@ti.com>, <c-shilwant@ti.com>,
        <y-hegde@ti.com>
References: <20260831094438.2986368-1-p-bhagat@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260831094438.2986368-1-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004681:EE_|BN0PR10MB4984:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d01964e-80d5-4db6-9367-08df07863941
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|1800799024|3023799007|10067099003|56012099006|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	iJhAN5Og7f8knNIn08Awp1+L0r/281ukJVIfChNNMVvqsZjiEh03sZMYx9HIEpJK/hulZ0WiVN7R/KGjnpANVHoQezXi2ts3BGWSRbYBulVQNxOHH6H6AxzeJ73tQYpzDthnow3TNizar5Q14DOOzMZ7HmQcTGw4XIilw+bMNolgyqy0mQXrFWE/o10gf6pDUTElsBpUxuKgwua3uy3+FyQvhC2cG6kM7D4H1EqRWdpBkLelXgG5kMhCX7OpD1RyvhZEkgq6x1UfimAuRJGOC/05/rEIEsnCrtT49Ct39R7xdmrJPCodvuBkQZIKKzJ1wes2ouCRxSccNrzKQ9ly9bvY6fMR1hqOGa0SyCEyrb9QN9wnKMv5DpTso206VGoIuMvEqFNaErfX9BFntEi8+7T0qO2HdjlLAmT2xcIOhbTgvz+6riR3cCRUtl2b+LrT8TRWPW5WJATARdqtU1Q4drz8NEhNpA6+Fs7I9s2R7/JY4QkG7VzSk1UNVvY9kYgK/9xj6F4DQMyhKmviq7RPvCbwRYW345n6w8gIAw3DKbeDbGOyUSz5TYAI7wT7nTMRAXE8oBzMvzXbCZl3pqu44X/B0tu4+ev7lHooZCxEKyfsMVMfDU8rk0rGhN8qbUoQPa/gs322QXKLJUdyD5X4JhaOaZv+jmMbwuM9JoogDJg=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(3023799007)(10067099003)(56012099006)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	BAOIKVDF6bI9LtHkC6xieIoljtlvXb6MPnY6TUiSLBunHpewk2aXRpQcNrDCG4BA3a/402x1MJPGriMQCLbojYVXTtjd5ercJyhQNsOC6nHri96pOvbW3r+qeolsftK3dqU9FZXWAwVHkw4rx/JIe1MCI5Qa7KgFMNq3ReRfsObi6teDxLQK0sGKsU39UmxqRhCo7gNujll+l59jw7WAJ2UZqPnGk4Adw6dmT5vHeH19AHsfEd+H/9e5RkEGwL4G8ElM4KiUBMqPvqVW8RXXCeP92A9Q5xcx9MK4sWvBr5bOhs1cyG4ZT1d/dEQvzdA8Gxa+xwsr/6dkLqL0aVpZM6xeRzsuoYr6fTWC0lNNiD8xx+JE9INtTj4w18vCqDABeKGw3AIyNUCCsRVwCykLFuHZx6kdhwrp7o7o47F6juVmDwfBUtVX/g717996ijOp
X-Exchange-RoutingPolicyChecked: 
	khadYN+tIXnqha5YCZ5oLhSGFArntCAkCek7CWeHUXQC603r0bCyZKieeoe75C+33w5hjMAyQZ98haMev1DAHLqX5JSHhA5AkTyzihcTLEFuQkjl+epkDU9ZVGi9im+6eC+cbm27uce49t7z9evckJdMVo4/tcs0fMrcOny9mYz4mKBYGkHrMxt5wsX5V4vWyFbbOzax4xAMzMK4MV83FbTBeqiS+bp4A6VXHX3YqjB6Wr8/jN6+phplUqwzt0uM4IKucqy3VFXWkqZXJqsEn95YSQsl5zNy3b2tVOc3Uc6DPTNpTTbI6Sgq3oLv+HYV4hAGJyXyntNcgjOCv2y1HQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 17:35:17.6330
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d01964e-80d5-4db6-9367-08df07863941
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004681.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4984
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE1MiBTYWx0ZWRfX0jghL5BMjhd+
 AfWy2iFDgwiOdDo1JyNfRQHjH4muMdnMRVGvcYWvc6YCvIyNqJhSFGauY61VSSkoVU57AfNp3tr
 sOvKcq8sAw05YFAcbKRro0p4ni0OivWLBYv7RlTps/L3UDoaVUqNvA9IMw0GdhlcNW4nvVwROVm
 5AAUrSn6JccM/EsAlBRutvko60IOPldTB8KrxSB36PPRarD4l4DegK7vL+K1+bu8qVHugZFf2cT
 6W4hgWrVN8yx3rnutiXEY1WX6SGibm1uGdFQi/wV1RTOM9nx9FIWNlVja/7Nn4BBhEYybiFpPnN
 YRCazeU/lc86lJhDN2qlSA5vgyUvj8Ein5sEix+9wF8xQyEXUUCveNNDp8NgpSnJ5UqKlfWDdoa
 /1G+HYoHi1YEseRmVU2s1/gyAUeeigEtj25WMtwRKc/HAe6gqPdRDSd/8rlYSrR8KXnBLdh8LD0
 /EqakLIOxXIF1Zhidww==
X-Proofpoint-GUID: WupHgXY3_BJqGxyTeUZvCzwnXdDAQ4vb
X-Authority-Analysis: v=2.4 cv=OpB/DS/t c=1 sm=1 tr=0 ts=6a95bb5b cx=c_pps
 a=sujALEMa9QlLHAoAbbwPUw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=jcZMbmz1usGW6eHLBP0A:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE1MiBTYWx0ZWRfXyvwVPRoBeKv1
 FTcYIQeu8m+6jio0jph+BgUrOmN0EGc3TtdYUQscZoKEpiZe+yk4kHXt61aD0G1zB0evrXYyoiK
 Ejrz/ft1M7ehQKhKkS3JWu2s1WkHchQ=
X-Proofpoint-ORIG-GUID: WupHgXY3_BJqGxyTeUZvCzwnXdDAQ4vb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310152
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 31 Aug 2026 17:35:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20317

Please drop the meta-ti-bsp: from the subject.  It makes the summary 
longer than it needs to be.


On 8/31/2026 4:44 AM, Paresh Bhagat wrote:
> Set dsp_edgeai_c7x_1_release_strip.out as the default C7x firmware for
> AM62d to support EdgeAI and DSP based audio pipeline.
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
> This patch requires the corresponding firmware patch in
> ti-linux-firmware to be merged first.
> 
> Change log:
> v1->v2:
> 	- Updated name of firmware.
> 
> v1-https://lists.yoctoproject.org/g/meta-ti/topic/master_wrynose_patch/120772787
> 
>   meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
> index 20c6b531..aad5ea06 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
> @@ -47,6 +47,7 @@ C66_1_FW =         "ipc_echo_test_c66xdsp_1_release_strip.xe66"
>   C66_2_FW =         "ipc_echo_test_c66xdsp_2_release_strip.xe66"
>   C7X_1_FW =         "ipc_echo_test_c7x_1_release_strip.xe71"
>   C7X_1_FW:am62axx = "dsp_edgeai_c7x_1_release_strip.out"
> +C7X_1_FW:am62dxx = "dsp_edgeai_c7x_1_release_strip.out"
>   C7X_2_FW =         "ipc_echo_test_c7x_2_release_strip.xe71"
>   C7X_3_FW =         "ipc_echo_test_c7x_3_release_strip.xe71"
>   C7X_4_FW =         "ipc_echo_test_c7x_4_release_strip.xe71"
> @@ -101,7 +102,6 @@ do_install:prepend:am62axx() {
>   do_install:prepend:am62dxx() {
>           ( cd ${S}/${IPC_FW_DIR}; \
>                   ln -sf ipc_rpmsg_echo.mcu-r5f0_0.release.strip.out ${MCU_2_0_FW}; \
> -                ln -sf ipc_rpmsg_echo.c75ss0-0.release.strip.out ${C7X_1_FW}; \
>           )
>   }
>   

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

