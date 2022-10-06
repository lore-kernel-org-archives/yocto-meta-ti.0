Return-Path: <paul.barker@sancloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6A90C433FE
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 10:04:37 +0000 (UTC)
Received: from GBR01-CWL-obe.outbound.protection.outlook.com
 (GBR01-CWL-obe.outbound.protection.outlook.com [40.107.11.130])
 by mx.groups.io with SMTP id smtpd.web10.3996.1665050674484176027
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Oct 2022 03:04:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sancloud.onmicrosoft.com
 header.s=selector2-sancloud-onmicrosoft-com header.b=lC/m/IN9;
 spf=pass (domain: sancloud.com, ip: 40.107.11.130,
 mailfrom: paul.barker@sancloud.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=asG8mhp1qZ9/BFb15Q5PtFVfajpqHRWeZQ9X3aTGphWCq61yZdnJRgnHSJ591M5KupfRYIprUzagPSIpoxn+xWh61mSJIYjDs2AvKiivjJVZJ65vuM6wF8GcEyfncz4aMQswYQmaSaKq6RdMRBFwCgjDWjzJ3NGvXE9h5ily/YML0ZhGJw6CmRkbeiEmYmr3BL7mZ/xuqqTGIKy6/2OnCQ+DVltH2LQMSC3jVZ5leCwNpBgDpQm8CAJLQjG3JZFcQRFfI7YbKWTF12jpoBLcnf7/E7RsBi18k0ZDW7tu6VTYV84wTpkZw6lnCwMNuT+hswkJ6KUJ90csO66XYKsHvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aj91ldyw/diC+YDsFlwssU0R2YzureUtTVkpMYINnos=;
 b=hDaRCxbiiqqMG8Z7o6p+q97L8nC/HFBp3/wmb/nrW2dFIcb+wcITjE/fgT5lpWvD+ajWSYcGai6KqMIrvRmDXb2zX0x9wy6C5XFSMl81+RTeJgI8IYrnzK0YLmXxatFrmbYny8MJNSPqiY7PLcV8576Drh7JB1A7izLgn+p/CvxZPrcrlSueDBbELlqPZKgIbqlMY9LFbu0uBBnjHgJrJyPWmGjlN7lNLPyG6+n5URBO/UeW64z2X9xqlEyuxWZ0s3M7QDwBaNAQmo0OZHD0NBANxqKa5D428r1mTD7oaFNEykjmMA8RkiEDPynO+z2TDWqV9IwDoTTXQog0+Krv+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sancloud.com; dmarc=pass action=none header.from=sancloud.com;
 dkim=pass header.d=sancloud.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sancloud.onmicrosoft.com; s=selector2-sancloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aj91ldyw/diC+YDsFlwssU0R2YzureUtTVkpMYINnos=;
 b=lC/m/IN9iMUCnQkWz3vAzJQegZFJuL183zGQg+C3QXDJwHf3l9ffCV58FB4B6AF48hhGI0YUNu6CoEAg/hUtItBAobwMBckXfxOyTE2jxj8NihaeO5WhwibId1KD+01EvqPaXNE/BDyfAmwge6OtzaNInsyay4ivGfUDKkAS53E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sancloud.com;
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:61::19)
 by CWLP123MB3346.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:6d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.34; Thu, 6 Oct
 2022 10:04:31 +0000
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::11d5:40af:9060:6b08]) by CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::11d5:40af:9060:6b08%6]) with mapi id 15.20.5676.036; Thu, 6 Oct 2022
 10:04:31 +0000
Message-ID: <74d40ad2-f2f4-061a-f49b-6311e52498ed@sancloud.com>
Date: Thu, 6 Oct 2022 11:04:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
To: Andrew Davis <afd@ti.com>, meta-ti@lists.yoctoproject.org,
 Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
References: <0ba3f29c-3e37-ab9d-93e1-82e9da6ccc9a@sancloud.com>
 <f991b40b-d8be-ed31-ec49-43931f3fc338@ti.com>
 <17190C28A5DB5EE8.9603@lists.yoctoproject.org>
 <73652b02-aef1-0dfe-b1a7-d53acb284484@sancloud.com>
 <885b0468-d6ce-51ec-b614-620c7cba9fcb@ti.com>
