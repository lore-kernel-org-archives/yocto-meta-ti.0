Return-Path: <paul.barker@sancloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85C8FC32771
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 14:21:49 +0000 (UTC)
Received: from GBR01-LO2-obe.outbound.protection.outlook.com
 (GBR01-LO2-obe.outbound.protection.outlook.com [40.107.10.134])
 by mx.groups.io with SMTP id smtpd.web08.8592.1664374904955141155
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 28 Sep 2022 07:21:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sancloud.onmicrosoft.com
 header.s=selector2-sancloud-onmicrosoft-com header.b=ck2VUSNI;
 spf=pass (domain: sancloud.com, ip: 40.107.10.134,
 mailfrom: paul.barker@sancloud.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HDKg6BnBOPETHSfELkBwSk0QegvaBvcJlPcV87KtlJgm4jqJgTbbcluIImc4pNAKhwJE6WvxpiuVIOHg60g6+aCjwPkTV/t6Mp0BD0BbJJzX3OgMkcf6dTK3e0ddYEBtpzOCC8cqee86dGkMmGs55h6Cbr1EDv7G/arzXl3dQuELHuh7Zq3C3UMOvx535A5E1AxaBg0Sxl1KRRiUFwmV+VAXONiL2HKwJhCOyLnCcrZrpAXYEYogzE9+HqVQjO307IiBX+8dkSXH9ZhkdI93O890XujkxJcBQ1kyJYO0zdAHyQKbHE7GqKHgPzk/iyYOpbJj+4wPdc1T6r6C5YIsfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvgIiQ2wULusL32qDt2QgW6dh67H+flTN0PmlB6IqRU=;
 b=J4JlvcF5I/1+1MTVEaHRT8bsLJfbpm5fuQ2IR85Gc0SGLROAkKvJbCKn2FlEXcfiMmRYyVqWDL7MLkEO/UPclVw2EoPh3PxSkOs5z005JI2KG8DMksUfwyuOZZLcG0f1Ht90PJ7w5XRpFzKGEtu2VoC6PJS375labmM3RtyL93NKvR3gl1phn7E/nl02ouhz4fjuub8ajtu/pJfweVkRmKfh9M/laNX5QmDzPHUwUCbPvG9ntx/Hp4rQHI9RWx8uuDyLU68XRzdg8e9dEP80mV5ahOaFSiPBjWLIZEVkeDiXwtG4s4fe4/vs47nkpGbfKWRC3Wc0idsTBzTlyjsMiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sancloud.com; dmarc=pass action=none header.from=sancloud.com;
 dkim=pass header.d=sancloud.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sancloud.onmicrosoft.com; s=selector2-sancloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cvgIiQ2wULusL32qDt2QgW6dh67H+flTN0PmlB6IqRU=;
 b=ck2VUSNIP8ntxTG45+VIWTlW2QrsLVWfwoXImwm2BhdE5GS8IsClSxoHQU2/iwkb7VmXeBMhyQKNLdSFN/ktCRMnf4S1GzCTRktxrmfMK8Wnx2Eh68mMDfCJHjnmu9Ol7J9eg0qZyj25LWkxaZ2xZBgut2VNKA0N/CtO992le7M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sancloud.com;
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:61::19)
 by CWLP123MB2868.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:5d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Wed, 28 Sep
 2022 14:21:42 +0000
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::11d5:40af:9060:6b08]) by CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::11d5:40af:9060:6b08%6]) with mapi id 15.20.5654.025; Wed, 28 Sep 2022
 14:21:42 +0000
Message-ID: <b3b49652-0d17-9819-5cf5-f1c7cc280701@sancloud.com>
Date: Wed, 28 Sep 2022 15:21:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
To: Andrew Davis <afd@ti.com>, meta-ti@lists.yoctoproject.org,
 Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
References: <0ba3f29c-3e37-ab9d-93e1-82e9da6ccc9a@sancloud.com>
 <f991b40b-d8be-ed31-ec49-43931f3fc338@ti.com>
