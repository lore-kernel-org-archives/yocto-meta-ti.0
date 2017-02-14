Return-Path: <anandb@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 72C52E00953; Tue, 14 Feb 2017 03:50:39 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00, URI_HEX autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 1.1 URI_HEX URI: URI hostname has long hexadecimal
	sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 196DFE0089D
	for <meta-ti@yoctoproject.org>; Tue, 14 Feb 2017 03:50:37 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v1EBobng001509
	for <meta-ti@yoctoproject.org>; Tue, 14 Feb 2017 05:50:37 -0600
Received: from dbdlxv05.itg.ti.com (dbdlxv05.itg.ti.com [172.24.171.60])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1EBoap0017755
	for <meta-ti@yoctoproject.org>; Tue, 14 Feb 2017 05:50:37 -0600
Received: from DBDE72.ent.ti.com (dbdmailx.itg.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1EBoXeF014699
	for <meta-ti@yoctoproject.org>; Tue, 14 Feb 2017 17:20:35 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.03.0294.000; Tue, 14 Feb 2017 17:20:33 +0530
From: "Balagopalakrishnan, Anand" <anandb@ti.com>
To: "R, Karthik" <karthik.ramanan@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>, "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [krogoth] ti-sgx-ddk-um: enhance wl_display
	validation	criterion
Thread-Index: AQHShej51FnQm+8hP0ibgPRxaTX+vKFoZQEQ
Date: Tue, 14 Feb 2017 11:50:32 +0000
Message-ID: <05CF4794C98B244ABDC620C109037622C03C431A@DBDE04.ent.ti.com>
References: <1486983845-145386-1-git-send-email-a0393906@ti.com>
In-Reply-To: <1486983845-145386-1-git-send-email-a0393906@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.171.114]
MIME-Version: 1.0
Subject: Re: [krogoth] ti-sgx-ddk-um: enhance wl_display validation	criterion
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
X-List-Received-Date: Tue, 14 Feb 2017 11:50:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

This patch is applicable for morty as well. Please pull to both branches.

Regards,
Anand

-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of R, Karthik
Sent: Monday, February 13, 2017 4:34 PM
To: meta-ti@yoctoproject.org
Subject: [meta-ti] [krogoth] ti-sgx-ddk-um: enhance wl_display validation c=
riterion

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb b/recip=
es-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
index b7fd572..79f5ca7 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
@@ -8,7 +8,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 BRANCH =3D "ti-img-sgx/${PV}"
=20
 SRC_URI =3D "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=
=3Dgit;branch=3D${BRANCH}"
-SRCREV =3D "739111e5d67871d08f9d7e643492bee40dce933c"
+SRCREV =3D "6019bf95ee30a65db6b27ea48e6ee65e8b16e0a6"
=20
 # There's only hardfp version available  python __anonymous() { @@ -31,7 +=
31,7 @@ INITSCRIPT_PARAMS =3D "defaults 8"
=20
 inherit update-rc.d
=20
-PR =3D "r19"
+PR =3D "r20"
 PROVIDES +=3D "virtual/egl virtual/libgles1 virtual/libgles2 omap5-sgx-ddk=
-um-linux"
=20
 DEPENDS +=3D "libdrm udev libgbm wayland libffi"
--
1.9.1

--
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

