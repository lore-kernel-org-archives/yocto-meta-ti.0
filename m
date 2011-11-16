Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wy0-f176.google.com (mail-wy0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DBC1CE00307
	for <meta-ti@yoctoproject.org>; Wed, 16 Nov 2011 07:45:12 -0800 (PST)
Received: by wyg10 with SMTP id 10so852549wyg.35
	for <meta-ti@yoctoproject.org>; Wed, 16 Nov 2011 07:45:11 -0800 (PST)
Received: by 10.180.93.168 with SMTP id cv8mr36565959wib.36.1321458311297;
	Wed, 16 Nov 2011 07:45:11 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235]) by mx.google.com with ESMTPS id
	hn15sm16575241wib.22.2011.11.16.07.45.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Nov 2011 07:45:09 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1321458150-5388-1-git-send-email-jdk@ti.com>
Date: Wed, 16 Nov 2011 16:45:07 +0100
Message-Id: <40922FF2-A09A-4C57-AA13-D8E3BA0A55A5@dominion.thruhere.net>
References: <1321458150-5388-1-git-send-email-jdk@ti.com>
To: Jason Kridner <jkridner@beagleboard.org>
X-Mailer: Apple Mail (2.1251.1)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] bonescript: run on startup
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
X-List-Received-Date: Wed, 16 Nov 2011 15:45:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 nov. 2011, om 16:42 heeft Jason Kridner het volgende geschreven:

> ---
> recipes-misc/payload/bonescript.bb |    7 ++++++-
> 1 files changed, 6 insertions(+), 1 deletions(-)
>=20
> diff --git a/recipes-misc/payload/bonescript.bb =
b/recipes-misc/payload/bonescript.bb
> index dc515f6..f2aef27 100644
> --- a/recipes-misc/payload/bonescript.bb
> +++ b/recipes-misc/payload/bonescript.bb
> @@ -1,6 +1,6 @@
> DESCRIPTION =3D "Scripting tools for the BeagleBoard and BeagleBone"
>=20
> -PR =3D "r10"
> +PR =3D "r11"
>=20
> inherit allarch systemd

^^^^^^^^^^^^^^^^^^^^^^

> @@ -27,6 +27,11 @@ do_install() {
>=20
> 	install -d ${D}${base_libdir}/systemd/system
> 	install -m 0644 ${WORKDIR}/bone101.service =
${D}${base_libdir}/systemd/system
> +
> +	for i in ${WORKDIR}/bone101.service ; do
> +		install -m 0644 $i ${D}${base_libdir}/systemd/system
> +		ln -sf ../$(basename $i) =
${D}${base_libdir}/systemd/system/basic.target.wants/
> +	done
> }

NAK, see above=

