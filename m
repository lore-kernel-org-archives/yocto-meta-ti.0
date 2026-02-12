Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 006ABEE3694
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 14:55:44 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47159.1770908135449624285
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Feb 2026 06:55:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=FieFhsfN;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.67, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e7pQU0zQlDao2yAcpgWr9Ph0U4MTbr8dPDRroxb6iwU9UxdQMH5KBBBmEGoEAfuZQ7nY0zfkn9tMGpHW+8qJc1TIOyOOynIEs1XL/5lULNqyjAiuriS5DQvXxVu6JvESrfu3JtXG3l8074mPhaPyweff59KRdA5/ST+oVo0lvichEaMmrCTr+Noxl8KpZUhTa1hXwYVIz+/dDErrRA3PpyLl1ddjKl3kaiXAbPqRylkBDIvX5/ToYgx2bB09D3HGel60C7JZz1eV82Hoo0BeRCqhY89QYgmHuUrbNShQ7G0jpIn+kJ6P1LaWfvOu5cDIeztjZ73XH8mOu/Axh/cwtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wcxkD5J8qOV8TRjT0frhiMalZmVZdzj7N1X75hvGczE=;
 b=XzxzrCMrx4SpqLsK/t04lBGTfVoDY1soVb6hJywr6JOOLLhu527FzV+8uJPNq5tvP3EPpFJV9ougz8p3SZ4OoQr3V4EBhD/xExDXqCC86mxTlHVDanGUfg0hxMjEmf6ERU9ZBzI2rqE+QUNQVqj8qpatNvD2YjHACFYFVpiujBpHBP9zDxYzGhfefl6D2u66s60z2waChO3IAlDl7VGSYRLgq5KoUor136EkGFlqzeuYP8Jqc7Tx8nuAtciwhl6CJNvydMMblmNf+AjpcpVnu9Ye256Cb8hHlyhEPXMywDfb8GexqGw5U8eQzXnf5syYfsKuUOVql93NsuEutl2Iwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcxkD5J8qOV8TRjT0frhiMalZmVZdzj7N1X75hvGczE=;
 b=FieFhsfNEOuhz+qj09tUBCVxtHX3eL8rD4MMXDvoqORV08pBcdl1im+s97FCWd8ZOnA6wDQwdTXdWLTT06yafVPg12WDmAlmhwYrl8WTQ5SoIgMy5P44RWW+vhMUmyTOTnXZLJS5E2nR9/dnbkWDFd2jvuP6QVcxJQapETiE7xQ=
Received: from BN9PR03CA0759.namprd03.prod.outlook.com (2603:10b6:408:13a::14)
 by CH3PR10MB7777.namprd10.prod.outlook.com (2603:10b6:610:1ad::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 14:55:33 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:408:13a:cafe::73) by BN9PR03CA0759.outlook.office365.com
 (2603:10b6:408:13a::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Thu,
 12 Feb 2026 14:55:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.0 via Frontend Transport; Thu, 12 Feb 2026 14:55:31 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 08:55:31 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 08:55:31 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Feb 2026 08:55:31 -0600
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61CEtVPG3679336;
	Thu, 12 Feb 2026 08:55:31 -0600
Message-ID: <c46cdf45-3594-4531-946a-2ac32195a38e@ti.com>
Date: Thu, 12 Feb 2026 08:55:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] ti-core-initramfs: Rework logic
To: Jon Cormier <jcormier@criticallink.com>, <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20260211200414.1642061-1-reatmon@ti.com>
 <20260211202546.GJ11121@denix.org>
 <07050526-1409-40cf-9882-6233bbcebfbb@ti.com>
 <20260211220502.GK11121@denix.org>
 <CADL8D3bSMPw-GQ=7HMWGqW1axWoPSVV=PUbZvCsUKKKWjV2nfw@mail.gmail.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <CADL8D3bSMPw-GQ=7HMWGqW1axWoPSVV=PUbZvCsUKKKWjV2nfw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|CH3PR10MB7777:EE_
