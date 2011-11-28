Return-Path: <otavio.salvador@gmail.com>
Received: from mail-bw0-f48.google.com (mail-bw0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CB4ACE00303
	for <meta-ti@yoctoproject.org>; Mon, 28 Nov 2011 13:22:58 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by bkbc12 with SMTP id c12so10895857bkb.35
	for <meta-ti@yoctoproject.org>; Mon, 28 Nov 2011 13:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=wcE9HJOyouljggwVqdQOV2dX8E2JQVj9BtqWDhv3kAY=;
	b=GF+edS50WDOA3SDSlIR9DZA+A/QCzZoMp9+teNs4aW0TF6veHItfN/tNekwFM3SiIk
	Ngc47lNFaI1kAOM3/MzLlA8vDUb2Pp4vaAnLBWvex7+y/4ncsYSsjmvX4dXgVGXfV1IP
	Nu1V0wRR5UfRVxfFEO9t0N2MmaxDiUSIt1dfk=
MIME-Version: 1.0
Received: by 10.205.126.13 with SMTP id gu13mr47367058bkc.114.1322515377399;
	Mon, 28 Nov 2011 13:22:57 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.113.148 with HTTP; Mon, 28 Nov 2011 13:22:57 -0800 (PST)
In-Reply-To: <20111128211209.GJ20602@denix.org>
References: <1322513820-28317-1-git-send-email-otavio@ossystems.com.br>
	<20111128211209.GJ20602@denix.org>
Date: Mon, 28 Nov 2011 19:22:57 -0200
X-Google-Sender-Auth: oCQ7SLNJtxmfmaDT2Z9ozl4fLDw
Message-ID: <CAP9ODKqc+Xs4vub69M76XjGk-Er01SXK8ufTnRwwCZJ_Yy28NA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/3] sdcard_image: rewrote to avoid using loopback and mount/unmount
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
X-List-Received-Date: Mon, 28 Nov 2011 21:22:59 -0000
Content-Type: multipart/alternative; boundary=00151747b74447a87904b2d21b13

--00151747b74447a87904b2d21b13
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Nov 28, 2011 at 19:12, Denys Dmytriyenko <denis@denix.org> wrote:

> > Images that use this class needs to generate the rootfs filesystem and
> > set ROOTFS variable according.
>
> I'm not sure using parted instead of genext2fs is much better, but I
> haven't
> tested it yet...


It avoid a lot of non-obvious math and deep knowledge about device
geometry. I prefer this then previous fdisk/sfdisk hacks.

It worked fine for me with beagleboard.


> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > ---
> >  classes/sdcard_image.bbclass |  179
> +++++++++++++++---------------------------
> >  1 files changed, 63 insertions(+), 116 deletions(-)
> >
> > diff --git a/classes/sdcard_image.bbclass b/classes/sdcard_image.bbclass
> > index 519bd9a..c37b2bf 100644
> > --- a/classes/sdcard_image.bbclass
> > +++ b/classes/sdcard_image.bbclass
> > @@ -1,99 +1,43 @@
> > +# Copyright (C) 2011 O.S. Systems Software LTDA.
>
> I don't think you can claim copyright for a derivative work.


If you check the diff, it is 79% different but I don't mind too much about
it. We can put original one together if it fits better.


