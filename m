Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.120.1794412667529515971
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Nov 2026 07:57:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=einFatfP;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=ESQRt/sV;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6ABF2orZ616812;
	Wed, 11 Nov 2026 09:57:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=HmXiPd8FqEE5GilT+CEozsnMbrtlmL9u0ONg/kCK3
	7A=; b=einFatfPJixYv+rcPH7TzfI1N8ljpFThOGGzzO7IKMsFEu2sj+VhlT5Tx
	WF1d9VELeTK3LEqarNmKYHQuts8BKABh+Kg2gcerwkuKFZXqZzYJB1CQem3IWGBz
	K782XddHJz288C2AlM9IijlnboI37TK696WtPJ9wHhVdlu3+yhUR1LneQIks5Irm
	VcSi/Ru1X330Zlz9vp2czub7acO4VndyHFdU/Un+RnPLnQKp/DTGp3RpTI2D27Dy
	jzuKG9Z6DWaW4zr5WpajgRHbUgxFU7kIlo0smm9ylYO7tJY687oU92ySjuvYoaR2
	73x9JTLet2yY8K9a1xr9o+GBENejQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010007.outbound.protection.outlook.com [52.101.46.7])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hveupv81a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 09:57:46 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gkM3sFx4tFy9m1efVHSMHCf7s/aqXfiz0emj7C6M/RqjMJM0N523xnldvKa8ECE5heMSr2uFG2jrdan9D+C74+fWMlhheN1mRElDGbBx48EdROteHO//IYWbG2NcU1siu+kk8XoGcp4fQJWmbBG7g/6D2WP5I9UAyJKnP+8NfOHD7vIg6Zw2Id9NJJwNYTZlOt7rmiWkx5FDx8UmM9iAXg5pbhA4R7ZAnCtMK3Hd5Z86LA/cUCgOXDqJAfplbsdBaUEos5ZW4441cMxuYdLVGgr3O8VgsuRxxUe33cTryqZTeIz6vyEI3me4TeBvpoCSk3UJdwhx3dlf+X4duRxuDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HmXiPd8FqEE5GilT+CEozsnMbrtlmL9u0ONg/kCK37A=;
 b=Kv/nzyw4+i87SV3GuQTmWO2YPPfJArbum61WNsD63/meSdu+G5rOg9fRm1QN9UW9lJKDtfYQVWhBIC4wHLp9Fr9j7j2vSU6PEWoz9/BfEGtLQwsqQvnNnIueiHQZbuzaj5x5jtgJIZcb5vZOAKEvwsD6GRycgGXJRr2ceNUWmM6+tApwGQRA9imFpEaWkZmsK3Jj6jgLJu0ZLC6YELy0I/jpZwYN6dsY2xzm6HJyd4BfOgRb+uSF6VNx4p1/BA6dGuqXUjOZx5P1ib/H4Z6qE4biVMrEpJx6EXfqJHXuHo9NH2p9qALZmo+kJ/869QN2PEuS5NW6YPanA+7TJsAHjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HmXiPd8FqEE5GilT+CEozsnMbrtlmL9u0ONg/kCK37A=;
 b=ESQRt/sVQWF7FhOqOQP07Ya4+7CEY0PFiDHGmKPzX85t8nX6AxFkx9Nv/QYT0+zh3ri2vrp9IxVcUj/sbhiCLCWAhrg0Ath7aS3KCrfUufnq7dtCm+Kex/8Ff/Gno6nAf5ay/PEoB7csLE0t8mAE5ciKXrC/lU1lMCLu1F0QQHk=
