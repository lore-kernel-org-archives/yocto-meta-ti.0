Return-Path: <b-brnich@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC4FCA600C
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 19:17:06 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2550.1791487022858421635
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 08 Oct 2026 12:17:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=fVfUuz+r;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=i98+BTx9;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: b-brnich@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698HVZD9484710;
	Thu, 8 Oct 2026 14:17:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=5aRA0n8VKwcKrbl4O/Uy5BR8qBeEV8h7im3Pbw1xo
	bc=; b=fVfUuz+rvrehCPQnu5GaNZNdLFG/lCExSnKzeP7RFAAWrueU0/EtQGd3z
	aKOin7p4xahU7mdYBkPJJ4H+LaI+rVjV1Y/9KdiL3UTDjGbko1VbDd1Uv2w9b/6K
	juahEi75wCBZxOT/xDefI1ZWrQvutGL/kNqWZl0uY6KTZ15em0MAfAbFs7uCk4Gx
	RDYzfNsyJrmnvQig2t1FonfQlXApGLX9Rbej3dsinB6FnGquBhDCgrgZRKI1SVcQ
	Z1BBzwW02+lKuBVdEauSIHw67NY50TNh5dAuc/9EGM4/tK1KEN/9eDZtxTOE2iyx
	OXP+FBzcXuVaZpLDfkNZjAKFfrW2w==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010055.outbound.protection.outlook.com [40.93.198.55])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h676bc4uj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 08 Oct 2026 14:17:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aUiFmEn6tNTp7wYiv8OFU0Ewc7QO+BYF1sjuKjHFcsDPZZI8djY0DTyjlNxegmUH2qNgV9sj4USWyCkw9EdzxnXZgtoGbslVuzg1jgvzBG8gvupzqhLBVsOsrw1usqVhaFwNk96Ru71zuAUlasaoG95m8o1ksUG0ZZrSPtw3W5z72f9am8d6vsGxMWjJDvyRJv9M5s8bFloIMq8ShG7a9LfZlUtpBIS4ntya0jdJneylZ83R+VGRoMfDcQjflE7JQGe/uBXL5zOMDh2R9UlrfvLO4n7G2/0m/ATeG9dZG0MFfUXrJ1b0KorRNxSAwQEGFmY51O18E1Xo0orBoS03DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5aRA0n8VKwcKrbl4O/Uy5BR8qBeEV8h7im3Pbw1xobc=;
 b=NyP52qpVuwwaOYFCFS43Zr1e7zLdpDVSpqo/n++1tApBElmibD0hw4pFGAgc683xypJgd4CJZb1HgZZRdqHhKi37IdwoxUUAeWjtV+qL6bmeEEAC2sPpy3WCnra6l230we6CFRxZ9uujMqAt9DyqOncLNz2Xh79MFf5p0F2/1tuxD4/EqGwHAnn+9s40E3r+Xj69/FV8LOjoxz1Xr13bxF1/2Z4yeQ6c55Y8xji+0Pxt3kw71Bc0fgZUU+xggCgxqXBClY0R66dt01HfBoC5e1FQzChDjASsX1NtSdIE1X1180Q0r0TgK//Gb1qEfodUkSbsgEZHNFfEczWvoukFMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5aRA0n8VKwcKrbl4O/Uy5BR8qBeEV8h7im3Pbw1xobc=;
 b=i98+BTx9Yqwja97Uzda8eJ2lO2R5yIwTQx3bSnaEXNXJ1nEBnqnMjBFg2UuTqbToUaxBlOQBY9+K1tfLICedrx/vrsDGWe9Bd5mMg1UkYcxXqMaZpbsO39fwXHgAdb5faMPH8KL0wPPMHcsOFGo747xDCbjiYa2bbHVGdJmaTHI=
Received: from DM6PR05CA0058.namprd05.prod.outlook.com (2603:10b6:5:335::27)
 by DS7PR10MB5997.namprd10.prod.outlook.com (2603:10b6:8:9f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.9; Thu, 8 Oct 2026
 19:16:48 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:5:335:cafe::2b) by DM6PR05CA0058.outlook.office365.com
 (2603:10b6:5:335::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Thu, 8
 Oct 2026 19:16:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Thu, 8 Oct 2026 19:16:48 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 8 Oct
 2026 14:16:42 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 8 Oct
 2026 14:16:42 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 8 Oct 2026 14:16:42 -0500
Received: from [10.249.68.156] ([10.249.68.156])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 698JGgtv3862494;
	Thu, 8 Oct 2026 14:16:42 -0500
Message-ID: <a7acbf80-e70e-4b68-85f7-86ed7d019a1a@ti.com>
Date: Thu, 8 Oct 2026 14:16:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/wrynose][PATCH] meta-ti-test: Add gstreamer to
 multimedia packagegroup
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>
References: <20261007165126.797434-1-b-brnich@ti.com>
 <20261008190443.GR4190@denix.org>