> > +#
> > +# Create an image that can by written onto a SD card using dd.
> > +#
> > +# External variables needed:
> > +#   ${ROOTFS} - the rootfs image to incorporate
> > +
> >  inherit image
> >
> >  # Add the fstypes we need
> > -IMAGE_FSTYPES_append = " tar.bz2 sdimg"
> > +IMAGE_FSTYPES += "sdimg"
> >
> >  # Ensure required utilities are present
> > -IMAGE_DEPENDS_sdimg = "genext2fs-native e2fsprogs-native"
> > -
> > -# Change this to match your host distro
> > -LOSETUP ?= "/sbin/losetup"
> > -
> > -# Since these need to go in /etc/fstab we can hardcode them
> > -# Since the vars are weakly assigned, you can override them from your
> local.conf
> > -LOOPDEV ?= "/dev/loop1"
> > -LOOPDEV_BOOT ?= "/dev/loop2"
> > -LOOPDEV_FS ?= "/dev/loop3"
> > +IMAGE_DEPENDS_sdimg = "dosfstools-native parted-native"
> >
> >  # Default to 4GiB images
> > -SDIMG_SIZE ?= "444"
> > +SDIMG_SIZE ?= "4000"
> >
> > -# FS type for rootfs
> > -ROOTFSTYPE ?= "ext3"
> > +# Boot partition volume id
> > +BOOTDD_VOLUME_ID_beaglebone = "BEAGLE_BONE"
> > +BOOTDD_VOLUME_ID ?= "${MACHINE}"
> >
> > -BOOTPARTNAME_beaglebone = "BEAGLE_BONE"
> > -BOOTPARTNAME ?= "${MACHINE}"
> > -
> > -IMAGEDATESTAMP = "${@time.strftime('%Y.%m.%d',time.gmtime())}"
> > +# Addional space for boot partition
> > +BOOTDD_EXTRA_SPACE ?= "16384"
> >
> >  # Files and/or directories to be copied into the vfat partition
> >  FATPAYLOAD ?= ""
> >
> >  IMAGE_CMD_sdimg () {
> > -     SDIMG=${WORKDIR}/sd.img
> > -
> > -     # sanity check fstab entry for boot partition mounting
> > -     if [ "x$(cat /etc/fstab | grep ${LOOPDEV_BOOT} | grep
> ${WORKDIR}/tmp-mnt-boot | grep user || true)" = "x" ]; then
> > -             echo "/etc/fstab entries need to be created with the user
> flag for the loop devices like:"
> > -             echo "${LOOPDEV_BOOT} ${WORKDIR}/tmp-mnt-boot vfat user 0
> 0"
> > -        false
> > -     fi
> > -
> > -     # cleanup loops
> > -     for loop in ${LOOPDEV} ${LOOPDEV_BOOT} ${LOOPDEV_FS} ; do
> > -             ${LOSETUP} -d $loop || true
> > -     done
> > -
> > -     # If an SD image is already present, reuse and reformat it
> > -     if [ ! -e ${SDIMG} ] ; then
> > -             dd if=/dev/zero of=${SDIMG} bs=$(echo '255 * 63 * 512' |
> bc) count=${SDIMG_SIZE}
> > -     fi
> > -
> > -     ${LOSETUP} ${LOOPDEV} ${SDIMG}
> > -
> > -     # Create partition table
> > -     dd if=/dev/zero of=${LOOPDEV} bs=1024 count=1024
> > -     SIZE=$(/sbin/fdisk -l ${LOOPDEV} | grep Disk | grep bytes | awk
> '{print $5}')
> > -     CYLINDERS=$(echo $SIZE/255/63/512 | bc)
> > -     {
> > -     echo ,9,0x0C,*
> > -     echo ,,,-
> > -     } | /sbin/sfdisk -D -H 255 -S 63 -C ${CYLINDERS} ${LOOPDEV}
> > -
> > -     # Prepare loop devices for boot and filesystem partitions
> > -     BOOT_OFFSET=32256
> > -     FS_OFFSET_SECT=$(/sbin/fdisk -l -u ${LOOPDEV} 2>&1 | grep Linux |
> perl -p -i -e "s/\s+/ /"|cut -d " " -f 2)
> > -     FS_OFFSET=$(echo "$FS_OFFSET_SECT * 512" | bc)
> > -     FS_SIZE_BLOCKS=$(/sbin/fdisk -l -u ${LOOPDEV} 2>&1 | grep Linux |
> perl -p -i -e "s/\s+/ /g" \
> > -     |cut -d " " -f 4 | cut -d "+" -f 1)
> > -
> > -     LOOPDEV_BLOCKS=$(/sbin/fdisk -l -u ${LOOPDEV} 2>&1 | grep FAT |
> perl -p -i -e "s/\s+/ /g"|cut -d " " -f 5)
> > -     LOOPDEV_BYTES=$(echo "$LOOPDEV_BLOCKS * 1024" | bc)
> > -
> > -     ${LOSETUP} -d ${LOOPDEV}
> > -
> > -     ${LOSETUP} ${LOOPDEV_BOOT} ${SDIMG} -o ${BOOT_OFFSET}
> > -
> > -     /sbin/mkfs.vfat ${LOOPDEV_BOOT} -n ${BOOTPARTNAME} $LOOPDEV_BLOCKS
> > -
> > -     # Prepare filesystem partition
> > -     # Copy ubi used by flashing scripts
> > -     if [ -e  ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ] ; then
> > -             echo "Copying UBIFS image to file system"
> > -             cp ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi
> ${IMAGE_ROOTFS}/boot/fs.ubi
> > -     fi
> > +     TMP=${WORKDIR}/tmp
> > +     SDIMG=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.sdimg
> >
> > -     # Prepare boot partion. First mount the boot partition, and copy
> the boot loader and supporting files
> > -     # from the root filesystem
> > -
> > -     mkdir -p ${WORKDIR}/tmp-mnt-boot
> > -     mount $LOOPDEV_BOOT ${WORKDIR}/tmp-mnt-boot
> > +     # Prepare boot filesystem
> > +     install -d $TMP/boot
> >
> >       echo "Copying bootloaders into the boot partition"
> >       if [ -e ${IMAGE_ROOTFS}/boot/MLO ] ; then
> > -             cp -v ${IMAGE_ROOTFS}/boot/MLO ${WORKDIR}/tmp-mnt-boot
> > +             cp -v ${IMAGE_ROOTFS}/boot/MLO $TMP/boot
> >       else
> > -             cp -v ${DEPLOY_DIR_IMAGE}/MLO ${WORKDIR}/tmp-mnt-boot
> > +             cp -v ${DEPLOY_DIR_IMAGE}/MLO $TMP/boot
> >       fi
> >
> >       # Check for u-boot SPL
> > @@ -103,54 +47,57 @@ IMAGE_CMD_sdimg () {
> >               suffix=bin
> >       fi
> >
> > -     cp -v ${IMAGE_ROOTFS}/boot/uEnv.txt ${WORKDIR}/tmp-mnt-boot || true
> > -     cp -v ${IMAGE_ROOTFS}/boot/user.txt ${WORKDIR}/tmp-mnt-boot || true
> > -     cp -v ${IMAGE_ROOTFS}/boot/uImage ${WORKDIR}/tmp-mnt-boot || true
> > -
> >       if [ -e ${IMAGE_ROOTFS}/boot/u-boot.$suffix ] ; then
> > -             cp -v ${IMAGE_ROOTFS}/boot/{u-boot.$suffix}
> ${WORKDIR}/tmp-mnt-boot || true
> > +             cp -v ${IMAGE_ROOTFS}/boot/u-boot.$suffix $TMP/boot || true
> >       else
> > -             cp -v ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.$suffix
> ${WORKDIR}/tmp-mnt-boot/u-boot.$suffix
> > +             cp -v ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.$suffix
> $TMP/boot/u-boot.$suffix
> > +     fi
> > +
> > +     if [ -e ${IMAGE_ROOTFS}/boot/uImage ]; then
> > +             cp -v ${IMAGE_ROOTFS}/boot/uImage $TMP/boot || true
> > +     else
> > +             cp -v ${DEPLOY_DIR_IMAGE}/uImage-${MACHINE}.$suffix
> $TMP/boot/uImage
> > +     fi
> > +
> > +     cp -v ${IMAGE_ROOTFS}/boot/uEnv.txt $TMP/boot || true
> > +     cp -v ${IMAGE_ROOTFS}/boot/user.txt $TMP/boot || true
> > +
> > +     # Copy ubi used by flashing scripts
> > +     if [ -e  ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ] ; then
> > +             echo "Copying UBIFS image to file system"
> > +             cp ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi
> ${IMAGE_ROOTFS}/boot/fs.ubi
> >       fi
> >
> >       if [ -n ${FATPAYLOAD} ] ; then
> >               echo "Copying payload into VFAT"
> >               for entry in ${FATPAYLOAD} ; do
> >                               # add the || true to stop aborting on vfat
> issues like not supporting .~lock files
> > -                             cp -av ${IMAGE_ROOTFS}$entry
> ${WORKDIR}/tmp-mnt-boot || true
> > +                             cp -av ${IMAGE_ROOTFS}$entry $TMP/boot ||
> true
> >               done
> >       fi
> >
> > -     echo "${IMAGE_NAME}-${IMAGEDATESTAMP}" >
> ${IMAGE_ROOTFS}/etc/image-version-info
> > -
> > -     # Cleanup VFAT mount
> > -     echo "Cleaning up VFAT mount"
> > -     umount ${WORKDIR}/tmp-mnt-boot
> > -     ${LOSETUP} -d ${LOOPDEV_BOOT} || true
> > -
> > -     # Prepare rootfs parition
> > -     echo "Creating rootfs loopback"
> > -     ${LOSETUP} ${LOOPDEV_FS} ${SDIMG} -o ${FS_OFFSET}
> > -
> > -     FS_NUM_INODES=$(echo $FS_SIZE_BLOCKS / 4 | bc)
> > -
> > -     case "${ROOTFSTYPE}" in
> > -             ext3)
> > -                             genext2fs -z -N $FS_NUM_INODES -b
> $FS_SIZE_BLOCKS -d ${IMAGE_ROOTFS} ${LOOPDEV_FS}
> > -                             tune2fs -L ${IMAGE_NAME} -j ${LOOPDEV_FS}
> > -                             ;;
> > -             ext4)
> > -                             genext2fs -z -N $FS_NUM_INODES -b
> $FS_SIZE_BLOCKS -d ${IMAGE_ROOTFS} ${LOOPDEV_FS}
> > -                             tune2fs -L ${IMAGE_NAME} -j -O
> extents,uninit_bg,dir_index ${LOOPDEV_FS}
> > -                             ;;
> > -             *)
> > -                             echo "Please set ROOTFSTYPE to something
> supported"
> > -                             exit 1
> > -                             ;;
> > -     esac
> > -
> > -     ${LOSETUP} -d ${LOOPDEV_FS} || true
> > -
> > -     gzip -c ${WORKDIR}/sd.img >
> ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}-${IMAGEDATESTAMP}.img.gz
> > -     rm -f ${WORKDIR}/sd.img
> > +     dd if=/dev/zero of=${SDIMG} bs=`expr 1000 \* 1000`
> count=${SDIMG_SIZE}
> > +
> > +     # Create the boot filesystem
> > +     BOOT_OFFSET=32256
> > +     BOOT_BLOCKS=`du -bks $TMP/boot | cut -f 1`
> > +     BOOT_SIZE=`expr $BOOT_BLOCKS + ${BOOTDD_EXTRA_SPACE}`
>
> Can you please replace backticks?


