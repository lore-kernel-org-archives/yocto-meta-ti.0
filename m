Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5A065E00283
	for <meta-ti@yoctoproject.org>; Fri, 31 Aug 2012 23:50:45 -0700 (PDT)
Received: by eekd41 with SMTP id d41so1562685eek.35
	for <meta-ti@yoctoproject.org>; Fri, 31 Aug 2012 23:50:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=PsgvdCJITm6OUthBf6dPvOvwewecyE740YLPo81lyYI=;
	b=cKK2fFzzlx9PO+KNIUfbCJ7+8Eune3w7nFK8iIf0QshAvStx3buKmEKVvXVXbzx3l2
	m41koMsVt5DLawLnlBvEx63vA7OmlPFLVs6hQiSyHLwMmPvOcPDWMIBrPFOX03hju/4h
	erQ3kEoeY51+6N08mD37ToI3U5uUcLVROi2kL9lSG7/9aMPd1OY7SiQ+C8EchbrfIeXO
	WB5WJE/bBlHYuXRd6r4gEkKjmJM6GVQ0g+LzEi4c+8119Qgvtx7zFlNjBJWkBr6Kne1O
	9TVxc6Oos8QeNbllTF2Mdh/v8TI3XrPkmmfm2+UlSyUdnJidxM4/sSEW4IwKu04VL7Y/
	Xwgw==
Received: by 10.14.218.5 with SMTP id j5mr14027669eep.16.1346482244349;
	Fri, 31 Aug 2012 23:50:44 -0700 (PDT)
Received: from ?IPv6:2001:610:612::25f1:f0f1:353a:2c7f?
	([2001:610:612:0:25f1:f0f1:353a:2c7f])
	by mx.google.com with ESMTPS id v3sm19044343eep.10.2012.08.31.23.50.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 31 Aug 2012 23:50:43 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1346450061-6913-2-git-send-email-fcooperjr27@gmail.com>
Date: Sat, 1 Sep 2012 08:50:39 +0200
Message-Id: <C2935055-7270-4A0C-9D3C-715B4942042C@dominion.thruhere.net>
References: <1346450061-6913-1-git-send-email-fcooperjr27@gmail.com>
	<1346450061-6913-2-git-send-email-fcooperjr27@gmail.com>
To: fcooperjr27@gmail.com
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQlAuDcSHsDG1nl51y1kzff6FbSH0BztyYZDg2CHOKqooF868hkYg7ds0KvXr1kB5faVKZi7
Cc: meta-ti@yoctoproject.org
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
X-List-Received-Date: Sat, 01 Sep 2012 06:50:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 31 aug. 2012, om 23:54 heeft fcooperjr27@gmail.com het volgende =
geschreven:

> From: Franklin S Cooper Jr <fcooper@ti.com>
>=20
> * Update interfaces files based on changes made to the interfaces file
>  in arago
>=20
> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
> ---
> recipes-core/netbase/netbase-5.0/omap3/interfaces  |   12 +++++++-----
> .../netbase/netbase-5.0/omapl138/interfaces        |   12 +++++++-----
> recipes-core/netbase/netbase-5.0/ti33x/interfaces  |   12 +++++++-----
> 3 files changed, 21 insertions(+), 15 deletions(-)
>=20
> diff --git a/recipes-core/netbase/netbase-5.0/omap3/interfaces =
b/recipes-core/netbase/netbase-5.0/omap3/interfaces
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

That doesn't exist on beagleboard, but it does get added to the =
interfaces file for no reason, NAK

> iface atml0 inet dhcp
>=20
> # Wired or wireless interfaces
> auto eth0
> iface eth0 inet dhcp
> +        pre-up /bin/grep -v -e =
"ip=3D[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+" /proc/cmdline > /dev/null

Ehm....


> +
> iface eth1 inet dhcp
>=20
> # Ethernet/RNDIS gadget (g_ether)
> # ... or on host side, usbnet and random hwaddr
> -iface usb0 inet static
> -	address 192.168.7.2
> -	netmask 255.255.255.0
> -	network 192.168.7.0
> -	gateway 192.168.7.1
> +iface usb0 inet dhcp

Breaks beagleboard usage

>=20
> # Bluetooth networking
> iface bnep0 inet dhcp
> diff --git a/recipes-core/netbase/netbase-5.0/omapl138/interfaces =
b/recipes-core/netbase/netbase-5.0/omapl138/interfaces
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
> +        pre-up /bin/grep -v -e =
"ip=3D[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+" /proc/cmdline > /dev/null
> +
> iface eth1 inet dhcp
>=20
> # Ethernet/RNDIS gadget (g_ether)
> # ... or on host side, usbnet and random hwaddr
> -iface usb0 inet static
> -	address 192.168.7.2
> -	netmask 255.255.255.0
> -	network 192.168.7.0
> -	gateway 192.168.7.1
> +iface usb0 inet dhcp
>=20
> # Bluetooth networking
> iface bnep0 inet dhcp
> diff --git a/recipes-core/netbase/netbase-5.0/ti33x/interfaces =
b/recipes-core/netbase/netbase-5.0/ti33x/interfaces
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
> +        pre-up /bin/grep -v -e =
"ip=3D[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+" /proc/cmdline > /dev/null
> +
> iface eth1 inet dhcp
>=20
> # Ethernet/RNDIS gadget (g_ether)
> # ... or on host side, usbnet and random hwaddr
> -iface usb0 inet static
> -	address 192.168.7.2
> -	netmask 255.255.255.0
> -	network 192.168.7.0
> -	gateway 192.168.7.1
> +iface usb0 inet dhcp

breaks beaglebone


LIke I said before, this is an 'arago' interfaces file, not specific to =
the SoCs, so please put it in the arago layer instead of breaking =
everything by putting it in meta-ti=

