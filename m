Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5ED2C43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 22:15:57 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56818.1782944156582092960
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 01 Jul 2026 15:15:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=jT8TzuBi;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=jM66szTC;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661LfoVi635629;
	Wed, 1 Jul 2026 17:15:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=hJ/UgQ4prSlOM6Z1xU4rVtbFLKoGhME1lP/kKxzMO
	vk=; b=jT8TzuBivwzm/72kHqmvhQspODv1KlFO+hPUIKx5+RqYOkTCwN3InKNaY
	VBLndh8yNmcrjemyu6vOyI8eMmrQkxbHCrmwh6Qzyr580D3eBvJiYjUn0hxtJK3Z
	/1NUu/7evz+08guMU/JyidjO4Yx0nRpYfDYvYh6MPgyRPRAS3zJ8S4O9ADZhBYFD
	5Fr7Pdc0OoYExArgy4XogE4EG09lVppM4riEXeexaQU8nCpyS4/fsOFa0uCs1qkT
	z+txSIJw525E7eq5t6dBgZ9E8adpDxGxETY0VtuVr13T/HOYePR5JhdDTPzl7Z4+
	Qr2zBKkKXODko0K4u3592yA9F8+nw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010042.outbound.protection.outlook.com [40.93.198.42])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f51ve3wd8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 17:15:54 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJOtzeBQUSfcL+sOO/cbBN/yckdTtevpjpR+sWq/Xao70o44/dS73ZsRNf+wtRXfBj3hqm6JztT8aCOq30MpCeK2ZragZHFNMXIlk2sOcMWsXZaTmB+G4TEQVjEzWOPGFT/tvuCnzUyK9k4gRilGF4JjGeyqUmj27LPEFVJdWRuUJhTeOKgRVv1hiObC7WtRk0rjt43ITAvjax7oBAL4HXieTlDjhZLlvuP4YBRGKeAX9Q0ISZ8FH0X/r9C/jw08FHxQtu52uOHyUgSZzAX2URLsh3uEBo8MsJ0cU6UqJL0hBtmReuEl/ujUbM6xOU/phnOMnGmEg5gb9xbrSD88vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJ/UgQ4prSlOM6Z1xU4rVtbFLKoGhME1lP/kKxzMOvk=;
 b=QR16n4W2812C9vGxaBNUPVmy0OWkDYrUrd8Yt8qA+Yp4Yx4WSBrupkMt4wx58p+e7T1t68oVaFYKsN4RNAkQPNnQ8az4cxmM5v3L1H0JqUc2rh75hZn5Zzv3ZebqPGPIVrCChKNrljacCvgrrRoJa9iGbreKNLe+9mkpVJCRz3NvGG+wS6ZbtF3oxsdSDZhU4fewCLeQSbpqLIJUMbj9NCAW5px4eiGUYha6hQoMSYX2J4UW2exhQG+FrJnH0xk6ZAkyqkUgtGx2UWv11sdTSwzi24oy/9EqhmBCC3MZwyf54Md21RXgOic2TkIsAGfUoAn5S8YyfZQiF2JCWbgQKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJ/UgQ4prSlOM6Z1xU4rVtbFLKoGhME1lP/kKxzMOvk=;
 b=jM66szTC7XXpmP0vIHRxYY7AzuDvf1qw7XPejX1i6ofVsIrbgLXnzbgw0SjTGyU/OlXw1F1OdIovRNMfcVB6se/oQ6EuGhua1cbzCY+v5dyAD+uPVU0TwSNYsFeF6O/bPRJBq4FjbGkSTHG3fMvkazjDWH4yNhlgrkY7cnFgV9Q=
