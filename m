Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E393C5B56A
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 15:36:10 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.56820.1786462565844460619
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Aug 2026 08:36:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=ZyGScfhk;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=pF9ijK6d;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: m-shah@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWquL1812047;
	Tue, 11 Aug 2026 10:36:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=7PxSglb9goPKTwvaUwqoctDKN2lle7H13Tt6MQWSZ
	u0=; b=ZyGScfhk2/Y7txbR0GpuvUWMrS5UTK8+mDONLpGpVHx4e99KLbznV7H0U
	lDgfYejwgT5H22R8TP+m0O+jHaLEoeSVGK/lehkN3D+Jo832OMikBoK94x4dGcAm
	mszD1T/6zxvDQS8UJ9uxihcl2FJOsp4RsniAbg1TB3E4Z0rpS3A5XNEFQU7khRnA
	055nyadkNZghJqIdY0bPDZ8amJ7SJ6Kj4pUhZ1aTj77DGmTMrlswrc1ajzfmsWrm
	PaupXbeTSVpP27YYBYV9LB7o9edeGkoI+Xm2E0xqX3LcixDfOvqZtWdlyW6V249j
	/BJD6rby+5OITuVQsmddrJctgQM+Q==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010030.outbound.protection.outlook.com [52.101.61.30])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g00w4tas5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 10:36:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cmiUbavcjRc/N5/xrWsx93z9kviCjAOzcLIbn6z+mau3GMMbiPMWpzqeTeNU3kYzwlAuT4fkTYL4ssXR2JH9p51uB23B5uRR/daLdioalqgZdvxWmQb0fnxj92LQsJhZRmdv6joBd0rJf+X7ICRVZDWVruAuqqS+zMVDvIngNzynE9EEExsPmo+PQcYy9yKe1lsCossOqW57rPaaOt7FQNocP1nRxxDawtm8WlBED4qJdtSSI0LdWVwuV60XigIXDRYNNIhTo7NxbaA586ztmGXojl91W6tAdXaYeRHS+G7YTyCjFZaVdOIif2W4Oi/OlMNYTvsjE4MD2oGZ/ZFAuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7PxSglb9goPKTwvaUwqoctDKN2lle7H13Tt6MQWSZu0=;
 b=q6tg6Ca6ecl/W6LFwl/D4RyvgF3jD6YO7uAg/b1LtuPwjpdkUKYo54PV6E6GfLngrP5nc12mG6itbTjmh5TnATMhNL04JySqy9pZ28NKB+rRnypcw3Z8ABk2q5og4MqTBPZ6r7vt9cV93s/s55q9uweTpEy7h7zfQUVmqJXFYWzaBVor8z7P3nOARqKqVvgW1cItLeQgmxvr4D4RCeDQxvzGggWm6xQusCEXbJI/ZFWigctn90dmXKDNiLvIHL3+bWRD5iCTjNQHK7EnBaL8vxDRW46Sg61b9sjW1RkC0RxhKBM7gKlAsppiwFH5cP1EQpxm6cr3yfg8G6nmmv02gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7PxSglb9goPKTwvaUwqoctDKN2lle7H13Tt6MQWSZu0=;
 b=pF9ijK6dUd74yjtX2rGJ43gjkNqWxI5hv1JHIveGsWZFl/lohTHyT8id3Pxh7aluKZ4/A6G0ELZzmks3IPEZEz1b5FDffNXiNU4KGIQ8qdJvjYOvH3wXMHBA3BbtxC6QoxEL5CF7AOnKgatp+NgKYo8H7uhgv3gYIdUh10unKWI=
