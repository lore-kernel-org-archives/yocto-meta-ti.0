Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 53F58E00873; Fri, 30 Jan 2015 18:58:52 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6E4FFE00546
	for <meta-ti@yoctoproject.org>; Fri, 30 Jan 2015 18:58:48 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0V2wlMK008132
	for <meta-ti@yoctoproject.org>; Fri, 30 Jan 2015 20:58:48 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0V2wkOR019584
	for <meta-ti@yoctoproject.org>; Fri, 30 Jan 2015 20:58:46 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0224.002; Fri, 30 Jan 2015 20:58:46 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] Graphics SDK: Add 05.01.01.02
Thread-Index: AQHQPN5keaz6/voXhUya7WX7gL67y5zZ7Z2A//+cTqA=
Date: Sat, 31 Jan 2015 02:58:45 +0000
Message-ID: <6BBDFD47-E550-4BFE-B4A0-3C49D551A675@ti.com>
References: <1422657902-16482-1-git-send-email-fcooper@ti.com>,
	<20150131025534.GC2883@edge>
In-Reply-To: <20150131025534.GC2883@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] Graphics SDK: Add 05.01.01.02
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
X-List-Received-Date: Sat, 31 Jan 2015 02:58:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable




> On Jan 30, 2015, at 8:55 PM, Dmytriyenko, Denys <denys@ti.com> wrote:
>=20
>> On Fri, Jan 30, 2015 at 04:45:02PM -0600, Franklin S. Cooper Jr wrote:
>> From: "Franklin S. Cooper Jr" <fcooper@ti.com>
>>=20
>> * This graphics sdk is a minor update to the 05.01.01.01 version but inc=
ludes
>>  updates to support the 3.14 kernel.
>>=20
>> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>> ---
>> ...01.01.01.bb =3D> omap3-sgx-modules_5.01.01.02.bb} |   12 ++++--------
>> .../rc.pvr                                         |    0
>> .../rc_dri.pvr                                     |    0
>> ...3_5.01.01.01.bb =3D> libgles-omap3_5.01.01.02.bb} |    6 +++---
>> 4 files changed, 7 insertions(+), 11 deletions(-)
>> copy recipes-bsp/powervr-drivers/{omap3-sgx-modules_5.01.01.01.bb =3D> o=
map3-sgx-modules_5.01.01.02.bb} (77%)
>> copy recipes-graphics/libgles/{libgles-omap3-5.01.01.01 =3D> libgles-oma=
p3-5.01.01.02}/rc.pvr (100%)
>> copy recipes-graphics/libgles/{libgles-omap3-5.01.01.01 =3D> libgles-oma=
p3-5.01.01.02}/rc_dri.pvr (100%)
>> copy recipes-graphics/libgles/{libgles-omap3_5.01.01.01.bb =3D> libgles-=
omap3_5.01.01.02.bb} (89%)
>>=20
>> diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.01.bb=
 b/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.02.bb
