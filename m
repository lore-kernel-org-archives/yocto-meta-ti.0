Return-Path: <gehariprasath@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DAE2C61DD9
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 16:28:47 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11542.1788107317148020342
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 30 Aug 2026 09:28:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=bTA7PcHP;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=Hp5cvgqV;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: gehariprasath@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UDfqrQ2787204;
	Sun, 30 Aug 2026 11:28:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=GCL9A1/6Li//v8GEmYDjgLggmzSjZ4cZ4HHbvIpxL
	a0=; b=bTA7PcHPa/JO1WN/pMC5laDACqx74BJXXIe5JdIzd41KqO9qqDO+PSKxW
	Qsz7E2ZXsNFoUCV4vZq2b9jMdd/xP8L/oRfNir0N0LwJDBhMo3OEqXmc04oEK5Nq
	JLRw6PKsBjPMDLE/KeMjiXo62Km1cHsBdCHh7/kLSwVQc/Yh/jMoYP/1JhL4aBge
	ZUEUrzLYHqJ6L3lvfPy3ZLJg6+4lTIrTJuEaOjuce0JWNSAfaz+/lVaVSBEQRBfy
	gGV2xy4J6w3rfzL9mJOhl8JxLXjcTxprEVNyALisr2L3skY8fvWIvi3rx7vacrfX
	laml7Z6bVI/l+Bg1dGeIXJpVNR9JA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010060.outbound.protection.outlook.com [52.101.61.60])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gcet41gkf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 30 Aug 2026 11:28:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dYmW0661NvOFE2/LQ3TUGBdw0n6iorHPy9gUVoczEE2gt/B0jieiKnuTYO35PVOxbuyyeM8LpkJJUXfXtWUirvs+T378ub8gmx4W+NeRaFxjTStYwjheK9qTVi97+W2Zrwd5/Pj4l9dw2J5Y7fYa41o8Ab8Tc6LfOtDIyfADEgyA7rCnG4ReaZSNNOLuBu6ok2iF3/ib51J9DTJG1EwSl6maFJcW5fIy3h3Z1NBv//ypsFNT7GGNiivFglYiwNDePOsiVME7oXCAbA7NZ19jNu/xGmRYC/g0BfVNvOjhCtzVLQMmxYfvyg0z/mATiUCEC+aP0ShhDlD/Cior/7aRSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GCL9A1/6Li//v8GEmYDjgLggmzSjZ4cZ4HHbvIpxLa0=;
 b=u7q/4oOYHqdhR2QzK63Ofu7Z+zSD600D4Q2Gy42jU7ZmKRui8ec1D9O+N6m5cnRX9jO5kYb2h8ZSVwKjBEsVVLHB/Z8ugsKzuxnHDPmpUM2iB2HquMsvWobn7FPRha2lrPzrTjEdQbu3s2sRLq5/l/ZOKTWqJRYz6XGXBEiFGigARFMHqQ+kqqNhsQ9YeSRIO1lclEO01S+AnJnRGCutYMrzmpMLpL0g2D/H6C7irzsdAxN6vL/8U0inTEwdMuWvLmYDX5V6ZGuCMF6ZUChjC+IFEw9bP18bZuN4+vYpDDQz9tbj7jTklqIEA8o/YvMr5m48b7aNnPJpMevKPAlxSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GCL9A1/6Li//v8GEmYDjgLggmzSjZ4cZ4HHbvIpxLa0=;
 b=Hp5cvgqVplwCyfg3u6nbSc3s+TdYQHl3b1Bn8FDC8hrHn4TECD6s+pcwg43KkSbTNtg6jjdACIal7qInOo5XNu7XM/h1nU79fLgtIuA6bvKHV2DANmAVgH+uOp+paS4DPvevRFtOCluU9S0K5GP0fIUPT117pEgfqXJKhwLo5dk=
