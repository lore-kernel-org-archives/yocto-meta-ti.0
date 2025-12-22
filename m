Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8275BE6781C
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 19:39:34 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.0])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87212.1766432363945370191
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 22 Dec 2025 11:39:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Ejg1Ndzt;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.0, mailfrom: praneeth@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f0e6TsNDwHUPUNngX/cnrYKJuiYTYaqku9ItJi+Z6Pgcd/S631vFcnf/OGGQNiXg3XS6NAzr9gRZidnY+fkCxecba1c4Fdlqlwu9K5GwQ1eZsa1p1zSHl1p9Oy2FY+YZwhIuWMOywz5Wdl1ZCS0anIZ1T1Wou8kMvbeSEAnW3DqF9lm2ts9qzFUERbHNeJtUQqMEbrCVE6zEf5d7BiiLyLzixBIyKp8YipFdQLaUc5p78PMO0SkKZqsYH6DuAsvV8oWNEjTj91W1O+qi2Jxphr286/tb/LwTpx08mpWHRdol7NkqaSnYUoLZdiJlS54eV/62GSKRnYij9n+Y577uRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHM5WKY0D5GWFQS7OpUM19gXehxm+5GcPfuHDYh1qTs=;
 b=n5HvCHqbU6L4CEsUWdRIOqL7vBrPjZa6AP9Weg65tlMmOhTawkDxaJj+g/fh8KIvbUtgVsiHD+BRJUC8eRwoetR3b9Kt0UADfvgIFTAlbJRA0rbZKWeXqZj0J2uUNuphIocRgBKcmGWHM3in7IqS7r1/O9JpAPrwyax9Vn55/t8qcpORU3s+T4JGlxzSCaNhQymj+ZRAYJeC7aiBXSnLn6ZgKztPVDyY88C9CklAjB2KIflE3HtPBr3oCAp+dZOMgjoSlSMu8y21Xa57tZlVUU0sBtO2yHao0DfQFlT/Ojfk5NHVmRt4/x8GuN4jxyg0tiJ8kyR/d8SHEgoqtSQZLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHM5WKY0D5GWFQS7OpUM19gXehxm+5GcPfuHDYh1qTs=;
 b=Ejg1NdztnZ7hVVZSK5TvlV4TtXNuYMuJRlXqQxD5G9QOdeIxjy0dEfHPJo0SAUg0Do3KbRfs0tTWD1jHpxZWJbYFsam+85MttqWmqBOu62lyu0vvLM7GlYkdVneyEMYWF74kbhyg00GIAbsC5xL/kgqNoxsiwVcDrepY1wLL7og=
