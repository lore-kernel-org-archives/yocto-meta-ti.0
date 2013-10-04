Return-Path: <rstreif@linuxfoundation.org>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1E23EE0163D
	for <meta-ti@yoctoproject.org>; Fri,  4 Oct 2013 14:00:46 -0700 (PDT)
Received: by mail-ea0-f171.google.com with SMTP id n15so2059184ead.16
	for <meta-ti@yoctoproject.org>; Fri, 04 Oct 2013 14:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Zj2IlCypTuiaXo+IPIkHMR50KURanbNejmVXY1FXHio=;
	b=AEQRme6PQZI0oEtoFWEkvAVjYxtHudmqphOuNM0mgeh3oNATplVMtszZWiUP8B4NMM
	xjEhoMAJOsF/VqazPVl7QF9ZsEeLrCA2gGuEzw6T3bukiEfCfXDUcnxmpaIuo47lAj4X
	CdN16cVZs7eqf/69Y9k95Qb79F/Gdwgg4opK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=Zj2IlCypTuiaXo+IPIkHMR50KURanbNejmVXY1FXHio=;
	b=fBgCTriy08b3JmPUoBdYauCy0x88rpVvQmgMtRr3h+8Z7kWYBkyiBSY/1ySTxzDfP3
	OC/oxTIjS8yWvKi0cTLCuWT12o6xQRZh26fqCM+6Z25uNlQ7u4YytqUUCx+8CclyzDRg
	6QcYCzBk1JylRB7acndDe1iKJLmg6EtDJTmf4lDutAc9eO+6BLxtCHgh1Aq6gpJXSfwT
	O8V0eBeUA3RucMXHjjr/yjOpgBOjMOySdMufyA4L7+yWHf4Wr3u73fIaYRdmhO/HlYIc
	Tb7rSfHN1fI/oBIE50VnATLfsY5G8Ym240El9lkYVKWaTbKp4w9KP4qJ8/1PGKARwy+O
	yVQQ==
X-Gm-Message-State: ALoCoQlz9/cHc/58tnAz/LEtxbBEMx0iG0uI6Gs00vs1iqo5Il8WuEq0o1GFsIDhCrqz203uOYfQ
MIME-Version: 1.0
X-Received: by 10.14.183.2 with SMTP id p2mr24788691eem.44.1380920444684; Fri,
	04 Oct 2013 14:00:44 -0700 (PDT)
Received: by 10.223.131.3 with HTTP; Fri, 4 Oct 2013 14:00:44 -0700 (PDT)
In-Reply-To: <20131004182321.GA3672@edge>
References: <CA+gsK-r2ve9es_X1OAOp5jd5w-zWzqWUBNxH0AhkvW55uGwM2A@mail.gmail.com>
	<20131004053354.GB2673@edge>
	<CA+gsK-o6a6SbQnq9T2derscYRJ+8gS=4COTkeeP+TRjbFDkT9g@mail.gmail.com>
	<20131004182321.GA3672@edge>
Date: Fri, 4 Oct 2013 14:00:44 -0700
Message-ID: <CA+gsK-ofzwiKXqVCQ-=_kcvZJu+aaWqa07-DgVYTh91VB70OvQ@mail.gmail.com>
From: Rudolf Streif <rstreif@linuxfoundation.org>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: Buidling for am335x_evm
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
X-List-Received-Date: Fri, 04 Oct 2013 21:00:47 -0000
Content-Type: multipart/alternative; boundary=047d7b343dc491c67504e7f09862

--047d7b343dc491c67504e7f09862
Content-Type: text/plain; charset=ISO-8859-1

Thanks, Denys. I appreciate your help.

FAT boot partition is no longer preferred place for kernel images and DTB
> files - U-boot now wants to see them in /boot directory of the rootfs.
>
> That is actually a good thing. But I assume one will still need the FAT
partition for MLO and u-boot itself. Unfortunately, the do_rootfs task does
not put dtb or kernel into /boot yet.


