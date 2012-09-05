Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5BB62E01423
	for <meta-ti@yoctoproject.org>; Wed,  5 Sep 2012 13:06:49 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q85K6lWZ007232;
	Wed, 5 Sep 2012 15:06:47 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q85K6laX007043;
	Wed, 5 Sep 2012 15:06:47 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Wed, 5 Sep 2012 15:06:47 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Koen Kooi <koen@dominion.thruhere.net>, "fcooperjr27@gmail.com"
	<fcooperjr27@gmail.com>
Thread-Topic: [meta-ti] [master][PATCH v3] netbase: Add base interfaces file
Thread-Index: AQHNiA3X+0hXeOc/pEyknL8QoN1CdZd8M8SQ
Date: Wed, 5 Sep 2012 20:06:45 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C2B651F@DFLE09.ent.ti.com>
References: <1346450061-6913-1-git-send-email-fcooperjr27@gmail.com>
	<6EE46766-A9D2-4440-B245-28354F59B4D5@dominion.thruhere.net>
In-Reply-To: <6EE46766-A9D2-4440-B245-28354F59B4D5@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [master][PATCH v3] netbase: Add base interfaces file
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Sep 2012 20:06:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ignore this patch. Adding to meta-arago-distro.

-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Koen Kooi
Sent: Saturday, September 01, 2012 1:48 AM
To: fcooperjr27@gmail.com
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [master][PATCH v3] netbase: Add base interfaces file


Op 31 aug. 2012, om 23:54 heeft fcooperjr27@gmail.com het volgende geschrev=
en:

> From: Franklin S Cooper Jr <fcooper@ti.com>
>=20
> * Add PRINC
> * Create copies of the interfaces file that was grabbed from oe-core =20
> and copy it into TI SOC families specific directories
> * Update to use the new syntax for extending the file search path
>=20
> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
> ---
> recipes-core/netbase/netbase-5.0/omap3/interfaces  |   31 +++++++++++++++=
+++++
> .../netbase/netbase-5.0/omapl138/interfaces        |   31 +++++++++++++++=
+++++
> recipes-core/netbase/netbase-5.0/ti33x/interfaces  |   31 +++++++++++++++=
+++++

So all subartic and omap3 machines will now get a different interfaces file=
. Not a good idea. NAK

> recipes-core/netbase/netbase_5.0.bbappend          |    5 ++-
> 4 files changed, 96 insertions(+), 2 deletions(-) create mode 100644=20
> recipes-core/netbase/netbase-5.0/omap3/interfaces
> create mode 100644=20
> recipes-core/netbase/netbase-5.0/omapl138/interfaces
> create mode 100644 recipes-core/netbase/netbase-5.0/ti33x/interfaces
>=20
> diff --git a/recipes-core/netbase/netbase-5.0/omap3/interfaces=20
> b/recipes-core/netbase/netbase-5.0/omap3/interfaces
> new file mode 100644
> index 0000000..0acf4cf
> --- /dev/null
> +++ b/recipes-core/netbase/netbase-5.0/omap3/interfaces
> @@ -0,0 +1,31 @@
> +# /etc/network/interfaces -- configuration file for ifup(8),=20
> +ifdown(8)
> +=20
> +# The loopback interface
> +auto lo
> +iface lo inet loopback
> +
> +# Wireless interfaces
> +iface wlan0 inet dhcp
> +	wireless_mode managed
> +	wireless_essid any
> +	wpa-driver wext
> +	wpa-conf /etc/wpa_supplicant.conf
> +
> +iface atml0 inet dhcp
> +
> +# Wired or wireless interfaces
> +auto eth0
> +iface eth0 inet dhcp
> +iface eth1 inet dhcp
> +
> +# Ethernet/RNDIS gadget (g_ether)
> +# ... or on host side, usbnet and random hwaddr iface usb0 inet=20
> +static
> +	address 192.168.7.2
> +	netmask 255.255.255.0
> +	network 192.168.7.0
> +	gateway 192.168.7.1
> +
> +# Bluetooth networking
> +iface bnep0 inet dhcp
> +
> diff --git a/recipes-core/netbase/netbase-5.0/omapl138/interfaces=20
> b/recipes-core/netbase/netbase-5.0/omapl138/interfaces
> new file mode 100644
> index 0000000..0acf4cf
> --- /dev/null
> +++ b/recipes-core/netbase/netbase-5.0/omapl138/interfaces
> @@ -0,0 +1,31 @@
> +# /etc/network/interfaces -- configuration file for ifup(8),=20
> +ifdown(8)
> +=20
> +# The loopback interface
> +auto lo
> +iface lo inet loopback
> +
> +# Wireless interfaces
> +iface wlan0 inet dhcp
> +	wireless_mode managed
> +	wireless_essid any
> +	wpa-driver wext
> +	wpa-conf /etc/wpa_supplicant.conf
> +
> +iface atml0 inet dhcp
> +
> +# Wired or wireless interfaces
> +auto eth0
> +iface eth0 inet dhcp
> +iface eth1 inet dhcp
> +
> +# Ethernet/RNDIS gadget (g_ether)
> +# ... or on host side, usbnet and random hwaddr iface usb0 inet=20
> +static
> +	address 192.168.7.2
> +	netmask 255.255.255.0
> +	network 192.168.7.0
> +	gateway 192.168.7.1
> +
> +# Bluetooth networking
> +iface bnep0 inet dhcp
> +
> diff --git a/recipes-core/netbase/netbase-5.0/ti33x/interfaces=20
> b/recipes-core/netbase/netbase-5.0/ti33x/interfaces
> new file mode 100644
> index 0000000..0acf4cf
> --- /dev/null
> +++ b/recipes-core/netbase/netbase-5.0/ti33x/interfaces
> @@ -0,0 +1,31 @@
> +# /etc/network/interfaces -- configuration file for ifup(8),=20
> +ifdown(8)
> +=20
> +# The loopback interface
> +auto lo
> +iface lo inet loopback
> +
> +# Wireless interfaces
> +iface wlan0 inet dhcp
> +	wireless_mode managed
> +	wireless_essid any
> +	wpa-driver wext
> +	wpa-conf /etc/wpa_supplicant.conf
> +
> +iface atml0 inet dhcp
> +
> +# Wired or wireless interfaces
> +auto eth0
> +iface eth0 inet dhcp
> +iface eth1 inet dhcp
> +
> +# Ethernet/RNDIS gadget (g_ether)
> +# ... or on host side, usbnet and random hwaddr iface usb0 inet=20
> +static
> +	address 192.168.7.2
> +	netmask 255.255.255.0
> +	network 192.168.7.0
> +	gateway 192.168.7.1
> +
> +# Bluetooth networking
> +iface bnep0 inet dhcp
> +
> diff --git a/recipes-core/netbase/netbase_5.0.bbappend=20
> b/recipes-core/netbase/netbase_5.0.bbappend
> index 4b8d0e6..80e3a16 100644
> --- a/recipes-core/netbase/netbase_5.0.bbappend
> +++ b/recipes-core/netbase/netbase_5.0.bbappend
> @@ -1,3 +1,4 @@
> -THISDIR :=3D "${@os.path.dirname(bb.data.getVar('FILE', d, True))}"
> -FILESPATH =3D. "${@base_set_filespath(["${THISDIR}/${PN}"], d)}:"
> +# look for files in this layer first
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${P}:"
>=20
> +PRINC =3D "1"
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

