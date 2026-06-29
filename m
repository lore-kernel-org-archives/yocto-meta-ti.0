Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FAF1C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 22:25:23 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8834.1782771913808256478
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 15:25:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=UbpN1nBN;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=Jx9QPSQX;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65TKfEt23071593;
	Mon, 29 Jun 2026 17:25:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=lvQDpeNrhMNg8LN3xVblVl9caZrLyRQzPEw/g46aP
	VE=; b=UbpN1nBNn7G8iieGpz7+4BhV5d1488Xm/GusTSaeg7MNClNU5rLXfpjUb
	/ucnYgUZeI+nyPQwGDbMNeRrN80Od3rtNvaw3yPcUtLcOLJFzhbANWdMob6UZq/3
	4aFy0FMcPurb7aZ6Qi/3SsApaeS4GhCMTUeX+3ZeArd1Z5h2ZNCvbrrS/qOFXztg
	0A08cbh9wArG6JWL6bxakqQA71bStlmXQOjN0+3nCfpY6f8urvFwAMfMu2qe6sOq
	ftQyhGR7ePiFLNfyfAnOapFXKW501AmUjIpNgf/ySPLPc4NJa5ltK3peOx8MSlpm
	ywM7E942bioSA49zZsy7q2ssXC5aA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012024.outbound.protection.outlook.com [40.107.209.24])
	by m0380145.ppops.net (PPS) with ESMTPS id 4f3p9ux1e7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 17:25:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qOEtWOShqugiuIx4ImmRFxScuGpU01UP/DOTm4uGXiUqFVXkRnwE2gkcNnmiEW+lFjqqIpMB0hDkHGY+vgeGIoTcKDdd6XKeTgynEaUWSY3SY45fqGAKt4J5K7hAJYZEHpW98lYrgOd0uJpTK0eq1pFDcal5M3Jg9z7mVJ9WB8dBV/30hiyj8PshHJ2RHOWL5zhl2FphpOseJXGLqvOgs4OU5ixbpDUlGJSgHtfwcc9qTYXctra6yA3NCJslT4Y375wt56ei628ojV3FOAtjEG23Ged5GqkxdgZjj1BGBCk96YiuQcHQvx/NTliuUOz25BMZLZiVZqKVRuoYffm5PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvQDpeNrhMNg8LN3xVblVl9caZrLyRQzPEw/g46aPVE=;
 b=WRCogpDljhvw9Den90FWXV9BPrKAQemcXIJiXG99Ob90zefNTh+0fFTz1EskfRL5AUUX+jVJwwzutijspqR/diZqvlR0zEtcUtkKg+zWvEVYGIigNLcEVvgkfeZtxmXuyG+U2luGWnlgey66uCWNAGcJWIe0fAMPHSJcelw2fPLE+jUz5pGZSGJxs65lZ+R27fXux0g/pWxQZetVVbrh0jzMkx8u99sZ9BgcO5qXBCuX/Ux+RYsDj0BNgdOhkpFE6MXgQjhYq7NZDY4ffIwK8no+WCOESRFUWlDLcHqSsUORPopyt3saYgP7wItgeIHb5GJ0ZTS1xTczaMlGa+C4Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvQDpeNrhMNg8LN3xVblVl9caZrLyRQzPEw/g46aPVE=;
 b=Jx9QPSQX4F7Cccwfsa92yFI46tLT4S0uRrJlNj0OyhCDsKCcGP78aCtPxoQNmebi5vMP+pMr7AJLWnhD3Q+TGYLAlYtjPWsZtb46Wd8zczn2LD8xKD5xmx9o6tyczVe+xoibvJ7MEfzNNw6FpF3eE+aO7iSa+lXVwCYlxn1Uxnc=
Received: from SJ0PR03CA0127.namprd03.prod.outlook.com (2603:10b6:a03:33c::12)
 by PH8PR10MB6599.namprd10.prod.outlook.com (2603:10b6:510:224::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 22:25:06 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:a03:33c:cafe::1c) by SJ0PR03CA0127.outlook.office365.com
 (2603:10b6:a03:33c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 22:25:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 22:25:05 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 17:25:04 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 17:25:04 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 29 Jun 2026 17:25:04 -0500
Received: from [10.249.65.118] ([10.249.65.118])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65TMP4CA1574458;
	Mon, 29 Jun 2026 17:25:04 -0500
Message-ID: <afc801a6-385a-456c-9783-84f916d39026@ti.com>
Date: Mon, 29 Jun 2026 17:25:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/wrynose][PATCH] meta-beagle: Fix BeagleBadge
 build
