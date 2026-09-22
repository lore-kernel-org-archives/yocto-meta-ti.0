Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A33C98302
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 18:31:26 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2866.1790101879202163652
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 11:31:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=exKl0O+4;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=MBz3bzwp;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI638E3341885;
	Tue, 22 Sep 2026 13:31:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=uqG6QY8Wv04aKD15JnQ+CYUXHdPgqKUfXxlYObobA
	JM=; b=exKl0O+4xp7wa3wF43NVHIpboXTHEGwtgztey6SZX4czW/muJqi+59r5D
	ZRB6Ks2nfc9uKZUaXc/u1q2YAGvxEAmA41+ZRlkoUQZaeoWvmF+aA7d5E+8blMfP
	bCfVV4M+OtR6Qxm7v1SZHTp0GIReL6K9GWj1M/GPOd+yn2iw5OEEELZhVvbaHUgD
	iAD277eq41FORCKek27uBgWX7/FtEL7YWEH1lQg4JhlTSDWJxcF5Hs310PNdwq8t
	WnXVU2HkChPdCy7WllLNpet0n7QA6DDTg3/5FD+iNo8epBgjFVRarRFbpLaWdYBC
	/r1Eu0rkIHfesLgxPhJmhSaDI4UMQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012070.outbound.protection.outlook.com [40.107.200.70])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gugcswdq0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 13:31:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XTrvizwERtsKwN3zQ3O5fci3oYlXbVCjxB3/bk6zH2iFB26MJbSh7HNTr/a9JZ9Z1FWeygqH6ZqAXGseIaigdSLqcm2NF5OaFg7gPpiZLSSWICK1tg/Xm3Ucw02CYV/VwXR6r8b2mCNugYAWNFSWgFZf3sVOhnrHaP3FbVwWjgOb8a9U8wMpPqNQvcXKqeWiRAIeVAKfRzvvF+ElM6I8GM77kZlwX1bg/lUQj+VEY7NmNQcGxsVmOnwnMl5LhzXnNEOTuzrJo6xzCwUFaVHZ8dWE8dMdOW0xnbtZCwMCjNVlhWQ7gf6k+DpPzWZm6/gKzPITp9g8pRetZ9grCWNLRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqG6QY8Wv04aKD15JnQ+CYUXHdPgqKUfXxlYObobAJM=;
 b=Mf0KJwNVD+34oOiyeyU+z/OFdfE6r02y87CTvkOUncyY8wog/NcqtvsAIQ5lUwzjBAAMGkjs3TAJ4wZ4ELXupLCBKHxQ2x+ilEGMNFbLDMn3m9w57zqj1QufVMfJkjy8+mgFcVifJk7uzFElAQT4jyumJynImwcjzNTtcHH0EgjEGaeJ96y43Cselqyv86PghZxgsdId5QA9lbY6QK7pMcshUM7wCUHmMTC6SGBVudTIilHeVDYqo3lLtqBODD2RIfJkblA7mfcjlk0QPH2gkh4OJWl913rt6mw4USfJQTNj89f7xm9XGjN5zcg/dO5vdmP3/I4DU77cC5PYHQ9X0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqG6QY8Wv04aKD15JnQ+CYUXHdPgqKUfXxlYObobAJM=;
 b=MBz3bzwpJ0uKaZ1rkbmBX0cr/fSdXb+Fa3yuqtPOoKJqAiPD+tXEGfl8KA2E/v5bSZghtsoxOnTNCg8V9ZywtbWqC0yqRPB7JZOHVQ2ryFo6f7bglmKEkUpLj0ndEdBJMwFMUrymIB77mwMYMTDlHbA4jgpwNMHOFx0QKKGjw50=
