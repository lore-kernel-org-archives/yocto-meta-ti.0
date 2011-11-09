Return-Path: <joelagnel@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 208FCE00307
	for <meta-ti@yoctoproject.org>; Wed,  9 Nov 2011 08:24:03 -0800 (PST)
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id pA9GO1FU016285
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 9 Nov 2011 10:24:02 -0600
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep33.itg.ti.com (8.13.7/8.13.8) with ESMTP id pA9GO12k015178;
	Wed, 9 Nov 2011 10:24:01 -0600 (CST)
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id pA9GO1NZ003892;
	Wed, 9 Nov 2011 10:24:01 -0600 (CST)
Received: from DLEE09.ent.ti.com ([fe80::a026:b4ad:3e78:5ae5]) by
	DFLE70.ent.ti.com ([fe80::db3:609a:aa62:e1ec%22]) with mapi id
	14.01.0323.003; Wed, 9 Nov 2011 10:24:01 -0600
From: "Fernandes, Joel A" <joelagnel@ti.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Thread-Topic: [meta-ti] [PATCH] gadget-init: Add network-gadget services and
	other fixes
Thread-Index: AQHMnvjID9klgqsa30CnqWmsvaJW3JWlGeYA//+eWaA=
Date: Wed, 9 Nov 2011 16:24:00 +0000
Message-ID: <083BC63EECB6FD41B8E81CF7FD87CC0F0444FD@DLEE09.ent.ti.com>
References: <1320854545-31502-1-git-send-email-joelagnel@ti.com>
	<E0E93B6F-92B9-470D-AA31-CFC6BF01CC07@dominion.thruhere.net>
In-Reply-To: <E0E93B6F-92B9-470D-AA31-CFC6BF01CC07@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
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
X-List-Received-Date: Wed, 09 Nov 2011 16:24:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Koen Kooi [mailto:koen@dominion.thruhere.net]
> Sent: Wednesday, November 09, 2011 10:07 AM
> To: Fernandes, Joel A
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] gadget-init: Add network-gadget services
> and other fixes
>=20
>=20
> Op 9 nov. 2011, om 17:02 heeft Joel A Fernandes het volgende
> geschreven:
>=20
> > * Add rule to start network-gadget when mass storage is ejected
> > * Add network-gadget-init service and scripts to switch to g_ether
> > * Add DHCP service / conf
> > * Update to storage-gadget: rmmod on stop
> >
> > Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
> > ---
> > recipes-ti/beagleboard/gadget-init.bb              |   10 ++++++++--
> > .../beagleboard/gadget-init/bone-gmass-eject.rules |    1 +
> > .../beagleboard/gadget-init/g-ether-insert.sh      |   11 +++++++++++
> > .../beagleboard/gadget-init/g-storage-reinsert.sh  |    4 ++++
> > .../gadget-init/network-gadget-init.service        |    9 +++++++++
> > .../gadget-init/storage-gadget-init.service        |    2 ++
> > recipes-ti/beagleboard/gadget-init/udhcpd.conf     |    5 +++++
> > recipes-ti/beagleboard/gadget-init/udhcpd.service  |   11 +++++++++++
> > 8 files changed, 51 insertions(+), 2 deletions(-) create mode 100644
> > recipes-ti/beagleboard/gadget-init/bone-gmass-eject.rules
> > create mode 100755
> > recipes-ti/beagleboard/gadget-init/g-ether-insert.sh
> > create mode 100755
> > recipes-ti/beagleboard/gadget-init/g-storage-reinsert.sh
> > create mode 100644
> > recipes-ti/beagleboard/gadget-init/network-gadget-init.service
> > create mode 100644 recipes-ti/beagleboard/gadget-init/udhcpd.conf
> > create mode 100644 recipes-ti/beagleboard/gadget-init/udhcpd.service
> >
> > diff --git a/recipes-ti/beagleboard/gadget-init.bb
> > b/recipes-ti/beagleboard/gadget-init.bb
> > index ee51586..7b440ff 100644
> > --- a/recipes-ti/beagleboard/gadget-init.bb
> > +++ b/recipes-ti/beagleboard/gadget-init.bb
> > @@ -1,6 +1,6 @@
> > DESCRIPTION =3D "Units to initialize usb gadgets"
> >
> > -PR =3D "r3"
> > +PR =3D "r4"
> >
> > LICENSE =3D "MIT"
> > LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58"
> > @@ -9,8 +9,14 @@ COMPATIBLE_MACHINE =3D "(ti33x)"
> > PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >
> > SRC_URI =3D "file://storage-gadget-init.service \
> > +           file://network-gadget-init.service \
> > +           file://udhcpd.service \
> > +           file://udhcpd.conf \
>=20
> Please put those in a separe udhcpd-conf (or similarly named) recipe

