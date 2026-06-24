Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 159BDCDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 20:48:29 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17352.1782334101161871242
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 13:48:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=fUPmQN6f;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=Oe8F7ecI;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: afd@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65OJsGs31056344;
	Wed, 24 Jun 2026 15:48:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=c6Je4x8/XbtX5rd9833ow4dCCWmJocZB0+R7dtmM1
	+o=; b=fUPmQN6fZV6AwLsHRFZ/LysfBIAQrHudF5Mn+J+UQlKmicOPQ5c+rAzDg
	ZG62yfQMbz+C9z7hOqGI2+v1oVK/2FDHos4gsy9ASXgYCNXpfZ5mNeAmoTnc1U8m
	dVKkF4vVYFfpAeZ9QU3usfZ1LV6Bx+aRfCbB7n/0VDa0HIvUfzCC1Jmbpj+W0gzv
	4hUSXBM9EM79gXk/dMxYhRHq+liCk9uWfN1ycentlzokLsRdNDwPxUKvK8K9gggy
	z3d+T2yj8H3L0Vm/clzYNjdNhGOiP2lEPdvtEHsD+sAkkDXZcG45wYEUGOCSN/t0
	plnojl163bPj6cxOU40Vz18q0E02g==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012045.outbound.protection.outlook.com [52.101.53.45])
	by m0380145.ppops.net (PPS) with ESMTPS id 4f0e5ybnjr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 24 Jun 2026 15:48:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hxZ/wJimisO3ILLuw+RbXFOPnn0C9it5Sdf2UK9uW7FzIMsr3QUDjMq75CQO2hO8dGt+8NIyrVEs2q7lxfEGc+1e5c809FQjZmBwNrQrVOTu0ztvL+LmCTc9I3DL0b6YrjCE5Qs9lCZPeKsmcrAyML1J2J7XN/bkJBogkLyde8yPh3opsN4kHFfnobJcvCZXzaZKHYwwwDrpTA99C/GCty1xVJunQ1jVSJtyTy72Eyq47JOM0j7dY6nQA2sgdjsPc0QFgwOPTVqyQ4+xqx6F6Pvnl2+3gvq9/N/r4obkfhg8WHUnGoGWiKMHqT9ObUPDEM8iZP3SY03bY3Gi7gDEaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6Je4x8/XbtX5rd9833ow4dCCWmJocZB0+R7dtmM1+o=;
 b=CSdhBr3cVPgIrWWAlupiDTvtzKTc9yg6OvNEugzZEQzM/+hwUFPD0oDVsgv1dS5BiGzPIRiJZQ8ZXrE/ukghnY/vmPFVS1plP4r3AA070jryc1NjpoxEKm5ICXXToe+Ghaizl2nlr84qkoI0k61t84ZE2GCozweri1FcP06jRJuhVkHSKOtmaBCyGkzzNRFjVe2QvbHTiT8litCKrBmsU+ePWBP3IJxfyydfoLExoC6uLkAjuyta7/7QvKQUBic+yJmHeOqlENd25w2lXFgZprUOz0Unk3B3F9BklprFiMFQcXGlt/ZEyF3kboZbAT0qjsE05ADm9WgEA6RBRsCzwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6Je4x8/XbtX5rd9833ow4dCCWmJocZB0+R7dtmM1+o=;
 b=Oe8F7ecIBQWLcIfYq8kLl5hXUtRSF9hN6evv+vVJfgyQTYOEqAti1ABmPD2NSAf3y3HjaM7bPr+wqdKGyAkSc6s4ZkxOsU04z4KRLH88JKMELMclRGIYgtaLXmwbbeN09+wM79hLwGpWEngqjBcg6sAmPI8kaJlWaXc7dkrE+Po=
Received: from SJ0PR13CA0034.namprd13.prod.outlook.com (2603:10b6:a03:2c2::9)
 by CY8PR10MB6729.namprd10.prod.outlook.com (2603:10b6:930:94::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 24 Jun
 2026 20:48:14 +0000
Received: from SJ5PEPF00000207.namprd05.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::91) by SJ0PR13CA0034.outlook.office365.com
 (2603:10b6:a03:2c2::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.13 via Frontend Transport; Wed,
 24 Jun 2026 20:48:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF00000207.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 24 Jun 2026 20:48:13 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 24 Jun
 2026 15:47:53 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 24 Jun
 2026 15:47:52 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 24 Jun 2026 15:47:52 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65OKlqra1216608;
	Wed, 24 Jun 2026 15:47:52 -0500
Message-ID: <883f620a-c9b3-4418-a180-ded5d0e07353@ti.com>
Date: Wed, 24 Jun 2026 15:47:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/wrynose][PATCH v2] ti-linux-fw: Remove default
 SUMMARY line
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20260624203026.1155961-1-afd@ti.com>
 <20260624203737.GD10186@denix.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260624203737.GD10186@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000207:EE_|CY8PR10MB6729:EE_
