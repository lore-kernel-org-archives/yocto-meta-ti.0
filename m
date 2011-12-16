Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f54.google.com (mail-ww0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 78C36E013DE
	for <meta-ti@yoctoproject.org>; Thu, 15 Dec 2011 23:23:09 -0800 (PST)
Received: by wgbdt13 with SMTP id dt13so5066282wgb.11
	for <meta-ti@yoctoproject.org>; Thu, 15 Dec 2011 23:23:08 -0800 (PST)
Received: by 10.180.98.138 with SMTP id ei10mr10605998wib.52.1324020188679;
	Thu, 15 Dec 2011 23:23:08 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id w8sm11898044wiz.4.2011.12.15.23.23.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Dec 2011 23:23:07 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <F61A9010E56D7F4C93A19FD36DAAC3592FA12D@DFLE34.ent.ti.com>
Date: Fri, 16 Dec 2011 08:23:04 +0100
Message-Id: <020D35A2-B806-4C37-AFC7-E8670D7DE004@dominion.thruhere.net>
References: <cover.1323961434.git.otavio@ossystems.com.br>,
	<5a96447bec084526f7d9397f0a8b80fbbdb265ac.1323961434.git.otavio@ossystems.com.br>
	<F61A9010E56D7F4C93A19FD36DAAC3592FA12D@DFLE34.ent.ti.com>
To: "Kridner, Jason" <jdk@ti.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH v3 1/3] sdcard_image: rewrote to avoid using	loopback and mount/unmount
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
X-List-Received-Date: Fri, 16 Dec 2011 07:23:11 -0000
X-Groupsio-MsgNum: 240
Content-Type: multipart/signed;
	boundary="Apple-Mail=_6D7A3D74-BA89-4A49-AE68-78CF991DE2A5";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_6D7A3D74-BA89-4A49-AE68-78CF991DE2A5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 15 dec. 2011, om 16:29 heeft Kridner, Jason het volgende geschreven:

> Sorry for the top-post.  Using the number of clusters is important to =
make sure that the DOS partitioning is valid.  I'm not confident that =
we'll end up with a whole number of clusters using this method.  Perhaps =
it isn't completely critical, but I'm not 100% comfortable getting rid =
of it.

You can now try it :)

http://dominion.thruhere.net/koen/angstrom/beaglebone/test/

The 'oldmethod' is built using the old method, the other one with =
otavios patches.

regards,

Koen


> ________________________________________
> From: meta-ti-bounces@yoctoproject.org =
[meta-ti-bounces@yoctoproject.org] on behalf of Otavio Salvador =
[otavio@ossystems.com.br]
> Sent: Thursday, December 15, 2011 10:05 AM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [PATCH v3 1/3] sdcard_image: rewrote to avoid using =
 loopback and mount/unmount
