Return-Path: <m-karicheri2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 41CDCE00C0B; Tue, 26 Jan 2016 17:05:31 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 17966E00C05
	for <meta-ti@yoctoproject.org>; Tue, 26 Jan 2016 17:05:29 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0R15R9e023182;
	Tue, 26 Jan 2016 19:05:27 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0R15QAs021920;
	Tue, 26 Jan 2016 19:05:26 -0600
Received: from DFLE11.ent.ti.com ([fe80::56d:4651:6f4f:2245]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Tue, 26 Jan 2016 19:05:26 -0600
From: "Karicheri, Muralidharan" <m-karicheri2@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>, "Andrianov, Vitaly" <vitalya@ti.com>, "Ruei,
	Eric" <e-ruei1@ti.com>
Thread-Topic: [meta-ti] [PATCH] netcp-sa-fw: add initial version 1.0.0
Thread-Index: AQHRWIHPPv164hOHSkWDsxnVgWsPep8Oi0KA
Date: Wed, 27 Jan 2016 01:05:25 +0000
Message-ID: <3E54258959B69E4282D79E01AB1F32B704CED025@DFLE11.ent.ti.com>
References: <1453844240-15572-1-git-send-email-denis@denix.org>
In-Reply-To: <1453844240-15572-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] netcp-sa-fw: add initial version 1.0.0
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
X-List-Received-Date: Wed, 27 Jan 2016 01:05:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Eric, Vitaly,

I think this can cause some potential confusion to customers. Isn't there a=
 SA PDSP firmware as well? If yes, we will have to rename the firmware.
This is not a comment against the recipe itself, but want to avoid any futu=
re confusion.

Murali Karicheri
Linux Kernel, Software Development

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoprojec=
t.org] On
>Behalf Of Denys Dmytriyenko
>Sent: Tuesday, January 26, 2016 4:37 PM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCH] netcp-sa-fw: add initial version 1.0.0
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb | 29
>+++++++++++++++++++++++++++++
> 1 file changed, 29 insertions(+)
> create mode 100644 recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb
>
>diff --git a/recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb b/recipes-bsp/netc=
p-sa-fw/netcp-sa-
>fw_git.bb
>new file mode 100644
>index 0000000..5f07b92
>--- /dev/null
>+++ b/recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb
>@@ -0,0 +1,29 @@
>+DESCRIPTION =3D "NETCP SA firmware for Keystone"
>+
>+LICENSE =3D "TI-TFL"
>+LIC_FILES_CHKSUM =3D "file://LICENCE.ti-
>keystone;md5=3D3a86335d32864b0bef996bee26cc0f2c"
>+
>+PV =3D "1.0.0"
>+PR =3D "r0"
>+
>+CLEANBROKEN =3D "1"
>+
>+COMPATIBLE_MACHINE =3D "keystone"
>+
>+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>+
>+SRCREV =3D "588f602a21c62f90b1f4318b881c80a1e711317a"
>+BRANCH ?=3D "ti-linux-firmware-4.1.y"
>+
>+SRC_URI =3D "git://git.ti.com/processor-firmware/ti-linux-
>firmware.git;protocol=3Dgit;branch=3D${BRANCH}"
>+
>+S =3D "${WORKDIR}/git"
>+
>+TARGET =3D "sa_mci.fw"
>+
>+do_install() {
>+	install -d ${D}${base_libdir}/firmware
>+	install -m 0644 ${S}/ti-keystone/${TARGET}
>${D}${base_libdir}/firmware/${TARGET}
>+}
>+
>+FILES_${PN} =3D "${base_libdir}/firmware"
>--
>2.2.0
>
>--
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

