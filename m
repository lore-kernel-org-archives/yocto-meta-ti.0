Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.5467.1618356322039168221
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 16:25:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=aniS1VSN;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13DNPEpU046720;
	Tue, 13 Apr 2021 18:25:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618356314;
	bh=N0u3BzPiGRZSSI7eAeQXjgzcIL2i/PIJcixrw4XINjA=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=aniS1VSNKnHLxLgNgRb8C0XKmjdi+MQpKyfb1z9WV4IN9Uh0L/SnVyYfxYIgMQNGG
	 JLcLI3ZytApJqxee2hNxciwn8GpUE5JCZD1SR/KUXcurIJ2sYeFlxA9iVqlqGLCXDq
	 YEpUy5m5ZFGtW1xpsK1UG2BC2TBB6TpVQdvE9gzQ=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13DNPEXq032694
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 Apr 2021 18:25:14 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 13
 Apr 2021 18:25:13 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 13 Apr 2021 18:25:13 -0500
Received: from [128.247.81.61] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13DNPDlh031328;
	Tue, 13 Apr 2021 18:25:13 -0500
Subject: Re: [EXTERNAL] [meta-ti] [PATCH] ti-sgx-ddk-km: properly handle arm-poky-linux-gnueabi compiler prefix
To: Denys Dmytriyenko <denis@denix.org>
CC: <g-tammana@ti.com>, Zan Dobersek <zan@falconsigh.net>,
        <meta-ti@lists.yoctoproject.org>
References: <3e5f3806-f2a6-4b63-9045-8f07069defa5@email.android.com>
From: "praneeth" <praneeth@ti.com>
Message-ID: <336f6294-e416-6245-e018-42529d1f8d5f@ti.com>
Date: Tue, 13 Apr 2021 18:25:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3e5f3806-f2a6-4b63-9045-8f07069defa5@email.android.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 13DNPEpU046720
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 4/13/21 6:10 PM, Denys Dmytriyenko wrote:
> Praneeth,
>=20
> Yes, dunfell and master should be fine. Thanks.
>=20

Thanks denys for confirming.
pulled to dunfell-next for nightly build test. Will pick to other=20
branches in a day.


