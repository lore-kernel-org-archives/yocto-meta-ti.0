Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D6583E0173A
	for <meta-ti@yoctoproject.org>; Mon, 21 Oct 2013 07:32:12 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9LEWBZi018236
	for <meta-ti@yoctoproject.org>; Mon, 21 Oct 2013 09:32:11 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9LEWBsZ031361
	for <meta-ti@yoctoproject.org>; Mon, 21 Oct 2013 09:32:11 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Mon, 21 Oct 2013 09:32:10 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCHv4] abefw: Firmware for OMAP4 and OMAP5 ABE
Thread-Index: AQHOzl1i9p4B91YvgUurQHW08PYyZ5n/N+Yw
Date: Mon, 21 Oct 2013 14:32:10 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101597CA8AF@DLEE11.ent.ti.com>
References: <20131021125923.GA6037@ti.com>
In-Reply-To: <20131021125923.GA6037@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCHv4] abefw: Firmware for OMAP4 and OMAP5 ABE
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
X-List-Received-Date: Mon, 21 Oct 2013 14:32:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>


>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Hingolikar, Mrinmayee
>Sent: Monday, October 21, 2013 7:59 AM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCHv4] abefw: Firmware for OMAP4 and OMAP5
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
> v4:
> * Added conditional assignment (?=3D) for SRCREV
>---
> recipes-bsp/abefw/abefw_1.0.14.bb |   23 +++++++++++++++++++++++
> 1 file changed, 23 insertions(+)
> create mode 100644 recipes-bsp/abefw/abefw_1.0.14.bb
>
>diff --git a/recipes-bsp/abefw/abefw_1.0.14.bb b/recipes-
>bsp/abefw/abefw_1.0.14.bb
>new file mode 100644
>index 0000000..834e5d8
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
>+SRCREV ?=3D "ceccc0332264e39bdc51e54f80ea7256a3886c58"
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

