Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.8943.1645503246022794346
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:14:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A438540C86
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kr4-4j3UMxTS for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:14:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8D95840C88
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:02 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 60E3217476D
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:14:02 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 11/17] meta-ti: move beaglebone-specific components to meta-ti-extras
Date: Tue, 22 Feb 2022 04:13:55 +0000
Message-Id: <20220222041401.2840172-12-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041401.2840172-1-denis@denix.org>
References: <20220222041401.2840172-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

Move beagleboard.org beaglebone componentns to meta-ti-extras.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-ti/beagleboard/beaglebone-capes.bb                    | 0
 .../recipes-ti/beagleboard/beaglebone-capes/cape-stop.sh          | 0
 .../recipes-ti/beagleboard/beaglebone-capes/cape.service          | 0
 .../recipes-ti/beagleboard/beaglebone-capes/cape.sh               | 0
 .../recipes-ti/beagleboard/beaglebone-getting-started.bb          | 0
 .../recipes-ti/beagleboard/gadget-init.bb                         | 0
 .../recipes-ti/beagleboard/gadget-init/bone-gmass-eject.rules     | 0
 .../recipes-ti/beagleboard/gadget-init/g-ether-load.sh            | 0
 .../recipes-ti/beagleboard/gadget-init/g-ether-start-service.sh   | 0
 .../recipes-ti/beagleboard/gadget-init/g-storage-reinsert.sh      | 0
 .../beagleboard/gadget-init/network-gadget-init.service           | 0
 .../beagleboard/gadget-init/storage-gadget-init.service           | 0
 .../recipes-ti/beagleboard/gadget-init/udhcpd.conf                | 0
 .../recipes-ti/beagleboard/gadget-init/udhcpd.rules               | 0
 .../recipes-ti/beagleboard/gadget-init/udhcpd.service             | 0
 .../beagleboard/gadget-init/update-image-info-on-mmcblk0p1.sh     | 0
 16 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/beagleboard/beaglebo=
