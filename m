Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2261EEA865
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 22:03:57 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.60])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57569.1770933827918451163
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Feb 2026 14:03:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=gvVdApRZ;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.60, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YbpNCSRIgezAmXHa8rFVYmnNYJSH2/lLN0z6fLE43jSVdbmZMEN8XtdLz8dQrINrl+Ng+Ojp5rDYgF/t4/bs2NaB9d6tKRS6DbaS5JzKuNdYhQs+e3Q2FhJdljExp3jqYZ5wV0dgTBcFrxenUrACdeR8RTtij4hLehpEJMHvyIM+acM112nwUHNwOc9GuUF3zTHtOF/XWnH5NwFhypABuB7wFeQ+gGLIZf4mNPp8EbfgThCvv9Z7gPFhiM6WpW/1gkPyq6CsabB8/OqAJSiGaoWk1M4pGPL8ZFbaEho1REJSqsSnMT+tC3KEGlOIKXur96KOnQmV1RW68/n8G/aGOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TVO8yXC0C2kLJYkPDszmZ6fsC9+qhFKrk361IrcC7Z8=;
 b=HRqvwm0vfXNJc7odM4PHyMAKosyEYIa5EdZYxem0gB/02z6zlGC5qaIaTnYZ5B4x3tlR4zoWzJrDb81zN4HlJBjveNfhjY0leoQR7oHT68e1aQDsF8BnPneWEGC7NqR+wfOd7bndp5Q5Kq3rvRqMpzUTrlPOQSYCYTAxjYlwIn7eGUTG+4KfasmnBWAJsE2SY1snIBdepPBKrjyFdRfHDsOsHo5ZvVnN0Uc6o6CHcvct2DUwyyCUys3b8iwoK7AF7rNO8e1WkDbQsld4s7mnSwoVWRPrbodqujkreO4yvkxIU7TFIPdw9ZgZ+rxy6ROU7zmFXat1sLjnM1GKSXVyoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=toradex.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TVO8yXC0C2kLJYkPDszmZ6fsC9+qhFKrk361IrcC7Z8=;
 b=gvVdApRZ9m3WrDOi/nNXOEWeTW36Odpm5kMFWMU+pOx1Msroj4Zq2KIuUlaa/SSZr5wfR4bgTOcweslMPR6cLjn0prILs30lyWddCP6YzTkk0XVFu1+M4sqaJDbirdyn6hshlmEWcndAC/MXtkWJFXOjC8JKvigKvqA0PRcCFSw=
