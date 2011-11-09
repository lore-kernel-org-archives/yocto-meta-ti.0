Return-Path: <jkridner@beagleboard.org>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CF55CE00307
	for <meta-ti@yoctoproject.org>; Wed,  9 Nov 2011 08:26:58 -0800 (PST)
Received: by eyh5 with SMTP id 5so2860093eyh.35
	for <meta-ti@yoctoproject.org>; Wed, 09 Nov 2011 08:26:57 -0800 (PST)
Received: by 10.213.106.20 with SMTP id v20mr252170ebo.91.1320856016959;
	Wed, 09 Nov 2011 08:26:56 -0800 (PST)
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by mx.google.com with ESMTPS id f36sm14833357eef.4.2011.11.09.08.26.53
	(version=SSLv3 cipher=OTHER); Wed, 09 Nov 2011 08:26:56 -0800 (PST)
Received: by eyh5 with SMTP id 5so2859947eyh.35
	for <meta-ti@yoctoproject.org>; Wed, 09 Nov 2011 08:26:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.217.105 with SMTP id ox9mr989800obc.45.1320856011887; Wed,
	09 Nov 2011 08:26:51 -0800 (PST)
Received: by 10.182.188.98 with HTTP; Wed, 9 Nov 2011 08:26:51 -0800 (PST)
In-Reply-To: <E0E93B6F-92B9-470D-AA31-CFC6BF01CC07@dominion.thruhere.net>
References: <1320854545-31502-1-git-send-email-joelagnel@ti.com>
	<E0E93B6F-92B9-470D-AA31-CFC6BF01CC07@dominion.thruhere.net>
