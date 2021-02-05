Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.431.1612549446934731480
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Feb 2021 10:24:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=AjFKYaE9;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 9FFC238C06BB
	for <meta-ti@yoctoproject.org>; Fri,  5 Feb 2021 18:24:05 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 115IO3Ho067619
	for <meta-ti@yoctoproject.org>; Fri, 5 Feb 2021 12:24:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1612549443;
	bh=i4hKwm4EmNDH4qzXX/EP2Hgk+o97eGuAq17pqVaoNic=;
	h=From:To:CC:Subject:Date;
	b=AjFKYaE9Uw1gsdOCfiyQInrgDbzUrDIFNByIQi0810CBX94Li+zyq2c09PHDTVJRU
	 URrs5gArD0HLgeb+AN38b98comT1BK/jeP7yaumRCT+oGoLOHKgsjhG01AR0g3Fm7J
	 1TyATC7UPhBIZa5A1/cV+xm23BbAHaBfyd2hM7J4=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 115IO32h090020
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 5 Feb 2021 12:24:03 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 5 Feb
 2021 12:24:03 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 5 Feb 2021 12:24:03 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 115IO3id101713;
	Fri, 5 Feb 2021 12:24:03 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [dunfell/master] [PATCH] Revert "arago-dunfell: Pin all layers to last known good build SHA"
Date: Fri, 5 Feb 2021 12:24:02 -0600
Message-ID: <20210205182402.30630-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

This reverts commit 3e3b838e5cee047251fa97842509de70d1d5b42f.
The build issue for the mariadb has been resolved upstream so revert
this commit.

From: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 configs/arago-dunfell-config.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/arago-dunfell-config.txt b/configs/arago-dunfell-con=
fig.txt
index b82c0d79f306..b45ee3e026df 100644
--- a/configs/arago-dunfell-config.txt
+++ b/configs/arago-dunfell-config.txt
@@ -4,11 +4,11 @@
 bitbake,git://git.openembedded.org/bitbake,1.46,HEAD
 meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,HEAD,layer=
s=3Dmeta-arago-distro:meta-arago-extras
 #meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef=
0f842ba4651efe88787cf9c63bc8b6cb3,layers=3D
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,0d8eb956015acdea=
7e77cd6672d08dce18061510,layers=3D
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfe=
ll,92cd3467502bd27b98a76862ca6525ce425a8479,layers=3D
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,f=
2d02cb71eaff8eb285a1997b30be52486c160ae,layers=3Dmeta-networking:meta-pyt=
hon:meta-oe:meta-gnome:meta-filesystems
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=3D
+meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfe=
ll,HEAD,layers=3D
+meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,H=
EAD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesyst=
ems
 meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,HEAD,layers=3D
 meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b=
08b553af8206372e90a63,layers=3Dmeta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,72431ee8de5=
e3a53d259cebf420a7713ac9e1f14,layers=3Dmeta
+oe-core,git://git.openembedded.org/openembedded-core,dunfell,HEAD,layers=
=3Dmeta
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
 OECORELOCALCONF=3D./sample-files/local-arago64.conf.sample
--=20
2.29.2

