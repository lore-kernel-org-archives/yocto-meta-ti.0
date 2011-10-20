Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 611B0E006B4
	for <meta-ti@yoctoproject.org>; Wed, 19 Oct 2011 22:40:52 -0700 (PDT)
Received: by eyh5 with SMTP id 5so3323718eyh.35
	for <meta-ti@yoctoproject.org>; Wed, 19 Oct 2011 22:40:51 -0700 (PDT)
Received: by 10.223.15.10 with SMTP id i10mr15999896faa.17.1319089251651;
	Wed, 19 Oct 2011 22:40:51 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id n18sm13890755fah.2.2011.10.19.22.40.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 19 Oct 2011 22:40:50 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1319082770-5589-1-git-send-email-joelagnel@ti.com>
Date: Thu, 20 Oct 2011 07:40:44 +0200
Message-Id: <DBE6B6FC-A885-4C63-BB14-6FB870F388C3@dominion.thruhere.net>
References: <1319082770-5589-1-git-send-email-joelagnel@ti.com>
To: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>, meta-ti@yoctoproject.org
X-Mailer: Apple Mail (2.1251.1)
Cc: Joel A Fernandes <joelagnel@ti.com>, jdk@ti.com
Subject: Re: [Angstrom-devel] [PATCH meta-ti] sdcard_image: Copy user.txt/uEnv.txt if it exists in /boot
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
X-List-Received-Date: Thu, 20 Oct 2011 05:40:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

[added meta-ti list]

Op 20 okt. 2011, om 05:52 heeft Joel A Fernandes het volgende =
geschreven:

> Pick up uEnv.txt/user.txt U-boot environment files installed in /boot

This doesn't match what the patch does :/

>=20
> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
> ---
> classes/sdcard_image.bbclass |    4 +++-
> 1 files changed, 3 insertions(+), 1 deletions(-)
>=20
> diff --git a/classes/sdcard_image.bbclass =
b/classes/sdcard_image.bbclass
> index ed9d779..c535ad2 100644
> --- a/classes/sdcard_image.bbclass
> +++ b/classes/sdcard_image.bbclass
> @@ -86,8 +86,10 @@ IMAGE_CMD_sdimg () {
> 		suffix=3Dbin
> 	fi
>=20
> +	cp -v ${IMAGE_ROOTFS}/boot/{user.txt,uEnv.txt} =
${WORKDIR}/tmp-mnt-boot || true
> +
> 	if [ -e ${IMAGE_ROOTFS}/boot/u-boot.$suffix ] ; then
> -		cp -v =
${IMAGE_ROOTFS}/boot/{u-boot.$suffix,user.txt,uEnv.txt} =
${WORKDIR}/tmp-mnt-boot || true
> +		cp -v ${IMAGE_ROOTFS}/boot/{u-boot.$suffix} =
${WORKDIR}/tmp-mnt-boot || true

Your patch is effectively a noop, I don't see the value in applying it.

regards,

Koen=