Received: from CY8P220CA0029.NAMP220.PROD.OUTLOOK.COM (2603:10b6:930:47::11)
 by LV8PR10MB7965.namprd10.prod.outlook.com (2603:10b6:408:204::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 15:35:57 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:930:47:cafe::27) by CY8P220CA0029.outlook.office365.com
 (2603:10b6:930:47::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.12 via Frontend Transport; Tue,
 11 Aug 2026 15:35:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Tue, 11 Aug 2026 15:35:55 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 11 Aug
 2026 10:35:33 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 11 Aug
 2026 10:35:33 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 11 Aug 2026 10:35:33 -0500
Received: from [10.24.50.20] (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67BFZUv81431060;
	Tue, 11 Aug 2026 10:35:31 -0500
Message-ID: <028eb5a8-c44e-4ad3-b193-1e91490f1460@ti.com>
Date: Tue, 11 Aug 2026 21:05:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH v3 0/4] Backport ti-core-initramfs to
 scarthgap for j722s NFS boot
To: Ryan Eatmon <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>,
        <a-limaye@ti.com>, <gehariprasath@ti.com>, <denys@konsulko.com>
References: <20260807073837.1394655-1-m-shah@ti.com>
 <20260807074253.2214683-1-prc@list.ti.com>
 <9e16f8f5-256c-4bb8-aa9f-799a8c95dd71@ti.com>
 <f2ec40e2-bc7e-44bf-8773-d33f933062e0@ti.com>
 <659d7415-1a8d-4ad7-85bb-dc61afcd6c2d@ti.com>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <659d7415-1a8d-4ad7-85bb-dc61afcd6c2d@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|LV8PR10MB7965:EE_
X-MS-Office365-Filtering-Correlation-Id: b6a19c9f-c309-47b3-4a9c-08def7be3c29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|376014|23010399003|82310400026|13003099007|4143699003|10067099003|56012099006|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	HWd/6DNeFRtGwZgW/U88Lup81UzSXsAv0diBKFoKR6YMddGk4wtX25TSLkiU9pZMPlvfkAoStv6Hof5zZ6uXohgGIr+oruMddw6gzBZYGd8fCHiqbygUqlU51m10LaX07KnaCjgbhJNBgALQnVjWAPgS91HADwirmIpuu+lkQFUSH2XICj9OW2wmPiz6Nn94qz7BGmNYZpEfHbwKzOVHJPkdeUbaSzQSmdhCiP2Nm/hf+by6SyQaUXUn88uJH6thXxyrc5oni3f7QMV2M9UMtUlSzSmGhvTo7CdIuR4xufXklZmeMAdfnoMHmrYfFiRv8k7YQ6fqy1M3vehkbnhmUuchuoouqkcNnds8U0KPBrIMZzdoRh/gDD1EFmvFr4rYAG7fS+sIYsY5ZcRS7q7csmbBitZpofE/sRr8kHPkJdMvBSN6+rZoQY9NznojewMI2sGlW2mfxCOi4tkgrWUt9DXyvCTfXT0bK+HsOOPhMenO2K3hgARjq1rfnGSrHqRUIgRseWIucZlIDOU1ipVUK9YgciSL/xP8fmGsluVv7ui0tgVHqhR/ns0EgUgpyXvkZklKZ6tDyRx2SCTxupJ+BEXy7MxYCtispNrxA4ctjyUM+0UU/+4VRBhaQa03sqDzRWSFXeHjxVwlDq5Onx0+CSyIWdU8lguvoHyEz3YhMUqvwHYyTKrhff3KZxkCXO/elaKzOgD5s8idav3xMgltjA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(23010399003)(82310400026)(13003099007)(4143699003)(10067099003)(56012099006)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	iVupru3lXJLPOANjjRXBZYhKB2NryUwvlDqdBDHu0YQEwytOO0lhX5xRUzHlJnxyKR6tak7aH65ZtLk4MQSBqCnyNnW6fHqH2VArda227f87clJUz8qHogRPGp2aCZ2sfiymDkxisl5k/KRBEf5hOnvHWtN/5YCmEnUN0F5fh+Nw4YZNd04rtsjhe3vnnzYPzo+QkPVbRakCO9Hb18qeZbKPLnco+OqyO5tU5e/TweX1xcrsK0/iMPLQ4t8BZ3dzKHdTOonyuhywP6TJ/3KHzFRJgVm/+us907roPaNq/4QR+wL8/YioBd2haStBoU5zg5BLzK0sUdcU1zQuF4wvOtRtn9PhXFUbhSB+/Yvz8rn8kr9ZGAT6Hwx5c+hZUICyu9/OO77eR9hpNtBC2jBNGhe/GuBklwaUJ0/brjRb0UzjSwObaxOurvQv0zAcKRXl
X-Exchange-RoutingPolicyChecked: 
	C+bEPLfcHFvUV1i57L7XPbXz4ZtgSWSzCWpY2CPYx+oq8DnM4TH0U8rlRgCCEp5igwbToDpH0pRNUgDx8GlXWtpRmHLAUhcnmdKK09VFxLjJ9eM/vG8JCXSycTwCl6J9aMGs5qcQz4YmAvNYQ0QH9CWaBVnZUIxWgo8z3EqBQV9lNovDtJ5NI7cDPTNa1cFb820PESQzQ/SgK/o3Lo6mB4MPrQn6RoeMJyB1Ca1TcWhEmlQSQ2WDQkbcGlqn2rm3KH1BQv3HBVEvTKk7Ry+yzVaai9vpinAMV/JJkpMGOANgisFTT2gGMKthFfm7gSRKV3b5hCPT/nmyodJOBK2N6g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 15:35:55.7574
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6a19c9f-c309-47b3-4a9c-08def7be3c29
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7965
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEzMCBTYWx0ZWRfXwhhDBl8c5JiI
 CpTtg7TY6hoLEABNcKv2TYqL3yOLmWVk84bJtCfuEu19U6ursvjrtiSwXFyc9FRKGK5SP17W7Wj
 szzfrQy9HgcOZP8yxHgFaa+ukjb/aFPpExIQ4B8mGVaSb9ybPiS4s0ygJtVp52gfC49uxN3f6uW
 Ah0ZQBEYxBtUsbR3yKXwaYm1gzxaUSNiARZFxHGuoDJMhCEbcuBLaAJa18jcPnogg5zTLNPrzRC
 oCN2XKOBFMFq4drxK57CBIziQY+xoYE7mLEMg0sRsX6q4LniW33KFcTgTTm+Dgl9vtlDGOP8six
 XwaCSBhT47G8PzarDhSn70hR/S1RrZGEami8EFGIXvGqMazJTcosn9IMZ7vHVwrah5yL8sM3HHI
 YSLGQ0sYt4BWyIE+2HIzBCs7N3OZG6NALUVjSkcaH/SK1mrf69yKnFg9eFcK9Kamq7S/sMtpY8u
 9X7gp8E/0yjJGJ8yijQ==
X-Proofpoint-ORIG-GUID: 9px3cEP7-F6eRPOwgDkK9lAXtJ8Km4k7
X-Authority-Analysis: v=2.4 cv=KZ/idwYD c=1 sm=1 tr=0 ts=6a7b4163 cx=c_pps
 a=eGdyP8VkvOZnUY1FLHxo4w==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=k-42gJp3AAAA:8
 a=cN9th1_XAAAA:8 a=6_rcC5DpkWW31O9ud8wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=uCSXFHLys93vLW5PjgO_:22 a=5HybKBhn8h5UT_hmDMpx:22
X-Proofpoint-GUID: 9px3cEP7-F6eRPOwgDkK9lAXtJ8Km4k7
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEzMCBTYWx0ZWRfX1Uwu5fV6+T1J
 ci5PSB77mh6IejelX55ctWHbRjzM5PMo4mz16TKTgHwQEOsJQ5z/K98+zJJ4i2UtHPNcgpCuPW8
 S8BhV9GhaMBUzHpPLlEm2tJF49JQ20Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110130
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0b-0002e601.pphosted.com id 67BDWquL1812047
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Aug 2026 15:36:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20246


On 11/08/26 20:06, Ryan Eatmon wrote:
>
>
> On 8/11/2026 9:12 AM, Ryan Eatmon wrote:
>>
>>
>> On 8/7/2026 4:14 AM, Moteen Shah wrote:
>>>
>>> On 07/08/26 13:12, PRC Automation wrote:
>>>> meta-ti / na / 20260807073837.1394655-1-m-shah
>>>>
>>>> PRC Results: FAIL
>>>>
>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> =C2=A0=C2=A0 check-yocto-patches: PASS
>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> Patches
>>>> ----------------------------------------
>>>> WARN - [meta-ti][scarthgap][PATCH v3 2/4] k3: fix weak=20
>>>> IMAGE_BOOT_FILES assignment
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 WARN: Revised patch missing a comment. (REV=
ISION-1)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 patch
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 For details on the above errors/warnings vi=
sit:=20
>>>> https://lists.yoctoproject.org/g/meta-ti/wiki/40887
>>>> WARN - [meta-ti][scarthgap][PATCH v3 3/4]=20
>>>> initramfs-module-netsetup: add recipe for DHCP before NFS root mount
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 WARN: Revised patch missing a comment. (REV=
ISION-1)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 patch
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 For details on the above errors/warnings vi=
sit:=20
>>>> https://lists.yoctoproject.org/g/meta-ti/wiki/40887
>>>> WARN - [meta-ti][scarthgap][PATCH v3 4/4]=20
>>>> initramfs-module-netsetup: add j722s CPSW proxy-client kernel module=
s
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 WARN: Revised patch missing a comment. (REV=
ISION-1)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 patch
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 For details on the above errors/warnings vi=
sit:=20
>>>> https://lists.yoctoproject.org/g/meta-ti/wiki/40887
>>>>
>>>>
>>>>
>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> =C2=A0=C2=A0 apply-yocto-patch: PASS
>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> scarthgap
>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> Summary:
>>>> - Patch Series: [meta-ti][scarthgap][PATCH v3 0/4] Backport=20
>>>> ti-core-initramfs to scarthgap for j722s NFS boot
>>>> - Submitter: From: Moteen Shah <m-shah@ti.com>
>>>> - Date: Date: Fri, 7 Aug 2026 13:08:33 +0530
>>>> - Num Patches: 4
>>>> - Mailing List (public inbox) Commit SHA:=20
>>>> 302eea507c00c061dfcbf75fea1e6f4d22c77b5a
>>>>
>>>> Applied to:
>>>> - Repository: lcpd-prc-meta-ti
>>>> - Base Branch: scarthgap-wip
>>>> - Commit Author: Denys Dmytriyenko (TI) <denys@konsulko.com>
>>>> - Commit Subject: meta-beagle: linux-bb.org: upgrade 6.12.43 ->=20
>>>> 6.12.57
>>>> - Commit SHA: 7ff810824442c56ef59fa2d705d64a03ade5f5f7
>>>>
>>>> Patches
>>>> ----------------------------------------
>>>> All patches applied
>>>>
>>>>
>>>>
>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> =C2=A0=C2=A0 check-yocto-repo: PASS
>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> scarthgap
>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> PASS
>>>>
>>>>
>>>>
>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> =C2=A0=C2=A0 yocto-check-layers: FAIL
>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> scarthgap - FAIL
>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> ERROR: Nothing RPROVIDES '${VIRTUAL-RUNTIME_dev_manager}' (but=20
>>>> <build-dir>/sources/meta-ti/meta-ti-bsp/recipes-ti/initramfs/package=
group-ti-core-initramfs.bb=20
>>>> RDEPENDS on or otherwise requires it)
>>>> ERROR: Required build target 'meta-world-pkgdata' has no buildable=20
>>>> providers.
>>>
>>> I dont understand the failure fully, how can I reproduce it locally?
>>> @Ryan and @Denys any inputs?
>>>
>>
>> My initial thoughts are that that setup was done in oe-core master=20
>> and wrynose and never backported to scarthgap.=C2=A0 So it does not ex=
ist.
>
> In looking a little further, this is likely just some goofiness with=20
> yocto-check-layer and not having a distro when it runs.=C2=A0 Not sure =
why=20
> this passes in master/wrynose but fails in scarthgap... I'll keep=20
> looking at it.
>
>
>> Why are we trying to backport this to scarthgap anyway?=C2=A0 There wa=
s=20
>> never an issue with j722s in scarthgap.=C2=A0 What has changed that th=
is=20
>> is now a requirement?


I will be sending out a meta-arago patch after this which will be=20
pulling in the initramfs from meta-ti, all this will be based on=20
scarthgap. Until SDK 11.02, the CPSW Proxy Client driver wasn't used for=20
NFS. Starting with SDK 11.02, EthFw + CPSW Proxy Client driver in Linux=20
were enabled. Since they conflict with AM65_CPSW_NUSS, only one of them=20
can be enabled on a given boot. Hence the need for initramfs to allow=20
NFS to boot in TISDK's. @Siddharth feel free to add on to the above=20
understanding.

Regards,
Moteen

>>
>