Date: Wed, 9 Nov 2011 11:26:51 -0500
Message-ID: <CA+T6QPmssFdVPswiwNb8_+hjw0_1OVOiwBGXDzAqC_8WA704bQ@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: meta-ti@yoctoproject.org, Joel A Fernandes <joelagnel@ti.com>
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
X-List-Received-Date: Wed, 09 Nov 2011 16:26:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 9, 2011 at 11:07 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
> Op 9 nov. 2011, om 17:02 heeft Joel A Fernandes het volgende geschreven:
>
>> * Add rule to start network-gadget when mass storage is ejected
>> * Add network-gadget-init service and scripts to switch to g_ether
>> * Add DHCP service / conf
>> * Update to storage-gadget: rmmod on stop
>>
>> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
>> ---
>> recipes-ti/beagleboard/gadget-init.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 1=
0 ++++++++--
>> .../beagleboard/gadget-init/bone-gmass-eject.rules | =A0 =A01 +
>> .../beagleboard/gadget-init/g-ether-insert.sh =A0 =A0 =A0| =A0 11 ++++++=
+++++
>> .../beagleboard/gadget-init/g-storage-reinsert.sh =A0| =A0 =A04 ++++
>> .../gadget-init/network-gadget-init.service =A0 =A0 =A0 =A0| =A0 =A09 ++=
+++++++
>> .../gadget-init/storage-gadget-init.service =A0 =A0 =A0 =A0| =A0 =A02 ++
>> recipes-ti/beagleboard/gadget-init/udhcpd.conf =A0 =A0 | =A0 =A05 +++++
>> recipes-ti/beagleboard/gadget-init/udhcpd.service =A0| =A0 11 ++++++++++=
+
>> 8 files changed, 51 insertions(+), 2 deletions(-)
>> create mode 100644 recipes-ti/beagleboard/gadget-init/bone-gmass-eject.r=
ules
>> create mode 100755 recipes-ti/beagleboard/gadget-init/g-ether-insert.sh
>> create mode 100755 recipes-ti/beagleboard/gadget-init/g-storage-reinsert=
.sh
>> create mode 100644 recipes-ti/beagleboard/gadget-init/network-gadget-ini=
t.service
>> create mode 100644 recipes-ti/beagleboard/gadget-init/udhcpd.conf
>> create mode 100644 recipes-ti/beagleboard/gadget-init/udhcpd.service
>>
>> diff --git a/recipes-ti/beagleboard/gadget-init.bb b/recipes-ti/beaglebo=
ard/gadget-init.bb
>> index ee51586..7b440ff 100644
>> --- a/recipes-ti/beagleboard/gadget-init.bb
>> +++ b/recipes-ti/beagleboard/gadget-init.bb
>> @@ -1,6 +1,6 @@
>> DESCRIPTION =3D "Units to initialize usb gadgets"
>>
>> -PR =3D "r3"
>> +PR =3D "r4"
>>
>> LICENSE =3D "MIT"
>> LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D3f40d799439710928=
5ec7b81fdeb3b58"
>> @@ -9,8 +9,14 @@ COMPATIBLE_MACHINE =3D "(ti33x)"
>> PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>
>> SRC_URI =3D "file://storage-gadget-init.service \
>> + =A0 =A0 =A0 =A0 =A0 file://network-gadget-init.service \
>> + =A0 =A0 =A0 =A0 =A0 file://udhcpd.service \
>> + =A0 =A0 =A0 =A0 =A0 file://udhcpd.conf \
>
> Please put those in a separe udhcpd-conf (or similarly named) recipe
>
>> =A0 =A0 =A0 =A0 =A0 =A0file://99-hokey-pokey.rules \
>> =A0 =A0 =A0 =A0 =A0 =A0file://hokey-pokey.sh \
>> + =A0 =A0 =A0 =A0 =A0 file://bone-gmass-eject.rules \
>> + =A0 =A0 =A0 =A0 =A0 file://g-storage-reinsert.sh \
>> + =A0 =A0 =A0 =A0 =A0 file://g-ether-insert.sh \
>> =A0 =A0 =A0 =A0 =A0 "
>>
>> do_install() {
>> @@ -23,10 +29,10 @@ do_install() {
>>
>> =A0 =A0 =A0 install -d ${D}${sysconfdir}/udev/rules.d
>> =A0 =A0 =A0 install -m 0644 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/ru=
les.d
>> + =A0 =A0 install -m 0644 ${WORKDIR}/*.conf ${D}${sysconfdir}
>>
>> =A0 =A0 =A0 install -d ${D}${bindir}
>> =A0 =A0 =A0 install -m 0755 ${WORKDIR}/*.sh ${D}${bindir}
>> -
>> }
>>
>> FILES_${PN} =3D "${base_libdir}/systemd ${sysconfdir} ${bindir}"
>> diff --git a/recipes-ti/beagleboard/gadget-init/bone-gmass-eject.rules b=
/recipes-ti/beagleboard/gadget-init/bone-gmass-eject.rules
>> new file mode 100644
>> index 0000000..fa5d627
>> --- /dev/null
>> +++ b/recipes-ti/beagleboard/gadget-init/bone-gmass-eject.rules
>> @@ -0,0 +1 @@
>> +SUBSYSTEM=3D=3D"block",ACTION=3D=3D"change",KERNEL=3D=3D"mmcblk0p1",RUN=
+=3D"/usr/sbin/g-ether-insert.sh"
>> diff --git a/recipes-ti/beagleboard/gadget-init/g-ether-insert.sh b/reci=
pes-ti/beagleboard/gadget-init/g-ether-insert.sh
>> new file mode 100755
>> index 0000000..6c6956e
>> --- /dev/null
>> +++ b/recipes-ti/beagleboard/gadget-init/g-ether-insert.sh
>> @@ -0,0 +1,11 @@
>> +#!/bin/sh
>> +if [ -a /sys/devices/platform/omap/ti81xx-usbss/musb-hdrc.0/gadget/lun0=
/file ]
>> +then
>> + =A0 =A0 x=3D`cat /sys/devices/platform/omap/ti81xx-usbss/musb-hdrc.0/g=
adget/lun0/file`
>
> please use $() instead of ``
>
>> + =A0 =A0 if [ "$x" =3D=3D "" =A0]
>
> use -z ?
>
>> + =A0 =A0 then
>> + =A0 =A0 =A0 =A0 =A0 =A0 /bin/systemctl stop storage-gadget-init.servic=
e
>> + =A0 =A0 =A0 =A0 =A0 =A0 /bin/systemctl start network-gadget-init.servi=
ce
>> + =A0 =A0 =A0 =A0 =A0 =A0 /bin/systemctl start udhcpd.service
>> + =A0 =A0 fi
>> +fi
>> diff --git a/recipes-ti/beagleboard/gadget-init/g-storage-reinsert.sh b/=
recipes-ti/beagleboard/gadget-init/g-storage-reinsert.sh
>> new file mode 100755
>> index 0000000..546b438
>> --- /dev/null
>> +++ b/recipes-ti/beagleboard/gadget-init/g-storage-reinsert.sh
>> @@ -0,0 +1,4 @@
>> +#!/bin/bash
>
> /bin/sh please
>
>> +/bin/systemctl stop storage-gadget-init.service
>> +/bin/systemctl stop network-gadget-init.service
>> +/bin/systemctl start storage-gadget-init.service
>> diff --git a/recipes-ti/beagleboard/gadget-init/network-gadget-init.serv=
ice b/recipes-ti/beagleboard/gadget-init/network-gadget-init.service
>> new file mode 100644
>> index 0000000..0a03898
>> --- /dev/null
>> +++ b/recipes-ti/beagleboard/gadget-init/network-gadget-init.service
>> @@ -0,0 +1,9 @@
>> +[Unit]
>> +Description=3DStart USB Ethernet gadget
>> +Conflicts=3Dstorage-gadget-init.service
>> +
>> +[Service]
>> +RemainAfterExit=3Dyes
>> +ExecStart=3D/sbin/modprobe g_ether host_addr=3D00:dc:c8:f7:75:05 dev_ad=
dr=3D00:dd:dc:eb:6d:f1
>
> This is going to break with >1 bone connect, please remove the addresses

I would prefer to not have it coming up with a new MAC address every
time.  How hard would it be to pull the MAC address from the EEPROM or
from the 2nd port of the switch?  Not much time on this, so we need a
quick solution.

There is also the solution that went into the BeagleBoard/-xM based on
the die-ID.

All of these approaches sound time consuming.  Given that the same MAC
address is only one of our problems, since these boards will also be
providing the same DHCP addresses, is it worth trying to fix today?

>
>> +ExecStartPost=3D/sbin/ifconfig usb0 192.168.7.2 netmask 255.255.255.252
>> +ExecStop=3D/sbin/rmmod g_ether
>> diff --git a/recipes-ti/beagleboard/gadget-init/storage-gadget-init.serv=
ice b/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service
>> index 2fe48e1..9a8513e 100644
>> --- a/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service
>> +++ b/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service
>> @@ -3,7 +3,9 @@ Description=3DStart usb mass storage gadget
>> After=3Ddev-mmcblk0p1.device
>>
>> [Service]
>> +RemainAfterExit=3Dyes
>> ExecStart=3D/sbin/modprobe g_mass_storage file=3D/dev/mmcblk0p1 cdrom=3D=
0 stall=3D0 removable=3D1 nofua=3D1
>> +ExecStop=3D/sbin/rmmod g_mass_storage
>>
>> [Install]
>> WantedBy=3Dbasic.target
>> diff --git a/recipes-ti/beagleboard/gadget-init/udhcpd.conf b/recipes-ti=
/beagleboard/gadget-init/udhcpd.conf
>> new file mode 100644
>> index 0000000..3bcf00f
>> --- /dev/null
>> +++ b/recipes-ti/beagleboard/gadget-init/udhcpd.conf
>> @@ -0,0 +1,5 @@
>> +start =A0 =A0 =A0192.168.7.1
>> +end =A0 =A0 =A0 =A0192.168.7.1
>> +interface =A0usb0
>> +max_leases 1
>> +option subnet 255.255.255.252
>> diff --git a/recipes-ti/beagleboard/gadget-init/udhcpd.service b/recipes=
-ti/beagleboard/gadget-init/udhcpd.service
>> new file mode 100644
>> index 0000000..f076673
>> --- /dev/null
>> +++ b/recipes-ti/beagleboard/gadget-init/udhcpd.service
>> @@ -0,0 +1,11 @@
>> +[Unit]
>> +Description=3DDHCP server for USB0 network gadget
>> +After=3Dsys-devices-platform-omap-ti81xx\x2dusbss-musb\x2dhdrc.0-gadget=
-net-usb0.device
>
> Please don't hardcode bone specific stuff in this generic udhcp recipe. T=
he script seems to take care of ordering anyway
>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
>
> iEYEARECAAYFAk66pS0ACgkQMkyGM64RGpGDpACgjdEv4CKi6yWiMQBLhY9ubtRr
> nOMAn1YI92KWpivo38dBN5t/WxL7QNok
> =3DlUEv
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>
>