> Denys
>=20
>=20
> On Apr 13, 2021 18:50, "praneeth via lists.yoctoproject.org"=20
> <praneeth=3Dti.com@lists.yoctoproject.org> wrote:
>=20
>=20
>=20
>     On 4/13/2021 5:30 PM, Gowtham Tammana via lists.yoctoproject.org wro=
te:
>      > *From:* meta-ti@lists.yoctoproject.org
>     <meta-ti@lists.yoctoproject.org>
>      > *On Behalf Of *Zan Dobersek
>      > *Sent:* Tuesday, April 13, 2021 6:41 AM
>      > *To:* meta-ti@lists.yoctoproject.org
>      > *Subject:* Re: [EXTERNAL] [meta-ti] [PATCH] ti-sgx-ddk-km: proper=
ly
>      > handle arm-poky-linux-gnueabi compiler prefix
>      >
>      > Hi,
>      >
>      > this patch is still valid and needed for Poky-based builds. Did
>     it just
>      > go unattended or is there some action still expected on my part?
>      >
>      > No further action, this will be picked up.
>=20
>     Zan,Gowtham, This has to be picked up for which branches?
>     (dunfell/master ? )
>=20
>      >
>      > Thanks,
>      >
>      > Gowtham
>      >
>      > Regards,
>      >
>      > Zan
>      >
>      > On Fri, Feb 26, 2021, at 8:10 AM, Zan Dobersek wrote:
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0 On Wed, Feb 24, 2021, at 9:23 PM, Denys D=
mytriyenko wrote:
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > On Wed, Feb 24, 2021 at 06:57:57P=
M +0000, Gowtham Tammana via
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > lists.yoctoproject.org wrote:
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > >
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > >
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > >-----Original Message-----
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > >From: meta-ti@lists.yoctoproje=
ct.org
>      >=C2=A0=C2=A0=C2=A0=C2=A0 <mailto:meta-ti%40lists.yoctoproject.org>
>      >=C2=A0=C2=A0=C2=A0=C2=A0 <meta-ti@lists.yoctoproject.org
>      >=C2=A0=C2=A0=C2=A0=C2=A0 <mailto:meta-ti%40lists.yoctoproject.org>=
> On
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > >Behalf Of Zan Dobersek
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > >Sent: Wednesday, February 24, =
2021 2:25 AM
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > >To: meta-ti@lists.yoctoproject=
.org
>      >=C2=A0=C2=A0=C2=A0=C2=A0 <mailto:meta-ti%40lists.yoctoproject.org>
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > >Subject: [EXTERNAL] [meta-ti] =
[PATCH] ti-sgx-ddk-km:
>     properly
>      >=C2=A0=C2=A0=C2=A0=C2=A0 handle arm-
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > >poky-linux-gnueabi compiler pr=
efix
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > >
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > >The additional patch for ti-sg=
x-ddk-km remaps the
>      >=C2=A0=C2=A0=C2=A0=C2=A0 arm-oe-linux-gnueabi
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > >prefix
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > >to the arm-linux-gnueabihf pre=
ferred target. Same
>     should be
>      >=C2=A0=C2=A0=C2=A0=C2=A0 done for the
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > >arm-poky-linux-gnueabi prefix.
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > >
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > This looks ok. Btw what layer i=
s being used when using this
>      >=C2=A0=C2=A0=C2=A0=C2=A0 toolchain.
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > Gowtham,
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > This toolchain is built by Poky, =
which is the reference
>      >=C2=A0=C2=A0=C2=A0=C2=A0 distribution of the
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > Yocto Project.
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0 Reviewed-by: Gowtham Tammana g-tammana@ti=
.com
>     <mailto:g-tammana@ti.com>
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0 That's right.
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0 FWIW the patch should be applicable to bo=
th dunfell and
>     master branches.
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0 Regards,
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0 Zan
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > --
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > Denys
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > >Signed-off-by: Zan Dobersek <z=
an@falconsigh.net
>      >=C2=A0=C2=A0=C2=A0=C2=A0 <mailto:zan%40falconsigh.net>>
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > >---
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > >
>      >    
>     ...1-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch | 2 =
+-
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > > 1 file changed, 1 insertion(+=
), 1 deletion(-)
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > >
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > >diff --git
>      >=C2=A0=C2=A0=C2=A0=C2=A0 a/recipes-bsp/powervr-drivers/ti-sgx-ddk-=
km/0001-km-support-
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > >OpenEmbedded-hardfp-toolchain-=
w-o-gnueabi.patch
>      >=C2=A0=C2=A0=C2=A0=C2=A0 b/recipes-bsp/powervr-
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > >
>      >    =20
>      >drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchai=
n-w-o-
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > >gnueabi.patch
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > >index 071ce0ca..15105eac 10064=
4
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > >---
>     a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > >OpenEmbedded-hardfp-toolchain-=
w-o-gnueabi.patch
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > >+++
>     b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > >OpenEmbedded-hardfp-toolchain-=
w-o-gnueabi.patch
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > >@@ -17,7 +17,7 @@ index dead2f=
9..2ba3e5e 100644
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > >=C2=A0=C2=A0=C2=A0 ifneq ($$(f=
ilter
>      >=C2=A0=C2=A0=C2=A0=C2=A0 aarch64-%,$$($(1)_compiler_preferred_targ=
et)),)
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > >=C2=A0=C2=A0=C2=A0=C2=A0 $(1)_=
compiler_preferred_target :=3D aarch64-linux-gnu
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > >=C2=A0=C2=A0=C2=A0 endif
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > >-+=C2=A0 ifneq ($$(filter arm-=
%-gnueabihf arm-oe-linux-
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > >gnueabi,$$($(1)_compiler_prefe=
rred_target)),)
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > >++=C2=A0 ifneq ($$(filter arm-=
%-gnueabihf arm-oe-linux-gnueabi
>      >=C2=A0=C2=A0=C2=A0=C2=A0 arm-poky-linux-
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > >gnueabi,$$($(1)_compiler_prefe=
rred_target)),)
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > > +=C2=A0=C2=A0 $(1)_compiler_p=
referred_target :=3D arm-linux-gnueabihf
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > > +=C2=A0 endif
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > >=C2=A0=C2=A0=C2=A0 ifneq ($$(f=
ilter arm-%-gnueabi
>     armv7a-cros-linux-gnueabi
>      >=C2=A0=C2=A0=C2=A0=C2=A0 armv7hl-
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > >redhat-linux-gnueabi,$$($(1)_c=
ompiler_preferred_target)),)
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > >--
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > >2.30.0
>      >
>      >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >
>      >
>      >
>      >
>      >
>      >
>=20
>=20
>    =20
>=20
>=20
