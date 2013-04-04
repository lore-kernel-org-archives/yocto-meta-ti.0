Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 54CF0E014EE
	for <meta-ti@yoctoproject.org>; Wed,  3 Apr 2013 17:38:29 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r340cS6a007781
	for <meta-ti@yoctoproject.org>; Wed, 3 Apr 2013 19:38:28 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r340cSNo025468
	for <meta-ti@yoctoproject.org>; Wed, 3 Apr 2013 19:38:28 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Wed, 3 Apr 2013 19:38:28 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH 2/2] ti33x: Add DTB filter for building SDKs
Thread-Index: AQHOML3+rAnXnkkAJEm+j09WaX9supjFN/cK
Date: Thu, 4 Apr 2013 00:38:28 +0000
Message-ID: <47BFB0D4-4FB5-4C58-A905-C12C79B8E60C@ti.com>
References: <1365008161-14609-1-git-send-email-Chase.Maupin@ti.com>
	<1365008161-14609-2-git-send-email-Chase.Maupin@ti.com>,
	<20130403225248.GE31233@denix.org>
In-Reply-To: <20130403225248.GE31233@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 2/2] ti33x: Add DTB filter for building SDKs
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
X-List-Received-Date: Thu, 04 Apr 2013 00:38:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

We could probably do it in the image recipe with machine overrides.  How's =
that?

Sincerely,
Chase Maupin
On Apr 3, 2013, at 5:53 PM, "Dmytriyenko, Denys" <denys@ti.com> wrote:

> On Wed, Apr 03, 2013 at 11:56:01AM -0500, Chase Maupin wrote:
>> * Add a DTB_FILTER variable to only package the am335x DTB files
>>  in the SDK.
>>=20
>> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>> ---
>> conf/machine/include/ti33x.inc |    2 ++
>> 1 files changed, 2 insertions(+), 0 deletions(-)
>>=20
>> diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33=
x.inc
>> index e8aa2ba..50844d1 100644
>> --- a/conf/machine/include/ti33x.inc
>> +++ b/conf/machine/include/ti33x.inc
>> @@ -25,6 +25,8 @@ PREFERRED_PROVIDER_u-boot =3D "u-boot-ti-staging"
>>=20
>> KERNEL_IMAGETYPE =3D "uImage"
>>=20
>> +DTB_FILTER =3D "am335x"
>=20
> I'm not sure about adding a new variable to meta-ti that is only used in=
 tisdk=20
> part of meta-arago... Any other options?
>=20
>=20
>> UBOOT_ARCH =3D "arm"
>> UBOOT_MACHINE =3D "am335x_evm_config"
>>=20
>> --=20
>> 1.7.0.4
>>=20
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti
>>=20

