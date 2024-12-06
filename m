Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A593EE77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 17:28:12 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.42866.1733506091523829550
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 06 Dec 2024 09:28:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=B0UpHb+5;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4B6HSA8Q056545;
	Fri, 6 Dec 2024 11:28:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733506090;
	bh=kV6LNLfJRnTHKPTCfBpdV4tgxVyKvdYITTB63j4r6r4=;
	h=From:To:Subject:Date;
	b=B0UpHb+5SneiQLHNFc0Ra8BmcTXk+xqA7xK75GV4POJeBGh/gkfYQvJAiz2aaMb9m
	 1l9/pqCPrbYmy12hgESchKX2egz7lRfFt5xYHgpz5BVQSOSCJDYlZxEcSp9jeJx5eC
	 5b2CUPu7UChzs0CNfWZ4mlhGrEp7MkYdkGI30Ifk=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B6HSAVT011108
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 6 Dec 2024 11:28:10 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 6
 Dec 2024 11:28:10 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 6 Dec 2024 11:28:10 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B6HSAeu075245;
	Fri, 6 Dec 2024 11:28:10 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tJc7d-00040l-R9; Fri, 06 Dec 2024 11:28:09 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] u-boot: Add patch to use SWIG_AppendOutput
Date: Fri, 6 Dec 2024 11:28:09 -0600
Message-ID: <20241206172809.15378-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 4B6HSA8Q056545
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 06 Dec 2024 17:28:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18089

Swig has changed language specific AppendOutput functions. The helper
macro SWIG_AppendOutput remains unchanged. Use that instead
of SWIG_Python_AppendOutput, which would require an extra parameter
since swig 4.3.0.

This is a port from oe-core:
https://git.openembedded.org/openembedded-core/commit/?id=3D4eae7888e91c7=
c864bf490dee38716267be6202e

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../u-boot/u-boot-ti-staging_2023.04.bb       |  2 +
 .../u-boot/u-boot-ti-staging_2024.04.bb       |  2 +
 .../u-boot/u-boot-ti-staging_2024.10.bb       |  2 +
 ...bfdt-libfdt.i_shipped-Use-SWIG_Appen.patch | 60 +++++++++++++++++++
 4 files changed, 66 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot/0001-scripts-dt=
c-pylibfdt-libfdt.i_shipped-Use-SWIG_Appen.patch

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb =
b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
index 6f974c41..7ef851de 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
@@ -6,4 +6,6 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2023.04"
=20
+SRC_URI +=3D "file://0001-scripts-dtc-pylibfdt-libfdt.i_shipped-Use-SWIG=
_Appen.patch"
+
 SRCREV =3D "0853d7725220d59130d8bcc59d01151cba64ffa0"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb =
b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
index c0eec0b6..171d560b 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
@@ -6,4 +6,6 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2024.04"
=20
+SRC_URI +=3D "file://0001-scripts-dtc-pylibfdt-libfdt.i_shipped-Use-SWIG=
_Appen.patch"
+
 SRCREV =3D "2a7de06d57399e04738573622cbdaa3532e7ab4d"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.10.bb =
b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.10.bb
index 46536877..a2e0934c 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.10.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.10.bb
@@ -8,4 +8,6 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2024.10"
=20
+SRC_URI +=3D "file://0001-scripts-dtc-pylibfdt-libfdt.i_shipped-Use-SWIG=
_Appen.patch"
+
 SRCREV =3D "f919c3a889f0ec7d63a48b5d0ed064386b0980bd"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot/0001-scripts-dtc-pylib=
fdt-libfdt.i_shipped-Use-SWIG_Appen.patch b/meta-ti-bsp/recipes-bsp/u-boo=
t/u-boot/0001-scripts-dtc-pylibfdt-libfdt.i_shipped-Use-SWIG_Appen.patch
new file mode 100644
index 00000000..2eeef99b
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot/0001-scripts-dtc-pylibfdt-lib=
fdt.i_shipped-Use-SWIG_Appen.patch
@@ -0,0 +1,60 @@
+From e093607e9a08e9c29b7bbaa6aeb137036db798a6 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Wed, 30 Oct 2024 05:46:00 +0100
+Subject: [PATCH] scripts/dtc/pylibfdt/libfdt.i_shipped: Use SWIG_AppendO=
utput
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Swig has changed language specific AppendOutput functions. The helper
+macro SWIG_AppendOutput remains unchanged. Use that instead
+of SWIG_Python_AppendOutput, which would require an extra parameter
+since swig 4.3.0.
+
+/home/flk/poky/build-test/tmp/work/qemux86_64-poky-linux/u-boot/2024.10/=
git/arch/x86/cpu/u-boot-64.lds
+| scripts/dtc/pylibfdt/libfdt_wrap.c: In function =E2=80=98_wrap_fdt_nex=
t_node=E2=80=99:
+| scripts/dtc/pylibfdt/libfdt_wrap.c:5581:17: error: too few arguments t=
o function =E2=80=98SWIG_Python_AppendOutput=E2=80=99
+|  5581 |     resultobj =3D SWIG_Python_AppendOutput(resultobj, val);
+|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~
+
+Upstream-Status: Backport [https://github.com/u-boot/u-boot/commit/a6345=
6b9191fae2fe49f4b121e025792022e3950]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ scripts/dtc/pylibfdt/libfdt.i_shipped | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/scripts/dtc/pylibfdt/libfdt.i_shipped b/scripts/dtc/pylibfd=
t/libfdt.i_shipped
+index 56cc5d48f4..e4659489a9 100644
+--- a/scripts/dtc/pylibfdt/libfdt.i_shipped
++++ b/scripts/dtc/pylibfdt/libfdt.i_shipped
+@@ -1037,7 +1037,7 @@ typedef uint32_t fdt32_t;
+ 			fdt_string(fdt1, fdt32_to_cpu($1->nameoff)));
+ 		buff =3D PyByteArray_FromStringAndSize(
+ 			(const char *)($1 + 1), fdt32_to_cpu($1->len));
+-		resultobj =3D SWIG_Python_AppendOutput(resultobj, buff);
++		resultobj =3D SWIG_AppendOutput(resultobj, buff);
+ 	}
+ }
+=20
+@@ -1076,7 +1076,7 @@ typedef uint32_t fdt32_t;
+=20
+ %typemap(argout) int *depth {
+         PyObject *val =3D Py_BuildValue("i", *arg$argnum);
+-        resultobj =3D SWIG_Python_AppendOutput(resultobj, val);
++        resultobj =3D SWIG_AppendOutput(resultobj, val);
+ }
+=20
+ %apply int *depth { int *depth };
+@@ -1092,7 +1092,7 @@ typedef uint32_t fdt32_t;
+            if (PyTuple_GET_SIZE(resultobj) =3D=3D 0)
+               resultobj =3D val;
+            else
+-              resultobj =3D SWIG_Python_AppendOutput(resultobj, val);
++              resultobj =3D SWIG_AppendOutput(resultobj, val);
+         }
+ }
+=20
+--=20
+2.47.0
+
--=20
2.17.1