ne-capes.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/beagleboard/beaglebo=
ne-capes/cape-stop.sh (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/beagleboard/beaglebo=
ne-capes/cape.service (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/beagleboard/beaglebo=
ne-capes/cape.sh (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/beagleboard/beaglebo=
ne-getting-started.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/beagleboard/gadget-i=
nit.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/beagleboard/gadget-i=
nit/bone-gmass-eject.rules (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/beagleboard/gadget-i=
nit/g-ether-load.sh (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/beagleboard/gadget-i=
nit/g-ether-start-service.sh (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/beagleboard/gadget-i=
nit/g-storage-reinsert.sh (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/beagleboard/gadget-i=
nit/network-gadget-init.service (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/beagleboard/gadget-i=
nit/storage-gadget-init.service (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/beagleboard/gadget-i=
nit/udhcpd.conf (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/beagleboard/gadget-i=
nit/udhcpd.rules (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/beagleboard/gadget-i=
nit/udhcpd.service (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-ti/beagleboard/gadget-i=
nit/update-image-info-on-mmcblk0p1.sh (100%)

diff --git a/meta-ti-bsp/recipes-ti/beagleboard/beaglebone-capes.bb b/met=
a-ti-extras/recipes-ti/beagleboard/beaglebone-capes.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/beagleboard/beaglebone-capes.bb
rename to meta-ti-extras/recipes-ti/beagleboard/beaglebone-capes.bb
diff --git a/meta-ti-bsp/recipes-ti/beagleboard/beaglebone-capes/cape-sto=
p.sh b/meta-ti-extras/recipes-ti/beagleboard/beaglebone-capes/cape-stop.s=
h
similarity index 100%
rename from meta-ti-bsp/recipes-ti/beagleboard/beaglebone-capes/cape-stop=
.sh
rename to meta-ti-extras/recipes-ti/beagleboard/beaglebone-capes/cape-sto=
p.sh
diff --git a/meta-ti-bsp/recipes-ti/beagleboard/beaglebone-capes/cape.ser=
vice b/meta-ti-extras/recipes-ti/beagleboard/beaglebone-capes/cape.servic=
e
similarity index 100%
rename from meta-ti-bsp/recipes-ti/beagleboard/beaglebone-capes/cape.serv=
ice
rename to meta-ti-extras/recipes-ti/beagleboard/beaglebone-capes/cape.ser=
vice
diff --git a/meta-ti-bsp/recipes-ti/beagleboard/beaglebone-capes/cape.sh =
b/meta-ti-extras/recipes-ti/beagleboard/beaglebone-capes/cape.sh
similarity index 100%
rename from meta-ti-bsp/recipes-ti/beagleboard/beaglebone-capes/cape.sh
rename to meta-ti-extras/recipes-ti/beagleboard/beaglebone-capes/cape.sh
diff --git a/meta-ti-bsp/recipes-ti/beagleboard/beaglebone-getting-starte=
d.bb b/meta-ti-extras/recipes-ti/beagleboard/beaglebone-getting-started.b=
b
similarity index 100%
rename from meta-ti-bsp/recipes-ti/beagleboard/beaglebone-getting-started=
.bb
rename to meta-ti-extras/recipes-ti/beagleboard/beaglebone-getting-starte=
d.bb
diff --git a/meta-ti-bsp/recipes-ti/beagleboard/gadget-init.bb b/meta-ti-=
extras/recipes-ti/beagleboard/gadget-init.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/beagleboard/gadget-init.bb
rename to meta-ti-extras/recipes-ti/beagleboard/gadget-init.bb
diff --git a/meta-ti-bsp/recipes-ti/beagleboard/gadget-init/bone-gmass-ej=
ect.rules b/meta-ti-extras/recipes-ti/beagleboard/gadget-init/bone-gmass-=
eject.rules
similarity index 100%
rename from meta-ti-bsp/recipes-ti/beagleboard/gadget-init/bone-gmass-eje=
ct.rules
rename to meta-ti-extras/recipes-ti/beagleboard/gadget-init/bone-gmass-ej=
ect.rules
diff --git a/meta-ti-bsp/recipes-ti/beagleboard/gadget-init/g-ether-load.=
sh b/meta-ti-extras/recipes-ti/beagleboard/gadget-init/g-ether-load.sh
similarity index 100%
rename from meta-ti-bsp/recipes-ti/beagleboard/gadget-init/g-ether-load.s=
h
rename to meta-ti-extras/recipes-ti/beagleboard/gadget-init/g-ether-load.=
sh
diff --git a/meta-ti-bsp/recipes-ti/beagleboard/gadget-init/g-ether-start=
-service.sh b/meta-ti-extras/recipes-ti/beagleboard/gadget-init/g-ether-s=
tart-service.sh
similarity index 100%
rename from meta-ti-bsp/recipes-ti/beagleboard/gadget-init/g-ether-start-=
service.sh
rename to meta-ti-extras/recipes-ti/beagleboard/gadget-init/g-ether-start=
-service.sh
diff --git a/meta-ti-bsp/recipes-ti/beagleboard/gadget-init/g-storage-rei=
nsert.sh b/meta-ti-extras/recipes-ti/beagleboard/gadget-init/g-storage-re=
insert.sh
similarity index 100%
rename from meta-ti-bsp/recipes-ti/beagleboard/gadget-init/g-storage-rein=
sert.sh
rename to meta-ti-extras/recipes-ti/beagleboard/gadget-init/g-storage-rei=
nsert.sh
diff --git a/meta-ti-bsp/recipes-ti/beagleboard/gadget-init/network-gadge=
t-init.service b/meta-ti-extras/recipes-ti/beagleboard/gadget-init/networ=
k-gadget-init.service
similarity index 100%
rename from meta-ti-bsp/recipes-ti/beagleboard/gadget-init/network-gadget=
-init.service
rename to meta-ti-extras/recipes-ti/beagleboard/gadget-init/network-gadge=
t-init.service
diff --git a/meta-ti-bsp/recipes-ti/beagleboard/gadget-init/storage-gadge=
t-init.service b/meta-ti-extras/recipes-ti/beagleboard/gadget-init/storag=
e-gadget-init.service
similarity index 100%
rename from meta-ti-bsp/recipes-ti/beagleboard/gadget-init/storage-gadget=
-init.service
rename to meta-ti-extras/recipes-ti/beagleboard/gadget-init/storage-gadge=
t-init.service
diff --git a/meta-ti-bsp/recipes-ti/beagleboard/gadget-init/udhcpd.conf b=
/meta-ti-extras/recipes-ti/beagleboard/gadget-init/udhcpd.conf
similarity index 100%
rename from meta-ti-bsp/recipes-ti/beagleboard/gadget-init/udhcpd.conf
rename to meta-ti-extras/recipes-ti/beagleboard/gadget-init/udhcpd.conf
diff --git a/meta-ti-bsp/recipes-ti/beagleboard/gadget-init/udhcpd.rules =
b/meta-ti-extras/recipes-ti/beagleboard/gadget-init/udhcpd.rules
similarity index 100%
rename from meta-ti-bsp/recipes-ti/beagleboard/gadget-init/udhcpd.rules
rename to meta-ti-extras/recipes-ti/beagleboard/gadget-init/udhcpd.rules
diff --git a/meta-ti-bsp/recipes-ti/beagleboard/gadget-init/udhcpd.servic=
e b/meta-ti-extras/recipes-ti/beagleboard/gadget-init/udhcpd.service
similarity index 100%
rename from meta-ti-bsp/recipes-ti/beagleboard/gadget-init/udhcpd.service
rename to meta-ti-extras/recipes-ti/beagleboard/gadget-init/udhcpd.servic=
e
diff --git a/meta-ti-bsp/recipes-ti/beagleboard/gadget-init/update-image-=
info-on-mmcblk0p1.sh b/meta-ti-extras/recipes-ti/beagleboard/gadget-init/=
update-image-info-on-mmcblk0p1.sh
similarity index 100%
rename from meta-ti-bsp/recipes-ti/beagleboard/gadget-init/update-image-i=
nfo-on-mmcblk0p1.sh
rename to meta-ti-extras/recipes-ti/beagleboard/gadget-init/update-image-=
info-on-mmcblk0p1.sh
--=20
2.25.1

