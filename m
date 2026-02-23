Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D907EEC29E
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 22:10:55 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.14])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6825.1771884649457939269
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 14:10:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=QWyE6mvH;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.14, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pjsSMImLYEj2ZLyV8RHfTW2CT3jT9IShJxnSQG7ekVIAAAWXiCYpl8zHZZW82zLEmmdOjz8ttE77w8kiKH/askZt40hnZCeNU1yYmMZInAtG0rc5j/szNrb9YhrD/j7fEbFI08R+4DDHHVLQyhAQ556UNSRr7sm8w+ezMweGdSPQUFDiy0lhIHqGWZEghRwCwZ5DnhtiaON8nhUi7b9qTwXtzHSTFUIa1oZUdcvRJ5kqQFDZiij9NYg2EhPcME+7MksXT+4RvPgg2OPKj/bmDVnMqbJFsBFRR1YbzKTG2xXA4IRIFlTPJrzdgwkJLTDEtFZxDLgz79R4P0qrhsXN3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDYT+v1eWHGl3D3ZAX6uJqE82pvkni4B+e+0F4FSHHE=;
 b=l5mAAapdugK9rUXIPNf1bzfwdIkCpQ5JjMnnEi/oy4SQw3AYH/OIRBkQX3oxxkbkFOqUjfLuIIwcAKZGdK2qFIm5IjfI3N7E+o4aV5rtOL+T3MtdBPtWTs4VWFKH5J+ctuEClJxAoKWddaMGHeUdLORFmPs+mpZIDM3nrjiY26GlZqoodxWRBtzDfiXaYrX33IcIzTjnx17mRhRz3rK/Lfn/4tMQOPLKWPgXu6ssFAd4XmA4kwr7d+9CZPdrH9jyTjGl6sjHxu7rh1f6T/YgPI9ldtkqY0bQDo4SC+sNSkrp1InLKlvoEQQUEiS1lpY4qojgqL8GL002/94myUW85g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDYT+v1eWHGl3D3ZAX6uJqE82pvkni4B+e+0F4FSHHE=;
 b=QWyE6mvHa/oU7jEQ+2AwgC4O2ug2ABLzRGeFXaqK9jQyI2BDCBthxpPAhHx6GdTChYc3U+dXtozvcRUHlB+aMmR17yarglyaF04z0twbdkDPvFNTWG5K3Kf+c9Q57bLfkxbifwOST0U8kFH0Fh00HjhCp20/PO6Yx/UISIBLzOQ=
