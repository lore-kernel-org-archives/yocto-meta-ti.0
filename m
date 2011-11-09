Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wy0-f176.google.com (mail-wy0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E63EFE00307
	for <meta-ti@yoctoproject.org>; Wed,  9 Nov 2011 08:07:17 -0800 (PST)
Received: by wyg34 with SMTP id 34so3396833wyg.35
	for <meta-ti@yoctoproject.org>; Wed, 09 Nov 2011 08:07:16 -0800 (PST)
Received: by 10.180.81.73 with SMTP id y9mr3528584wix.37.1320854836417;
	Wed, 09 Nov 2011 08:07:16 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id v6sm3139620wiv.10.2011.11.09.08.07.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Nov 2011 08:07:15 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1320854545-31502-1-git-send-email-joelagnel@ti.com>
Date: Wed, 9 Nov 2011 17:07:08 +0100
Message-Id: <E0E93B6F-92B9-470D-AA31-CFC6BF01CC07@dominion.thruhere.net>
References: <1320854545-31502-1-git-send-email-joelagnel@ti.com>
To: Joel A Fernandes <joelagnel@ti.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] gadget-init: Add network-gadget services and other fixes
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Nov 2011 16:07:18 -0000
X-Groupsio-MsgNum: 93
Content-Type: multipart/signed;
	boundary="Apple-Mail=_CB53C878-227C-4F9C-BBA9-8CAC7C7367AE";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_CB53C878-227C-4F9C-BBA9-8CAC7C7367AE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 9 nov. 2011, om 17:02 heeft Joel A Fernandes het volgende geschreven:

> * Add rule to start network-gadget when mass storage is ejected
> * Add network-gadget-init service and scripts to switch to g_ether
> * Add DHCP service / conf
> * Update to storage-gadget: rmmod on stop
>=20
> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
> ---
> recipes-ti/beagleboard/gadget-init.bb              |   10 ++++++++--
> .../beagleboard/gadget-init/bone-gmass-eject.rules |    1 +
> .../beagleboard/gadget-init/g-ether-insert.sh      |   11 +++++++++++
> .../beagleboard/gadget-init/g-storage-reinsert.sh  |    4 ++++
> .../gadget-init/network-gadget-init.service        |    9 +++++++++
> .../gadget-init/storage-gadget-init.service        |    2 ++
> recipes-ti/beagleboard/gadget-init/udhcpd.conf     |    5 +++++
> recipes-ti/beagleboard/gadget-init/udhcpd.service  |   11 +++++++++++
> 8 files changed, 51 insertions(+), 2 deletions(-)
> create mode 100644 =
recipes-ti/beagleboard/gadget-init/bone-gmass-eject.rules
> create mode 100755 =
recipes-ti/beagleboard/gadget-init/g-ether-insert.sh
> create mode 100755 =
recipes-ti/beagleboard/gadget-init/g-storage-reinsert.sh
> create mode 100644 =
recipes-ti/beagleboard/gadget-init/network-gadget-init.service
> create mode 100644 recipes-ti/beagleboard/gadget-init/udhcpd.conf
> create mode 100644 recipes-ti/beagleboard/gadget-init/udhcpd.service
>=20
> diff --git a/recipes-ti/beagleboard/gadget-init.bb =
b/recipes-ti/beagleboard/gadget-init.bb
> index ee51586..7b440ff 100644
> --- a/recipes-ti/beagleboard/gadget-init.bb
> +++ b/recipes-ti/beagleboard/gadget-init.bb
> @@ -1,6 +1,6 @@
> DESCRIPTION =3D "Units to initialize usb gadgets"
>=20
> -PR =3D "r3"
> +PR =3D "r4"
>=20
> LICENSE =3D "MIT"
> LIC_FILES_CHKSUM =3D =
"file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58"
> @@ -9,8 +9,14 @@ COMPATIBLE_MACHINE =3D "(ti33x)"
> PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>=20
> SRC_URI =3D "file://storage-gadget-init.service \
> +           file://network-gadget-init.service \
> +           file://udhcpd.service \
> +           file://udhcpd.conf \

Please put those in a separe udhcpd-conf (or similarly named) recipe

