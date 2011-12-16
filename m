Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f54.google.com (mail-ww0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 623FFE013DE
	for <meta-ti@yoctoproject.org>; Thu, 15 Dec 2011 23:39:07 -0800 (PST)
Received: by wgbdt13 with SMTP id dt13so5085630wgb.11
	for <meta-ti@yoctoproject.org>; Thu, 15 Dec 2011 23:39:06 -0800 (PST)
Received: by 10.227.200.71 with SMTP id ev7mr4868284wbb.24.1324021146369;
	Thu, 15 Dec 2011 23:39:06 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235]) by mx.google.com with ESMTPS id
	ca18sm11925993wib.13.2011.12.15.23.39.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Dec 2011 23:39:05 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <5a96447bec084526f7d9397f0a8b80fbbdb265ac.1323961434.git.otavio@ossystems.com.br>
Date: Fri, 16 Dec 2011 08:39:05 +0100
Message-Id: <6D7A3887-1E0F-4B45-A911-0947C8C7A702@dominion.thruhere.net>
References: <cover.1323961434.git.otavio@ossystems.com.br>
	<5a96447bec084526f7d9397f0a8b80fbbdb265ac.1323961434.git.otavio@ossystems.com.br>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: Apple Mail (2.1251.1)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v3 1/3] sdcard_image: rewrote to avoid using loopback and mount/unmount
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
X-List-Received-Date: Fri, 16 Dec 2011 07:39:07 -0000
X-Groupsio-MsgNum: 241
Content-Type: multipart/signed;
	boundary="Apple-Mail=_D4C327BA-651E-4E39-AF12-540F059DBB42";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_D4C327BA-651E-4E39-AF12-540F059DBB42
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 15 dec. 2011, om 16:05 heeft Otavio Salvador het volgende geschreven:

> Allow generation by regular users without fancy setup requirements and
> use of loopback and mount/unmount. Besides, this also includes
> following improvements:
>=20
> * use of megabytes when specifying SDIMG_SIZE
> * remove restriction of filesystem to rootfs
>=20
> Images that use this class needs to generate the rootfs filesystem and
> set ROOTFS variable according.
>=20
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> classes/sdcard_image.bbclass |  180 =
+++++++++++++++---------------------------
> 1 files changed, 63 insertions(+), 117 deletions(-)
>=20
> diff --git a/classes/sdcard_image.bbclass =
b/classes/sdcard_image.bbclass
>=20
> +	dd if=3D/dev/zero of=3D${SDIMG} bs=3D$(expr 1000 \* 1000) =
count=3D${SDIMG_SIZE}
> +
> +	# Create the boot filesystem
> +	BOOT_OFFSET=3D32256
> +	BOOT_BLOCKS=3D$(du -bks $TMP/boot | cut -f 1)
> +	BOOT_SIZE=3D$(expr $BOOT_BLOCKS + ${BOOTDD_EXTRA_SPACE})
> +	mkfs.vfat -n ${BOOTDD_VOLUME_ID} -d $TMP/boot -C $TMP/boot.img =
$BOOT_SIZE

This should probably switch to  using mcopy + dosfsck like the OE core =
patches Darren posted

> +	# Create partition table
> +	END1=3D$(expr $BOOT_SIZE \* 1024)
> +	END2=3D$(expr $END1 + 512)
> +	parted -s ${SDIMG} mklabel msdos
> +	parted -s ${SDIMG} mkpart primary fat16 ${BOOT_OFFSET}B ${END1}B
> +	parted -s ${SDIMG} mkpart primary ext3 ${END2}B 100%
> +	parted -s ${SDIMG} set 1 boot on
> +	parted ${SDIMG} print
> +
> +	OFFSET1=3D$(expr $BOOT_OFFSET / 512)
> +	OFFSET2=3D$(expr $END2 / 512)
> +	dd if=3D$TMP/boot.img of=3D${SDIMG} conv=3Dnotrunc seek=3D$OFFSET1=
 bs=3D512
> +	dd if=3D${ROOTFS} of=3D${SDIMG} conv=3Dnotrunc seek=3D$OFFSET2 =
bs=3D512

Do you know if fsck will work on the loop devices properly? At least =
ext4 needs an fsck pass to add dirhashes.

regards,

Koen=

--Apple-Mail=_D4C327BA-651E-4E39-AF12-540F059DBB42
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7q9ZoACgkQMkyGM64RGpEObwCdFl6A+Zzincenr3VOB6ErI375
4rUAn3JbEaGQOc+qzoWoZI/+UDvyoleq
=Jcd3
-----END PGP SIGNATURE-----

--Apple-Mail=_D4C327BA-651E-4E39-AF12-540F059DBB42--