You prefer $(...) form?

> +     mkfs.vfat -n ${BOOTDD_VOLUME_ID} -d $TMP/boot -C $TMP/boot.img
> $BOOT_SIZE
> > +
> > +     # Create partition table
> > +     END1=`expr $BOOT_SIZE \* 1024`
> > +     END2=`expr $END1 + 512`
> > +     parted -s ${SDIMG} mklabel msdos
> > +     parted -s ${SDIMG} mkpart primary fat16 ${BOOT_OFFSET}B ${END1}B
> > +     parted -s ${SDIMG} mkpart primary ext3 ${END2}B 100%
> > +     parted -s ${SDIMG} set 1 boot on
> > +     parted ${SDIMG} print
> > +
> > +     OFFSET1=`expr $BOOT_OFFSET / 512`
> > +     OFFSET2=`expr $END2 / 512`
> > +     dd if=$TMP/boot.img of=${SDIMG} conv=notrunc seek=$OFFSET1 bs=512
> > +     dd if=${ROOTFS} of=${SDIMG} conv=notrunc seek=$OFFSET2 bs=512
> > +
> > +     cd ${DEPLOY_DIR_IMAGE}
> > +     ln -sf ${IMAGE_NAME}.sdimg
> ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.sdimg
> >  }
> > --
> > 1.7.2.5
> >
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> >
>



