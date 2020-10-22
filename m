Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.3321.1603328189099625549
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Oct 2020 17:56:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=gj5lrIBD;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: s-anna@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id C5AE638C1143
	for <meta-ti@yoctoproject.org>; Wed, 21 Oct 2020 17:56:28 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09M0uRX1073883
	for <meta-ti@yoctoproject.org>; Wed, 21 Oct 2020 19:56:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603328187;
	bh=5vTDiGEMmAXys1xkRKCRDCRyc/co57qlD4WHWxl81f0=;
	h=From:To:CC:Subject:Date;
	b=gj5lrIBDec1PKqyNbg8eLA0lioK+FFNAu3IG7sNAfWe95Lf4+ciTtI5Z5Gjf1tiDm
	 sQLytbXQSw3OAq1Pxxah7PYKwGxhZwJFcI22zjn1Qc9YlgdulZ1g8uqtqVoPHNtBOr
	 MPfsVMaUfgEca60ie2EMAPXmAkXhfTNWq9yTXX6w=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09M0uRxH065797
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 21 Oct 2020 19:56:27 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 21
 Oct 2020 19:56:27 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 21 Oct 2020 19:56:27 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09M0uR9Y020497;
	Wed, 21 Oct 2020 19:56:27 -0500
Received: from localhost ([10.250.39.72])
	by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 09M0uRUv093445;
	Wed, 21 Oct 2020 19:56:27 -0500
From: "Suman Anna" <s-anna@ti.com>
To: Denys Dmytriyenko <denys@ti.com>, Dan Murphy <dmurphy@ti.com>
CC: <meta-ti@yoctoproject.org>, Suman Anna <s-anna@ti.com>,
        Gowtham Tammana
	<g-tammana@ti.com>
Subject: [dunfell/master PATCH v2] ipc: ti-rpmsg-char: Add initial recipes
Date: Wed, 21 Oct 2020 19:56:14 -0500
Message-ID: <20201022005614.9344-1-s-anna@ti.com>
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
v2: Addressed review comments from Denys
 - Dropped the DEPENDS and do_compile depends from ti-rpmsg-char_git.bb
 - Dropped the RDEPENDS from ti-rpmsg-char-examples_git.bb
 - Eliminated the TI_RPMSG_CHAR_GIT_xxx variables and redirection =20
 - Replaced DESCRIPTION with SUMMARY

 recipes-ti/ipc/ti-rpmsg-char-examples_git.bb | 11 +++++++++++
 recipes-ti/ipc/ti-rpmsg-char.inc             | 15 +++++++++++++++
 recipes-ti/ipc/ti-rpmsg-char_git.bb          |  7 +++++++
 3 files changed, 33 insertions(+)
 create mode 100644 recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
 create mode 100644 recipes-ti/ipc/ti-rpmsg-char.inc
 create mode 100644 recipes-ti/ipc/ti-rpmsg-char_git.bb

diff --git a/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb b/recipes-ti/ip=
c/ti-rpmsg-char-examples_git.bb
new file mode 100644
index 000000000000..142e5bf07ad7
--- /dev/null
+++ b/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
@@ -0,0 +1,11 @@
+SUMMARY =3D "TI RPMsg Char Sample Applications and Tests"
+
+require ti-rpmsg-char.inc
+
+DEPENDS =3D "ti-rpmsg-char"
+
+inherit autotools pkgconfig
+
+EXTRA_OEMAKE =3D "-C ${B}/examples"
+
+PR =3D "r0"
diff --git a/recipes-ti/ipc/ti-rpmsg-char.inc b/recipes-ti/ipc/ti-rpmsg-c=
har.inc
new file mode 100644
index 000000000000..b41e68eba0f9
--- /dev/null
+++ b/recipes-ti/ipc/ti-rpmsg-char.inc
@@ -0,0 +1,15 @@
+SUMMARY =3D "TI RPMsg Char Utility Library"
+
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://${S}/src/rpmsg_char.c;beginline=3D1;endline=
=3D31;md5=3D71987db43a2159cff5ea00505c6fce58"
+
+PROTOCOL =3D "git"
+BRANCH =3D "master"
+SRC_URI =3D "git://git.ti.com/rpmsg/ti-rpmsg-char.git;protocol=3D${PROTO=
COL};branch=3D${BRANCH};"
+
+# Initial 0.1.0 release
+SRCREV =3D "9be402c2bf4053900b6b9a8092fbb42e7e303108"
+
+PV =3D "0.1.0+git${SRCPV}"
+
+S =3D "${WORKDIR}/git"
diff --git a/recipes-ti/ipc/ti-rpmsg-char_git.bb b/recipes-ti/ipc/ti-rpms=
g-char_git.bb
new file mode 100644
index 000000000000..63711a3b35dd
--- /dev/null
+++ b/recipes-ti/ipc/ti-rpmsg-char_git.bb
@@ -0,0 +1,7 @@
+SUMMARY =3D "TI RPMsg Char Utility Library"
+
+require ti-rpmsg-char.inc
+
+inherit autotools pkgconfig
+
+PR =3D "r0"
--=20
2.28.0