Received: from SJ0PR13CA0092.namprd13.prod.outlook.com (2603:10b6:a03:2c5::7)
 by PH7PR10MB6130.namprd10.prod.outlook.com (2603:10b6:510:1f6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 22:15:46 +0000
Received: from SJ1PEPF00002316.namprd03.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::83) by SJ0PR13CA0092.outlook.office365.com
 (2603:10b6:a03:2c5::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Wed, 1
 Jul 2026 22:15:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00002316.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 1 Jul 2026 22:15:45 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 1 Jul
 2026 17:15:44 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 1 Jul
 2026 17:15:43 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 1 Jul 2026 17:15:43 -0500
Received: from [10.249.32.189] ([10.249.32.189])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 661MFhhq1795230;
	Wed, 1 Jul 2026 17:15:43 -0500
Message-ID: <1bb8ce98-4c80-48db-9af3-e145bd328210@ti.com>
Date: Wed, 1 Jul 2026 17:15:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/wrynose][PATCH 3/3] ti-rpmsg-char: Update to
 latest with CMake support
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20260624183253.1130737-1-afd@ti.com>
 <20260624183253.1130737-3-afd@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260624183253.1130737-3-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002316:EE_|PH7PR10MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: f05a83fd-7388-47e2-d4e9-08ded7be4c1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|376014|82310400026|3023799007|6133799003|5023799004|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	YT/Nuj0ps422m0fvI+hb/4SIlzz3Rn80Q4bwTQRB4ZYNRsiVdbMot4HVJdU9MO+/21vHmwANhEqolmu8Ps06eUuPcAYXXwms+Cx8e0/7Rgd2XwN+3OrBTlAC+JohCXQ/7MWEFsMlucdl4+3oYnOMC7eBSdip9BW1Siz/m3pMU/kiXmE7UqqyvY+kxJQxSss64LwhF4zR+VQ7yLYkRa4fqA/Yd2kFW4RfAAwCFu7m384gS+kIQelOvV3Urt1M9OMRHiWipqnpd2qu/q6RKQCuapPg2nDDgD44hwBDIa9a399Ks4FpnVn05IZht3qSa9o2ihAj0VG/ptrG9hFKIR9G8Z2xmRPwvcDTxDZ4tXzqkG5JQ+pGGDFNGoNzNPEkyyvmRQf1MblMzAp5Y7CI9uanxLWFT7rkAx9QU5DfgnJQYTvsVRv0a0hVCcyaVS36g7l3SIvttDy42n9RQ7AGiG9B1Iy6o+8qBWGtH5JpjkBkXCMGvVFH8i0moh+ryFTPk89hgftvkJijdc4dOKwtW2RT5PAzRnNFLwHME8siQoXKkPKEYkEZqO6rmVTGGbrBLVtcLz4ENMLhAjiT9U5liD9zAuKPkXcT+jttmNx0Lb2NsGMsa0hJhiV+1TvpC5wVY7bU70kgtRjA7onkWXvCdvQCX4nBFOSGe4LfAuIvQpp4+MUfvR/5FE6dZ0nc91V1OZRlJDcHFjQatswemxHc94Z3Ag==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(376014)(82310400026)(3023799007)(6133799003)(5023799004)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	PWFELcOjCr+88YMTcf3f/ASHo0yv40Ar27zX/y1b3VOp8LCNqKXt1s2EYRA/eJDnMF4BgLd1MRWLD+xODLjW85J5jiNO/3PaiSSayt42kXVoRyu2naX9NbxlG9d85akDEVQ1lOPgK+3XTS+lGlKs4ilxecba73o+OQmzbS8F0oVsK3DccFFi2LeEiGyTdLIke+9bzsf1ChQXIw2tCok/aQazejr9kpchji4OQS0n0VIa4mhTjtu1csC8IfgPJ9EPxWoYaU25omv0buVBPDerD6Gh9TQ+GqUDpPbvz7RR5tCokdU+uXHSo/YZ8h6VY751SysByA2HG8Bz05MSH9L+ysrKPKlR4X65cdoycp0lIoc6R8NxTZjzTnPAcaMUV/Ts7ILeEP9vZLhpGTV50kQ3EbX6ZgiMHOLTzDAPWQRy3vgB1cqYe0A4u1aBxIuRSHOZ
