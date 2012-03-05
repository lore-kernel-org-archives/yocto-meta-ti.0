Return-Path: <prvs=442568cee5=christian.schulenberg@bmw.de>
Received: from mxout38.expurgate.net (mxout38.expurgate.net [194.37.255.38])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DD5C4E0044D
	for <meta-ti@yoctoproject.org>; Mon,  5 Mar 2012 00:58:59 -0800 (PST)
Received: from [127.0.0.1] (helo=localhost)
	by relay.expurgate.net with smtp (Exim 4.77)
	(envelope-from <prvs=442568cee5=christian.schulenberg@bmw.de>)
	id 1S4Tku-0007s1-QJ
	for meta-ti@yoctoproject.org; Mon, 05 Mar 2012 09:58:56 +0100
Received: from [160.46.252.50] (helo=cmtamx4b.bmwgroup.com)
	by relay.expurgate.net with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.77) (envelope-from <Christian.Schulenberg@bmw.de>)
	id 1S4Tku-0000yt-5S
	for meta-ti@yoctoproject.org; Mon, 05 Mar 2012 09:58:56 +0100
Received: from cmtabb3a.muc (cmtabb3a.muc [160.50.100.15])
	by cmtamx4a.bmwgroup.com (8.13.8/8.13.8) with ESMTP id q258wk3i026232
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <meta-ti@yoctoproject.org>; Mon, 5 Mar 2012 09:58:46 +0100
Received: from smuch03a.europe.bmw.corp (smuch03a.muc [160.50.20.69])
	by cmtabb3a.muc (8.13.8/8.13.8) with ESMTP id q258wj6W006944
	for <meta-ti@yoctoproject.org>; Mon, 5 Mar 2012 09:58:45 +0100
Received: from SMUCM08V.europe.bmw.corp ([160.50.20.51]) by
	smuch03a.europe.bmw.corp ([160.50.20.69]) with mapi;
	Mon, 5 Mar 2012 09:58:44 +0100
From: <Christian.Schulenberg@bmw.de>
To: <meta-ti@yoctoproject.org>
Date: Mon, 5 Mar 2012 09:58:43 +0100
Thread-Topic: [meta-ti] Building Yocto for Pandaboard
Thread-Index: Acz17oqraX3fFu1lRaev0mZjSld7GAAAlowgAS9FxPA=
Message-ID: <EF446FF9DAC93B479C74AB9153DE173F0C280116@SMUCM08V.europe.bmw.corp>
References: <EF446FF9DAC93B479C74AB9153DE173F0C0D32FF@SMUCM08V.europe.bmw.corp>
	<3BC330F9-CE58-4C4F-A473-B0F40D0A2777@dominion.thruhere.net>
	<4F4BA9EE.8030908@balister.org>
	<3A03FCB1-56B0-42C4-9260-24B10EF4531E@dominion.thruhere.net>
	<4F4BB801.3090108@ti.com>
	<EF446FF9DAC93B479C74AB9153DE173F0C154A32@SMUCM08V.europe.bmw.corp>
	<329D2F11-A3FF-4029-8F3D-EC6A7587D138@dominion.thruhere.net>
	<EF446FF9DAC93B479C74AB9153DE173F0C154AC2@SMUCM08V.europe.bmw.corp>
In-Reply-To: <EF446FF9DAC93B479C74AB9153DE173F0C154AC2@SMUCM08V.europe.bmw.corp>
Accept-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: de-DE
MIME-Version: 1.0
X-Spam-Status: No, No
X-purgate-relay-fid: relay-938205
X-purgate-sourceid: 1S4Tku-0000yt-5S
X-purgate-Ad: Checked for spam and viruses by eXpurgate(R),
	see www.eleven.de for details.
X-purgate-ID: 151534::1330937936-0000465A-66E9F04E/0-0/0-0
X-purgate: clean
X-purgate-type: clean
X-purgate-relay-bid: relay-5a1957
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
X-List-Received-Date: Mon, 05 Mar 2012 08:59:00 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

finally, I managed to bring up the Pandaboard with the meta-ti layer by mys=
elf. For all of you, who are facing the same problems and who don't want to=
 use Angstrom, here are some hints, how to do this just using Yocto Poky:

Remove systemd in local.conf as mentioned above.

I used machine configuration for "omap4430-panda", because machine "pandabo=
ard" did not build the kernel. Because this configuration use the sakoman b=
ootloader, which caused some trouble for me, I switched over to (denx) u-bo=
ot.=20

Use gcc4.5 instead of gcc4.6. The reason for this is a compiler error that =
came up when compiling the u-boot bootloader. You can change the compiler i=
n ./meta/conf/distro/include/tcmode-default.inc , variable GCCVERSION. Anot=
her alternative might be patching the gcc4.6, because there is already a fi=
x for this compiler error.

In the kernel configuration I needed to switch off lzop_native (CONFIG_KERN=
EL_LZO).

I removed ofono from the image, because I don't need it and it is just caus=
ing trouble.

I needed to remove netbase and alsa-state as well.=20

With these changes I got an image for my Pandaboard and the corresponding b=
ootloader. I worked around some problems, by just removing packages. This i=
s acceptable for a first shot, in the next steps I need to implement at lea=
st systemd. On the other hand, I see that Koen changed the system configura=
tion (e.g.: CONFIG_KERNEL_LZO) as well as the competing machine configurati=
ons omap4430-panda and pandaboard. May be, I'll give this update a try.

Best regards,
Christian


