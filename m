Return-Path: <paul.barker@sancloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 314FBC433F5
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 12:47:25 +0000 (UTC)
Received: from GBR01-LO2-obe.outbound.protection.outlook.com
 (GBR01-LO2-obe.outbound.protection.outlook.com [40.107.10.117])
 by mx.groups.io with SMTP id smtpd.web08.23015.1664974040831397479
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Oct 2022 05:47:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sancloud.onmicrosoft.com
 header.s=selector2-sancloud-onmicrosoft-com header.b=Lj1/Pbrt;
 spf=pass (domain: sancloud.com, ip: 40.107.10.117,
 mailfrom: paul.barker@sancloud.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jf9fLtsORlipP2XghrpaH3j924OX96k4AfzYs+7IEyGsnVamPkW9UYIFsVDVkVeE0VJ4p+rJOlZyLRUtPoNLL+YRuK09zOLZahjmLVn1pkG9A2ntYHw1tqQ0VJhHaYd7136I0daV4r7sohtfE8eMvlf50q55O9cTX2grjxvmrASlAGW8zNnJ1YHmfDQZhxKdWmVDcAd/DabJPZ1420CPgQEhuVC5qFWl3QQLtgRUjBLoMZzK3G7BEzmb2AOlGUvtM4Bu3Sr9DCProZ+IccX9W9JzgRy8jHyYdbnKZL9bbX7NBKfC7y7v2e+m8kygsAMTMAL3GzoCbsG0gvuSGPAFXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2nc1l3AebQIu01uP6CtaNgvWr7vFvw1T2GjQou6w44=;
 b=CMJWBteO15LY64BNYOYQj4c2Z8ni00mz7tmfjYqRWqoVXuyM1OKxYqVrI0aHMCFfnEaFDLRF/mQ6DWiGzEvI9Obt2JQAfBd7QW4RVNaPIZthBlfb1FLT2C/OVc9tmXFlqy9J+9EVx7TYX9Q8O4GgEvLwW0nsi9W6KJghkQWSlPZsl9kc9XCQsQ4imJnSRQEsdv+fvPzVnai4R1JiIi4I8jmrUx++UJ7IFIDN8g4q2cdZj9WoBioMHOP1emN8uSpnPWa6bMfdbxFW7tjcNmo81z7t8nrH2K0ib9wkc7TxGoumaZ1vC8v/o8CYIulbRjBQkM0F1uQq0wRQDQAmOhqsSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sancloud.com; dmarc=pass action=none header.from=sancloud.com;
 dkim=pass header.d=sancloud.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sancloud.onmicrosoft.com; s=selector2-sancloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2nc1l3AebQIu01uP6CtaNgvWr7vFvw1T2GjQou6w44=;
 b=Lj1/PbrtIEwFy8h13Rej/9VGHacoY0ohUaM/T8mcqWCibXrG/hpDDHHk9NpfUe6VlmovONCCofAT7zi+rTlrIQRHQLH19PVQsDMw86jn4resdRkqX8TO6OrV+zsNliJ4ooU0CdPCnW0dTRNLBR4Lal2PY2Uv61jjCYCbHDK6vHQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sancloud.com;
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:61::19)
 by LO6P123MB6343.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:2a0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32; Wed, 5 Oct
 2022 12:47:17 +0000
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::11d5:40af:9060:6b08]) by CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::11d5:40af:9060:6b08%6]) with mapi id 15.20.5676.031; Wed, 5 Oct 2022
 12:47:16 +0000
Message-ID: <73652b02-aef1-0dfe-b1a7-d53acb284484@sancloud.com>
Date: Wed, 5 Oct 2022 13:47:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
From: Paul Barker <paul.barker@sancloud.com>
To: Andrew Davis <afd@ti.com>, meta-ti@lists.yoctoproject.org,
 Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
References: <0ba3f29c-3e37-ab9d-93e1-82e9da6ccc9a@sancloud.com>
 <f991b40b-d8be-ed31-ec49-43931f3fc338@ti.com>
 <17190C28A5DB5EE8.9603@lists.yoctoproject.org>