Received: from BN9PR03CA0369.namprd03.prod.outlook.com (2603:10b6:408:f7::14)
 by MW4PR10MB6348.namprd10.prod.outlook.com (2603:10b6:303:1ea::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 11 Nov
 2026 15:57:40 +0000
Received: from BN1PEPF00018548.namprd05.prod.outlook.com
 (2603:10b6:408:f7:cafe::83) by BN9PR03CA0369.outlook.office365.com
 (2603:10b6:408:f7::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 15:57:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00018548.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 15:57:38 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 09:57:02 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 09:57:02 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 11 Nov 2026 09:57:01 -0600
Received: from [10.249.66.236] ([10.249.66.236])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ABFv18m008639;
	Wed, 11 Nov 2026 09:57:01 -0600
Message-ID: <1eff9ecb-c71e-4705-9cc1-7ba615514bb9@ti.com>
Date: Wed, 11 Nov 2026 09:57:01 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [wrynose][PATCH] Revert "am62pxx-evm: Add OLDI config fragment
 for Microtips MF101HIE panel"
To: Rahul Sharma <r-sharma3@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <denys@konsulko.com>
References: <20261111105934.3239366-1-r-sharma3@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20261111105934.3239366-1-r-sharma3@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018548:EE_|MW4PR10MB6348:EE_
X-MS-Office365-Filtering-Correlation-Id: af9d505e-a75b-409b-de15-08df400c82cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|261102123227099003|261021123027099003|261021121427099003|261022115727099003|261026121527099003|261009223027099003|56012099006|261022075727099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: OdvrM+dYLnNvn/jdSfErOx2UZj/GBYW6EnBxw3E+GVHFBhUFsHi+7HNsTQURHKez9ZVIedaNZf9MdZCp00qAcLMx12uFjxBHJYJZ5WH1SqhV46D5fFVzRjeVyDwko34gvw9J5fdZt2W4bRaym2bVF3LPBDteiO3JIN26OdjITUCWVgXRfCyGmJS6M627ms+OyCZ+cHFvt3sl941KGnzTBoW4nMIIXSaeQsRbX9IXulRBnel+uddWDiptKbRdKex7vcx2pW947UqX8XhyByj9NaQQuwzGwDcabsDgJbJdtY7/cSh64QvRFIZnsWVXn6uaQ32yxkJHXgABy7mw35FJo5iEM76TMeEikuDJ4UIItWknOhemJMLlH9OsH8ZOS8fLme7TfH9LYV5I0hnyeStzepycW3301F1GI5HaV388/mnoXHZyOVzj4Rma0Yk/CN1lX08r6ka8B5QcJstZtS9RXHlcBRF5Eq20YccS4SM1o81tfoo96FPY83QnRLcUOVCG1+ERFvneHBaGzxkGNxHOHpf4HwS+2SUmx+cqGgKXtt9jnS1lTIJT7H0r8IcnmQnrjw8O6YF0TltReSygFzYTP3wrBg1A8fd3lKJjNS+pmiGh/LKdApf7k2m66hMW1api5YH5g0KmHzjE0wa8p5SLVr1NIk7UwDA8KAvh0Bx0doa8SN3cwSF5KlhJ07nT0IfbI8PM1LyNEgXhJ+dmxJBcMA==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(261102123227099003)(261021123027099003)(261021121427099003)(261022115727099003)(261026121527099003)(261009223027099003)(56012099006)(261022075727099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dTeLG9PmLCcfo3dH17y0v+0k5avrkxi6Q2wKtx6TnA4PIOMfspzzDTDgAKn7qOlUGpuNx3luQl2NEXvIjA7lwK1YKlN9rZ9YCwlDiPX231fR9C6047YA6rnomb8TASQY4E/tdS4WEENdkyw4lMDMuGQV0AQAqRHp5Cz0uh/c4LrxrZHzWFLsveaX4GmKLmLdsZJjT3SuwRFpQABzYOAw0DrDhspc/Qzbmr6DJK6wTV543faWtjalHyhk2WKXRNS8/bX01USQDzQEiJ6fRcFIChlMRKSfjW4TMT87nIoF+o5Sb7if05bn8w+R0PBrVR9+PmmtVpBcDwBsUlwVf6emEdxXTlK87yvenbh9O2Ok+HTIHdmMLdx+Vky3wt6rDHr7emVJbDoV3aLf3kdCTqeQ2m6NPoAfsPCYarD+NTVqjx4B+GzWlGBdvQhSYfVPlYOD
X-Exchange-RoutingPolicyChecked: 0LTN5OwOR3HlU5ex4nmF6o1PVwrTFEMIMlr+x0pTx4JzgXK/8Sw4gXQd71J47E2LWnQmsdfoL5ofnujZDH1/6ihlVicoW528cWMOaAt4PgJg35a80ndqIJ4ehEd/nq3vY6qFHIt/7W3TGS+q9SfTXXNhkMLZhpba8N9uANCdTZl1w5SCTYuk+dO7x+26/Qae+LJYQznbRe2puR2Yq9jAnmb+I0HCNGmek4AG5K2ML0Orj2lO1yRmIZNnWC7id6AFuKNLFBWz7CJBsZb4avw8uGdPSL1BcLtsfPyWweAsDQ/Ua7zsKNldsy30Q6tPcwI9WvEsTTJBVVgY1gm93bIU7Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 15:57:38.7164
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af9d505e-a75b-409b-de15-08df400c82cf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00018548.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6348
X-Authority-Analysis: v=2.4 cv=KeRHIgYD c=1 sm=1 tr=0 ts=6af4907a cx=c_pps
 a=Uzy17SEabGn9o4QNHCkmvA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=FfPvXeHlgCiaMftf1ZoA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: LGwqVPtacs3xc0LLGfSnp1D0IbKj9hFl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MyBTYWx0ZWRfX7MMIDxP+mUVj
 6XHL2f6kJEfi3TSn2sPyzCB3tNm6rF1FKjjiTgFwbwKM7b8QzCondGUK4YQtMZzA+4PW/6+4Kn9
 eApYpOzsarBFD2RsTZe6sXc/bhPFKyX3waysNvDwDXQOK6GkqvR8NwTj8Ln9yDMgpaE9iz0ETsX
 qCPwID0YbvtxkVtXwC4PIGAbF02kLBVx4lXToJw0dr8aBBKKkcu9COATWprLBoDIvIRIXDcM7aI
 ZnIRcz07JQu8RccZasIQMhP+bZpkc0Rtd2qWKBHLOJqc2LIrdglYwFvPscuyglsrw1ymCFGs529
 N+UYM98qF+1rTskxx90nHf7iMGBTkVbd2wDtVLuStqw8EsyzdP5SrNKfNalmdY039GNhy7nGM3y
 xxxvsMxfyWoALs2C6qNyTWAb26qhzDjTsFhY/tRu1O7uq9u7Fc5BCVWm907T5T4sU7BGTg0RJSu
 nABoyLG5hotswZ0ss/Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MyBTYWx0ZWRfX9/ZQIFNHwGC+
 HYpWEMWpCXbsBbYJKY7ctZ/IWFWqiQK6dCQL+ciS1ur742E/wH3WkPnt1jBqi66i1LGR5kDhAGj
 kkqgutd2Vf7IYjsY5DPsC59uj5SdgvQ=
X-Proofpoint-GUID: LGwqVPtacs3xc0LLGfSnp1D0IbKj9hFl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110063
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Wed, 11 Nov 2026 15:57:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20529


We don't need to revert a patch that has not made it into production. 
I'll just drop the patch.


On 11/11/2026 4:59 AM, Rahul Sharma wrote:
> This reverts commit f6e834625efe9cc6b64c2d2d7f871338740924cb.
> 
> Remove the U-Boot OLDI configuration fragment for Microtips MF101HIE
> panel as the display config fragments are now being handled natively
> inside UBOOT source.
> 
> Signed-off-by: Rahul Sharma <r-sharma3@ti.com>
> ---
>   meta-ti-bsp/conf/machine/am62pxx-evm.conf | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm.conf b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
> index 806f6a47..cbae21c4 100644
> --- a/meta-ti-bsp/conf/machine/am62pxx-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
> @@ -48,6 +48,3 @@ IMAGE_BOOT_FILES += "${ECDSA_BOOT_FILES}"
>   # For AM62P tisdk-display-cluster image, splash screen is handled by SBL.
>   # Hence, disable the A53 based splash screen using the am62x_evm_prune_splashscreen.config fragment present in ti-u-boot tree
>   UBOOT_FRAGMENTS = "${@oe.utils.conditional('DISPLAY_CLUSTER_ENABLE', '1', 'am62x_evm_prune_splashscreen.config', '', d)}"
> -
> -# OLDI config fragment for Microtips MF101HIE panel display support
> -UBOOT_FRAGMENTS:append:bsp-ti-6_18 = " am62p5_j722s_evm_oldi-microtips-mf101hie-panel.config"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

