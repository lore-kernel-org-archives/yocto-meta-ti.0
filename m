Return-Path: <joelagnel@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1A432E005BB
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2011 21:57:06 -0700 (PDT)
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id p9Q4v1Tr020588
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2011 23:57:04 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep34.itg.ti.com (8.13.7/8.13.8) with ESMTP id p9Q4v1Mm022396
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2011 23:57:01 -0500 (CDT)
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p9Q4v0Pm003015
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2011 23:57:01 -0500 (CDT)
Received: from DLEE09.ent.ti.com ([fe80::a026:b4ad:3e78:5ae5]) by
	DFLE70.ent.ti.com ([fe80::db3:609a:aa62:e1ec%22]) with mapi id
	14.01.0323.003; Tue, 25 Oct 2011 23:57:01 -0500
From: "Fernandes, Joel A" <joelagnel@ti.com>
To: "Kridner, Jason" <jdk@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [PATCH meta-ti] linux-ti33x-psp 3.1rc8: Enable usb-to-serial
	drivers
Thread-Index: AQHMk3ZQ31RtKoPQi06Zu7fNogJ/s5WOVNMA//+65hA=
Date: Wed, 26 Oct 2011 04:56:59 +0000
Message-ID: <083BC63EECB6FD41B8E81CF7FD87CC0F041DA4@DLEE09.ent.ti.com>
References: <1319587995-11126-1-git-send-email-joelagnel@ti.com>
	<F61A9010E56D7F4C93A19FD36DAAC3590B9B9A@DFLE34.ent.ti.com>
In-Reply-To: <F61A9010E56D7F4C93A19FD36DAAC3590B9B9A@DFLE34.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH meta-ti] linux-ti33x-psp 3.1rc8: Enable usb-to-serial drivers
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
X-List-Received-Date: Wed, 26 Oct 2011 04:57:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Jason,

> Can you also enable other types of USB host adapters?  We want to have
> a fairly exhaustive set, including just about every USB-to-serial
> adapter.

Actually considering that the actual UART is connected to the FTDI and prov=
ided from the device
port, do we still want to do this? For the case of the bone tester board, w=
e're controlling
the hardware so we have a specific usb-serial device we'd like to have enab=
led in the kernel.
For customers running tests after the board ships, they can always run the =
individual tests
and see the output on the FTDI serial port. For a regular serial console, t=
hey already have one
so they don't need a usb-serial device, in the case of the tester we had to=
 do this because we
run out of ports due to the loopback.

> I had been thinking that Koen has some mechanism where USB drivers are
> registered after boot based on this set of messages in the kernel
> bootlog:
> [    0.254977] usbcore: registered new interface driver catc
> [    0.254991] catc: v2.8:CATC EL1210A NetMate USB Ethernet driver
> [    0.255057] usbcore: registered new interface driver kaweth
> [    0.255074] pegasus: v0.6.14 (2006/09/27), Pegasus/Pegasus II USB
> Ethernet driver
> [    0.255142] usbcore: registered new interface driver pegasus
> [    0.255157] rtl8150: v0.6.2 (2004/08/27):rtl8150 based usb-ethernet
> driver

I think the mechanism is the init functions of the drivers register themsel=
ves with the USB
Subsystem when the kernel boots. Also the messages above occur before root =
filesystem mounts so
don't think Koen is doing anything there.

> [    0.255233] usbcore: registered new interface driver rtl8150
> [    0.255299] usbcore: registered new interface driver asix
> [    0.255366] usbcore: registered new interface driver cdc_ether
> [    0.255433] usbcore: registered new interface driver dm9601
> [    0.255500] usbcore: registered new interface driver cdc_subset
> [    0.255566] usbcore: registered new interface driver zaurus
> [    0.255623] cdc_ncm: 04-Aug-2011
> [    0.255693] usbcore: registered new interface driver cdc_ncm
> [    0.255817] usbcore: registered new interface driver cdc_acm
> [    0.255831] cdc_acm: USB Abstract Control Model driver for USB
> modems and ISDN adapters
> [    0.255927] usbcore: registered new interface driver usblp
> [    0.255997] usbcore: registered new interface driver cdc_wdm
>=20
> However, looking at the defconfig, it seems these are just set as Y,
> the same as you have done.  Just wondering if you had any clarity to
> add to that with ideas on how we can make the kernel smaller for a fast
> boot while still handling more devices.  I hate for people to have to
> reconfigure the kernel just because we didn't compile something useful
> into it.

We could build them as modules, but I don't think we should include any mor=
e
usb-to-serial drivers even as modules as the onboard FTDI is already provid=
ing this.

Koen has provided a pretty exhaustive defconfig as we know :)

Thanks,
Joel

