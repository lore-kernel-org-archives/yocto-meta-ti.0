Return-Path: <Joshua.Vanderpool@raymondcorp.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 35EB4E0096C; Thu,  1 May 2014 13:00:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
Received: from smtp.raymondcorp.com (smtp.raymondcorp.com [24.97.209.121])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4DF0AE00478
	for <meta-ti@yoctoproject.org>; Thu,  1 May 2014 13:00:38 -0700 (PDT)
Received: from usnygrcas1.raymondcorp.local (nothing.attdns.com
	[130.1.155.194] (may be forged))
	by smtp.raymondcorp.com (8.14.3/8.14.3) with ESMTP id s41K0Ycw011150
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 1 May 2014 15:00:35 -0500
Received: from USNYGRMBX4.raymondcorp.local ([169.254.4.252]) by usnygrcas1
	([130.1.155.198]) with mapi id 14.03.0174.001;
	Thu, 1 May 2014 16:00:34 -0400
From: Vanderpool Josh <Joshua.Vanderpool@raymondcorp.com>
To: "Murphy, Dan" <dmurphy@ti.com>, "Maupin, Chase" <chase.maupin@ti.com>,
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: Kernel Hang I2C1??
Thread-Index: Ac9kjbK9NF7l2hAPTFGOrV7u1lzpFAAHjaAAAACCXLAAAHEnkAAAGDIAAAAxJQYAABPD8AADJv8EAADJUdEAHDTF6AABY11hAADL8toAAU4ZowANtPy0
Date: Thu, 1 May 2014 20:00:34 +0000
Message-ID: <7D1F292BE8E4CC4F93079C1A7A58D5622BA97202@USNYGRMBX4.raymondcorp.local>
References: <7D1F292BE8E4CC4F93079C1A7A58D5622BA96E10@USNYGRMBX4.raymondcorp.local>,
	<7D46E86EC0A8354091174257B2FED1015CFC6122@DLEE11.ent.ti.com>,
	<7D1F292BE8E4CC4F93079C1A7A58D5622BA96F34@USNYGRMBX4.raymondcorp.local>
	<00FC9A978A94B7418C33AFAE8A35ED49CAD12B@DFLE09.ent.ti.com>,
	<7D1F292BE8E4CC4F93079C1A7A58D5622BA96F4E@USNYGRMBX4.raymondcorp.local>
	<00FC9A978A94B7418C33AFAE8A35ED49CAD148@DFLE09.ent.ti.com>,
	<7D1F292BE8E4CC4F93079C1A7A58D5622BA96F7A@USNYGRMBX4.raymondcorp.local>,
	<00FC9A978A94B7418C33AFAE8A35ED49CAD258@DFLE09.ent.ti.com>,
	<00FC9A978A94B7418C33AFAE8A35ED49CAD270@DFLE09.ent.ti.com>,
	<7D1F292BE8E4CC4F93079C1A7A58D5622BA9703D@USNYGRMBX4.raymondcorp.local>,
	<00FC9A978A94B7418C33AFAE8A35ED49CAD838@DFLE09.ent.ti.com>,
	<7D1F292BE8E4CC4F93079C1A7A58D5622BA97114@USNYGRMBX4.raymondcorp.local>,
	<00FC9A978A94B7418C33AFAE8A35ED49CAD894@DFLE09.ent.ti.com>
In-Reply-To: <00FC9A978A94B7418C33AFAE8A35ED49CAD894@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.150.131]
MIME-Version: 1.0
X-mailWatchMessageID: 1398974437.735852.1642.3894935561
X-mailWatchContentScore: Score of 0 assigned to Content
X-mailWatchUCEScore: Score of 0 assigned to UCE
X-mailWatch: Analyzed by IntelliReach MessageScreen(tm)
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
X-List-Received-Date: Thu, 01 May 2014 20:00:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

It was input voltage droop, which caused about 2ms of droop on the output=
 of the PMIC...

I now have a successful boot. http://pastebin.com/wM3ArEnX

On to the next task...