Received: from PH8PR02CA0019.namprd02.prod.outlook.com (2603:10b6:510:2d0::27)
 by DS0PR10MB7362.namprd10.prod.outlook.com (2603:10b6:8:f9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 22:10:46 +0000
Received: from CY4PEPF0000EDD3.namprd03.prod.outlook.com
 (2603:10b6:510:2d0:cafe::5c) by PH8PR02CA0019.outlook.office365.com
 (2603:10b6:510:2d0::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 22:10:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000EDD3.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 22:10:45 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 16:10:44 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 16:10:44 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 16:10:44 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61NMAirp1570706;
	Mon, 23 Feb 2026 16:10:44 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 23 Feb 2026 16:10:44 -0600
Message-ID: <DGMOOODGJU7E.3SBS77ZGPK7JL@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] conf: beagley-ai: add beagley-ai-ti
 configuration
From: Randolph Sapp <rs@ti.com>
To: Andrew Davis <afd@ti.com>, <rs@ti.com>, <reatmon@ti.com>,
	<denys@konsulko.com>, <praneeth@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260223202236.3642261-1-rs@ti.com>
 <75b44163-9157-476a-98af-384aeaa6c48c@ti.com>
In-Reply-To: <75b44163-9157-476a-98af-384aeaa6c48c@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|DS0PR10MB7362:EE_
X-MS-Office365-Filtering-Correlation-Id: 01921d82-31e1-4745-ef42-08de73286465
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VUszUFB2VnkySnhNOVludzRYblFFNzJVZjF6aWdNeTEyRFdEZUxpNXBzUzFw?=
 =?utf-8?B?bkdhSHZwSTNheEJGanY2SG4vZC8yK05PU2NpU2lNYkZQcFoyd1MwSWhLRkVz?=
 =?utf-8?B?S0xIZ3BLRmY4WlpQRi9PK3Y1STFIQTNaWmxaTTkwdVo5cWw4cXVjTlJESFFj?=
 =?utf-8?B?ekxydUd1bDlLSjJST3M4cVlDandSbVdxYSttQU9rdmRIWitPUEhocGxNNDJY?=
 =?utf-8?B?YU5lT3V5OUlUUW83TEdDQlA2aS9qSC83ZmwyR2U4TEhmeHA3QlhFdzV0Z25E?=
 =?utf-8?B?ZllOcVhkTC9UNE1GZytYWElIRDhuMHNxbWJxM016UFhsRnV2Ukh5Q3pqZFpz?=
 =?utf-8?B?ZGFBRTJmNzZ0eFM1NjEvQlNESUlpQmRGMjlxVGtuVElwUW1qUStBWlUxK2k0?=
 =?utf-8?B?ZEdOd24rM3V4eWgwRmFQbWI3b0o4TDZkaWgyc2I3NmE0Z241YVVobFBlMVZV?=
 =?utf-8?B?SUVaeWFSelpzczVCZnZqekc3VWhCY2x1eEo2bTNRVXJLSXZkak16TEFUYWhO?=
 =?utf-8?B?QUpRVzBpRTVVUUNlVjRQcUdnZWhTcWhNRFphcHdmTVZVdEdaQTQvUitvYkpY?=
 =?utf-8?B?Vk5kK0x4ZVV2NFlRMFovTEM3a0lRUzFqMXExZ092TWZ0VFlGRG5RNGZBTFRp?=
 =?utf-8?B?VXErSFpyd1k5cm5tL0RIR1RUMkhFaktIbUJwK0NBckkwMTBuMitlRTF5UTFv?=
 =?utf-8?B?RHV3alFQNXNWT041eHVxRFB0c0Z3TkNXK1ZQdm0yNDY4MllCVXFFaGpLbDVQ?=
 =?utf-8?B?VjltZ1g0SWcrcTh5azFVSCtEdUNSelJnQW1YQmRndGFacjlwVnFROUxrNDA2?=
 =?utf-8?B?T2JKcTJIYkpia3c3R2NHNmsrSlFrUENOWm9GVlp0MnBLazEwenBnVXdFOWM0?=
 =?utf-8?B?alhsRHhnZDZNcGd6VEZGaFN4bFp5dlViTHE5VXRZUUhvZHpGK0tyYjBaMjIr?=
 =?utf-8?B?RnVJSVVnWnNoSEpkMGNDNDRnd3VmWGVOR01NU2E2QkduVjlsWkJCb2VNalRD?=
 =?utf-8?B?MkU1M3RjbkxENmJkL0NrMzlhdFJobitNcHVudHJ1eDBpZjQxbWlqS0hKMEVY?=
 =?utf-8?B?ZkRyQVR1djByazlhWVF0cVBRTm54L3kreUpSYkVUeVRGbkxNdmtUc0JxczV3?=
 =?utf-8?B?VERaUHpKU3g1blBISjBuME1va1BjSjhZUWcxR2UvdWpBVWVta1FMU2lzRERD?=
 =?utf-8?B?OGdHczVQRFZBdlE4SGlFR0lJSk5qMG9OR3BOamF1d29wVXVFbzdqVmZXQk5r?=
 =?utf-8?B?aFNoUW9TTFBML0RYN0FUdjFJYkNxRWVDTm1KTWttR01nK2J6T0IrVUpXMllx?=
 =?utf-8?B?RjBpc0lFSDZDQ0tZdXBUY2VBbGxRU1l5NmZVaExIdmNSbndPbXdZRlh5Um9P?=
 =?utf-8?B?c2kzNGZOS1FJTjFMNVR4TmhQWXRidnNybzMybnlwRW1PV3pSRm9RYVlFeUEr?=
 =?utf-8?B?Wk5DMkRTSm50bG1ZU3RCUGRmSkpCdjVMOEliK2E0dG1jR1hSeE1FUWZKb3h6?=
 =?utf-8?B?THhLcldyR3hIbkhSVGxJdTR4bEs3MldhSDQybm54SXpaU3JSV0ljRHlEK1Av?=
 =?utf-8?B?UERFbWJGbmVCYWM3RCtHakdnd2lHSUtyRVhSSW9kekdTL3dmUEQ2QmcvcGZh?=
 =?utf-8?B?WjRkRy9iZ2g1V0Z2d2JhdnYvRXNYOFRLSWxrSHJ4TGZUU3FEMkszRGwxNzhr?=
 =?utf-8?B?MUZ0WFd3WkVWa3J0a1Ztb3JKekMyNzZ4VjZFL09GR1BjNWkyNW9WVHRYMCs4?=
 =?utf-8?B?NEE1WkVRRUNoRHJ4QUUrNDJ3VktPMENSaUl5eXBCcEkwbjNTam5ZblFSV2RO?=
 =?utf-8?B?ck1aMjVvUTF3SHJOL2NMZXpkY3ZvOVgrWDdrdnh5WHJqMWhod05tR05uWEc0?=
 =?utf-8?B?SE1qYVltZHVrZkZKeWVwUkY0TlBMYWRNSTdxNFJGS0QzWmt0dFppVHRlTG1G?=
 =?utf-8?B?ZUxsK3R5aWRYT0xUL21jRWtudkQ2YkI2amhYakNDTFZKT0tjbzZjTzNPOThO?=
 =?utf-8?B?aUg2SkR6RmVDVFc2aTNWeVhENzNMVng1Wkx0ZmdrU2FOa0U4cGRWcUprSXpN?=
 =?utf-8?B?TDVCOWFPczZGbVZlWkFGVmQ1bitPTU5GWitEOWNuMDViNUFsS1ZPKzlEZDVO?=
 =?utf-8?B?U2xncXFLM29SSmg0OWhHcDFURHM5U09iUUN5MTZiTk00RktaeXR4QldURGs0?=
 =?utf-8?B?SXJkalJMMVkvK2VaVk0ycGVjbTdmRWlpWExXdDdLRzBRYUQ3OVRXTUd6Z3pR?=
 =?utf-8?B?T1crcTZ1T1B2aFdtZlIwL0FYMWx3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	XCv05nf185l5pOjJz/lxPG7Np/5uYoVK/5j/6nfFPYQxaKZqXTUUEI7a1UuIhGKioBGZzDZhLj1FzNlEwUbZm9qRHSSpM/S6cTZ4566CQrdP1NWkr/vWUs/HxjyhqXO1nTX2LqSWeEfZUw+i/OPvUe2McPrpwSwDcDYTqD/qGUUiyDWxlsTJ5cFWCikaFUnp5Q5H9k/qMBru4I01jU5dAh9HWy2wpoTG0Gz7LnIUzCRjD5lMBOgnxDUaTSzkIvcgw1U0ApCBOgVWxCHFxUA5Wna51iCGrVrJ/ApnyT85NGe+oZODzfMoApPXCW7t9o9+a4vEyH1qh1WQ8ed+weHnG489tQcK4w6Jy8AqzL72/IA+4iunmDyAwEfKUTxWeCBplKLfCKvxsvD7Eu/tNeg7H0w0YbIBHh7YrUZvUfzCFNhhUsqW0DUr54Zz6EnTgQ8B
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 22:10:45.2590
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01921d82-31e1-4745-ef42-08de73286465
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7362
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Feb 2026 22:10:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19570

On Mon Feb 23, 2026 at 3:51 PM CST, Andrew Davis wrote:
> On 2/23/26 2:22 PM, Randolph Sapp via lists.yoctoproject.org wrote:
>> From: Randolph Sapp <rs@ti.com>
>>=20
>> Add a TI configuration for the BeagleY-AI development board.
>>=20
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>>   meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf |  7 +++++++
>>   meta-ti-bsp/conf/machine/beagley-ai-ti.conf      | 16 ++++++++++++++++
>>   2 files changed, 23 insertions(+)
>>   create mode 100644 meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf
>>   create mode 100644 meta-ti-bsp/conf/machine/beagley-ai-ti.conf
>>=20
>> diff --git a/meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf b/meta-ti-=
bsp/conf/machine/beagley-ai-ti-k3r5.conf
>> new file mode 100644
>> index 00000000..88d0888b
>> --- /dev/null
>> +++ b/meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf
>> @@ -0,0 +1,7 @@
>> +#@TYPE: Machine
>> +#@NAME: BeagleY-AI (R5F)
>> +#@DESCRIPTION: Machine configuration for the BeagleY-AI (R5F core)
>> +
>> +require conf/machine/include/k3r5.inc
>> +
>> +UBOOT_MACHINE =3D "am67a_beagley_ai_r5_defconfig"
>> diff --git a/meta-ti-bsp/conf/machine/beagley-ai-ti.conf b/meta-ti-bsp/c=
onf/machine/beagley-ai-ti.conf
>> new file mode 100644
>> index 00000000..088cbd62
>> --- /dev/null
>> +++ b/meta-ti-bsp/conf/machine/beagley-ai-ti.conf
>> @@ -0,0 +1,16 @@
>> +#@TYPE: Machine
>> +#@NAME: BeagleY-AI (A53)
>> +#@DESCRIPTION: Machine configuration for the BeagleY-AI (A53)
>> +
>> +require conf/machine/include/j722s.inc
>> +
>> +KERNEL_DEVICETREE_PREFIX =3D " \
>> +    ti/k3-am67a \
>> +    ti/k3-j722s \
>> +"
>> +
>> +KERNEL_DEVICETREE =3D " \
>> +    ti/k3-am67a-beagley-ai.dtb \
>> +"
>> +
>> +UBOOT_MACHINE =3D "am67a_beagley_ai_a53_defconfig"
>
> This defconfig doesn't work if you select an older BSP.

Yeah, I've famously voiced concerns about the BSP provider logic in general=
, but
6.6 and it's associated BSP profile is frozen. Though the beagley-ai.conf u=
ses
j722s_evm_a53_config, the 'k3-j722s-evm.dts' in that profile defines 8GB of=
 DDR,
which is clearly wrong. I don't want to see that blow up later.

> Thinking on this, the only difference we should have between this machine
> config and the one already in meta-beagle is the default selected BSP
> (bsp-ti-6_12 vs bb_org-6_12). Why can't we just have the one config and
> select the BSP with TI_PREFERRED_BSP? We could do that externally
> from the build env, or with a branding.
>
> The issue with this patch is we would now have two configs for the same
> hardware, and there is no TI produced BeagleY, so having the machine
> config for it in this layer just seems wrong. I have the same complaint
> for beagleplay-ti and beaglebadge-ti, we should drop those too and fix
> them in the same way.
>
> Andrew
>

The only thing this solution does is obscure this behavior with a new varia=
ble
and deduplicate what should be static configuration files. I don't really t=
hink
it's an improvement.

- Randolph