Received: from BN1PR10CA0022.namprd10.prod.outlook.com (2603:10b6:408:e0::27)
 by BY5PR10MB4292.namprd10.prod.outlook.com (2603:10b6:a03:20d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Sun, 30 Aug
 2026 16:28:29 +0000
Received: from BL6PEPF00022572.namprd02.prod.outlook.com
 (2603:10b6:408:e0:cafe::8f) by BN1PR10CA0022.outlook.office365.com
 (2603:10b6:408:e0::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Sun,
 30 Aug 2026 16:28:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF00022572.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Sun, 30 Aug 2026 16:28:27 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 30 Aug
 2026 11:28:19 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 30 Aug
 2026 11:28:18 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 30 Aug 2026 11:28:18 -0500
Received: from [10.249.138.105] ([10.249.138.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67UGSFar3358208;
	Sun, 30 Aug 2026 11:28:16 -0500
Message-ID: <2dd753e0-ec47-49b7-89ff-e285af71eea9@ti.com>
Date: Sun, 30 Aug 2026 21:58:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH v3] ti-vendor-kernel-headers: add
 recipe for TI-only dma-heap.h ioctl
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
CC: <afd@ti.com>, <praneeth@ti.com>, <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>, <s-kapoor@ti.com>, <p-gupta5@ti.com>,
        <u-kumar1@ti.com>
References: <20260828145834.1304057-1-gehariprasath@ti.com>
 <20260828174448.GK19759@denix.org>
 <f12fc893-5928-45e0-ad9d-3966d3bbbf87@ti.com>
 <20260829200440.GL19759@denix.org>
Content-Language: en-US
From: Hari Prasath G E <gehariprasath@ti.com>
In-Reply-To: <20260829200440.GL19759@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022572:EE_|BY5PR10MB4292:EE_
X-MS-Office365-Filtering-Correlation-Id: eaa73ea7-9891-45f8-311e-08df06b3b87c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|18002099003|22082099003|56012099006|3023799007|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: 
	Cql3jp7BbqBoMYT3DV/r2jMqT7mtej6CDWrRLPe+eytmnOPw5k05pDsM8IpUU8nMyPt+chU9VQGxP+QiWjJUN5EOU+M3ZDqG7lGWrkcK/FhddFQIggNTL3/P64TVYBoW6IlYeaGeJJKGppv7iPq9vJdDYKyy1S3LWPq2xoxt4n4K9bHSgu2l2gWdXJ985KHKUK3bewV1QSEIsGFHNMhwTfuPL/7yVUkdNppmzmQtlAx7Tl94TZw5WGvhMxLKqjmrksmmg9WeAl8OEAEI7hNBckjtrTEZA0oP1t/FgA5Cvs7sz/aruyjuA60c7RppXqDulVnXrzvywITCDcqhcRRWYUClNaEPULVhXw35Ks3GiCFXNWbWj12e0RHWwEzzsx0MyiwSKn1Ya2xecvwvXk/bv8tC2ihMooj823V8GJoD74k6aVldeesTJei4ZmwaSIDZ2AbpGjzJvVJjjIf/oinM1AAx2onUBJ3I3tg/yrfXsUcibZNDceSGvWKQYtPP/A6vIh9yZAkNxaONmg3O1eAgxpm9U1tSUSRKAC6uO1pUOuaJ/la/W8ZVo0QRohOo7V4f3wuPloY7nK69mhmBcM38rLzTMnSLevfcYDPoVAf/uf5fqlTVBJ82CejrYpmOYvJ6S80Dsxd4LajeLniD/QXLTDFXX7r3uUQBD5wOpPiu4BAYHcvwiPDzgZXfJjpS/4B1/xsgg3x0zThOKxYyPDaJHw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(3023799007)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	+QBMmqdjQhCr6gH1Su9tEsNd/3A23zRbxFCrHxWwXq8Bjx1V3flUKnIHb1TUaYCMC5QQjRaE9w1PjaTfnI1a8jJbCt3xZKtWUuoFmca0lfn3bg7WMr0dQIfOrDoyCgNwxk09lZGs0hkgn+zTQTWlru8KXh9TEIRCDvcWVoGZGnpJfnuiLt3QzfNXZwzi7iFiM61lH+fZyNPGRWKTVYJAXZ70vr6MMe/E9u+IftBF7zXDyyT1ylw5NUkrL+BbBG4KqLXliYeuoYj+o6FBsiCpr5nRL4PhYLpuM5R29tvNph+aie2FVvM/Aa4GK0j0COfsoVCvcuH6ledUEmLzIUu7hMr1NbpRtSRw2DdCiw4VXX5tUw/DJ2tZoeQn0XG+TTFOKj8WEzluUut4zOkZ8x2CI5+2QAFUAgfaSfP/i5PvdvSWattyEJ1eAWptoL5LKQSo
X-Exchange-RoutingPolicyChecked: 
	iawtDeVedEp1O+BTpGKrYerrWTRY5M90pGMLiI2B5nht9VcWeIo6WjiignS43u7onKEhsJMkcRRwrrAkSzfLX/psgzBt3AU282SToRI821+IJCeS/ZPAcTv0bvh7SSOUqPLucJvmCg+wzNHIbC9UV02SAZBUEoLVbe1WC4cvniqWpPeNrmLGdbydEoHP1OkKPsBYMHXGV9bxvfFo2Gu1knyG8xfKpXbXwPIbxeK6ILFuGmpIp+Su7o0BS4Rgo6nOAbnev7R+ZwqWrk8fcT7bSAe9Sbtjwqjj4JhQW3z9Xwz2/uk1yD4zZv45nH2//1iGH4cWV0bdDwFNlBkTgO28Pw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 16:28:27.2795
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eaa73ea7-9891-45f8-311e-08df06b3b87c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00022572.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4292
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDE0MyBTYWx0ZWRfX2pZHQK7BAF3t
 6gCTjTZo3+gzhOCYCkV3TMKNIn6FjcACano4NoTFV5XPdrhhdHcC6IRINxJBIOnaI9GjBxqI2tT
 hI5aXpNvMRvWNTOs+DpVJ33eVzeSnEa2BWXPewupHvXKj557/hhlv+GkYuVMcdokMsME7Ne4p2E
 65EwXhU3z2mWTUxw8tJOmUIkoX3qALySJbhpoHZnZZBBbFVAjAromAehvYm6u/WeEsiKT10CFtt
 TkrLgPkLNMTORE4X7dEewOqNXiY7ftucoiQCV+t2OG5fzY62N/RAkS3vh3KQhNZqqwWQ5hHfunu
 ilHht8tevrZGB5Fx/s73dDWBTI0Q2mVlXZNYk8qqd+z8XLdxXIIaQVWFxFF1KJOpq5gOfFczWaA
 GKHLF7p5KxJiQ0IG0ZoQHdnfEht74yuGLs3L4jZ3fccHg654xpUUbiCLbtK6SE+dfa2KKdwoplP
 Go2COTedmKLPAW9pzHQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDE0MyBTYWx0ZWRfX6FnnPO357zmO
 +2bBQfbcm6MpeqYulTY0M6vkpQqneKePS+C2vGZDPC0oEUd5WB8i8yDyVAUjubWzZo57wRnfpFd
 t4SWHuNJP4RPP7FUCHclPssasbCe6Pk=
X-Proofpoint-ORIG-GUID: dfbX_kfoQaWwMCYvuEjj6jc6HU2sifRj
X-Proofpoint-GUID: dfbX_kfoQaWwMCYvuEjj6jc6HU2sifRj
X-Authority-Analysis: v=2.4 cv=LrSiDHdc c=1 sm=1 tr=0 ts=6a945a31 cx=c_pps
 a=p/cDci9/Gahjm/bBNnPm7Q==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=S9v12bvdLZJKoic-7JAA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300143
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 30 Aug 2026 16:28:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20314

On 8/30/2026 1:34 AM, Denys Dmytriyenko wrote:
> On Fri, Aug 28, 2026 at 03:54:00PM -0500, Ryan Eatmon wrote:
>>
>>
>> On 8/28/2026 12:44 PM, Denys Dmytriyenko wrote:
>>> On Fri, Aug 28, 2026 at 08:28:34PM +0530, Hari Prasath via lists.yoctoproject.org wrote:
>>>> The TI vendor kernel's dma-heap.h carries DMA_HEAP_IOCTL_EXPORT in
>>>> downstream. The standard header provided by linux-libc-headers' wouldn't
>>>> have the custom changes.Copy it straight from the kernel's staged
>>>> source tree (STAGING_KERNEL_DIR) into a separate /usr/include/ti/linux
>>>> path instead, for userspace code that needs it.
>>>>
>>>> Signed-off-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
>>>> ---
>>>> 	v1->v2: Address review comments in commit message and recipe description
>>>> 	v2->v3: Fix the patch subject prefix
>>>>
>>>>   .../ti-vendor-kernel-headers_1.0.bb             | 17 +++++++++++++++++
>>>>   1 file changed, 17 insertions(+)
>>>>   create mode 100644 meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel-headers_1.0.bb
>>>>
>>>> diff --git a/meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel-headers_1.0.bb b/meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel-headers_1.0.bb
>>>> new file mode 100644
>>>> index 000000000..5d570689a
>>>> --- /dev/null
>>>> +++ b/meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel-headers_1.0.bb
>>>> @@ -0,0 +1,17 @@
>>>> +SUMMARY = "TI vendor kernel uapi headers not present in mainline linux-libc-headers"
>>>> +DESCRIPTION = "Copies select UAPI headers straight from the TI vendor kernel source \
>>>> +tree into a TI-specific include path (/usr/include/ti/linux), for userspace code \
>>>> +that needs them but can't rely on linux-libc-headers carrying TI-only additions."
>>>> +LICENSE = "GPL-2.0-only"
>>>> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
>>>> +
>>>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>>>> +
>>>> +do_configure[depends] += "virtual/kernel:do_shared_workdir"
>>>
>>> Why do you need this dependency for do_configure? Moreover, since you don't
>>> have do_configure nor do_compile, you might want to mark them as "noexec"
>>>
>>>
>>>> +do_install[depends] += "virtual/kernel:do_shared_workdir"
>>>
>>> How do you ensure that virtual/kernel is the TI vendor kernel? If it's not,
>>> you'll be copying the original unmodified header into the ti/linux location.
>>
>>
>> Should this just be part of the linux-ti-staging recipes?  That way
>> we can correctly only include it in the versions that have this
>> file?
> 
> Yeah, probably the easiest and cleanest approach...
> 
> 

I dropped this patch and instead I added a simple do_install:append() to 
ti-linux-staging_6.12 recipe.The header doesn't get installed into the 
rootfs, but I could see it landing in the kernel-dev's ${D} output 
correctly 
(arago-tmp-default-glibc/work/j784s4_evm-oe-linux/linux-ti-staging/6.12.57+git/image/usr/include/ti/linux/). 
It doesn't get installed in the rootfs since kernel-dev package is a 
build-time-only package.

  Since the only consumer of this header is in meta-edgeai, it makes 
more sense to keep the whole thing self-contained there instead of 
modifying linux-ti-staging upstream.A linux-ti-staging_6.12.bbappend in 
that layer can install the header and split it into its own package, and 
the consuming recipe can RDEPENDS on that package directly. That keeps 
meta-ti-bsp untouched, ties the header to the recipe that actually needs 
it, and avoids shipping it into every image that happens to build this 
kernel.

Saurabh,Puyush let us know your thoughts.

Regards,
Hari

>>>> +
>>>> +do_install() {
>>>> +    install -d ${D}${includedir}/ti/linux
>>>> +    install -m 0644 ${STAGING_KERNEL_DIR}/include/uapi/linux/dma-heap.h ${D}${includedir}/ti/linux/dma-heap.h
>>>> +}
>>>> +
>>>> -- 
>>>> 2.34.1