________________________________________
From: Murphy, Dan [dmurphy@ti.com]
Sent: Thursday, May 01, 2014 9:19 AM
To: Vanderpool Josh; Maupin, Chase; meta-ti@yoctoproject.org
Subject: RE: Kernel Hang I2C1??

Josh

I am just wondering if there is a CPU freq voltage mismatch here.
Probably should verify the frequency and voltage to the CPU.

Dan
-----------------------------------------------------
Dan  Murphy
Texas Instruments Inc.
________________________________________
From: Vanderpool Josh [Joshua.Vanderpool@raymondcorp.com]
Sent: Thursday, May 01, 2014 7:56 AM
To: Murphy, Dan; Maupin, Chase; meta-ti@yoctoproject.org
Subject: RE: Kernel Hang I2C1??

The CCCC is due to me having to power cycle to stop the minicom capture a=
s ttyUSB0 goes away when the hang occurs.

I did remove the wake and sleep stuff in the dts for I2C1
Other than following the guide to disable the PM stuff I did not do anyth=
ing else in the menuconfig.

The memory is the same as on the BBB and the layout is identical, I did s=
cope the clock and LDQS and the signals look great
-the SDK6.0 U-boot had a memtest and that ran for a long time with out is=
sue.

In u-boot i setup voltages as if it were a BBB. my device is a 800MHz dev=
ice so i do not go turbo it should read the speed from the device.
-pastebin-> http://pastebin.com/dL0vRvrv

>>This seems a little suspicious.
>>[    1.469500] cpu cpu0: cpu0 regulator not ready, retry
>>[    1.474991] platform cpufreq-cpu0.0: Driver cpufreq-cpu0 requests pr=
obe deferral
this must come from the dts?
        cpus {
                cpu@0 {
                        cpu0-supply =3D <&dcdc2_reg>;
                };
        };

josh
________________________________________
From: Murphy, Dan [dmurphy@ti.com]
Sent: Thursday, May 01, 2014 8:26 AM
To: Vanderpool Josh; Maupin, Chase; meta-ti@yoctoproject.org
Subject: RE: Kernel Hang I2C1??

Josh

It appears that the device rebooted.

And it looks like you are now communicating with the regulator now.
Did you make any other changes beyond disabling PM?

Are the memory timings setup correctly?
Are you supplying enough voltage/current to the CPU?
Does your voltage and OPP match?

This seems a little suspicious.
[    1.469500] cpu cpu0: cpu0 regulator not ready, retry
[    1.474991] platform cpufreq-cpu0.0: Driver cpufreq-cpu0 requests prob=
e deferral

Maybe you are setting up a frequency that the voltage does not support.  =
For instance setting
the CPU to OPP100 with an OPP50 voltage.


Dan
-----------------------------------------------------
Dan  Murphy
Texas Instruments Inc.
________________________________________
From: Vanderpool Josh [Joshua.Vanderpool@raymondcorp.com]
Sent: Thursday, May 01, 2014 6:40 AM
To: Murphy, Dan; Maupin, Chase; meta-ti@yoctoproject.org
Subject: RE: Kernel Hang I2C1??

I attempted disabling the PM but now i just get a hang with no dump?
My new capture->http://pastebin.com/nf5XThRV

Is there something i can do to get more messages from the kernel during b=
oot to indicate the problem?

Thanks for the continued support.
josh
________________________________________
From: Murphy, Dan [dmurphy@ti.com]
Sent: Wednesday, April 30, 2014 6:10 PM
To: Vanderpool Josh; Maupin, Chase; meta-ti@yoctoproject.org
Subject: RE: Kernel Hang I2C1??

Josh
Disregard this statement I see you are doing it that way

"Plus instead of recreating the whole memory map you the idea was to inhe=
rit other dt files to build so your board just becomes a child.
You can always override the defaults in your child dt file.
At the very least you could pull in the am33xx.dtsi which contains the me=
mory map"