Received: from MN0P223CA0012.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::13)
 by IA4PR10MB8634.namprd10.prod.outlook.com (2603:10b6:208:56a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 19:39:21 +0000
Received: from BN3PEPF0000B075.namprd04.prod.outlook.com
 (2603:10b6:208:52b:cafe::6f) by MN0P223CA0012.outlook.office365.com
 (2603:10b6:208:52b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.11 via Frontend Transport; Mon,
 22 Dec 2025 19:39:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN3PEPF0000B075.mail.protection.outlook.com (10.167.243.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.9 via Frontend Transport; Mon, 22 Dec 2025 19:39:20 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 22 Dec
 2025 13:39:18 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 22 Dec
 2025 13:39:18 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 22 Dec 2025 13:39:18 -0600
Received: from [10.247.26.240] (ltpw0eb5ja.dhcp.ti.com [10.247.26.240])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BMJdIcR1793886;
	Mon, 22 Dec 2025 13:39:18 -0600
Message-ID: <2decd100-ae69-4826-8237-efce75e756d6@ti.com>
Date: Mon, 22 Dec 2025 13:39:18 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH 1/4] linux-ti-staging: Add
 v6.12 recipe
To: Romain Naour <romain.naour@smile.fr>, <reatmon@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>, Bryan Brattlof
	<bb@ti.com>
References: <20241004151857.24578-1-reatmon@ti.com>
 <cdc9c53a-4299-41b6-8da7-a65577dc11c2@smile.fr>
 <9496e24f-a730-415f-ad0a-f72510ec8040@ti.com>
 <ffb128e1-ec2b-4ec0-a4f5-8a3f94fe8dca@smile.fr>
Content-Language: en-US
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <ffb128e1-ec2b-4ec0-a4f5-8a3f94fe8dca@smile.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B075:EE_|IA4PR10MB8634:EE_
X-MS-Office365-Filtering-Correlation-Id: d35903b6-9ec2-42b5-8d1b-08de4191cd6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?g0L7ODBEXlCBUPb5GplGALPkfdp+7w5KZaTyLaToflbEtNj9uvXAMjNYjPyZ?=
 =?us-ascii?Q?5iR9XZEL/ob5zx0xV6ZKoumwg9lXuhv2opoGlMlceariYYCdtzs5twkqAEu1?=
 =?us-ascii?Q?nEyO5zlm82iymIGaYBqxkSEBpjrYPxKGN+jzIpHDjp+VVoYQNWW8CUZ/6qmt?=
 =?us-ascii?Q?df9g4gFtzNsxEGQgPHCnS6izLutdM5iiNKtBSNBWLWtn6Y/FlllXZFYVHvNy?=
 =?us-ascii?Q?IB8C4jQbJdyGx+RLELnRBCLB3cOJbpFfZN8GV/+/KswlKEbTe6nZ/f2ZadXq?=
 =?us-ascii?Q?Xt55TLcp4gEItfkLTrSQiJ90hFZJ/JDJXThY3hPPxLpHop4l/7PRY8C33Dpe?=
 =?us-ascii?Q?1ZaN1XgQqaJ375aYuwf25M4ET1lTa4p6M+IuCVHE2HWhWCbouyy7WCLhlukx?=
 =?us-ascii?Q?2gfnI3jHfkqgKpq7I2rk1Kldymq2M3TRI0jun8ak62JD3UkoMe8nsRq3UMiF?=
 =?us-ascii?Q?y82mL5HOJGH87sdhsIbrU6QF5yD//B02EHOkSPYcV0TaD7MQCGrkokkezPVa?=
 =?us-ascii?Q?G5OHlIBXz0X5Ig//UtSTN1X1GFEFxDPvqVeZXauXQu04o+g0oBnakK3uRmbF?=
 =?us-ascii?Q?XR3+GTMSdFJJ1iPFc3N/H+ahGOU0D7CN40CHxr7+4JiPt4nQTcHP0go58a0i?=
 =?us-ascii?Q?qtxfi0yjxDj8YWjg/swZTqD/scUXAdPk52NCJpMHr4nDfh9yw7GP2Hrrg1cJ?=
 =?us-ascii?Q?y7wdMOn5HibU9JVGtmftniirlqqeWyqo4JxDz18j+/ByKnSo0kBFqA+SGyIR?=
 =?us-ascii?Q?d4T6nEWx86OYh/QC2jMwgcHraYM0iM9YljaHRNty91B5Hpg9zqDI+H95lLek?=
 =?us-ascii?Q?8IlF6tQRW5A/zyaw+40fMkApyMK/nlpTPJOXTX8l8GaSBkvayat04tF7mGVP?=
 =?us-ascii?Q?FvO+38y/xFyz2+u+9q1VgKDwAvgS2n/z8HdQ1J0WQI5ckxzGNBQ/HwkS24TO?=
 =?us-ascii?Q?HnbTOBN575Eeg2du3dJ5OLwqYJQQjer5onLwJ21SFpOH86rq3sh2pgsr5n32?=
 =?us-ascii?Q?D5S8Fsztit+pZ62KbTK857Py3BOCiyOjnLVtDfO4dxlBBjrVa548y6QMYncZ?=
 =?us-ascii?Q?SOH/EqnIAZx4TcWXVlf/rmqyxxHBTSQ4GJIcf1wIhzM3tKmG8mmQYPM4LCvU?=
 =?us-ascii?Q?+8n+dCRs2YHFs0nXlbuO30HmPeNhEXMYcYQXkj8eb9nd7jg9fSKCjWRocnKB?=
 =?us-ascii?Q?i21OpjcMB0CTxDmrEu5zRZV/yIMTFFNZSwLQ618Mkb9v+2WZKBLxd2gFhGeU?=
 =?us-ascii?Q?+2GqZRvIWMFbNtkA3v6rgf9cLL7lwIUMrSDs1I1AqEFDyQEWmL8tUVGt+9Yg?=
 =?us-ascii?Q?pU3M3piXh9gXyHiwf3Wb6n2rEfB/yvV9q/ZO+dnPE30aONmZmbF/ne2h3ALl?=
 =?us-ascii?Q?Llm+WHwaaVVXGKo2YtB1UGHStdnWB0UqFh+m9umWzRmxD26Ag4NTn8RoY8L5?=
 =?us-ascii?Q?hGRAN7NNZjmX8L1ACotk2ar+FmJMeEHEmyne7V1HOyEqMrm4hibGHiaSgRNS?=
 =?us-ascii?Q?b5bA2oG21y7/En0UJ4ASAxsv5MfNo0l6PZEr?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 19:39:20.4600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d35903b6-9ec2-42b5-8d1b-08de4191cd6e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8634
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 22 Dec 2025 19:39:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19389



On 12/22/2025 5:34 AM, Romain Naour wrote:
> Hello Bajjuri,
>=20
> Le 19/12/2025 =C3=A0 21:58, Bajjuri, Praneeth a =C3=A9crit=C2=A0:
>> Hi Romain,
>>
>> On 12/19/2025 11:31 AM, Romain Naour wrote:
>>> Hello,
>>>
>>> Le 04/10/2024 =C3=A0 17:18, Ryan Eatmon via lists.yoctoproject.org a =
=C3=A9crit=C2=A0:
>>>> Adding needed recipes for initial testing and development of the 6.12
>>>> kernel for the next LTS.
>>>>
>>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>>> ---
>>> ...
>>>>  =C2=A0 .../linux/linux-ti-staging-rt_6.12.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 +++++
>>>>  =C2=A0 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-s=
taging-
>>>> rt_6.12.bb
>>> ...
>>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12=
.bb b/
>>>> meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
>>>> new file mode 100644
>>>> index 00000000..9e5c4ee4
>>>> --- /dev/null
>>>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
>>>> @@ -0,0 +1,9 @@
>>>> +require linux-ti-staging_6.12.bb
>>>> +
>>>> +KERNEL_LOCALVERSION:append =3D "-rt"
>>>> +
>>>> +# Look in the generic major.minor directory for files
>>>> +# This will have priority over generic non-rt path
>>>> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-6.12:"
>>>
>>> Previous linux-ti-staging-rt recipes [1] used a specific branch
>>> "ti-rt-linux-6.1.y" obtained by merging the TI vendor "ti-linux-6.1.y" =
branch
>>> and the preempt-rt v6.1-rt branch [2].
>>>
>>>  =C2=A0=C2=A0 BRANCH =3D "ti-rt-linux-6.1.y"
>>>
>>> Since preempt-rt is now merged in the kernel 6.12, indeed we can use th=
e same
>>> kernel sources with a specific configuration fragment (hence there is n=
o
>>> ti-rt-linux-6.12.y [3]).
>>>
>>> But the preempt-rt project still maintain a v6.12-rt branch with all re=
maining
>>> patches [4]. Actually the project still recommend to apply the latest P=
REEMPT_RT
>>> patches [5].
>>>
>>> Should the linux-ti-staging-rt recipe follow the preempt-rt stable bran=
ch as
>>> before?
>>>
>>> Porting existing project (kirkstone 6.1 -> scarthgap 6.12) using
>>> linux-ti-staging-rt recipe, users may expect that this recipe still use=
 the
>>> preempt-rt stable branch.
>>>
>>> Thoughts?
>>
>> Indeed when we started 6.12 LTS baseline migration, Since PREEMPT_RT is =
part of
>> mainline we have started using a unified kernel branch ( With config fra=
gment
>> switch) to build RT and non RT baselines.
>>
>> The preempt-rt project didnt have a 6.12 branch till august in the year =
at
>> https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-stable-rt.git/
>>
>> The development and hosting of v6.12-rt including additional on the fly =
features
>> is something new and i hope it continue with next LTS (6.18 as well)
>=20
> Preempt-rt issues are fixed over the time, especially for the 6.12 kernel=
 since
> it's the first release with preempt-rt included.

Yes , But the fixes should be going thru the v6.12 stable tree IMO and=20
v6.18 stable as well moving forward.


  But Preempt-rt specific changes
> might be too risky to backport to linux-stable branches. We can hope that
> v6.18-rt will never exist but who knows...

I hope the same as well. The other reason we are monitoring v6.18-rt is=20
for arm32 platform support to mainline
Reading FWIW :=20
https://e2e.ti.com/support/processors-group/processors/f/processors-forum/1=
578136/am4378-support-status-of-am4378-soc=20


>=20
> In other hand, it's only a few dozen of commits (as of today), some of th=
em not
> related to TI SoCs.
>

Agreed, We are evaluating these fixes and will bring up with real time=20
linux and keep you posted here once analysis is completed.
FYI : TI is a member for RT Linux https://realtime-linux.org/membership/

>>
>> As you can see with https://patchwork.yoctoproject.org/project/ti/list/?
>> series=3D41242 , we are in process of switching development with master =
and next
>> LTS yocto to 6.18 baseline and we are assessing how and if RT need to be
>> maintained as linux-ti-staging-rt-6.18 recipe based on the feature diffe=
rences
>> in v6.18-rt vs mainline kernel.
>=20
> The linux-ti-staging-6.18 is too recent, some TI specific changes (like t=
he
> DMA-BUF support in remoteproc) is not yet rebased:
>=20
> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/drivers/re=
moteproc/remoteproc_cdev.c?h=3Dti-linux-6.12.y&id=3D3119d723957038270225867=
130678d76081dee0c

Yes, We have just started LTS Migration process and will migrate all=20
features/drivers from January to=20
https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?h=3Dti-linux-6=
.18.y=20
(Including the remoteproc changes you mentioned)


>=20
>>
>> 6.12 combination with scarthgap is in maintenance mode at this moment.
>=20
> Ok.
>=20
>> The evaluation of linux-ti-staging-rt moving forward will be for master =
and
>> wrynose in 2026.
>=20
> kernel 6.18 was released only few weeks ago (uboot 2026.01 is not release=
d yet)

for uboot, currently pulling the latest rc tag to=20
https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?h=3Dti-u-boot-2026.01 ,=20
But the plan is to pull till final 2026.01 tag is made and then port the=20
delta patches from upstream backport and ti-u-boot-2025.01 branches.


>=20
> We will consider switching to Wrynose as soons as the TI-SDK will be rele=
ased.

Thank you that will be good. Till Wrynose is tagged, We will continue to=20
use Yocto master with 6.18 and 2026.01 branches for migration effort.


>=20
> Best regards,
> Romain
>=20
>>
>>
>>>
>>> [1]
>>> https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/recipes-kernel/li=
nux/
>>> linux-ti-staging-rt_6.1.bb?h=3Dkirkstone#n9
>>> [2]
>>> https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-stable-rt.git/=
log/?
>>> h=3Dv6.1-rt
>>> [3] https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel
>>> [4]
>>> https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-stable-rt.git/=
log/?
>>> h=3Dv6.12-rt
>>> [5] https://realtime-linux.org/getting-started-with-preempt_rt-guide/
>>>
>>> Best regards,
>>> Romain
>>>
>>>
>>>> +
>>>> +include ${@ 'recipes-kernel/linux/ti-extras-rt.inc' if d.getVar('TI_E=
XTRAS')
>>>> else ''}
>=20