-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--00151747b74447a87904b2d21b13
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Mon, Nov 28, 2011 at 19:12, Denys Dmytriyenko=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:denis@denix.org">denis@denix.org</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
<div class=3D"im">&gt; Images that use this class needs to generate the roo=
tfs filesystem and<br>
&gt; set ROOTFS variable according.<br>
<br>
</div>I&#39;m not sure using parted instead of genext2fs is much better, bu=
t I haven&#39;t<br>
tested it yet...</blockquote><div><br></div><div>It avoid a lot of non-obvi=
ous math and deep knowledge about device geometry. I prefer this then previ=
ous fdisk/sfdisk hacks.</div><div><br></div><div>It worked fine for me with=
 beagleboard.</div>
<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex;"><div class=3D"im">
&gt; Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.=
com.br">otavio@ossystems.com.br</a>&gt;<br>
&gt; ---<br>
&gt; =A0classes/sdcard_image.bbclass | =A0179 +++++++++++++++--------------=
-------------<br>
&gt; =A01 files changed, 63 insertions(+), 116 deletions(-)<br>
&gt;<br>
&gt; diff --git a/classes/sdcard_image.bbclass b/classes/sdcard_image.bbcla=
ss<br>
&gt; index 519bd9a..c37b2bf 100644<br>
&gt; --- a/classes/sdcard_image.bbclass<br>
&gt; +++ b/classes/sdcard_image.bbclass<br>
&gt; @@ -1,99 +1,43 @@<br>
&gt; +# Copyright (C) 2011 O.S. Systems Software LTDA.<br>
<br>
</div>I don&#39;t think you can claim copyright for a derivative work.</blo=
ckquote><div><br></div><div>If you check the diff, it is 79% different but =
I don&#39;t mind too much about it. We can put original one together if it =
fits better.</div>
<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex;"><div><div class=3D"h5">
&gt; +#<br>
&gt; +# Create an image that can by written onto a SD card using dd.<br>
&gt; +#<br>
&gt; +# External variables needed:<br>
&gt; +# =A0 ${ROOTFS} - the rootfs image to incorporate<br>
&gt; +<br>
&gt; =A0inherit image<br>
&gt;<br>
&gt; =A0# Add the fstypes we need<br>
&gt; -IMAGE_FSTYPES_append =3D &quot; tar.bz2 sdimg&quot;<br>
&gt; +IMAGE_FSTYPES +=3D &quot;sdimg&quot;<br>
&gt;<br>
&gt; =A0# Ensure required utilities are present<br>
&gt; -IMAGE_DEPENDS_sdimg =3D &quot;genext2fs-native e2fsprogs-native&quot;=
<br>
&gt; -<br>
&gt; -# Change this to match your host distro<br>
&gt; -LOSETUP ?=3D &quot;/sbin/losetup&quot;<br>
&gt; -<br>
&gt; -# Since these need to go in /etc/fstab we can hardcode them<br>
&gt; -# Since the vars are weakly assigned, you can override them from your=
 local.conf<br>
