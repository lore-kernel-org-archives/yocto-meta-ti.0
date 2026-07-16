Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51150C44512
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 16:22:13 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17023.1784218923222777480
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 16 Jul 2026 09:22:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=bYqX1v5K;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=Cm+bUKhB;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66GDLc4u2361955;
	Thu, 16 Jul 2026 11:21:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=i0kXvJ+1CweIU6Z5vKa2ON3bsFfOCFXuPEbVt90lI
	o8=; b=bYqX1v5K8IPYQw47ofbxA/eqeMR9Awg7/pfLkciLVFsnrz3LlG2Jb0W4E
	j1XOht+JjkjWJFfZO6vOZ+il80R/xTajeIl6knnNYjcoGg2nHHeJ1oxv6wH3D59l
	kGptF2xTIUAJzjbK71NPNioV9S5J4WcN1vXkAsakHKZ/SR4FepGyQ0lncrIteEEi
	5uHqYhWXGnwsLVZwmytgsp/HuN9zJzCAnIyWDEW7AdSgbTbyUiRvUGTxvrWcnXMH
	wrjlgXyjeIT+ULuC4j0SiN/9MkS0UutRn64eP3Rf8d4JQrm9MnrbRT5WkicTI1yv
	0RK9l9posbEOTAnn+XRgkcYwr9uPA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011003.outbound.protection.outlook.com [40.107.208.3])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fep5sc9k1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 16 Jul 2026 11:21:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hHdaxzubcWLCBXZJfDV6xynPy3B9PJnlza3SeqPOOz5AzFQ2ITmYV8YH3SyM93J6XU/Ro+C+KDsExnohSLFi5MMWeR8ObjrInaM+Ven4DXvrN4H818+Tt69FhHVeP8LZ0kWGXl+bFvGj7dzVw9g3ekZb2vlRVB1XmYmnABTMcxczVFMTuZmsuz8M+/uHagRR03K8TpAvordy37Aduj0mRFkGsb49CGosQQeKWUy62Q6IM8+WNfKdqvLt/TXoKxd36s1ZkmM79OGZcTbv3aMC9HpvF9D/0sTuDkrLFbMwCQ+Q3J54pkdNraR9Q0PDjajQWM3hPsziq3dPJ1TKA4PsIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i0kXvJ+1CweIU6Z5vKa2ON3bsFfOCFXuPEbVt90lIo8=;
 b=DaM54TLnubC3Ggnhysp6WQCOZ6P1CUW95devab7lslYxqANjkrCXHyPOteHdFeSDyrW0Nj9eOdo8374eq03sRlrCaCGxk0+H2viw8MlUJVnGLM1JA00AdF5OjF+xtlfFaeKzL4BwhCyPmaUqJt1kyx8u9n6kPAa1FQ81R5x/ubGiojedLhIaPpX9Mu5L4ts/YmYG21Yb8tBViodw/a0mMAHLPee55+/CdUryEqzt4/7RjnMt9SV/hpMobsgG+XV+QP1A0ue8sf7otGkWlktgNzpqe/LASMSUGgBN1yZllm5urLsvM8QDaclcT5PGmPlDQ112nq1lBgCkl1Bcue2C4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0kXvJ+1CweIU6Z5vKa2ON3bsFfOCFXuPEbVt90lIo8=;
 b=Cm+bUKhBOZK6YGsuugf6S296hv1L1pzX02xLuIzhthQ9pOB4+RWKiQlDfBeCMqrJFf6KtSogQQgWSNsEeEl9c/xGWheM9iz4ryxzB1qbrQsFC3LOpa5pSLb3o9QpIsdl5wew7oKufrfA9AGuLscDwi1gjiYxHNzwUm41pL0r7do=