Content-Language: en-US
From: Brandon Brnich <b-brnich@ti.com>
In-Reply-To: <20261008190443.GR4190@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|DS7PR10MB5997:EE_
X-MS-Office365-Filtering-Correlation-Id: 17b9ce5f-7fed-44f0-30b4-08df2570b318
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|10067099003|4143699003|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	2MleAXPk8ZqLHeE3ZKbMRViL5ePlDm5YKuIyTaAEOQJm0KnlU5n5uQhRarvClktBzB4Frz/FFu+s5ab+prthi3r6ynRuefxp4o9YSOB+TDbYUod6s07jS2CN+0cTPAbgx3Qk7u7AG8JdBsuyhesSJ+/bmX6jY2Wj7t4LyuNYzVJWkTx/qauJLMFkI/AloyJEcswReAJDksHSVhdtAAAeDm3OoEc0inWtXRdsluWpKnNtpP7si/8mQ0/M5E1LgkDk+0j6qISxnuGVPyFDfEfwEuDLZ6lSTchi+DnQP+JOOpMbmz7M1xwOzAH34IcXvra88pbwpD2uLhIa3Iv89DN/GfVfVhdOGkXOirbl1PYv9PvBE8NRWdINdDb+mqBrY8+HxAXV5WQ5OFMdMhih7ykZwZC0KZwZuoJIbMgTZEfbl1kFWncbkcJXWIPjvr8vqSnzsVUNt79tPfp9pQfp15LcFJQgKS9ThHvTLbr5IVyHwPumzfCcCxVYNIDyTlIxCypgyqzrGpDqsXcRkqivPZ3W10qB6xEuOK/kSzOuwaAc2+jYUPHVdJV35eb1atEr0DZPESdyk+nb1spe5MaI+cnFTlg+DBUJDJgxoMnp51gAY6vuQ1d13EL1VZxDk+FSiIMEYiaPOOtO1tqaYoE3RPbX/EC8dRhOW3lYfgbwfjVdvhUZRUgOcwKhN1vuupj9SmODdLNPuSpf7OReFawZ9gLWUA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(10067099003)(4143699003)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	8I1QDbcGcLgJYHvtCdv9scbpRdaARJ0gt++nxVax4BA5/MjliUX4NGZw4icvhJpnseRvzT4B5W2Moi7rS14uRk/shKeBi+x4KEVl+AUSKS+NkgAmiQxsUXZ44PMVTs9x1/oPROqXsYRdxQVbQlQtDYTfFME4WWdoqMwm98sJgbx9IVse5G7TH6hw2fbiuUyxaVdOAgXIQdhLAWZKyKKMPvdh+LZwnp0abATRoKSBeO88WO0E11kd5jnBqmXy/OZz1A5YnP8f6gYA41B1Oetw8L5zTJnJMN0rxVeZXe0zzdLt4pb7U7rdJBpaww2NjX8b7YdzjsAjYZlL+lP9Wewz1PGVaCa5zkuM8H8ULgodfdQmnbyvZ3ufd/MNuE4oAu42otJNddJNwXLQB3zbXjtUJBV8RpItMfpxqs+/paZPwbad0DTWQMWCJMarw0CnZ8Y9
X-Exchange-RoutingPolicyChecked: 
	qve986QEapjND5rfjmtASKoGUWtdXAoxTPTMfw296NE3oahKqDFdxUP5FnE4YYt74+cbA7n5La7xyzqYLbRAPq0XBe7FGSoJwSquev0oTvE76a4Y+TlUV0s3AOrM7ozYPFUOne4+4O7ODUxeEcuWpRiQIBgrzwhevnZmJ7FrSrzylH25VZzuOH2GvXzMw7X/mKRxrNTgabx2V4iMSFcAGQ6GKLIsdGTPd6bGns8DxnnKOeYCLQmCC/dVAMWrlBrlKrAwbxSyA2ypyUEsrASqPAW+HuBJVmu1whyUj5FzLA+iEoVbCLWHFjscEFA+zw7oDqUiL+gIAvW73nSTAYVe9w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 19:16:48.0161
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17b9ce5f-7fed-44f0-30b4-08df2570b318
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5997
X-Authority-Analysis: v=2.4 cv=A8j5rKWG c=1 sm=1 tr=0 ts=6ac7ec2c cx=c_pps
 a=aDjbMzJe6/auvryAEMJQMw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=iGHA9ds3AAAA:8
 a=sozttTNsAAAA:8 a=wCD0xJtQTZlAhsXW91EA:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: lvaC-ob8sWFKVB-Q5faGjQ2yFZqL-K_q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA3NiBTYWx0ZWRfX0Fcc44MViJIo
 P+xOqyjJWCQRVJnaqGtus9iUOmNnpCYO5GPSGKjRBqqnrd+8Ii3GSzAFNu4teZSFY4Igst9XDjg
 LhT+qfnw/V0Jgk7HR9H6dzfFMQRj+r7x6p+qFg4FZC9sJWaRdi6SrqT7h0B7Og+XyQ7jPMatYds
 o/8mM9GVCw5phgFAaC1vt6MFel5u01dCQlycMgkusZdXOwDrVfoDAsbHIIPSF4x46vkSAYA+Ymy
 crAg27pTWox6z6+uYo9VOc7Ua9jvJ1MAl2bduohoPNrg6movcljCQoDNXu6kCYamNZIpEyoA4Z9
 d+1lDIEIKeNCgt/r8N2Li9n9myZSl+vLnkyh3zFOIxEBgFiDYt9lzwWdqvVDYnU9sXHB4M1DJJ9
 v5GTCFAcLjtVNN+qo3DW2uEy3oMG+4iBbgx9gYPHTBW4LI+luR6kCCfqpJqpBQLxlI/z2gSyON1
 khNZqV/z/U/wxrHWEoQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA3NiBTYWx0ZWRfX2XOhE36tK5jc
 XG9ZP3OkmV0T/0zNIhtujAHZDGAzQAsg5qqWa+6HPgmePaya/4e3I3nWTohZDjLkOyo+aAzJsWr
 4KePCbDujEdqLduJnIlfFrGkwuqOzps=