Subject: Re: [meta-ti] Build failure for beaglebone on kirkstone branch
In-Reply-To: <17190C28A5DB5EE8.9603@lists.yoctoproject.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------bpzVnx4sE8kpx6c7eS5ksq1n"
X-ClientProxiedBy: LO6P265CA0022.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::17) To CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:61::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB2241:EE_|LO6P123MB6343:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e11eb3b-7928-4d36-d801-08daa6cfbbf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kqtcB1UiDoPbgZ1IQh8q/Gs3XQmIl7aDpUecECxocy677jjNsc8W40Y6PUTtqiOeX8c9kCAvyziXDc37bNvwrIWfHK5GFvLryUZnAfXxjjJiyQ5ZkQsJY/y72H4HDsiQy1b64OHwBtV5DB/MUUq7qjHgf3N+8zibsgAbxfN08h4jfD4sfzeBixfUJvKlM9FB+XiM/A+QyJOJFVsXWRi5VX5/SxqvJVGBWj6IVmqxFDdnpV1HkLy/HMfTme6TWgL//iZci93cjPywyeH/709jtkhWuw9Jj1MON0TlZzliYga8cmbHtBKilVewQKEcYGSPPLi5BfOXNWs6BEPZoILvvVGyw4uXNuXEktczz7njyvYyAODslmL9FKlou5knjWryTTynSw8JHG2ftqbrwcW/Y+qqP8drOa1IUXYqvQvj30fOAWgFXXYEYKuFwZD/0V+yDBruiszy/ala8fU7YCr0JUrVGK6UvCT1yZ/ZyOV7swExAmj5haEq373f1EBWGODuPoD373oxScZ46R4pVTz/MfmEJPBT54qIzJsk8a/U6A/iOx2WMvAxmBxgvfgkepNTBiudzNy3D13GigyFaBBTjO54zYSQiwSdfCBdN4cGABBCRfSDkrp7RMBZtT4WpHwIHRsmhdIC++bEuYhpVf0VH0lT5tFEZ51HisXlPCxTVHp/qWh9oKXW8m3ZM1BPEw1FIVos4CVKYD92OlfDowYehJGTKmc6whjO5om23Z1KQNpr1TXNfJ60Rz/DqJV5V8lccWPso3c7SEAwAx9coDn5BqtNGXawQSW5ZNvNrXFOOGACx/ojzmoRgk7dRfztzZirnrZR9pzugcZJ7vHUfonnpQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(396003)(39830400003)(366004)(376002)(451199015)(26005)(6512007)(6506007)(235185007)(316002)(33964004)(53546011)(21480400003)(66946007)(36756003)(8676002)(186003)(52116002)(66556008)(2616005)(66476007)(31696002)(86362001)(966005)(6486002)(478600001)(110136005)(44832011)(8936002)(5660300002)(31686004)(38100700002)(83380400001)(41300700001)(2906002)(38350700002)(175373001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S1FaVW5aTzNINFJ3OWxPS0xyRHRSQ2NUQ3VVQ2RVS3FlTEd6d0ljcnAvcGs5?=
 =?utf-8?B?eGhsWnJISlVVUllRR1FKWFZGc0hIQ0FoUjUwK0Q5Vm84aXZEL0t4NTBrQzQz?=
 =?utf-8?B?RnlMb1JMMmlPY05PcEhVaVhSUGZ3RTI5UU5BOFJ1SU9Kd3VuSXFYMXY0WHo5?=
 =?utf-8?B?ajk0L1VZUzhyZ00zWGN3dHRBaG1xek1GcThyNGxCVWlyQXp0Q2NqWVorbkJM?=
 =?utf-8?B?am03ZEhzajNNTTJCUVhsSXNTbmFBRDdBbjNKS3BNZ2tPWU9WZmRhT2dJanJY?=
 =?utf-8?B?SjBheWRKRHJyVExHT1RDbVhlNjJCNng0UG8vUGdXZHZ4UHZ0b1BkQ3lZOHls?=
 =?utf-8?B?dzE2Z3VZb3Qvc1lxUTdjbDBzYXhIWGJlU1Myb3MwY2hPbmcyYm90TEpXQzJR?=
 =?utf-8?B?QU9EWnAveW0vVDljWW1KRGpoTE8xa0FpVUxKb2MzK1lPZ2RxZDZIZmRnYXlr?=
 =?utf-8?B?N2xETGwzUkJjU29YdFdnUi9TeG45N2ZLYTRiNWpja1JobFo5Qnd6VXp4Vnhv?=
 =?utf-8?B?WWlQL1BPVnNsblhBdDV6WjVONHU2U2h1OXh3TUFnemd3YjNNUjVGS3VNcGxq?=
 =?utf-8?B?YUpvUVpROGNnMDRob1hUUmZsUCtsNVB3QlYwT0xYcE5pdVEveXh3TkJNdzJr?=
 =?utf-8?B?aFNJZnJydUQvVjBRWXFpV2J3OU5kclNGaFF0Z2lJbGlLR3Z3UlVpSnBjc3RF?=
 =?utf-8?B?ZWR6a3MwM0FLT1BDdnBvSE5DSnNsUUtLemNKTFRhU2Y0QSs2Q0RIU2tRdjRm?=
 =?utf-8?B?SjZOMGZUK2k5MU5jSlVJK1RlNURSMytGUzlzUTNoNXZkMHlIWmdCMVM5S1l1?=
 =?utf-8?B?SnBUTkFZb0V6dDl6Z2huY1JKM0FDS3Z3M29hcUJHSXlFZ08zNkt5QlpNaVVE?=
 =?utf-8?B?clNuNGQvMGxlTmhEbEJPRUtIeHl6a0FoRW9rZDVQNmNtU1FMMFQ1U1lFM1hp?=
 =?utf-8?B?OG95Q282dENxVm1WOGFSVDZWOFhpUUhybUZFT1NGckt0TklRaHlQZXY0YVJH?=
 =?utf-8?B?cG5oOUZrc0V2SWYwRDdqQVVjUUt5amI0YS9CakxrTG9xSFNCNXhKTFN5UlhE?=
 =?utf-8?B?YjJ0VmRiRGNQdGcvbkF5WXpQajZ0YUZjeFd0QWY0RmRFMm5HNWZHVzJSZ0g5?=
 =?utf-8?B?ak10WjAxaDZZTVl1NGQ4RXMzVXVJanowYVI4c0NuMkROY21DS3pjOHBhU3Q4?=
 =?utf-8?B?YXB0Vk5OWGZzaGI5dGorZ2MwdnJRVkZBOXNmbGZCZ2MwM09JY2orSXpRcDdo?=
 =?utf-8?B?ZzI5Y2lmb0cxemJNSkJncTEvK3RoYmNUQ3hFUDVmTzF4ZUtIUkovQmtBNDRN?=
 =?utf-8?B?LzdYYmpIYUdhbGF6cTR2ckpEY3ByZktrOFErczhVTDRYeWUvMWtqRFh6Mkty?=
 =?utf-8?B?dmdWNGVCTWxHQnJpYTFua2RiZ2I4NkpXZk1vdUFJS003VG9CdTRUWlEwVk5B?=
 =?utf-8?B?dHNiRmhycXNNZ0plakpTeERpY1YrYjRUYktPcDQwblpZd1l3SklOM081Zlpj?=
 =?utf-8?B?MlVuMzRWc0dLdlByaHk4R1dSSjk1bEdEL3BubVorSmY4a09CUHJXV2JmRm9M?=
 =?utf-8?B?enlvRkUyTUlZZVRoYzVQSC9kaXk3ckpYVWR1UlZBelRiL3VmRm9GbC9TT0xn?=
 =?utf-8?B?OXpoeVExZ096MGZrcUM5TjI5SHJ5dytpazIrNk5hOTNhbXZWSDZQdnMvVXRD?=
 =?utf-8?B?aWw4aERBbmZjNUl5Z2lHVVh5T1YzL053RFdldkZJUVpQQzlQNlh5blMyaEJJ?=
 =?utf-8?B?aVVabUVUQXlJN3QrWFdTT0ZrNHdOYVcvQUhTTGc1Z09kUkl6TFZIQXlrRkEr?=
 =?utf-8?B?eWRvRi9pQldWMnN4NmxGRnAvWUNNRWF1SmdpN045bDNZK3RhNmpKTVlKRWta?=
 =?utf-8?B?amI0UU04TEViRlJ2T243UjBCSnhHRnE3c1FCSXJObWhyYzBMRGtXQWhZb2VS?=
 =?utf-8?B?S2VQYWZxRWtCWmpkZUVDNnMxZHVubmZ3MndvN1NsYzZPWkVvekUvZUxvVjU3?=
 =?utf-8?B?VFhJUTJIZFlrU3NqcUdIazJoMnB4LzlNamR1WUx5aitjLytGajM4YTMySXlR?=
 =?utf-8?B?Q2xjaEZzM2JGcmh0Z3N5UVJLNDJrUUU1ZWV1aHVGb2VjWXpya2ZpdGhlaTlv?=
 =?utf-8?B?QmEvc1RqalVhK3FiK0ZRQnVzeEpFVzlzb1VwZmpZT1JWc2RlOGlkT0hhQlBt?=
 =?utf-8?B?VHc9PQ==?=