-----------------------------------------------------
Dan  Murphy
Texas Instruments Inc.
________________________________________
From: Murphy, Dan
Sent: Wednesday, April 30, 2014 5:01 PM
To: Vanderpool Josh; Maupin, Chase; meta-ti@yoctoproject.org
Subject: RE: Kernel Hang I2C1??

Josh

For my BBB the PMIC is on I2C0, I have a device sitting on I2C1 that is w=
orking with this configuration and I2C2 is open.

I looked at the tool you used which is not a TI tool it just references t=
he TI SDK mux and pinmux files.
Which TI SDK are you using?

Heres what I have for configurations of the I2C pins for the am335x-bone-=
common.dtsi  file.

        i2c0_pins: pinmux_i2c0_pins {
                pinctrl-single,pins =3D <
                        0x188 (PIN_INPUT_PULLUP | MUX_MODE0)    /* i2c0_s=
da.i2c0_sda */
                        0x18c (PIN_INPUT_PULLUP | MUX_MODE0)    /* i2c0_s=
cl.i2c0_scl */
                >;
        };

        i2c1_pins: pinmux_i2c1_pins {
                pinctrl-single,pins =3D <
                        0x158 (PIN_INPUT_PULLUP | MUX_MODE2)    /* spi0_d=
1.i2c1_sda */
                        0x15c (PIN_INPUT_PULLUP | MUX_MODE2)    /* spi0_c=
s0.i2c1_scl */
                >;
        };

        i2c2_pins: pinmux_i2c2_pins {
                pinctrl-single,pins =3D <
                        0x178 (PIN_INPUT_PULLUP | MUX_MODE3)    /* uart1_=
ctsn.i2c2_sda */
                        0x17c (PIN_INPUT_PULLUP | MUX_MODE3)    /* uart1_=
rtsn.i2c2_scl */
                >;
        };

Then in the am335x-boneblack.dts I de-reference the I2C1

&i2c1 {
        status =3D "okay";
        pinctrl-names =3D "default";
        pinctrl-0 =3D <&i2c1_pins>;

        clock-frequency =3D <400000>;

        <Place your device here>
};

Plus instead of recreating the whole memory map you the idea was to inher=
it other dt files to build so your board just becomes a child.
You can always override the defaults in your child dt file.
At the very least you could pull in the am33xx.dtsi which contains the me=
mory map

Dan

-----------------------------------------------------
Dan  Murphy
Texas Instruments Inc.
________________________________________
From: Vanderpool Josh [Joshua.Vanderpool@raymondcorp.com]
Sent: Wednesday, April 30, 2014 3:24 PM
To: Murphy, Dan; Maupin, Chase; meta-ti@yoctoproject.org
Subject: RE: Kernel Hang I2C1??

<rant/> confusion is added as the pins on the device start from i2c0 and =
the software starts from i2c1</rant>

So when I stated i2c1 I was speaking from the hardware standpoint.
From pinmux.h

   MUX_VAL(CONTROL_PADCONF_UART1_RXD, (IEN | OFF | MODE3 )) /* I2C1_SDA_m=
ux2 */\
   MUX_VAL(CONTROL_PADCONF_UART1_TXD, (IEN | OFF | MODE3 )) /* I2C1_SCL_m=
ux2 */\

I have gotten the output from a nice tool for DT conversion https://githu=
b.com/jluebbe/tools

   0x180 0x2b   /* uart1_rxd.i2c1_sda_mux2, INPUT | MODE3 */
   0x184 0x2b   /* uart1_txd.i2c1_scl_mux2, INPUT | MODE3 */


-Josh Vanderpool


-----Original Message-----
From: Murphy, Dan [mailto:dmurphy@ti.com]
Sent: Wednesday, April 30, 2014 4:16 PM
To: Vanderpool Josh; Maupin, Chase; meta-ti@yoctoproject.org
Subject: RE: Kernel Hang I2C1??

