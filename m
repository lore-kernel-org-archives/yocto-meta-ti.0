Return-Path: <e-ruei1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 51839E006EA; Wed,  4 Jan 2017 09:54:58 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7C8F4E00480
	for <meta-ti@yoctoproject.org>; Wed,  4 Jan 2017 09:54:12 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v04Hs9rQ023935;
	Wed, 4 Jan 2017 11:54:09 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v04Hs9sm008731;
	Wed, 4 Jan 2017 11:54:09 -0600
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0294.000; Wed, 4 Jan 2017 11:54:08 -0600
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, Benjamin Bimmermann
	<b.bimmermann@yahoo.de>
Thread-Topic: [meta-ti] ti-sgx-ddk-um / do_install failed / cp: cannot stat
	'./targetfs//etc/*': No such file or directory
Thread-Index: AQHSZmkFVzJVF6SvVkClmt3LcwRQnKEo9UoA//+kSiA=
Date: Wed, 4 Jan 2017 17:54:07 +0000
Message-ID: <009C030982313E4589C6BC55FBF1E82A2532EF30@DFLE09.ent.ti.com>
References: <972676697.10149692.1483518767462.ref@mail.yahoo.com>
	<972676697.10149692.1483518767462@mail.yahoo.com>
	<20170104171954.GG28380@edge>
In-Reply-To: <20170104171954.GG28380@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: ti-sgx-ddk-um / do_install failed / cp: cannot stat './targetfs//etc/*': No such file or directory
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
X-List-Received-Date: Wed, 04 Jan 2017 17:54:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hi, All:

I try beaglebone and it does work.
MACHINE=3Dbeaglebone bitbake ti-sgx-ddk-um

Best regards,

Eric

-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Dmytriyenko, Denys
Sent: Wednesday, January 04, 2017 12:20 PM
To: Benjamin Bimmermann
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] ti-sgx-ddk-um / do_install failed / cp: cannot stat =
'./targetfs//etc/*': No such file or directory

On Wed, Jan 04, 2017 at 08:32:47AM +0000, Benjamin Bimmermann wrote:
> Hello,
>=20
> I'm trying to build the ti-sgx-ddk-for the AM33x.
> I've tried to build the Krogoth and the morty branch, but both failed.
> A few months ago I had this error yet. I also do not understand which fil=
es he would like to copy, but not find.
> I have attached an extract from my log.

Try changing MACHINE from "beaglebone" to "am335x-evm".

--=20
Denys


> Thank you for your attentionBimmermann
>=20
>=20
> -------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-----------------------------------------------=20
> log.do_install.19908
> Log data follows:
> | DEBUG: Executing shell function do_install
> | NOTE: make -j7 install DESTDIR=3D/home/bimmermann/bbb/build_Sens_krogot=
h/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-um/1.14.3699939-r19/ima=
ge TARGET_PRODUCT=3D
> | mkdir -p /home/bimmermann/bbb/build_Sens_krogoth/tmp/work/beaglebone-po=
ky-linux-gnueabi/ti-sgx-ddk-um/1.14.3699939-r19/image/etc
> | mkdir -p /home/bimmermann/bbb/build_Sens_krogoth/tmp/work/beaglebone-po=
ky-linux-gnueabi/ti-sgx-ddk-um/1.14.3699939-r19/image/usr/bin
> | mkdir -p /home/bimmermann/bbb/build_Sens_krogoth/tmp/work/beaglebone-po=
ky-linux-gnueabi/ti-sgx-ddk-um/1.14.3699939-r19/image/usr/include
> | mkdir -p /home/bimmermann/bbb/build_Sens_krogoth/tmp/work/beaglebone-po=
ky-linux-gnueabi/ti-sgx-ddk-um/1.14.3699939-r19/image/usr/lib
> | cp -ar ./targetfs//etc/* /home/bimmermann/bbb/build_Sens_krogoth/tmp/wo=
rk/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-um/1.14.3699939-r19/image/etc
> | cp: cannot stat './targetfs//etc/*': No such file or directory
> | Makefile:14: recipe for target 'install' failed
> | make: *** [install] Error 1
> | ERROR: oe_runmake failed
> | ERROR: Function failed: do_install (log file is located at /home/bimmer=
mann/bbb/build_Sens_krogoth/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-d=
dk-um/1.14.3699939-r19/temp/log.do_install.19908)
> NOTE: recipe ti-sgx-ddk-um-1.14.3699939-r19: task do_install: Failed
> ERROR: Task 843 (/home/bimmermann/poky-krogoth/meta-ti/recipes-graphics/l=
ibgles/ti-sgx-ddk-um_1.14.3699939.bb, do_install) failed with exit code '1'
> NOTE: Running task 2572 of 3217 (ID: 830, /home/bimmermann/poky-krogoth/m=
eta-BBB_QT5_PSS/meta-BBB_QT5_PSS/recipes-extras/thermal-init/thermal-init.b=
b, do_install)
> -------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-----------------------------------------------
> Build Configuration:
> BB_VERSION=A0=A0=A0=A0=A0=A0=A0 =3D "1.30.0"
> BUILD_SYS=A0=A0=A0=A0=A0=A0=A0=A0 =3D "x86_64-linux"
> NATIVELSBSTRING=A0=A0 =3D "Ubuntu-16.04"
> TARGET_SYS=A0=A0=A0=A0=A0=A0=A0 =3D "arm-poky-linux-gnueabi"
> MACHINE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =3D "beaglebone"
> DISTRO=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =3D "poky"
> DISTRO_VERSION=A0=A0=A0 =3D "2.1.2"
> TUNE_FEATURES=A0=A0=A0=A0 =3D "arm armv7a vfp thumb neon=A0=A0=A0=A0=A0=
=A0 callconvention-hard"
> TARGET_FPU=A0=A0=A0=A0=A0=A0=A0 =3D "hard"
> meta-ti=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =3D "krogoth:8663e1611ab6c5bfe36d32=
3d9d9db4dada4bd532"
> meta-qt5=A0=A0=A0=A0=A0=A0=A0=A0=A0 =3D "krogoth:2b1871f0d139dc3caaa779a3=
2a1931409c245a36"
> meta-oe=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =3D "krogoth:55c8a76da5dc099a7bc=
3838495c672140cedb78e"
> meta=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=20
> meta-yocto=A0=A0=A0=A0=A0=A0=A0 =3D "krogoth:ae9b341ecfcc60e970f29cfe0430=
6411ad26c0cf"
> -------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-----------------------------------------------

> --=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

--=20
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

