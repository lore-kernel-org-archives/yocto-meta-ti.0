Return-Path: <joelagnel@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 01F9BE00307
	for <meta-ti@yoctoproject.org>; Wed,  9 Nov 2011 08:32:17 -0800 (PST)
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id pA9GWG0t029077
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 9 Nov 2011 10:32:16 -0600
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep33.itg.ti.com (8.13.7/8.13.8) with ESMTP id pA9GWGok017593;
	Wed, 9 Nov 2011 10:32:16 -0600 (CST)
Received: from DFLE71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id pA9GWGKm017097;
	Wed, 9 Nov 2011 10:32:16 -0600 (CST)
Received: from DLEE09.ent.ti.com ([fe80::a026:b4ad:3e78:5ae5]) by
	DFLE71.ent.ti.com ([fe80::29f6:72ad:a62e:2025%21]) with mapi id
	14.01.0323.003; Wed, 9 Nov 2011 10:32:16 -0600
From: "Fernandes, Joel A" <joelagnel@ti.com>
To: Jason Kridner <jkridner@beagleboard.org>
Thread-Topic: [meta-ti] [PATCH] gadget-init: Add network-gadget services and
	other fixes
Thread-Index: AQHMnvjID9klgqsa30CnqWmsvaJW3JWlGeYA//+eWaCAAGfCgP//m67w
Date: Wed, 9 Nov 2011 16:32:15 +0000
Message-ID: <083BC63EECB6FD41B8E81CF7FD87CC0F04451C@DLEE09.ent.ti.com>
References: <1320854545-31502-1-git-send-email-joelagnel@ti.com>
	<E0E93B6F-92B9-470D-AA31-CFC6BF01CC07@dominion.thruhere.net>
	<083BC63EECB6FD41B8E81CF7FD87CC0F0444FD@DLEE09.ent.ti.com>
	<CA+T6QPmhDgFFgOr3tAmkfV6DasPj8ec5vrDyiGL55R12Z4_4uA@mail.gmail.com>