OK I2C1 pins should be

        i2c1_pins: pinmux_i2c1_pins {
                pinctrl-single,pins =3D <
                        0x158 (PIN_INPUT_PULLUP | MUX_MODE2)    /* uart1_=
ctsn.i2c2_sda*/
                        0x15c (PIN_INPUT_PULLUP | MUX_MODE2)    /* uart1_=
rtsn.i2c2_scl */
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

Due to my custom board constraints I connected the PMIC and RTC etc  to I=
2C1 at pins.  I only mention BBB as I used the same PMIC and eMMC...
I also referred to the am335x-sk schematic during development.


   i2c1_pins: pinmux_i2c1_pins {
                        pinctrl-single,pins =3D <
                                0x180 (PIN_INPUT_PULLUP | MUX_MODE3)    /=
* uart1_rx.i2c1_sda */
                                0x184 (PIN_INPUT_PULLUP | MUX_MODE3)    /=
* uart1_tx.i2c1_scl */
                        >;
                };

-Josh Vanderpool

-----Original Message-----
From: Murphy, Dan [mailto:dmurphy@ti.com]
Sent: Wednesday, April 30, 2014 4:08 PM
To: Vanderpool Josh; Maupin, Chase; meta-ti@yoctoproject.org
Subject: RE: Kernel Hang I2C1??

I guess I am not sure how this device is connected

This device that is being connected to I2C1 on the BBB is off the P9 conn=
ector correct?
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

I followed the entry in am335x-evm to add i2c1 rather than i2c0 in the be=
agle bone black dts.

FYI what ever we find i will add to the post at http://e2e.ti.com/support=
/arm/sitara_arm/f/791/p/335136/1179969.aspx#1179969

Thanks
-josh
________________________________________
From: Maupin, Chase [chase.maupin@ti.com]
Sent: Wednesday, April 30, 2014 3:40 PM
To: Vanderpool Josh; meta-ti@yoctoproject.org; Murphy, Dan
Subject: RE: Kernel Hang I2C1??

Josh,

Do you have the I2C2 entry in your DT?  There are examples in the am33xx.=
dtsi file.

Sincerely,
Chase Maupin
Integration Team Manager
Linux Core Product Development
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://e2e.ti.com<http://e2e.ti.com/>
Wiki - http://processors.wiki.ti.com/index.php/Main_Page

From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproje=
ct.org] On Behalf Of Vanderpool Josh
Sent: Wednesday, April 30, 2014 9:03 AM
To: meta-ti@yoctoproject.org
Subject: [meta-ti] Kernel Hang I2C1??

I have a custom board and expect to use i2c1 on the board but it appears =
to not allow this in the kernel... u-boot was able to be modified to supp=
ort the hardware port i2c1.  Note that that software is 1based and hardwa=
re is zero-based...

This is the dump:
*        [    1.482628] ------------[ cut here ]------------
*        [    1.487549] WARNING: CPU: 0 PID: 1 at arch/arm/mach-omap2/oma=
p_device.c:888 omap_device_get_by_hwmod_name+0x94/0xb4()
*        [    1.498803] omap_device_get_by_hwmod_name: no omap_device for=
 i2c1
*        [    1.505365] Modules linked in:
*        [    1.508606] CPU: 0 PID: 1 Comm: swapper Not tainted 3.12.10-t=
i2013.12.01 #2
*        [    1.515990] Backtrace:
*        [    1.518595] [<c0017880>] (dump_backtrace+0x0/0x10c) from [<c0=
017a1c>] (show_stack+0x18/0x1c)
*        [    1.527542]  r6:c002f564 r5:00000009 r4:dd083e28 r3:00000000
*        [    1.533567] [<c0017a04>] (show_stack+0x0/0x1c) from [<c0580ba=
4>] (dump_stack+0x20/0x28)
*        [    1.542068] [<c0580b84>] (dump_stack+0x0/0x28) from [<c0046d0=
8>] (warn_slowpath_common+0x70/0x90)
*        [    1.551480] [<c0046c98>] (warn_slowpath_common+0x0/0x90) from=
 [<c0046dcc>] (warn_slowpath_fmt+0x38/0x40)
