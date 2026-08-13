Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A4AC5B572
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 15:54:15 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22519.1786636447752257578
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Aug 2026 08:54:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=PNI88zPG;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=L/jYr4qF;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: a-christidis@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DFWDQa3103905;
	Thu, 13 Aug 2026 10:54:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=OLOUuv45tmZtkLly2W3g7inXcXkP6JaSKetkSs96x
	YM=; b=PNI88zPGzrgT2lGQkd0byuA/Dr5JifEM7kQc0sREjjsAydQPuEWF+fKeQ
	7txO0I8kjXh2jP8wS4R6zAH5qReRubWIN07e67bZwo5KWGXCtjmPqvJFoGqA0bmj
	aTiRhduYzlqT99MCd4QbnBcnBdjq5KN9Gq7lsjyCbv2njvxHfKfjSjzK3V0sSOB+
	wudHcA+WNO9ix5XOmgLZZX2mz5Np7Dc5RXLYsyJlREU9O5TMF/FBVYSFdGuIU6pp
	K7x0c+5b9YgWLdR2gx+rhUb8tidluYD/sgBXCKOPXPZQ2XiLMhzuiDf6bv6jcw5c
	975xG17LV408uyfUPPez9Y9k7OFrw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011061.outbound.protection.outlook.com [40.107.208.61])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g13fxcuaw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 13 Aug 2026 10:54:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oLnyzEs8edrpXJ3SLNj6EpTi0cY1Mfdg/Ak0iBWxbT2zAi6F5Z1qUr4PWWKSf7JyMpmVZdBnTxnbuV978hDUPFahmU5FYnZLbN2YJ3vhW+9K5yq454JVC0Ik54KdorUh3y0k50xjas2hYtr42fDBjfq9C3VZfoj5AER+r0V752kH0Fc7Xu3PVMaGo4yCkxFjXMHNte7935ojX1Qx7EDXO1g4uLNTodEy41SNhsHQB9Bg1jHq3cI7TE/iRiPdFvomKpAT0P+23Z74lFG0UefHq/Mq5mx3LvxA1LU6/gOXGRHr3toa8YcKhm8/tzKtbjn5H0blZGyEr3j1VlnPWAqLEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLOUuv45tmZtkLly2W3g7inXcXkP6JaSKetkSs96xYM=;
 b=UoOPqDjSGE3eCrg04KDikUA9aSuF8rBp2rg91FYkVg++eMz/PL7bPrC7+iXQxVJkhmd+DtIr91NidrF9SK7JaYM0HluZlD5M8aCd0VSqqDiFZ6BrvU6AlgwthaFH5VFJN0DlKuvhLrsQ3vfjyY0BQNmbXi1CrvGVj0CmZ8uUlqA7/O4jUj1gTLbVaM3Vl5SgG0VOC57yIGqr4TqNMp+bujJI4mOeXhYkd1eFp95TF4hv9SnGyt3pyZnabPJow//gRiVxLS0VrP+aL7W0NtjE6fDtB/RDptQtoJmSs9jnOvk4tK8SnjQWArG90mbXP838oo5R5owFJw8ixX8WrsCp5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLOUuv45tmZtkLly2W3g7inXcXkP6JaSKetkSs96xYM=;
 b=L/jYr4qFuWN/qeHF1rlHmOBKK+JHxdYZeZ+ySS+1V3Zz7aMknhuhmRzH9IShBss7IimgkkpvMNo+isZL2vbDm8Qclk9yp2vQBW/xW8LDA39X32+F2N91gIcLEAXGmDyM2+jVkLjgPa798XJT81Cu5idg9w9nbeLZYVMeS8lOqLk=