>            file://99-hokey-pokey.rules \
>            file://hokey-pokey.sh \
> +           file://bone-gmass-eject.rules \
> +           file://g-storage-reinsert.sh \
> +           file://g-ether-insert.sh \
>           "
>=20
> do_install() {
> @@ -23,10 +29,10 @@ do_install() {
>=20
> 	install -d ${D}${sysconfdir}/udev/rules.d
> 	install -m 0644 ${WORKDIR}/*.rules =
${D}${sysconfdir}/udev/rules.d
> +	install -m 0644 ${WORKDIR}/*.conf ${D}${sysconfdir}
>=20
> 	install -d ${D}${bindir}
> 	install -m 0755 ${WORKDIR}/*.sh ${D}${bindir}
> -
> }
>=20
> FILES_${PN} =3D "${base_libdir}/systemd ${sysconfdir} ${bindir}"
> diff --git a/recipes-ti/beagleboard/gadget-init/bone-gmass-eject.rules =
b/recipes-ti/beagleboard/gadget-init/bone-gmass-eject.rules
> new file mode 100644
> index 0000000..fa5d627
> --- /dev/null
> +++ b/recipes-ti/beagleboard/gadget-init/bone-gmass-eject.rules
> @@ -0,0 +1 @@
> =
+SUBSYSTEM=3D=3D"block",ACTION=3D=3D"change",KERNEL=3D=3D"mmcblk0p1",RUN+=3D=
"/usr/sbin/g-ether-insert.sh"
> diff --git a/recipes-ti/beagleboard/gadget-init/g-ether-insert.sh =
b/recipes-ti/beagleboard/gadget-init/g-ether-insert.sh
> new file mode 100755
> index 0000000..6c6956e
> --- /dev/null
> +++ b/recipes-ti/beagleboard/gadget-init/g-ether-insert.sh
> @@ -0,0 +1,11 @@
> +#!/bin/sh
> +if [ -a =
/sys/devices/platform/omap/ti81xx-usbss/musb-hdrc.0/gadget/lun0/file ]
> +then
> +	x=3D`cat =
/sys/devices/platform/omap/ti81xx-usbss/musb-hdrc.0/gadget/lun0/file`

please use $() instead of ``

> +	if [ "$x" =3D=3D ""  ]

use -z ?

> +	then
> +		/bin/systemctl stop storage-gadget-init.service
> +		/bin/systemctl start network-gadget-init.service
> +		/bin/systemctl start udhcpd.service
> +	fi
> +fi
> diff --git a/recipes-ti/beagleboard/gadget-init/g-storage-reinsert.sh =
b/recipes-ti/beagleboard/gadget-init/g-storage-reinsert.sh
> new file mode 100755
> index 0000000..546b438
> --- /dev/null
> +++ b/recipes-ti/beagleboard/gadget-init/g-storage-reinsert.sh
> @@ -0,0 +1,4 @@
> +#!/bin/bash

/bin/sh please

> +/bin/systemctl stop storage-gadget-init.service
> +/bin/systemctl stop network-gadget-init.service
> +/bin/systemctl start storage-gadget-init.service
> diff --git =
a/recipes-ti/beagleboard/gadget-init/network-gadget-init.service =
b/recipes-ti/beagleboard/gadget-init/network-gadget-init.service
> new file mode 100644
> index 0000000..0a03898
> --- /dev/null
> +++ b/recipes-ti/beagleboard/gadget-init/network-gadget-init.service
> @@ -0,0 +1,9 @@
> +[Unit]
> +Description=3DStart USB Ethernet gadget
> +Conflicts=3Dstorage-gadget-init.service
> +
> +[Service]
> +RemainAfterExit=3Dyes
> +ExecStart=3D/sbin/modprobe g_ether host_addr=3D00:dc:c8:f7:75:05 =
dev_addr=3D00:dd:dc:eb:6d:f1

This is going to break with >1 bone connect, please remove the addresses

> +ExecStartPost=3D/sbin/ifconfig usb0 192.168.7.2 netmask =
255.255.255.252
> +ExecStop=3D/sbin/rmmod g_ether
> diff --git =
a/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service =
b/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service
> index 2fe48e1..9a8513e 100644
> --- a/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service
> +++ b/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service
> @@ -3,7 +3,9 @@ Description=3DStart usb mass storage gadget
> After=3Ddev-mmcblk0p1.device
>=20
> [Service]
> +RemainAfterExit=3Dyes
> ExecStart=3D/sbin/modprobe g_mass_storage file=3D/dev/mmcblk0p1 =
cdrom=3D0 stall=3D0 removable=3D1 nofua=3D1
> +ExecStop=3D/sbin/rmmod g_mass_storage
>=20
> [Install]
> WantedBy=3Dbasic.target
> diff --git a/recipes-ti/beagleboard/gadget-init/udhcpd.conf =
b/recipes-ti/beagleboard/gadget-init/udhcpd.conf
> new file mode 100644
> index 0000000..3bcf00f
> --- /dev/null
> +++ b/recipes-ti/beagleboard/gadget-init/udhcpd.conf
> @@ -0,0 +1,5 @@
> +start      192.168.7.1
> +end        192.168.7.1
> +interface  usb0
> +max_leases 1
> +option subnet 255.255.255.252
> diff --git a/recipes-ti/beagleboard/gadget-init/udhcpd.service =
b/recipes-ti/beagleboard/gadget-init/udhcpd.service
> new file mode 100644
> index 0000000..f076673
> --- /dev/null
> +++ b/recipes-ti/beagleboard/gadget-init/udhcpd.service
> @@ -0,0 +1,11 @@
> +[Unit]
> +Description=3DDHCP server for USB0 network gadget
> =
+After=3Dsys-devices-platform-omap-ti81xx\x2dusbss-musb\x2dhdrc.0-gadget-n=
et-usb0.device

Please don't hardcode bone specific stuff in this generic udhcp recipe. =
The script seems to take care of ordering anyway

regards,

Koen=

--Apple-Mail=_CB53C878-227C-4F9C-BBA9-8CAC7C7367AE
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk66pS0ACgkQMkyGM64RGpGDpACgjdEv4CKi6yWiMQBLhY9ubtRr
nOMAn1YI92KWpivo38dBN5t/WxL7QNok
=lUEv
-----END PGP SIGNATURE-----

--Apple-Mail=_CB53C878-227C-4F9C-BBA9-8CAC7C7367AE--
