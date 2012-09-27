Return-Path: <prvs=3631c82196=christian.schulenberg@bmw.de>
Received: from mxout38.expurgate.net (mxout38.expurgate.net [91.198.224.38])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A4352E0049D
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2012 00:25:44 -0700 (PDT)
Received: from [127.0.0.1] (helo=localhost)
	by relay.expurgate.net with smtp (Exim 4.77)
	(envelope-from <prvs=3631c82196=christian.schulenberg@bmw.de>)
	id 1TH8TX-0003Sj-UA; Thu, 27 Sep 2012 09:25:35 +0200
Received: from [160.46.252.44] (helo=cmtamx3b.bmwgroup.com)
	by relay.expurgate.net with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.77) (envelope-from <Christian.Schulenberg@bmw.de>)
	id 1TH8TW-0008R2-S5; Thu, 27 Sep 2012 09:25:35 +0200
Received: from cmtabb2a.muc (cmtabb2a.muc [160.50.100.13])
	by cmtamx3a.bmwgroup.com (8.13.8/8.13.8) with ESMTP id q8R7PUjs030006
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Thu, 27 Sep 2012 09:25:30 +0200
Received: from SMUCH02B.europe.bmw.corp (smuch02b.muc [160.50.20.45])
	by cmtabb2a.muc (8.13.8/8.13.8) with ESMTP id q8R7PSlR012038;
	Thu, 27 Sep 2012 09:25:28 +0200
Received: from SMUCM08V.europe.bmw.corp ([160.50.20.51]) by
	SMUCH02B.europe.bmw.corp ([160.50.20.45]) with mapi; Thu, 27 Sep 2012
	09:25:28 +0200
From: <Christian.Schulenberg@bmw.de>
To: <radu.moisan@intel.com>, <meta-ti@yoctoproject.org>
Date: Thu, 27 Sep 2012 09:25:26 +0200
Thread-Topic: [meta-ti] pandaboard not booting
Thread-Index: Ac2b7Ve14EX5WA1bSBup2/e0BcnBjAAk7+VA
Message-ID: <EF446FF9DAC93B479C74AB9153DE173F111237C8@SMUCM08V.europe.bmw.corp>
References: <5061B4F0.3080505@intel.com> <5062B681.20407@intel.com>
	<CA+2YH7vDWica3F3ORcNJti_3CALGeBNyXFqBZP-nhcDE5Ueokg@mail.gmail.com>
	<5062DC98.20106@intel.com> <5062DDB7.60308@mlbassoc.com>
	<5062F839.302@intel.com> <5062FB00.7080307@mlbassoc.com>
	<506307F1.6030303@intel.com>
In-Reply-To: <506307F1.6030303@intel.com>
Accept-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: de-DE
MIME-Version: 1.0
X-Spam-Status: No, No
X-purgate-relay-fid: relay-f3ed12
X-purgate-sourceid: 1TH8TW-0008R2-S5
X-purgate-Ad: Checked for spam and viruses by eXpurgate(R),
	see www.eleven.de for details.
X-purgate-ID: 151534::1348730735-00005BAD-B491A30F/0-0/0-0
X-purgate: clean
X-purgate-type: clean
X-purgate-relay-bid: relay-146d57
Subject: Re: pandaboard not booting
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
X-List-Received-Date: Thu, 27 Sep 2012 07:25:44 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I would like to jump into this discussion, as I'm facing exact the same pro=
blem. I try to build the meta-ivi System. Therefore, I have setup my system=
 with the following layers:

- meta-ivi
- meta-systemd
- poky
- meta-ti

bblayers.conf looks like this:

# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
# changes incompatibly
LCONF_VERSION =3D "5"

BBPATH =3D "${TOPDIR}"
BBFILES ?=3D ""

