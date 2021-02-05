Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.504.1612549697439956959
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Feb 2021 10:28:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=trXlth0H;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 1C24638C06BB
	for <meta-ti@yoctoproject.org>; Fri,  5 Feb 2021 18:28:17 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 115ISGXr084844
	for <meta-ti@yoctoproject.org>; Fri, 5 Feb 2021 12:28:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1612549696;
	bh=hBmObCrmZ67N9LwfykP8EPqL4/TQKvFIDj5sW41hRsw=;
	h=From:To:CC:Subject:Date;
	b=trXlth0HuwlaT+FwNlKQLLzjSD/ieS2cH/Xzzo5oJRs9SQt51ZDG/xPPXiu4ZHiaZ
	 P1xfYPO5IsbB6Asi1f1wRei4ARfKay+s8cdkouNiKRyN88ddVtBQuoiogn/SeIWdPU
	 Ehhm3yWTxw0nRV4bqlZo2X4W+jbBVCR8ex2+tRe8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 115ISG9k074002
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 5 Feb 2021 12:28:16 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 5 Feb
 2021 12:28:15 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 5 Feb 2021 12:28:16 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 115ISFvB106494;
	Fri, 5 Feb 2021 12:28:15 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>, <praneeth@ti.com>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [dunfell/master] [PATCH] Revert "arago-dunfell-next: Temporarily redirect meta-openembedded"
Date: Fri, 5 Feb 2021 12:28:10 -0600
Message-ID: <20210205182810.31292-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

This reverts commit 99f72a0bd64e3f7e0d395a0bb5c26017d745a185.
This re-direct does not need to be done now that the fix for the mariadb
has been merged in dunfell branch.

From: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 configs/arago-dunfell-next-config.txt | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/configs/arago-dunfell-next-config.txt b/configs/arago-dunfel=
l-next-config.txt
index 14e6fa8c9d6a..8d629c4bf42d 100644
--- a/configs/arago-dunfell-next-config.txt
+++ b/configs/arago-dunfell-next-config.txt
@@ -6,8 +6,7 @@ meta-arago,git://arago-project.org/git/meta-arago.git,dun=
fell-next,HEAD,layers=3Dm
 #meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef=
0f842ba4651efe88787cf9c63bc8b6cb3,layers=3D
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=3D
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfe=
ll,HEAD,layers=3D
-#meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,=
HEAD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesys=
tems
-meta-openembedded,ssh://git@bitbucket.itg.ti.com/coresdk_pub/meta-openem=
bedded.git,dunfell,HEAD,layers=3Dmeta-networking:meta-python:meta-oe:meta=
-gnome:meta-filesystems
+meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,H=
EAD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesyst=
ems
 meta-ti,git://git.yoctoproject.org/meta-ti,dunfell-next,HEAD,layers=3D
 meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b=
08b553af8206372e90a63,layers=3Dmeta-arm:meta-arm-toolchain
 oe-core,git://git.openembedded.org/openembedded-core,dunfell,HEAD,layers=
=3Dmeta
--=20
2.29.2