X-MS-Office365-Filtering-Correlation-Id: cefece3e-56ec-4474-09ac-08de6a46c525
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|4022899009|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?35YEJOWLv+68EMBZgD/XlM0b8t/tNTJWnK+ieidJtgO97J613+MlIc3oNLQa?=
 =?us-ascii?Q?sId9jvqdG/fVs/LS9pAm6AK61mjUeRP9M5Ew+F0k4/Qhewnd+eYOo0tVT3KG?=
 =?us-ascii?Q?NskJgrwBBQooEbQwy5RFtktx+uvrUw0REkmz5YFGCFvewDGigl36O3nn0apN?=
 =?us-ascii?Q?+NUpxQ9GCvaeAmnWWa4o0IFwWcHiyxHvvtcvGYibrz6uNr558qwAy+2PTR6z?=
 =?us-ascii?Q?tcjhooJocGix4SmT72D5pGQ9n1kWIUmqIqTgBI8kd0SFIieRdjCD+nsalV1l?=
 =?us-ascii?Q?oZAHeVsGHnoR4XHEBMESeUHFwU9O15Mtq++qVsrezXKwOave1pe8f2iJudvN?=
 =?us-ascii?Q?moyw5aIrRogptnUjw2aTvFi301T6ADVzWjCTd4vrOoX1Zv/GhbdFDXSd7UMV?=
 =?us-ascii?Q?6xJ1nHs792jOD/E2pi92dEWQ1CkEteY4NTfkZMK7Onx67xq8dIkyuBGlmPEx?=
 =?us-ascii?Q?8fLcrX+QT4EwAlOZY86uJsCdlAwrDIrTq62jhgIvrGkB6yse7E6IMomnISoY?=
 =?us-ascii?Q?r+ua6MboEKJWUMTQDrTnqX9Eek7hdbNuHobGP2Qkv6EkW+fmCoAcPHYEZ48K?=
 =?us-ascii?Q?/u2UfhdsSHbMVTfxwlVk9f+AcnUlslaZv41LeIwkteinv2bNxWle6u7I/x2n?=
 =?us-ascii?Q?uUZCc7tnby9k+2OusUOZhW3Gp1GIKOcCkP8briLoegBftjB2YrCxYZjqftmM?=
 =?us-ascii?Q?VmPYlZkMgtLwf/Zwa3Y7blwF7rHC6tLYxcE7etvQpjEizXVqA6g1oRvpAxbT?=
 =?us-ascii?Q?ZiehqaQzwqq3ywkcvnZrt6ynbenH4VvdV/utn+7YzAFcvTQD+5wTuenZEtmi?=
 =?us-ascii?Q?9dfZrSiKi9/ofMWCqf31W/coSUuUVceZj/21cwxsD2Y2HjtMM3fyxBRywIgs?=
 =?us-ascii?Q?Rd2QojluWQUoMYcvqHKf/la0egC7/vTZm7cR2P8FxBjRj3O++WwkMHs2A+Fd?=
 =?us-ascii?Q?QpdO3wAe1JKfqmiJQoQ+8P94Q7oQirEvZMe0OuKZkPsLuT/b+le9kB+eH9mc?=
 =?us-ascii?Q?bx0EfFNn2KfFtW/3UZQGAyQjhMh+UIHJOqEOcXb/fSlQ+0xRuTTs07Yxs58I?=
 =?us-ascii?Q?Lmma3vMhnqDz9rXyOgAWz7hZTc3JLfKQvB6w8BhzapW3pQZp+GF8cARwSnfV?=
 =?us-ascii?Q?AUJkbS3kz6Mo5OVPz0TvuH97F50MikJQOes/ZTZY4tPQktGIe9j7dGGY/DlX?=
 =?us-ascii?Q?PE6KBhsbkLBKIu1AGPZWhWU5ZT3tc3r1MUZI6dLKJC/li2yOLkuvrqiMv75C?=
 =?us-ascii?Q?rkbKG9MQn4o2hs1DpKkpTg3Q9jd7PBu5ya0LJBOuKfb1CyiF/dIRIefdmYDm?=
 =?us-ascii?Q?xOptfnmeWib8V78+dgBRhVwKf09hx/0PYY4UHesGHck/ZEQUh5QMprkGfH8M?=
 =?us-ascii?Q?UeO5GbXl9a53hlGb7e/eRIngyIZlNUMyfn++fqX7njixpgCMiaD4h2IltbSn?=
 =?us-ascii?Q?7JltxuCgQJiVcS++Abw0qpm4JZGV6d50c5NIH+4CcmmSUdJxR2Wb5n8ieyOc?=
 =?us-ascii?Q?mJz60+D/hcaQyISVmAE9Rvi2ytW8+06EQ27fqj/dzhmsG+RDxkPY0szM08uV?=
 =?us-ascii?Q?FpocowMI+OFeQv7IK7vp1k0pUWwNbshcqpjEeTVANjyO1CoGv/TwEBM1xtR6?=
 =?us-ascii?Q?GQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(4022899009)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	/QT7nGL3T/3RWeJkNyHRTaWqroNQ8ulmOYY64OxyKXvqVJ4AqzWtw5ZbwSTDrfsuNHP7gbMdDiKtXfHFLMNEZ+4MhfwfiJvs//MSacC3pumAtEYlBanonToBR8RHOvSo2c54mXSUIXuegCosxJFdu2616oen/EEwclU+oscxk2F+e7B3lwr3eQMbmBFz9GtOXOfaHDcA2jn9CSlqRhw3aOwIyMudzlKPw/mjC9sfSEySVTY4ETyff16i/Pv8rmVYeiYKQFeR8POg+RgBPZ0hvolNWaK7UD3nuOPHQbCx9yk/cI1MengPbR0q9ESXBzGgNxHjDpE4nw8i5Qk1m7DEn46qPSvCnbfBGZfFMSaJyBvPGfW8ftaWckKxABMtzZqBIVSmyfsdPV8GCO5WqUQhkt7hC1/tybk+IROTHOPWtSdt6sviUqYReHttRl3wjcZy
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 14:55:31.9856
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cefece3e-56ec-4474-09ac-08de6a46c525
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7777
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 12 Feb 2026 14:55:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19502



