Return-Path: <gehariprasath@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48172C61DD3
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 15:33:35 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3514.1787931214601624611
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 28 Aug 2026 08:33:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=WH9/5BmA;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=FWSCN5dG;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: gehariprasath@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67SDOrIb664834;
	Fri, 28 Aug 2026 10:33:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=PapKqVB+CdxTPUgEnZyFK7QqGx9dDJAJFSSJc8+Qa
	B8=; b=WH9/5BmAqTEPMd9eEPaYNbKYZyykZgRll2H3p6wQnfCCFm1uI6HU2fhI7
	uNdLo3aWMJjQ96SBPLmpWEkVZ8LN59zWoowQlFcBIzkinLWrIbSzUJS6jO1NGups
	T97sarR9wePudM4ZD1XXPMHpFAbCV1Wo4RrM6oSkTzgYF2xn+1fHBPl33azCSDNT
	BVLWzTkNa5uPpJmm4hSrMX182V6CU3RhNhXtS9cKOLAkWvGYdmjDWVTqA5i0BeVc
	y3fuDEU8WXqo1DlmBEEJyvztLZttGL0+e5eOIS6dUEe559rj/puyw1ID/eKjBkhk
	OuLVBAkDF1owjkhA3GS7/TjIn6B3Q==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011031.outbound.protection.outlook.com [52.101.57.31])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gb24pbuu5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Aug 2026 10:33:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TyCMsE3IJxqAArPMydfGeL8HxqBbIK8i1v5FIyDbi+THxt713rpRML+l7Pnd0ufWpZQTHtHarcG3+tkRrS1vlVxKb/jirQ3B/JVXA9VqFSvIlCRyInwUE9XwdIalVK+6UofSgy3S6xjwywn7hKjfO0/5YpM2G80u4FnUd6fUd6d5ln/LsGW86DbklXc3yPfdmq2pjtqF4DvjP6z3ALPy/zoKJ7m8kjNDtFhAf9MD+TIZW7Nf+1x4LSwuAH7e9QjQ67dYQPmpvuFJmrXglS/CUIWdXZIm53yZjcM5zOEGW3mgzHihfKDvp4nVdHx9i68G+GOUnZSxRtehZMV/O+aQTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PapKqVB+CdxTPUgEnZyFK7QqGx9dDJAJFSSJc8+QaB8=;
 b=saoYY/EHt55THX+BRpqlPyoOWTVkSYPXR6KrZ9bXPWZK5Ipw9kcXdMdb+ubShtjVj1gSxfdcARGGwPKmn0xo5YxvvMEEVnQv55KUvJHbnHd+6/OkHDAqrcT1Ow9yJDYTmRpz+n3qAmFpsDVpz4YV+fLqTsc7ZMFcoO4kZnqCUQeUHf7KPwCHYDy+qpKg7BN/d+1KJtAghW6n2mxZ6fBZEUFnDq2epCg28PHLApDbLxv6VEoGnWuhL6L3ckzw1uod3aAxq0lSgeyGhfvgj27AsIc7d08RtLV/1vLGQiv3zQPtwg+VV2s6PBo7LTgIB9miPhymrnjmOCGY8paHI5HnIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PapKqVB+CdxTPUgEnZyFK7QqGx9dDJAJFSSJc8+QaB8=;
 b=FWSCN5dGs+3sBcQA8hA3rTitOkyQEsxEsY7BRMBvHFWRd3ync6/YwhogLoMvEtWc33yuRa3x3vXrMRTd4DkLq+0ZKfwaMsceKMUdkzSCfiOPd1SniWJipPApau24ygbURXKXUHYKp1syqiSs9EER7pKIkobGi8UDCsEg/FFEMpg=