>=20
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
> index 519bd9a..5f2d091 100644
> --- a/classes/sdcard_image.bbclass
> +++ b/classes/sdcard_image.bbclass
> @@ -1,99 +1,42 @@
> +#
> +# Create an image that can by written onto a SD card using dd.
> +#
> +# External variables needed:
> +#   ${ROOTFS} - the rootfs image to incorporate
> +
> inherit image
>=20
> # Add the fstypes we need
> -IMAGE_FSTYPES_append =3D " tar.bz2 sdimg"
> +IMAGE_FSTYPES +=3D "sdimg"
>=20
> # Ensure required utilities are present
> -IMAGE_DEPENDS_sdimg =3D "genext2fs-native e2fsprogs-native"
> -
> -# Change this to match your host distro
> -LOSETUP ?=3D "/sbin/losetup"
> -
> -# Since these need to go in /etc/fstab we can hardcode them
> -# Since the vars are weakly assigned, you can override them from your =
local.conf
> -LOOPDEV ?=3D "/dev/loop1"
> -LOOPDEV_BOOT ?=3D "/dev/loop2"
> -LOOPDEV_FS ?=3D "/dev/loop3"
> +IMAGE_DEPENDS_sdimg =3D "dosfstools-native parted-native"
>=20
> -# Default to 4GiB images
> -SDIMG_SIZE ?=3D "444"
> +# Default to 3.4GiB images
> +SDIMG_SIZE ?=3D "3400"
>=20
> -# FS type for rootfs
> -ROOTFSTYPE ?=3D "ext3"
> +# Boot partition volume id
> +BOOTDD_VOLUME_ID_beaglebone =3D "BEAGLE_BONE"
> +BOOTDD_VOLUME_ID ?=3D "${MACHINE}"
>=20
> -BOOTPARTNAME_beaglebone =3D "BEAGLE_BONE"
> -BOOTPARTNAME ?=3D "${MACHINE}"
> -
> -IMAGEDATESTAMP =3D "${@time.strftime('%Y.%m.%d',time.gmtime())}"
> +# Addional space for boot partition
> +BOOTDD_EXTRA_SPACE ?=3D "16384"
>=20
> # Files and/or directories to be copied into the vfat partition
> FATPAYLOAD ?=3D ""
>=20
> IMAGE_CMD_sdimg () {
> -       SDIMG=3D${WORKDIR}/sd.img
> -
> -       # sanity check fstab entry for boot partition mounting
> -       if [ "x$(cat /etc/fstab | grep ${LOOPDEV_BOOT} | grep =
${WORKDIR}/tmp-mnt-boot | grep user || true)" =3D "x" ]; then
> -               echo "/etc/fstab entries need to be created with the =
user flag for the loop devices like:"
> -               echo "${LOOPDEV_BOOT} ${WORKDIR}/tmp-mnt-boot vfat =
user 0 0"
> -        false
> -       fi
> -
> -       # cleanup loops
> -       for loop in ${LOOPDEV} ${LOOPDEV_BOOT} ${LOOPDEV_FS} ; do
> -               ${LOSETUP} -d $loop || true
> -       done
> -
> -       # If an SD image is already present, reuse and reformat it
> -       if [ ! -e ${SDIMG} ] ; then
> -               dd if=3D/dev/zero of=3D${SDIMG} bs=3D$(echo '255 * 63 =
* 512' | bc) count=3D${SDIMG_SIZE}
> -       fi
> -
> -       ${LOSETUP} ${LOOPDEV} ${SDIMG}
> -
> -       # Create partition table
> -       dd if=3D/dev/zero of=3D${LOOPDEV} bs=3D1024 count=3D1024
> -       SIZE=3D$(/sbin/fdisk -l ${LOOPDEV} | grep Disk | grep bytes | =
awk '{print $5}')
> -       CYLINDERS=3D$(echo $SIZE/255/63/512 | bc)
> -       {
> -       echo ,9,0x0C,*
> -       echo ,,,-
> -       } | /sbin/sfdisk -D -H 255 -S 63 -C ${CYLINDERS} ${LOOPDEV}
> -
> -       # Prepare loop devices for boot and filesystem partitions
> -       BOOT_OFFSET=3D32256
> -       FS_OFFSET_SECT=3D$(/sbin/fdisk -l -u ${LOOPDEV} 2>&1 | grep =
Linux | perl -p -i -e "s/\s+/ /"|cut -d " " -f 2)
> -       FS_OFFSET=3D$(echo "$FS_OFFSET_SECT * 512" | bc)
> -       FS_SIZE_BLOCKS=3D$(/sbin/fdisk -l -u ${LOOPDEV} 2>&1 | grep =
Linux | perl -p -i -e "s/\s+/ /g" \
> -       |cut -d " " -f 4 | cut -d "+" -f 1)
> -
> -       LOOPDEV_BLOCKS=3D$(/sbin/fdisk -l -u ${LOOPDEV} 2>&1 | grep =
FAT | perl -p -i -e "s/\s+/ /g"|cut -d " " -f 5)
> -       LOOPDEV_BYTES=3D$(echo "$LOOPDEV_BLOCKS * 1024" | bc)
> -
> -       ${LOSETUP} -d ${LOOPDEV}
> -
> -       ${LOSETUP} ${LOOPDEV_BOOT} ${SDIMG} -o ${BOOT_OFFSET}
> -
> -       /sbin/mkfs.vfat ${LOOPDEV_BOOT} -n ${BOOTPARTNAME} =
$LOOPDEV_BLOCKS
> -
> -       # Prepare filesystem partition
> -       # Copy ubi used by flashing scripts
> -       if [ -e  ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ] ; then
> -               echo "Copying UBIFS image to file system"
> -               cp ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi =
${IMAGE_ROOTFS}/boot/fs.ubi
> -       fi
> +       TMP=3D${WORKDIR}/tmp
> +       SDIMG=3D${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.sdimg
>=20
> -       # Prepare boot partion. First mount the boot partition, and =
copy the boot loader and supporting files
> -       # from the root filesystem
> -
> -       mkdir -p ${WORKDIR}/tmp-mnt-boot
> -       mount $LOOPDEV_BOOT ${WORKDIR}/tmp-mnt-boot
> +       # Prepare boot filesystem
> +       install -d $TMP/boot
>=20
>        echo "Copying bootloaders into the boot partition"
>        if [ -e ${IMAGE_ROOTFS}/boot/MLO ] ; then
> -               cp -v ${IMAGE_ROOTFS}/boot/MLO ${WORKDIR}/tmp-mnt-boot
> +               cp -v ${IMAGE_ROOTFS}/boot/MLO $TMP/boot
>        else
> -               cp -v ${DEPLOY_DIR_IMAGE}/MLO ${WORKDIR}/tmp-mnt-boot
> +               cp -v ${DEPLOY_DIR_IMAGE}/MLO $TMP/boot
>        fi
>=20
>        # Check for u-boot SPL
> @@ -103,54 +46,57 @@ IMAGE_CMD_sdimg () {
>                suffix=3Dbin
>        fi
>=20
> -       cp -v ${IMAGE_ROOTFS}/boot/uEnv.txt ${WORKDIR}/tmp-mnt-boot || =
true
> -       cp -v ${IMAGE_ROOTFS}/boot/user.txt ${WORKDIR}/tmp-mnt-boot || =
true
> -       cp -v ${IMAGE_ROOTFS}/boot/uImage ${WORKDIR}/tmp-mnt-boot || =
true
> -
>        if [ -e ${IMAGE_ROOTFS}/boot/u-boot.$suffix ] ; then
> -               cp -v ${IMAGE_ROOTFS}/boot/{u-boot.$suffix} =
${WORKDIR}/tmp-mnt-boot || true
> +               cp -v ${IMAGE_ROOTFS}/boot/u-boot.$suffix $TMP/boot || =
true
>        else
> -               cp -v ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.$suffix =
${WORKDIR}/tmp-mnt-boot/u-boot.$suffix
> +               cp -v ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.$suffix =
$TMP/boot/u-boot.$suffix
> +       fi
> +
> +       if [ -e ${IMAGE_ROOTFS}/boot/uImage ]; then
> +               cp -v ${IMAGE_ROOTFS}/boot/uImage $TMP/boot || true
> +       else
> +               cp -v ${DEPLOY_DIR_IMAGE}/uImage-${MACHINE}.$suffix =
$TMP/boot/uImage
> +       fi
> +
> +       cp -v ${IMAGE_ROOTFS}/boot/uEnv.txt $TMP/boot || true
> +       cp -v ${IMAGE_ROOTFS}/boot/user.txt $TMP/boot || true
> +
> +       # Copy ubi used by flashing scripts
> +       if [ -e  ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ] ; then
> +               echo "Copying UBIFS image to file system"
> +               cp ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi =
${IMAGE_ROOTFS}/boot/fs.ubi
>        fi
>=20
>        if [ -n ${FATPAYLOAD} ] ; then
>                echo "Copying payload into VFAT"
>                for entry in ${FATPAYLOAD} ; do
>                                # add the || true to stop aborting on =
vfat issues like not supporting .~lock files
> -                               cp -av ${IMAGE_ROOTFS}$entry =
${WORKDIR}/tmp-mnt-boot || true
> +                               cp -av ${IMAGE_ROOTFS}$entry $TMP/boot =
|| true
>                done
>        fi
>=20
> -       echo "${IMAGE_NAME}-${IMAGEDATESTAMP}" > =
${IMAGE_ROOTFS}/etc/image-version-info
> -
> -       # Cleanup VFAT mount
> -       echo "Cleaning up VFAT mount"
> -       umount ${WORKDIR}/tmp-mnt-boot
> -       ${LOSETUP} -d ${LOOPDEV_BOOT} || true
> -
> -       # Prepare rootfs parition
> -       echo "Creating rootfs loopback"
> -       ${LOSETUP} ${LOOPDEV_FS} ${SDIMG} -o ${FS_OFFSET}
> -
> -       FS_NUM_INODES=3D$(echo $FS_SIZE_BLOCKS / 4 | bc)
> -
> -       case "${ROOTFSTYPE}" in
> -               ext3)
> -                               genext2fs -z -N $FS_NUM_INODES -b =
$FS_SIZE_BLOCKS -d ${IMAGE_ROOTFS} ${LOOPDEV_FS}
> -                               tune2fs -L ${IMAGE_NAME} -j =
${LOOPDEV_FS}
> -                               ;;
> -               ext4)
> -                               genext2fs -z -N $FS_NUM_INODES -b =
$FS_SIZE_BLOCKS -d ${IMAGE_ROOTFS} ${LOOPDEV_FS}
> -                               tune2fs -L ${IMAGE_NAME} -j -O =
extents,uninit_bg,dir_index ${LOOPDEV_FS}
> -                               ;;
> -               *)
> -                               echo "Please set ROOTFSTYPE to =
something supported"
> -                               exit 1
> -                               ;;
> -       esac
> -
> -       ${LOSETUP} -d ${LOOPDEV_FS} || true
> -
> -       gzip -c ${WORKDIR}/sd.img > =
${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}-${IMAGEDATESTAMP}.img.gz
> -       rm -f ${WORKDIR}/sd.img
> +       dd if=3D/dev/zero of=3D${SDIMG} bs=3D$(expr 1000 \* 1000) =
count=3D${SDIMG_SIZE}
> +
> +       # Create the boot filesystem
> +       BOOT_OFFSET=3D32256
> +       BOOT_BLOCKS=3D$(du -bks $TMP/boot | cut -f 1)
> +       BOOT_SIZE=3D$(expr $BOOT_BLOCKS + ${BOOTDD_EXTRA_SPACE})
> +       mkfs.vfat -n ${BOOTDD_VOLUME_ID} -d $TMP/boot -C $TMP/boot.img =
$BOOT_SIZE
> +
> +       # Create partition table
> +       END1=3D$(expr $BOOT_SIZE \* 1024)
> +       END2=3D$(expr $END1 + 512)
> +       parted -s ${SDIMG} mklabel msdos
> +       parted -s ${SDIMG} mkpart primary fat16 ${BOOT_OFFSET}B =
${END1}B
> +       parted -s ${SDIMG} mkpart primary ext3 ${END2}B 100%
> +       parted -s ${SDIMG} set 1 boot on
> +       parted ${SDIMG} print
> +
> +       OFFSET1=3D$(expr $BOOT_OFFSET / 512)
> +       OFFSET2=3D$(expr $END2 / 512)
> +       dd if=3D$TMP/boot.img of=3D${SDIMG} conv=3Dnotrunc =
seek=3D$OFFSET1 bs=3D512
> +       dd if=3D${ROOTFS} of=3D${SDIMG} conv=3Dnotrunc seek=3D$OFFSET2 =
bs=3D512
> +
> +       cd ${DEPLOY_DIR_IMAGE}
> +       ln -sf ${IMAGE_NAME}.sdimg =
${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.sdimg
> }
> --
> 1.7.2.5
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


--Apple-Mail=_6D7A3D74-BA89-4A49-AE68-78CF991DE2A5
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7q8dsACgkQMkyGM64RGpHmZwCdFN5v1ixCZYNYJWgXRnoei+di
PxwAn15uUThQeiX8iconptlZmYGAfnUo
=AwPC
-----END PGP SIGNATURE-----

--Apple-Mail=_6D7A3D74-BA89-4A49-AE68-78CF991DE2A5--