> Ok, let's debug why you are not getting any DTB files produced. There
> should
> be at least 3 of them for the case of am335x-evm, as it covers EVM, EVM-SK
> and
> BeagleBone.
>
> They are not created. I changed the machine to beaglebone to test. No
dtb's created although the build process finishes without errors.


> Can you show me your bblayers.conf file, please?
>

Of course:

# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
# changes incompatibly
LCONF_VERSION = "6"

BBPATH = "${TOPDIR}"
BBFILES ?= ""

BBLAYERS ?= " \
  /run/media/rudi/WDPassport-1T/develop/yocto/yocto-dylan/poky/meta \
  /run/media/rudi/WDPassport-1T/develop/yocto/yocto-dylan/poky/meta-yocto \

/run/media/rudi/WDPassport-1T/develop/yocto/yocto-dylan/poky/meta-yocto-bsp
\
  /run/media/rudi/WDPassport-1T/develop/yocto/yocto-dylan/bsp/meta-ti \
  "
BBLAYERS_NON_REMOVABLE ?= " \
  /run/media/rudi/WDPassport-1T/develop/yocto/yocto-dylan/poky/meta \
  /run/media/rudi/WDPassport-1T/develop/yocto/yocto-dylan/poky/meta-yocto \
  "


Cheers,
Rudi

--047d7b343dc491c67504e7f09862
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks, Denys. I appreciate your help.<div class=3D"gmail_=
extra"><br><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(=
204,204,204);border-left-style:solid;padding-left:1ex">
FAT boot partition is no longer preferred place for kernel images and DTB<b=
r>
files - U-boot now wants to see them in /boot directory of the rootfs.<br>
<br></blockquote><div>That is actually a good thing. But I assume one will =
still need the FAT partition for MLO and u-boot itself. Unfortunately, the =
do_rootfs task does not put dtb or kernel into /boot yet.</div><div>=A0</di=
v>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
Ok, let&#39;s debug why you are not getting any DTB files produced. There s=
hould<br>
be at least 3 of them for the case of am335x-evm, as it covers EVM, EVM-SK =
and<br>
BeagleBone.<br>
<br></blockquote><div>They are not created. I changed the machine to beagle=
bone to test. No dtb&#39;s created although the build process finishes with=
out errors.</div><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204=
,204);border-left-style:solid;padding-left:1ex">

Can you show me your bblayers.conf file, please?<br></blockquote><div><br><=
/div><div>Of course:</div><div><br></div><div># LAYER_CONF_VERSION is incre=
ased each time build/conf/bblayers.conf</div><div># changes incompatibly</d=
iv>
<div>LCONF_VERSION =3D &quot;6&quot;</div><div><br></div><div>BBPATH =3D &q=
uot;${TOPDIR}&quot;</div><div>BBFILES ?=3D &quot;&quot;</div><div><br></div=
><div>BBLAYERS ?=3D &quot; \</div><div>=A0 /run/media/rudi/WDPassport-1T/de=
velop/yocto/yocto-dylan/poky/meta \</div>
<div>=A0 /run/media/rudi/WDPassport-1T/develop/yocto/yocto-dylan/poky/meta-=
yocto \</div><div>=A0 /run/media/rudi/WDPassport-1T/develop/yocto/yocto-dyl=
an/poky/meta-yocto-bsp \</div><div>=A0 /run/media/rudi/WDPassport-1T/develo=
p/yocto/yocto-dylan/bsp/meta-ti \</div>
<div>=A0 &quot;</div><div>BBLAYERS_NON_REMOVABLE ?=3D &quot; \</div><div>=
=A0 /run/media/rudi/WDPassport-1T/develop/yocto/yocto-dylan/poky/meta \</di=
v><div>=A0 /run/media/rudi/WDPassport-1T/develop/yocto/yocto-dylan/poky/met=
a-yocto \</div>
<div>=A0 &quot;</div><div>=A0</div><div><br></div><div>Cheers,</div><div>Ru=
di=A0</div></div>
</div></div>

--047d7b343dc491c67504e7f09862--
