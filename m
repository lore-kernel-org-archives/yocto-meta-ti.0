Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.12202.1603288587880685432
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Oct 2020 06:56:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=ISuL933h;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: s-anna@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 3C81538C08AF
	for <meta-ti@yoctoproject.org>; Wed, 21 Oct 2020 06:56:27 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09LDuQok075799
	for <meta-ti@yoctoproject.org>; Wed, 21 Oct 2020 08:56:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603288586;
	bh=woVs0GeqE7YGv7owSiGSdPGn8TE26tFaByLo9c+sIwY=;
	h=From:To:CC:Subject:Date;
	b=ISuL933hBEzSFHCJOrDln9ZW/RvDyV4B8X7DiAjOCG91ywS3NjQn6QRzaDdCs2vvM
	 OeRIzNdv2raYNFXVAM1nrYeXVrirVT7fG5ZKmu757UUIPMsNt0CLkzfiESNMwRkI2x
	 DZKSK3lE9UuL7XFz6wVQRLiRQxyMxLHRhuL2SZKM=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09LDuQjE052877
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 21 Oct 2020 08:56:26 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 21
 Oct 2020 08:56:25 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 21 Oct 2020 08:56:25 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09LDuPWt068492;
	Wed, 21 Oct 2020 08:56:25 -0500
Received: from localhost ([10.250.67.220])
	by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 09LDuPPq019527;
	Wed, 21 Oct 2020 08:56:25 -0500
From: "Suman Anna" <s-anna@ti.com>
To: Denys Dmytriyenko <denys@ti.com>, Dan Murphy <dmurphy@ti.com>
CC: <meta-ti@yoctoproject.org>, Suman Anna <s-anna@ti.com>,
        Gowtham Tammana
	<g-tammana@ti.com>
Subject: [dunfell/master PATCH] ipc: ti-rpmsg-char: Add initial recipes
Date: Wed, 21 Oct 2020 08:56:21 -0500
Message-ID: <20201021135621.5073-1-s-anna@ti.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Add the initial recipes for building the ti-rpmsg-char package.
The library and examples are built using two separate recipes
in ti-rpmsg-char_git.bb and ti-rpmsg-char-examples_git.bb.

Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 recipes-ti/ipc/ti-rpmsg-char-examples_git.bb | 12 ++++++++++++
 recipes-ti/ipc/ti-rpmsg-char.inc             | 19 +++++++++++++++++++
 recipes-ti/ipc/ti-rpmsg-char_git.bb          | 11 +++++++++++
 3 files changed, 42 insertions(+)
 create mode 100644 recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
 create mode 100644 recipes-ti/ipc/ti-rpmsg-char.inc
 create mode 100644 recipes-ti/ipc/ti-rpmsg-char_git.bb

diff --git a/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb b/recipes-ti/ip=
c/ti-rpmsg-char-examples_git.bb
new file mode 100644
index 000000000000..1d86e95526cc
--- /dev/null
+++ b/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
@@ -0,0 +1,12 @@
+DESCRIPTION =3D "TI RPMsg Char Sample Applications and Tests"
+
+require ti-rpmsg-char.inc
+
+DEPENDS =3D "ti-rpmsg-char"
+RDEPENDS_${PN} =3D "ti-rpmsg-char"
+
+inherit autotools pkgconfig
+
+EXTRA_OEMAKE =3D "-C ${B}/examples"
+
+PR =3D "r0"
diff --git a/recipes-ti/ipc/ti-rpmsg-char.inc b/recipes-ti/ipc/ti-rpmsg-c=
har.inc
new file mode 100644
index 000000000000..454deea674b3
--- /dev/null
+++ b/recipes-ti/ipc/ti-rpmsg-char.inc
@@ -0,0 +1,19 @@
+DESCRIPTION =3D "TI RPMsg Char Utility Library"
+
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://${S}/src/rpmsg_char.c;beginline=3D1;endline=
=3D31;md5=3D71987db43a2159cff5ea00505c6fce58"
+
+TI_RPMSG_CHAR_GIT_URI =3D "git://git.ti.com/rpmsg/ti-rpmsg-char.git"
+TI_RPMSG_CHAR_GIT_PROTOCOL =3D "git"
+TI_RPMSG_CHAR_GIT_BRANCH =3D "master"
+
+# Initial 0.1.0 release
+TI_RPMSG_CHAR_SRCREV =3D "9be402c2bf4053900b6b9a8092fbb42e7e303108"
+
+BRANCH =3D "${TI_RPMSG_CHAR_GIT_BRANCH}"
+SRC_URI =3D "${TI_RPMSG_CHAR_GIT_URI};protocol=3D${TI_RPMSG_CHAR_GIT_PRO=
TOCOL};branch=3D${BRANCH};name=3Dti-rpmsg-char"
+SRCREV =3D "${TI_RPMSG_CHAR_SRCREV}"
+
+PV =3D "0.1.0+git${SRCPV}"
+
+S =3D "${WORKDIR}/git"
diff --git a/recipes-ti/ipc/ti-rpmsg-char_git.bb b/recipes-ti/ipc/ti-rpms=
g-char_git.bb
new file mode 100644
index 000000000000..c132a390f301
--- /dev/null
+++ b/recipes-ti/ipc/ti-rpmsg-char_git.bb
@@ -0,0 +1,11 @@
+DESCRIPTION =3D "TI RPMsg Char Utility Library"
+
+require ti-rpmsg-char.inc
+
+DEPENDS +=3D "virtual/kernel"
+
+inherit autotools pkgconfig
+
+do_compile[depends] +=3D "virtual/kernel:do_shared_workdir"
+
+PR =3D "r0"
--=20
2.28.0

