Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E6DF4E008C1
	for <meta-ti@yoctoproject.org>; Mon, 24 Feb 2014 08:01:54 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1OG1qca010972
	for <meta-ti@yoctoproject.org>; Mon, 24 Feb 2014 10:01:52 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1OG1q7c031894
	for <meta-ti@yoctoproject.org>; Mon, 24 Feb 2014 10:01:52 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Mon, 24 Feb 2014 10:01:52 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>, "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] linux-keystone: Update latest tag
Thread-Index: AQHPMFAh7Ri7GgP07EKDUKbtCjX4rJrCqZMAgACWEoCAAVMAsA==
Date: Mon, 24 Feb 2014 16:01:52 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015CEE9627@DLEE11.ent.ti.com>
References: <1393129856-9624-1-git-send-email-sam.nelson@ti.com>
	<20140223045044.GX22890@denix.org>
	<4F9216F96E5DF9428610502835A9F49057F3D4D9@DLEE11.ent.ti.com>
In-Reply-To: <4F9216F96E5DF9428610502835A9F49057F3D4D9@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] linux-keystone: Update latest tag
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Feb 2014 16:02:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Nelson, Sam
>Sent: Sunday, February 23, 2014 7:48 AM
>To: Dmytriyenko, Denys
>Cc: meta-ti@yoctoproject.org
>Subject: Re: [meta-ti] [PATCH] linux-keystone: Update latest tag
>
>
>
>> -----Original Message-----
>> From: Dmytriyenko, Denys
>> Sent: Saturday, February 22, 2014 11:51 PM
>> To: Nelson, Sam
>> Cc: meta-ti@yoctoproject.org
>> Subject: Re: [meta-ti] [PATCH] linux-keystone: Update latest tag
>>
>> On Sat, Feb 22, 2014 at 11:30:56PM -0500, Sam Nelson wrote:
>> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
>> >
>> > ---
>> > Not sure whether need a PR bump
>>
>> Yes, this one usually needs. Well, your SRCREV went up in both
>cases, so will
>> still work w/o a PR bump, but it's still a good idea to bump PR
>when updating
>> SRCREV only and PV stays the same. Kernel recipes have
>> MACHINE_KERNEL_PR_append
>> for that.
>[Sam] Thanks for the clarification. So in this case even though
>the MACHINE_KERNEL_PR_append went up due to the git commit change,
>It is recommended to bump PR explicitly in this case from
>MACHINE_KERNEL_PR_append =3D "a+gitr${SRCPV}" to
>MACHINE_KERNEL_PR_append =3D "b+gitr${SRCPV}".
> Please confirm.

Yes, because if the commit IDs had been the other way around they would hav=
e sorted as a "lower" PR so the build would not have been redone by default=
.

>>
>> --
>> Denys
>>
>>
>> > ---
>> > ---
>> >  recipes-kernel/linux/linux-keystone-rt_3.10.bb |    4 ++--
>> >  recipes-kernel/linux/linux-keystone_3.10.bb    |    4 ++--
>> >  2 files changed, 4 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/recipes-kernel/linux/linux-keystone-rt_3.10.bb
>b/recipes-
>> kernel/linux/linux-keystone-rt_3.10.bb
>> > index 9c2f904..3965dfa 100644
>> > --- a/recipes-kernel/linux/linux-keystone-rt_3.10.bb
>> > +++ b/recipes-kernel/linux/linux-keystone-rt_3.10.bb
>> > @@ -17,8 +17,8 @@ KERNEL_DEVICETREE_keystone-evm =3D "k2hk-
>> evm.dtb"
>> >
>> >  KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT}"
>> >
>> > -#This commit corresponds to "K2_RT_LINUX_03.10.10_13.12"
>> > -SRCREV =3D "8fa9091d0f9c91a048a975ddebbf2f492e73bf61"
>> > +#This commit corresponds to "K2_RT_LINUX_03.10.10_14.02"
>> > +SRCREV =3D "c78aa253ac385faae8b6c845a388e215395a8010"
>> >  PV =3D "3.10.10"
>> >
>> >  BRANCH =3D "master-rt"
>> > diff --git a/recipes-kernel/linux/linux-keystone_3.10.bb
>b/recipes-
>> kernel/linux/linux-keystone_3.10.bb
>> > index 2384ede..f063c0c 100644
>> > --- a/recipes-kernel/linux/linux-keystone_3.10.bb
>> > +++ b/recipes-kernel/linux/linux-keystone_3.10.bb
>> > @@ -17,8 +17,8 @@ KERNEL_DEVICETREE_keystone-evm =3D "k2hk-
>> evm.dtb"
>> >
>> >  KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT}"
>> >
>> > -#This commit corresponds to "K2_LINUX_03.10.10_13.12"
>> > -SRCREV =3D "335d14b1c2ce23585835243126c6acba89067ecf"
>> > +#This commit corresponds to "K2_LINUX_03.10.10_14.02"
>> > +SRCREV =3D "93515476b357304e6fc075c004a1cfa91a0751d0"
>> >  PV =3D "3.10.10"
>> >
>> >  BRANCH =3D "master"
>> > --
>> > 1.7.9.5
>> >
>> > _______________________________________________
>> > meta-ti mailing list
>> > meta-ti@yoctoproject.org
>> > https://lists.yoctoproject.org/listinfo/meta-ti
>> >
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

