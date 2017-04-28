Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 87BCAE009CE; Fri, 28 Apr 2017 12:20:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 360D9E009A5
	for <meta-ti@yoctoproject.org>; Fri, 28 Apr 2017 12:20:39 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3SJKd6b025379
	for <meta-ti@yoctoproject.org>; Fri, 28 Apr 2017 14:20:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493407239;
	bh=oFI0wlDA/WG48DWLZH2b6mGE+dQAsHu+O0/h0vASwlQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=UCQizf4HEEUjd/BtpwrasqWMXc/jgPk2jyK0nF3wBg4PSjbd7Oskmdda9QXzfKYdu
	t4HjUmhI6hyL5F2bPIuG9FU0fJKpuyJR+nBy8jHYEe+dlD9DQ5BGJEAV9RTKqs0gF5
	HWEs0E8yD7lJAd9Pn/HKx5AXJBg8M1OU/fCpdyWc=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3SJKc4e022347
	for <meta-ti@yoctoproject.org>; Fri, 28 Apr 2017 14:20:39 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0294.000; Fri, 28 Apr 2017 14:20:38 -0500
From: "Sobota, Justin" <jsobota@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [master/morty][PATCH 8/8] Update to version 1.0.0.4B
Thread-Index: AQHSwEtFoReZLtGx30CkUh7M8tcEdqHbKGWw
Date: Fri, 28 Apr 2017 19:20:38 +0000
Message-ID: <311ECDE3E284F649854AED0B108A0CE14C092D3D@DFLE12.ent.ti.com>
References: <1493395920-21543-1-git-send-email-jsobota@ti.com>
	<1493395920-21543-8-git-send-email-jsobota@ti.com>
	<20170428181426.GM31608@edge>
In-Reply-To: <20170428181426.GM31608@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [master/morty][PATCH 8/8] Update to version 1.0.0.4B
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
X-List-Received-Date: Fri, 28 Apr 2017 19:20:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes, skip please.

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Friday, April 28, 2017 2:14 PM
To: Sobota, Justin
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [master/morty][PATCH 8/8] Update to version 1.0.0.4B

Justin,

I assume I should skip this one, since you sent it separately with correct =
subject.