Received: from BYAPR06CA0045.namprd06.prod.outlook.com (2603:10b6:a03:14b::22)
 by PH0PR10MB4405.namprd10.prod.outlook.com (2603:10b6:510:40::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.12; Thu, 12 Feb
 2026 22:03:43 +0000
Received: from SJ1PEPF00001CEB.namprd03.prod.outlook.com
 (2603:10b6:a03:14b:cafe::78) by BYAPR06CA0045.outlook.office365.com
 (2603:10b6:a03:14b::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Thu,
 12 Feb 2026 22:03:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00001CEB.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 22:03:42 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 16:03:35 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 16:03:34 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Feb 2026 16:03:34 -0600
Received: from [128.247.81.11] (ula0226330.dhcp.ti.com [128.247.81.11] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61CM3Yep050450;
	Thu, 12 Feb 2026 16:03:34 -0600
Message-ID: <8a5487a0-824a-4f39-aa50-cf6466764574@ti.com>
Date: Thu, 12 Feb 2026 16:03:34 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [meta-ti-bsp] SERIAL_CONSOLES defined at SoC level
To: Vitor Soares <ivitro@gmail.com>, <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <denys@konsulko.com>, <vitor.soares@toradex.com>,
	<francesco.dolcini@toradex.com>
References: <4e08fa3658b1e54add6d5476c7234e86dbcbb60c.camel@gmail.com>
 <d0aabf72-f9b8-4864-b07e-7a0d4b3bab93@ti.com>
 <bb0eb4c0bf8543175b3aa50f0d954aafce56d576.camel@gmail.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <bb0eb4c0bf8543175b3aa50f0d954aafce56d576.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEB:EE_|PH0PR10MB4405:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bc6e9a6-0c04-4cc9-6800-08de6a8295a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|4022899009|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0K/m67Jux+a1A6rz2bx2p1IgAOysm43JuMhA431OSIpc8tOtVGaOE+tMuLZ/?=
 =?us-ascii?Q?7hwTsHOy/h5i1q83SA8h53ibHOUzEmv+1PN1ZP4V+8xo/C2R19MytDaRZv1V?=
 =?us-ascii?Q?IExQ8a2HsSam3nQX2ajXckxdKweZFE9uHDaLUlTDNPKc9SCh1A7sWypbh29X?=
 =?us-ascii?Q?vQeZkEPXZPy+JEULr3lVItPPWlGkCfnspHZtbm4pywN6goE2z05pguKNMV3n?=
 =?us-ascii?Q?G1dtUjPNdPr98QMshV14UyOR6qRACHynqmPP8MfuKJQeoNMh5K2XPvX42TQy?=
 =?us-ascii?Q?vdX2EM+K41pp3H8dbNJMf/Sh4mC8CPeuZn80GAANWL0OsTkGPU3CtmZRWQrr?=
 =?us-ascii?Q?bNeVYE7WLOwVhLQPSfS8vTCHNvhsXo2IAGoqJXfSjcixT3ec77X8SXdqnQOG?=
 =?us-ascii?Q?VyMlorfU1vIWNQe6ItLKK5Va6GmiYTVE+jLOxKzBQL9fYwNsePoVyVICq/iG?=
 =?us-ascii?Q?D0ltG9o+gzv2S62IWRnFpv+3txMAouZyYALIYknrrTH/fEgq4066LPP7Vem8?=
 =?us-ascii?Q?UY7Vd0TiFJVu9GDbiR+jXZADmsah6JN3fTCTtwV9AXDuLNC9vug52FlpMxDv?=
 =?us-ascii?Q?0zbZG7cTBmFQp3Rv406ildAndPBs4uVAGH1Nh0yTZd5vj86C0/yW2okj1QTt?=
 =?us-ascii?Q?pvjGFCto/0CdhYS+sFNVEi0ptl+S2nTbk0B8pUQ4JyDuBxUULiFPnTlSkXJi?=
 =?us-ascii?Q?HzwFqpTyk3as7W8POhOv5+1KMzWzbWx56SveobAdEyHul57X/qbAxagbBx/Q?=
 =?us-ascii?Q?uw+AW4AoLFZp99ouXAdSGboRO5yPuPDnj2LbnRxuw897cv8XmSE7p6GCo36M?=
 =?us-ascii?Q?C2py+QIahS/mKGf3tRHO0JSn2mcwbQKd/QFExu/PpBmPxx31qoeVgv6CUM8f?=
 =?us-ascii?Q?sfixBh1StzJQFc70UCEQgyIFareqZNhbBTSnrIA0oFkuKCHfQuCgmGCQ5UwF?=
 =?us-ascii?Q?FwoyMaMqIcRc8wcq0jC45de5jngLHL3RNwF+tsWoTK8ngFpPG+nB71bqmR4E?=
 =?us-ascii?Q?jmWA+VCOrEV5RFRtteYiaunvG+8w3bEaZwcK9qC61jx8hygzilM1DqY0fQtW?=
 =?us-ascii?Q?9u3a/x9v9x/70123H4KOwRSi3CHNxQ6rKr4fp7Vz4QFMal5la16C+un5C9Mp?=
 =?us-ascii?Q?dWfadR8qiF6gdxqHumR7kTj6Ncb+snAevAc1Nj5yvXQYDO9ri1dLjQ3/B1S2?=
 =?us-ascii?Q?YpwKBCmE7QflQ6xpfBs8Bm1IKSUDXVngVxxWVoXeUzfue676/cuiPxhIfNMh?=
 =?us-ascii?Q?6XR7mZIDw25viLIRuWqAGJNuAUTTqxlGiPwZghcvUh6MYUIQQk2Aa7QwIehD?=
 =?us-ascii?Q?0Zgrykv8REKxt5OHzk/BGw+qusgDHP1QMNAQejTBkCMIWml8Bi/RfqnHcqtd?=
 =?us-ascii?Q?bT9zQCpwK+tTspKmPRHOeHjoT1uQZGWF/LdFYcrGBbrgZKAQ0+L+gbm79iCv?=
 =?us-ascii?Q?rdCIWkmTL6B57HzAA+cmWGbm8mLShOFDSINTba6r784Yk4wIe0UgIRCyeRtE?=
 =?us-ascii?Q?zYyAEWOIJFngE/hOEvdxO0RzTyNA5Ls5yyfrapHORlfXoN/7xX1fD83WpYp5?=
 =?us-ascii?Q?UsW96Uh5fs1oRbaz2mOQMej9z3Dzlq9RZ9DwmuTc6/4xp8sRmwIaJ5tcr1UQ?=
 =?us-ascii?Q?+A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(4022899009)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	6lh3iHaSxj3pJ3uS2NOIdatALRjxyI/na0aWStffP+vFT4A+SlrHFI5S4i8Ppuu6ZF0lsWN/SFPP6MbbWPewJbasHpuikqNWAvdwxQA/dP505wKVawre1YimXVfvidj1j/DCTrezWqb+eG31IcGf5IoXCn+ozsSu/vMBGVc8FqCP40y3CLW57I4eJPbuvy10GZGAeLQj0v2PztAL7X6OVxHkNCpcs4/edf8F3WrpOW/mmB7NRpWGg2N0q8MSI+jI+FEhOwwqkIwhis9YHSIBe/AZklhaTz5EoZJWPEFptrPHC7X1kF07xOgzHAITqDxUEs59b+e1041kbN35fTZ+zKGTRKH9saSLxAYNX5BFC8MBEYQdo6jf3sG9mwb+1XR5VbRwktzDQL1z7gin2WT0NTczHOQ71VhbRcXWZhmm1D5ZZq7lm0Ec3OahvX0jg9Eq
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 22:03:42.0553
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bc6e9a6-0c04-4cc9-6800-08de6a8295a2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CEB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4405
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 12 Feb 2026 22:03:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19507

On 2/12/26 5:42 AM, Vitor Soares wrote:
> On Wed, 2026-02-11 at 18:52 -0600, Andrew Davis wrote:
>> On 2/11/26 11:15 AM, Vitor Soares via lists.yoctoproject.org wrote:
>>> Hi,
>>>                                         =20
>>> While working on our Toradex Aquila AM69 SoM support, we noticed that k=
3.inc
>>> defines:
>>>                                         =20
>>> SERIAL_CONSOLES =3D "115200;ttyS0 115200;ttyS2"
>>>
>>> This caused systemd to enable serial-getty@ttyS0.service=C2=A0on our bo=
ard, where
>>> ttyS0 maps to main_uart4 - a user-facing UART, not a debug/console UART=
. The
>>> getty continuously outputs a login prompt, interfering with the interfa=
ce.
>>>
>>> This made us question whether SERIAL_CONSOLES belongs in SoC-level incl=
ude
>>> files
>>> at all. Our understanding is that the console getty is already handled
>>> automatically by systemd-getty-generator from the console=3D kernel com=
mand
>>> line argument, which makes SERIAL_CONSOLES potentially redundant for th=
e
>>> console
>>> UART. Any additional UARTs beyond the console are board-specific and
>>> arguably
>>> belong in each machine config rather than a shared SoC include.
>>>
>>> We are not 100% certain about this reasoning and would love to hear the
>>> rationale behind the current approach. Are we missing something? Would =
it
>>> make
>>> sense to either remove SERIAL_CONSOLES from the SoC includes or at mini=
mum
>>> use
>>>  =C2=A0 a weak assignment (?=3D) to allow boards to override cleanly?
>>
>> We simply noticed almost all our EVM boards used the same console UARTs =
and so
>> refactored the definition into a more common place. But yes you are corr=
ect
>> that a file like k3.inc seems like it should contain only items common t=
o all
>> users of the K3 SoC family, and not simply common to TI EVM boards. Chan=
ging
>> the assignment in k3.inc to a weak one seem reasonable (although I think=
 you
>> can still just override regular assignments after you include k3.conf in
>> your board conf)
>>
>=20
>=20
> You're right we can override it in our board configs, but I wanted to sha=
re why
> we think this is worth reconsidering.
>=20
> The issue is that SERIAL_CONSOLES in k3.inc mixes SoC capabilities with b=
oard-
> specific UART usage.
>=20
> The K3 SoC provides the UART peripherals, but doesn't determine which one=
s are
> used for console, user interfaces, or other purposes - that's decided at =
the
> board level.
>=20
> Different boards use UARTs differently. On TI EVMs, ttyS2 or ttyS0 might =
be the
> debug console. On our Aquila AM69, ttyS2 is the console but ttyS0 is a us=
er-
> facing UART. Same SoC, different UART assignments.
>=20
> SERIAL_CONSOLES creates getty login prompts on listed UARTs, which is a
> board/system integration concern.
>=20

I think the same could be said about `IMAGE_FSTYPES` which is also in `k3.i=
nc`
but really should depend on the type of media on a board.

> If TI's EVM boards share the same UART configuration, would it make sense=
 to
> have a ti-evm-common.inc instead of putting it in the SoC include?
>=20
> Happy to help with refactoring if you think this direction makes sense.
>=20

This directions makes sense to me, I'd have no issue with a ti-evm-common.i=
nc.
Or even since it is just 1 or 2 lines that would need to be moved out, migh=
t
be easier to just move those lines back out to the different board configs.
If you want to send the patch then up to you.

Thanks,
Andrew

> Thanks,
> Vitor
>=20
>=20
>=20
>> Andrew
>>
>>>
>>> Thanks,
>>> Vitor Soares
>>> Toradex
>>>
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#19482):
>>> https://lists.yoctoproject.org/g/meta-ti/message/19482
>>> Mute This Topic: https://lists.yoctoproject.org/mt/117760181/3619733
>>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub=C2=A0[afd@t=
i.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>
>=20