&gt; -LOOPDEV ?=3D &quot;/dev/loop1&quot;<br>
&gt; -LOOPDEV_BOOT ?=3D &quot;/dev/loop2&quot;<br>
&gt; -LOOPDEV_FS ?=3D &quot;/dev/loop3&quot;<br>
&gt; +IMAGE_DEPENDS_sdimg =3D &quot;dosfstools-native parted-native&quot;<b=
r>
&gt;<br>
&gt; =A0# Default to 4GiB images<br>
&gt; -SDIMG_SIZE ?=3D &quot;444&quot;<br>
&gt; +SDIMG_SIZE ?=3D &quot;4000&quot;<br>
&gt;<br>
&gt; -# FS type for rootfs<br>
&gt; -ROOTFSTYPE ?=3D &quot;ext3&quot;<br>
&gt; +# Boot partition volume id<br>
&gt; +BOOTDD_VOLUME_ID_beaglebone =3D &quot;BEAGLE_BONE&quot;<br>
&gt; +BOOTDD_VOLUME_ID ?=3D &quot;${MACHINE}&quot;<br>
&gt;<br>
&gt; -BOOTPARTNAME_beaglebone =3D &quot;BEAGLE_BONE&quot;<br>
&gt; -BOOTPARTNAME ?=3D &quot;${MACHINE}&quot;<br>
&gt; -<br>
&gt; -IMAGEDATESTAMP =3D &quot;${@time.strftime(&#39;%Y.%m.%d&#39;,time.gmt=
ime())}&quot;<br>
&gt; +# Addional space for boot partition<br>
&gt; +BOOTDD_EXTRA_SPACE ?=3D &quot;16384&quot;<br>
&gt;<br>
&gt; =A0# Files and/or directories to be copied into the vfat partition<br>
&gt; =A0FATPAYLOAD ?=3D &quot;&quot;<br>
&gt;<br>
&gt; =A0IMAGE_CMD_sdimg () {<br>
&gt; - =A0 =A0 SDIMG=3D${WORKDIR}/sd.img<br>
&gt; -<br>
&gt; - =A0 =A0 # sanity check fstab entry for boot partition mounting<br>
&gt; - =A0 =A0 if [ &quot;x$(cat /etc/fstab | grep ${LOOPDEV_BOOT} | grep $=
{WORKDIR}/tmp-mnt-boot | grep user || true)&quot; =3D &quot;x&quot; ]; then=
<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 echo &quot;/etc/fstab entries need to be cre=
ated with the user flag for the loop devices like:&quot;<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 echo &quot;${LOOPDEV_BOOT} ${WORKDIR}/tmp-mn=
t-boot vfat user 0 0&quot;<br>
&gt; - =A0 =A0 =A0 =A0false<br>
&gt; - =A0 =A0 fi<br>
&gt; -<br>
&gt; - =A0 =A0 # cleanup loops<br>
&gt; - =A0 =A0 for loop in ${LOOPDEV} ${LOOPDEV_BOOT} ${LOOPDEV_FS} ; do<br=
>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 ${LOSETUP} -d $loop || true<br>
&gt; - =A0 =A0 done<br>
&gt; -<br>
&gt; - =A0 =A0 # If an SD image is already present, reuse and reformat it<b=
r>
&gt; - =A0 =A0 if [ ! -e ${SDIMG} ] ; then<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 dd if=3D/dev/zero of=3D${SDIMG} bs=3D$(echo =
&#39;255 * 63 * 512&#39; | bc) count=3D${SDIMG_SIZE}<br>
&gt; - =A0 =A0 fi<br>
&gt; -<br>
&gt; - =A0 =A0 ${LOSETUP} ${LOOPDEV} ${SDIMG}<br>
&gt; -<br>
&gt; - =A0 =A0 # Create partition table<br>
&gt; - =A0 =A0 dd if=3D/dev/zero of=3D${LOOPDEV} bs=3D1024 count=3D1024<br>
&gt; - =A0 =A0 SIZE=3D$(/sbin/fdisk -l ${LOOPDEV} | grep Disk | grep bytes =
| awk &#39;{print $5}&#39;)<br>
&gt; - =A0 =A0 CYLINDERS=3D$(echo $SIZE/255/63/512 | bc)<br>
&gt; - =A0 =A0 {<br>
&gt; - =A0 =A0 echo ,9,0x0C,*<br>
&gt; - =A0 =A0 echo ,,,-<br>
&gt; - =A0 =A0 } | /sbin/sfdisk -D -H 255 -S 63 -C ${CYLINDERS} ${LOOPDEV}<=
br>
&gt; -<br>
&gt; - =A0 =A0 # Prepare loop devices for boot and filesystem partitions<br=
>
&gt; - =A0 =A0 BOOT_OFFSET=3D32256<br>
&gt; - =A0 =A0 FS_OFFSET_SECT=3D$(/sbin/fdisk -l -u ${LOOPDEV} 2&gt;&amp;1 =
| grep Linux | perl -p -i -e &quot;s/\s+/ /&quot;|cut -d &quot; &quot; -f 2=
)<br>
&gt; - =A0 =A0 FS_OFFSET=3D$(echo &quot;$FS_OFFSET_SECT * 512&quot; | bc)<b=
r>
&gt; - =A0 =A0 FS_SIZE_BLOCKS=3D$(/sbin/fdisk -l -u ${LOOPDEV} 2&gt;&amp;1 =
| grep Linux | perl -p -i -e &quot;s/\s+/ /g&quot; \<br>
&gt; - =A0 =A0 |cut -d &quot; &quot; -f 4 | cut -d &quot;+&quot; -f 1)<br>
&gt; -<br>
&gt; - =A0 =A0 LOOPDEV_BLOCKS=3D$(/sbin/fdisk -l -u ${LOOPDEV} 2&gt;&amp;1 =
| grep FAT | perl -p -i -e &quot;s/\s+/ /g&quot;|cut -d &quot; &quot; -f 5)=
<br>
&gt; - =A0 =A0 LOOPDEV_BYTES=3D$(echo &quot;$LOOPDEV_BLOCKS * 1024&quot; | =
bc)<br>
&gt; -<br>
&gt; - =A0 =A0 ${LOSETUP} -d ${LOOPDEV}<br>
&gt; -<br>
&gt; - =A0 =A0 ${LOSETUP} ${LOOPDEV_BOOT} ${SDIMG} -o ${BOOT_OFFSET}<br>
&gt; -<br>
&gt; - =A0 =A0 /sbin/mkfs.vfat ${LOOPDEV_BOOT} -n ${BOOTPARTNAME} $LOOPDEV_=
BLOCKS<br>
&gt; -<br>
&gt; - =A0 =A0 # Prepare filesystem partition<br>
&gt; - =A0 =A0 # Copy ubi used by flashing scripts<br>
&gt; - =A0 =A0 if [ -e =A0${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ] ; =
then<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 echo &quot;Copying UBIFS image to file syste=
m&quot;<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 cp ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.=
ubi ${IMAGE_ROOTFS}/boot/fs.ubi<br>
&gt; - =A0 =A0 fi<br>
&gt; + =A0 =A0 TMP=3D${WORKDIR}/tmp<br>
&gt; + =A0 =A0 SDIMG=3D${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.sdimg<br>
&gt;<br>
&gt; - =A0 =A0 # Prepare boot partion. First mount the boot partition, and =
copy the boot loader and supporting files<br>
&gt; - =A0 =A0 # from the root filesystem<br>
&gt; -<br>
&gt; - =A0 =A0 mkdir -p ${WORKDIR}/tmp-mnt-boot<br>
&gt; - =A0 =A0 mount $LOOPDEV_BOOT ${WORKDIR}/tmp-mnt-boot<br>
&gt; + =A0 =A0 # Prepare boot filesystem<br>
&gt; + =A0 =A0 install -d $TMP/boot<br>
&gt;<br>
&gt; =A0 =A0 =A0 echo &quot;Copying bootloaders into the boot partition&quo=
t;<br>
&gt; =A0 =A0 =A0 if [ -e ${IMAGE_ROOTFS}/boot/MLO ] ; then<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 cp -v ${IMAGE_ROOTFS}/boot/MLO ${WORKDIR}/tm=
p-mnt-boot<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 cp -v ${IMAGE_ROOTFS}/boot/MLO $TMP/boot<br>
&gt; =A0 =A0 =A0 else<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 cp -v ${DEPLOY_DIR_IMAGE}/MLO ${WORKDIR}/tmp=
-mnt-boot<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 cp -v ${DEPLOY_DIR_IMAGE}/MLO $TMP/boot<br>
&gt; =A0 =A0 =A0 fi<br>
&gt;<br>
&gt; =A0 =A0 =A0 # Check for u-boot SPL<br>
&gt; @@ -103,54 +47,57 @@ IMAGE_CMD_sdimg () {<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 suffix=3Dbin<br>
&gt; =A0 =A0 =A0 fi<br>
&gt;<br>
&gt; - =A0 =A0 cp -v ${IMAGE_ROOTFS}/boot/uEnv.txt ${WORKDIR}/tmp-mnt-boot =
|| true<br>
&gt; - =A0 =A0 cp -v ${IMAGE_ROOTFS}/boot/user.txt ${WORKDIR}/tmp-mnt-boot =
|| true<br>
&gt; - =A0 =A0 cp -v ${IMAGE_ROOTFS}/boot/uImage ${WORKDIR}/tmp-mnt-boot ||=
 true<br>
&gt; -<br>
&gt; =A0 =A0 =A0 if [ -e ${IMAGE_ROOTFS}/boot/u-boot.$suffix ] ; then<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 cp -v ${IMAGE_ROOTFS}/boot/{u-boot.$suffix} =
${WORKDIR}/tmp-mnt-boot || true<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 cp -v ${IMAGE_ROOTFS}/boot/u-boot.$suffix $T=
MP/boot || true<br>
&gt; =A0 =A0 =A0 else<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 cp -v ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.=
$suffix ${WORKDIR}/tmp-mnt-boot/u-boot.$suffix<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 cp -v ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.=
$suffix $TMP/boot/u-boot.$suffix<br>
&gt; + =A0 =A0 fi<br>
&gt; +<br>
&gt; + =A0 =A0 if [ -e ${IMAGE_ROOTFS}/boot/uImage ]; then<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 cp -v ${IMAGE_ROOTFS}/boot/uImage $TMP/boot =
|| true<br>
&gt; + =A0 =A0 else<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 cp -v ${DEPLOY_DIR_IMAGE}/uImage-${MACHINE}.=
$suffix $TMP/boot/uImage<br>
&gt; + =A0 =A0 fi<br>
&gt; +<br>
&gt; + =A0 =A0 cp -v ${IMAGE_ROOTFS}/boot/uEnv.txt $TMP/boot || true<br>
&gt; + =A0 =A0 cp -v ${IMAGE_ROOTFS}/boot/user.txt $TMP/boot || true<br>
&gt; +<br>
&gt; + =A0 =A0 # Copy ubi used by flashing scripts<br>
&gt; + =A0 =A0 if [ -e =A0${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ] ; =
then<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 echo &quot;Copying UBIFS image to file syste=
m&quot;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 cp ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.=
ubi ${IMAGE_ROOTFS}/boot/fs.ubi<br>
&gt; =A0 =A0 =A0 fi<br>
&gt;<br>
&gt; =A0 =A0 =A0 if [ -n ${FATPAYLOAD} ] ; then<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo &quot;Copying payload into VFAT&quot;=
<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 for entry in ${FATPAYLOAD} ; do<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 # add the =
|| true to stop aborting on vfat issues like not supporting .~lock files<br=
>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cp -av ${IMA=
GE_ROOTFS}$entry ${WORKDIR}/tmp-mnt-boot || true<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cp -av ${IMA=
GE_ROOTFS}$entry $TMP/boot || true<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 done<br>
&gt; =A0 =A0 =A0 fi<br>
&gt;<br>
&gt; - =A0 =A0 echo &quot;${IMAGE_NAME}-${IMAGEDATESTAMP}&quot; &gt; ${IMAG=
E_ROOTFS}/etc/image-version-info<br>
&gt; -<br>
&gt; - =A0 =A0 # Cleanup VFAT mount<br>
&gt; - =A0 =A0 echo &quot;Cleaning up VFAT mount&quot;<br>
&gt; - =A0 =A0 umount ${WORKDIR}/tmp-mnt-boot<br>
&gt; - =A0 =A0 ${LOSETUP} -d ${LOOPDEV_BOOT} || true<br>
&gt; -<br>
&gt; - =A0 =A0 # Prepare rootfs parition<br>
&gt; - =A0 =A0 echo &quot;Creating rootfs loopback&quot;<br>
&gt; - =A0 =A0 ${LOSETUP} ${LOOPDEV_FS} ${SDIMG} -o ${FS_OFFSET}<br>
&gt; -<br>
&gt; - =A0 =A0 FS_NUM_INODES=3D$(echo $FS_SIZE_BLOCKS / 4 | bc)<br>
&gt; -<br>
&gt; - =A0 =A0 case &quot;${ROOTFSTYPE}&quot; in<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 ext3)<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 genext2fs -z=
 -N $FS_NUM_INODES -b $FS_SIZE_BLOCKS -d ${IMAGE_ROOTFS} ${LOOPDEV_FS}<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tune2fs -L $=
{IMAGE_NAME} -j ${LOOPDEV_FS}<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ;;<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 ext4)<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 genext2fs -z=
 -N $FS_NUM_INODES -b $FS_SIZE_BLOCKS -d ${IMAGE_ROOTFS} ${LOOPDEV_FS}<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tune2fs -L $=
{IMAGE_NAME} -j -O extents,uninit_bg,dir_index ${LOOPDEV_FS}<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ;;<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 *)<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo &quot;P=
lease set ROOTFSTYPE to something supported&quot;<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 exit 1<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ;;<br>
&gt; - =A0 =A0 esac<br>
&gt; -<br>
&gt; - =A0 =A0 ${LOSETUP} -d ${LOOPDEV_FS} || true<br>
&gt; -<br>
&gt; - =A0 =A0 gzip -c ${WORKDIR}/sd.img &gt; ${DEPLOY_DIR_IMAGE}/${IMAGE_N=
AME}-${IMAGEDATESTAMP}.img.gz<br>
&gt; - =A0 =A0 rm -f ${WORKDIR}/sd.img<br>
&gt; + =A0 =A0 dd if=3D/dev/zero of=3D${SDIMG} bs=3D`expr 1000 \* 1000` cou=
nt=3D${SDIMG_SIZE}<br>
&gt; +<br>
&gt; + =A0 =A0 # Create the boot filesystem<br>
&gt; + =A0 =A0 BOOT_OFFSET=3D32256<br>
&gt; + =A0 =A0 BOOT_BLOCKS=3D`du -bks $TMP/boot | cut -f 1`<br>
&gt; + =A0 =A0 BOOT_SIZE=3D`expr $BOOT_BLOCKS + ${BOOTDD_EXTRA_SPACE}`<br>
<br>
</div></div>Can you please replace backticks?</blockquote><div><br></div><d=
iv>You prefer $(...) form?</div><div><br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x;">
<div class=3D"im">
&gt; + =A0 =A0 mkfs.vfat -n ${BOOTDD_VOLUME_ID} -d $TMP/boot -C $TMP/boot.i=
mg $BOOT_SIZE<br>
&gt; +<br>
&gt; + =A0 =A0 # Create partition table<br>
&gt; + =A0 =A0 END1=3D`expr $BOOT_SIZE \* 1024`<br>
&gt; + =A0 =A0 END2=3D`expr $END1 + 512`<br>
&gt; + =A0 =A0 parted -s ${SDIMG} mklabel msdos<br>
&gt; + =A0 =A0 parted -s ${SDIMG} mkpart primary fat16 ${BOOT_OFFSET}B ${EN=
D1}B<br>
&gt; + =A0 =A0 parted -s ${SDIMG} mkpart primary ext3 ${END2}B 100%<br>
&gt; + =A0 =A0 parted -s ${SDIMG} set 1 boot on<br>
&gt; + =A0 =A0 parted ${SDIMG} print<br>
&gt; +<br>
&gt; + =A0 =A0 OFFSET1=3D`expr $BOOT_OFFSET / 512`<br>
&gt; + =A0 =A0 OFFSET2=3D`expr $END2 / 512`<br>
&gt; + =A0 =A0 dd if=3D$TMP/boot.img of=3D${SDIMG} conv=3Dnotrunc seek=3D$O=
FFSET1 bs=3D512<br>
&gt; + =A0 =A0 dd if=3D${ROOTFS} of=3D${SDIMG} conv=3Dnotrunc seek=3D$OFFSE=
T2 bs=3D512<br>
&gt; +<br>
&gt; + =A0 =A0 cd ${DEPLOY_DIR_IMAGE}<br>
&gt; + =A0 =A0 ln -sf ${IMAGE_NAME}.sdimg ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_=
NAME}.sdimg<br>
&gt; =A0}<br>
&gt; --<br>
&gt; 1.7.2.5<br>
&gt;<br>
</div>&gt; _______________________________________________<br>
&gt; meta-ti mailing list<br>
&gt; <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</=
a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=3D"=
_blank">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
&gt;<br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>Otavio Salva=
dor=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<=
br>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">ota=
vio@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=
=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--00151747b74447a87904b2d21b13--