X-MS-Office365-Filtering-Correlation-Id: bf1fc373-62f2-4f54-0efe-08ded231e921
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|23010399003|1800799024|36860700016|4143699003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	L22xWULLUoCX7xmJMFzY2/1SpsDMwXe7MrRYmycDTOWGYihPsfWXxTlABuJyWmmTZG0D9uiKsfnWH4Y6gJKEsu5RIrt/hX9kRTGgfxmf3eSjrEVbRvn94uyHJ0lXCavxSdhyJRR1N3kuyIEJ7j5yrIvNm0ZpQbcKPkWeq7dzOfbwby0x1U03f3si/0ambExLp7IB2kERqZQafYNVutGrmMNaGzxIkHzAC3YDpN5e//ZX/mGFBDrYkxqASw6bgXVHWRWv92GNEhXrnYxR4A0UMGtIodbI8v/kyMYqGyrqleB9OAOdrEHtGO2hosVoc3gxplF6W1Dc287Ijry0ryApVLyEru5hCAwLnSpy8Wml+pcxSayl8ieKFtwI15RZNksT97ch92O295Owhii6hlXFHHDrSNVn2+SK0HZG8XynX4yl66ezXD1CyycOm2/pNlkzR1A4GLkK7P9QSsxPQKM+fJ1BmZSvLF1cq4ctR79Bi3B19ZdiAdeGKtKeZ85MR/nkYaJZcsKo5BzC0KdbuGimswHuweQ8PY2xi8HWLy1LpOvi7EnXsJjMXnyqZd6QVyWiZcGSl3D3s82M/+Rc9VAAK0rQ8A6D909tO9G9AsZlM0JGqSEcNOvtL9yj9i5FZ0E+R7mI43u0qCzQte2VDS9AjRUEnj7n30/4HwqKUCWZD6Ybe1SkW9dZU8fIQhZT2QFy/WENZExTePEI3hlmyFNoNQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(1800799024)(36860700016)(4143699003)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	291PpKCdxaI/ln8Cip6m30tBKxyAQY+zerDgqKN4YJxPAL3JEY5LrNqHuvJQjRXT9tvZGfFiHXvtW9hWZiWSuox8SYRCCw8qixdLw1WTpMv/cVWaNE+4FtUauipA6xdAbCN0VLC1zEE1rcin3bPPnwrKyn0bBUJlXtDRz5kl+wrjPkweuuWPe4JYNkd0Pot+MC+dptM0PI6xVNDrD2GX6Y2t7y5EBQiLdgMiVqIXMSYtM7W91rkhxDb6JmGdFrreyNuPiRkS05HhgOXbsNc2JJWS6vfkiBP3ahRn0zlUzDzA9uL8EL2vYXp8l9kPmDM75ePYNLUTB72h1hIDuTrBI0F7qNB2Lxra+SG2qCpciwA1gbL0muko2PY99i3zn6YqAeMPbTztvtlWD8n3G1VdGYvpCOxOV8kYEHR1A0+rWJf6P6Ali+HypiQli8QZE9ER
X-Exchange-RoutingPolicyChecked: 
	qWc0A0kj+PBe2U5DG/t2wz3prXvA1RlZfoXDkSls3Nwl46zGHzTA71FPBatyRuB1/BoHQT+t4vhrLbRTj0Z675gDA1hjk4/JA3BWlkEJQy9tu9RvIVZ0EKbxbnAV2hxrQ0nA6dpCI1GP6wAbHIq9QySZt3E9RPPMZ6nU/Vk159V464gANMuU31h+nXW0WuhuSHe/HfwhJyvDQH+hL60b7SnUGp90Xz8RcNUk+kOsQLZV/vWfl1XcE1+u1JUnYRQNJvCXSCfKzJpTFYw6g4gBUS/N/Z/ZqhTpGfOQlX+OXZ4Vg3EG4pkigUkWQSDFlbdRfvVIUd58MeLWbE6ERzaCxw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 20:48:13.8431
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf1fc373-62f2-4f54-0efe-08ded231e921
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF00000207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6729
X-Authority-Analysis: v=2.4 cv=R6cz39RX c=1 sm=1 tr=0 ts=6a3c4291 cx=c_pps
 a=5Z0T5Zpt9baWTucumgWS7w==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=m6aah1BN9YQIWAgDtkQA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: Z9hixpVjpJUOVpQnKLLZCyy5lcrKQoOD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE3MyBTYWx0ZWRfX4WnWcXuXJz/j
 G1jqxIu9SlJFXe6PNHNobeHZSLji67A4H/7hditCvWpVY+v1W5wskets340qAnqPLrUmEuDQeFG
 ZEvEN317Uwb1slD1w7I+m1xoxWfuSfk=