To: Judith Mendez <jm@ti.com>, Praneeth Bajjuri <praneeth@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <denys@konsulko.com>,
        Andrew Davis
	<afd@ti.com>
References: <20260629215512.88924-1-jm@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260629215512.88924-1-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|PH8PR10MB6599:EE_
X-MS-Office365-Filtering-Correlation-Id: d5ab5c7b-5022-4195-0022-08ded62d452e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|23010399003|18002099003|22082099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: 
	CIU9sfpA/TSsOQRuMiNokSh6BOy9WkUsDoOZSR7pjNWqN3DIwcQD3pDt0g3hvP9iCf5+n7UV6hxCdJ5cDj+KZbhyiUfu+TXYLUMNNEMgSSd1aeLpKWD4e38zb3+adz04BxfZDhSTeiVxYRKwi0E0pkz1wdcCQ9Oq2XCdF+ZdUWDACIrZrkb11NLydho42tRSVezQCPov7BrqA9WgHgxKNFFUSAIGN6jpxJppHVhRBh+UVD6ovAMt+jzBEjIrn7skYAXeGBa7gDTZAWPN3MN/LYlAMSf87SqkKBV+bPNH4H/IWmyvOs7/BEgHIT//BSWdbujtrzcKxP5cxMZGv1iASRWvr6FWG14gRRcgQKdV1b771oJ5EVDN1oIQwrqn8bMUxr8/EcacYIvSVOVuNWo+trsyUdvtKBPeoFTrVtn0g2XCL869iBYlNlPhiNIER7GmhgjNMsODAACjNwRYFXzZv41sViD4Pjp8tbXJ7GiPRap+dHiJvGuor3OLYg5Fc1/BHgyRo9WlL6JbZxq+E1NOZLRV7G2D4/O3MUylZqri01y+O+N2eeiaemOfj4kP+M1Oym71HxU4IAiUfcW4gvMoYKqwdeVpt7fdcc6YRwBtLvS4oVL/IACD6wyo1I60XYUKuyp8QbG+ur1UaZyh8IOeElSP/mI4cyRBvuDuQhUPSe1Nl1sj0i8hQmBUpeytyAxI3SZEd7Cdo8iuB0jQcWkXng==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	SIc+w4JsxOu9qln1zYq/RlfLaUiL/mWlaNPYFAkZuvq2jJVhyXyXbjhG8mV7zzUMz4WdewCcMTAG7PTYnUQq9eNzIxB+p6DQEbVZp+bdc6Ygj7HB9MSyB6ftBoUOK0xwF8t5odLT/sAl2w5+TzuIS5qtzLssmEFeUTu0/PJqLhLs+cihGhZ75zCmJEhTc+TJs+m7o24KD3SpItYiPFjF3X+EUqD4J9k69dJ+SJKO85QefWfzRnuxcaiK0VTexrjDoGKj02rNocOUjkP1QKeBougnm1CElfB6xHwncf2tWQa1R10vQN9gV2yknhpxA1Gw76SQOjVc3QZsWxQp7Wy3qAV/eLl44gslPImtDMUirCv3k78QrFkeZqi6Eq7iBMFRr630s/HCIe+IyuPbMYqkFqtAwGI8m4qripvyTKxWe+CAY54dk1sH/FLSTiqRAGEk
