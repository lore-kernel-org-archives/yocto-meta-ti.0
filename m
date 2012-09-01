Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 59153E00283
	for <meta-ti@yoctoproject.org>; Fri, 31 Aug 2012 23:48:29 -0700 (PDT)
Received: by eabd1 with SMTP id d1so1197009eab.35
	for <meta-ti@yoctoproject.org>; Fri, 31 Aug 2012 23:48:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=ijQ0yNcKxO9NAJMoqwIlCCEs5xVcS/x0OvJUXje+Hu4=;
	b=Pr3YDqgvNSlVWNj+tU2yK31Ih668DEF6wGnnV73ZH2NxASeuEnnXbRt7w52aW6wFce
	GgVIMs0q05lclkUj+/Qn5Sn33QmJI58tIZov7W5t9D1GFm6Nxxec59kStHo9Dnq3VRa9
	TLIQGzi+aex6K8+hg50eTG7VsiLdEK5bE2dV/1l744bUFnsVGesmpi8FfgYY74VTfHL1
	PNRWqqmwTgGmfdZvzp8mzZV8lkOqesT16KmuyGQ5Q3PVY8ms5pPrnuyuT/4PEQ1a2k4w
	rKQdrpHlMbApl+OtnPixMOef1ysA3kxxWMG9IKahEOP+rPYkJgRcfhUeA1+hzCegv07T
	btNg==
Received: by 10.14.204.72 with SMTP id g48mr14033398eeo.45.1346482107924;
	Fri, 31 Aug 2012 23:48:27 -0700 (PDT)
Received: from ?IPv6:2001:610:612::25f1:f0f1:353a:2c7f?
	([2001:610:612:0:25f1:f0f1:353a:2c7f])
	by mx.google.com with ESMTPS id v3sm19033551eep.10.2012.08.31.23.48.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 31 Aug 2012 23:48:26 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1346450061-6913-1-git-send-email-fcooperjr27@gmail.com>
Date: Sat, 1 Sep 2012 08:48:22 +0200
Message-Id: <6EE46766-A9D2-4440-B245-28354F59B4D5@dominion.thruhere.net>
References: <1346450061-6913-1-git-send-email-fcooperjr27@gmail.com>
To: fcooperjr27@gmail.com
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQmKyRYRZ2TxEQVffArzeTS+lInNOwuajlukdDbwX7aJu5pLi94X29JgVMdYfb08MOtRhb1Y
Cc: meta-ti@yoctoproject.org
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
X-List-Received-Date: Sat, 01 Sep 2012 06:48:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 31 aug. 2012, om 23:54 heeft fcooperjr27@gmail.com het volgende =
geschreven:

> From: Franklin S Cooper Jr <fcooper@ti.com>
>=20
> * Add PRINC
> * Create copies of the interfaces file that was grabbed from oe-core
>  and copy it into TI SOC families specific directories
> * Update to use the new syntax for extending the file search path
>=20
> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
> ---
> recipes-core/netbase/netbase-5.0/omap3/interfaces  |   31 =
++++++++++++++++++++
> .../netbase/netbase-5.0/omapl138/interfaces        |   31 =
++++++++++++++++++++
> recipes-core/netbase/netbase-5.0/ti33x/interfaces  |   31 =
++++++++++++++++++++

So all subartic and omap3 machines will now get a different interfaces =
file. Not a good idea. NAK

> recipes-core/netbase/netbase_5.0.bbappend          |    5 ++-
> 4 files changed, 96 insertions(+), 2 deletions(-)
> create mode 100644 recipes-core/netbase/netbase-5.0/omap3/interfaces
> create mode 100644 =
recipes-core/netbase/netbase-5.0/omapl138/interfaces
> create mode 100644 recipes-core/netbase/netbase-5.0/ti33x/interfaces
>=20
> diff --git a/recipes-core/netbase/netbase-5.0/omap3/interfaces =
b/recipes-core/netbase/netbase-5.0/omap3/interfaces
> new file mode 100644
> index 0000000..0acf4cf
> --- /dev/null
> +++ b/recipes-core/netbase/netbase-5.0/omap3/interfaces
> @@ -0,0 +1,31 @@
> +# /etc/network/interfaces -- configuration file for ifup(8), =
ifdown(8)
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
> +# ... or on host side, usbnet and random hwaddr
> +iface usb0 inet static
> +	address 192.168.7.2
> +	netmask 255.255.255.0
> +	network 192.168.7.0
> +	gateway 192.168.7.1
> +
> +# Bluetooth networking
> +iface bnep0 inet dhcp
> +
> diff --git a/recipes-core/netbase/netbase-5.0/omapl138/interfaces =
b/recipes-core/netbase/netbase-5.0/omapl138/interfaces
> new file mode 100644
> index 0000000..0acf4cf
> --- /dev/null
> +++ b/recipes-core/netbase/netbase-5.0/omapl138/interfaces
> @@ -0,0 +1,31 @@
> +# /etc/network/interfaces -- configuration file for ifup(8), =
ifdown(8)
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
> +# ... or on host side, usbnet and random hwaddr
> +iface usb0 inet static
> +	address 192.168.7.2
> +	netmask 255.255.255.0
> +	network 192.168.7.0
> +	gateway 192.168.7.1
> +
> +# Bluetooth networking
> +iface bnep0 inet dhcp
> +
> diff --git a/recipes-core/netbase/netbase-5.0/ti33x/interfaces =
b/recipes-core/netbase/netbase-5.0/ti33x/interfaces
> new file mode 100644
> index 0000000..0acf4cf
> --- /dev/null
> +++ b/recipes-core/netbase/netbase-5.0/ti33x/interfaces
> @@ -0,0 +1,31 @@
> +# /etc/network/interfaces -- configuration file for ifup(8), =
ifdown(8)
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
> +# ... or on host side, usbnet and random hwaddr
> +iface usb0 inet static
> +	address 192.168.7.2
> +	netmask 255.255.255.0
> +	network 192.168.7.0
> +	gateway 192.168.7.1
> +
> +# Bluetooth networking
> +iface bnep0 inet dhcp
> +
> diff --git a/recipes-core/netbase/netbase_5.0.bbappend =
b/recipes-core/netbase/netbase_5.0.bbappend
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
> --=20
> 1.7.0.4
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


