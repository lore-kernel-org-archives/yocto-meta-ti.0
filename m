Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0F5F2E006D8; Thu, 20 Oct 2016 08:26:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 76598E004F1
	for <meta-ti@yoctoproject.org>; Thu, 20 Oct 2016 08:26:44 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u9KFQhFi025395
	for <meta-ti@yoctoproject.org>; Thu, 20 Oct 2016 10:26:43 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9KFQhWw006905
	for <meta-ti@yoctoproject.org>; Thu, 20 Oct 2016 10:26:43 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0294.000; Thu, 20 Oct 2016 10:26:43 -0500
From: "Sobota, Justin" <jsobota@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [master/krogoth][PATCH 5/5] ti-xdctools: Upgrade to version
	3.32.1.22
Thread-Index: AQHSJLGY8elSpuc6gkCKB+I5PwvQaqCxgrwg
Date: Thu, 20 Oct 2016 15:26:42 +0000
Message-ID: <311ECDE3E284F649854AED0B108A0CE13AFE6FF4@DFLE12.ent.ti.com>
References: <1476294829-27885-1-git-send-email-jsobota@ti.com>
	<1476294829-27885-5-git-send-email-jsobota@ti.com>
In-Reply-To: <1476294829-27885-5-git-send-email-jsobota@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [master/krogoth][PATCH 5/5] ti-xdctools: Upgrade to version 3.32.1.22
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
X-List-Received-Date: Thu, 20 Oct 2016 15:26:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

An issue was found after upgrading to this component.  This patch should no=
t be applied.

Justin

-----Original Message-----
From: Sobota, Justin=20
Sent: Wednesday, October 12, 2016 1:54 PM
To: meta-ti@yoctoproject.org
Cc: Sobota, Justin
Subject: [master/krogoth][PATCH 5/5] ti-xdctools: Upgrade to version 3.32.1=
.22

Signed-off-by: Justin Sobota <jsobota@ti.com>
---
 .../{ti-xdctools_3.32.00.06.bb =3D> ti-xdctools_3.32.01.22.bb}     |    6 =
+++---
 1 file changed, 3 insertions(+), 3 deletions(-)  rename recipes-ti/devtool=
s/{ti-xdctools_3.32.00.06.bb =3D> ti-xdctools_3.32.01.22.bb} (51%)

diff --git a/recipes-ti/devtools/ti-xdctools_3.32.00.06.bb b/recipes-ti/dev=
tools/ti-xdctools_3.32.01.22.bb
similarity index 51%
rename from recipes-ti/devtools/ti-xdctools_3.32.00.06.bb
rename to recipes-ti/devtools/ti-xdctools_3.32.01.22.bb
index 19bbe5d..5f379c1 100644
--- a/recipes-ti/devtools/ti-xdctools_3.32.00.06.bb
+++ b/recipes-ti/devtools/ti-xdctools_3.32.01.22.bb
@@ -1,9 +1,9 @@
 require recipes-ti/devtools/ti-xdctools-core.inc
=20
-PV =3D "3_32_00_06"
+PV =3D "3_32_01_22"
 PR =3D "r0"
=20
 LIC_FILES_CHKSUM =3D "file://docs/license/xdc/shelf/package.html;beginline=
=3D1;endline=3D140;md5=3D1796f68c3d32d408415f5612f1f60652"
=20
-SRC_URI[xdczip.md5sum] =3D "93127f4c2f35d94b6c8e5a52b79c38ae"
-SRC_URI[xdczip.sha256sum] =3D "d6f38a7f846ae4b1478554d75fc5f72cf677a1e2f34=
8e214a725d1e849bd39c7"
+SRC_URI[xdczip.md5sum] =3D "ddae5b765ca62783c1e804c75c463c38"
+SRC_URI[xdczip.sha256sum] =3D "b1c6620ef0b8eac45ef6a587f93b3238bdcf3b02dfd=
7e4b40d872a45c02c5cdc"
--
1.7.10.4


