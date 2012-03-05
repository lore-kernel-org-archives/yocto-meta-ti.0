Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ED5ACE01374
	for <meta-ti@yoctoproject.org>; Mon,  5 Mar 2012 12:31:34 -0800 (PST)
Received: by wibhq7 with SMTP id hq7so2351493wib.35
	for <meta-ti@yoctoproject.org>; Mon, 05 Mar 2012 12:31:33 -0800 (PST)
Received: by 10.180.101.136 with SMTP id fg8mr13518867wib.4.1330979493516;
	Mon, 05 Mar 2012 12:31:33 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id w10sm53209979wiy.3.2012.03.05.12.31.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Mar 2012 12:31:32 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120305202945.GA2030@denix.org>
Date: Mon, 5 Mar 2012 21:31:30 +0100
Message-Id: <6BE145D6-6354-43CA-A8E9-4F06F92B8D7C@dominion.thruhere.net>
References: <329D2F11-A3FF-4029-8F3D-EC6A7587D138@dominion.thruhere.net>
	<EF446FF9DAC93B479C74AB9153DE173F0C154AC2@SMUCM08V.europe.bmw.corp>
	<EF446FF9DAC93B479C74AB9153DE173F0C280116@SMUCM08V.europe.bmw.corp>
	<alpine.DEB.2.02.1203050730440.30632@oneiric>
	<EF446FF9DAC93B479C74AB9153DE173F0C2806AF@SMUCM08V.europe.bmw.corp>
	<alpine.DEB.2.02.1203051138060.14598@oneiric>
	<4F54ED21.9000208@mlbassoc.com> <20120305165844.GE14417@denix.org>
	<alpine.DEB.2.02.1203051212100.15878@oneiric>
	<AD1E46F4-9CEA-4FBA-AB1C-255FCD2E258A@dominion.thruhere.net>
	<20120305202945.GA2030@denix.org>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnFIbIKOsAoqxClZRLtZ5rJxthX8bOuY7MHnADyfSAFtioeh2mtiaBmKyvNAikgOOJej14s
Cc: meta-ti@yoctoproject.org
Subject: Re: Building Yocto for Pandaboard
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
X-List-Received-Date: Mon, 05 Mar 2012 20:31:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 5 mrt. 2012, om 21:29 heeft Denys Dmytriyenko het volgende =
geschreven:

> On Mon, Mar 05, 2012 at 06:15:54PM +0100, Koen Kooi wrote:
>>=20
>>>>> Yes, you'll also get a newer kernel (3.0.2 last I looked, not =
2.6.35)
>>>>=20
>>>> FYI, there is already 3.1 for Panda in meta-ti with -1 D_P...
>>>=20
>>> ok, i can see the new content and i just pulled into meta-ti and
>>> meta-openembedded.  so, starting all over again, is there now a
>>> known recipe for building for the panda with a minimum of
>>> customziation?
>>=20
>> Yes, use the setup-scripts mentioned in the wiki, zero customization =
needed.
>=20
> Anyone else is seeing this on Panda's 3.1 kernel in do_install? Using =
GNU make=20
> 3.82, but seems SECONDEXPANSION with PHONY rules don't work...

I'm seeing it on my fedora machines, but not in my debian machines. =
Tweaking the defconfig usually helps

regards,

Koen


>=20
> ...
>  INSTALL sound/usb/caiaq/snd-usb-caiaq.ko
>  INSTALL sound/soc/codecs/snd-soc-wm9081.ko
>  INSTALL sound/usb/snd-usb-audio.ko
>  INSTALL sound/usb/snd-usbmidi-lib.ko
>  INSTALL sound/usb/misc/snd-ua101.ko
>  MKDIR   =
/OE/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/pandaboar=
d-angstrom-linux-gnueabi/linux-omap4-3.1.0-r1/image/lib/firmware/emi26/
>  MKDIR   =
/OE/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/pandaboar=
d-angstrom-linux-gnueabi/linux-omap4-3.1.0-r1/image/lib/firmware/emi62/
> make[1]: *** No rule to make target =
`/OE/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/pandaboa=
rd-angstrom-linux-gnueabi/linux-omap4-3.1.0-r1/image/lib/firmware/./', =
needed by =
`/OE/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/pandaboa=
rd-angstrom-linux-gnueabi/linux-omap4-3.1.0-r1/image/lib/firmware/ti_3410.=
fw'.  Stop.
> make[1]: *** Waiting for unfinished jobs....
>  MKDIR   =
/OE/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/pandaboar=
d-angstrom-linux-gnueabi/linux-omap4-3.1.0-r1/image/lib/firmware/kaweth/
> make: *** [_modinst_post] Error 2
> ERROR: oe_runmake failed
>=20
> --=20
> Denys