[Joel]. I feel this service and conf should be here as it is specific to th=
e the g-ether gadget configuration.

If you strongly believe otherwise, can you suggest a location for this reci=
pe? recipes-ti/beagleboard? recipes-misc?

>=20
> >            file://99-hokey-pokey.rules \
> >            file://hokey-pokey.sh \
> > +           file://bone-gmass-eject.rules \
> > +           file://g-storage-reinsert.sh \
> > +           file://g-ether-insert.sh \
> >           "
> >
> > do_install() {
> > @@ -23,10 +29,10 @@ do_install() {
> >
> > 	install -d ${D}${sysconfdir}/udev/rules.d
> > 	install -m 0644 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d
> > +	install -m 0644 ${WORKDIR}/*.conf ${D}${sysconfdir}
> >
> > 	install -d ${D}${bindir}
> > 	install -m 0755 ${WORKDIR}/*.sh ${D}${bindir}
> > -
> > }
> >
> > FILES_${PN} =3D "${base_libdir}/systemd ${sysconfdir} ${bindir}"
> > diff --git a/recipes-ti/beagleboard/gadget-init/bone-gmass-
> eject.rules
> > b/recipes-ti/beagleboard/gadget-init/bone-gmass-eject.rules
> > new file mode 100644
> > index 0000000..fa5d627
> > --- /dev/null
> > +++ b/recipes-ti/beagleboard/gadget-init/bone-gmass-eject.rules
> > @@ -0,0 +1 @@
> >
> +SUBSYSTEM=3D=3D"block",ACTION=3D=3D"change",KERNEL=3D=3D"mmcblk0p1",RUN+=
=3D"/usr/sbi
> n/g-ether-insert.sh"
> > diff --git a/recipes-ti/beagleboard/gadget-init/g-ether-insert.sh
> > b/recipes-ti/beagleboard/gadget-init/g-ether-insert.sh
> > new file mode 100755
> > index 0000000..6c6956e
> > --- /dev/null
> > +++ b/recipes-ti/beagleboard/gadget-init/g-ether-insert.sh
> > @@ -0,0 +1,11 @@
> > +#!/bin/sh
> > +if [ -a
> > +/sys/devices/platform/omap/ti81xx-usbss/musb-hdrc.0/gadget/lun0/file
> ] then
> > +	x=3D`cat
> > +/sys/devices/platform/omap/ti81xx-usbss/musb-
> hdrc.0/gadget/lun0/file`
>=20
> please use $() instead of ``

[Joel] OK.

>=20
> > +	if [ "$x" =3D=3D ""  ]
>=20
> use -z ?

[Joel] OK.

>=20
> > +	then
> > +		/bin/systemctl stop storage-gadget-init.service
> > +		/bin/systemctl start network-gadget-init.service
> > +		/bin/systemctl start udhcpd.service
> > +	fi
> > +fi
> > diff --git a/recipes-ti/beagleboard/gadget-init/g-storage-reinsert.sh
> > b/recipes-ti/beagleboard/gadget-init/g-storage-reinsert.sh
> > new file mode 100755
> > index 0000000..546b438
> > --- /dev/null
> > +++ b/recipes-ti/beagleboard/gadget-init/g-storage-reinsert.sh
> > @@ -0,0 +1,4 @@
> > +#!/bin/bash
>=20
> /bin/sh please

[Joel] OK.

>=20
> > +/bin/systemctl stop storage-gadget-init.service /bin/systemctl stop
> > +network-gadget-init.service /bin/systemctl start
> > +storage-gadget-init.service
> > diff --git
> > a/recipes-ti/beagleboard/gadget-init/network-gadget-init.service
> > b/recipes-ti/beagleboard/gadget-init/network-gadget-init.service
> > new file mode 100644
> > index 0000000..0a03898
> > --- /dev/null
> > +++ b/recipes-ti/beagleboard/gadget-init/network-gadget-init.service
> > @@ -0,0 +1,9 @@
> > +[Unit]
> > +Description=3DStart USB Ethernet gadget
> > +Conflicts=3Dstorage-gadget-init.service
> > +
> > +[Service]
> > +RemainAfterExit=3Dyes
> > +ExecStart=3D/sbin/modprobe g_ether host_addr=3D00:dc:c8:f7:75:05
> > +dev_addr=3D00:dd:dc:eb:6d:f1
>=20
> This is going to break with >1 bone connect, please remove the
> addresses

[Joel] Could explain a little more about ">1 bone" connect?

> > +ExecStartPost=3D/sbin/ifconfig usb0 192.168.7.2 netmask
> 255.255.255.252
> > +ExecStop=3D/sbin/rmmod g_ether
> > diff --git
> > a/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service
> > b/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service
> > index 2fe48e1..9a8513e 100644
> > --- a/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service
> > +++ b/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service
> > @@ -3,7 +3,9 @@ Description=3DStart usb mass storage gadget
> > After=3Ddev-mmcblk0p1.device
> >
> > [Service]
> > +RemainAfterExit=3Dyes
> > ExecStart=3D/sbin/modprobe g_mass_storage file=3D/dev/mmcblk0p1 cdrom=
=3D0
> > stall=3D0 removable=3D1 nofua=3D1
> > +ExecStop=3D/sbin/rmmod g_mass_storage
> >
> > [Install]
> > WantedBy=3Dbasic.target
> > diff --git a/recipes-ti/beagleboard/gadget-init/udhcpd.conf
> > b/recipes-ti/beagleboard/gadget-init/udhcpd.conf
> > new file mode 100644
> > index 0000000..3bcf00f
> > --- /dev/null
> > +++ b/recipes-ti/beagleboard/gadget-init/udhcpd.conf
> > @@ -0,0 +1,5 @@
> > +start      192.168.7.1
> > +end        192.168.7.1
> > +interface  usb0
> > +max_leases 1
> > +option subnet 255.255.255.252
> > diff --git a/recipes-ti/beagleboard/gadget-init/udhcpd.service
> > b/recipes-ti/beagleboard/gadget-init/udhcpd.service
> > new file mode 100644
> > index 0000000..f076673
> > --- /dev/null
> > +++ b/recipes-ti/beagleboard/gadget-init/udhcpd.service
> > @@ -0,0 +1,11 @@
> > +[Unit]
> > +Description=3DDHCP server for USB0 network gadget
> > +After=3Dsys-devices-platform-omap-ti81xx\x2dusbss-musb\x2dhdrc.0-
> gadget
> > +-net-usb0.device
>=20
> Please don't hardcode bone specific stuff in this generic udhcp recipe.
> The script seems to take care of ordering anyway

[Joel] OK.
Jason though of asking your opinion as your wrote this ervice, is there any=
 other reason you hardcoded this? Will removing it above have any affect th=
at you were seeing?

Thanks,
Joel