On 2/12/2026 8:52 AM, Jon Cormier wrote:
> On Wed, Feb 11, 2026 at 5:05=E2=80=AFPM Denys Dmytriyenko via
> lists.yoctoproject.org <denis=3Ddenix.org@lists.yoctoproject.org> wrote:
>>
>> On Wed, Feb 11, 2026 at 03:57:28PM -0600, Ryan Eatmon via lists.yoctopro=
ject.org wrote:
>>>
>>>
>>> On 2/11/2026 2:25 PM, Denys Dmytriyenko wrote:
>>>> On Wed, Feb 11, 2026 at 02:04:14PM -0600, Ryan Eatmon via lists.yoctop=
roject.org wrote:
>>>>> Clean up the logic of the new ti-core-initramfs to reduce the impact =
on
>>>>> downstream layers.
>>>>>
>>>>> - Flip the logic in the machine .conf files to track the list of
>>>>>    required kernel modules for that platform, but if the variable is =
set
>>>>>    to "" then the ti-core-initramfs will not be created.
>>>>>
>>>>> - Redo the logic of when we require creation/usage of the initramfs t=
o
>>>>>    just platforms that need it (ie that set TI_CORE_INITRAMFS_KERNEL_=
MODULES).
>>>>>
>>>>> - Add a big switch to disable the initramfs entirely.  In that case, =
the
>>>>>    user is on their own to make sure that the kernel has everything i=
t
>>>>>    needs to boot either via config fragments to turn on the needed
>>>>>    modules, or by using the TI_CORE_INITRAMFS_KERNEL_MODULES
>>>>>    variable to populate their own initramfs.
>>>>
>>>> In our discussion we agreed to use TI_CORE_INITRAMFS_KERNEL_MODULES to
>>>> determine whether to enable initramfs or not. While I don't mind addin=
g
>>>> a separate global TI_CORE_INITRAMFS_ENABLED switch, but I now wonder i=
f
>>>> two checks are redundant and whether it makes sense to create initramf=
s
>>>> even when the list of modules is empty, if it's enabled?
>>>
>>> I thought about this and went this way for a reason.  If you want to
>>> turn off the initramfs, but you still want the list of what modules
>>> are required say for your own initramfs, then the list is gone.
>>> Because the list was the switch.
>>>
>>> By splitting them into two lists, we gain the fact that we don't
>>> force the initramfs on platforms that don't need it, and you can
>>> still turn it all off if you want but have all of the infrastructure
>>> in place to use it in your own layer later.
>>
>> I think you missed my point - I'm not against the "enable" flag, but sin=
ce we
>> now have it explicitly, does it make sense to also build the initramfs w=
ith an
>> empty modules list when the "enable" flag is set to "1"?
> Being able to create an initramfs without modules makes sense to me.
> We've had to use initramfs before for mounting filesystems in a
> particular order for example.  And didn't really need extra modules at
> the time. Just a thought.

I am going to send a second patch that adds support for adding=20
additional packages to the ti-core-initramfs that also turns it on.=20
That way a distro can chose to always turn it on and add in that kind of=20
change.


>>
>>>> Also see below for another comment.
>>>>
>>>>
>>>>> +++ b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
>>>>> @@ -0,0 +1,29 @@
>>>>> +#-------------------------------------------------------------------=
-----------
>>>>> +#
>>>>> +# To turn off the ti-core-initramfs.cpio creation just set:
>>>>> +#
>>>>> +#   TI_CORE_INITRAMFS_ENABLED =3D "0"
>>>>> +#
>>>>> +#-------------------------------------------------------------------=
-----------
>>>>> +TI_CORE_INITRAMFS_ENABLED ?=3D "0"
>>>>
>>>> Did you mean to weakly set it to "1" here? :)
>>>
>>> Doh.  I did.  That was from testing.  I'll send a v2.  Good catch.
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#19491): https://lists.yoctoproject.org/g/meta-ti/mes=
sage/19491
>> Mute This Topic: https://lists.yoctoproject.org/mt/117763070/7902621
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [jcormier@cr=
iticallink.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>=20
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