X-OriginatorOrg: sancloud.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7e11eb3b-7928-4d36-d801-08daa6cfbbf7
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 12:47:16.9307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 840be37c-244a-450e-9bcc-2064862de1f4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 okXCpXEjspHME9k6+VAXaak8Md/6IQ/aQFE8ar1buZt+OshATUbYic+v1FRQilcmiwEWymx8HVSx/PSjlWG7dzkOjnm4gS9IsXlTDTZHkJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P123MB6343
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Oct 2022 12:47:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15110

--------------bpzVnx4sE8kpx6c7eS5ksq1n
Content-Type: multipart/mixed; boundary="------------WAe3lRzn0Ny52YNZk4W4BJxz";
 protected-headers="v1"
From: Paul Barker <paul.barker@sancloud.com>
To: Andrew Davis <afd@ti.com>, meta-ti@lists.yoctoproject.org,
 Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
Message-ID: <73652b02-aef1-0dfe-b1a7-d53acb284484@sancloud.com>
Subject: Re: [meta-ti] Build failure for beaglebone on kirkstone branch
References: <0ba3f29c-3e37-ab9d-93e1-82e9da6ccc9a@sancloud.com>
 <f991b40b-d8be-ed31-ec49-43931f3fc338@ti.com>
 <17190C28A5DB5EE8.9603@lists.yoctoproject.org>