On Fri, Apr 28, 2017 at 12:12:00PM -0400, Justin Sobota wrote:
> - Add dra7xx support
> - Add pruss firmware makefiles
>=20
> Signed-off-by: Justin Sobota <jsobota@ti.com>
> ---
>  recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb | 44 ++++++++++++++++++=
++----
>  1 file changed, 37 insertions(+), 7 deletions(-)
>=20
> diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb b/recipes-t=
i/ti-pdk-build/ti-pdk-build-rtos_git.bb
> index 73ed092..4e6ba96 100644
> --- a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> +++ b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> @@ -4,15 +4,15 @@ LIC_FILES_CHKSUM =3D "file://makerules/env.mk;beginline=
=3D1;endline=3D31;md5=3D10503e8de
> =20
>  require recipes-ti/includes/ti-paths.inc
> =20
> -PV =3D "01.00.00.03"
> +PV =3D "01.00.00.04B"
>  PR =3D "r0"
> =20
>  PDK_BUILD_GIT_URI =3D "git://git.ti.com/keystone-rtos/processor-pdk-buil=
d.git"
>  PDK_BUILD_GIT_PROTOCOL =3D "git"
>  PDK_BUILD_GIT_BRANCH =3D "master"
> =20
> -# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.03"
> -PDK_BUILD_SRCREV =3D "487845b835b54d97f2d2f47ee1d0d88784e7e9ca"
> +# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.04B"
> +PDK_BUILD_SRCREV =3D "98b62506c451304252c7cd1e6af60dd11adc588a"
> =20
>  BRANCH =3D "${PDK_BUILD_GIT_BRANCH}"
>  SRC_URI =3D "${PDK_BUILD_GIT_URI};protocol=3D${PDK_BUILD_GIT_PROTOCOL};b=
ranch=3D${BRANCH}"
> @@ -36,9 +36,6 @@ do_install() {
>      install -m 0755 Rules.make ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti=
/build
>      install -m 0755 comp_top.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/t=
i/build
> =20
> -    sed -i -e "s|c\:/ti/ccsv5/utils/cygwin|\$(XDC_INSTALL_PATH)/bin|g" \
> -        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/Rules.make
> -   =20
>      install -m 0755 makerules/build_config.mk ${D}${PDK_INSTALL_DIR_RECI=
PE}/packages/ti/build/makerules
>      install -m 0755 makerules/common.mk ${D}${PDK_INSTALL_DIR_RECIPE}/pa=
ckages/ti/build/makerules
>      install -m 0755 makerules/component.mk ${D}${PDK_INSTALL_DIR_RECIPE}=
/packages/ti/build/makerules
> @@ -48,29 +45,39 @@ do_install() {
> =20
>  do_install_append_ti33x() {
>      install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am335x
> +    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
> =20
>      install -m 0755 makerules/rules_a8.mk ${D}${PDK_INSTALL_DIR_RECIPE}/=
packages/ti/build/makerules
>      install -m 0755 makerules/rules_a8_extend.mk ${D}${PDK_INSTALL_DIR_R=
ECIPE}/packages/ti/build/makerules
> +    install -m 0755 makerules/rules_pru.mk ${D}${PDK_INSTALL_DIR_RECIPE}=
/packages/ti/build/makerules
> =20
>      install -m 0755 am335x/config_am335x_a8.bld ${D}${PDK_INSTALL_DIR_RE=
CIPE}/packages/ti/build/am335x
> +    install -m 0755 pruss/PRU0_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/=
packages/ti/build/pruss
> +    install -m 0755 pruss/PRU1_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/=
packages/ti/build/pruss
>  }
> =20
>  do_install_append_ti43x() {
>      install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am437x
> +    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
> =20
>      install -m 0755 makerules/rules_a9.mk ${D}${PDK_INSTALL_DIR_RECIPE}/=
packages/ti/build/makerules
> +    install -m 0755 makerules/rules_pru.mk ${D}${PDK_INSTALL_DIR_RECIPE}=
/packages/ti/build/makerules
>     =20
>      install -m 0755 am437x/config_am437x_a9.bld ${D}${PDK_INSTALL_DIR_RE=
CIPE}/packages/ti/build/am437x
> +    install -m 0755 pruss/PRU0_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/=
packages/ti/build/pruss
> +    install -m 0755 pruss/PRU1_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/=
packages/ti/build/pruss
>  }
> =20
> -do_install_append_omap-a15() {
> +do_install_append_am57xx-evm() {
>      install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am571x
>      install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
> +    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
> =20
>      install -m 0755 makerules/rules_66.mk ${D}${PDK_INSTALL_DIR_RECIPE}/=
packages/ti/build/makerules
>      install -m 0755 makerules/rules_a15.mk ${D}${PDK_INSTALL_DIR_RECIPE}=
/packages/ti/build/makerules
>      install -m 0755 makerules/rules_m4.mk ${D}${PDK_INSTALL_DIR_RECIPE}/=
packages/ti/build/makerules
>      install -m 0755 makerules/rules_ti_cgt_arm.mk ${D}${PDK_INSTALL_DIR_=
RECIPE}/packages/ti/build/makerules
> +    install -m 0755 makerules/rules_pru.mk ${D}${PDK_INSTALL_DIR_RECIPE}=
/packages/ti/build/makerules
>     =20
>      install -m 0755 am571x/config_am571x.bld ${D}${PDK_INSTALL_DIR_RECIP=
E}/packages/ti/build/am571x
>      install -m 0755 am571x/config_am571x_c66.bld ${D}${PDK_INSTALL_DIR_R=
ECIPE}/packages/ti/build/am571x
> @@ -80,8 +87,30 @@ do_install_append_omap-a15() {
>      install -m 0755 am572x/config_am572x_c66.bld ${D}${PDK_INSTALL_DIR_R=
ECIPE}/packages/ti/build/am572x
>      install -m 0755 am572x/config_am572x_a15.bld ${D}${PDK_INSTALL_DIR_R=
ECIPE}/packages/ti/build/am572x
>      install -m 0755 am572x/mem_segment_definition_1024mb_bios.xs ${D}${P=
DK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
> +    install -m 0755 pruss/PRU0_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/=
packages/ti/build/pruss
> +    install -m 0755 pruss/PRU1_to_ARM.cmd ${D}${PDK_INSTALL_DIR_RECIPE}/=
packages/ti/build/pruss
>  }
>     =20
> +do_install_append_dra7xx-evm() {
> +    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2xx
> +    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/tda3xx
> +
> +    install -m 0755 makefile ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/b=
uild/
> +
> +    install -m 0755 makerules/rules_66.mk ${D}${PDK_INSTALL_DIR_RECIPE}/=
packages/ti/build/makerules
> +    install -m 0755 makerules/rules_a15.mk ${D}${PDK_INSTALL_DIR_RECIPE}=
/packages/ti/build/makerules
> +    install -m 0755 makerules/rules_m4.mk ${D}${PDK_INSTALL_DIR_RECIPE}/=
packages/ti/build/makerules
> +    install -m 0755 makerules/rules_arp32.mk ${D}${PDK_INSTALL_DIR_RECIP=
E}/packages/ti/build/makerules
> +    install -m 0755 makerules/rules_ti_cgt_arm.mk ${D}${PDK_INSTALL_DIR_=
RECIPE}/packages/ti/build/makerules
> +
> +    install -m 0755 tda2xx/config_tda2xx.bld ${D}${PDK_INSTALL_DIR_RECIP=
E}/packages/ti/build/tda2xx
> +    install -m 0755 tda2xx/config_tda2xx_a15.bld ${D}${PDK_INSTALL_DIR_R=
ECIPE}/packages/ti/build/tda2xx
> +    install -m 0755 tda2xx/config_tda2xx_c66.bld ${D}${PDK_INSTALL_DIR_R=
ECIPE}/packages/ti/build/tda2xx
> +    install -m 0755 tda2xx/mem_segment_definition_1024mb_bios.xs ${D}${P=
DK_INSTALL_DIR_RECIPE}/packages/ti/build/tda2xx
> +    install -m 0755 tda3xx/config_tda3xx.bld ${D}${PDK_INSTALL_DIR_RECIP=
E}/packages/ti/build/tda3xx
> +    install -m 0755 tda3xx/config_tda3xx_c66.bld ${D}${PDK_INSTALL_DIR_R=
ECIPE}/packages/ti/build/tda3xx
> +}
> +
>  do_install_append_keystone() {
>      install -m 0755 makerules/rules_66.mk ${D}${PDK_INSTALL_DIR_RECIPE}/=
packages/ti/build/makerules
>      install -m 0755 makerules/rules_a15.mk ${D}${PDK_INSTALL_DIR_RECIPE}=
/packages/ti/build/makerules
> @@ -91,6 +120,7 @@ do_install_append_k2g-evm() {
>      install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/k2g
> =20
>      install -m 0755 k2g/config_k2g_a15.bld ${D}${PDK_INSTALL_DIR_RECIPE}=
/packages/ti/build/k2g
> +    install -m 0755 k2g/config_k2g_c66.bld ${D}${PDK_INSTALL_DIR_RECIPE}=
/packages/ti/build/k2g
>  }
> =20
>  FILES_${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages/*"
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