Received: from CH2PR02CA0029.namprd02.prod.outlook.com (2603:10b6:610:4e::39)
 by IA0PR10MB7352.namprd10.prod.outlook.com (2603:10b6:208:40b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.9; Fri, 28 Aug
 2026 15:33:27 +0000
Received: from CH2PEPF0000009B.namprd02.prod.outlook.com
 (2603:10b6:610:4e:cafe::89) by CH2PR02CA0029.outlook.office365.com
 (2603:10b6:610:4e::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Fri,
 28 Aug 2026 15:33:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF0000009B.mail.protection.outlook.com (10.167.244.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 15:33:27 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 10:33:02 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 10:33:02 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 28 Aug 2026 10:33:02 -0500
Received: from [10.249.138.105] ([10.249.138.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67SFWxNx3042530;
	Fri, 28 Aug 2026 10:33:00 -0500
Message-ID: <7927d768-a753-4afc-baee-8caf7e3cddb6@ti.com>
Date: Fri, 28 Aug 2026 21:02:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH] ti-vendor-kernel-headers: add recipe
 for TI-only dma-heap.h ioctl
To: Ryan Eatmon <reatmon@ti.com>, Andrew Davis <afd@ti.com>
CC: <praneeth@ti.com>, <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>,
        <s-kapoor@ti.com>, <p-gupta5@ti.com>, <u-kumar1@ti.com>
References: <20260828080757.1160553-1-gehariprasath@ti.com>
 <ce24a4bc-5100-471f-8ef1-09e8d879d3d8@ti.com>
 <b8e5976f-8830-42d3-bbfd-ee6a9b30a929@ti.com>
Content-Language: en-US
From: Hari Prasath G E <gehariprasath@ti.com>
In-Reply-To: <b8e5976f-8830-42d3-bbfd-ee6a9b30a929@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009B:EE_|IA0PR10MB7352:EE_
X-MS-Office365-Filtering-Correlation-Id: bfcb8df4-35fa-475e-4e8f-08df0519b4bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|10067099003|56012099006|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: 
	xlUXwAx7s8BFTsTSJjM+382JhoVkkeq+e+5bVXhV+6vw/gha2rf7aHa37EBEb/lW3lThpUhnRwjtX8lHvGspVvFELCKiU0I6YA55r1tpDE0/BJFslBEuwz6OQwJpzrO3Z2qF7vogDfOcYwNwKyDhLYI8frCU3wreQgTmnaw+W4PtCM2tMYvkulEBzVOKM0NBGLUhTLd/j8IRQtMF0E0wpp2TT8ocugj+1EVwj7suGYjmyls2/bvSCQdc8kdBW3NWVdPd2bFvn6XwzQpOX+ONt3kejp6O2U3PZxLCbtryo1uU1JP6A0Nf21P5dVViovqwOox22tp1sTTr+38FFu5DncIWd0KZA1PKyU8taveBLXNZRDh0O5/W2yuNRi7uI2UoZSnVymKAnnzkp8f667NEzXbC9y/uMyWW/zXb00JeDZ9/z71FdlF60aFJfnP7Wq5/rcvdz+hzwTcWn3SkHnWbxnONbCfoPRK3wmLtnoPAGoyNHfjAGcOY0QCrJ+hBhN8EmXOs+kQedFRPqat/3M38FRsKqJ6d9Jy7akMWYSrEUxEiCUwTjAnWoh1xARMGrWxqWebDn5l+4La/hitKBI1KFRDQSqIoX27MpHAXxh9c5uu36tICklfMclGvODVv49KC4s0px2R2cBR7palJzYeXcxQ3IeWyOWuwPOoiN6z3+OZHUcSiRdDF7hZ6mIk638x0+dzD4qoJAq8HXxG+/FKMlw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(10067099003)(56012099006)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	tJXMgrdT8ClPiEc+zIKKKX9ibHjTg6FTVZt4IrrtGnQYaL+Sd7Pnk18/Dg1oy3aPjgUG5kKOlIS13nOrkibGsF5fB87cKQx0TLxHIjevZNQzm3JvHMhT03N60oPTE//uWdMLyAGg/5OYbD4DkwHwe+30diKqLRGSSbzSdw0NSjqSdbvLa93o7TeQJuRAYSk3JpkMxC2EppkPdY/UXmeAxwkVdWVY0P22XGtoVl5crWEnC2E5Z5k6JgId7kpvn450yHICqBSCE7oE1Nywl2PonA7oHp+TbZj4zAYQDZMLBnCVkD+dZaeIMZKSMMjb2DkEWfc+fQpbXmz8Xbzm0ijJcsA/8D1U85E83kl9t8D4yuROCkJNCVMUWlAFposmJ3TepTOSy58ywEFOq8djkqBLTSgYndjFCBzE8kooU9nk/xY7ID0+Gx3W+89DkX6Mb0ha
X-Exchange-RoutingPolicyChecked: 
	D8FfLAJcrn2tgetq4lbRQVJ7V20NXyNXP+Pa9Ah1kmrmcjGbmRq2BHgL8iEZmdRK0SnXWzD02UfP+ChK4XJfUmiSDrpCfBPmWdwYq2gFu163dWD7Ho8V37bjn6F2iejMmdGdoWm52zf79V3go/Vhm9vUMDfPW79tBpTBAkojHB1KC+4XdhkUbFnJG0rnYHP24XXVSMgWJVaMwAMORwpqJSIogFLYCG4mSmPoGah4Gb2UPdudJIXwqDI8dY8hikhCupMwZ8brTnngsN0zxFrI1pu7mw6L7k3vFnS7DvGV7hsm8hhY/fJfy5zIMDTLy+9TJClfPTTCaO3CBGjF1OURWw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 15:33:27.3411
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfcb8df4-35fa-475e-4e8f-08df0519b4bc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000009B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7352
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEzNSBTYWx0ZWRfX0tedg0AjP/b1
 2bjS0cCH5mP6uTJF6TmBNwgJYYj7cFK+GEm+hRHiTwY83lsEmJm1XsIy/hTQ6vhSkAqLmcTdrfK
 JUwlghn+Iq1eYYsBp6tTJwce9iM9C1Qgh3MnVDyWm7XWLpjmhDhBOEufFG84LfLF7oTi6VED5NB
 6DpgK5bMH9A6cC/cgkf0qpNP+7zZ/AH0S+lyAacsnBzAHcfwTF1Yk3xYwfNKPoYVwjdchm/nT9N
 ZIWTEyo99P+q2w8RLVFwtXmFRjhiZvP2I21wD1FuU/ABaGu2cHYyUiPxHBBTWXOtWbkOxKLjZh6
 ZU2yamUOm7LuCPDcOhCQH6Wa77cbXYPGXQawgEKwDWQ7rFyyMCtufu8mafubOMrNqw4BSXCiFTZ
 jzojdaFIm0V5OqYR99pq1agFqeuhS9VBVLGyuk4Ri/Z399XusQtOll6MhGc62Bt8L6X/oMX+pGd
 flgW9z2Zr83pI0vfM9Q==
X-Authority-Analysis: v=2.4 cv=A7pc+aWG c=1 sm=1 tr=0 ts=6a91aa4d cx=c_pps
 a=r1suf/lb2duQPz5POPReZg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8
 a=7kS6i8KM4nwafRl5K_IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: S5KB8fGrpetpS1XPy8LnxWCZY9yKtHYl
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEzNSBTYWx0ZWRfX7CpFkAcIVuHM
 J5otztSEt8M9kviAqbNOJVEFJwhJUXCrWDXeo7TqJ7RT6TBtfcOYHWClQm9jLtXLHRWtj40888j
 /yiRc5ExAXrmyEzxb2okwzo5SbmWpSw=
X-Proofpoint-GUID: S5KB8fGrpetpS1XPy8LnxWCZY9yKtHYl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280135
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by m0384305.ppops.net id 67SDOrIb664834
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 28 Aug 2026 15:33:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20306

Hello Ryan,

On 8/28/2026 8:42 PM, Ryan Eatmon wrote:
>=20
>=20
> On 8/28/2026 9:42 AM, Andrew Davis wrote:
>> On 8/28/26 3:07 AM, Hari Prasath Gujulan Elango wrote:
>>> The TI vendor kernel's dma-heap.h carries DMA_HEAP_IOCTL_EXPORT in
>>> downstream.The standard header provided by linux-libc-headers' wouldn=
't
>>
>> Add a space after end of sentences "."
>>
>>> have the custom changes.Copy it straight from the kernel's staged
>>> source tree (STAGING_KERNEL_DIR)into a separate /usr/include/ti/linux
>>> path instead, for userspace code that needs it.
>>>
>>> Signed-off-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
>>> ---
>>> =C2=A0 .../ti-vendor-kernel-headers_1.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 17 +++++++++++++++++
>>> =C2=A0 1 file changed, 17 insertions(+)
>>> =C2=A0 create mode 100644 meta-ti-bsp/recipes-kernel/ti-vendor-kernel=
-=20
>>> headers/ti-vendor-kernel-headers_1.0.bb
>>>
>>> diff --git a/meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-=20
>>> vendor-kernel-headers_1.0.bb b/meta-ti-bsp/recipes-kernel/ti-vendor-=20
>>> kernel-headers/ti-vendor-kernel-headers_1.0.bb
>>> new file mode 100644
>>> index 000000000..bf7dcc3a5
>>> --- /dev/null
>>> +++ b/meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-=20
>>> kernel-headers_1.0.bb
>>> @@ -0,0 +1,17 @@
>>> +SUMMARY =3D "TI vendor kernel uapi headers not present in mainline=20
>>> linux-libc-headers"
>>> +DESCRIPTION =3D "Copies select uapi headers straight from the TI=20
>>> vendor kernel source \
>>
>> s/uapi/UAPI as it is acronym (Userspace Application Programing Interfa=
ce)
>>
>>> +tree into a TI-specific include path (/usr/include/ti/linux), for=20
>>> userspace code \
>>> +that needs them but can't rely on linux-libc-headers carrying TI-=20
>>> only additions."
>>> +LICENSE =3D "GPL-2.0-only"
>>> +LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/GPL-2.0-=20
>>> only;md5=3D801f80980d171dd6425610833a22dbe6"
>>> +
>>> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>> +
>>> +do_configure[depends] +=3D "virtual/kernel:do_shared_workdir"
>>> +do_install[depends] +=3D "virtual/kernel:do_shared_workdir"
>>> +
>>> +do_install() {
>>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${includedir}/ti/linux
>>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${STAGING_KERNEL_DIR}/include/uap=
i/linux/dma-=20
>>> heap.h ${D}${includedir}/ti/linux/dma-heap.h
>>> +}
>>> +
>>
>> I don't have an huge issue with this series, but let's make sure we=20
>> know the alternatives
>> first. If only a couple applications need this header, they can bundle=
=20
>> a copy of the
>> DMA_HEAP_IOCTL_EXPORT definition inside their own source.
>=20
> Hari, is this an acceptable solution?=C2=A0 Have the app bundle the hea=
der=20
> instead of trying to do this copying?
>=20

We don't have the time to explore this option now. I will talk to them=20
and see if this can be done, but as Highlighted by Andrew below, syncing=20
the changes in the kernel with the application would need to be taken car=
e.

Regards,
Hari

>=20
>> That does have the downside of if the definition in kernel changes the=
=20
>> application will not
>> get the update automatically when rebuilt against the new kernel. But=20
>> this is already the big
>> issue with using custom UAPI like this in the first place, if the=20
>> kernel gets updated the
>> applications can stop working. The upstream kernel never breaks=20
>> existing UAPI, but our
>> downstream can and does.
>>
>> As said, this patch looks fine as-is, just something to think about.
>>
>> Andrew
>=20