BBLAYERS ?=3D " \
  /home/csb/yocto-excalibur/yocto-ivi/meta-ti \
  /home/csb/yocto-excalibur/yocto-ivi/poky/meta \
  /home/csb /yocto-excalibur/yocto-ivi/poky/meta-yocto \
  /home/csb /yocto-excalibur/yocto-ivi/meta-ivi \
  /home/csb /yocto-excalibur/yocto-ivi/meta-systemd \
  "

The meta-ti misc subdir is excluded from build via BBMASK =3D "meta-ti/reci=
pes-misc" in local.conf. MACHINE is set to pandabaord -> MACHINE ??=3D "pan=
daboard"

The build process went through without any suspicious warnings. But in the =
end, I stuck with the same problem as Radu, except the fact, that I'm using=
 a boot.scr. Here is my console output:

U-Boot SPL 2011.12-dirty (Sep 27 2012 - 07:42:14)
Texas Instruments OMAP4460 ES1.1
OMAP SD/MMC: 0
reading u-boot.img
reading u-boot.img


U-Boot 2011.12-dirty (Sep 27 2012 - 07:42:14)

CPU  : OMAP4460 ES1.1
Board: OMAP4 Panda
I2C:   ready
DRAM:  1 GiB
MMC:   OMAP SD/MMC: 0
Using default environment

In:    serial
Out:   serial
Err:   serial
Hit any key to stop autoboot:  0
reading boot.scr

390 bytes read
Running bootscript from mmc0 ...
## Executing script at 82000000
reading uImage

4176496 bytes read
## Booting kernel from Legacy Image at 80000000 ...
   Image Name:   Linux-3.1.0
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    4176432 Bytes =3D 4 MiB
   Load Address: 80008000
   Entry Point:  80008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...

Uncompressing Linux... done, booting the kernel.

At the end, both LED's on Pandaboard (D1 and D2) are switched on. Pressing =
reset does not help, only LED D1 is switched off.

I used the meta.ivi layer in combination with meta-ti before in a much olde=
r version, which worked fine for me, but at the moment I have no idea what'=
s wrong with my configuration.


Best regards,
Christian

-----Urspr=FCngliche Nachricht-----
Von: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject.=
org] Im Auftrag von Radu Moisan
Gesendet: Mittwoch, 26. September 2012 15:50
An: meta-ti@yoctoproject.org
Betreff: Re: [meta-ti] pandaboard not booting


> This looks correct - the important bit is that console=3DttyO2
>
> Diagnosing why this doesn't come up may be a bit trickier.  One thing=20
> that you
> can do is to look at the kernel messages (which are not being=20
> printed!).  Thankfully,
> those are kept buffered in memory and you should be able to print them=20
> manually.
>
> Give these steps a go:
>   * Boot as you have been, letting it hang after starting the kernel
>   * Press the RESET button on the PandaBoard
>   * Break into U-Boot
>   * Dump the kernel messages via:
>       U-Boot> md LOG_BUF_ADDRESS
>     This will display 256 bytes at LOG_BUF_ADDRESS.  If you just press=20
> return, you'll
>     get to see the next 256 bytes, etc.  Keep doing this until the=20
> messages stop...
>
> To find the LOG_BUF_ADDRESS, search for __log_buf in the System.map=20
> which was created
> when you built your kernel.  This will be in your Yocto build tree=20
> .../tmp/work/pandaboard*/linux*/git
> (I think - I don't have a build for this machine handy)  You'll see=20
> something like this:
>    $ grep __log_buf tmp/work/panda*/linux*/git/System.map
>    c06d66e9 b __log_buf
> That's a virtual address which corresponds to 0x806d66e9 in physical=20
> RAM.  Truncate
> the address to a longword value, i.e. 0x806d66e8 - that's LOG_BUF_ADDRESS
>
> See what you get, it may provide a clue where the kernel is crashing.
>
Everything went ok, except the board doesn't reset when I press the=20
reset button, or at least I can't see that in the serial console, it=20
stays stuck at line "booting kernel..."

Radu
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

