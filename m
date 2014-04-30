Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2EF39E0099B; Wed, 30 Apr 2014 13:20:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
X-Greylist: delayed 189 seconds by postgrey-1.32 at yocto-www;
	Wed, 30 Apr 2014 13:20:02 PDT
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D3805E0098E
	for <meta-ti@yoctoproject.org>; Wed, 30 Apr 2014 13:20:02 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s3UKGLq2024928;
	Wed, 30 Apr 2014 15:16:21 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3UKGLw4007595;
	Wed, 30 Apr 2014 15:16:21 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Wed, 30 Apr 2014 15:16:20 -0500
From: "Murphy, Dan" <dmurphy@ti.com>
To: Vanderpool Josh <Joshua.Vanderpool@raymondcorp.com>, "Maupin, Chase"
	<chase.maupin@ti.com>,
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: Kernel Hang I2C1??
Thread-Index: Ac9kjbK9NF7l2hAPTFGOrV7u1lzpFAAHjaAAAACCXLAAAHEnkAAAGDIAAAAxJQY=
Date: Wed, 30 Apr 2014 20:16:18 +0000
Message-ID: <00FC9A978A94B7418C33AFAE8A35ED49CAD148@DFLE09.ent.ti.com>
References: <7D1F292BE8E4CC4F93079C1A7A58D5622BA96E10@USNYGRMBX4.raymondcorp.local>,
	<7D46E86EC0A8354091174257B2FED1015CFC6122@DLEE11.ent.ti.com>,
	<7D1F292BE8E4CC4F93079C1A7A58D5622BA96F34@USNYGRMBX4.raymondcorp.local>
	<00FC9A978A94B7418C33AFAE8A35ED49CAD12B@DFLE09.ent.ti.com>,
	<7D1F292BE8E4CC4F93079C1A7A58D5622BA96F4E@USNYGRMBX4.raymondcorp.local>
In-Reply-To: <7D1F292BE8E4CC4F93079C1A7A58D5622BA96F4E@USNYGRMBX4.raymondcorp.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.91.86.186]
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 30 Apr 2014 13:22:22 -0700
Subject: Re: Kernel Hang I2C1??
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
X-List-Received-Date: Wed, 30 Apr 2014 20:20:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

OK I2C1 pins should be

	i2c1_pins: pinmux_i2c1_pins {
		pinctrl-single,pins =3D <
			0x158 (PIN_INPUT_PULLUP | MUX_MODE2) 	/* uart1_ctsn.i2c2_sda*/
			0x15c (PIN_INPUT_PULLUP | MUX_MODE2)	/* uart1_rtsn.i2c2_scl */
		>;
	};


Dan
-----------------------------------------------------
Dan  Murphy
Texas Instruments Inc.
________________________________________
From: Vanderpool Josh [Joshua.Vanderpool@raymondcorp.com]
Sent: Wednesday, April 30, 2014 3:13 PM
To: Murphy, Dan; Maupin, Chase; meta-ti@yoctoproject.org
Subject: RE: Kernel Hang I2C1??

Due to my custom board constraints I connected the PMIC and RTC etc  to I2C=
1 at pins.  I only mention BBB as I used the same PMIC and eMMC...
I also referred to the am335x-sk schematic during development.


   i2c1_pins: pinmux_i2c1_pins {
                        pinctrl-single,pins =3D <
                                0x180 (PIN_INPUT_PULLUP | MUX_MODE3)    /* =
uart1_rx.i2c1_sda */
                                0x184 (PIN_INPUT_PULLUP | MUX_MODE3)    /* =
uart1_tx.i2c1_scl */
                        >;
                };

-Josh Vanderpool

-----Original Message-----
From: Murphy, Dan [mailto:dmurphy@ti.com]
Sent: Wednesday, April 30, 2014 4:08 PM
To: Vanderpool Josh; Maupin, Chase; meta-ti@yoctoproject.org
Subject: RE: Kernel Hang I2C1??

I guess I am not sure how this device is connected

This device that is being connected to I2C1 on the BBB is off the P9 connec=
tor correct?
Or is it hard wired?

Dan

-----------------------------------------------------
Dan  Murphy
Texas Instruments Inc.
________________________________________
From: Vanderpool Josh [Joshua.Vanderpool@raymondcorp.com]
Sent: Wednesday, April 30, 2014 3:00 PM
To: Maupin, Chase; meta-ti@yoctoproject.org; Murphy, Dan
Subject: RE: Kernel Hang I2C1??

Chase,

I followed the entry in am335x-evm to add i2c1 rather than i2c0 in the beag=
le bone black dts.

FYI what ever we find i will add to the post at http://e2e.ti.com/support/a=
rm/sitara_arm/f/791/p/335136/1179969.aspx#1179969

