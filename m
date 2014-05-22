Return-Path: <chase.maupin@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B28CBE00B68; Thu, 22 May 2014 10:16:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from comal.ext.ti.com (unknown [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 85D52E00975
	for <meta-ti@yoctoproject.org>; Thu, 22 May 2014 10:16:52 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4MHGoPI022224;
	Thu, 22 May 2014 12:16:51 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4MHGo1L003084;
	Thu, 22 May 2014 12:16:50 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Thu, 22 May 2014 12:16:50 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 1/2] omap5-sgx-ddk-um-linux: remove version
	1.9.0.10 as replaced by 1.9.0.12
Thread-Index: AQHPddqRPiDVEuDckUGQBoufDT1Jz5tM13Iw
Date: Thu, 22 May 2014 17:16:49 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D04CCA8@DLEE11.ent.ti.com>
References: <1400775888-23432-1-git-send-email-denis@denix.org>
In-Reply-To: <1400775888-23432-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] omap5-sgx-ddk-um-linux: remove version 1.9.0.10 as replaced by 1.9.0.12
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
X-List-Received-Date: Thu, 22 May 2014 17:16:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
>Sent: Thursday, May 22, 2014 11:25 AM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCH 1/2] omap5-sgx-ddk-um-linux: remove
>version 1.9.0.10 as replaced by 1.9.0.12
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Also version 1.9.0.10 of the recipe doesn't have necessary
>PROVIDES and
>results in conflicts with mesa and other gl/gles providers.
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> .../libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb     | 26 ---------
>-------------
> 1 file changed, 26 deletions(-)
> delete mode 100644 recipes-graphics/libgles/omap5-sgx-ddk-um-
>linux_1.9.0.10.bb
>
>diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-
>linux_1.9.0.10.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-
>linux_1.9.0.10.bb
>deleted file mode 100644
>index 37ca7d8..0000000
>--- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb
>+++ /dev/null
>@@ -1,26 +0,0 @@
>-DESCRIPTION =3D "Userspace libraries for omap5 sgx"
>-HOMEPAGE =3D "http://downloads.ti.com/dsps/dsps_public_sw/gfxsdk"
>-LICENSE =3D "TI-TSPA"
>-LIC_FILES_CHKSUM =3D "file://OMAP5-Linux-Graphics-DDK-UM-
>Manifest.doc;md5=3Dd280df8e94bb2e7b9251c8526078eeb8"
>-
>-COMPATIBLE_MACHINE =3D "omap-a15"
>-
>-INHIBIT_PACKAGE_STRIP =3D "1"
>-
>-SRC_URI =3D
>"http://downloads.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/
>gfxsdk/OMAP5_1_09_00_10//exports/${PN}-${PV}.tar.gz;protocol=3Dhttp"
>-
>-PR =3D "r1"
>-
>-SRC_URI[md5sum] =3D "3cfb875de031098a4c1eeeaf4e442367"
>-SRC_URI[sha256sum] =3D
>"20b849088c0fd3ee5dd6bad8ddf16fb2b3267aa053cf3488c762fbc72f22489a"
>-
>-S =3D "${WORKDIR}/${PN}-${PV}"
>-
>-do_install () {
>-    oe_runmake install DESTDIR=3D${D}
>-}
>-
>-FILES_${PN} +=3D "${libdir}/gbm/"
>-
>-INSANE_SKIP_${PN} =3D "useless-rpaths"
>-INSANE_SKIP_${PN}-dev =3D "useless-rpaths"
>--
>1.9.3
>
>--
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