X-Exchange-RoutingPolicyChecked: 
	aFArWBeglog4XaUGeOP7F3vV2o7MhkojLoMGs5+AiWUeiup7aW9igj0DfO4TpRjMRuLxMtSDqxpQAIDkE41FCXJfu8JhmFKNVmQoPdKhAjJLKdI8hbaN8YuMsLdX/L44aNHqt8hqm+TbXCezA0KEb/nBNzn/QuK18adqTpptLodzPhau3j7nCO9D2zoLOq3LOT6nJWRjUKP9CQhkJMOpdgkEZ3/QThoFl3mQ+ryZ3PAlMTKwk7Ra/QTovq/xgACK8lPFyNFoTpXwI/v7D2/FE3BSzocOZlLfsjgPIDWXLZzT6cktledeApGSXlP8b1Pv1Q92uS5t7knQermzRZW4fw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 22:15:45.2584
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f05a83fd-7388-47e2-d4e9-08ded7be4c1c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002316.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6130
X-Proofpoint-ORIG-GUID: xQw4YfkENgjWElp1Kxon9ydGimnnPTFC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDIzOCBTYWx0ZWRfX8gNGjsV4gc3u
 Dq+eE2aiWB2x1tV/uFf43is2t8iBTLWq51W3UekmcNDNRN9wlysWp4seT2z8sahq3lGbhC3YGQy
 o6+JLliK8gIjUuzCgLW5wxe+1jIS6WxFfaoGp2771WO0QqX+wpS86HjTMhnMryC06h4m9t45gQ0
 DHCG6yBQSmxN/kG/d3Tr7ZcFPnts0E0bd1PuloutMqZvhv3C/ZtArNCtzGrMMy2UfV7wQL1hGfo
 QFSfJ5GGyRl4hqj4+K69b1KMRP9CQDYEUTcOK6kjVLPjGyiH4jZDHckjSFDLVK3aQ9g8Jgu+Oej
 tz9TfYNx3PCzHCYB/eP8tYptUA7TKHVnTearFSHohVidcjdfJdin8RyBrxwEccUVC3B6+KxQRBd
 0orfP1N/qbJJ7H1t/n3Ypi97Ojms0L3BRRkx2wWRYS86M1AbLUkQwF0IgJ3hSJBBjqXPxcxEaFV
 0DGFvIRkyp8xv5qsjBA==
X-Proofpoint-GUID: xQw4YfkENgjWElp1Kxon9ydGimnnPTFC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDIzOCBTYWx0ZWRfX53QARnTIFdHU
 YeHk/SGFB0lJZnsRQE3hTgOjnHNI/lxd0aM1n7DU0JYjt8IXKY9N8AcojvH8u3viJLttkQE3stV
 tMPLEU1MgY4i/4IBr7z2zEBXf3RpwDE=
X-Authority-Analysis: v=2.4 cv=PtOjqQM3 c=1 sm=1 tr=0 ts=6a45919a cx=c_pps
 a=EKn0uP0Y4sICCJyfUD6Zbg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8
 a=xCcshcNUF-xBttJnmvEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010238
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 01 Jul 2026 22:15:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20117


Did you do a test build with this?  I'm getting this error for all k3 
platforms that depend on ti-rpmsg-char-staticdev:

Solver encountered 1 problem(s):
Problem 1/1:
   - package 
packagegroup-arago-toolchain-tisdk-target-1.0-r14.7.am62axx_evm requires 
packagegroup-arago-addons-sdk-target, but none of the providers can be 
installed
   - conflicting requests
   - nothing provides ti-rpmsg-char-staticdev needed by 
packagegroup-arago-addons-sdk-target-1.0-r44.0.am62axx_evm


Either we should remove the dependency or fix the new recipe.


I'm going to keep patch #2 from this series, but #3 needs to either fix 
the issue, or remove the dependency.