>> similarity index 77%
>> copy from recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.01.bb
>> copy to recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.02.bb
>> index a1d95bf..6a07d4f 100644
>> --- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.01.bb
>> +++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.02.bb
>> @@ -5,17 +5,17 @@ LIC_FILES_CHKSUM =3D "file://GPL-COPYING;md5=3D6042292=
8ba677faaa13d6ab5f5baaa1e"
>> TI_BIN_UNPK_CMDS=3D"Y: qY:workdir:Y"
>> require ../../recipes-ti/includes/ti-eula-unpack.inc
>>=20
>> -SGXPV =3D "5_01_01_01"
>> +SGXPV =3D "5_01_01_02"
>> IMGPV =3D "1.10.2359475"
>>=20
>> inherit module
>>=20
>> -MACHINE_KERNEL_PR_append =3D "c"
>> +MACHINE_KERNEL_PR_append =3D "a"
>> PR =3D "${MACHINE_KERNEL_PR}"
>>=20
>> BINFILE_HARDFP =3D "Graphics_SDK_setuplinux_hardfp_${SGXPV}.bin"
>> -MD5SUM_HARDFP =3D "94acdbd20152c905939c2448d5e80a72"
>> -SHA256SUM_HARDFP =3D "7f647bf45a5ce8ba9aaa28c4afe85fced4275f9a4567a1886=
d4460b76c9051ae"
>> +MD5SUM_HARDFP =3D "94bcb31ea7eb50df1dfa4037055b638e"
>> +SHA256SUM_HARDFP =3D "54641222cdb49b03f996cbd6412de227198d9e084f5647d70=
6bbf4217e8cdb07"
>>=20
>> # For now we only have hardfp version
>> python __anonymous() {
>> @@ -33,10 +33,6 @@ BINFILE :=3D "${BINFILE_HARDFP}"
>>=20
>> SRC_URI =3D "http://software-dl.ti.com/dsps/dsps_public_sw/gfxsdk/${SGXP=
V}/exports/${BINFILE}"
>>=20
>> -SRC_URI +=3D "file://0001-PoC-GFX-SDK-Make-5_01_01_01-work-against-3.14=
-LTS.patch;striplevel=3D2 \
>> -            file://0002-SGX-linux-use-platform-data-to-provide-reset-in=
fo.patch;striplevel=3D2 \
>> -            file://0003-SGX-displayclass-am335x-am437x-fix-mutex-deadlo=
ck-wa.patch;striplevel=3D2 \
>> -            file://0004-SGX-linux-make-it-building-against-ti-linux-3.1=
4.y.patch;striplevel=3D2"
>=20
> All 4 patches were integrated into 5.1.1.2?
>=20
Yup
>=20
>> SRC_URI[md5sum] :=3D "${MD5SUM_HARDFP}"
>> SRC_URI[sha256sum] :=3D "${SHA256SUM_HARDFP}"
>> diff --git a/recipes-graphics/libgles/libgles-omap3-5.01.01.01/rc.pvr b/=
recipes-graphics/libgles/libgles-omap3-5.01.01.02/rc.pvr
>> similarity index 100%
>> copy from recipes-graphics/libgles/libgles-omap3-5.01.01.01/rc.pvr
>> copy to recipes-graphics/libgles/libgles-omap3-5.01.01.02/rc.pvr
>> diff --git a/recipes-graphics/libgles/libgles-omap3-5.01.01.01/rc_dri.pv=
r b/recipes-graphics/libgles/libgles-omap3-5.01.01.02/rc_dri.pvr
>> similarity index 100%
>> copy from recipes-graphics/libgles/libgles-omap3-5.01.01.01/rc_dri.pvr
>> copy to recipes-graphics/libgles/libgles-omap3-5.01.01.02/rc_dri.pvr
>> diff --git a/recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb b/reci=
pes-graphics/libgles/libgles-omap3_5.01.01.02.bb
>> similarity index 89%
>> copy from recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb
>> copy to recipes-graphics/libgles/libgles-omap3_5.01.01.02.bb
>> index 0b1b8ca..61a3395 100644
>> --- a/recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb
>> +++ b/recipes-graphics/libgles/libgles-omap3_5.01.01.02.bb
>> @@ -13,14 +13,14 @@ BINLOCATION_ti43x =3D "${S}/gfx_rel_es9.x"
>> PLATFORM =3D "LinuxARMV7"
>> PVR_INIT =3D "pvrsrvctl"
>>=20
>> -SGXPV =3D "5_01_01_01"
>> +SGXPV =3D "5_01_01_02"
>> IMGPV =3D "1.10.2359475"
>>=20
>> TI_BIN_UNPK_WDEXT :=3D "/Graphics_SDK_${SGXPV}"
>>=20
>> BINFILE_HARDFP =3D "Graphics_SDK_setuplinux_hardfp_${SGXPV}.bin"
>> -MD5SUM_HARDFP =3D "94acdbd20152c905939c2448d5e80a72"
>> -SHA256SUM_HARDFP =3D "7f647bf45a5ce8ba9aaa28c4afe85fced4275f9a4567a1886=
d4460b76c9051ae"
>> +MD5SUM_HARDFP =3D "94bcb31ea7eb50df1dfa4037055b638e"
>> +SHA256SUM_HARDFP =3D "54641222cdb49b03f996cbd6412de227198d9e084f5647d70=
6bbf4217e8cdb07"
>>=20
>> # For now we only have hardfp version
>> python __anonymous() {
>> --=20
>> 1.7.9.5
>>=20
>> --=20
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti

