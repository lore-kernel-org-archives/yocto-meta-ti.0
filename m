Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 562A6E0056A
	for <meta-ti@yoctoproject.org>; Fri, 31 Jan 2014 06:51:39 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0VEpcI7016088
	for <meta-ti@yoctoproject.org>; Fri, 31 Jan 2014 08:51:38 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0VEpcFZ027463
	for <meta-ti@yoctoproject.org>; Fri, 31 Jan 2014 08:51:38 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Fri, 31 Jan 2014 08:51:38 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Nelson, Sam" <sam.nelson@ti.com>
Thread-Topic: [meta-ti] [PATCH v2] linux-keystone: Create recipe for
	linux-keystone kernel version 3.10
Thread-Index: AQHPHlMMIpNN7wNpTUKpdbXbrTNDhZqe6reg
Date: Fri, 31 Jan 2014 14:51:37 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015993C759@DLEE11.ent.ti.com>
References: <1391145789-9460-1-git-send-email-sam.nelson@ti.com>
	<20140131070635.GJ6814@edge>
In-Reply-To: <20140131070635.GJ6814@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH v2] linux-keystone: Create recipe for linux-keystone kernel version 3.10
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
X-List-Received-Date: Fri, 31 Jan 2014 14:51:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Dmytriyenko, Denys
>Sent: Friday, January 31, 2014 1:07 AM
>To: Nelson, Sam
>Cc: meta-ti@yoctoproject.org
>Subject: Re: [meta-ti] [PATCH v2] linux-keystone: Create recipe
>for linux-keystone kernel version 3.10
>
>Sam,
>
>This is much better! And easier to compare against the previous
>version too.
>I'll take it as is, although there are couple very minor comments
>below...
>
>
>On Fri, Jan 31, 2014 at 12:23:09AM -0500, Sam Nelson wrote:
>> - Updated Source URL & version
>> - Added device tree file
>>
>> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
>>
>> -----
>
>Should be exactly "---" as the one below or instead of that, so it
>won't go
>into the commit message.
>
>
>> Changes from last patch
>> Renamed recipe from 3.10--> 3.10.10
>> Removed directory path from dtb file
>> Removed do_deploy_append
>> ----
>> ---
>>  .../defconfig                                      |    0
>>  ...keystone_3.8.4.bb =3D> linux-keystone_3.10.10.bb} |   25
>+++++++++++---------
>>  2 files changed, 14 insertions(+), 11 deletions(-)
>>  rename recipes-kernel/linux/{linux-keystone-3.8.4 =3D> linux-
>keystone-3.10.10}/defconfig (100%)
>>  rename recipes-kernel/linux/{linux-keystone_3.8.4.bb =3D> linux-
>keystone_3.10.10.bb} (50%)
>>
>> diff --git a/recipes-kernel/linux/linux-keystone-3.8.4/defconfig
>b/recipes-kernel/linux/linux-keystone-3.10.10/defconfig
>> similarity index 100%
>> rename from recipes-kernel/linux/linux-keystone-3.8.4/defconfig
>> rename to recipes-kernel/linux/linux-keystone-3.10.10/defconfig
>> diff --git a/recipes-kernel/linux/linux-keystone_3.8.4.bb
>b/recipes-kernel/linux/linux-keystone_3.10.10.bb
>> similarity index 50%
>> rename from recipes-kernel/linux/linux-keystone_3.8.4.bb
>> rename to recipes-kernel/linux/linux-keystone_3.10.10.bb
>> index d176f14..a5c113e 100644
>> --- a/recipes-kernel/linux/linux-keystone_3.8.4.bb
>> +++ b/recipes-kernel/linux/linux-keystone_3.10.10.bb

I would comment that since 3.10 is an LTS and you probably expect updates t=
o it maybe having the release version is not a good idea.  For example just=
 call it 3.10 and set the version to 3.10.10 inside the recipe or just leav=
e it 3.10 and set KVER rather than chaning the recipe name for each update.

>> @@ -3,26 +3,29 @@ DESCRIPTION =3D "Linux kernel for TI Keystone
>devices"
>>  LICENSE =3D "GPLv2"
>>  LIC_FILES_CHKSUM =3D
>"file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
>>
>> +COMPATIBLE_MACHINE =3D "keystone"
>> +
>>  inherit kernel
>>
>>  require recipes-kernel/linux/linux-dtb.inc
>>  require recipes-kernel/linux/setup-defconfig.inc
>>
>> +MACHINE_KERNEL_PR_append =3D "a"
>
>1. You might want to also add "+gitr${SRCPV}" so git commit ID
>gets into
>package version and file name. Useful when you have several builds
>from
>different points in git which are all 3.10.10 etc. But it's up to
>you.
>
>2. Having PR =3D "${MACHINE_KERNEL_PR}" is also useful for others,
>when not
>using meta-openembedded layer and its machine_kernel_pr.bbclass...
>
>
>> +
>> +CORTEXA8FIXUP =3D "no"
>
>I don't think this is needed any more...
>
>
>>  KERNEL_DEVICETREE_keystone-evm =3D "k2hk-evm.dtb"
>>
>> -COMPATIBLE_MACHINE =3D "keystone"
>> +#This commit corresponds to "K2_LINUX_03.10.10_13.12"
>> +SRCREV =3D "335d14b1c2ce23585835243126c6acba89067ecf"
>>
>> -S =3D "${WORKDIR}/git"
>> +BRANCH =3D "master"
>>
>> -BRANCH =3D "sept-2013/master"
>> +SRC_URI =3D "git://git.ti.com/keystone-
>linux/linux.git;protocol=3Dgit;branch=3D${BRANCH}\
>> +           file://defconfig\
>> +           "
>>
>> -# This commit corresponds to K2_LINUX_03.08.04_13.09 tag
>> -SRCREV =3D "20a48dc5309c4434650baef2b6072b5f1016f946"
>> +S =3D "${WORKDIR}/git"
>>
>> -# Append to the MACHINE_KERNEL_PR so that a new SRCREV will
>cause a rebuild
>> -MACHINE_KERNEL_PR_append =3D "a+gitr${SRCPV}"
>> -PR =3D "${MACHINE_KERNEL_PR}"
>> +RDEPENDS_kernel-base =3D ""
>>
>> -SRC_URI =3D "git://arago-project.org/git/projects/linux-
>keystone.git;protocol=3Dgit;branch=3D${BRANCH}\
>> -           file://defconfig\
>> -          "
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