Received: from BN9PR03CA0397.namprd03.prod.outlook.com (2603:10b6:408:111::12)
 by CO1PR10MB4642.namprd10.prod.outlook.com (2603:10b6:303:6f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 15:53:59 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:408:111:cafe::65) by BN9PR03CA0397.outlook.office365.com
 (2603:10b6:408:111::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.14 via Frontend Transport; Thu,
 13 Aug 2026 15:53:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 13 Aug 2026 15:53:58 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 10:53:17 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 10:53:17 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 13 Aug 2026 10:53:17 -0500
Received: from [128.247.75.81] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.75.81])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67DFrGQN102368;
	Thu, 13 Aug 2026 10:53:17 -0500
Message-ID: <f999fa4d-6568-475c-9150-9d427a2bdf9e@ti.com>
Date: Thu, 13 Aug 2026 10:53:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master][PATCH v2] weston: update bbappend for version
 16.0.x
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
References: <20260811202239.40060-1-denis@denix.org>
Content-Language: en-US
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <20260811202239.40060-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|CO1PR10MB4642:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a0575ff-05f2-4082-8d33-08def953161f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|376014|4022899009|1800799024|82310400026|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	Norn16K+hQDdbVzcWJBrHwy3x8tFWncnbaDbgXCat4+plccMgO5gmyWaqYCsUk2ElpNMMKwgeicZzSRZNL2hFps0ktD5JScWLzN4jEEWI2StNpJ5CjYVjO6qhIpf7xA7epfU/EWcb/9lqmO6NbTzkelIq1sv1Nenv7KooH+kMbr9y32UBVZ4+9rKhP6Z0kQXYGym0xQ7aL3pyY2wttqgB+kuB9DjDmbP3uYhV67idyTipfmpSgpgbCr9ImlE3fKKBh/Feoh2lZBPsv/9X3uQKj0UxVu6dLxBXXWEnwnsPu6tlDBoTN8v4lafaMqnbx0ZcE19g4sTSz0qhPNBzGO7DbGmH2iwYHjSHZST5xR9mPoawVr9xwQCwRumskPrTdKbKwozD6XmnqhCcrpO/f+wp0e3NPt2Rkt2ISL5/EDs8BiJ7uA1ds4Y7ROq3vQZtJSoLHGF24ldAhaYhPfdtTOTCJkeMxwrPeZ6yf55+3zJN5LiKtGd6WHHN0q6r5cd+x8RVlfKVCb79+YrV7RDPUjhzGB/L1seT7z9plnlb3UZvkkBuW5hnmTJGhePF2SrUU2t7CBqq8BEniFdaAI0HoihAsHKto4kz2OCzVP65N98d+VyYQ/I9C7dL5jEhTz19dCnTUROCGIkpFoHmEK+TQVovQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(4022899009)(1800799024)(82310400026)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Rk4GfuBj0DBskS/uNgtZ0cqE3j8zyZ0gZS8xsSSsT/CCi9eAjxs/KtDM8+UgEXFLAcTMPm03P0iFOcZ/2yEGyopcyCQidqjXYA1dWmZELdsrTEpszxy/YlYscyJly+rwhdgsjfJ1/Rh2nIasxQSQ5AbVbaUt/U/7te3e1UPemFtt6rY6aLPI6JeUCg0uBP+8Uz+BdSvZz5c+XPLVUZ0+xiNfFtxKmuX1wXw1Bj92BlNn+Qkg3igFyz4V5OKy89zkQn+x/oJ3b6eB1j/x9oyeVR3IkuEmSxTJGRCunebQ3blInVe79e3AR6MbQPUxSWpgHhe+4ZD329jjyhTOSSZPd4y4czfzZoZkS12zJKMehMsg+je0/PHoAUCVITy/BA8/N9+QyGmFAfndugi9VOoZgk9wGkQd1Okl2G2TTEMJzIPF1d0q9TdeiMb+wK771Bdb
X-Exchange-RoutingPolicyChecked: 
	n6cMl45o36WWItaNQU0P1B0FTs9cDkg+BX82vgMgX88XUE9yJiU8yOwc7S7Lr5xDeLR9Q2shdd7TiEjmUIrpBMM2gU7PQlVCh92N0Lf0zuMVLEfBTnaX1u1W5ALEd3+MX9qCUC5s7X2BgSSi19GBaYTooizszSUAlA8O34rD4QhO+i6bmOPT89ETC5YUKiFVbWjqEaHxdiF37JX0E6fv8L0+AVO4AdsNDpLrO0LV3Na39W26KOYtXa8MLsoQs4zJ+oLgihJKvwrMla1sZhnux7n6IDGhmL9W2GeBrDFyJ5eB/OC3RnXbY7irxLcDKWNzxkFjT0RPRiuW9ZslIPLJnQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 15:53:58.0758
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a0575ff-05f2-4082-8d33-08def953161f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4642
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDExNCBTYWx0ZWRfX5PsAjiQavwsg
 Rs87jot54yJvEToCk1dGUlNUuz+bfUfQPwwhB4u4kJpafPBK+pExz6q8JBnOy6/XRCPAB4apB4p
 OD7MDxeTD7+Cwo/LXQ22UisQlrwAs+o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDExNCBTYWx0ZWRfXxLlkzOi67vpd
 6yNNDJiEWrXAfqh3ND2acfx2/t3+02HF5QhBIyifnGo3jSIkyPiQSP6+U5lJJPjW1qwuppKxlVh
 y+E5/w8bfTBOj6Bke9Wpfk/7Akqr/jh23tdCObEmxasUUUxaeQvFy3CKJdus5O+ealP2t7LMD3+
 hpuOHPOpEuiUWPZw6++hb6PKxzO/3KtJUeku6Ombb7Whjd4Z2lSwflkzb8H7R0tb1AY7v4APOg6
 FWOoy+GsFpE86hkFy+jIdHu9shdlVAklXk3Mp3/SOdGFmANGh+CtNN2kNMaHHlsJWpAj6VnAyrF
 rYFqVTlCp/Tes0/L5fG4QVmmG1U3GrN52xZAx7CnlOJONRlRIL/uYib8Qe3GQOh+Hnly3gUF8Tz
 kSU2b5zw1FEA2w/RwO0N809psofoFXwolm67jgrt0YIgdfbUe0wXTF3HvnShKIyG78QgzreYIaG
 LlcLG+QibFWTimCAxfQ==