On 6/24/2026 1:32 PM, Andrew Davis wrote:
> This project now uses CMake. This allows us to cleanup this recipe in 3
> ways:
> 
>   - Remove patch for includedir and libdir as CMake handles this correctly
>   - Combine in the in the examples recipe, CMake builds the examples along
>     with the library in one step.
>   - As there is now only one recipe, merge the .inc into the one .bb file
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>   ...-Remove-use-of-includedir-and-libdir.patch | 44 -------------------
>   .../ti-rpmsg-char-examples_git.bb             | 13 ------
>   .../ti-rpmsg-char/ti-rpmsg-char.inc           | 15 -------
>   .../ti-rpmsg-char/ti-rpmsg-char_git.bb        | 20 +++++++--
>   4 files changed, 17 insertions(+), 75 deletions(-)
>   delete mode 100644 meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch
>   delete mode 100644 meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char-examples_git.bb
>   delete mode 100644 meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char.inc
> 
> diff --git a/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch b/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch
> deleted file mode 100644
> index 3539e8d9..00000000
> --- a/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From 1a26cb577ba54dd9214eeb94fed0ce3a0f4603b6 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 24 Oct 2020 23:46:39 -0700
> -Subject: [PATCH] examples: Remove use of includedir and libdir
> -
> -These point to standard include and library paths which already are used
> -from sysroot relative paths secondly, they use absolute paths which
> -means we are asking to add -I/usr/include which might be ok in a native
> -build but not in cross build. This helps mitigate QA errors found with
> -OE build system since it finds it adding host include and library search
> -paths to linker/compiler commandline
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - examples/Makefile.am | 6 +-----
> - 1 file changed, 1 insertion(+), 5 deletions(-)
> -
> -diff --git a/examples/Makefile.am b/examples/Makefile.am
> -index da34204..34ac7a8 100644
> ---- a/examples/Makefile.am
> -+++ b/examples/Makefile.am
> -@@ -1,6 +1,4 @@
> --INCLUDE = -I${includedir}
> --
> --AM_CFLAGS = -Wall -g -O2 $(INCLUDE)
> -+AM_CFLAGS = -Wall -g -O2
> -
> - bin_PROGRAMS = rpmsg_char_simple rpmsg_char_benchmark
> -
> -@@ -8,10 +6,8 @@ bin_PROGRAMS = rpmsg_char_simple rpmsg_char_benchmark
> - rpmsg_char_simple_SOURCES = rpmsg_char_simple.c
> - rpmsg_char_simple_CPPFLAGS = $(AM_CFLAGS)
> - rpmsg_char_simple_LDADD = -lpthread -lti_rpmsg_char
> --rpmsg_char_simple_LDFLAGS = -L${libdir}
> -
> - # rpmsg_char_benchmark program
> - rpmsg_char_benchmark_SOURCES = rpmsg_char_benchmark.c
> - rpmsg_char_benchmark_CPPFLAGS = $(AM_CFLAGS)
> - rpmsg_char_benchmark_LDADD = -lpthread -lti_rpmsg_char
> --rpmsg_char_benchmark_LDFLAGS = -L${libdir}
> ---
> -2.29.1
> -
> diff --git a/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char-examples_git.bb b/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char-examples_git.bb
> deleted file mode 100644
> index cbe4d7fd..00000000
> --- a/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char-examples_git.bb
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -SUMMARY = "TI RPMsg Char Sample Applications and Tests"
> -
> -require ti-rpmsg-char.inc
> -
> -SRC_URI += "file://0001-examples-Remove-use-of-includedir-and-libdir.patch"
> -
> -DEPENDS = "ti-rpmsg-char"
> -
> -inherit autotools pkgconfig
> -
> -EXTRA_OEMAKE = "-C ${B}/examples"
> -
> -PR = "r0"
> diff --git a/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char.inc b/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char.inc
> deleted file mode 100644
> index f9fb0f25..00000000
> --- a/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char.inc
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -SUMMARY = "TI RPMsg Char Utility Library"
> -
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://${S}/src/rpmsg_char.c;beginline=1;endline=31;md5=71987db43a2159cff5ea00505c6fce58"
> -
> -PROTOCOL = "https"
> -BRANCH = "master"
> -SRC_URI = "git://git.ti.com/git/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};branch=${BRANCH};"
> -
> -# 0.6.11 release
> -SRCREV = "dd4783422bf4fbed1015bfaa51054e40057b4f04"
> -
> -PV = "0.6.11+git"
> -
> -COMPATIBLE_MACHINE = "^(k3)$"
> diff --git a/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char_git.bb b/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char_git.bb
> index 50565300..a0043caf 100644
> --- a/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char_git.bb
> +++ b/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char_git.bb
> @@ -1,9 +1,23 @@
>   SUMMARY = "TI RPMsg Char Utility Library"
>   
> -require ti-rpmsg-char.inc
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://${S}/src/rpmsg_char.c;beginline=1;endline=31;md5=71987db43a2159cff5ea00505c6fce58"
>   
> -inherit autotools pkgconfig
> +PROTOCOL = "https"
> +BRANCH = "master"
> +SRC_URI = "git://git.ti.com/git/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};branch=${BRANCH};"
>   
> +# 0.6.11 release
> +SRCREV = "e36103aac7d9f6d64125eb917d3c69022cb86e0b"
> +
> +PV = "0.6.11+git"
>   PR = "r0"
>   
> -DISABLE_STATIC = ""
> +COMPATIBLE_MACHINE = "^(k3)$"
> +
> +inherit cmake
> +
> +PACKAGES =+ "${PN}-examples"
> +FILES:${PN}-examples += "${bindir}/rpmsg_char_simple"
> +FILES:${PN}-examples += "${bindir}/rpmsg_char_benchmark"
> +RDEPENDS:${PN}-examples += "${PN}"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

