Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7EFE7E01447;
	Wed, 21 Nov 2012 15:01:25 -0800 (PST)
Received: by mail-ea0-f176.google.com with SMTP id d13so1476880eaa.35
	for <multiple recipients>; Wed, 21 Nov 2012 15:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xD4im3X7mfFtoiAmHcGi3uRhYoDb0MAqpgj3dm6J1Xg=;
	b=jEu5dg7zJECBSpwDyOQ9OdUU7ubh+VeZbajWbnsbmTHBqKjlzydlVzvuzcuq3l8P0+
	6OdD53ezUdjlsA7yo5pD83GQyUJFmZM38BszMafg54iWI6Glx2tTkjb/VkEZ5sOA6HFn
	Pc1AwfLf26erYyB/PpbW9/F7hTT9DndHx8ubmyo/4z+eaKKBKk626g7Fdz79pm8OZeMI
	1OPGgDZC6IyFWi745kkbA4fH5UUsiVtQA9J+n7p4cCye5EDfD+zVFddBuQd+volzHxs1
	iVSPd2MSgV/SGwN8N9REEI8oDc+MLNQGyA5YI5E9dW0N7ZS82JBmwPvbgAufIUa5l7P1
	25tw==
Received: by 10.14.221.5 with SMTP id q5mr16243894eep.33.1353538884369;
	Wed, 21 Nov 2012 15:01:24 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a45sm2543582eep.16.2012.11.21.15.01.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Nov 2012 15:01:23 -0800 (PST)
Date: Thu, 22 Nov 2012 00:01:20 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Nicolas Dechesne <ndec13@gmail.com>
Message-ID: <20121121230120.GS12637@jama.jama.net>
References: <CAOT3miJ73uAvR0Qij3+-q3B6K46=J5ZoFZDzW79YCSUfPbLeAA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOT3miJ73uAvR0Qij3+-q3B6K46=J5ZoFZDzW79YCSUfPbLeAA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Approved-At: Wed, 21 Nov 2012 15:32:26 -0800
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	yocto <yocto@yoctoproject.org>
Subject: Re: [yocto] build failure with xf86-video-omap
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
X-List-Received-Date: Wed, 21 Nov 2012 23:01:26 -0000
X-Groupsio-MsgNum: 1903
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ixDgnS8AC6zwmyK0"
Content-Disposition: inline

--ixDgnS8AC6zwmyK0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 21, 2012 at 11:52:30PM +0100, Nicolas Dechesne wrote:
> hi ,
>=20
> since xf86-video-omap was recently merged in oe-core and poky, i am trying
> to remove the recipes we had staged in meta-ti trees for some weeks (
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=3D410dc026f2=
ee24a2346e7563a83f0181c79809cf).
> so i was trying to build  poky/master with meta-ti/master, for pandaboard,
> and I get build failures in xf86-video-omap [1] and [2].
>=20
> so [1] is actually trivial, as we are missing a DEPENDS in the recipe, i
> can send a patch in oe-core for that.
>=20
> [2] is a bit more cryptic to me.. so I quickly tried to build with danny (
> i just cherry picked the commit that introduced xf86-video-omap from
> master) and this time it built fine.

Check this tread:
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-November/032012=
=2Ehtml
=20
> has anyone actually tested this recipe?=20

obviously no

Cheers,

> if so I must be doing something > wrong, any hint would be helpful.
>=20
> i also tried a build without poky, and just oe-core, and got the same
> failure.
>=20
> cheers
>=20
> nicolas
>=20
> [1] : from log_do.configure for xf86-video-omap
> checking for XORG... no
> configure: error: Package requirements (xorg-server >=3D 1.3 xproto
> fontsproto libdrm >=3D 2.4.36 libdrm_omap xf86driproto  randrproto
> renderproto videoproto xextproto) were not met:
>=20
>=20
>=20
> No package 'xf86driproto' found
>=20
> Consider adjusting the PKG_CONFIG_PATH environment variable if you
> installed software in a non-standard prefix.
>=20
>=20
> [2] : from log_do.configure for xf86-video-omap
> checking dependency style of arm-poky-linux-gnueabi-gcc  -march=3Darmv7-a
> -mthumb-\
> interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a9
> --sysroot=3D/data/psi_omap_bu\
> ilds_admins/ndechesne/yocto/build-poky2/tmp/sysroots/pandaboard... (cache=
d)
> none
> checking for sys/ioctl.h... (cached) yes
> checking if RANDR is defined... yes
> checking if RENDER is defined... yes
> checking if XV is defined... yes
> checking if DPMSExtension is defined... yes
> checking for XORG... yes
> checking for ANSI C header files... (cached) yes
> checking whether to include DRI support... checking for
> /usr/include/xorg/dri.h...
> configure: error: cannot check for file existence when cross compiling
> ... and configure just

> _______________________________________________
> yocto mailing list
> yocto@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/yocto


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ixDgnS8AC6zwmyK0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCtXUAACgkQN1Ujt2V2gBxUtACggQ7q89grk7GiSroShD++fn/3
eCkAn2WB77qeM91Bd5Zw1yj4EOdPiye/
=l3tc
-----END PGP SIGNATURE-----

--ixDgnS8AC6zwmyK0--