Received: from BLAPR03CA0100.namprd03.prod.outlook.com (2603:10b6:208:32a::15)
 by PH8PR10MB998090.namprd10.prod.outlook.com (2603:10b6:510:42f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 18:31:12 +0000
Received: from BN2PEPF00004FBB.namprd04.prod.outlook.com
 (2603:10b6:208:32a:cafe::ab) by BLAPR03CA0100.outlook.office365.com
 (2603:10b6:208:32a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Tue,
 22 Sep 2026 18:31:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF00004FBB.mail.protection.outlook.com (10.167.243.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 18:31:11 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 13:30:54 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 13:30:53 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 13:30:53 -0500
Received: from [10.249.33.88] ([10.249.33.88])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68MIUr00496941;
	Tue, 22 Sep 2026 13:30:53 -0500
Message-ID: <2b8c5cfb-1e71-422b-9d9c-59ff7c982536@ti.com>
Date: Tue, 22 Sep 2026 13:30:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] kernel-selftest: Disable upstream
 patches
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20260922144347.926114-1-reatmon@ti.com>
 <20260922182654.GA4190@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260922182654.GA4190@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBB:EE_|PH8PR10MB998090:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e3a257e-66ce-494d-a35f-08df18d7ad3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|10067099003|22082099003|18002099003|3023799007|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: 
	t+MMP/pGBWfikbJFbO5D2fb+RcSFZmPld8WxY/W9Cu/tXpCTYsgOpqzmxHU2qb7DhAYtQecDUd8fq3jgZVnqFacgc1pjc/6Zfg8x/miEzH27I+KpTJvqpEzosHju3/hL1HWcFyHkPQrgc64ngz9nAvhMy3UO2Hq7nvWU/B3NSNBN1JtbQvjYDjpzUcnOD24bEUtzzS0ycqRy7i0YMv1rbxcP96ujWjXoWD2oZErIOQaqtIvqMttZc+P/T1NVhu0p8C+AA+kE+3665JNYqM0Fe5bpKjllMOefUhlVlaWCiFfmfFbqjGFDM5uqFG9zzhP0bLcUR3wT42fl0O3ggG/3hY3K6z6m3QHMMkgF7jxYFTOxbnnXjQwekAieQqaArn7kegOAdP1Hxvsy77BK2UUkgQW3TuWjmx6y1mNXrZKO1agDvSMCBt7Q8Vz7Qvz/6ZEKVq6mws31LCExhZoBpkL7dIeaoXSKtT6pAiPDFUP9RkK4Fkkw74/wJvdAucFpc1V++nO6YO2a6yx1J6xMYeGOcunz3m5xnhfZdO/GxlmB5ZlOCCBS6+skdYCkMQWhxqD2i5lDjfv1PcyCEMsa8hNduPhPfl9AhCl0Vv4DMbp7+C45eHoatXckbFN5n3awvMw5upu+hz7vtrugYbUb6AuqC9mR/9FnrnLxUPWS3Ph5RjI=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(10067099003)(22082099003)(18002099003)(3023799007)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	zpitWxpCS0N7swiii04Ka1N9vOUzGh8IRaEeLpb2SYYt3wTS2lrTMDyIQT9taICGGEAPeY+Zts8WM+243nCkAc1S+e8FN5+14Qrjn+YV+4c0BU3vMMLb3lxqurUOykrzI+qlB97CMvX4eH0wzrStJMbd9faL1w3inJpXEz895b+BnfjVi46xM9KGjODltePSMvEFgO8BiRNVdD5kSoPfGl55ehpDKkMm0I6IJq8vcJhRwGdtr6C0zm+BwIrnImxRxfVd8ALAHEZqSF6kcwVLfMjOEtelEG6k+cKL0LgyMdCR1O2w4490D5FF0VDed1U+tK802bsn3Vvi6vdy9WpCIxINzPyitySxaIYfgroGqJgPwHClU/I024Ns4PKyvOnI/g/02PdcwbtOSbUd07IGBdxeFV7QofHja34WBIXITA6sr8E7xjKwbOg91M6yA9Ac
X-Exchange-RoutingPolicyChecked: 
	HdY5g38uHFqMpR8kC6+UH4xZTFAPzW5vflKO46mONObymr/Pe1YreF1E/BTbPoT5+zNUmvEg8q0TUfp9xOE8lwQ1XG3TMBbexzyKmggh3TgqxSP6whDm+EkH7dwxjs+qO+7RG7IbjefMRqOKzdicrooElys90AXW96SSNnZ5gJt7qOkG7dQYedHl/4xwAOx/uGkD5w72jc8sWHjzlF0sOP6O6ZiSNBZ9R05cyH1JKiRW8BogMeQF/sPB4UdYMcBvxENFrmftZqyp01aQCugAy8TxEvmp7hGOJB2AWT9Bqvulvwd7yI8qBoAvvgftXTbp/w9YbMtR1JDvxgHww5hbsg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 18:31:11.2073
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e3a257e-66ce-494d-a35f-08df18d7ad3b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB998090
X-Proofpoint-GUID: -PFxr16tcMHckgltOba4WCBlKCCIgFqs
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab2c972 cx=c_pps
 a=XGLhMEKp2bz25O9eZsCnQw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=Q4-j1AaZAAAA:8
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=FboCeX4KwuGyjm2YnGEA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI3MSBTYWx0ZWRfX/SnRauzzGU2E
 +UN9nDhSjkWdqhUdP2NfCjHfyerJQY61bYnQPacJhqzhsmtA5Hu+R4XId/lnG7H2z6Xe0QwZz75
 0DJFGMCYA1vzTwoe27Berthkp0W2q1E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI3MSBTYWx0ZWRfX1g6wZrW56L6u
 Y3sw29s0o3Pzmomj2Htjiv9FrKynFTUe1Ah97z1wOkNyOVnorbZ3nw5xdPYQodE98oGpxzIi6J+
 NQ49JgOtgq7cDvHuhsdDPb+VB8995JftH8fTk4FEJnx5wB+MQkyIoMhq10wIsKh2Kqh+sKIURBa
 ZuN3uDXveJlm5TT7tmPahglG83+yNcYNY8oy3CFfPxNzsG8ZR4KBdx5EBxFauN+HXqFI6+djN5l
 HH5/96MuKnQlyzjmyWcKYT0idKTSPeQ5KoUgx1qADzM3vKDio29wBUIaaHO/uhGD3YgFs9OjMJU
 dYfUScgwwWtWu6XZWyjrj221ToLSLkC6MVsjvHoM2az0so0UfIelkRFvdL9L+eZl88ad+e6d+Sm
 DX6qwd2oleTebKlpjLANfb01+Az+G7MNzbqW7aybP7iQIPNOVBA+jqe9YRrXGsYYwdFQ4Zpr3VP
 LQrhlxieRP6cREUOwzQ==
X-Proofpoint-ORIG-GUID: -PFxr16tcMHckgltOba4WCBlKCCIgFqs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220271
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 22 Sep 2026 18:31:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20394



On 9/22/2026 1:26 PM, Denys Dmytriyenko wrote:
> On Tue, Sep 22, 2026 at 09:43:47AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> A recent commit in meta-openembedded [1] added a number of patches to
>> fix testing issues, but those patches only apply to the latest 7.2
>> kernel.  Since we have our own vendor kernel and support multiple older
>> versions, we need to disable the patches for kernels that they will not
>> apply to.
>>
>> [1] https://git.openembedded.org/meta-openembedded/commit/?id=11a9324c8449a8567461a7914aa5c7a592de3f45
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   .../kernel-selftest/kernel-selftest-ti.inc       | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/meta-ti-test/recipes-kernel/kernel-selftest/kernel-selftest-ti.inc b/meta-ti-test/recipes-kernel/kernel-selftest/kernel-selftest-ti.inc
>> index bae5b7ab..e393b39f 100644
>> --- a/meta-ti-test/recipes-kernel/kernel-selftest/kernel-selftest-ti.inc
>> +++ b/meta-ti-test/recipes-kernel/kernel-selftest/kernel-selftest-ti.inc
>> @@ -51,3 +51,19 @@ TEST_LIST:append:bsp-ti-6_18 = " \
>>   "
>>   
>>   INSANE_SKIP:${PN} += "staticdev textrel"
>> +
>> +SRC_URI:remove:bsp-ti-6_6 = "\
>> +    file://0001-selftests-filelock-fix-the-test-plan-count-in-ofdloc.patch \
>> +    file://0001-selftests-cgroup-memcontrol-keep-anon-page-touches-f.patch \
>> +    file://0001-selftests-filesystems-idmapped_tmpfile-chown-the-lay.patch \
>> +"
>> +SRC_URI:remove:bsp-ti-6_12 = "\
>> +    file://0001-selftests-filelock-fix-the-test-plan-count-in-ofdloc.patch \
>> +    file://0001-selftests-cgroup-memcontrol-keep-anon-page-touches-f.patch \
>> +    file://0001-selftests-filesystems-idmapped_tmpfile-chown-the-lay.patch \
>> +"
>> +SRC_URI:remove:bsp-ti-6_18 = "\
>> +    file://0001-selftests-filelock-fix-the-test-plan-count-in-ofdloc.patch \
>> +    file://0001-selftests-cgroup-memcontrol-keep-anon-page-touches-f.patch \
>> +    file://0001-selftests-filesystems-idmapped_tmpfile-chown-the-lay.patch \
>> +"
> 
> What about other BSPs, like Beagle?
> I also see that neither mainline nor next are 7.2 (yet) in meta-ti.
> 
> Maybe we should add an anonymous python function that checks the
> KERNEL_VERSION and removes the patches if it's below 7.2?

Both are good points.  I keep forgetting about the beagle boards.  My bad.

I'm open to the anonymous function to make it more generic.  Do you want 
to take a stab at it?

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

