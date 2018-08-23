Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5F199E00718; Thu, 23 Aug 2018 10:29:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 80ABBE003C1
	for <meta-ti@yoctoproject.org>; Thu, 23 Aug 2018 10:29:47 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7NHTckw061321;
	Thu, 23 Aug 2018 12:29:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535045378;
	bh=jqk022aNdJn0qClWJOuz2S9yctuGWOr34veucTyCyOU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Y/98RgvS227qNvYWI3JVpsK6SbSMN/Xm7YOVTbmbC5v0KkQhhlL+5bYqyeMkQ4A6J
	9EJh09wSnICryhnPhf5YX4jR3y63AxHZXRGKsrN5Hw05688ts0xGufU7idJ3g8Lu6J
	0AsqSqO0EJDIHenIvy83h3mu8ImhcI2Je02SQQDQ=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7NHTctu021561;
	Thu, 23 Aug 2018 12:29:38 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 23 Aug 2018 12:29:37 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 23 Aug 2018 12:29:37 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7NHTbhU013339;
	Thu, 23 Aug 2018 12:29:37 -0500
Date: Thu, 23 Aug 2018 13:28:43 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: David Castelow <DCastelow@Airspan.com>
Message-ID: <20180823172843.GU29422@beryl>
References: <e63ca8ec3a0243d6ad9ea5ad6a1525f1@Airspan.com>
MIME-Version: 1.0
In-Reply-To: <e63ca8ec3a0243d6ad9ea5ad6a1525f1@Airspan.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: FW: Problem with TI SDK Build 05.
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
X-List-Received-Date: Thu, 23 Aug 2018 17:29:48 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

You have some setup issues. From config.log your Linaro GCC seems broken:

configure:3815: checking whether the C compiler works
configure:3837: arm-linux-gnueabihf-gcc  -march=3Darmv7-a -marm -mfpu=3Dneo=
n -mfloat-abi=3Dhard --sysroot=3D/home/dcastelow/sdk5/arago/tisdk/build/ara=
go-tmp-external-linaro-toolchain/work/armv7ahf-neon-linux-gnueabi/libtool-c=
ross/2.4.6-r0/recipe-sysroot  -isystem/home/dcastelow/gcc-linaro-7.2.1-2017=
=2E11-x86_64_arm-linux-gnueabihf/arm-linux-gnueabihf/include  -O2 -pipe -g =
-feliminate-unused-debug-types -fdebug-prefix-map=3D/home/dcastelow/sdk5/ar=
ago/tisdk/build/arago-tmp-external-linaro-toolchain/work/armv7ahf-neon-linu=
x-gnueabi/libtool-cross/2.4.6-r0=3D/usr/src/debug/libtool-cross/2.4.6-r0 -f=
debug-prefix-map=3D/home/dcastelow/sdk5/arago/tisdk/build/arago-tmp-externa=
l-linaro-toolchain/work/armv7ahf-neon-linux-gnueabi/libtool-cross/2.4.6-r0/=
recipe-sysroot-native=3D -fdebug-prefix-map=3D/home/dcastelow/sdk5/arago/ti=
sdk/build/arago-tmp-external-linaro-toolchain/work/armv7ahf-neon-linux-gnue=
abi/libtool-cross/2.4.6-r0/recipe-sysroot=3D   -isystem/home/dcastelow/gcc-=
linaro-7.2.1-2017.11-x86_64_arm-linux-gnueabihf/arm-linux-gnueabihf/include=
   -L/home/dcastelow/gcc-linaro-7.2.1-2017.11-x86_64_arm-linux-gnueabihf/ar=
m-linux-gnueabihf/lib -Wl,-rpath-link,/home/dcastelow/gcc-linaro-7.2.1-2017=
=2E11-x86_64_arm-linux-gnueabihf/arm-linux-gnueabihf/lib -Wl,-O1 -Wl,--hash=
-style=3Dgnu conftest.c  >&5
/media/disk/users/dcastelow/gcc-linaro-7.2.1-2017.11-x86_64_arm-linux-gnuea=
bihf/bin/../lib/gcc/arm-linux-gnueabihf/7.2.1/../../../../arm-linux-gnueabi=
hf/bin/ld: cannot find ../../lib/libc.so.6
collect2: error: ld returned 1 exit status
[...]
configure:3884: error: in `/home/dcastelow/sdk5/arago/tisdk/build/arago-tmp=
-external-linaro-toolchain/work/armv7ahf-neon-linux-gnueabi/libtool-cross/2=
=2E4.6-r0/build':
configure:3886: error: C compiler cannot create executables

So, since your Linaro GCC cannot cross-compile a simple program, it fails a=
t=20
the first dependency that uses it, which happens to be libtool-cross.

Please resolve your setup problems and everything will work w/o any=20
modifications to recipes. Thanks.

--=20
Denys


On Wed, Aug 22, 2018 at 03:33:57PM +0000, David Castelow wrote:
> Hi,
>=20
> I had an issue building the latest TI SDK for Sitara processors (05_00_00=
_15), and Kemal from TI suggested I post my findings here for comment.
>=20
> So the build I attempted was for
>=20
> $ MACHINE=3Dam335x-evm bitbake arago-base-tisdk-image
>=20
> following instructions from
>=20
> http //software-dl.ti.com/processor-sdk-linux/esd/docs/latest/linux/Overv=
iew.html <http://software-dl.ti.com/processor-sdk-linux/esd/docs/latest/lin=
ux/Overview.html#id13>
>=20
> and using both Linux Mint 17.3 (trusty based) and Ubuntu Xenial (16.04) a=
s host machines, giving essentially the same error.
>=20
> The problem appears in failure to build libtool-cross successfully.
>=20
> I have traced this back to something in the bitbake recipes/patches that =
modify the libtool configure script:
> See http://e2e.ti.com/support/arm/sitara_arm/f/791/p/718479/2660196#26601=
96 for the history.
>=20
> The build does succeed if I ensure HOST_SYS is defined:
> As I said in my last post to that thread,
> Compilation/build is successful if I edit
>=20
> arago/tisdk/sources/oe-core/meta/classes/nativesdk.bbclass
>=20
> -#HOST_SYS =3D "${HOST_ARCH}${TARGET_VENDOR}-${HOST_OS}"
> +HOST_SYS =3D "${HOST_ARCH}${TARGET_VENDOR}-${HOST_OS}"
>=20
> I think this is because there are libtool related .bb files and .patch fi=
les that reference either ${host_alias}-libtool or ${HOST_SYS}-libtool.
>=20
> If HOST_SYS is empty, then the executable would be called -libtool, and t=
hen the configure script fails to clean up as it attempts to execute
>=20
> rm -libtool
>=20
> which won't work as the file name starts with a - (were this to work, it =
would need to do the mv/rm of ./${file} rather than just of ${file}).
>=20
> I'm not sure if this is the correct solution to the problem, but it sugge=
sts the need to set HOST_SYS as part of the build instructions.
>=20
> Can you advise if this is correct?
>=20
> [cid:GLOMO2018_e6c86ab3-4fac-42ae-88d7-eab266a26da8.png] tfx



> --=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