In-Reply-To: <17190C28A5DB5EE8.9603@lists.yoctoproject.org>

--------------WAe3lRzn0Ny52YNZk4W4BJxz
Content-Type: multipart/mixed; boundary="------------Zb1ruW4WAO1Q3bdXW76ar0TF"

--------------Zb1ruW4WAO1Q3bdXW76ar0TF
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 28/09/2022 15:21, Paul Barker wrote:
> Hi Andrew,
>=20
> On 27/09/2022 18:53, Andrew Davis wrote:
>> On 9/27/22 12:01 PM, Paul Barker wrote:
>>> Hi folks,
>>>
>>> I'm trying to add support for the Yocto Project kirkstone release to =
our
>>> meta-sancloud BSP layer and I'm facing a build issue. I've reproduced=
 the
>>> issue using just the meta-ti layer and its dependencies, targeting th=
e
>>> beaglebone machine. I've used the kirkstone-next branch of meta-ti as=

>>> the kirkstone branch has not been updated in 5 months and has the sam=
e
>>> issue.
>>>
>>> The build fails due to a lack of buildable providers for virtual/libg=
l.
>>> Is this a known issue?
>>>
>>
>>
>> I've run into this before, Cairo package pulls in desktop OpenGL when
>> GLES2 would be more appropriate. I'll look for the exact fix but
>> you can try putting this in your distro .conf file:
>>
>> PACKAGECONFIG_remove_pn-cairo =3D "opengl"
>> PACKAGECONFIG_append_pn-cairo =3D " egl"
>> PACKAGECONFIG_append_pn-cairo =3D " glesv2"
>=20
> If these settings are required they should be applied by default (perha=
ps via a
> MACHINE_FEATURE). I would expect the beaglebone machine to build
> "out-of-the-box" with the poky distro. If that really isn't possible th=
en
> necessary settings should be documented in the readme file for the laye=
r, added
> to a local.conf.sample file or applied via a setup script.
>=20
> Thanks
Looking at this again today, I attempted to try the above PACKAGECONFIG c=
hanges
however they do not match the correct override syntax for kirkstone. That=