From: Paul Barker <paul.barker@sancloud.com>
Subject: Re: [meta-ti] Build failure for beaglebone on kirkstone branch
In-Reply-To: <885b0468-d6ce-51ec-b614-620c7cba9fcb@ti.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RU3Wl2Jyked31llkK7uuhuKY"
X-ClientProxiedBy: LO4P265CA0141.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::11) To CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:61::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB2241:EE_|CWLP123MB3346:EE_
X-MS-Office365-Filtering-Correlation-Id: a88b3de1-a2aa-4744-a85e-08daa7822961
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2cUEqxfScvOPUx6NHMcPqyyAHsjoaHhoP4bMg446ijalvwicn8y4IpIxQJerJmLQEYuiOCVwTFXJHwzT5JdynYiYvV8gLlJqOCwpSAmmwKop9mnVbVH7l4pCVmC6tACaIerpHptSkzQxfqXO5vOeqbUQB1gLNjvObX11VL4RCohXHDraqW55wH3xazcmzp/BVjTlXOnZNTn098KXQXNe+suZn9k1F1zwaKNgik4TIt7K8sYYQ894JUOsULV+lAsVm3kPkkWxQFsz/gi25BnlJSktXyHHr9CkjkuaC6040Wd5O/MrYe1W0mR4uPfImNvZoEOUncemZy4XR0ahLWWon66PgYnhUsKHsuCDMmuvCalZnijDFNeDKUpnkxBa2Apf0H/xNnM/EEMHc9RnUu7c1L5sWhF+3ZP1JbS/T/N9v4W/wjnmW1elGAtWtGe5HzHobHjLcJmc3RKKe9VECRNCLkB19a0nG2Fk3E0AC1T1sLaRQ05dBVYkIBc3hQnUZDDVXwRmPZ13uSqC9bxQQZHoIAEHM9V2oP9Jh9TF88aEjdpuhCgjH2uj+JkPOd/89MwFXLP+zegoQp+/ZcyRb3WlxFVBYgZsS+/9e8BZ4zi4utN3thD4MywD5e1JSpb1lKas5AGjmbVisaecCA7IFziXVb7lkY0oSQVUkozLMk5ZDNHNvWUMc4lWUQ2jSvMpXCgAS0lx1kA7q5RpCLjbBUtdtTg5ZJZWuuxtMDabNT/JrcOJO3NgvprEwccji8mndzHrC6QhpJ5Aq0kEjq2OTkKUjGflfuWpuHgxFUBekpHhl0UwsUhxn1ZC0KshaQQZtGZAYxFRW1X8YbnySCqxEh+6quhdwH5p39Iq2wPWTyX8GFIvzj4UAZMOgzJ1GGaFWa/+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(136003)(39830400003)(376002)(396003)(346002)(366004)(451199015)(31686004)(66899015)(52116002)(8676002)(66556008)(66476007)(44832011)(2906002)(38100700002)(38350700002)(41300700001)(6486002)(966005)(478600001)(316002)(110136005)(235185007)(5660300002)(36756003)(8936002)(21480400003)(31696002)(33964004)(53546011)(186003)(86362001)(2616005)(83380400001)(66946007)(6512007)(26005)(6506007)(175373001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QTVkOWx4MUR2MnkvNFNGSXZ5VnNWOTEzdldCYUE0djF0YTBtUHk1TkxjOTZB?=
 =?utf-8?B?MTBLc3hlWU4xMUtsWTRDZklGZ01Qd0w5aVZOU2tGZ2RGL3h4SkJ5cUIwcjFz?=
 =?utf-8?B?cWc2ZmpDUXNBaFBsUWZ5dXhSbWRjdkVFd28vN0JQU1pETTlObVJkNEJLV29a?=
 =?utf-8?B?MWVlV3NjSUN3ZWtFWVowUDJwWHI2ekJQLy9RNmRCUzcxZVlPWDh2cjB6MkZK?=
 =?utf-8?B?YlU5Z0w4M2g5ZUJlVzUyREZtV2tub2JCWnh3SFJuTjFsa1R5MzlXb3FQQjJV?=
 =?utf-8?B?N3hQbWo5ejN4ckgvdTJuRVFNVURjKzEvV2xqdGwwTDBsZGFyMXgwNTRkYVBR?=
 =?utf-8?B?d2wydGQ1WmVFMnNnelkvczBtb0kvMVFSSEJRdjc4dWFvby9kWUxIdjV4R0RG?=
 =?utf-8?B?TXZtWmRNWWNGdkJoLzM1TWh4U1haS215ZThVTTNxTk1DaXBEZnJCTGRKV3F5?=
 =?utf-8?B?U0xIRVdYbWRUM2tIazVrd0p1b2UyNWdCU0VJMnd3OUxwQjd2ZEU5U21QTnZI?=
 =?utf-8?B?eUQ0UEZRV1dqcVdUc0xFbFVoeGExN0RSSXJnQm82V2poemgyZTRxRWYyUkxG?=
 =?utf-8?B?TzI3VDFHTTFlZVovU3FTdGdtZWNlRTYxdmRLd3Z4KzEyemMyOEtRN3d0bWhZ?=
 =?utf-8?B?eHMvemFXLzBQTys4NzVmT09TQ3pvVmgzdW1zQ1hCWktkdnNQNHBHb0EzYUgx?=
 =?utf-8?B?WVk5NEVNTFlwTURkWW9JZEdnbmhRQ2NObHZpd0w1RC95ZklsYnhNSXJINjlF?=
 =?utf-8?B?cGRzN2dkMGZYOUR1K1NyTDRPQmN6ZHk2cGdmTEIyUmpibW9hVVA5MkpzcU1R?=
 =?utf-8?B?eVRsQmk3Z3g0M3pCTURSQ3BuUEtXYWkwQm5uQUVGOW14aDY3cEtJQjZBN2dO?=
 =?utf-8?B?UVl2eGxnaFo1M0NRb21lM3J2ejRhRy9XWVZ1Vk4ydDNBV1phZm91WCtQcEN0?=
 =?utf-8?B?L0FrK1F6MmRwcVVldDZwY3h4T2w0VXZudWxRSUUvMTV0Mk5hTENkeEtaczVs?=
 =?utf-8?B?eUxSbnJVaGY5WEtlSkVIb1FoaHNEOVBYVUtwcUdEL2lOSHZ6M2hGOTNqSHBu?=
 =?utf-8?B?TnR4azQ0U0QyQXdGMUROaWkxUGhjSmtzclpVUk8vNGI4RnNoNXRGazJveFpy?=
 =?utf-8?B?eGVST2plYzRSbUh5emFMT2JqVEd5bERMUVN1TUgwdzJYNzdQRzNJQkNySWtq?=
 =?utf-8?B?SncxK1FkejNyTDRvRTVSK0w2VVlYYUdvTnRPWUYrUmg0elNYZWF3c3FFTWps?=
 =?utf-8?B?cHJLQ0wyMGkyVXFaV0t5aFF6WGJzQjRJM0VqU29OeVZIVUtzR1FtL1Z1Vm8r?=
 =?utf-8?B?di9wRy9iY2pzZWw4TlBjcHV4MzJYbU1tM1VucWlCVnVJUFc3V2Z2aDJ3QlE0?=
 =?utf-8?B?dEFPM3ZzbExOV3RaSklZdGxQSzJiU3ZmOTlxOFhWOTFXam03aGZkM3B2czNv?=
 =?utf-8?B?dGlCWk0xVkg5cjBZZm01N3k2ZHUrZzBDWGVJcFlNc2tlM3NLWldFbThxRXBl?=
 =?utf-8?B?R2FDSGZKUnZUT25wOW9mL3NBT1MvNlhoMkQvVTdBc0hLNUlRcHoyRGp4SjNx?=
 =?utf-8?B?bytWeGlUdVJXaE5NR2RTR2o0QytBUXdGNXpDTUtkanpCOHFpOWw5Z1NRYXVK?=
 =?utf-8?B?UEovT0RLcktmRWpCZnI5dk5KRC9nd1IxckVIV21Tb2lGNmREWnZBYkdXemtv?=
 =?utf-8?B?RTc5OUNkS2RoZlkwbXB6bjhrQi9NOEtaQS8xYjAvd1phYWhXd3RiRDdVM1pT?=
 =?utf-8?B?bE1wcTNjWlg5KzhpVy9Tc3poWGNoVmlzUlVNSHEyNWFiSHdqSE9IdGQwbHNP?=
 =?utf-8?B?d1hyQkQwdi9nSXl4R1c5Mi9lOThzU1pXcGdGbU0vdGcyVE5wSy9pQTgxWFlZ?=
 =?utf-8?B?WThXWlVUNXNaWTZHYjB5R2RzS05aN2pXWTFOL3dlaHRCUmVRVlZERGtwTlRP?=
 =?utf-8?B?MzZEM0dWZkpDc0NVRnBsanRUTEkvUjVBVEN1cDE3UTVDVVY2S0dXdWVjckNV?=
 =?utf-8?B?Snh6QjhCVk9jNmFBOFZ4MVpES0ZCUzlVOXo5VjNoZFpQeFEyMWJ5MGw1eTY4?=
 =?utf-8?B?S2d1RXE2am5GMm5qZmYwTXBvWDFjNHJ4bkR0b01NQmRhWHZ4MkhlaFUzY3o4?=
 =?utf-8?B?TkZZcDFSUE1jTHFxdlFxU3dMYkNtSnBaQ21BMWhoaUVUUklRQW5vZkdldDBk?=
 =?utf-8?B?ZEE9PQ==?=
X-OriginatorOrg: sancloud.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a88b3de1-a2aa-4744-a85e-08daa7822961
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 10:04:30.9293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 840be37c-244a-450e-9bcc-2064862de1f4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 99MYhdVFVuEovmpQptkNt7rT2ZI0XjfBYDZvsdYVFlPIzfFK0vH+igo7nmehYEcQdHuOVaBghfn9qB6gwGpsBgxHzd+6DULetsDvdqWQuGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP123MB3346
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 06 Oct 2022 10:04:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15114

--------------RU3Wl2Jyked31llkK7uuhuKY
Content-Type: multipart/mixed; boundary="------------qsGv4fz3rck27e2FvVfS0kMA";
 protected-headers="v1"
From: Paul Barker <paul.barker@sancloud.com>
To: Andrew Davis <afd@ti.com>, meta-ti@lists.yoctoproject.org,
 Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
Message-ID: <74d40ad2-f2f4-061a-f49b-6311e52498ed@sancloud.com>
Subject: Re: [meta-ti] Build failure for beaglebone on kirkstone branch
References: <0ba3f29c-3e37-ab9d-93e1-82e9da6ccc9a@sancloud.com>
 <f991b40b-d8be-ed31-ec49-43931f3fc338@ti.com>
 <17190C28A5DB5EE8.9603@lists.yoctoproject.org>
 <73652b02-aef1-0dfe-b1a7-d53acb284484@sancloud.com>
 <885b0468-d6ce-51ec-b614-620c7cba9fcb@ti.com>
In-Reply-To: <885b0468-d6ce-51ec-b614-620c7cba9fcb@ti.com>

--------------qsGv4fz3rck27e2FvVfS0kMA
Content-Type: multipart/mixed; boundary="------------i9LIuH050cKPGkAuvE922yvz"

--------------i9LIuH050cKPGkAuvE922yvz
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 05/10/2022 17:23, Andrew Davis wrote:
> On 10/5/22 7:47 AM, Paul Barker wrote:
>> On 28/09/2022 15:21, Paul Barker wrote:
>>> Hi Andrew,
>>>
>>> On 27/09/2022 18:53, Andrew Davis wrote:
>>>> On 9/27/22 12:01 PM, Paul Barker wrote:
>>>>> Hi folks,
>>>>>
>>>>> I'm trying to add support for the Yocto Project kirkstone release t=
o our
>>>>> meta-sancloud BSP layer and I'm facing a build issue. I've reproduc=
ed the
>>>>> issue using just the meta-ti layer and its dependencies, targeting =
the
>>>>> beaglebone machine. I've used the kirkstone-next branch of meta-ti =
as
>>>>> the kirkstone branch has not been updated in 5 months and has the s=
ame
>>>>> issue.
>>>>>
>>>>> The build fails due to a lack of buildable providers for virtual/li=
bgl.
>>>>> Is this a known issue?
>>>>>
>>>>
>>>>
>>>> I've run into this before, Cairo package pulls in desktop OpenGL whe=
n
>>>> GLES2 would be more appropriate. I'll look for the exact fix but
>>>> you can try putting this in your distro .conf file:
>>>>
>>>> PACKAGECONFIG_remove_pn-cairo =3D "opengl"
>>>> PACKAGECONFIG_append_pn-cairo =3D " egl"
>>>> PACKAGECONFIG_append_pn-cairo =3D " glesv2"
>>>
>>> If these settings are required they should be applied by default (per=
haps via a
>>> MACHINE_FEATURE). I would expect the beaglebone machine to build
>>> "out-of-the-box" with the poky distro. If that really isn't possible =
then
>>> necessary settings should be documented in the readme file for the la=
yer, added
>>> to a local.conf.sample file or applied via a setup script.
>>>
>>> Thanks
>> Looking at this again today, I attempted to try the above PACKAGECONFI=
G changes
>> however they do not match the correct override syntax for kirkstone. T=
hat
>> suggests to me that they haven't been tested.
>>
>=20
> They have not been tested on Kirkstone. These are the changes I needed =
for
> Dunfell, I'd guess fixing the override syntax and trying the same on
> Kirkstone will help your issue, but no guarantees.
>=20
>> Please also note that this is not specificly an issue with the cairo
>> configuration, attempting to build core-image-x11 & core-image-weston =
also fail.
>> For example, for core-image-x11 the errors are as follows, re-tested t=
oday with
>> the current HEAD of the kirkstone branch (2b11afa8aa19):
>>
>> ERROR: Nothing PROVIDES 'virtual/libgl' (but /workdir/poky/meta/recipe=
s-graphics/xorg-xserver/xserver-xorg_21.1.4.bb, /workdir/poky/meta/recipe=
s-graphics/libepoxy/libepoxy_1.5.9.bb, /workdir/poky/meta/recipes-graphic=
s/cairo/cairo_1.16.0.bb DEPENDS on or otherwise requires it)
>> mesa-gl PROVIDES virtual/libgl but was skipped: PREFERRED_PROVIDER_vir=
tual/libgl set to mesa, not mesa-gl
>> mesa PROVIDES virtual/libgl but was skipped: PREFERRED_PROVIDER_virtua=
l/libgles1 set to ti-sgx-ddk-um, not mesa
>> NOTE: Runtime target 'xserver-xorg' is unbuildable, removing...
>> Missing or unbuildable dependency chain was: ['xserver-xorg', 'virtual=
/libgl']
>> NOTE: Runtime target 'packagegroup-core-x11-xserver' is unbuildable, r=
emoving...
>> Missing or unbuildable dependency chain was: ['packagegroup-core-x11-x=
server', 'xserver-xorg', 'virtual/libgl']
>> NOTE: Runtime target 'packagegroup-core-x11-base' is unbuildable, remo=
ving...
>> Missing or unbuildable dependency chain was: ['packagegroup-core-x11-b=
ase', 'packagegroup-core-x11-xserver', 'xserver-xorg', 'virtual/libgl']
>> ERROR: Required build target 'core-image-x11' has no buildable provide=
rs.
>> Missing or unbuildable dependency chain was: ['core-image-x11', 'packa=
gegroup-core-x11-base', 'packagegroup-core-x11-xserver', 'xserver-xorg', =
'virtual/libgl']
>>
>> Is the kirkstone branch currently tested or expected to work? If there=
 are known
>> limitations or additional configuration changes neccessary in local.co=
nf, could
>> they be documented in the readme?
>>
>=20
> Kirkstone is still WIP, the base builds and boots, but there are some
> spots still being readied yet (especially around graphics).

I appreciate this is still WIP. However, Kirkstone was released several m=
onths
ago now and some of the projects we're involved in (e.g. Automotive Grade=
 Linux)
have already upgraded to this release. As we use TI SoCs, our BSP depends=
 on
meta-ti and the lack of Kirkstone support is holding back our participati=
on in
these projects and preventing us from offering an up-to-date BSP release =
to our
customers.

>=20
> Xorg by default assumes desktop OpenGL support, being an embedded devic=
e
> we only support OpenGLES. Xorg does work just fine with OpenGLES but
> you have to tell it what to use with distro level PACKAGECONFIG selecti=
ng
> (same for cairo).
>=20
> In the future I'd like to split the "opengl" DISTRO_FEATURE into two
> (one for OpenGL and one for GLES2) and move them into MACHINE_FEATURE
> where they belong. Then we can set these down in the BSP layer.
> Until then you'll have to do the manual selecting.

I have tried building with `DISTRO_FEATURES:remove =3D "opengl"` and this=
 allows
non-graphical images like core-image-base to build successfully. However,=
 x11
and wayland images still fail:

core-image-x11:

    gtk+3_3.24.34.bb:do_compile fails. The full log.do_compile is 327kB s=
o I
    won't include it all here, but there are several errors of the follow=
ing
    form:

    In file included from ../../../gtk+-3.24.34/gdk/wayland/gdkscreen-way=
land.c:28:
    ../../../gtk+-3.24.34/gdk/wayland/gdkdisplay-wayland.h:48:10: fatal e=
rror: epoxy/egl.h: No such file or directory
    48 | #include <epoxy/egl.h>
        |          ^~~~~~~~~~~~~
    compilation terminated.

core-image-weston:

    ERROR: Nothing RPROVIDES 'weston-xwayland' (but /workdir/poky/meta/re=
cipes-graphics/images/core-image-weston.bb RDEPENDS on or otherwise requi=
res it)
    weston RPROVIDES weston-xwayland but was skipped: missing required di=
stro feature 'opengl' (not in DISTRO_FEATURES)
    NOTE: Runtime target 'weston-xwayland' is unbuildable, removing...
    Missing or unbuildable dependency chain was: ['weston-xwayland']
    ERROR: Required build target 'core-image-weston' has no buildable pro=
viders.
    Missing or unbuildable dependency chain was: ['core-image-weston', 'w=
eston-xwayland']

Thanks,

--=20
Paul Barker
Principal Software Engineer
SanCloud Ltd

e: paul.barker@sancloud.com
w: https://sancloud.com/
--------------i9LIuH050cKPGkAuvE922yvz
Content-Type: application/pgp-keys; name="OpenPGP_0xA67255DFCCE62ECD.asc"
Content-Disposition: attachment; filename="OpenPGP_0xA67255DFCCE62ECD.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=3DsH2a
-----END PGP PUBLIC KEY BLOCK-----

--------------i9LIuH050cKPGkAuvE922yvz--

--------------qsGv4fz3rck27e2FvVfS0kMA--

--------------RU3Wl2Jyked31llkK7uuhuKY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS7m7rT1+CktY3YG1PYN3IfEvob6gUCYz6oLQUDAAAAAAAKCRDYN3IfEvob6iAh
AQCPNZwwbsn381IiYpCCLXqA4ordiGAWB/KxNq2jQynziwEAyQxYgRom2/kLprv/2MWMLpPCxeI4
SBQiLaFDwO4rfw0=
=/0Hf
-----END PGP SIGNATURE-----

--------------RU3Wl2Jyked31llkK7uuhuKY--

