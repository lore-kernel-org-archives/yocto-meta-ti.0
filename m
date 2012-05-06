Return-Path: <whittenburg@gmail.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 837F2E013D0
	for <meta-ti@yoctoproject.org>; Sat,  5 May 2012 20:12:01 -0700 (PDT)
Received: by wgbfg15 with SMTP id fg15so3166892wgb.11
	for <meta-ti@yoctoproject.org>; Sat, 05 May 2012 20:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=iYusJbTCxwPBSESaRjYQ7AqrHVKpCmzKXBhFSSx/dlc=;
	b=f+gMYqJamxZceQr4xDEExmXxHOTyOb9PUWh53i10RR7j0wSXwLXs0WkJZekMHAth2c
	Erj/gS7Bv++8vGW6Zi2Yun5555o07t8wX5+3+VeTFDU1gmsd1GwutGFJzcjecJuu6VQZ
	Lo9WK5fXsWKUPfAFgu1XyUbfCJ1BRFfFT/ic80K1fbdxChdtJ3A2f9bAuyUf2rTETbjd
	jj/TJxuXgp72Q5ImKhZFeHYGcApx9V1c+1H53r2b+0ht2yw7Plpsp/rcd/XxjPFYlSys
	AOZ/33ky2GMCfVXHZ9lcE/2gImXCGA4HTczZK6i6LKqY0t8X02P08jZI5oJQxFLhkZuU
	hT3Q==
MIME-Version: 1.0
Received: by 10.180.79.135 with SMTP id j7mr24467865wix.19.1336273919995; Sat,
	05 May 2012 20:11:59 -0700 (PDT)
Received: by 10.223.144.215 with HTTP; Sat, 5 May 2012 20:11:59 -0700 (PDT)
In-Reply-To: <CA+2YH7srjOf900PBFzxVx8Tm4HKaxuvKzKudoo201Bh7-48o6g@mail.gmail.com>
References: <CA+2YH7srjOf900PBFzxVx8Tm4HKaxuvKzKudoo201Bh7-48o6g@mail.gmail.com>
Date: Sat, 5 May 2012 22:11:59 -0500
Message-ID: <CABcw_OnmrqyWeQszZL5duTdtfM39o+x_CWayeuuogEaPi=ohMA@mail.gmail.com>
From: Chris Whittenburg <whittenburg@gmail.com>
To: Enrico <ebutera@users.berlios.de>
Cc: meta-ti@yoctoproject.org
Subject: Re: ti-dsplink build error
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: whittenburg@gmail.com
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sun, 06 May 2012 03:12:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, May 4, 2012 at 7:16 AM, Enrico <ebutera@users.berlios.de> wrote:
> Hi,
>
> i'm having a build error problem with ti-dsplink, clean
> "angstrom-v2012.05-yocto1.2" checkout from yesterday:
>
> ERROR: Error executing a python function in
> /stuff/setup-scripts-denzil/sources/meta-ti/recipes-ti/dsplink/ti-dsplink=
_1.65.00.03.bb:
> TypeError: unsupported operand type(s) for &: 'NoneType' and 'int'
>
> ERROR: The stack trace of python calls that resulted in this
> exception/failure was:
> ERROR: =A0 File "split_and_strip_files", line 204, in <module>
> ERROR:
> ERROR: =A0 File "split_and_strip_files", line 198, in split_and_strip_fil=
es
> ERROR:
> ERROR: =A0 File "package.bbclass", line 30, in runstrip
> ERROR:
> ERROR: The code that was being executed was:
> ERROR: =A0 =A0 =A00200: =A0 =A0 =A0 # End of strip
> ERROR: =A0 =A0 =A00201: =A0 =A0 =A0 #
> ERROR: =A0 =A0 =A00202:
> ERROR: =A0 =A0 =A00203:
> ERROR: =A0*** 0204:split_and_strip_files(d)
> ERROR: =A0 =A0 =A00205:
> ERROR: (file: 'split_and_strip_files', lineno: 204, function: <module>)
> ERROR: =A0 =A0 =A00194: =A0 =A0 =A0 =A0 =A0 =A0 =A0 for root, dirs, files=
 in os.walk(dvar):
> ERROR: =A0 =A0 =A00195: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 for f=
 in files:
> ERROR: =A0 =A0 =A00196: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 if not f.endswith(".ko"):
> ERROR: =A0 =A0 =A00197: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 continue
> ERROR: =A0*** 0198:
> runstrip(os.path.join(root, f), None, d)
> ERROR: =A0 =A0 =A00199: =A0 =A0 =A0 #
> ERROR: =A0 =A0 =A00200: =A0 =A0 =A0 # End of strip
> ERROR: =A0 =A0 =A00201: =A0 =A0 =A0 #
> ERROR: =A0 =A0 =A00202:
> ERROR: (file: 'split_and_strip_files', lineno: 198, function:
> split_and_strip_files)
> ERROR: Function failed: split_and_strip_files
>
>
> if i set INHIBIT_PACKAGE_STRIP (to skip that part) i have no errors.
>
> Build host: ubuntu 11.10 32bit

I am having the same problem, on a ubuntu 11.10 64bit host, and adding

INHIBIT_PACKAGE_STRIP =3D '1'

to my angstrom-v2012.05.conf file allowed it to complete.

OE Build Configuration:
BB_VERSION        =3D "1.15.1"
TARGET_ARCH       =3D "arm"
TARGET_OS         =3D "linux-gnueabi"
MACHINE           =3D "overo"
DISTRO            =3D "angstrom"
DISTRO_VERSION    =3D "v2012.05"
TUNE_FEATURES     =3D "armv7a vfp neon cortexa8"
TARGET_FPU        =3D "vfp-neon"
meta-angstrom     =3D
"angstrom-v2012.05-yocto1.2:cdd62d0afbc8048eebc24a9f19e5e1ae5bfed5bb"
meta-oe
toolchain-layer
meta-efl
meta-gpe
meta-gnome
meta-xfce
meta-initramfs    =3D "denzil:5a06d2a2f504eadc5c7babcbcd833cf3763315ee"
meta-opie         =3D "master:efa3892b20a4ef80274e56e5633ebd62c16f9731"
meta-java         =3D "master:3386ea6c96096f107f43f282f654e5afa456109e"
meta-mozilla      =3D "master:5737d9fa26a632a27b2aa760c0d01190f0a17d0e"
meta-chromium     =3D "master:172783d6567d30429786291e401594d46f40cd69"
meta-mono         =3D "master:83f8233b0498aadb18bf7605c3ba6c71d9e13a3a"
meta-kde          =3D "master:5e1ef2906178fddd234c2eb259f8b32452eec0fc"
meta-ti           =3D "master:d18bb23803ff9735a5fcb049c25d79273a325323"
meta-efikamx      =3D "master:2c09a3a780b23448e8a6ca964256ff7f5ccba65d"
meta-nslu2        =3D "master:3d9fc951b05b4df476374b6fc3085ebac7f293ee"
meta-htc
meta-nokia
meta-openmoko
meta-palm         =3D "master:2b106be01228f64298d6cb338f93088806594344"
meta-handheld     =3D "master:1f05a15aceb4c3a19fa070463b58125b5658b2a9"
meta-intel
meta-sugarbay
meta-crownbay
meta-emenlow
meta-fishriver
meta-fri2
meta-jasperforest
meta-n450         =3D "master:f75f9b6f68473eb0efac802409608f8389be0030"
meta              =3D "denzil:5433da972f2994f7176597d89499ccb65f876f88"
meta-te           =3D "master:18aa2de0304dd1f8bdc132c1ed741ac6431fa133"

-chris

