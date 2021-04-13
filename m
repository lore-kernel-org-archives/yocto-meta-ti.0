Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.5064.1618354260536253792
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 15:51:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=N7ubcBA8;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13DMovsN068729;
	Tue, 13 Apr 2021 17:50:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618354257;
	bh=l68byid/1esxynSX+lSuJTKWRqNPRxUo4nlXRI1tyxE=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=N7ubcBA8DkcDbfUofD3l2Dp6mjfeRCKj02kbedsawJXIOcKQKIWUAMGvE67VCbffM
	 nDtL8NWo20A68A+TEtKoRgUY6p/xA0UdUQ8abdrta6Og3iBpNEPgagpqpJ6zHjdK7v
	 NH3s1py5xo4BAEae4Bq+KFnQaOkxc38mA6SvjX/M=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13DMovEF111999
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 Apr 2021 17:50:57 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 13
 Apr 2021 17:50:56 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 13 Apr 2021 17:50:56 -0500
Received: from [10.247.25.23] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13DMoujG101787;
	Tue, 13 Apr 2021 17:50:56 -0500
Subject: Re: [EXTERNAL] [meta-ti] [PATCH] ti-sgx-ddk-km: properly handle arm-poky-linux-gnueabi compiler prefix
To: <g-tammana@ti.com>, Zan Dobersek <zan@falconsigh.net>,
        "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
References: <20210224082509.14163-1-zan@falconsigh.net>
 <3c3a7b165e474569a0ce474f2c5e7635@ti.com> <20210224202307.GB4892@denix.org>
 <16673A9B03286F37.14505@lists.yoctoproject.org>
 <f6c786e1-363f-499d-b19e-9e1647161644@www.fastmail.com>
 <290f014d90634c91953745ca4e4ff995@ti.com>
From: "praneeth" <praneeth@ti.com>
Message-ID: <421e0f9a-ba58-dccb-2473-3959e88ecc04@ti.com>
Date: Tue, 13 Apr 2021 17:50:56 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <290f014d90634c91953745ca4e4ff995@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 13DMovsN068729
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 4/13/2021 5:30 PM, Gowtham Tammana via lists.yoctoproject.org wrote:
> *From:* meta-ti@lists.yoctoproject.org <meta-ti@lists.yoctoproject.org>=
=20
> *On Behalf Of *Zan Dobersek
> *Sent:* Tuesday, April 13, 2021 6:41 AM
> *To:* meta-ti@lists.yoctoproject.org
> *Subject:* Re: [EXTERNAL] [meta-ti] [PATCH] ti-sgx-ddk-km: properly=20
> handle arm-poky-linux-gnueabi compiler prefix
>=20
> Hi,
>=20
> this patch is still valid and needed for Poky-based builds. Did it just=
=20
> go unattended or is there some action still expected on my part?
>=20
> No further action, this will be picked up.

Zan,Gowtham, This has to be picked up for which branches?=20
(dunfell/master ? )

>=20
> Thanks,
>=20
> Gowtham
>=20
> Regards,
>=20
> Zan
>=20
> On Fri, Feb 26, 2021, at 8:10 AM, Zan Dobersek wrote:
>=20
>     On Wed, Feb 24, 2021, at 9:23 PM, Denys Dmytriyenko wrote:
>=20
>      > On Wed, Feb 24, 2021 at 06:57:57PM +0000, Gowtham Tammana via
>=20
>      > lists.yoctoproject.org wrote:
>=20
>      > >
>=20
>      > >
>=20
>      > > >-----Original Message-----
>=20
>      > > >From: meta-ti@lists.yoctoproject.org
>     <mailto:meta-ti%40lists.yoctoproject.org>
>     <meta-ti@lists.yoctoproject.org
>     <mailto:meta-ti%40lists.yoctoproject.org>> On
>=20
>      > > >Behalf Of Zan Dobersek
>=20
>      > > >Sent: Wednesday, February 24, 2021 2:25 AM
>=20
>      > > >To: meta-ti@lists.yoctoproject.org
>     <mailto:meta-ti%40lists.yoctoproject.org>
>=20
>      > > >Subject: [EXTERNAL] [meta-ti] [PATCH] ti-sgx-ddk-km: properly
>     handle arm-
>=20
>      > > >poky-linux-gnueabi compiler prefix
>=20
>      > > >
>=20
>      > > >The additional patch for ti-sgx-ddk-km remaps the
>     arm-oe-linux-gnueabi
>=20
>      > > >prefix
>=20
>      > > >to the arm-linux-gnueabihf preferred target. Same should be
>     done for the
>=20
>      > > >arm-poky-linux-gnueabi prefix.
>=20
>      > >
>=20
>      > > This looks ok. Btw what layer is being used when using this
>     toolchain.
>=20
>      >
>=20
>      > Gowtham,
>=20
>      >
>=20
>      > This toolchain is built by Poky, which is the reference
>     distribution of the
>=20
>      > Yocto Project.
>=20
>      >
>=20
>     Reviewed-by: Gowtham Tammana g-tammana@ti.com <mailto:g-tammana@ti.c=
om>
>=20
>     That's right.
>=20
>     FWIW the patch should be applicable to both dunfell and master branc=
hes.
>=20
>     Regards,
>=20
>     Zan
>=20
>      > --
>=20
>      > Denys
>=20
>      >
>=20
>      >
>=20
>      > > >Signed-off-by: Zan Dobersek <zan@falconsigh.net
>     <mailto:zan%40falconsigh.net>>
>=20
>      > > >---
>=20
>      > > >
>     ...1-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch | 2 =
+-
>=20
>      > > > 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
>      > > >
>=20
>      > > >diff --git
>     a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-
>=20
>      > > >OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
>     b/recipes-bsp/powervr-
>=20
>      > >
>      >drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchai=
n-w-o-
>=20
>      > > >gnueabi.patch
>=20
>      > > >index 071ce0ca..15105eac 100644
>=20
>      > > >--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-suppor=
t-
>=20
>      > > >OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
>=20
>      > > >+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-suppor=
t-
>=20
>      > > >OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
>=20
>      > > >@@ -17,7 +17,7 @@ index dead2f9..2ba3e5e 100644
>=20
>      > > >=A0=A0=A0 ifneq ($$(filter
>     aarch64-%,$$($(1)_compiler_preferred_target)),)
>=20
>      > > >=A0=A0=A0=A0 $(1)_compiler_preferred_target :=3D aarch64-linux=
-gnu
>=20
>      > > >=A0=A0=A0 endif
>=20
>      > > >-+=A0 ifneq ($$(filter arm-%-gnueabihf arm-oe-linux-
>=20
>      > > >gnueabi,$$($(1)_compiler_preferred_target)),)
>=20
>      > > >++=A0 ifneq ($$(filter arm-%-gnueabihf arm-oe-linux-gnueabi
>     arm-poky-linux-
>=20
>      > > >gnueabi,$$($(1)_compiler_preferred_target)),)
>=20
>      > > > +=A0=A0 $(1)_compiler_preferred_target :=3D arm-linux-gnueabi=
hf
>=20
>      > > > +=A0 endif
>=20
>      > > >=A0=A0=A0 ifneq ($$(filter arm-%-gnueabi armv7a-cros-linux-gnu=
eabi
>     armv7hl-
>=20
>      > > >redhat-linux-gnueabi,$$($(1)_compiler_preferred_target)),)
>=20
>      > > >--
>=20
>      > > >2.30.0
>=20
>      >
>=20
>=20
>=20
>=20
>=20