X-Exchange-RoutingPolicyChecked: 
	H6Tx+r3VEyuPX871ixYEK/89Y+iLyZmAPbqll09BsKI8p8NRBk8n1EemD7C74RFxiWSkCKa+1XB+2E4dMJvDy75DVLX2+p4+5ovgfsURWJ09Q32QrLTp93G7POgBZeQZASNfzKIJm1jaybZdPR58Wfvnr9qtJEvaGsX1LoB+vBFzfvyOxoL6qdePze6jX7W6N2USiGqHWKcNfW5/3dA9WMo8j6tSho1Olqbx6rVGc3O34scysMQtXS95hthsk9u4/d5Trw3bjK6TTI6ggdqr1I+iaHN5Tbi9xD6ZLe079CHY4Rt8OMWbrqF4ZX0KAzB3RfbTe2kxqSPRCIcVuqs3ZQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 22:25:05.4446
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5ab5c7b-5022-4195-0022-08ded62d452e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6599
X-Authority-Analysis: v=2.4 cv=L7ktheT8 c=1 sm=1 tr=0 ts=6a42f0c8 cx=c_pps
 a=IDmSThB3jRGgE2uwFnJQpQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8
 a=u6cYrxD1svOl7WO15gcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 2hHdQE5WN4NsvMPNFAN7ZHeF2ut4tDBw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDE5MiBTYWx0ZWRfXwPAHFFFyT9BR
 q+6CUll+vfAeiBl/69clVdfdBq4HBBAJBoCTDsWkLzFZhBL1eT5Hjyo0ZdxULfDjUdQI4yJGVCD
 JUSFxNUR0H5eGiABhMjqCPU7ojZ5GwS/aq+96IY7CdPm3r927LRuEyjNlfYstPG/rc3WUA5/xF6
 +OXufyIoUD219u+1v/LRekwn6xBq+STGBFW6UsXfojAlD0RWZC3cbryhbmcqQA/n4bnouvW0vZj
 gSWeKZB1CUg6uvnkpLSUn57KDLlOADuunAj+chogrm5bwRkD86GkGH73Z9bmrxZCOshoUDEJv9f
 QHjPBzGnf7Tsbvlc+2WxFTmX1moKs0HzZz2/jB2hIHy2k/p3dY7JToRfSZeQok2vukZ99r5yH2C
 Z+5WQMe7tB0ASCjXKz4YkLsUiZifvcWUH/EGvKq96fNug+1uCraLOwcMVi2dlbRLcIautqBdAfw
 pobDkBCJlNw1uoIUziA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDE5MiBTYWx0ZWRfX85VPz8Rs6+yR
 NGovGWXNKOGB9EoOlfhV4wUHGr3C97payz4oUlWxVLDlx5WLBJibCSFcTkry6ZK7ShBSkt3wAnF
 wa39mXHUYODC69KDvWe2BT/D4j86HVE=
X-Proofpoint-ORIG-GUID: 2hHdQE5WN4NsvMPNFAN7ZHeF2ut4tDBw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290192
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 29 Jun 2026 22:25:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20107


NAK.

You are doing this a global level and not taking into account the BSP 
system.  You need to classify the setting for these variables using 
existing bsp overrides:

KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am62l3-badge \
"

KERNEL_DEVICETREE_PREFIX:bsp-ti-6_18 = " \
     ti/k3-am62l3-beaglebadge \
"

UBOOT_MACHINE = "am62lx_badge_defconfig"
UBOOT_MACHINE:bsp-ti-6_18 = "am62lx_beaglebadge_defconfig"


At some point in the future we can flip the default and the override to 
be the older one, but that usually comes when next/mainline/current all 
agree.


On 6/29/2026 4:55 PM, Judith Mendez wrote:
> Fix BeagleBadge DT which is now k3-am62l3-beaglebadge and u-boot
> build name which was updated alongside DT name change.
> 
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>   meta-beagle/conf/machine/beaglebadge-ti.conf | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-beagle/conf/machine/beaglebadge-ti.conf b/meta-beagle/conf/machine/beaglebadge-ti.conf
> index 78525030..c29031eb 100644
> --- a/meta-beagle/conf/machine/beaglebadge-ti.conf
> +++ b/meta-beagle/conf/machine/beaglebadge-ti.conf
> @@ -11,11 +11,11 @@ MKUBIFS_ARGS ?= "-F -m 4096 -e 258048 -c 8500"
>   UBINIZE_ARGS ?= "-m 4096 -p 256KiB -s 1024 -O 1024"
>   
>   KERNEL_DEVICETREE_PREFIX = " \
> -    ti/k3-am62l3-badge \
> +    ti/k3-am62l3-beaglebadge \
>   "
>   
>   KERNEL_DEVICETREE = ""
>   
> -UBOOT_MACHINE = "am62lx_badge_defconfig"
> +UBOOT_MACHINE = "am62lx_beaglebadge_defconfig"
>   
>   TFA_BOARD = "am62l3-badge"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