X-Proofpoint-GUID: Z9hixpVjpJUOVpQnKLLZCyy5lcrKQoOD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE3MyBTYWx0ZWRfX3fIv7/ty7UvO
 Hlt3IiBS1+Y8lP0lp7HxE7URRG6gJjeE3h9Kn4VJ2k9a9/zo1eOECW5rmCqOfQCKYugeq2kspcF
 Hf0Ld9742DO8PHeDgpDXw2FiYcLRA7MqSuXu3pKh1HjmpWHQVowjohCei91ZGBx+0i2uWR1TqAX
 uvK7ngOfXFhhb6KUp7Q1Wyj3oAsofS0/bVoEY5iEJLz3XAvq+++IVfCXN7KVW6fFxo+wfSXtjCo
 bByX/ALE9DnoJzZGiiMDODuuZGVftDkb5pvGJzyD5bc3l3HzW92ArRgtcv6B+F5hsEXKLOkZ+zN
 NgGhhP0WNuMKjcb67TB48lG2r8AZONl2/TWjOAhu7kCA610uNO72c7QzkXUkoSssy40itGOPaI3
 I/pFMqGvNOtvnfSvdKfDhGZpLtGGvq7CrDrif+2uUSEzw6Xm8sT8LuWPCF4Fy21WWBiigY81mIR
 N52SWlfupbUlo46VFqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240173
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 24 Jun 2026 20:48:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20085

On 6/24/26 3:37 PM, Denys Dmytriyenko wrote:
> On Wed, Jun 24, 2026 at 03:30:26PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
>> All firmware that includes this helper should set their own SUMMARY line.
>> Currently all do (other than ti-adc-fw which we fix here), but they often
>> include this file after setting their own SUMMARY, so this common one
>> overwrites the correct one. Remove this default SUMMARY.
> 
> How about flipping it the other way around?
> 
> In the common .inc file we set:
> 
> SUMMARY = "Prebuild binary firmware"
> 
> And in specific firmware recioes we clarify:
> 
> SUMMARY .= " for TI ADC PCM6240 configuration"
> 
> That way it won't matter if the inclusion happens before or after setting the
> specific SUMMARY and it won't be completely empty (albeit generic) if someone
> forgets setting SUMMARY in the recipe.
> 

It might technically work, but I'd rather we throw a warning if someone forgets
their SUMMARY line rather than just taking a super generic fallback. If we allow
fallbacks like that what stops us from having

SUMMARY = "Yocto recipe"

in some main conf and hope recipes add

SUMMARY .= " for Linux kernel on TI devices"

Andrew

> 
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>
>> Changes for v2:
>>   - Update ti-adc-fw so it has a SUMMARY
>>
>>   meta-ti-bsp/recipes-bsp/ti-adc-fw/ti-adc-fw.bb      | 2 +-
>>   meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc | 2 --
>>   2 files changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/meta-ti-bsp/recipes-bsp/ti-adc-fw/ti-adc-fw.bb b/meta-ti-bsp/recipes-bsp/ti-adc-fw/ti-adc-fw.bb
>> index ad025483..0b70d69d 100644
>> --- a/meta-ti-bsp/recipes-bsp/ti-adc-fw/ti-adc-fw.bb
>> +++ b/meta-ti-bsp/recipes-bsp/ti-adc-fw/ti-adc-fw.bb
>> @@ -1,4 +1,4 @@
>> -DESCRIPTION = "TI ADC PCM6240 config prebuild binary firmware"
>> +SUMMARY = "TI ADC PCM6240 config prebuild binary firmware"
>>   
>>   require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>>   
>> diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> index 126c46df..d343a6aa 100644
>> --- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> +++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> @@ -1,5 +1,3 @@
>> -SUMMARY = "Common include for TI Linux firmware"
>> -
>>   LICENSE = "TI-TFL"
>>   LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
>>   
>> -- 
>> 2.39.2