*        [    1.561528]  r8:c076b3fc r7:c0768410 r6:c0c8c9ac r5:c084df08 =
r4:c06b9fa4
*        [    1.568647] [<c0046d94>] (warn_slowpath_fmt+0x0/0x40) from [<=
c002f564>] (omap_device_get_by_hwmod_name+0x94/0xb4)
*        [    1.579523]  r3:c058be8c r2:c06b6584
*        [    1.583341] [<c002f4d0>] (omap_device_get_by_hwmod_name+0x0/0=
xb4) from [<c0778280>] (am33xx_pm_init+0x204/0x45c)
*        [    1.594120]  r4:00000000
*        [    1.596808] [<c077807c>] (am33xx_pm_init+


The full capture is http://pastebin.com/VyY8CQ0L

I found where roughly where there might be an issue...pm33xx.c as line#39=
5 states it can only use bus i2c1(one based(I assume this is i2c0)) Note =
I do not need smart reflex or sleep mode at all so any patches to work ar=
ound this are welcome.

Thanks

Josh Vanderpool
Electrical Engineer


Confidentiality Notice: The preceding e-mail message (including any attac=
hments) contains information that may be confidential, protected by appli=
cable legal privileges, or constitute non-public information. It is inten=
ded to be conveyed only to the designated recipient(s). If you are not an=
 intended recipient of this message, please notify the sender by replying=
 to this message and then delete it from your system. Use, dissemination,=
 distribution or reproduction of this message by unintended recipients is=
 not authorized and may be unlawful.

Confidentiality Notice:

The preceding e-mail message (including any attachments) contains informa=
tion that may be confidential, protected by applicable legal privileges, =
or constitute non-public information. It is intended to be conveyed only =
to the designated recipient(s). If you are not an intended recipient of t=
his message, please notify the sender by replying to this message and the=
n delete it from your system. Use, dissemination, distribution or reprodu=
ction of this message by unintended recipients is not authorized and may =
be unlawful.


Confidentiality Notice:

The preceding e-mail message (including any attachments) contains informa=
tion that may be confidential, protected by applicable legal privileges, =
or constitute non-public information. It is intended to be conveyed only =
to the designated recipient(s). If you are not an intended recipient of t=
his message, please notify the sender by replying to this message and the=
n delete it from your system. Use, dissemination, distribution or reprodu=
ction of this message by unintended recipients is not authorized and may =
be unlawful.




Confidentiality Notice:

The preceding e-mail message (including any attachments) contains informa=
tion that may be confidential, protected by applicable legal privileges, =
or constitute non-public information. It is intended to be conveyed only =
to the designated recipient(s). If you are not an intended recipient of t=
his message, please notify the sender by replying to this message and the=
n delete it from your system. Use, dissemination, distribution or reprodu=
ction of this message by unintended recipients is
not authorized and may be unlawful.


Confidentiality Notice:

The preceding e-mail message (including any attachments) contains informa=
tion that may be confidential, protected by applicable legal privileges, =
or constitute non-public information. It is intended to be conveyed only =
to the designated recipient(s). If you are not an intended recipient of t=
his message, please notify the sender by replying to this message and the=
n delete it from your system. Use, dissemination, distribution or reprodu=
ction of this message by unintended recipients is
not authorized and may be unlawful.



Confidentiality Notice:

The preceding e-mail message (including any attachments) contains informa=
tion that may be confidential, protected by applicable legal privileges, =
or constitute non-public information. It is intended to be conveyed only =
to the designated recipient(s). If you are not an intended recipient of t=
his message, please notify the sender by replying to this message and the=
n delete it from your system. Use, dissemination, distribution or reprodu=
ction of this message by unintended recipients is
not authorized and may be unlawful.



Confidentiality Notice:

The preceding e-mail message (including any attachments) contains informa=
tion that may be confidential, protected by applicable legal privileges, =
or constitute non-public information. It is intended to be conveyed only =
to the designated recipient(s). If you are not an intended recipient of t=
his message, please notify the sender by replying to this message and the=
n delete it from your system. Use, dissemination, distribution or reprodu=
ction of this message by unintended recipients is=20
not authorized and may be unlawful.