Thanks
-josh
________________________________________
From: Maupin, Chase [chase.maupin@ti.com]
Sent: Wednesday, April 30, 2014 3:40 PM
To: Vanderpool Josh; meta-ti@yoctoproject.org; Murphy, Dan
Subject: RE: Kernel Hang I2C1??

Josh,

Do you have the I2C2 entry in your DT?  There are examples in the am33xx.dt=
si file.

Sincerely,
Chase Maupin
Integration Team Manager
Linux Core Product Development
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://e2e.ti.com<http://e2e.ti.com/>
Wiki - http://processors.wiki.ti.com/index.php/Main_Page

From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Vanderpool Josh
Sent: Wednesday, April 30, 2014 9:03 AM
To: meta-ti@yoctoproject.org
Subject: [meta-ti] Kernel Hang I2C1??

I have a custom board and expect to use i2c1 on the board but it appears to=
 not allow this in the kernel... u-boot was able to be modified to support =
the hardware port i2c1.  Note that that software is 1based and hardware is =
zero-based...

This is the dump:
*        [    1.482628] ------------[ cut here ]------------
*        [    1.487549] WARNING: CPU: 0 PID: 1 at arch/arm/mach-omap2/omap_=
device.c:888 omap_device_get_by_hwmod_name+0x94/0xb4()
*        [    1.498803] omap_device_get_by_hwmod_name: no omap_device for i=
2c1
*        [    1.505365] Modules linked in:
*        [    1.508606] CPU: 0 PID: 1 Comm: swapper Not tainted 3.12.10-ti2=
013.12.01 #2
*        [    1.515990] Backtrace:
*        [    1.518595] [<c0017880>] (dump_backtrace+0x0/0x10c) from [<c001=
7a1c>] (show_stack+0x18/0x1c)
*        [    1.527542]  r6:c002f564 r5:00000009 r4:dd083e28 r3:00000000
*        [    1.533567] [<c0017a04>] (show_stack+0x0/0x1c) from [<c0580ba4>=
] (dump_stack+0x20/0x28)
*        [    1.542068] [<c0580b84>] (dump_stack+0x0/0x28) from [<c0046d08>=
] (warn_slowpath_common+0x70/0x90)
*        [    1.551480] [<c0046c98>] (warn_slowpath_common+0x0/0x90) from [=
<c0046dcc>] (warn_slowpath_fmt+0x38/0x40)
*        [    1.561528]  r8:c076b3fc r7:c0768410 r6:c0c8c9ac r5:c084df08 r4=
:c06b9fa4
*        [    1.568647] [<c0046d94>] (warn_slowpath_fmt+0x0/0x40) from [<c0=
02f564>] (omap_device_get_by_hwmod_name+0x94/0xb4)
*        [    1.579523]  r3:c058be8c r2:c06b6584
*        [    1.583341] [<c002f4d0>] (omap_device_get_by_hwmod_name+0x0/0xb=
4) from [<c0778280>] (am33xx_pm_init+0x204/0x45c)
*        [    1.594120]  r4:00000000
*        [    1.596808] [<c077807c>] (am33xx_pm_init+


The full capture is http://pastebin.com/VyY8CQ0L

I found where roughly where there might be an issue...pm33xx.c as line#395 =
states it can only use bus i2c1(one based(I assume this is i2c0)) Note I do=
 not need smart reflex or sleep mode at all so any patches to work around t=
his are welcome.

Thanks

Josh Vanderpool
Electrical Engineer


Confidentiality Notice: The preceding e-mail message (including any attachm=
ents) contains information that may be confidential, protected by applicabl=
e legal privileges, or constitute non-public information. It is intended to=
 be conveyed only to the designated recipient(s). If you are not an intende=
d recipient of this message, please notify the sender by replying to this m=
essage and then delete it from your system. Use, dissemination, distributio=
n or reproduction of this message by unintended recipients is not authorize=
d and may be unlawful.

Confidentiality Notice:

The preceding e-mail message (including any attachments) contains informati=
on that may be confidential, protected by applicable legal privileges, or c=
onstitute non-public information. It is intended to be conveyed only to the=
 designated recipient(s). If you are not an intended recipient of this mess=
age, please notify the sender by replying to this message and then delete i=
t from your system. Use, dissemination, distribution or reproduction of thi=
s message by unintended recipients is not authorized and may be unlawful.


Confidentiality Notice:

The preceding e-mail message (including any attachments) contains informati=
on that may be confidential, protected by applicable legal privileges, or c=
onstitute non-public information. It is intended to be conveyed only to the=
 designated recipient(s). If you are not an intended recipient of this mess=
age, please notify the sender by replying to this message and then delete i=
t from your system. Use, dissemination, distribution or reproduction of thi=
s message by unintended recipients is
not authorized and may be unlawful.