From: Paul Barker <paul.barker@sancloud.com>
Subject: Re: [meta-ti] Build failure for beaglebone on kirkstone branch
In-Reply-To: <f991b40b-d8be-ed31-ec49-43931f3fc338@ti.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mwOzb0crpNjnjW6jzO9jjDFc"
X-ClientProxiedBy: LO4P265CA0090.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::11) To CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:61::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB2241:EE_|CWLP123MB2868:EE_
X-MS-Office365-Filtering-Correlation-Id: 101885bd-33af-4802-3759-08daa15cc3b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	O8AU1Wwk/7dJbI+3qbIOkW2AjjZHSweccukBajVDRVFS+pFTtHpLkz+TenwkuqnQTznjLd20m6zKguVu6tv1tLbew2zUF0OQikocXlWbsS1KYzunahloLs+zuhUz1WOgdvXoNzJ3vmoUlJF24x5X7x1xYSKHAP/qd2sdpayBEKOoWw8LgohA8LMx7LrrpByhD56DszFcKgBslXXkd2gLU46Eiih3hLYYBcmISC40mbQ46v6HNwHbAieNR14s8qD1uA7HHKNbijdyU/MPmdCKR+LVHbCm5ycjK2JTUGFzw3TVLXTTcS1njJiEtAJhy6FGyAoD2nMOsE68LD8TIBWYW9Od4VMaleciJQgjkqecHgEVydqaU+s1fqTCggbHwksbpzxheceaHmiQFuDEObNlju9Rb1jGOZZwGc80vCY03ylrKIil+vNkItO9svCJkyJf6eMATh92Q0jSO1jyzhUH8zo/dU7R2iJOn5zrqrrwGnKSCBoSaWCJaR+NhVKj14keoqEYLLmhGq+lmBWey67HitxUn2PsbHxNgoU9yrK1GWzm/61T6ATDvL9d9lhWZk7bMyFcntmCjvPwuAtm4cT3jD3eulxR9sedYRd+yGWpoSHn/WdmRM/SFpqbXk+WYX6nZCQpKeYmRflqUv6ghoaodIYT5lzDB3Bxt9gfxiv7e3orih64GpJrv7DJ2tso5N1dfQiEQTzU/gV0R5N3HgxUlFHrbVL+YR7d52Y9ZmG6+QL2eY53/6DvadDrPcCKhRbze2wuetKmlFDD9LGBCLaqfHhKSr7zHMftS85HLTPWiA2XuTKdRF8KDHXE+dIQWQcg+iVkYYKmancNSAavKbSSehOFfcGQ1gALEgIr+f8QfubC4Rf8KSfuh8pwbq/Be1zV
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(376002)(39830400003)(136003)(366004)(451199015)(478600001)(6486002)(31686004)(966005)(53546011)(52116002)(33964004)(6506007)(186003)(110136005)(316002)(2906002)(2616005)(38350700002)(21480400003)(83380400001)(38100700002)(26005)(6512007)(36756003)(41300700001)(8676002)(66946007)(86362001)(66556008)(31696002)(44832011)(235185007)(8936002)(5660300002)(66476007)(175373001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q3dFaW9JT3NCV0hNTTlXZkJVT1pFWkZ3ang4ekNWNUQxVUdVRllKRHdaTWt0?=
 =?utf-8?B?ZVlrcnpPWmdXOVlLWGZyamFmNFI4VDZsTjM3dzA4V0d4MVgvTUpIeXFpWmJJ?=
 =?utf-8?B?SnhoUVdTdnhlczc2MjFWSTByb3J3UzhpbmpwRFZCYlp5RTY2dVJ4VENBMmkw?=
 =?utf-8?B?SGhKZ1k5eWhDQ3lJWXVRbU4rMmJYMS91WjhaWGRzTDdlWUlBMVJRN3I4a3BI?=
 =?utf-8?B?UDlEdGI4RHNYTFBXVjFPVFFHWGpJS3FwNWwvaExUdDU2NVQ5TmUwTm9pRGRt?=
 =?utf-8?B?WGZ4YlFaUW9QcXlha09jUUZsbDJpS2JIbkNXZzI3aFJ1anY2UDdnQWJieFRo?=
 =?utf-8?B?TGJxUDBKaHBEeWNIUTBWMGNtanlIM3hkM0Y3NVFjTEdzYUFsRDJCejZTNWxV?=
 =?utf-8?B?dWo4WGJrVnpkVkltM1hFM0Q4QUJES0VuakJwQkdsdE5mRUFaYmhpZmxyUlBH?=
 =?utf-8?B?UGxtbVlla2JGS1BXK2NXL1JXaXQ2MVZvQ1JRZktzZzdZMWszUVljQzJFb2hU?=
 =?utf-8?B?djBnYitQeDlLN3NZT1I1dS9VbEdZNHJHZGh4dkVsQVhMTjZzUUtUZ0xiV0p6?=
 =?utf-8?B?cDdOaTYyTzlaK2FodEdodlRpOW5ITXZDVkJSKytyYkxSVVUwTjZkOUVrQlhu?=
 =?utf-8?B?VlFGcHNJY1ZKMTZJS1pzR3QxVGZYamxMRlBJanIzUWNMa05QeHY3SzJCSnhS?=
 =?utf-8?B?NWRDSVJ2anJsVzhJV0tPZXQxSDFPdm1jT1hCYjBNd1VaMmR0UFRBV0xDSVBY?=
 =?utf-8?B?VG9oN2RGK0VlT1JXeDZ6ckJBdmdrbC9HaFptZ0xhdk5qWks4S0hzMVB5Mk5n?=
 =?utf-8?B?L3VBZitSZElIb0ZubWtKQUpjVHlZN2NGYStTZHRRWldhMllDbzEvMWttMno1?=
 =?utf-8?B?bzhzUHJZcWFFN0FxYmpMT0VvZHVnNWtnR01aeEtyVllVS2NWamdjVkhWTUcw?=
 =?utf-8?B?ZVRud1pNdHIxQUswZU9YY0VEZHhSRWx6cUpWWUduYnN6bnd6UXo3QWg3WkdU?=
 =?utf-8?B?cDZhNnVrcVlOZUVIcWpXdkRxdC9pbUw3OXFMQmpvdm4zbFdDMHE1Nzgzbndz?=
 =?utf-8?B?TVBVdVBIektmWGlpVCtxVkYrS243SjhjSWRWYUdhZjd2dHlwM2x3L2UrVUFP?=
 =?utf-8?B?VzVvUWdpc2YxemN1ZFkzQ0dqZDZhbTY0OEhpb0VJUWhER3hReU9MRyt2YkV1?=
 =?utf-8?B?eXFTd3EvR0c1WnFDbWVmTllvMnUvV01HU0M1STFLTDVwaGtQZ2hqeEJVMXcy?=
 =?utf-8?B?S2tVWmpnYVQzaEwwL0lHczh1SElXdDVTUlVITjNOSE9PakVuSGFPWVo2WS9a?=
 =?utf-8?B?QW9qaU0xZU9rRkNLZ0tRd3FHWGM1QmFSdDNicWtSYnhYWXVSUjRuUit4dnBn?=
 =?utf-8?B?LzRKY1gvVFUzaTNVbUxQVU9vNk1ub3ZPT1dGKy9NWTlhNlVFTG1Fc1gySGFl?=
 =?utf-8?B?YTg3cTBSY2xNUkJNMzQwNU5MSXJ1UElVOWdZdGoyQXdRUUYxbEpENEVGZVNX?=
 =?utf-8?B?ZU51YkMvMmYyUVlJTXU5ay9zWmRyemF3VzB3cTVzYkE3TXRVVTJZa25VSFJw?=
 =?utf-8?B?aGU4VG9KakdVZ1VibHF4dUdtaU92cHp4d1ExTXREUW52TEQwdkpTbndrQzFj?=
 =?utf-8?B?UlBQemd0WjZqTEZqamx3MElLYXFmTlNiejk1QVJHK0ptUklwOUY0ZzdURHZD?=
 =?utf-8?B?Z3RkTUpBYmU1SHVTRFBGQ2ZWeitrZVZMZUFDVzNON2xSZ3R6ODZyUnR3SE52?=
 =?utf-8?B?L29wTldNeWRXS3FORUtXRXhwc0lVTWlTeXhTL0Q3UGpDNHJLQmx2ZFRKNzZq?=
 =?utf-8?B?U2V3VjJuZURObzJ0Y2ZQUVpLanlWR25NbzFReGhNK2NsU2MxNysrRXhPeHdD?=
 =?utf-8?B?RXY0aW1tOEVSeUpPZ2xLSlFmSFk5VDNWSVBUcDV2OHNrc0laVnhOend5M2w3?=
 =?utf-8?B?ZGF0ajRidUR5REpheFlaNmExN0FVZzlOMmV5aW1jSS9vV1dDMHBlZmIvYTho?=
 =?utf-8?B?R3p5aUpWeDhyTTg5Q3I2SWhtakcwaWFaOEtFc0NSTCtkWnZPQmtHVU1mcVFt?=
 =?utf-8?B?VCtESWJ2Z0FjNktVTElwSjl4LzlreUloQ0pvYUVtS0ZtZFphSG5ZcGU2djB1?=
 =?utf-8?B?TmVOVEdJa3o2UjY0S2wrcE1ib0ZIeU9QSmJxYnMrekd2aE9MQUJnTlhSdStL?=
 =?utf-8?B?cVE9PQ==?=
X-OriginatorOrg: sancloud.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 101885bd-33af-4802-3759-08daa15cc3b0
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 14:21:41.9765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 840be37c-244a-450e-9bcc-2064862de1f4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 bLzzZkTdeAtD/Q2TbN10ZsWG4+jFFLffjThRb/Ls3XLZZI8RNnQ+Gx+MUWxxkjYZpSdSZixmETOVcamgNxwbAg4k8mYdS4xRdxTXyCWGrvE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP123MB2868
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 28 Sep 2022 14:21:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15101

--------------mwOzb0crpNjnjW6jzO9jjDFc
Content-Type: multipart/mixed; boundary="------------95KaVHUi8l7qP9eNuB7MJ1B3";
 protected-headers="v1"
From: Paul Barker <paul.barker@sancloud.com>
To: Andrew Davis <afd@ti.com>, meta-ti@lists.yoctoproject.org,
 Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
Message-ID: <b3b49652-0d17-9819-5cf5-f1c7cc280701@sancloud.com>
Subject: Re: [meta-ti] Build failure for beaglebone on kirkstone branch
References: <0ba3f29c-3e37-ab9d-93e1-82e9da6ccc9a@sancloud.com>
 <f991b40b-d8be-ed31-ec49-43931f3fc338@ti.com>
In-Reply-To: <f991b40b-d8be-ed31-ec49-43931f3fc338@ti.com>

--------------95KaVHUi8l7qP9eNuB7MJ1B3
Content-Type: multipart/mixed; boundary="------------YwIEEnpZWzdMtHqxk46mwVq6"

--------------YwIEEnpZWzdMtHqxk46mwVq6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On 27/09/2022 18:53, Andrew Davis wrote:
> On 9/27/22 12:01 PM, Paul Barker wrote:
>> Hi folks,
>>
>> I'm trying to add support for the Yocto Project kirkstone release to o=
ur
>> meta-sancloud BSP layer and I'm facing a build issue. I've reproduced =
the
>> issue using just the meta-ti layer and its dependencies, targeting the=

>> beaglebone machine. I've used the kirkstone-next branch of meta-ti as
>> the kirkstone branch has not been updated in 5 months and has the same=

>> issue.
>>
>> The build fails due to a lack of buildable providers for virtual/libgl=
=2E
>> Is this a known issue?
>>
>=20
>=20
> I've run into this before, Cairo package pulls in desktop OpenGL when
> GLES2 would be more appropriate. I'll look for the exact fix but
> you can try putting this in your distro .conf file:
>=20
> PACKAGECONFIG_remove_pn-cairo =3D "opengl"
> PACKAGECONFIG_append_pn-cairo =3D " egl"
> PACKAGECONFIG_append_pn-cairo =3D " glesv2"

If these settings are required they should be applied by default (perhaps=
 via a
MACHINE_FEATURE). I would expect the beaglebone machine to build
"out-of-the-box" with the poky distro. If that really isn't possible then=

necessary settings should be documented in the readme file for the layer,=
 added
to a local.conf.sample file or applied via a setup script.

Thanks,

--=20
Paul Barker
Principal Software Engineer
SanCloud Ltd

e: paul.barker@sancloud.com
w: https://sancloud.com/
--------------YwIEEnpZWzdMtHqxk46mwVq6
Content-Type: application/pgp-keys; name="OpenPGP_0xA67255DFCCE62ECD.asc"
Content-Disposition: attachment; filename="OpenPGP_0xA67255DFCCE62ECD.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBGCyYogBEADoyTDRt8FP0wNMj4uFpD1PhFmg3Bk6fphfTBXte9YRwP3q+XMD
bAZuEHLxCIseSKPHFPmnt09mSm5QUV6YBnicqpCGtsYl/vvjoQc090aybJKB4G9g
dRxXuTXw2eRCItNDnr7+TPlC/fHC+tRmrlOEkAo2X2cWKPQgV8U4wjp2xjudGg8B
2mlq+0gUbQoPYXQ3wBeycGG+9BFF6DsRQF+mk82CBMDFU/7/bW0zkH1sM+dZRUo0
q8uhNSrszXWqrSho+ASWAmJPBd4OCBIsb4HdKnIQ70JWQJc9Alv6PbVmBgR/hy1P
zEnXTbZww+hjoFhZyjnqebvYRt2JRVVeH99Ah85K+hiDt4cVZe+JbAuKf3nOjpeM
BWNZTIpZ9fOQ0v+7AsU8tNKEOxhgqYg3Bjc0s1Uyz1/swBUCMX5QtDYwu8aCajFT
NyqXmPqMfyyiE9xi2U/YI1nU2ZAQnBHkki6JvsVf4BJpacLpcFdPSPYvKQRoPpUg
wM/PuMbXP74ynyZ0fmoi+1i3GGzgNhCh+3Xeh581KAPaAKrRDCv11UkyRK28412C
81C9aGxb5JFvlbAO0dkQH+l/HV+Y4mDUIDkz8U3NgiB2X03vKTkqUVBzzN2eBp2Q
Qs6KBNoaU/0j1+O8Ch05ZzwipNGHME/QetccgqIdwX59PtIJTu+Y55eZ5wARAQAB
zSZQYXVsIEJhcmtlciA8cGF1bC5iYXJrZXJAc2FuY2xvdWQuY29tPsLBlAQTAQgA
PhYhBNLd/a4wAXr0y2KqlqZyVd/M5i7NBQJgsmXIAhsBBQkDwmcABQsJCAcCBhUK
CQgLAgQWAgMBAh4BAheAAAoJEKZyVd/M5i7NUtIQAJuhVQHLOchPYGop2NmHTdV+
xpEb40+UagAohD03CUtSvWoJ6Wk+Q3awJxDOD4k4fpwphsEjmyJJxpHtS3WWHP9J
yXGERdIJM4N2l0Dz7C6MwMhaQSMmccwQnBmSBYUCdFgjfB9j9ftMTxYyIXtTnZ+p
3WUG1ulwdgughhZMK06AMM+d+throF37DoLK0EMd+TxuHy9L8T9Lg/zNY6Tn32EH
z0Tv1u7dXw4f0Jgy4uD/JCavJVc/dqKub8JpVuabyzf4m19doByE9Wnaa0I7iJUb
U6m9LVA6q/1V9GJt2AIKu/3YoBlqEEA6O+4MHGnrnMOq6QiWPygTWR0Xl204Scej
x5JSNoKeoF2UjgDUoi++g4QBxWiY5F6gPK1tKeCeNmgPjyDKgEbuN3Wqbk+FaZWh
kR6b6sfTGYMOAVeFACAwbhnaSBmnViVnvSvIYiLcC0akjL7N1vrhYzg21pqCPa0z
lgWJ+G+3QMAd0j4Gsc0TW3u33vs7q4thisQtCk6w8HF3NziVVsRHcSKvSWWx+fq9
QyyvDgt2fr4snHARYxTCigWAYs4x92zSaNxlr98Rqq6YOaOD+tQkv6DR4r6xYUfD
uSlEySFsPvLT4fmGtZZEMNGM+6jyxQM5RV3Ry/u1kMJxEFyKQ3SPpaPAlKzWtT8u
gKkg+n/8z/yrm3RuWGdmzR5QYXVsIEJhcmtlciA8cGF1bEBwYmFya2VyLmRldj7C
wZcEEwEIAEECGwEFCQPCZwAFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AWIQTS3f2u
MAF69MtiqpamclXfzOYuzQUCYLJl6gIZAQAKCRCmclXfzOYuzRHkD/0aETfOQ0XK
LneuqCMIroLBL/CRWirnLIiPuGzNjRJFufN2tZsJB29uwCC0vlxCvlkWeJv5K3cE
YVsf+3AFK7yMn2KqgWTB8l7PpOUv4mUevmNcszlpQ1Q2RowopAZXdEzsKOn5jt18
pLJxb4B9lw58B55x94e5WLhICCfpUgOmwds0OrqpGlucIwd3pJ9HogdIj1lPLLjY
3olKPTa2NVex/1ee2EzTwECvDpMtre6AAlcCRpUuPpdnMbrbFlbsqLNnf5f9Hj3h
3Y+5L698VPIzHTHA+RukS+io+3OOkNKo6qngaEkWV+6CcdM048gBQ7ATq51eXOCp
FTdxUPQZQOV3wBUE6n0omCCLTIvzggtCMjA0f4maR0YxSllVaM3H1pD0zGiSRyKH
Mae1rKFeCqryPQxth2Ma5wZtU8a6Lq+RPG2EJ7l/GVHhFOUh0pDriNc9IWH1wzIy
jE2ef/UwOCwEu+2cxMdu8GRWXIjceG5QIfOGJErbLK2uFA0FZBj5L/PnrZKzzImo
u2Oue4rIOL153n0LP937197E+pVKerbV0lifi7Shl2htBhHkU349cSYhHy8Kk9+B
lJH6AHXnLVtEdvjApZh2NOkJzzNupzM2JIS9Rgw1KRghsAUMFtEiVx9JSU+euka3
2dMbQ9NVDbKhqc1UMlXihdIRQArM9zDrO8LBdgQwAQgAIBYhBNLd/a4wAXr0y2Kq
lqZyVd/M5i7NBQJgu+FTAh0gAAoJEKZyVd/M5i7Ntd4QAOPRoUM4dt/leU9PIfBW
nAuKpHbXEouOHkwHhnHIdQf/I9N1CRbfXx2anSX5kBrHCg0ldf9iKmDkNY9Yz4wG
BYba3+vKlzW0J9Na0ffhNS1duN7oswBw1Egt/3sZMX8eRSjQz6CZ38T5/xBI8gxT
At0AbniX8vtGTFPjKvNrMiOEBXNQGFDELdhYddV+DJm2x0GMy88KU9Kd8N71HfoP
/4i1ulsBAb21dSUE6vWbWKqAlWebppQIUYuF+U/3Kd10EczmK/kczQh5iUuPFj/f
za+gM4x6XKWWWZboSH8pu2i2Dri/3T6M9rgFrboQDpkGXJxeNPVrIvljmAgN3Ek8
2yyWZwdyjFfqMp3h9bwTt+imEDbwTzrIfyqCj5RI658UbmM/lywT0+0usCHuxtwt
h5LeukLf1FEgWp6dtUU4SRSo95EirxZK/eoPdhOLhIykq8DFr58qOGzT7b8ukoRT
dZkHH4IbAq5PFrsBBQGvF3S5MmvgpWlfYqmWZ/pPTqEX7734VCsg50fxzqcOEhAk
7B5BrlOcoZFIYUQomvX2POBnesh+KoIz4mr6/cBpDIF4FSqlLzctsn11cnNO2iml
5QcYvcn4Z8bA13Gkeg1kGQrPLnyhI08FiJ6Fvr9e4R7uuGyjan4foYrPBlWKQ4Cq
rQb5V9/4OnKDpRvnLks5t6tkzRhwYXVsLmJhcmtlckBzYW5jbG91ZC5jb23CwXYE
MAEIACAWIQTS3f2uMAF69MtiqpamclXfzOYuzQUCYLJluQIdIAAKCRCmclXfzOYu
zZjdD/9uF00PZAkRKpRQ2f2SA9aJYGBnXK+UHXy2t6O7PodbmKfpk6Z212xNM5o3
X7ROBe2n0LIA0M6iUn70Y46gJP0pL8rwOqwDrnVnBl1X6DzrJapyQF1IAplB225A
09oDt4QF3Y9kaPgkdccsl/Ri1YOl5cVvrsOsFgECvDDH0KpgxA1gWXeM/WEOkUV7
Fm3MWDwSAqtfjOlsWFhK36s2e05pU4oaYEHawWenT6VPaM+U95q9EwvKtM1I+ccD
t+tD2pqhbT+roRP0xmTbyaAZzqQVWRw1mYjnCDzpkChqYdDBsiBGV8UpTlpGG5zn
Kh42oBQtkFO/niE5033WYuRLPX5oUTWrW/1EZ4q+J3psQzZPYJGjigY0aAlRa4Ro
/16CaENsZY0y3xvQ9/ipcbkePQZEVcNOU+0nVacbhbIjezp58eM1+BzxYQb326ps
ZmhEY7UChPg+3O7Kal1HBHchU2O0uVMlWTBML3y/tKg+blN1ycI4aM7IGmpRqvjw
Vz57pKae7MPFAKMMZjKdiyqk3o2aWdJCdP6ne/HT38TMo2p5rkH6ggTlXyv9x1hw
0E91REzAopHenLAbq9ZlgbF+wpueIjAc0ITdfAHGBV6j9cMl+x2CzAJJDSW2wlHx
EK/vho289fFyOMUgmdjjI3VnU/sQQF8mXNddWnEWpeCCOjYVUsLBlAQTAQgAPhYh
BNLd/a4wAXr0y2KqlqZyVd/M5i7NBQJgsmV/AhsBBQkDwmcABQsJCAcCBhUKCQgL
AgQWAgMBAh4BAheAAAoJEKZyVd/M5i7NCvoQAMQHiiQxcQOuGm9Cj39LjlF+f7Ip
v7jqv00bknS2VCLFDhgpaGNNKzctboTueDNMLE8jqZaHI2thcFbzDLq3dPxS/cdr
3aOeoujVsUQFnTGJ0+A3KwNMFdCCm6LMeqh6b9/F3UTjB+6KGFlMXZctn+sHBgBX
uFrOhHmvNCOCdndNKGbfv6yKRR/p3vtDn872+/ihVN6F2Kc36/V0TLXK7ikaysIt
PuEXwuaJXCkTFopC7eYC27fBwrtXhGnjAm0V/1SMj5F5+wj86qQnhqkcbXFA6tOQ
JGqrWrlKr3xZor3tWFNjCgTH7RNVsr0lMhhJ/FYkd2Ja9STbnXezKMsH4xPbeOem
vHPO6CJZHJVC0GMjMcpCLPZIo6nUoN/IEl8IyQb5p2VQm9bXCdyxKLTKL39LxR53
vFwVp/XnpOLOxHYMd3pBbZY26cLgX7l33QlBwLL09Q1kjEf4DUx/lliuaXZuKMz+
OVgIaKcclkCXnqI9ygsB1www0bBGjEWxVBcOyFkHHymhOvVj/dgWkuMzQtZjN/Xl
XyeDZNlPgDpllnt9QR0ifAZ5QwMnviKy0Q/tNeHr+CqmrU8hdXgURF23QCOEsB3U
KASNJ8Vq8owgUDKArZDGss/Pxmxx5RNVWX53V84fsxAu690PNMlrpvoxiYlwurhc
U4aiJWYKxHo7UHvlzjgEYLJmMRIKKwYBBAGXVQEFAQEHQCBkfWTRrnDtxJyb7zN7
P0AOUm8k7i/DtpAOuSG9QURHAwEIB8LBdgQYAQgAIBYhBNLd/a4wAXr0y2KqlqZy
Vd/M5i7NBQJgsmYxAhsMAAoJEKZyVd/M5i7NGlMQAJF1hu/JDYR1qs3vAzQL7Isw
uR0SltuRztwoEaIrzwiJ67N4bEAw2y9/qeQ2Sj4OWcUsobilTcTDbzxev3LdYC1W
JSe/iGFq96bIa+IHtJPEajH5vrBuWS7aFMR3OamufI6M5W8AiW6mfs3l42Ul6R+A
xDWl6y39PpuIN2Dw8lqETZc2dDEGkQdV7xzm+8XdoqtzTXSmFJm6yKpLpgGl86rI
deTgW3r6I5V3X8SYZdMUqm4yXR6DkFsxUE+311LO7s8riDr6wmwxnbaMNkuEXr15
VquoX9NMPKbYycFH27Njc1aOjDUyx5S77UJFlfGRcgwbIO8Shmn33R9T3KNXB50Q
dbfGd+4RH9kt9fCMrWokGv1fk37mo3zzsCnqHr00npHfRqeY+reJy11hBtKobZ28
/jT443Om+oZV2/8RuWKOCiP78HuJFVDkd5ef15b7pKQzfjqpUQ/kthTVL4xT58j4
rFw7CYpNplnzcfpNXClo3CR0mlKd3enlJXyE9+kyosYEsdDIFt6xIKGRwQd7cTXg
CkX3PZYmZFvqjhkPHtws58MuqdPNZFUfdpSprArTiLB8gvzvxF2ClVUfgBz14cJd
o4Yoq8zF503M3rT+jvbSXGDUGeJmiUfhJUe2Us+yRGekcohPBgcHVy1Tk3MKK8BL
107a7zFu8hEKwoUBCK3UzjMEYLJmRhYJKwYBBAHaRw8BAQdAxbVPmyT8k4mQRc3N
RzbbqM5JjRC4qjfWMdf0RJCjdEjCwe0EGAEIACAWIQTS3f2uMAF69MtiqpamclXf
zOYuzQUCYLJmRgIbAgCBCRCmclXfzOYuzXYgBBkWCAAdFiEEu5u609fgpLWN2BtT
2DdyHxL6G+oFAmCyZkYACgkQ2DdyHxL6G+rEcAEAq0hbgvDf5ncmKG/xvg6n+KMp
nSengVLgzyxqTy7LJ0kA/1r3CJy9Hrym+zSu9bCREpZfVrwlqs7To6pKoejxdegO
Nt0P/iF9Mu1KCP+WIGANjlQekDzAj7zwGxyyQqgNG6ku+BbgvlpymgNuZtspDv7q
E1Y90dwAqt16TAtNVFLwi6sw5/prf/4Bmfj7fKzR5MNdQEB/FJnRI85s4PkHpSTb
Q+oRsMFMFsLTlYb0QxGPNYm07chJFJxnn5Ra+XSxRMePIgFNz+RptvP7w2G6tVWa
oWPxT58c/KmI83FXUP5pIbtUSrlPfA2NLNNL9Hd+OzBsxcq8MJrs9DPTp18kPLKa
wA57OGQlQACRNBCVyLBkVksnLTBGnoTPkzzkghaOxK8SjWe/66YFm/D7/7SW54ll
uy4XF5o+/hiIZpjCN51Vs4oi348xQ02G1ck5ceDUKR8cvTBlqesijtYQgzSwTh4/
rOpTDf8tri+pdzro1WK6ASZ+27y4HRNOghWQGvCfrNJzjoOOus0wrYIkHi0eldek
c6pqx7s71jTg55hDDVNAXCJfb8DwK/+N6smFaxY8ZNcjnXsTvrPtUsQCNC9d0g/Q
DIUnSYZ4sDfIuwLiAqbjltWbLnqw8Aj+3/VNbeS7eXCnqZU5oA3fBr90jTYNChAr
1vz9G+WAwWtIJBRLdimjLZUVXShexRGcNDrvWgei5C+WfdDVnZQs38lg1BTpxQs/
4FRznBpU+D1I8+Mrw+QHR8vLPB2LQT+aKMI0pZc+mjrT9AYk
=3DsH2a
-----END PGP PUBLIC KEY BLOCK-----

--------------YwIEEnpZWzdMtHqxk46mwVq6--

--------------95KaVHUi8l7qP9eNuB7MJ1B3--

--------------mwOzb0crpNjnjW6jzO9jjDFc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS7m7rT1+CktY3YG1PYN3IfEvob6gUCYzRYdgUDAAAAAAAKCRDYN3IfEvob6ut6
AQCcE2m22xvc/zVqNZZgm20r4ALmJ1UX21c22EakmNRn1gEAkrHBqgK09C1/oTgGNd6bu3u2iNfW
Jzc5N2RUvsT2pAU=
=OHHd
-----END PGP SIGNATURE-----

--------------mwOzb0crpNjnjW6jzO9jjDFc--

