Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wy0-f176.google.com (mail-wy0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ABE9DE01366
	for <meta-ti@yoctoproject.org>; Thu,  3 Nov 2011 01:38:54 -0700 (PDT)
Received: by wyg34 with SMTP id 34so1406230wyg.35
	for <meta-ti@yoctoproject.org>; Thu, 03 Nov 2011 01:38:53 -0700 (PDT)
Received: by 10.227.205.20 with SMTP id fo20mr10354727wbb.20.1320309532508;
	Thu, 03 Nov 2011 01:38:52 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id e7sm8798717wbh.12.2011.11.03.01.38.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Nov 2011 01:38:51 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1320280830-21712-1-git-send-email-joelagnel@ti.com>
Date: Thu, 3 Nov 2011 09:38:48 +0100
Message-Id: <98D6E15E-0345-4909-9A89-A458C0F525D3@dominion.thruhere.net>
References: <1320280830-21712-1-git-send-email-joelagnel@ti.com>
To: Joel A Fernandes <joelagnel@ti.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: meta-ti@yoctoproject.org
Subject: Re: [RFC] linux-ti335x-psp 3.1: More modular and comprehensive defconfig for BeagleBone kernel
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
X-List-Received-Date: Thu, 03 Nov 2011 08:38:56 -0000
X-Groupsio-MsgNum: 71
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B005E371-DEC4-4675-B35E-A7B86C67E992";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_B005E371-DEC4-4675-B35E-A7B86C67E992
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

This needs a PR bump as well, but I'll fold it in with the previous =
kernel patch you sent that does have a PR bump.

Op 3 nov. 2011, om 01:40 heeft Joel A Fernandes het volgende geschreven:

> Networking:
> CONFIG_NETFILTER=3D*   - were enabled as modules in beagle xM
> Enabled options for ARP and IP tables as modules for the bone kernel.
> CONFIG_NET_SCH=3D      - networking schedulers, enabled as modules
>=20
> IR:
> Infrared and dongle support, enabled as modules.
> Made RFSwitch subsystem as a module
>=20
> USB:
> Added support for usb-serial and miscellaneous devices as modules.
>=20
> I also used the kernel .config we used for the -xM for comparison =
purposes.
>=20
> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
> ---
> .../linux/linux-ti33x-psp-3.1/beaglebone/defconfig |  122 =
+++++++++++++++-----
> 1 files changed, 94 insertions(+), 28 deletions(-)
>=20
> diff --git =
a/recipes-kernel/linux/linux-ti33x-psp-3.1/beaglebone/defconfig =
b/recipes-kernel/linux/linux-ti33x-psp-3.1/beaglebone/defconfig
> index 4508d22..2f2fb25 100644
> --- a/recipes-kernel/linux/linux-ti33x-psp-3.1/beaglebone/defconfig
> +++ b/recipes-kernel/linux/linux-ti33x-psp-3.1/beaglebone/defconfig
> @@ -617,16 +617,15 @@ CONFIG_BRIDGE_NETFILTER=3Dy
> # CONFIG_NETFILTER_NETLINK_QUEUE is not set
> # CONFIG_NETFILTER_NETLINK_LOG is not set
> # CONFIG_NF_CONNTRACK is not set
> -# CONFIG_NETFILTER_XTABLES is not set
> -# CONFIG_IP_VS is not set
> +CONFIG_NETFILTER_XTABLES=3Dm
>=20
> #
> # IP: Netfilter Configuration
> #
> # CONFIG_NF_DEFRAG_IPV4 is not set
> # CONFIG_IP_NF_QUEUE is not set
> -# CONFIG_IP_NF_IPTABLES is not set
> -# CONFIG_IP_NF_ARPTABLES is not set
> +CONFIG_IP_NF_IPTABLES=3Dm
> +CONFIG_IP_NF_ARPTABLES=3Dm
>=20
> #
> # IPv6: Netfilter Configuration
> @@ -664,12 +663,12 @@ CONFIG_NET_SCHED=3Dy
> #
> # Queueing/Scheduling
> #
> -# CONFIG_NET_SCH_CBQ is not set
> -# CONFIG_NET_SCH_HTB is not set
> -# CONFIG_NET_SCH_HFSC is not set
> -# CONFIG_NET_SCH_PRIO is not set
> -# CONFIG_NET_SCH_MULTIQ is not set
> -# CONFIG_NET_SCH_RED is not set
> +CONFIG_NET_SCH_CBQ=3Dm
> +CONFIG_NET_SCH_HTB=3Dm
> +CONFIG_NET_SCH_HFSC=3Dm
> +CONFIG_NET_SCH_PRIO=3Dm
> +CONFIG_NET_SCH_MULTIQ=3Dm
> +CONFIG_NET_SCH_RED=3Dm
> # CONFIG_NET_SCH_SFB is not set
> # CONFIG_NET_SCH_SFQ is not set
> # CONFIG_NET_SCH_TEQL is not set
> @@ -734,9 +733,9 @@ CONFIG_IRDA=3Dm
> #
> # IrDA protocols
> #
> -# CONFIG_IRLAN is not set
> -# CONFIG_IRNET is not set
> -# CONFIG_IRCOMM is not set
> +CONFIG_IRLAN=3Dm
> +CONFIG_IRNET=3Dm
> +CONFIG_IRCOMM=3Dm
> # CONFIG_IRDA_ULTRA is not set
>=20
> #
> @@ -753,21 +752,22 @@ CONFIG_IRDA=3Dm
> #
> # SIR device drivers
> #
> -# CONFIG_IRTTY_SIR is not set
> +CONFIG_IRTTY_SIR=3Dm
>=20
> #
> # Dongle support
> #
> -# CONFIG_KINGSUN_DONGLE is not set
> -# CONFIG_KSDAZZLE_DONGLE is not set
> -# CONFIG_KS959_DONGLE is not set
> +# CONFIG_DONGLE is not set
> +CONFIG_KINGSUN_DONGLE=3Dm
> +CONFIG_KSDAZZLE_DONGLE=3Dm
> +CONFIG_KS959_DONGLE=3Dm
>=20
> #
> # FIR device drivers
> #
> -# CONFIG_USB_IRDA is not set
> -# CONFIG_SIGMATEL_FIR is not set
> -# CONFIG_MCS_FIR is not set
> +CONFIG_USB_IRDA=3Dm
> +CONFIG_SIGMATEL_FIR=3Dm
> +CONFIG_MCS_FIR=3Dm
> CONFIG_BT=3Dm
> CONFIG_BT_L2CAP=3Dy
> CONFIG_BT_SCO=3Dy
> @@ -827,7 +827,7 @@ CONFIG_MAC80211_RC_DEFAULT=3D"pid"
> # CONFIG_MAC80211_DEBUG_MENU is not set
> CONFIG_WIMAX=3Dm
> CONFIG_WIMAX_DEBUG_LEVEL=3D8
> -CONFIG_RFKILL=3Dy
> +CONFIG_RFKILL=3Dm
> CONFIG_RFKILL_LEDS=3Dy
> CONFIG_RFKILL_INPUT=3Dy
> CONFIG_RFKILL_REGULATOR=3Dm
> @@ -2559,7 +2559,71 @@ CONFIG_USB_LIBUSUAL=3Dy
> #
> # CONFIG_USB_USS720 is not set
> CONFIG_USB_SERIAL=3Dm
> +CONFIG_USB_EZUSB=3Dy
> +# CONFIG_USB_SERIAL_GENERIC is not set
> +CONFIG_USB_SERIAL_AIRCABLE=3Dm
> +CONFIG_USB_SERIAL_ARK3116=3Dm
> +CONFIG_USB_SERIAL_BELKIN=3Dm
> +CONFIG_USB_SERIAL_CH341=3Dm
> +CONFIG_USB_SERIAL_WHITEHEAT=3Dm
> +CONFIG_USB_SERIAL_DIGI_ACCELEPORT=3Dm
> +CONFIG_USB_SERIAL_CP210X=3Dm
> +CONFIG_USB_SERIAL_CYPRESS_M8=3Dm
> +CONFIG_USB_SERIAL_EMPEG=3Dm
> +CONFIG_USB_SERIAL_FTDI_SIO=3Dm
> +CONFIG_USB_SERIAL_FUNSOFT=3Dm
> +CONFIG_USB_SERIAL_VISOR=3Dm
> +CONFIG_USB_SERIAL_IPAQ=3Dm
> +CONFIG_USB_SERIAL_IR=3Dm
> +CONFIG_USB_SERIAL_EDGEPORT=3Dm
> +CONFIG_USB_SERIAL_EDGEPORT_TI=3Dm
> +CONFIG_USB_SERIAL_GARMIN=3Dm
> +CONFIG_USB_SERIAL_IPW=3Dm
> +CONFIG_USB_SERIAL_IUU=3Dm
> +CONFIG_USB_SERIAL_KEYSPAN_PDA=3Dm
> +CONFIG_USB_SERIAL_KEYSPAN=3Dm
> +# CONFIG_USB_SERIAL_KEYSPAN_MPR is not set
> +# CONFIG_USB_SERIAL_KEYSPAN_USA28 is not set
> +# CONFIG_USB_SERIAL_KEYSPAN_USA28X is not set
> +# CONFIG_USB_SERIAL_KEYSPAN_USA28XA is not set
> +# CONFIG_USB_SERIAL_KEYSPAN_USA28XB is not set
> +# CONFIG_USB_SERIAL_KEYSPAN_USA19 is not set
> +# CONFIG_USB_SERIAL_KEYSPAN_USA18X is not set
> +# CONFIG_USB_SERIAL_KEYSPAN_USA19W is not set
> +# CONFIG_USB_SERIAL_KEYSPAN_USA19QW is not set
> +# CONFIG_USB_SERIAL_KEYSPAN_USA19QI is not set
> +# CONFIG_USB_SERIAL_KEYSPAN_USA49W is not set
> +# CONFIG_USB_SERIAL_KEYSPAN_USA49WLC is not set
> +CONFIG_USB_SERIAL_KLSI=3Dm
> +CONFIG_USB_SERIAL_KOBIL_SCT=3Dm
> +CONFIG_USB_SERIAL_MCT_U232=3Dm
> +CONFIG_USB_SERIAL_MOS7720=3Dm
> +# CONFIG_USB_SERIAL_MOS7715_PARPORT is not set
> +CONFIG_USB_SERIAL_MOS7840=3Dm
> +CONFIG_USB_SERIAL_MOTOROLA=3Dm
> +CONFIG_USB_SERIAL_NAVMAN=3Dm
> CONFIG_USB_SERIAL_PL2303=3Dm
> +CONFIG_USB_SERIAL_OTI6858=3Dm
> +CONFIG_USB_SERIAL_QCAUX=3Dm
> +CONFIG_USB_SERIAL_QUALCOMM=3Dm
> +CONFIG_USB_SERIAL_SPCP8X5=3Dm
> +CONFIG_USB_SERIAL_HP4X=3Dm
> +CONFIG_USB_SERIAL_SAFE=3Dm
> +# CONFIG_USB_SERIAL_SAFE_PADDED is not set
> +CONFIG_USB_SERIAL_SIEMENS_MPI=3Dm
> +CONFIG_USB_SERIAL_SIERRAWIRELESS=3Dm
> +# CONFIG_USB_SERIAL_SYMBOL is not set
> +# CONFIG_USB_SERIAL_TI is not set
> +# CONFIG_USB_SERIAL_CYBERJACK is not set
> +# CONFIG_USB_SERIAL_XIRCOM is not set
> +CONFIG_USB_SERIAL_WWAN=3Dm
> +# CONFIG_USB_SERIAL_OPTION is not set
> +# CONFIG_USB_SERIAL_OMNINET is not set
> +CONFIG_USB_SERIAL_OPTICON=3Dm
> +CONFIG_USB_SERIAL_VIVOPAY_SERIAL=3Dm
> +CONFIG_USB_SERIAL_ZIO=3Dm
> +CONFIG_USB_SERIAL_SSU100=3Dm
> +CONFIG_USB_SERIAL_DEBUG=3Dm
>=20
> #
> # USB Miscellaneous drivers
> @@ -2569,13 +2633,13 @@ CONFIG_USB_SERIAL_PL2303=3Dm
> # CONFIG_USB_ADUTUX is not set
> # CONFIG_USB_SEVSEG is not set
> # CONFIG_USB_RIO500 is not set
> -# CONFIG_USB_LEGOTOWER is not set
> -# CONFIG_USB_LCD is not set
> -# CONFIG_USB_LED is not set
> -# CONFIG_USB_CYPRESS_CY7C63 is not set
> -# CONFIG_USB_CYTHERM is not set
> -# CONFIG_USB_IDMOUSE is not set
> -# CONFIG_USB_FTDI_ELAN is not set
> +CONFIG_USB_LEGOTOWER=3Dm
> +CONFIG_USB_LCD=3Dm
> +CONFIG_USB_LED=3Dm
> +CONFIG_USB_CYPRESS_CY7C63=3Dm
> +CONFIG_USB_CYTHERM=3Dm
> +CONFIG_USB_IDMOUSE=3Dm
> +CONFIG_USB_FTDI_ELAN=3Dm
> CONFIG_USB_APPLEDISPLAY=3Dm
> CONFIG_USB_SISUSBVGA=3Dm
> CONFIG_USB_SISUSBVGA_CON=3Dy
> @@ -2790,6 +2854,8 @@ CONFIG_R8712_AP=3Dy
> # CONFIG_TRANZPORT is not set
> # CONFIG_POHMELFS is not set
> # CONFIG_LINE6_USB is not set
> +CONFIG_USB_SERIAL_QUATECH2=3Dm
> +CONFIG_USB_SERIAL_QUATECH_USB2=3Dm
> # CONFIG_VT6656 is not set
> CONFIG_IIO=3Dy
> CONFIG_IIO_RING_BUFFER=3Dy
> --=20
> 1.7.4.1
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


--Apple-Mail=_B005E371-DEC4-4675-B35E-A7B86C67E992
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk6yUxkACgkQMkyGM64RGpGx/wCeN+2RFxLRe+SKD9jXjFwSL5fV
IoUAn0qedSNpG/rhnbMdrhiTi7OsancN
=RQXu
-----END PGP SIGNATURE-----

--Apple-Mail=_B005E371-DEC4-4675-B35E-A7B86C67E992--
