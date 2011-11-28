Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AA8E9E00303
	for <meta-ti@yoctoproject.org>; Mon, 28 Nov 2011 13:12:31 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [96.240.135.93])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LVE000KP2W93JA7@vms173001.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 28 Nov 2011 15:12:10 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A0EC114AF5D; Mon,
	28 Nov 2011 16:12:09 -0500 (EST)
Date: Mon, 28 Nov 2011 16:12:09 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-id: <20111128211209.GJ20602@denix.org>
References: <1322513820-28317-1-git-send-email-otavio@ossystems.com.br>
MIME-version: 1.0
In-reply-to: <1322513820-28317-1-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/3] sdcard_image: rewrote to avoid using	loopback and mount/unmount
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
X-List-Received-Date: Mon, 28 Nov 2011 21:12:32 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Otavio,

On Mon, Nov 28, 2011 at 08:56:58PM +0000, Otavio Salvador wrote:
> Allow generation by regular users without fancy setup requirements and
> use of loopback and mount/unmount. Besides, this also includes
> following improvements:
> 
>  * use of megabytes when specifying SDIMG_SIZE
>  * remove restriction of filesystem to rootfs
> 
> Images that use this class needs to generate the rootfs filesystem and
> set ROOTFS variable according.

I'm not sure using parted instead of genext2fs is much better, but I haven't 
tested it yet...


> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  classes/sdcard_image.bbclass |  179 +++++++++++++++---------------------------
>  1 files changed, 63 insertions(+), 116 deletions(-)
> 
> diff --git a/classes/sdcard_image.bbclass b/classes/sdcard_image.bbclass
> index 519bd9a..c37b2bf 100644
> --- a/classes/sdcard_image.bbclass
> +++ b/classes/sdcard_image.bbclass
> @@ -1,99 +1,43 @@
> +# Copyright (C) 2011 O.S. Systems Software LTDA.

I don't think you can claim copyright for a derivative work.