X-Proofpoint-ORIG-GUID: lvaC-ob8sWFKVB-Q5faGjQ2yFZqL-K_q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_06,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080076
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 08 Oct 2026 19:17:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20446

Hi Denys,

On 10/8/26 2:04 PM, Denys Dmytriyenko wrote:
> On Wed, Oct 07, 2026 at 11:51:26AM -0500, Brandon Brnich via lists.yoctoproject.org wrote:
>> Any automated test for the HW accelerated video codecs require gstreamer
>> to build the pipelines and handle passing data to the driver. Add these
>> requirements to the ti-test-multimedia packagegroup.
>>
>> Signed-off-by: Brandon Brnich <b-brnich@ti.com>
>> ---
>>   meta-ti-test/recipes-core/packagegroups/ti-test.bb | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-ti-test/recipes-core/packagegroups/ti-test.bb b/meta-ti-test/recipes-core/packagegroups/ti-test.bb
>> index 8a348c26..b7474894 100644
>> --- a/meta-ti-test/recipes-core/packagegroups/ti-test.bb
>> +++ b/meta-ti-test/recipes-core/packagegroups/ti-test.bb
>> @@ -94,6 +94,10 @@ TI_TEST_GRAPHICS = " \
>>   "
>>   
>>   TI_TEST_MULTIMEDIA = "\
>> +    gstreamer1.0 \
>> +    gstreamer1.0-plugins-good \
>> +    gstreamer1.0-plugins-base \
>> +    gstreamer1.0-plugins-bad \
>>       gst-devtools \
>>       v4l-utils \
>>       yavta \
>> @@ -183,7 +187,7 @@ TI_TEST_TI_TOOLS:append:am65xx   = " \
>>   "
>>   
>>   # Disable due to breakage
>> -#    viddec-test-app
>> +#    viddec-test-app
> 
> Probably need to drop this chunk that changes the whitespace?

Not sure why this got added. I'll send a v2 removing this section.

Best,
Brandon

> 
> 
>>   TI_TEST_TI_TOOLS:append:j721e = " \
>>       pru-icss \
>>       ufs-utils \
>> -- 
>> 2.43.0


