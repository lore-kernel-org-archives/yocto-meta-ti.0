Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7BDBFE017CE
	for <meta-ti@yoctoproject.org>; Thu, 31 Oct 2013 06:44:47 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9VDikYc018347
	for <meta-ti@yoctoproject.org>; Thu, 31 Oct 2013 08:44:46 -0500
Received: from DFLE73.ent.ti.com ([128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9VDikQM029117
	for <meta-ti@yoctoproject.org>; Thu, 31 Oct 2013 08:44:46 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Thu, 31 Oct 2013 08:44:46 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Hingolikar, Mrinmayee"
	<mrinmayee@ti.com>
Thread-Topic: [meta-ti] [PATCHv2] linux-ti-glsdk: Update to latest fixes
Thread-Index: AQHO1cWKU3CZ7e7uBkepem9EVGAzO5oO0uNA
Date: Thu, 31 Oct 2013 13:44:45 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101597EF4ED@DLEE11.ent.ti.com>
References: <20131021130016.GA6062@ti.com> <20131030231224.GD24696@edge>
In-Reply-To: <20131030231224.GD24696@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCHv2] linux-ti-glsdk: Update to latest fixes
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
X-List-Received-Date: Thu, 31 Oct 2013 13:44:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable


>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Dmytriyenko, Denys
>Sent: Wednesday, October 30, 2013 6:12 PM
>To: Hingolikar, Mrinmayee
>Cc: meta-ti@yoctoproject.org
>Subject: Re: [meta-ti] [PATCHv2] linux-ti-glsdk: Update to latest
>fixes
>
>On Mon, Oct 21, 2013 at 06:30:16PM +0530, Mrinmayee Hingolikar
>wrote:
>> v1:
>>  * Kernel source migration from git.ti.com to omapzoom.org. The
>development
>>    tree is shared between the Linux and Android teams.This
>enables a common
>>    kernel development platform for both the teams for better
>alignment.
>>  * Add support for VIP and VPE
>>  * Add wilink/wlan support
>>  * Enable rpmsg/remoteproc driver for multimedia
>>
>> v2:
>>  * Add conditional assignment for BRANCH and SRCREV
>
>I'm not sure why this was needed, but I can take it.

My fault.  I like the BRANCH obviously, but I also like setting SRCREV for =
when it is overriden.  I know it probably isn't a big deal but a ?=3D is a =
flag for me that someone else may override this in an append.

>
>
>> Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
>> ---
>>  recipes-kernel/linux/linux-ti-glsdk_3.8.bb |    8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
>b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
>> index 9e3e499..35d55df 100644
>> --- a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
>> +++ b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
>> @@ -18,14 +18,14 @@ DEFAULT_PREFERENCE =3D "-1"
>>
>>  S =3D "${WORKDIR}/git"
>>
>> -BRANCH =3D "master"
>> +BRANCH ?=3D "p-ti-glsdk-3.8.y"
>>
>> -SRCREV =3D "6076e6882d1d6a64b104e42e56a3eada36605cb3"
>> +SRCREV ?=3D "cc16f99176bf083829c028f9af5b8eb560debcc1"
>>  PV =3D "3.8.13"
>>
>>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will
>cause a rebuild
>> -MACHINE_KERNEL_PR_append =3D "b+gitr${SRCPV}"
>> +MACHINE_KERNEL_PR_append =3D "c+gitr${SRCPV}"
>>
>> -SRC_URI =3D "git://git.ti.com/ti-linux-kernel/ti-linux-3-8-y-
>kernel.git;protocol=3Dgit;branch=3D${BRANCH} \
>> +SRC_URI =3D
>"git://git.omapzoom.org/kernel/omap.git;protocol=3Dgit;branch=3D${BRAN
>CH} \
>>             file://defconfig \
>>            "
>> --
>> 1.7.9.5
>>
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