X-Authority-Analysis: v=2.4 cv=Ae6B2XXG c=1 sm=1 tr=0 ts=6a7de89b cx=c_pps
 a=Ul8IY3gNdN0J7lfmD5e20A==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=Q4-j1AaZAAAA:8 a=e5mUnYsNAAAA:8 a=iGHA9ds3AAAA:8
 a=sozttTNsAAAA:8 a=k-42gJp3AAAA:8 a=QX4gbG5DAAAA:8 a=smqOv4t2yC8LGX1rkYkA:9
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=uCSXFHLys93vLW5PjgO_:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: BQNBfuVCcfBVHvc5DvHb_Y2Ds7iIMfr8
X-Proofpoint-GUID: BQNBfuVCcfBVHvc5DvHb_Y2Ds7iIMfr8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130114
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Aug 2026 15:54:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20263

Run some tests looks good.

Tested-by: Antonios Christidis <a-christidis@ti.com>


On 8/11/26 3:22 PM, Denys Dmytriyenko wrote:
> From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
>
> OE-Core updated weston to version 16.0.0 in master [1]
>
> Our bbappend applied 2 patches to version 15.0.x and those
> need to be updated for version 16.0.0 accordingly.
>
> Patch 1 updated to remove fuzz.
> Patch 2 removed as it was accepted upstream.
>
> [1] https://git.openembedded.org/openembedded-core/commit/?id=ad85da159d415f1aad6ea9fb50cd1b630a89692e
>
> Signed-off-by: Denys Dmytriyenko (TI) <denys@konsulko.com>
> ---
> v2 - actually rename the bbappend, as it ended up in a separate commit
>
>   .../wayland/weston-ti-version.inc             |  1 -
>   ...equire-GL_EXT_unpack_subimage-commit.patch | 17 +++----
>   ...x-assert-firing-when-subsurfaces-hav.patch | 47 -------------------
>   ...15.0.%.bbappend => weston_16.0.%.bbappend} |  0
>   4 files changed, 7 insertions(+), 58 deletions(-)
>   delete mode 100644 meta-ti-bsp/recipes-graphics/wayland/weston/0002-surface-state-Fix-assert-firing-when-subsurfaces-hav.patch
>   rename meta-ti-bsp/recipes-graphics/wayland/{weston_15.0.%.bbappend => weston_16.0.%.bbappend} (100%)
>
> diff --git a/meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc b/meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc
> index c8624f0e..42e6b6ac 100644
> --- a/meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc
> +++ b/meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc
> @@ -4,5 +4,4 @@ PR:append = ".tisoc1"
>   
>   SRC_URI += " \
>           file://0001-Revert-require-GL_EXT_unpack_subimage-commit.patch \
> -        file://0002-surface-state-Fix-assert-firing-when-subsurfaces-hav.patch \
>   "
> diff --git a/meta-ti-bsp/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch b/meta-ti-bsp/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
> index 4b3b4a1f..2e650234 100644
> --- a/meta-ti-bsp/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
> +++ b/meta-ti-bsp/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
> @@ -1,4 +1,4 @@
> -From 3cddacaa9ea3cfd75732ea9a84312fa68e0bfda7 Mon Sep 17 00:00:00 2001
> +From a64f81b25e678026fa2d6a6715a9c63823235dd5 Mon Sep 17 00:00:00 2001
>   From: Ryan Eatmon <reatmon@ti.com>
>   Date: Tue, 24 Mar 2026 10:52:59 -0500
>   Subject: [PATCH] Revert require GL_EXT_unpack_subimage commit
> @@ -20,10 +20,10 @@ Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>    2 files changed, 23 insertions(+), 5 deletions(-)
>   
>   diff --git a/libweston/renderer-gl/gl-renderer-internal.h b/libweston/renderer-gl/gl-renderer-internal.h
> -index 1afffbda..dbf7b1c3 100644
> +index 1752db2..6a27019 100644
>   --- a/libweston/renderer-gl/gl-renderer-internal.h
>   +++ b/libweston/renderer-gl/gl-renderer-internal.h
> -@@ -526,6 +526,8 @@ struct gl_renderer {
> +@@ -558,6 +558,8 @@ struct gl_renderer {
>    	struct weston_log_scope *shader_scope;
>    
>    	struct dmabuf_allocator *allocator;
> @@ -33,10 +33,10 @@ index 1afffbda..dbf7b1c3 100644
>    
>    static inline uint32_t
>   diff --git a/libweston/renderer-gl/gl-renderer.c b/libweston/renderer-gl/gl-renderer.c
> -index 45a2a148..8b238208 100644
> +index 81bb5e5..0e04073 100644
>   --- a/libweston/renderer-gl/gl-renderer.c
>   +++ b/libweston/renderer-gl/gl-renderer.c
> -@@ -3021,6 +3021,22 @@ gl_renderer_flush_damage(struct weston_paint_node *pnode)
> +@@ -3404,6 +3404,22 @@ gl_renderer_flush_damage(struct weston_paint_node *pnode)
>    
>    	data = wl_shm_buffer_get_data(buffer->shm_buffer);
>    
> @@ -59,7 +59,7 @@ index 45a2a148..8b238208 100644
>    	if (gb->needs_full_upload || quirks->force_full_upload) {
>    		wl_shm_buffer_begin_access(buffer->shm_buffer);
>    
> -@@ -5171,11 +5187,9 @@ gl_renderer_setup(struct weston_compositor *ec)
> +@@ -5652,11 +5668,9 @@ gl_renderer_setup(struct weston_compositor *ec)
>    	else
>    		ec->read_format = pixel_format_get_info(DRM_FORMAT_ABGR8888);
>    
> @@ -74,7 +74,7 @@ index 45a2a148..8b238208 100644
>    
>    	if (gl_extensions_has(gr, EXTENSION_OES_MAPBUFFER))
>    		GET_PROC_ADDRESS(gr->unmap_buffer, "glUnmapBufferOES");
> -@@ -5303,6 +5317,8 @@ gl_renderer_setup(struct weston_compositor *ec)
> +@@ -5792,6 +5806,8 @@ gl_renderer_setup(struct weston_compositor *ec)
>    		   gl_version_minor(gr->gl_version));
>    	weston_log_continue(STAMP_SPACE "read-back format: %s\n",
>    			    ec->read_format->drm_format_name);
> @@ -83,6 +83,3 @@ index 45a2a148..8b238208 100644
>    	weston_log_continue(STAMP_SPACE "glReadPixels supports y-flip: %s\n",
>    			    yesno(gl_extensions_has(gr, EXTENSION_ANGLE_PACK_REVERSE_ROW_ORDER)));
>    	weston_log_continue(STAMP_SPACE "glReadPixels supports PBO: %s\n",
> ---
> -2.43.0
> -
> diff --git a/meta-ti-bsp/recipes-graphics/wayland/weston/0002-surface-state-Fix-assert-firing-when-subsurfaces-hav.patch b/meta-ti-bsp/recipes-graphics/wayland/weston/0002-surface-state-Fix-assert-firing-when-subsurfaces-hav.patch
> deleted file mode 100644
> index d370577c..00000000
> --- a/meta-ti-bsp/recipes-graphics/wayland/weston/0002-surface-state-Fix-assert-firing-when-subsurfaces-hav.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -From 12ecd8d4b5095c120efef76493546ead3f41ab5b Mon Sep 17 00:00:00 2001
> -From: Derek Foreman <derek.foreman@collabora.com>
> -Date: Wed, 27 May 2026 14:12:36 -0500
> -Subject: [PATCH] surface-state: Fix assert firing when subsurfaces have no
> - views
> -
> -Upstream-Status: Submitted [https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/2085]
> -
> -I've not been able to reproduce this, but have a report that this fires
> -when running Chromium on aarch64.
> -
> -It seems plausible that we can get here when none of the subsurfaces have
> -views, and thus the flag won't be set.
> -
> -Let's just remove the assert.
> -
> -Fixes 6a280a8f
> -Fixes #1117
> -
> -Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
> -Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
> ----
> - libweston/surface-state.c | 2 --
> - 1 file changed, 2 deletions(-)
> -
> -diff --git a/libweston/surface-state.c b/libweston/surface-state.c
> -index 3c31a0aa..65dc70bb 100644
> ---- a/libweston/surface-state.c
> -+++ b/libweston/surface-state.c
> -@@ -268,7 +268,6 @@ weston_surface_attach(struct weston_surface *surface,
> - static void
> - weston_surface_apply_subsurface_order(struct weston_surface *surface)
> - {
> --	struct weston_compositor *comp = surface->compositor;
> -	struct weston_subsurface *sub;
> -	struct weston_view *view;
> -
> -@@ -279,7 +278,6 @@ weston_surface_apply_subsurface_order(struct weston_surface *surface)
> -		wl_list_for_each(view, &sub->surface->views, surface_link)
> -			weston_view_geometry_dirty(view);
> -	}
> --	weston_assert_true(comp, comp->view_list_needs_rebuild);
> - }
> -
> - /* Translate pending damage in buffer co-ordinates to surface
> ---
> -2.34.1
> diff --git a/meta-ti-bsp/recipes-graphics/wayland/weston_15.0.%.bbappend b/meta-ti-bsp/recipes-graphics/wayland/weston_16.0.%.bbappend
> similarity index 100%
> rename from meta-ti-bsp/recipes-graphics/wayland/weston_15.0.%.bbappend
> rename to meta-ti-bsp/recipes-graphics/wayland/weston_16.0.%.bbappend
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#20253): https://lists.yoctoproject.org/g/meta-ti/message/20253
> Mute This Topic: https://lists.yoctoproject.org/mt/120708334/9164840
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [a-christidis@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

