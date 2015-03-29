Return-Path: <whittenburg@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6D059E00949; Sun, 29 Mar 2015 12:46:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (whittenburg[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.212.169 listed in list.dnswl.org]
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 26FE1E0092E
	for <meta-ti@yoctoproject.org>; Sun, 29 Mar 2015 12:46:55 -0700 (PDT)
Received: by wibg7 with SMTP id g7so78952468wib.1
	for <meta-ti@yoctoproject.org>; Sun, 29 Mar 2015 12:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:date:message-id:subject:from:to:content-type;
	bh=K4cPYAa83cHtVOQ4PqOslLs9eIr2DaNkAFNE2gLLoGI=;
	b=iLYjgKJFN4Em+6lLkVZATpWblu34Lu6OJJcAeka5ux6Yv4un9xT/gW83gQo/1KQBj6
	btREXPdpL9o+aO3aDdGjCngbdnfQiubbv31Ht5eAAbp3ZEdwvc7AWP8233tNpAJqAbLp
	apJ3SevlJverUFBZNZZ9miqcvCyyc3B4tI1ztXUXc5XNDNfbYWlCTQ6JoacjbYF4rfXS
	GpFTB/00CiUHIZ2URv+3YaBdfcYoFvvahKjHkmzPNnyfFQo3bdrwvLPHrXcuJetx2Yn/
	kxe4XW4/1E2eZp32IcvBRFol4mfCtJg54Vt2jVKiAGMzi8kogn4f/yl9xuoo16vVrjUM
	LAEQ==
MIME-Version: 1.0
X-Received: by 10.194.83.66 with SMTP id o2mr57080076wjy.55.1427658414454;
	Sun, 29 Mar 2015 12:46:54 -0700 (PDT)
Received: by 10.27.5.21 with HTTP; Sun, 29 Mar 2015 12:46:54 -0700 (PDT)
Date: Sun, 29 Mar 2015 14:46:54 -0500
Message-ID: <CABcw_OnRid8H9KYkK5tPCCG12Tzz-N0W3ZotpSa6FKBj68dXEA@mail.gmail.com>
From: Chris Whittenburg <whittenburg@gmail.com>
To: meta-ti@yoctoproject.org
Subject: cmem-mod building problems
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: whittenburg@gmail.com
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sun, 29 Mar 2015 19:46:59 -0000
Content-Type: multipart/alternative; boundary=047d7bd6bbcaa77db4051272a0b4

--047d7bd6bbcaa77db4051272a0b4
Content-Type: text/plain; charset=UTF-8

I'm using using dizzy on a Gumstix Overo, and I'm trying to build the cmem
module recipe.  I'm guessing this is the preferred method versus the
ti-linuxutils recipe.

BB_VERSION        = "1.24.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Ubuntu-12.04"
TARGET_SYS        = "arm-poky-linux-gnueabi"
MACHINE           = "overo"
DISTRO            = "poky"
DISTRO_VERSION    = "1.7.1"
TUNE_FEATURES     = "arm armv7a vfp neon callconvention-hard cortexa8"
TARGET_FPU        = "vfp-neon"
meta
meta-yocto        = "(nobranch):2a3805a666e14f0c995f7622fe0eecbb1fb48932"
meta-gnome
meta-oe
meta-xfce
meta-systemd
meta-networking
meta-multimedia
meta-python       = "(nobranch):853dcfa0d618dc26bd27b3a1b49494b98d6eee97"
meta-gumstix      = "(nobranch):40ac3593fab75020431651e79cfa3ef5926bd1a6"
meta-gumstix-extras = "(nobranch):db157f15692eff0511b128e5c8241297e5582016"
meta-ros          = "(nobranch):224b15a0b06dc2f3d7d54f855845b14a6c479c1d"
meta-ti           = "master:b81014dbb5cc39fdfa66af87d18b72eb9eb3c701"

I get an error during compile which makes it look like it's not using the
arm gcc compiler.  Any suggestions on what I'm doing wrong here?

Early in the log, I see "CC=arm-poky-linux-gnueabi-gcc", but then later
on...

|   CC [M]
 /home/chris/yocto/build/tmp/work/overo-poky-linux-gnueabi/cmem-mod/git-b+gitrAUTOINC+0d2fac7187/git/src/cmem/module/cmemk.o
| cc1: error: unrecognized command line option '-mlittle-endian'
| cc1: error: unrecognized command line option '-mno-thumb-interwork'
| cc1: error: unrecognized command line option '-mfpu=vfp'

The full log is here:
http://pastebin.com/bHxGgQGe

Thanks,
Chris

--047d7bd6bbcaa77db4051272a0b4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div>I&#39;m using using dizzy on a Gumstix Overo, and=
 I&#39;m trying to build the cmem module recipe.=C2=A0 I&#39;m guessing thi=
s is the preferred method versus the ti-linuxutils recipe.</div><div><br></=
div><div><div>BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;1.24.0&quot;<=
/div><div>BUILD_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-linux&quot=
;</div><div>NATIVELSBSTRING =C2=A0 =3D &quot;Ubuntu-12.04&quot;</div><div>T=
ARGET_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;arm-poky-linux-gnueabi&quot;=
</div><div>MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;overo&quot;=
</div><div>DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;poky&q=
uot;</div><div>DISTRO_VERSION =C2=A0 =C2=A0=3D &quot;1.7.1&quot;</div><div>=
TUNE_FEATURES =C2=A0 =C2=A0 =3D &quot;arm armv7a vfp neon callconvention-ha=
rd cortexa8&quot;</div><div>TARGET_FPU =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot=
;vfp-neon&quot;</div><div>meta =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0</div><div>meta-yocto =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;(nobranch)=
:2a3805a666e14f0c995f7622fe0eecbb1fb48932&quot;</div><div>meta-gnome =C2=A0=
 =C2=A0 =C2=A0 =C2=A0</div><div>meta-oe =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=C2=A0</div><div>meta-xfce =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</div><div>meta=
-systemd =C2=A0 =C2=A0 =C2=A0</div><div>meta-networking =C2=A0=C2=A0</div><=
div>meta-multimedia =C2=A0=C2=A0</div><div>meta-python =C2=A0 =C2=A0 =C2=A0=
 =3D &quot;(nobranch):853dcfa0d618dc26bd27b3a1b49494b98d6eee97&quot;</div><=
div>meta-gumstix =C2=A0 =C2=A0 =C2=A0=3D &quot;(nobranch):40ac3593fab750204=
31651e79cfa3ef5926bd1a6&quot;</div><div>meta-gumstix-extras =3D &quot;(nobr=
anch):db157f15692eff0511b128e5c8241297e5582016&quot;</div><div>meta-ros =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;(nobranch):224b15a0b06dc2f3d7d54f8=
55845b14a6c479c1d&quot;</div><div>meta-ti =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D &quot;master:b81014dbb5cc39fdfa66af87d18b72eb9eb3c701&quot;</div></=
div><div><br></div><div>I get an error during compile which makes it look l=
ike it&#39;s not using the arm gcc compiler.=C2=A0 Any suggestions on what =
I&#39;m doing wrong here?</div><div><br></div><div>Early in the log, I see =
&quot;CC=3Darm-poky-linux-gnueabi-gcc&quot;, but then later on...</div><div=
><br></div><div><div>| =C2=A0 CC [M] =C2=A0/home/chris/yocto/build/tmp/work=
/overo-poky-linux-gnueabi/cmem-mod/git-b+gitrAUTOINC+0d2fac7187/git/src/cme=
m/module/cmemk.o</div><div>| cc1: error: unrecognized command line option &=
#39;-mlittle-endian&#39;</div><div>| cc1: error: unrecognized command line =
option &#39;-mno-thumb-interwork&#39;</div><div>| cc1: error: unrecognized =
command line option &#39;-mfpu=3Dvfp&#39;</div></div><div><br></div><div>Th=
e full log is here:</div><div><a href=3D"http://pastebin.com/bHxGgQGe">http=
://pastebin.com/bHxGgQGe</a><br></div><div><br></div><div>Thanks,</div><div=
>Chris</div><div><br></div><div><br></div></div>

--047d7bd6bbcaa77db4051272a0b4--
