Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 824D6E013E0
	for <meta-ti@yoctoproject.org>; Thu, 27 Oct 2011 14:39:24 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [96.240.135.93])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LTQ00ABXUTD6IS5@vms173005.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 27 Oct 2011 16:39:13 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id DF39914AF5D; Thu,
	27 Oct 2011 17:39:12 -0400 (EDT)
Date: Thu, 27 Oct 2011 17:39:12 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Jason Kridner <jdk@ti.com>
Message-id: <20111027213912.GO15391@denix.org>
References: <1319679361-13741-1-git-send-email-jdk@ti.com>
MIME-version: 1.0
In-reply-to: <1319679361-13741-1-git-send-email-jdk@ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] sdcard_image: align partitions with flash	pages
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
X-List-Received-Date: Thu, 27 Oct 2011 21:39:25 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Oct 26, 2011 at 09:36:01PM -0400, Jason Kridner wrote:
> See
> http://sakoman.com/OMAP/a-script-for-partitioningformatting-a-bootable-sdmicrosd-card.html

If I was Paul Menzel, I'd complain about non-descriptive description :)

Here's what I gathered from the above URL, which just gives the new script:

# Modifications to align partitioning by Steve Sakoman
# based on work by Arnd Bergmann
# Align partitions for SD card performance/wear optimization
# FAT partition size is 131072 sectors (64MB) less:
#	MBR - 1 sector
#       padding to align to the page size of the underlying flash - 127 sectors
# so we start the first partition at sector 128 and make it 131072 - 128 = 130944 sectors
# second partition starts at 131072 and continues to fill the card

It would be nice to have that in the commit message just to explain the 
simingly random change of numbers below... :)

BTW, Arnd Bergmann is the expert in SD card wear issues http://lwn.net/Articles/428584/
and, if I remember correctly, he was showing some tests abusing whole bunch of 
SD cards at the last ELC.

-- 
Denys

> Signed-off-by: Jason Kridner <jdk@ti.com>
> ---
>  classes/sdcard_image.bbclass |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/classes/sdcard_image.bbclass b/classes/sdcard_image.bbclass
> index 4ebc998..9e4a959 100644
> --- a/classes/sdcard_image.bbclass
> +++ b/classes/sdcard_image.bbclass
> @@ -46,9 +46,9 @@ IMAGE_CMD_sdimg () {
>  	SIZE=$(/sbin/fdisk -l ${LOOPDEV} | grep Disk | grep bytes | awk '{print $5}')
>  	CYLINDERS=$(echo $SIZE/255/63/512 | bc)
>  	{
> -	echo ,9,0x0C,*
> -	echo ,,,-
> -	} | /sbin/sfdisk -D -H 255 -S 63 -C ${CYLINDERS} ${LOOPDEV}
> +	echo 128,130944,0x0C,*
> +	echo 131072,,,-
> +	} | /sbin/sfdisk -D -uS -H 255 -S 63 -C ${CYLINDERS} ${LOOPDEV}
>  
>  	# Prepare loop devices for boot and filesystem partitions
>  	BOOT_OFFSET=32256
> -- 
> 1.7.4.1
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

