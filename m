Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DE206E014DA
	for <meta-ti@yoctoproject.org>; Wed,  5 Sep 2012 13:06:58 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q85K6vjx014438;
	Wed, 5 Sep 2012 15:06:57 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q85K6vTu007153;
	Wed, 5 Sep 2012 15:06:57 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Wed, 5 Sep 2012 15:06:57 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Koen Kooi <koen@dominion.thruhere.net>, "fcooperjr27@gmail.com"
	<fcooperjr27@gmail.com>
Thread-Topic: [meta-ti] [master][PATCH v3] netbase: Update interfaces files
Thread-Index: AQHNiA4es18UQnxao0iYINpr0SzLtJd8M9tA
Date: Wed, 5 Sep 2012 20:06:56 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C2B6529@DFLE09.ent.ti.com>
References: <1346450061-6913-1-git-send-email-fcooperjr27@gmail.com>
	<1346450061-6913-2-git-send-email-fcooperjr27@gmail.com>
	<C2935055-7270-4A0C-9D3C-715B4942042C@dominion.thruhere.net>
In-Reply-To: <C2935055-7270-4A0C-9D3C-715B4942042C@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [master][PATCH v3] netbase: Update interfaces files
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
X-List-Received-Date: Wed, 05 Sep 2012 20:06:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ignore this patch. Adding to meta-arago-distro.

-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Koen Kooi
Sent: Saturday, September 01, 2012 1:51 AM
To: fcooperjr27@gmail.com
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [master][PATCH v3] netbase: Update interfaces files


Op 31 aug. 2012, om 23:54 heeft fcooperjr27@gmail.com het volgende geschrev=
en:

> From: Franklin S Cooper Jr <fcooper@ti.com>
>=20
> * Update interfaces files based on changes made to the interfaces file =20
> in arago
>=20
> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
> ---
> recipes-core/netbase/netbase-5.0/omap3/interfaces  |   12 +++++++-----
> .../netbase/netbase-5.0/omapl138/interfaces        |   12 +++++++-----
> recipes-core/netbase/netbase-5.0/ti33x/interfaces  |   12 +++++++-----
> 3 files changed, 21 insertions(+), 15 deletions(-)
>=20
> diff --git a/recipes-core/netbase/netbase-5.0/omap3/interfaces=20
> b/recipes-core/netbase/netbase-5.0/omap3/interfaces
> index 0acf4cf..15bc31c 100644
> --- a/recipes-core/netbase/netbase-5.0/omap3/interfaces
> +++ b/recipes-core/netbase/netbase-5.0/omap3/interfaces
> @@ -11,20 +11,22 @@ iface wlan0 inet dhcp
> 	wpa-driver wext
> 	wpa-conf /etc/wpa_supplicant.conf
>=20
> +iface tiwlan0 inet dhcp
> +	wireless_mode managed
> +	wireless_essid any
> +

That doesn't exist on beagleboard, but it does get added to the interfaces =
file for no reason, NAK

> iface atml0 inet dhcp
>=20
> # Wired or wireless interfaces
> auto eth0
> iface eth0 inet dhcp
> +        pre-up /bin/grep -v -e=20
> + "ip=3D[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+" /proc/cmdline > /dev/null

Ehm....


> +
> iface eth1 inet dhcp
>=20
> # Ethernet/RNDIS gadget (g_ether)
> # ... or on host side, usbnet and random hwaddr -iface usb0 inet=20
> static
> -	address 192.168.7.2
> -	netmask 255.255.255.0
> -	network 192.168.7.0
> -	gateway 192.168.7.1
> +iface usb0 inet dhcp

Breaks beagleboard usage

>=20
> # Bluetooth networking
> iface bnep0 inet dhcp
> diff --git a/recipes-core/netbase/netbase-5.0/omapl138/interfaces=20
> b/recipes-core/netbase/netbase-5.0/omapl138/interfaces
> index 0acf4cf..15bc31c 100644
> --- a/recipes-core/netbase/netbase-5.0/omapl138/interfaces
> +++ b/recipes-core/netbase/netbase-5.0/omapl138/interfaces
> @@ -11,20 +11,22 @@ iface wlan0 inet dhcp
> 	wpa-driver wext
> 	wpa-conf /etc/wpa_supplicant.conf
>=20
> +iface tiwlan0 inet dhcp
> +	wireless_mode managed
> +	wireless_essid any
> +
> iface atml0 inet dhcp
>=20
> # Wired or wireless interfaces
> auto eth0
> iface eth0 inet dhcp
> +        pre-up /bin/grep -v -e=20
> + "ip=3D[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+" /proc/cmdline > /dev/null
> +
> iface eth1 inet dhcp
>=20
> # Ethernet/RNDIS gadget (g_ether)
> # ... or on host side, usbnet and random hwaddr -iface usb0 inet=20
> static
> -	address 192.168.7.2
> -	netmask 255.255.255.0
> -	network 192.168.7.0
> -	gateway 192.168.7.1
> +iface usb0 inet dhcp
>=20
> # Bluetooth networking
> iface bnep0 inet dhcp
> diff --git a/recipes-core/netbase/netbase-5.0/ti33x/interfaces=20
> b/recipes-core/netbase/netbase-5.0/ti33x/interfaces
> index 0acf4cf..15bc31c 100644
> --- a/recipes-core/netbase/netbase-5.0/ti33x/interfaces
> +++ b/recipes-core/netbase/netbase-5.0/ti33x/interfaces
> @@ -11,20 +11,22 @@ iface wlan0 inet dhcp
> 	wpa-driver wext
> 	wpa-conf /etc/wpa_supplicant.conf
>=20
> +iface tiwlan0 inet dhcp
> +	wireless_mode managed
> +	wireless_essid any
> +
> iface atml0 inet dhcp
>=20
> # Wired or wireless interfaces
> auto eth0
> iface eth0 inet dhcp
> +        pre-up /bin/grep -v -e=20
> + "ip=3D[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+" /proc/cmdline > /dev/null
> +
> iface eth1 inet dhcp
>=20
> # Ethernet/RNDIS gadget (g_ether)
> # ... or on host side, usbnet and random hwaddr -iface usb0 inet=20
> static
> -	address 192.168.7.2
> -	netmask 255.255.255.0
> -	network 192.168.7.0
> -	gateway 192.168.7.1
> +iface usb0 inet dhcp

breaks beaglebone


LIke I said before, this is an 'arago' interfaces file, not specific to the=
 SoCs, so please put it in the arago layer instead of breaking everything b=
y putting it in meta-ti _______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