> +#
> +# Create an image that can by written onto a SD card using dd.
> +#
> +# External variables needed:
> +#   ${ROOTFS} - the rootfs image to incorporate
> +
>  inherit image
>  
>  # Add the fstypes we need
> -IMAGE_FSTYPES_append = " tar.bz2 sdimg"
> +IMAGE_FSTYPES += "sdimg"
>  
>  # Ensure required utilities are present
> -IMAGE_DEPENDS_sdimg = "genext2fs-native e2fsprogs-native"
> -
> -# Change this to match your host distro
> -LOSETUP ?= "/sbin/losetup"
> -
> -# Since these need to go in /etc/fstab we can hardcode them
> -# Since the vars are weakly assigned, you can override them from your local.conf
> -LOOPDEV ?= "/dev/loop1"
> -LOOPDEV_BOOT ?= "/dev/loop2"
> -LOOPDEV_FS ?= "/dev/loop3"
> +IMAGE_DEPENDS_sdimg = "dosfstools-native parted-native"
>  
>  # Default to 4GiB images
> -SDIMG_SIZE ?= "444" 
> +SDIMG_SIZE ?= "4000"
>  
> -# FS type for rootfs
> -ROOTFSTYPE ?= "ext3"
> +# Boot partition volume id
> +BOOTDD_VOLUME_ID_beaglebone = "BEAGLE_BONE"
> +BOOTDD_VOLUME_ID ?= "${MACHINE}"
>  
> -BOOTPARTNAME_beaglebone = "BEAGLE_BONE"
> -BOOTPARTNAME ?= "${MACHINE}"
> -
> -IMAGEDATESTAMP = "${@time.strftime('%Y.%m.%d',time.gmtime())}"
> +# Addional space for boot partition
> +BOOTDD_EXTRA_SPACE ?= "16384"
>  
>  # Files and/or directories to be copied into the vfat partition
>  FATPAYLOAD ?= ""
>  
>  IMAGE_CMD_sdimg () {
> -	SDIMG=${WORKDIR}/sd.img
> -
> -	# sanity check fstab entry for boot partition mounting
> -	if [ "x$(cat /etc/fstab | grep ${LOOPDEV_BOOT} | grep ${WORKDIR}/tmp-mnt-boot | grep user || true)" = "x" ]; then
> -		echo "/etc/fstab entries need to be created with the user flag for the loop devices like:"
> -		echo "${LOOPDEV_BOOT} ${WORKDIR}/tmp-mnt-boot vfat user 0 0"
> -        false
> -	fi
> -
> -	# cleanup loops
> -	for loop in ${LOOPDEV} ${LOOPDEV_BOOT} ${LOOPDEV_FS} ; do
> -		${LOSETUP} -d $loop || true
> -	done
> -
> -	# If an SD image is already present, reuse and reformat it
> -	if [ ! -e ${SDIMG} ] ; then
> -		dd if=/dev/zero of=${SDIMG} bs=$(echo '255 * 63 * 512' | bc) count=${SDIMG_SIZE}
> -	fi
> -
> -	${LOSETUP} ${LOOPDEV} ${SDIMG}
> -
> -	# Create partition table
> -	dd if=/dev/zero of=${LOOPDEV} bs=1024 count=1024
> -	SIZE=$(/sbin/fdisk -l ${LOOPDEV} | grep Disk | grep bytes | awk '{print $5}')
> -	CYLINDERS=$(echo $SIZE/255/63/512 | bc)
> -	{
> -	echo ,9,0x0C,*
> -	echo ,,,-
> -	} | /sbin/sfdisk -D -H 255 -S 63 -C ${CYLINDERS} ${LOOPDEV}
> -
> -	# Prepare loop devices for boot and filesystem partitions
> -	BOOT_OFFSET=32256
> -	FS_OFFSET_SECT=$(/sbin/fdisk -l -u ${LOOPDEV} 2>&1 | grep Linux | perl -p -i -e "s/\s+/ /"|cut -d " " -f 2)
> -	FS_OFFSET=$(echo "$FS_OFFSET_SECT * 512" | bc)
> -	FS_SIZE_BLOCKS=$(/sbin/fdisk -l -u ${LOOPDEV} 2>&1 | grep Linux | perl -p -i -e "s/\s+/ /g" \ 
> -	|cut -d " " -f 4 | cut -d "+" -f 1)
> - 
> -	LOOPDEV_BLOCKS=$(/sbin/fdisk -l -u ${LOOPDEV} 2>&1 | grep FAT | perl -p -i -e "s/\s+/ /g"|cut -d " " -f 5)
> -	LOOPDEV_BYTES=$(echo "$LOOPDEV_BLOCKS * 1024" | bc)
> -
> -	${LOSETUP} -d ${LOOPDEV}
> -
> -	${LOSETUP} ${LOOPDEV_BOOT} ${SDIMG} -o ${BOOT_OFFSET} 
> -
> -	/sbin/mkfs.vfat ${LOOPDEV_BOOT} -n ${BOOTPARTNAME} $LOOPDEV_BLOCKS
> -
> -	# Prepare filesystem partition
> -	# Copy ubi used by flashing scripts
> -	if [ -e  ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ] ; then
> -		echo "Copying UBIFS image to file system"
> -		cp ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${IMAGE_ROOTFS}/boot/fs.ubi
> -	fi
> +	TMP=${WORKDIR}/tmp
> +	SDIMG=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.sdimg
>  
> -	# Prepare boot partion. First mount the boot partition, and copy the boot loader and supporting files
> -	# from the root filesystem
> -
> -	mkdir -p ${WORKDIR}/tmp-mnt-boot
> -	mount $LOOPDEV_BOOT ${WORKDIR}/tmp-mnt-boot
> +	# Prepare boot filesystem
> +	install -d $TMP/boot
>  
>  	echo "Copying bootloaders into the boot partition"
>  	if [ -e ${IMAGE_ROOTFS}/boot/MLO ] ; then
> -		cp -v ${IMAGE_ROOTFS}/boot/MLO ${WORKDIR}/tmp-mnt-boot 
> +		cp -v ${IMAGE_ROOTFS}/boot/MLO $TMP/boot
>  	else
> -		cp -v ${DEPLOY_DIR_IMAGE}/MLO ${WORKDIR}/tmp-mnt-boot
> +		cp -v ${DEPLOY_DIR_IMAGE}/MLO $TMP/boot
>  	fi
>  
>  	# Check for u-boot SPL
> @@ -103,54 +47,57 @@ IMAGE_CMD_sdimg () {
>  		suffix=bin
>  	fi
>  
> -	cp -v ${IMAGE_ROOTFS}/boot/uEnv.txt ${WORKDIR}/tmp-mnt-boot || true
> -	cp -v ${IMAGE_ROOTFS}/boot/user.txt ${WORKDIR}/tmp-mnt-boot || true
> -	cp -v ${IMAGE_ROOTFS}/boot/uImage ${WORKDIR}/tmp-mnt-boot || true
> -
>  	if [ -e ${IMAGE_ROOTFS}/boot/u-boot.$suffix ] ; then
> -		cp -v ${IMAGE_ROOTFS}/boot/{u-boot.$suffix} ${WORKDIR}/tmp-mnt-boot || true
> +		cp -v ${IMAGE_ROOTFS}/boot/u-boot.$suffix $TMP/boot || true
>  	else
> -		cp -v ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.$suffix ${WORKDIR}/tmp-mnt-boot/u-boot.$suffix 
> +		cp -v ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.$suffix $TMP/boot/u-boot.$suffix
> +	fi
> +
> +	if [ -e ${IMAGE_ROOTFS}/boot/uImage ]; then
> +		cp -v ${IMAGE_ROOTFS}/boot/uImage $TMP/boot || true
> +	else
> +		cp -v ${DEPLOY_DIR_IMAGE}/uImage-${MACHINE}.$suffix $TMP/boot/uImage
> +	fi
> +
> +	cp -v ${IMAGE_ROOTFS}/boot/uEnv.txt $TMP/boot || true
> +	cp -v ${IMAGE_ROOTFS}/boot/user.txt $TMP/boot || true
> +
> +	# Copy ubi used by flashing scripts
> +	if [ -e  ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ] ; then
> +		echo "Copying UBIFS image to file system"
> +		cp ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${IMAGE_ROOTFS}/boot/fs.ubi
>  	fi
>  
>  	if [ -n ${FATPAYLOAD} ] ; then
>  		echo "Copying payload into VFAT"
>  		for entry in ${FATPAYLOAD} ; do
>  				# add the || true to stop aborting on vfat issues like not supporting .~lock files
> -				cp -av ${IMAGE_ROOTFS}$entry ${WORKDIR}/tmp-mnt-boot || true
> +				cp -av ${IMAGE_ROOTFS}$entry $TMP/boot || true
>  		done
>  	fi
>  
> -	echo "${IMAGE_NAME}-${IMAGEDATESTAMP}" > ${IMAGE_ROOTFS}/etc/image-version-info
> -
> -	# Cleanup VFAT mount
> -	echo "Cleaning up VFAT mount"
> -	umount ${WORKDIR}/tmp-mnt-boot
> -	${LOSETUP} -d ${LOOPDEV_BOOT} || true
> -
> -	# Prepare rootfs parition
> -	echo "Creating rootfs loopback"
> -	${LOSETUP} ${LOOPDEV_FS} ${SDIMG} -o ${FS_OFFSET}
> -
> -	FS_NUM_INODES=$(echo $FS_SIZE_BLOCKS / 4 | bc)
> -
> -	case "${ROOTFSTYPE}" in
> -		ext3)
> -				genext2fs -z -N $FS_NUM_INODES -b $FS_SIZE_BLOCKS -d ${IMAGE_ROOTFS} ${LOOPDEV_FS}
> -				tune2fs -L ${IMAGE_NAME} -j ${LOOPDEV_FS}
> -				;;
> -		ext4)
> -				genext2fs -z -N $FS_NUM_INODES -b $FS_SIZE_BLOCKS -d ${IMAGE_ROOTFS} ${LOOPDEV_FS}
> -				tune2fs -L ${IMAGE_NAME} -j -O extents,uninit_bg,dir_index ${LOOPDEV_FS}
> -				;;
> -		*)
> -				echo "Please set ROOTFSTYPE to something supported"
> -				exit 1
> -				;;
> -	esac
> -
> -	${LOSETUP} -d ${LOOPDEV_FS} || true
> -
> -	gzip -c ${WORKDIR}/sd.img > ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}-${IMAGEDATESTAMP}.img.gz
> -	rm -f ${WORKDIR}/sd.img
> +	dd if=/dev/zero of=${SDIMG} bs=`expr 1000 \* 1000` count=${SDIMG_SIZE}
> +
> +	# Create the boot filesystem
> +	BOOT_OFFSET=32256
> +	BOOT_BLOCKS=`du -bks $TMP/boot | cut -f 1`
> +	BOOT_SIZE=`expr $BOOT_BLOCKS + ${BOOTDD_EXTRA_SPACE}`

Can you please replace backticks?


> +	mkfs.vfat -n ${BOOTDD_VOLUME_ID} -d $TMP/boot -C $TMP/boot.img $BOOT_SIZE
> +
> +	# Create partition table
> +	END1=`expr $BOOT_SIZE \* 1024`
> +	END2=`expr $END1 + 512`
> +	parted -s ${SDIMG} mklabel msdos
> +	parted -s ${SDIMG} mkpart primary fat16 ${BOOT_OFFSET}B ${END1}B
> +	parted -s ${SDIMG} mkpart primary ext3 ${END2}B 100%
> +	parted -s ${SDIMG} set 1 boot on
> +	parted ${SDIMG} print
> +
> +	OFFSET1=`expr $BOOT_OFFSET / 512`
> +	OFFSET2=`expr $END2 / 512`
> +	dd if=$TMP/boot.img of=${SDIMG} conv=notrunc seek=$OFFSET1 bs=512
> +	dd if=${ROOTFS} of=${SDIMG} conv=notrunc seek=$OFFSET2 bs=512
> +
> +	cd ${DEPLOY_DIR_IMAGE}
> +	ln -sf ${IMAGE_NAME}.sdimg ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.sdimg
>  }
> -- 
> 1.7.2.5
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