Received: from BN9PR03CA0883.namprd03.prod.outlook.com (2603:10b6:408:13c::18)
 by DM6PR10MB4153.namprd10.prod.outlook.com (2603:10b6:5:21d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 16:21:52 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:408:13c:cafe::aa) by BN9PR03CA0883.outlook.office365.com
 (2603:10b6:408:13c::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Thu,
 16 Jul 2026 16:21:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Thu, 16 Jul 2026 16:21:50 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 16 Jul
 2026 11:21:48 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 16 Jul
 2026 11:21:48 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 16 Jul 2026 11:21:48 -0500
Received: from [10.249.65.118] ([10.249.65.118])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66GGLlnH1739478;
	Thu, 16 Jul 2026 11:21:47 -0500
Message-ID: <1303920e-9c6a-4fc9-b441-a84514812992@ti.com>
Date: Thu, 16 Jul 2026 11:21:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/wrynose][PATCH v2] u-boot-ti-mainline/next:
 Update git server
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20260715161432.1790195-1-reatmon@ti.com>
 <20260715225454.GN10186@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260715225454.GN10186@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|DM6PR10MB4153:EE_
X-MS-Office365-Filtering-Correlation-Id: 06f858a8-53cc-4965-5537-08dee3565733
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|23010399003|3023799007|4143699003|22082099003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	1SfH7Tt1Iy85EtX/VjSaHxZ2y7Bu5wl2JNnyCCYvOR3r8i48fspUuOaceXjIkhmNgWw0VqOC3oLZIkxjGz36fGMz3utjkUvBwY/3nPKB1rjemUFWOIWam8ARdlfkplJAIAKtsHfX+K0mYpJNvMrC6DSQRhph4W9CzNCwQZl/ecISPwzmGYEje53W5y4/Sw+3dOWpvAT+SS1TtTuB0vSW0pxjPdEey+T5m8nZSdTb6+AaLlfO4moPIfLUG9R+7F+zmA/jdzYOpFpwhP+m22s9Dat8vg3FOMmvovSo9YWYJLP/rB/6q1yCNUYaZv7M6c5ZrXRHabPjD+SmbLtxbGwM11+AwTi19Po/PPwkHzwzAKkShG527fpOJNApkjGEA8P5rpEr/m7HKIbkNiDUvCp10ZuK6cXXzO8qO11VqpFojoZ3F9spaxlvZ9cziy9+O4FSKWHmHdqVAERE7L6bOeH0+mm0c35EAngt7X94nxjbUxdHMxKZow0pAR9wHPtPZOMHQjeCWwbj7ciuCCcyau63F3qQ0Gr6+R28uM1rs26TvfrfPVi8PVL9QHkQuSr9qbdhe0LxZroTrn64hdaGTv66d6jsMsvsVrQgwjtZLSA1MqhKUFJ8LwJkB3Luu9j5xhFKT6xXHrvXQtk9zTAzUQlI1g==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(23010399003)(3023799007)(4143699003)(22082099003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	7P6T3gwq+lz1App5eviiPPVwpjKTEIKBEipiktXF6iUnxEyThs1buoiMQC7asE96b3a52SasYZXyxRwIBvvaOTb0c/GlovViD1H1FjqT+EffdhKa5gdpKA3a0L03pzkik0V+T4ifppSEVprQkdwndU4n9nKL+yUCjYSx3N598Hy1/G1nXdrlgKN4JaK/jqZHszhrt6Ex67zPxfcGuCWx9L9SF3zfMZbv2VFiC9I3crVmk7bq53cpxCpGwv1rnGGN61C91YfYWOXqJe8ialTZIuW9v4miG6jkFHdAQyczmuONtPs+qSP1feEviwhkjGTc4adTONZjQ9SsoNXbODTkI916ry4KmbhBOlYR9pWcGx2n7Kr8MjLjH7z/PmkAX06WrbC4t829G6oeKKDsy8poPhFB6s74WFTiP4Qdjmw83NrbeEpfvcWx37RPFyJu4i84
X-Exchange-RoutingPolicyChecked: 
	QdiIaNgKGd+gjKcDI130hncBmZjrBMy9bOqxJSvoBisYlhEslYIyUYrIr/Y0jaMYg2HOeEDn+6u6iwaVZPFWsoxkvKuo3ZAjkOP6+xm1sQJi5zyQdXJLHcItw+yT+8Fc0w2Fd0q/tFwcUBvrZiIojh9/khxhvXeSNxkEQ9PucTLkWN329BIFbPjCsTJ1cBGU7sxJC6mnTKTN2e2rCgNtIPAjvje5fXf9rCeiwC2K/F9hUUqEEdIuyNLL/u+RMP73j9KAm8gD62+wRQSadW/UxL6cDFxcWWLW3oggAzmDcPbMF1NFDgcZKpuKRzS6A+hBd2kw2z0IBnnexiCRT61kDQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 16:21:50.1755
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06f858a8-53cc-4965-5537-08dee3565733
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4153
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE2OCBTYWx0ZWRfX+F9zThdQe5O3
 PyQnxdVOjPKKtF0LZ12Ikk+BRYYZ/hUkjGR/yQRKj3FBS1wvq2I8+JtzVispX+peumJw5nIhm6I
 CPDb3uHwzBOGizLcmxh9J00JMj+piNI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE2OCBTYWx0ZWRfX46gpilxZH4Ys
 9dE+YP/dEd+kJPsFW4bowQ9JLe/bPDAE4N02WA4Pf6JOiu9y0LVoggPfrXfDaYFQMze1ZLc4jdu
 kgOCJIoLkMCiVybqn/IcgKdPz4SvuSs+Y/O0bFDLLbqPJ39xkGg819BdBQQWXIQHSnTc7U7ZK4z
 krmqXFVqzrSy+cun+jlWJ76uKIpDoaOezyT0ytojrJEomsH809pEksTCb+4Ya16KmBN8Fqz+Dpo
 IL3Yi6jbS2+XNuucJSqjoMu+n6qpAIk1xL75OUONvRSRK1s0Ia9A48NndzgN2Z/1/5kUUBtoTwD
 G9+SX7NLZtSs5R5OGEXHwnjPsKv65I067hfOdrlhOJyIKwmTEkJTlvESXsOiE+sd19ZhvJghH5R
 m0rnjzl1zaDh/P8gsjqEuvBN2LyH37ZEkiDaxgZVYtj/i7Sw+sNU1koASwJGi6hqbZwTpcoDRBe
 f82jvr20wbgncWsDsGg==
X-Authority-Analysis: v=2.4 cv=Zrjd7d7G c=1 sm=1 tr=0 ts=6a590526 cx=c_pps
 a=8jXpZF9zWVkTg+MA9bOgkg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=1VxDqnHFAAAA:8 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=fAJKYNsuOZj52Psugt0A:9 a=QEXdDO2ut3YA:10 a=aZ5uHUMKh6B-zo3GvD48:22
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: qpqwL2ACEwki1NrkU7Waf0s1LnAQnLlQ
X-Proofpoint-ORIG-GUID: qpqwL2ACEwki1NrkU7Waf0s1LnAQnLlQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160168
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 16 Jul 2026 16:22:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20150



On 7/15/2026 5:54 PM, Denys Dmytriyenko wrote:
> On Wed, Jul 15, 2026 at 11:14:32AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> The u-boot project has moved to a new official git repository server [1] for
>> all of their work.
>>
>> [1] https://git.u-boot-project.org/u-boot/u-boot/-/commit/2a6ca4ad04e64488ac41c3683cacd44173a96d24
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>> v2: Needed to update the next branch since it changed in the move as well.
>>
>>   meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb | 2 +-
>>   meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-next_git.bb     | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
>> index 03fd6193..2daf86f9 100644
>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
>> @@ -4,6 +4,6 @@ SUMMARY = "Mainline U-Boot for TI devices"
>>   
>>   PV = "2026.04"
> 
> Any specific reason mainline is stcuk at 2026.04?

The master builds have been broken that drive the auto upstream testing. 
  Once we get the master builds all working 100% we will revisit the 7.1 
kernel and the 2026.07 uboot.

How's that going?

> 
>> -UBOOT_GIT_URI = "git://source.denx.de/u-boot/u-boot.git"
>> +UBOOT_GIT_URI = "git://git.u-boot-project.org/u-boot/u-boot.git"
>>   
>>   SRCREV_uboot = "88dc2788777babfd6322fa655df549a019aa1e69"
>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-next_git.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-next_git.bb
>> index 9bdedfa3..4d5f4a38 100644
>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-next_git.bb
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-next_git.bb
>> @@ -2,4 +2,4 @@ require u-boot-ti-mainline_git.bb
>>   
>>   SUMMARY = "U-Boot master-next for TI devices"
>>   
>> -BRANCH = "master-next"
>> +BRANCH = "next"
>> -- 
>> 2.43.0

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

