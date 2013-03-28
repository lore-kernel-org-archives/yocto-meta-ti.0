Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 551FEE014C1
	for <meta-ti@yoctoproject.org>; Thu, 28 Mar 2013 15:51:27 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2SMpLqS002109;
	Thu, 28 Mar 2013 17:51:21 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2SMpLIN029829;
	Thu, 28 Mar 2013 17:51:21 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Thu, 28 Mar 2013 17:51:20 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] OMAP5: Booting build output
Thread-Index: AQHOK8xUwOzseCB+eESalC9uG9viSpi7RADAgABanYD//8NDIIAAkn0A//+uFRCAAFY5AP//rL7wAAsi1gD//7dvsA==
Date: Thu, 28 Mar 2013 22:51:20 +0000
Message-ID: <1EE25E35-36E7-4FE5-BA7E-FF596838574D@ti.com>
References: <20130328115247.029b68ae@duckworth>
	<7D46E86EC0A8354091174257B2FED101594ACEFA@DLEE11.ent.ti.com>
	<20130328122753.2b957cca@duckworth>
	<7D46E86EC0A8354091174257B2FED101594AD1C3@DLEE11.ent.ti.com>
	<20130328173448.1e541526@duckworth>
	<7D46E86EC0A8354091174257B2FED101594ADCAC@DLEE11.ent.ti.com>
	<20130328175012.7f9533b3@duckworth>
	<7D46E86EC0A8354091174257B2FED101594ADDAE@DLEE11.ent.ti.com>,
	<20130328221103.GH23022@edge>
In-Reply-To: <20130328221103.GH23022@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: OMAP5: Booting build output
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
X-List-Received-Date: Thu, 28 Mar 2013 22:51:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes, there are still refinements and testing needed.  That is part of why t=
he tags aren't in place yet.  I'll get a build out this weekend so the test=
 team can start on monday=20

Sincerely,
Chase Maupin
On Mar 28, 2013, at 5:11 PM, "Dmytriyenko, Denys" <denys@ti.com> wrote:

> On Thu, Mar 28, 2013 at 09:56:12PM +0000, Maupin, Chase wrote:
>>=20
>>> -----Original Message-----
>>> From: Ian Wisbon [mailto:ian.wisbon@timesys.com]
>>> Sent: Thursday, March 28, 2013 4:50 PM
>>> To: Maupin, Chase
>>> Cc: meta-ti@yoctoproject.org
>>> Subject: Re: [meta-ti] OMAP5: Booting build output
>>>=20
>>> Chase,
>>>=20
>>> I've got a 4-port USB serial adapter connected to my host, so, it
>>> enumerates as ttyUSB5 on my host.
>>>=20
>>> I'm connecting to the micro-USB port labeled DEBUG USB, and the
>>> LED
>>> indicating debug power is lit, screen /dev/ttyUSB5 115200
>>=20
>> In the dmesg output you should see two ttyUSB devices enumerated when t=
he=20
>> FTDI is detected.  The first is the serial console.  I'm not sure about=
 your=20
>> setup but if you have a 4 port serial adapter I would expect those are=
=20
>> ttyUSB0 - ttyUSB3.  This would make the FTDI ttyUSB4.
>>=20
>> The first thing we need is that you can see the serial console.  In som=
e=20
>> ways I wish this was like the beaglebone where you would see CCCCC when=
 no=20
>> SD card is loaded to know your serial connection was working :(
>>=20
>>> Applying power, LEDs D1 and D2 light blue, but otherwise, nothing
>>> lights; I don't see a link come up either on the eth port.
>>=20
>> Ethernet won't work until later kernels.  I haven't tried the one Denys=
 just=20
>> updated to yet but ethernet is supposed to work there.
>=20
> But with that we are hearing reports the DSS is broken... :(
>=20
> --=20
> Denys
>=20
>=20
>>> On Thu, 28 Mar 2013 17:42:26 -0400
>>> "Maupin, Chase" <chase.maupin@ti.com> wrote:
>>>=20
>>>>> -----Original Message-----
>>>>> From: Ian Wisbon [mailto:ian.wisbon@timesys.com]
>>>>> Sent: Thursday, March 28, 2013 4:35 PM
>>>>> To: Maupin, Chase
>>>>> Cc: meta-ti@yoctoproject.org
>>>>> Subject: Re: [meta-ti] OMAP5: Booting build output
>>>>>=20
>>>>> Chase,
>>>>>=20
>>>>> Thanks - I have mine set to the same:
>>>>>=20
>>>>> off-on-off-on
>>>>>=20
>>>>> and still no luck booting. I also tried the reverse just in
>>> case
>>>>> I was
>>>>> backwards/upside-down; despite the same SD card booting an
>>> OMAP4
>>>>> Panda,
>>>>> and replacing with OMAP5 MLO and u-boot.img, I see nothing on
>>> the
>>>>> console whatsoever. Not even a junk character implying an
>>>>> incorrect
>>>>> baudrate, etc. The USBBOOT functionality seems to work, so I
>>>>> don't
>>>>> believe the board to be non-functional.
>>>>=20
>>>> Are you connected to ttyUSB0 or ttyUSB1?  For my board the
>>> serial is
>>>> ttyUSB0.
>>>>=20
>>>>>=20
>>>>> I'll sit tight for a while and see what else is committed.
>>> Thanks
>>>>> for
>>>>> your assistance!
>>>>>=20
>>>>>=20
>>>>>>>=20
>>>>>>> Does the SYSBOOT switch dictate whether the SD is used
>>> for
>>>>>>> booting? If
>>>>>>> so, what is the correct setting? I've previously
>>> attempted to
>>>>>>> boot
>>>>>>> using an SD card formatted as necessary for the OMAP4
>>> Panda,
>>>>> but
>>>>>>> have
>>>>>>> been unsuccessful - I assumed a similar FAT format would
>>> be
>>>>>>> required
>>>>>>> for MLO/u-boot.img
>>>>>>=20
>>>>>> My sysboot switch is off on off on and I'm booting from SD.
>>>>>>=20
>>>>>> You can use the same SD format at omap4.  Just replace the
>>>>> kerel and
>>>>>> bootloader, add the boot.scr and dtb file.
>>>=20
>>> Thanks,
>>>=20
>>>=20
>>> --
>>> ---
>>> Ian Wisbon
>>> Support Manager
>>> Timesys Corporation
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti

