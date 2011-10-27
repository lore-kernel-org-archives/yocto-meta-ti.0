Return-Path: <jkridner@beagleboard.org>
Received: from mail-gy0-f176.google.com (mail-gy0-f176.google.com
	[209.85.160.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 41F5CE006F9
	for <meta-ti@yoctoproject.org>; Thu, 27 Oct 2011 14:58:28 -0700 (PDT)
Received: by gyh3 with SMTP id 3so4096120gyh.35
	for <meta-ti@yoctoproject.org>; Thu, 27 Oct 2011 14:58:28 -0700 (PDT)
Received: by 10.150.239.17 with SMTP id m17mr190049ybh.110.1319752708331;
	Thu, 27 Oct 2011 14:58:28 -0700 (PDT)
Received: from mail-gx0-f176.google.com (mail-gx0-f176.google.com
	[209.85.161.176])
	by mx.google.com with ESMTPS id x3sm18604497anl.6.2011.10.27.14.58.27
	(version=SSLv3 cipher=OTHER); Thu, 27 Oct 2011 14:58:27 -0700 (PDT)
Received: by ggnr1 with SMTP id r1so4094224ggn.35
	for <meta-ti@yoctoproject.org>; Thu, 27 Oct 2011 14:58:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.236.152.2 with SMTP id c2mr20197329yhk.36.1319752706889; Thu,
	27 Oct 2011 14:58:26 -0700 (PDT)
Received: by 10.147.136.2 with HTTP; Thu, 27 Oct 2011 14:58:26 -0700 (PDT)
In-Reply-To: <20111027213912.GO15391@denix.org>
References: <1319679361-13741-1-git-send-email-jdk@ti.com>
	<20111027213912.GO15391@denix.org>
Date: Thu, 27 Oct 2011 17:58:26 -0400
Message-ID: <CA+T6QPnOubTg45SjEhWfG_B5fk+4Ywy3ow+O94dKx45G2Sk1Kg@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] sdcard_image: align partitions with flash pages
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
X-List-Received-Date: Thu, 27 Oct 2011 21:58:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 27, 2011 at 5:39 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Wed, Oct 26, 2011 at 09:36:01PM -0400, Jason Kridner wrote:
>> See
>> http://sakoman.com/OMAP/a-script-for-partitioningformatting-a-bootable-s=
dmicrosd-card.html
>
> If I was Paul Menzel, I'd complain about non-descriptive description :)

Fair enough.  I thought giving the URL was better than taking the
credit for the ideas, but I could have extracted the ideas for the
change as well.  Do you need me to resubmit?  I'm comfortable with you
adding comments into the commit.

Or should I apply an additional patch to put comments into the code?

>
> Here's what I gathered from the above URL, which just gives the new scrip=
t:
>
> # Modifications to align partitioning by Steve Sakoman
> # based on work by Arnd Bergmann
> # Align partitions for SD card performance/wear optimization
> # FAT partition size is 131072 sectors (64MB) less:
> # =A0 =A0 =A0 MBR - 1 sector
> # =A0 =A0 =A0 padding to align to the page size of the underlying flash -=
 127 sectors
> # so we start the first partition at sector 128 and make it 131072 - 128 =
=3D 130944 sectors
> # second partition starts at 131072 and continues to fill the card
>
> It would be nice to have that in the commit message just to explain the
> simingly random change of numbers below... :)
>
> BTW, Arnd Bergmann is the expert in SD card wear issues http://lwn.net/Ar=
ticles/428584/
> and, if I remember correctly, he was showing some tests abusing whole bun=
ch of
> SD cards at the last ELC.

Yeah, I sat down with Arnd and discussed it at ELC, which is why I
wanted to pick up the changes not only in mkcard as Steve did, but in
this class which is more convenient for people using OE to build SD
card images.

>
> --
> Denys
>
>> Signed-off-by: Jason Kridner <jdk@ti.com>
>> ---
>> =A0classes/sdcard_image.bbclass | =A0 =A06 +++---
>> =A01 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/classes/sdcard_image.bbclass b/classes/sdcard_image.bbclass
>> index 4ebc998..9e4a959 100644
>> --- a/classes/sdcard_image.bbclass
>> +++ b/classes/sdcard_image.bbclass
>> @@ -46,9 +46,9 @@ IMAGE_CMD_sdimg () {
>> =A0 =A0 =A0 SIZE=3D$(/sbin/fdisk -l ${LOOPDEV} | grep Disk | grep bytes =
| awk '{print $5}')
>> =A0 =A0 =A0 CYLINDERS=3D$(echo $SIZE/255/63/512 | bc)
>> =A0 =A0 =A0 {
>> - =A0 =A0 echo ,9,0x0C,*
>> - =A0 =A0 echo ,,,-
>> - =A0 =A0 } | /sbin/sfdisk -D -H 255 -S 63 -C ${CYLINDERS} ${LOOPDEV}
>> + =A0 =A0 echo 128,130944,0x0C,*
>> + =A0 =A0 echo 131072,,,-
>> + =A0 =A0 } | /sbin/sfdisk -D -uS -H 255 -S 63 -C ${CYLINDERS} ${LOOPDEV=
}
>>
>> =A0 =A0 =A0 # Prepare loop devices for boot and filesystem partitions
>> =A0 =A0 =A0 BOOT_OFFSET=3D32256
>> --
>> 1.7.4.1
>>
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti
>>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>