In-Reply-To: <CA+T6QPmhDgFFgOr3tAmkfV6DasPj8ec5vrDyiGL55R12Z4_4uA@mail.gmail.com>
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
X-List-Received-Date: Wed, 09 Nov 2011 16:32:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Jason Kridner [mailto:jkridner@beagleboard.org]
> Sent: Wednesday, November 09, 2011 10:29 AM
> To: Fernandes, Joel A
> Cc: Koen Kooi; meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] gadget-init: Add network-gadget services
> and other fixes
>=20
> On Wed, Nov 9, 2011 at 11:24 AM, Fernandes, Joel A <joelagnel@ti.com>
> wrote:
> >> -----Original Message-----
> >> From: Koen Kooi [mailto:koen@dominion.thruhere.net]
> >> Sent: Wednesday, November 09, 2011 10:07 AM
> >> To: Fernandes, Joel A
> >> Cc: meta-ti@yoctoproject.org
> >> Subject: Re: [meta-ti] [PATCH] gadget-init: Add network-gadget
> services
> >> and other fixes
> >>
> >>
> >> Op 9 nov. 2011, om 17:02 heeft Joel A Fernandes het volgende
> >> geschreven:
> >>
> >> > * Add rule to start network-gadget when mass storage is ejected
> >> > * Add network-gadget-init service and scripts to switch to g_ether
> >> > * Add DHCP service / conf
> >> > * Update to storage-gadget: rmmod on stop
> >> >
> >> > Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
> >> > ---
> >> > recipes-ti/beagleboard/gadget-init.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 10
> ++++++++--
> >> > .../beagleboard/gadget-init/bone-gmass-eject.rules | =A0 =A01 +
> >> > .../beagleboard/gadget-init/g-ether-insert.sh =A0 =A0 =A0| =A0 11
> +++++++++++
> >> > .../beagleboard/gadget-init/g-storage-reinsert.sh =A0| =A0 =A04 ++++
> >> > .../gadget-init/network-gadget-init.service =A0 =A0 =A0 =A0| =A0 =A0=
9
> +++++++++
> >> > .../gadget-init/storage-gadget-init.service =A0 =A0 =A0 =A0| =A0 =A0=
2 ++
> >> > recipes-ti/beagleboard/gadget-init/udhcpd.conf =A0 =A0 | =A0 =A05 ++=
+++
> >> > recipes-ti/beagleboard/gadget-init/udhcpd.service =A0| =A0 11
> +++++++++++
> >> > 8 files changed, 51 insertions(+), 2 deletions(-) create mode
> 100644
> >> > recipes-ti/beagleboard/gadget-init/bone-gmass-eject.rules
> >> > create mode 100755
> >> > recipes-ti/beagleboard/gadget-init/g-ether-insert.sh
> >> > create mode 100755
> >> > recipes-ti/beagleboard/gadget-init/g-storage-reinsert.sh
> >> > create mode 100644
> >> > recipes-ti/beagleboard/gadget-init/network-gadget-init.service
> >> > create mode 100644 recipes-ti/beagleboard/gadget-init/udhcpd.conf
> >> > create mode 100644 recipes-ti/beagleboard/gadget-
> init/udhcpd.service
> >> >
> >> > diff --git a/recipes-ti/beagleboard/gadget-init.bb
> >> > b/recipes-ti/beagleboard/gadget-init.bb
> >> > index ee51586..7b440ff 100644
> >> > --- a/recipes-ti/beagleboard/gadget-init.bb
> >> > +++ b/recipes-ti/beagleboard/gadget-init.bb
> >> > @@ -1,6 +1,6 @@
> >> > DESCRIPTION =3D "Units to initialize usb gadgets"
> >> >
> >> > -PR =3D "r3"
> >> > +PR =3D "r4"
> >> >
> >> > LICENSE =3D "MIT"
> >> > LIC_FILES_CHKSUM =3D
> >> "file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58"
> >> > @@ -9,8 +9,14 @@ COMPATIBLE_MACHINE =3D "(ti33x)"
> >> > PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >> >
> >> > SRC_URI =3D "file://storage-gadget-init.service \
> >> > + =A0 =A0 =A0 =A0 =A0 file://network-gadget-init.service \
> >> > + =A0 =A0 =A0 =A0 =A0 file://udhcpd.service \
> >> > + =A0 =A0 =A0 =A0 =A0 file://udhcpd.conf \
> >>
> >> Please put those in a separe udhcpd-conf (or similarly named) recipe
> >
> > [Joel]. I feel this service and conf should be here as it is specific
> to the the g-ether gadget configuration.
> >
> > If you strongly believe otherwise, can you suggest a location for
> this recipe? recipes-ti/beagleboard? recipes-misc?
> >
> >>
> >> > =A0 =A0 =A0 =A0 =A0 =A0file://99-hokey-pokey.rules \
> >> > =A0 =A0 =A0 =A0 =A0 =A0file://hokey-pokey.sh \
> >> > + =A0 =A0 =A0 =A0 =A0 file://bone-gmass-eject.rules \
> >> > + =A0 =A0 =A0 =A0 =A0 file://g-storage-reinsert.sh \
> >> > + =A0 =A0 =A0 =A0 =A0 file://g-ether-insert.sh \
> >> > =A0 =A0 =A0 =A0 =A0 "
> >> >
> >> > do_install() {
> >> > @@ -23,10 +29,10 @@ do_install() {
> >> >
> >> > =A0 =A0 install -d ${D}${sysconfdir}/udev/rules.d
> >> > =A0 =A0 install -m 0644 ${WORKDIR}/*.rules
> ${D}${sysconfdir}/udev/rules.d
> >> > + =A0 install -m 0644 ${WORKDIR}/*.conf ${D}${sysconfdir}
> >> >
> >> > =A0 =A0 install -d ${D}${bindir}
> >> > =A0 =A0 install -m 0755 ${WORKDIR}/*.sh ${D}${bindir}
> >> > -
> >> > }
> >> >
> >> > FILES_${PN} =3D "${base_libdir}/systemd ${sysconfdir} ${bindir}"
> >> > diff --git a/recipes-ti/beagleboard/gadget-init/bone-gmass-
> >> eject.rules
> >> > b/recipes-ti/beagleboard/gadget-init/bone-gmass-eject.rules
> >> > new file mode 100644
> >> > index 0000000..fa5d627
> >> > --- /dev/null
> >> > +++ b/recipes-ti/beagleboard/gadget-init/bone-gmass-eject.rules
> >> > @@ -0,0 +1 @@
> >> >
> >>
> +SUBSYSTEM=3D=3D"block",ACTION=3D=3D"change",KERNEL=3D=3D"mmcblk0p1",RUN+=
=3D"/usr/sbi
> >> n/g-ether-insert.sh"
> >> > diff --git a/recipes-ti/beagleboard/gadget-init/g-ether-insert.sh
> >> > b/recipes-ti/beagleboard/gadget-init/g-ether-insert.sh
> >> > new file mode 100755
> >> > index 0000000..6c6956e
> >> > --- /dev/null
> >> > +++ b/recipes-ti/beagleboard/gadget-init/g-ether-insert.sh
> >> > @@ -0,0 +1,11 @@
> >> > +#!/bin/sh
> >> > +if [ -a
> >> > +/sys/devices/platform/omap/ti81xx-usbss/musb-
> hdrc.0/gadget/lun0/file
> >> ] then
> >> > + =A0 x=3D`cat
> >> > +/sys/devices/platform/omap/ti81xx-usbss/musb-
> >> hdrc.0/gadget/lun0/file`
> >>
> >> please use $() instead of ``
> >
> > [Joel] OK.
> >
> >>
> >> > + =A0 if [ "$x" =3D=3D "" =A0]
> >>
> >> use -z ?
> >
> > [Joel] OK.
> >
> >>
> >> > + =A0 then
> >> > + =A0 =A0 =A0 =A0 =A0 /bin/systemctl stop storage-gadget-init.servic=
e
> >> > + =A0 =A0 =A0 =A0 =A0 /bin/systemctl start network-gadget-init.servi=
ce
> >> > + =A0 =A0 =A0 =A0 =A0 /bin/systemctl start udhcpd.service
> >> > + =A0 fi
> >> > +fi
> >> > diff --git a/recipes-ti/beagleboard/gadget-init/g-storage-
> reinsert.sh
> >> > b/recipes-ti/beagleboard/gadget-init/g-storage-reinsert.sh
> >> > new file mode 100755
> >> > index 0000000..546b438
> >> > --- /dev/null
> >> > +++ b/recipes-ti/beagleboard/gadget-init/g-storage-reinsert.sh
> >> > @@ -0,0 +1,4 @@
> >> > +#!/bin/bash
> >>
> >> /bin/sh please
> >
> > [Joel] OK.
> >
> >>
> >> > +/bin/systemctl stop storage-gadget-init.service /bin/systemctl
> stop
> >> > +network-gadget-init.service /bin/systemctl start
> >> > +storage-gadget-init.service
> >> > diff --git
> >> > a/recipes-ti/beagleboard/gadget-init/network-gadget-init.service
> >> > b/recipes-ti/beagleboard/gadget-init/network-gadget-init.service
> >> > new file mode 100644
> >> > index 0000000..0a03898
> >> > --- /dev/null
> >> > +++ b/recipes-ti/beagleboard/gadget-init/network-gadget-
> init.service
> >> > @@ -0,0 +1,9 @@
> >> > +[Unit]
> >> > +Description=3DStart USB Ethernet gadget
> >> > +Conflicts=3Dstorage-gadget-init.service
> >> > +
> >> > +[Service]
> >> > +RemainAfterExit=3Dyes
> >> > +ExecStart=3D/sbin/modprobe g_ether host_addr=3D00:dc:c8:f7:75:05
> >> > +dev_addr=3D00:dd:dc:eb:6d:f1
> >>
> >> This is going to break with >1 bone connect, please remove the
> >> addresses
> >
> > [Joel] Could explain a little more about ">1 bone" connect?
> >
> >> > +ExecStartPost=3D/sbin/ifconfig usb0 192.168.7.2 netmask
> >> 255.255.255.252
> >> > +ExecStop=3D/sbin/rmmod g_ether
> >> > diff --git
> >> > a/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service
> >> > b/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service
> >> > index 2fe48e1..9a8513e 100644
> >> > --- a/recipes-ti/beagleboard/gadget-init/storage-gadget-
> init.service
> >> > +++ b/recipes-ti/beagleboard/gadget-init/storage-gadget-
> init.service
> >> > @@ -3,7 +3,9 @@ Description=3DStart usb mass storage gadget
> >> > After=3Ddev-mmcblk0p1.device
> >> >
> >> > [Service]
> >> > +RemainAfterExit=3Dyes
> >> > ExecStart=3D/sbin/modprobe g_mass_storage file=3D/dev/mmcblk0p1
> cdrom=3D0
> >> > stall=3D0 removable=3D1 nofua=3D1
> >> > +ExecStop=3D/sbin/rmmod g_mass_storage
> >> >
> >> > [Install]
> >> > WantedBy=3Dbasic.target
> >> > diff --git a/recipes-ti/beagleboard/gadget-init/udhcpd.conf
> >> > b/recipes-ti/beagleboard/gadget-init/udhcpd.conf
> >> > new file mode 100644
> >> > index 0000000..3bcf00f
> >> > --- /dev/null
> >> > +++ b/recipes-ti/beagleboard/gadget-init/udhcpd.conf
> >> > @@ -0,0 +1,5 @@
> >> > +start =A0 =A0 =A0192.168.7.1
> >> > +end =A0 =A0 =A0 =A0192.168.7.1
> >> > +interface =A0usb0
> >> > +max_leases 1
> >> > +option subnet 255.255.255.252
> >> > diff --git a/recipes-ti/beagleboard/gadget-init/udhcpd.service
> >> > b/recipes-ti/beagleboard/gadget-init/udhcpd.service
> >> > new file mode 100644
> >> > index 0000000..f076673
> >> > --- /dev/null
> >> > +++ b/recipes-ti/beagleboard/gadget-init/udhcpd.service
> >> > @@ -0,0 +1,11 @@
> >> > +[Unit]
> >> > +Description=3DDHCP server for USB0 network gadget
> >> > +After=3Dsys-devices-platform-omap-ti81xx\x2dusbss-musb\x2dhdrc.0-
> >> gadget
> >> > +-net-usb0.device
> >>
> >> Please don't hardcode bone specific stuff in this generic udhcp
> recipe.
> >> The script seems to take care of ordering anyway
> >
> > [Joel] OK.
> > Jason though of asking your opinion as your wrote this ervice, is
> there any other reason you hardcoded this? Will removing it above have
> any affect that you were seeing?
>=20
> This isn't a generic udhcp recipe.  It should probably just be
> renamed.  It is specifically for the point of providing addresses to
> the other end of the USB network gadget.

Can we avoid making a new create for udhcpc then? I just feel it is overkil=
l and this simple service/conf can go in this same recipe. I am ok with ren=
aming the config and service files to gether-dhcp or the like. Let us know =
your opinion so we can collectively take a call on how to go about doing it=
.

Thanks,
Joel