suggests to me that they haven't been tested.

Please also note that this is not specificly an issue with the cairo
configuration, attempting to build core-image-x11 & core-image-weston als=
o fail.
For example, for core-image-x11 the errors are as follows, re-tested toda=
y with
the current HEAD of the kirkstone branch (2b11afa8aa19):

ERROR: Nothing PROVIDES 'virtual/libgl' (but /workdir/poky/meta/recipes-g=
raphics/xorg-xserver/xserver-xorg_21.1.4.bb, /workdir/poky/meta/recipes-g=
raphics/libepoxy/libepoxy_1.5.9.bb, /workdir/poky/meta/recipes-graphics/c=
airo/cairo_1.16.0.bb DEPENDS on or otherwise requires it)
mesa-gl PROVIDES virtual/libgl but was skipped: PREFERRED_PROVIDER_virtua=
l/libgl set to mesa, not mesa-gl
mesa PROVIDES virtual/libgl but was skipped: PREFERRED_PROVIDER_virtual/l=
ibgles1 set to ti-sgx-ddk-um, not mesa
NOTE: Runtime target 'xserver-xorg' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['xserver-xorg', 'virtual/li=
bgl']
NOTE: Runtime target 'packagegroup-core-x11-xserver' is unbuildable, remo=
ving...
Missing or unbuildable dependency chain was: ['packagegroup-core-x11-xser=
ver', 'xserver-xorg', 'virtual/libgl']
NOTE: Runtime target 'packagegroup-core-x11-base' is unbuildable, removin=
g...
Missing or unbuildable dependency chain was: ['packagegroup-core-x11-base=
', 'packagegroup-core-x11-xserver', 'xserver-xorg', 'virtual/libgl']
ERROR: Required build target 'core-image-x11' has no buildable providers.=

Missing or unbuildable dependency chain was: ['core-image-x11', 'packageg=
roup-core-x11-base', 'packagegroup-core-x11-xserver', 'xserver-xorg', 'vi=
rtual/libgl']

Is the kirkstone branch currently tested or expected to work? If there ar=
e known
limitations or additional configuration changes neccessary in local.conf,=
 could
they be documented in the readme?

Thanks,

--=20
Paul Barker
Principal Software Engineer
SanCloud Ltd

e: paul.barker@sancloud.com
w: https://sancloud.com/
--------------Zb1ruW4WAO1Q3bdXW76ar0TF
Content-Type: application/pgp-keys; name="OpenPGP_0xA67255DFCCE62ECD.asc"
Content-Disposition: attachment; filename="OpenPGP_0xA67255DFCCE62ECD.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=3DsH2a
-----END PGP PUBLIC KEY BLOCK-----

--------------Zb1ruW4WAO1Q3bdXW76ar0TF--

--------------WAe3lRzn0Ny52YNZk4W4BJxz--

--------------bpzVnx4sE8kpx6c7eS5ksq1n
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS7m7rT1+CktY3YG1PYN3IfEvob6gUCYz180wUDAAAAAAAKCRDYN3IfEvob6qBz
AP0WgWMTxKrqmD2W6jV7qJQkvuH8V7l7BDlyDNrcZM6Z0gEAuaey3Ya5get/nQL2TlT9LXenaKcl
zXr+ZwP9FEWJgQc=
=Z8d9
-----END PGP SIGNATURE-----

--------------bpzVnx4sE8kpx6c7eS5ksq1n--

