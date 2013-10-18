Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7AA52E016E8
	for <meta-ti@yoctoproject.org>; Fri, 18 Oct 2013 05:39:53 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9ICdqmY020708
	for <meta-ti@yoctoproject.org>; Fri, 18 Oct 2013 07:39:52 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9ICdq7A025677
	for <meta-ti@yoctoproject.org>; Fri, 18 Oct 2013 07:39:52 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Fri, 18 Oct 2013 07:39:52 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCHv3] abefw: Firmware for OMAP4 and OMAP5 ABE
Thread-Index: AQHOy/rKHsc2GMw3VkWgh1lWAhkZJZn6Zijw
Date: Fri, 18 Oct 2013 12:39:52 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101597C18F5@DLEE11.ent.ti.com>
References: <20131018120834.GA3408@ti.com>
In-Reply-To: <20131018120834.GA3408@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCHv3] abefw: Firmware for OMAP4 and OMAP5 ABE
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
X-List-Received-Date: Fri, 18 Oct 2013 12:39:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Hingolikar, Mrinmayee
>Sent: Friday, October 18, 2013 7:09 AM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCHv3] abefw: Firmware for OMAP4 and OMAP5
>ABE
>
> * The OMAP5 Audio Backend requires a 'firmware' to enable
>  sound. This recipe installs a prebuilt firmware. This
>  part is a hack, as in the current form, the firmware
>  cannot be cross-compiled. There is a plan to fix this
>  and hopefully, this recipe is short-lived. Once the code
>  is fixed, we should have new recipes that build the firmware
>  and clean up this recipe.
>
> v2:
> * Merged contents from abefw.inc and removed abefw.inc based
>  on review.
>
> v3:
> * Corrected license to BSD or GPLv2
> * Add pandaboard as COMPATIBLE_MACHINE
> * Add PR
>
>Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
>---
> recipes-bsp/abefw/abefw_1.0.14.bb |   23 +++++++++++++++++++++++
> 1 file changed, 23 insertions(+)
> create mode 100644 recipes-bsp/abefw/abefw_1.0.14.bb
>
>diff --git a/recipes-bsp/abefw/abefw_1.0.14.bb b/recipes-
>bsp/abefw/abefw_1.0.14.bb
>new file mode 100644
>index 0000000..302bdcd
>--- /dev/null
>+++ b/recipes-bsp/abefw/abefw_1.0.14.bb
>@@ -0,0 +1,23 @@
>+SUMMARY =3D "Firmware for OMAP4 and OMAP5 ABE"
>+HOMEPAGE =3D "http://git.ti.com"
>+LICENSE =3D "BSD | GPLv2"
>+LIC_FILES_CHKSUM =3D
>"file://COPYING;md5=3D923db086ed9463ab3215b24d87e05ec5"
>+
>+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>+
>+COMPATIBLE_MACHINE =3D "pandaboard|omap5-evm"
>+
>+SRC_URI =3D "git://git.ti.com/glsdk/abefw-
>omap4plus.git;protocol=3Dgit"
>+
>+S =3D "${WORKDIR}/git"
>+
>+SRCREV =3D "ceccc0332264e39bdc51e54f80ea7256a3886c58"

Seems OK but I would like this to be ?=3D

>+
>+PR =3D "r0"
>+
>+do_install() {
>+        mkdir -p ${D}/lib/firmware
>+        cp ${S}/firmware/omap4_abe_new ${D}/lib/firmware/
>+}
>+
>+FILES_${PN} +=3D "/lib/firmware/omap4_abe_new"
>--
>1.7.9.5
>
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

