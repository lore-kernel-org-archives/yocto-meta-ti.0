Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D941C27C79
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 15:56:20 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.15378.1718380571492382565
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 14 Jun 2024 08:56:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8BE1040CCA;
	Fri, 14 Jun 2024 15:56:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NPNTxAnWpRNV; Fri, 14 Jun 2024 15:56:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6E05940CC4;
	Fri, 14 Jun 2024 15:56:09 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id C2154163FA0;
	Fri, 14 Jun 2024 11:56:07 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 1/2] python3-yamllint: remove local copy
Date: Fri, 14 Jun 2024 11:56:05 -0400
Message-Id: <20240614155606.792020-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 14 Jun 2024 15:56:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17734

From: Denys Dmytriyenko <denys@konsulko.com>

This has been accepted to oe-core and is available in scarthgap and newer=
.

This reverts commit e9a56223ed04f9e0874177c5685db37a5eb6ea82.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../python-yamllint/python3-yamllint_1.33.0.bb    | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 meta-ti-extras/recipes-devtools/python-yamllint/pytho=
n3-yamllint_1.33.0.bb

diff --git a/meta-ti-extras/recipes-devtools/python-yamllint/python3-yaml=
lint_1.33.0.bb b/meta-ti-extras/recipes-devtools/python-yamllint/python3-=
yamllint_1.33.0.bb
deleted file mode 100644
index 4b7bd065..00000000
--- a/meta-ti-extras/recipes-devtools/python-yamllint/python3-yamllint_1.=
33.0.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY =3D "A linter for YAML files."
-HOMEPAGE =3D "https://github.com/adrienverge/yamllint"
-LICENSE =3D "GPL-3.0-only"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1ebbd3e34237af26da5dc08a4e440=
464"
-
-inherit pypi setuptools3
-
-PYPI_PACKAGE =3D "yamllint"
-
-SRC_URI[sha256sum] =3D "2dceab9ef2d99518a2fcf4ffc964d44250ac4459be1ba3ca=
315118e4a1a81f7d"
-
-DEPENDS +=3D "${PYTHON_PN}-setuptools-scm-native"
-RDEPENDS:${PN} +=3D "${PYTHON_PN}-pyyaml"
-
-BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


