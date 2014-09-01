Return-Path: <diego.sueiro@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C8335E006B5; Mon,  1 Sep 2014 14:54:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (diego.sueiro[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.192.54 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 566ECE004F5
	for <meta-ti@yoctoproject.org>; Mon,  1 Sep 2014 14:53:58 -0700 (PDT)
Received: by mail-qg0-f54.google.com with SMTP id q107so5822497qgd.27
	for <meta-ti@yoctoproject.org>; Mon, 01 Sep 2014 14:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=B+Ow9ITyp7qfm+aiop+AZo0YtKJEU4HvT9KAvCm+hP4=;
	b=NTvLUt1vKw9/aDkKru9SaO8rclhSkEpK1CW3pN7s+LNHrPHQST+sPALYdG9d/XvYQG
	j0qyyGyspLbfBJHesB7dsfR5yo+vGCt4PhCUUw4gcBNYhLYgD0n/qk/MhX2bBPhCacZ0
	TPHNKwAoa0uH0jxXlaaFMtTJysHmF6oflbe++CopfxzzZs+niekvfQXxj3vL0zrse5WP
	rnVeiOI0LvqrxsCJ+d/Q7xAAAL9nmcfd2rJCiOFy2CcJzntnmN5Pga7PaxxVYoTQ8kyV
	bjNRLH/G9MHBzYipKK5j1+JakQb+O4Anixiw51lHrfqnM9r46rzbGGIYUVRS/In6BKsC
	wFwQ==
X-Received: by 10.224.86.5 with SMTP id q5mr50858746qal.36.1409608437848; Mon,
	01 Sep 2014 14:53:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.83 with HTTP; Mon, 1 Sep 2014 14:53:37 -0700 (PDT)
In-Reply-To: <5404E0A8.8030204@pabigot.com>
References: <5087658.bcI9hl3Jbj@localhost.localdomain>
	<5404E0A8.8030204@pabigot.com>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Mon, 1 Sep 2014 18:53:37 -0300
Message-ID: <CAMCfZKEqU=Ric8131BA=nrToyAWxaEbHs0e-3EzKAz6CQUrtNA@mail.gmail.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: BBB + uboot 2014.07 - not booting
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
X-List-Received-Date: Mon, 01 Sep 2014 21:54:03 -0000
Content-Type: multipart/alternative; boundary=001a11c2c17235e1180502080a74

--001a11c2c17235e1180502080a74
Content-Type: text/plain; charset=ISO-8859-1

Peter,

On Mon, Sep 1, 2014 at 6:10 PM, Peter A. Bigot <pab@pabigot.com> wrote:

> I am seeing the same behavior with an SD card with u-boot from current
> meta-ti master (MLO-beaglebone-2014.07-r1+gitrAUTOINC+8bd803d2c5)
>
> I partition the cards and create the boot/root partitions with:
>
> sudo dd if=/dev/zero of=${MMC} bs=1024 count=1024
> ( echo ,9,0x0C,* ; echo ,,,- ) \
>   | sudo sfdisk -D -H 255 -S 63 ${MMC}
>
> ${SUDO} mkfs.vfat -F 16 -n boot ${MMC}1
> ${SUDO} mkfs -t ${FSTYPE} -L rootfs ${MMC}2
>
> ${SUDO} cp -p MLO u-boot.img ${MPROOT}/boot
>
> This process works with poky master and yocto-bsp on beaglebone.
>
> I recall from long ago that some TI systems were picky about the
> partitioning of the boot media.
>

This is not true for recent Sitara SoCs:
http://permalink.gmane.org/gmane.comp.handhelds.openembedded/64088



> Would somebody with an SD card image that boots the current meta-ti master
> provide the output of fdisk -lu from it, or a pointer to instructions for
> doing the formatting?  For reference, what doesn't work is:
>
> llc[325]$ sudo fdisk -lu /dev/sdh
>
> Disk /dev/sdh: 7892 MB, 7892631552 bytes
> 255 heads, 63 sectors/track, 959 cylinders, total 15415296 sectors
> Units = sectors of 1 * 512 = 512 bytes
> Sector size (logical/physical): 512 bytes / 512 bytes
> I/O size (minimum/optimal): 512 bytes / 512 bytes
> Disk identifier: 0x00000000
>
>
>    Device Boot      Start         End      Blocks   Id  System
> /dev/sdh1   *          63      144584       72261    c  W95 FAT32 (LBA)
> /dev/sdh2          144585    15406334     7630875   83  Linux
>

I'm using the following partition layout (both working on eMMC and sdcard
with u-boot_2014.07.bb):

# fdisk -lu /dev/mmcblk0

Disk /dev/mmcblk0: 1920 MB, 1920991232 bytes, 3751936 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk label type: dos
Disk identifier: 0x00000000

        Device Boot      Start         End      Blocks   Id  System
/dev/mmcblk0p1   *          63       80324       40131    c  W95 FAT32 (LBA)
/dev/mmcblk0p2           80325     1558304      738990   83  Linux
/dev/mmcblk0p3         1558305     3036284      738990   83  Linux
/dev/mmcblk0p4         3036285     3743144      353430    5  Extended
/dev/mmcblk0p5         3036348     3068414       16033+  83  Linux
/dev/mmcblk0p6         3068478     3743144      337333+  83  Linux


With u-boot-ti-staging_2014.07.bb I just can boot from sdcard.
I'm using daisy branch, meta-linaro-toolchain with gcc 4.8.

Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br
<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

--001a11c2c17235e1180502080a74
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Peter,</div><div class=3D"gmail=
_extra"><br><div class=3D"gmail_quote">On Mon, Sep 1, 2014 at 6:10 PM, Pete=
r A. Bigot <span dir=3D"ltr">&lt;<a href=3D"mailto:pab@pabigot.com" target=
=3D"_blank">pab@pabigot.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div id=3D":2bw" class=3D"" style=3D"overflow:hidden">I am=
 seeing the same behavior with an SD card with u-boot from current meta-ti =
master (MLO-beaglebone-2014.07-r1+<u></u>gitrAUTOINC+8bd803d2c5)<br>


<br>
I partition the cards and create the boot/root partitions with:<br>
<br>
sudo dd if=3D/dev/zero of=3D${MMC} bs=3D1024 count=3D1024<br>
( echo ,9,0x0C,* ; echo ,,,- ) \<br>
=A0 | sudo sfdisk -D -H 255 -S 63 ${MMC}<br>
<br>
${SUDO} mkfs.vfat -F 16 -n boot ${MMC}1<br>
${SUDO} mkfs -t ${FSTYPE} -L rootfs ${MMC}2<br>
<br>
${SUDO} cp -p MLO u-boot.img ${MPROOT}/boot<br>
<br>
This process works with poky master and yocto-bsp on beaglebone.<br>
<br>
I recall from long ago that some TI systems were picky about the partitioni=
ng of the boot media.</div></blockquote><div><br></div><div>This is not tru=
e for recent Sitara SoCs:</div><div><a href=3D"http://permalink.gmane.org/g=
mane.comp.handhelds.openembedded/64088">http://permalink.gmane.org/gmane.co=
mp.handhelds.openembedded/64088</a><br>

</div><div><br></div><div>=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex"><div id=3D":2bw" class=
=3D"" style=3D"overflow:hidden">

Would somebody with an SD card image that boots the current meta-ti master =
provide the output of fdisk -lu from it, or a pointer to instructions for d=
oing the formatting?=A0 For reference, what doesn&#39;t work is:<br>
<br>
llc[325]$ sudo fdisk -lu /dev/sdh<br>
<br>
Disk /dev/sdh: 7892 MB, 7892631552 bytes<br>
255 <span class=3D"">heads</span>, 63 <span class=3D"">sectors</span>/track=
, 959 cylinders, total 15415296 <span class=3D"">sectors</span><br>
Units =3D <span class=3D"">sectors</span> of 1 * 512 =3D 512 bytes<br>
<span class=3D"">Sector</span> size (logical/physical): 512 bytes / 512 byt=
es<br>
I/O size (minimum/optimal): 512 bytes / 512 bytes<br>
Disk identifier: 0x00000000<div class=3D""><br>
<br>
=A0 =A0Device Boot=A0 =A0 =A0 Start=A0 =A0 =A0 =A0 =A0End=A0 =A0 =A0 Blocks=
=A0 =A0Id=A0 System<br></div>
/dev/sdh1=A0 =A0*=A0 =A0 =A0 =A0 =A0 63=A0 =A0 =A0 144584=A0 =A0 =A0 =A0722=
61=A0 =A0 c=A0 W95 FAT32 (LBA)<br>
/dev/sdh2=A0 =A0 =A0 =A0 =A0 144585=A0 =A0 15406334=A0 =A0 =A07630875=A0 =
=A083=A0 Linux<br></div></blockquote></div><br>I&#39;m using the following =
partition layout (both working on eMMC and sdcard with <a href=3D"http://u-=
boot_2014.07.bb">u-boot_2014.07.bb</a>):</div>

<div class=3D"gmail_extra"><br></div><blockquote style=3D"margin:0px 0px 0p=
x 40px;border:none;padding:0px"><div class=3D"gmail_extra"><div class=3D"gm=
ail_extra"># fdisk -lu /dev/mmcblk0</div></div><div class=3D"gmail_extra"><=
div class=3D"gmail_extra">

<br></div></div><div class=3D"gmail_extra"><div class=3D"gmail_extra">Disk =
/dev/mmcblk0: 1920 MB, 1920991232 bytes, 3751936 sectors</div></div><div cl=
ass=3D"gmail_extra"><div class=3D"gmail_extra">Units =3D sectors of 1 * 512=
 =3D 512 bytes</div>

</div><div class=3D"gmail_extra"><div class=3D"gmail_extra">Sector size (lo=
gical/physical): 512 bytes / 512 bytes</div></div><div class=3D"gmail_extra=
"><div class=3D"gmail_extra">I/O size (minimum/optimal): 512 bytes / 512 by=
tes</div>

</div><div class=3D"gmail_extra"><div class=3D"gmail_extra">Disk label type=
: dos</div></div><div class=3D"gmail_extra"><div class=3D"gmail_extra">Disk=
 identifier: 0x00000000</div></div><div class=3D"gmail_extra"><div class=3D=
"gmail_extra">

<br></div></div><div class=3D"gmail_extra"><div class=3D"gmail_extra">=A0 =
=A0 =A0 =A0 Device Boot =A0 =A0 =A0Start =A0 =A0 =A0 =A0 End =A0 =A0 =A0Blo=
cks =A0 Id =A0System</div></div><div class=3D"gmail_extra"><div class=3D"gm=
ail_extra">/dev/mmcblk0p1 =A0 * =A0 =A0 =A0 =A0 =A063 =A0 =A0 =A0 80324 =A0=
 =A0 =A0 40131 =A0 =A0c =A0W95 FAT32 (LBA)</div>

</div><div class=3D"gmail_extra"><div class=3D"gmail_extra">/dev/mmcblk0p2 =
=A0 =A0 =A0 =A0 =A0 80325 =A0 =A0 1558304 =A0 =A0 =A0738990 =A0 83 =A0Linux=
</div></div><div class=3D"gmail_extra"><div class=3D"gmail_extra">/dev/mmcb=
lk0p3 =A0 =A0 =A0 =A0 1558305 =A0 =A0 3036284 =A0 =A0 =A0738990 =A0 83 =A0L=
inux</div>

</div><div class=3D"gmail_extra"><div class=3D"gmail_extra">/dev/mmcblk0p4 =
=A0 =A0 =A0 =A0 3036285 =A0 =A0 3743144 =A0 =A0 =A0353430 =A0 =A05 =A0Exten=
ded</div></div><div class=3D"gmail_extra"><div class=3D"gmail_extra">/dev/m=
mcblk0p5 =A0 =A0 =A0 =A0 3036348 =A0 =A0 3068414 =A0 =A0 =A0 16033+ =A083 =
=A0Linux</div>

</div><div class=3D"gmail_extra"><div class=3D"gmail_extra">/dev/mmcblk0p6 =
=A0 =A0 =A0 =A0 3068478 =A0 =A0 3743144 =A0 =A0 =A0337333+ =A083 =A0Linux</=
div></div></blockquote><div class=3D"gmail_extra"><br clear=3D"all"><div><d=
iv dir=3D"ltr"><div>With=A0<a href=3D"http://u-boot-ti-staging_2014.07.bb">=
u-boot-ti-staging_2014.07.bb</a> I just can boot from sdcard.</div>

<div>I&#39;m using daisy branch, meta-linaro-toolchain with gcc 4.8.</div><=
div><br></div><div>Regards,</div><div><br></div>--<br>*dS<br>Diego Sueiro<b=
r><br>Administrador do Embarcados<br><a href=3D"http://www.embarcados.com.b=
r/?utm_source=3Dassinatura_diego&amp;utm_medium=3De-mail&amp;utm_campaign=
=3DAssinatura%20Email%20Diego" target=3D"_blank">www.embarcados.com.br</a><=
br>

<br>/*long live rock &#39;n roll*/<br></div></div>
</div></div>

--001a11c2c17235e1180502080a74--
